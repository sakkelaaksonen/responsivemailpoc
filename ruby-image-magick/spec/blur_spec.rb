require 'blurred_image'
require 'RMagick'
include Magick
RSpec.describe BlurredImage , "#initialize" do
  
  context 'start new image' do 
    
    it 'sets all parameters' do 
      b = BlurredImage.new('foo.jpg')
      expect( b.source ).to eq 'foo.jpg'
      expect( b.delay).to eq BlurredImage::DELAY
      expect( b.blur_steps).to eq BlurredImage::BLUR_STEPS
      expect( b.coef).to eq BlurredImage::COEF
      expect( b.radius).to eq BlurredImage::RADIUS


    end

    # it 'creates new imagelist object' do
    
    # end

    # it 'returns self' do 

    # end

  end

end

