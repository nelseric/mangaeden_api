require_relative '../../spec_helper'

describe MangaedenApi::Mangaeden do
  
  before do
    VCR.insert_cassette 'manga', record: :new_episodes
  end
  
  after do
    VCR.eject_cassette
  end
  
  describe ".search" do
    
    let(:mangas) { MangaedenApi::Manga::search('Naruto') }
    let(:downcase_mangas) { MangaedenApi::Manga::search('naruto') }
    
    it "should return an array of Manga objects" do
      expect(mangas).to be_instance_of(Array)
      mangas.each do |m|
        expect(m).to be_instance_of(MangaedenApi::Manga)
      end
    end
    
    it "should perform a case-insensitive search" do
      expect(mangas.count).to eq(downcase_mangas.count)
      mangas.each_with_index do |manga, i|
        expect(manga.manga_id).to eq(downcase_mangas[i].manga_id)
        expect(manga.aka).to eq(downcase_mangas[i].aka)
        expect(manga.aka_alias).to eq(downcase_mangas[i].aka_alias)
        expect(manga.alias).to eq(downcase_mangas[i].alias)
        expect(manga.artist).to eq(downcase_mangas[i].artist)
        expect(manga.artist_kw).to eq(downcase_mangas[i].artist_kw)
        expect(manga.author).to eq(downcase_mangas[i].author)
        expect(manga.author_kw).to eq(downcase_mangas[i].author_kw)
        expect(manga.categories).to eq(downcase_mangas[i].categories)
        expect(manga.chapters_info).to eq(downcase_mangas[i].chapters_info)
        expect(manga.chapters_len).to eq(downcase_mangas[i].chapters_len)
        expect(manga.created).to eq(downcase_mangas[i].created)
        expect(manga.description).to eq(downcase_mangas[i].description)
        expect(manga.image).to eq(downcase_mangas[i].image)
        expect(manga.language).to eq(downcase_mangas[i].language)
        expect(manga.last_chapter_date).to eq(downcase_mangas[i].last_chapter_date)
        expect(manga.released).to eq(downcase_mangas[i].released)
        expect(manga.startsWith).to eq(downcase_mangas[i].startsWith)
        expect(manga.status).to eq(downcase_mangas[i].status)
        expect(manga.title).to eq(downcase_mangas[i].title)
        expect(manga.title_kw).to eq(downcase_mangas[i].title_kw)
        expect(manga.type).to eq(downcase_mangas[i].type)
        expect(manga.updatedKeywords).to eq(downcase_mangas[i].updatedKeywords)
      end
    end
    
    it "should return a list of Manga with the same title I searched" do
      mangas.each do |m|
        expect(m.title.downcase).to eq('Naruto'.downcase)
      end
    end
    
  end
  
  describe ".chapters" do
    
    let(:manga) { MangaedenApi::Mangaeden::get_manga_info('4e70e9f6c092255ef7004336') }
    let(:chapters) { manga.chapters }
    
    it "should return an array of Chapter objects" do
      expect(chapters).to be_instance_of(Array)
      chapters.each do |c|
        expect(c).to be_instance_of(MangaedenApi::Chapter)
      end
    end
    
  end
  
end