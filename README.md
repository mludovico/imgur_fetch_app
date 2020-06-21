# imgurfetchapp

App that fetches images with cats in imgur and displays in a grid.

## Details

This app uses the imgur api (https://api.imgur.com) to search for cat images.
The fetched image's URL is then used to display the images in a Flutter GridView which is equivalent to iOS UICollectionView.

Some filtering is applied to assure that only jpeg images are shwon and there is no invalid data among the urls list.
An effect is used to present each image with a fade in.
