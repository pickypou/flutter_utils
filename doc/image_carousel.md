# Image Carousel

`ImageCarousel` provides an easy way to display a swipeable list of images (either from the network or local assets). It includes advanced features such as individual image cropping via `CropConfig`.

## Features
- Support for auto-playing.
- Configurable viewport fractions.
- Individual image cropping (width/height factors and alignment).

## Usage

```dart
import 'package:flutter_utils/flutter_utils.dart';

ImageCarousel(
  imageUrl: const [
    'https://picsum.photos/id/1015/800/600',
    'https://picsum.photos/id/1016/800/600',
    'https://picsum.photos/id/1018/800/600',
  ],
  height: 250,
  fraction: 0.8, // Viewport fraction
  autoPlay: true,
  isFromAssets: false,
  
  // Optional: Apply specific cropping to specific images by their index
  cropConfigs: const [
    CropConfig(
      index: 1, // Only affects the second image
      widthFactor: 0.5,
      heightFactor: 0.5,
      alignment: Alignment.bottomRight, 
    ),
  ],
)
```

## CropConfig Details
- `index`: The index of the image in the list to apply the crop to.
- `widthFactor` & `heightFactor`: Values between 0.0 and 1.0 representing the percentage of the image to keep.
- `alignment`: Which part of the image to focus on when cropping (e.g., `Alignment.center`, `Alignment.topLeft`).
