== Image optimization Guidelines

1. Download source image from salesforce
2. Open it in a real image editing tool
	- Adobe Photoshop is a the default tool
	- [Sumopaint will do if Photoshop is not available](http://www.sumopaint.com)

3. A: In photoshop -> "Save for Web", AltGR+S (or Ctrl +Alt+S)

	- Photos:, 
		- choose JPEG, increase the compression rate
		until you see the quality become too poor. Then, decrease it until you don't see any compression artecacts. Then, increase it again to the point where you have the smallest possible file size without 
		visible compression artefacts.

		- Alternatively, Choose PNG if quality requirements are critical. Make sure file size does not exceed 150kb for images smaller than 300px and 500kb for larger images.

	- Graphics:
		- GIF: Reduce colours. Rule of thumb: 128 colors for complex images, 32-64 for simple. Notice that sometimes the image does not even contain that many colors. Look at the color palette. If it contains less than 32 colors, type that color amount to the field instead. Leave transparency on, even if the image does not have any transparent pixels. This decreases the file size in most cases.
		
		- PNG8: 




3. B: In Sumopaint

