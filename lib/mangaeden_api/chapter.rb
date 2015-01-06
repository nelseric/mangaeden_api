module MangaedenApi
  class Chapter
    
    # images is a Hash where the keys are the image number and the values are
    # the image path
    attr_accessor :chapter_id, :chapter_number, :chapter_title, :images
    
    def initialize(images, chapter_info)
      @chapter_id = chapter_info[3]
      @chapter_title = chapter_info[2]
      @chapter_number = chapter_info[0]
      @images = Array.new
      images.each do |i|
        @images << { i[0] => "#{MangaedenApi::IMAGE_HOST}#{i[1]}" }
      end
    end
    
  end
end
