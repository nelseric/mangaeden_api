require_relative '../../spec_helper'

describe MangaedenApi::Mangaeden do
  before do
    VCR.insert_cassette 'mangas', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  describe '.get_manga_list' do
    let(:en_mangas) { MangaedenApi::Mangaeden::get_manga_list }
    let(:it_mangas) { MangaedenApi::Mangaeden::get_manga_list('it') }
    let(:paginated_mangas) { MangaedenApi::Mangaeden::get_manga_list('en', 1) }
    let(:limited_paginated_mangas) { MangaedenApi::Mangaeden::get_manga_list('en', 1, 30) }

    it 'should return the entire english list of manga' do
      expect(en_mangas).to be_instance_of(Array)
      expect(en_mangas.count).to be > 0
      expect(en_mangas[0]).to have_key('im')
      expect(en_mangas[0]).to have_key('t')
      expect(en_mangas[0]).to have_key('i')
      expect(en_mangas[0]).to have_key('a')
      expect(en_mangas[0]).to have_key('s')
      expect(en_mangas[0]).to have_key('ld')
      expect(en_mangas[0]).to have_key('h')
    end

    it 'should return the entire italian list of manga' do
      expect(it_mangas).to be_instance_of(Array)
      expect(it_mangas.count).to be > 0
      expect(it_mangas[0]).to have_key('im')
      expect(it_mangas[0]).to have_key('t')
      expect(it_mangas[0]).to have_key('i')
      expect(it_mangas[0]).to have_key('a')
      expect(it_mangas[0]).to have_key('s')
      expect(it_mangas[0]).to have_key('ld')
      expect(it_mangas[0]).to have_key('h')
    end

    it 'should return a paginated list of manga' do
      expect(paginated_mangas.count).to eq(500)
    end

    it 'should return a limited paginated list of manga' do
      expect(limited_paginated_mangas.count).to eq(30)
    end
  end

  describe '.get_manga_info' do
    let(:manga) { MangaedenApi::Mangaeden::get_manga_info('4e70e9f6c092255ef7004336') }

    it 'should return a Manga' do
      expect(manga).to be_instance_of(MangaedenApi::Manga)
    end

    it 'should return all the informations about the manga with the searched ID' do
      expect(manga.manga_id).to eq('4e70e9f6c092255ef7004336')
      expect(manga.aka).to eq(Array.new)
      expect(manga.aka_alias).to eq(Array.new)
      expect(manga.alias).to eq('airindream')
      expect(manga.artist).to eq('')
      expect(manga.artist_kw).to eq(Array.new)
      expect(manga.author).to eq('')
      expect(manga.author_kw).to eq(Array.new)
      expect(manga.categories).to eq(['Comedy', 'Drama', 'Action'])
      expect(manga.chapters_info).to eq([
        [5, 1_275_542_373.0, '5', '4e711cb0c09225616d037cc2'],
        [4, 1_275_542_373.0, '4', '4e711cb1c09225616d037ce4'],
        [3, 1_275_542_373.0, '3', '4e711cacc09225616d037c72'],
        [2, 1_275_542_373.0, '2', '4e711cb3c09225616d037d05'],
        [1, 1_275_542_373.0, '1', '4e711caec09225616d037ca0']
      ])
      expect(manga.chapters_len).to eq(5)
      expect(manga.created).to eq(1_316_022_774.0)
      expect(manga.description).to eq('There is fighting at the high school due to a power struggle for control. The granddaughter of the chief director requests help from the Airin Dreamdo fighting style genius. Will he help? Or will he show his true colors with his bad boy ways?')
      expect(manga.hits).to eq(18_388)
      expect(manga.image).to eq(MangaedenApi::IMAGE_HOST + '88/88482f39e126a59bcac77a1df273fae30a9af811fc16cb08f4910cc5.jpg')
      expect(manga.language).to eq(0)
      expect(manga.last_chapter_date).to eq(1_275_542_373.0)
      expect(manga.released).to eq(nil)
      expect(manga.starts_with).to eq('a')
      expect(manga.status).to eq(1)
      expect(manga.title).to eq('Airindream')
      expect(manga.title_kw).to eq(['airindream'])
      expect(manga.type).to eq(0)
      expect(manga.updated_keywords).to eq(true)
    end
  end
end
