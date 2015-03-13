require 'blurred_image'
require 'RMagick'
include Magick

TEST_FILE ='./spec/test.png'

RSpec.describe BlurredImage  do

  context 'initialize new image' do

    it 'sets all parameters' do
      b = BlurredImage.new(TEST_FILE)
      expect( b.source ).to eq TEST_FILE
      expect( b.delay).to eq BlurredImage::DELAY
      expect( b.blur_steps).to eq BlurredImage::BLUR_STEPS
      expect( b.coef).to eq BlurredImage::COEF
      expect( b.radius).to eq BlurredImage::RADIUS
    end
  end


  context 'blur_it populates ImageList ' do
    it 'should have images equal to blur_steps' do
      b = BlurredImage.new(TEST_FILE)
      b.blur_it
      expect(b.images.length).to eq(b.blur_steps)

    end

    it 'should return self' do
      b = BlurredImage.new(TEST_FILE)
      expect(b.blur_it).to eq(b)
    end

  end


  context 'display' do
    
    it 'should raise error if blur_it is not run yet' do
      b = BlurredImage.new(TEST_FILE)
      expect(b.display ).to raise_error(EmptyError,'nothing to show. run blur_it first')
    end
    #dont know how to test this really...
    it 'should return self' do
      b = BlurredImage.new(TEST_FILE)
      b.blur_it
      expect(b.display).to eq(b)
    end
  end

  # context 'write to file' do

  #   it 'raise error if filename is not *.gif' do
  #     b = BlurredImage.new(TEST_FILE)
  #     b.blur_it
  #     expect(b.write('specced.aa')).to  raise_error(StandardError)
  #   end

  #   it 'raise error blur_it has not been run' do
  #     b = BlurredImage.new(TEST_FILE)
  #     expect(b.write('specced.gif')).to  raise_error(StandardError)
  #   end

  #   it 'should return self' do
  #     b = BlurredImage.new(TEST_FILE)
  #     b.blur_it
  #     expect(b.write('specced.gif')).to eq(b)
  #   end

  # end

end
