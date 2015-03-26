require 'RMagick'
require_relative 'lib/magick_tools'
include Magick
include MagickTools

# # img/Lumia-640-xl-4g-white-catalogue-png.png
# # img/530-green-png.png
# # img/Lumia-435-catalogue-orange-png.png
# # img/535-black-png.png
# # img/Lumia-640-4g-catalogue-cyan-png.p
files = Dir.glob(File.join('img','*.png'))
images = {}
colors = %w{white green orange black cyan}

c2 = colors.dup
files.each do |file|
	images[c2.shift] = BlurredImage.new(file)
end


blurred = images.values.map(&:blur_it)
puts blurred
colors.each do |color|
	puts "#{color}.gif"
	blurred.shift.write("#{color}.gif")
end
# blurred.inspect
	

