#! /usr/local/bin/ruby -w
require 'RMagick'
require 'date'
require 'time'
include Magick


# img = ImageList.new("fitbit.jpg")
# img.annotate
# exit




# Demonstrate the annotate method


# days_left = ((Date.new(2015,3,12).to_time.to_i - Time.now.to_i) / 60 / 60 / 24).to_s
animated = Magick::ImageList.new()

Dir.glob(File.join('img','*.png')).each do |file|
  animated.read(file)
end

animated.length



