#! /usr/local/bin/ruby -w
require 'RMagick'
require 'date'
require 'time'
include Magick


# img = ImageList.new("fitbit.jpg")
# img.annotate
# exit




# Demonstrate the annotate method


days_left = ((Date.new(2015,3,12).to_time.to_i - Time.now.to_i) / 60 / 60 / 24).to_s
animated = Magick::ImageList.new()
blurimated = Magick::ImageList.new()
Dir.glob(File.join('img','*.png')).each do |file|
  # animated.read(file)
end

# Dir.glob(File.join('img','*.png')).each do |file|
#   animated.read(file)
# end
# the_text = '_D_ days to release'.gsub('_D_',days_left)
# Dir.glob(File.join('img','*.png'))
# animated.inspect
animated.background_color= 'white'
animated.delay=180
animated.write('phones.gif')
# animated.average
# animated.display
exit
# text = Magick::Draw.new
# text.font_family = 'helvetica'
# text.pointsize = 72
# text.gravity = Magick::CenterGravity
# text.annotate(source, 0,0,0,0, the_text) {
#   self.fill = 'darkred'
# }

# source.write('texted.jpg')
# source.display
# exit
