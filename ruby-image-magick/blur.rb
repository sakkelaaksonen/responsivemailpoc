#! /usr/local/bin/ruby -w
require 'RMagick'
require 'date'
require 'time'
include Magick


# animated = Magick::ImageList.new()
blurred = Magick::ImageList.new()

files = Dir.glob(File.join('img','*.png'))

10.times do |a|
  blurred.read(files[0])
end

# Dir.glob(File.join('img','*.png'))
# animated.inspect
animated.background_color= 'white'
animated.delay=180
animated.write('phones.gif')
