require 'RMagick'
require_relative 'lib/blurred_image'
include Magick

BlurredImage.inspect

# # img/Lumia-640-xl-4g-white-catalogue-png.png
# # img/530-green-png.png
# # img/Lumia-435-catalogue-orange-png.png
# # img/535-black-png.png
# # img/Lumia-640-4g-catalogue-cyan-png.p
# files = Dir.glob(File.join('img','*.png'))
# images = {}
# colors = %w{white green orange black cyan}

# files.each do |file|
# 	images[colors.shift] = BlurredImage.new(file)
# end
# puts images