require 'json'
require 'uri'
require 'net/http'

module MangaedenApi
  # Class responsible for every Mangaeden.com API call.
  class Mangaeden
    # Return an array containing all mangas
    #
    # URL: https://www.mangaeden.com/api/list/[language]/
    # Where [language] can be 0 (English) or 1 (Italian)
    # Returned data:
    #       - dictionaries in the key "manga" contains the manga's image ("im"),
    #         title ("t"), ID ("i"), alias ("a"), status ("s"), last chapter
    #         date ("ld"), hits ("h")
    #       - "page", "start", "end" and "total" are self explanatory
    #
    # Manga List splitted in pages
    # URL: https://www.mangaeden.com/api/list/[language]/?p=X
    # Same as above but returns only 500 manga's informations
    # (from manga X*500 to (X+1)*500, where X is the page fetched from the
    # GET parameter 'p')
    #
    # Manga List splitted in pages with variable page size
    # URL: https://www.mangaeden.com/api/list/[language]/?p=X&l=Y
    # Same as above but returns only Y manga's informations
    # (from manga X*Y to (X+1)*Y) [25 < Y < 1500]
    def self.get_manga_list(language = 'en', page = nil, page_size = nil)
      # case language
      # when 'en'
      #   language_code = 0
      # when 'it'
      #   language_code = 1
      # else
      #   language_code = 0
      # end

      language_code = 0
      language_code = 1 if language == 'it'

      url = MangaedenApi::API_HOST + "/list/#{language_code}/"

      if page
        url = "#{url}?p=#{page}"
        url = "#{url}&l=#{page_size}" if page_size
      end

      uri = URI.parse(url)
      mangas = JSON.parse(Net::HTTP.get(uri))
      mangas['manga']
    end

    # Return an array of manga objetcs.
    #
    # URL: https://www.mangaeden.com/api/manga/[manga.id]/
    # Example: https://www.mangaeden.com/api/manga/4e70e9f6c092255ef7004336/
    # Where [manga.id] is the manga's id you can get with the Manga::list api
    # call
    # Returned data: all the informations and chapters of the manga.
    def self.get_manga_info(manga_id)
      url = MangaedenApi::API_HOST + "manga/#{manga_id}/"
      uri = URI.parse(url)
      manga_info = JSON.parse(Net::HTTP.get(uri))
      MangaedenApi::Manga.new(manga_info, manga_id)
    end

    # Return an array of chapter objects.
    # Use the "chapters" value returned from get_manga_info call as input.
    #
    # URL: https://www.mangaeden.com/api/chapter/[chapter.id]/
    # Example: https://www.mangaeden.com/api/chapter/4e711cb0c09225616d037cc2/
    # Where [chapter.id] is the chapter's id you can get with the previous api
    # call.
    # Returned data: the images's urls and sizes of the chapter
    def self.get_chapter_images(chapter_info)
      url = MangaedenApi::API_HOST + "chapter/#{chapter_info[3]}/"
      uri = URI.parse(url)
      images = JSON.parse(Net::HTTP.get(uri))
      MangaedenApi::Chapter.new(images, chapter_info)
    end
  end
end
