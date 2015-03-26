require 'RMagick'
require_relative 'blur_errors'

module MagickTools
  include Magick
 
  class BlurredImage
    attr_accessor :delay
    attr_accessor :coef
    attr_accessor :radius
    attr_accessor :images
    attr_accessor :blur_steps
    attr_accessor :source

    @images = []
    RADIUS = 2
    COEF = 3
    BLUR_STEPS = 20
    DELAY = 50
    # REPEAT_LAST = 10


    def initialize(image,blur_options={})


      # if blur_options
      #todo: deflate this instead of assigning manually
      @radius = blur_options[:radius] || RADIUS
      @coef = blur_options[:coef] ||COEF
      @blur_steps = blur_options[:steps] || BLUR_STEPS
      @delay = blur_options[:delay] || DELAY
      # end

      @source = image
      @images = ImageList.new() {}
      @images.delay = @delay
      @images.iterations = 0

      return self

    end


    def blur_it

      (1..@blur_steps).to_a.reverse.each do |i|
        # puts i 
        step_radius = (i / @radius)
        # puts step_radius
        bl = Image.read(@source).first
        bl = bl.gaussian_blur( step_radius ,  @coef )
        @images.push( bl )
      end
      
      # REPEAT_LAST.times do 
        last_img = Image.read(@source).first
        last_img.delay = 3000
        @images.push(last_img)
      # end

      return self

    end

    def display

      if @images.length == 0
        raise EmptyError.new('nothing to show. run blur_it first')
      end

      @images.display
      return self
    end

    def write(filename)
      if @images.length == 0
        raise EmptyError.new('nothing to write. run blur_it first')
      end
      #must be gif
      if (/\.gif$/ =~ filename).nil?
        raise FiletypeError.new('filetype must be gif')
      end

      @images.write(filename)
      return self
    end

  end


end
