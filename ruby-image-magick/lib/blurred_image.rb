#! /usr/local/bin/ruby -w
require 'RMagick'
require 'date'
require 'time'
include Magick

# module BlurTools

  class BlurredImage

    attr_accessor :delay
    attr_accessor :coef
    attr_accessor :radius
    attr_accessor :images
    attr_accessor :blur_steps
    attr_accessor :source
    
    @images = []
    RADIUS = 3
    COEF = 3
    BLUR_STEPS = 8
    DELAY = 100

    def initialize(image,blur_options={})


      # if blur_options
        #todo: deflate this instead of assigning manually
      @radius = blur_options[:radius] || RADIUS
      @coef = blur_options[:coef] ||COEF
      @blur_steps = blur_options[:steps] || BLUR_STEPS
      @delay = blur_options[:delay] || DELAY
      # end
      
      @source = image
      @images =  Magick::ImageList.new()
      @images.delay = @delay
      
      return self

    end


    def blur_it

      @blur_steps.times do |i|
        step_radius = (i / @radius)
        bl = Magick::Image.read(@source).first
        bl = bl.gaussian_blur(step_radius,  @coef)
        @images.push(bl)
      end

      return self

    end

    def display
      @images.display
      return self
    end

    def write(filename)
      @images.write(filename)
      return self
    end

  end

# end

# files = Dir.glob(File.join('img','*.png'))

# cyan = BlurredImage.new(files.shift)
# green = BlurredImage.new(files.shift)


# cyan.blur_it.write('cyan.gif')



# def blur_it(img,opts={radius: 3, coef: 3})
#   img.bl.gaussian_blur
# end

# blurred = Magick::ImageList.new()
# files = Dir.glob(File.join('img','*.png'))
# blue = files[0]
# blurred = Magick::ImageList.new()

# # (1..10).to_a.reverse.each do |a|
# #   puts a
# #   bl = Magick::Image.read(files[0]).first
# #   bl = bl.gaussian_blur(a,  3)
# #   blurred.push(bl)
# # end

# bl = Magick::Image.read(blue).first
# bl = bl.gaussian_blur(3,  3)
# blurred.push(bl)


# bl = Magick::Image.read(blue).first
# bl = bl.gaussian_blur(2,  3)
# blurred.push(bl)

# bl = Magick::Image.read(blue).first
# bl = bl.gaussian_blur(1,  3)
# blurred.push(bl)

# blurred.delay = 80
# blurred.iterations = 0
# # blurred.display

# blurred.write('blur.gif')

# exit
# # blurred.read(files[0]) {}
# # end
