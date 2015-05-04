module MangaedenApi
  # Class containing all manga informations.
  class Manga
    attr_accessor :aka, :aka_alias, :alias, :artist, :artist_kw, :author,
                  :author_kw, :categories, :chapters_len, :chapters_info,
                  :created, :description, :hits, :image, :language,
                  :last_chapter_date, :random, :released, :starts_with, :status,
                  :title, :title_kw, :type, :updated_keywords, :manga_id

    def initialize(manga_info, manga_id = nil)
      @manga_id = manga_id
      @aka = manga_info['aka']
      @aka_alias = manga_info['aka-alias']
      @alias = manga_info['alias']
      @artist = manga_info['artist']
      @artist_kw = manga_info['artist_kw']
      @author = manga_info['author']
      @author_kw = manga_info['author_kw']
      @categories = manga_info['categories']
      @chapters_len = manga_info['chapters_len']
      @chapters_info = manga_info['chapters']
      @created = manga_info['created']
      @description = manga_info['description']
      @hits = manga_info['hits']
      @image = MangaedenApi::IMAGE_HOST + manga_info['image']
      @language = manga_info['language']
      @last_chapter_date = manga_info['last_chapter_date']
      @random = manga_info['random']
      @released = manga_info['release']
      @starts_with = manga_info['startsWith']
      @status = manga_info['status']
      @title = manga_info['title']
      @title_kw = manga_info['title_kw']
      @type = manga_info['type']
      @updated_keywords = manga_info['updatedKeywords']
    end

    # Search for mangas with the specified title (case-insensitive) and return
    # an array of manga objects
    def self.search(title, language = 'en')
      manga_list = MangaedenApi::Mangaeden.get_manga_list(language).select do |m|
        m['t'].downcase == title.downcase
      end
      mangas = []
      manga_list.each do |m|
        mangas << MangaedenApi::Mangaeden.get_manga_info(m['i'])
      end
      mangas
    end

    # Return Chapter objects
    def chapters
      chapters = []
      @chapters_info.each do |c|
        chapters << MangaedenApi::Mangaeden.get_chapter_images(c)
      end
      chapters
    end
  end
end
