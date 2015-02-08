# MangaedenApi

[![GitHub version](https://badge.fury.io/gh/lucaferri%2Fmangaeden_api.svg)](http://badge.fury.io/gh/lucaferri%2Fmangaeden_api)
[![Build Status](https://travis-ci.org/lucaferri/mangaeden_api.svg?branch=master)](https://travis-ci.org/lucaferri/mangaeden_api)
[![Code Climate](https://codeclimate.com/github/lucaferri/mangaeden_api/badges/gpa.svg)](https://codeclimate.com/github/lucaferri/mangaeden_api)
[![Coverage Status](https://img.shields.io/coveralls/lucaferri/mangaeden_api.svg)](https://coveralls.io/r/lucaferri/mangaeden_api)
[![Inline docs](http://inch-ci.org/github/lucaferri/mangaeden_api.svg?branch=master&style=flat)](http://inch-ci.org/github/lucaferri/mangaeden_api)

Ruby wrapper for [mangaeden.com](http://mangaeden.com/).

## Installation

Add this line to your application's Gemfile:

	gem 'mangaeden_api', '~> 0.1.1'

And then execute:

	$ bundle

Or install it yourself as:

    gem install mangaeden_api

## Usage

### Get a list of all available mangas
	Mangaeden::Mangaeden.get_manga_list('en')
The argument is the language. Mangaeden supports *'en'* for English and *'it'* for Italian.  
This function returns an Array with all the informations about available mangas.

### Get info about a specific manga
	Mangaeden::Mangaeden.get_manga_info('4e70e9f6c092255ef7004336')
The argument is the manga's id you can get from the previous function.  
It returns a *Manga* object containing all the informations about the searched manga.

### Manga class
This class has an attribute for every information returned from the API: *aka*, *aka_alias*, *alias*, *artist*, *artist_kw*, *author*, *author_kw*, *categories*, *chapters_len*, *chapters_info*, *created*, *description*, *hits*, *image*, *language*, *last_chapter_date*, *random*, *released*, *starts_with*, *status*, *title*, *title_kw*, *type*, *updated_keywords*, *manga_id*.  

You can also search a manga by title using  

	Mangaeden::Manga.search('Hokuto no Ken')  
*For now it only search in English.*  

*Manga* objects contain all informations about all chapters and they can be retrieved using *chapters* method.  
It returns an Array of *Chapter* objects, each one containing the *title*, the *chapter_number* and a list of all *image urls*.

## TODO
* Improve *MangaedenApi::Manga.search* method to let user choose the language.
* Implement Api calls for
	* *login*
	* *logout*
	* *mymanga*

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This gem is released under the [MIT License](http://www.opensource.org/licenses/MIT).
Copyright 2015 Luca Ferri.
