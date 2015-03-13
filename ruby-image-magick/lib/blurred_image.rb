#! /usr/local/bin/ruby -w
require 'RMagick'
require 'date'
require 'time'
include Magick

# module BlurTools
class EmptyError < StandardError 
end

class FiletypeError < StandardError 
end

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