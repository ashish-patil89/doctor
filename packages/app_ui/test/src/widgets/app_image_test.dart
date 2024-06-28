import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppImage', () {
    group('replaceThumbnailDimension', () {
      test(
          'returns the correct URL '
          'for thumbnail dimension 128', () {
        const thumbnailDimension = ThumbnailDimension.dimension128;

        const imageUrl =
            'https://media.orb.ac/thumbnailDimension1180/https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf';

        const expectedImageUrl =
            'https://media.orb.ac/thumbnailDimension128/https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf';

        final result = replaceThumbnailDimension(imageUrl, thumbnailDimension);
        expect(result, expectedImageUrl);
      });

      test(
          'returns the correct URL '
          'for thumbnail dimension 256', () {
        const thumbnailDimension = ThumbnailDimension.dimension256;

        const imageUrl =
            'https://media.orb.ac/thumbnailDimension128/https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf';

        const expectedImageUrl =
            'https://media.orb.ac/thumbnailDimension256/https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf';

        final result = replaceThumbnailDimension(imageUrl, thumbnailDimension);
        expect(result, expectedImageUrl);
      });

      test(
          'returns the correct URL '
          'for thumbnail dimension 768', () {
        const thumbnailDimension = ThumbnailDimension.dimension768;

        const imageUrl =
            'https://media.orb.ac/thumbnailDimension256/https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf';

        const expectedImageUrl =
            'https://media.orb.ac/thumbnailDimension768/https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf';

        final result = replaceThumbnailDimension(imageUrl, thumbnailDimension);
        expect(result, expectedImageUrl);
      });

      test(
          'returns the correct URL '
          'for thumbnail dimension 1180', () {
        const thumbnailDimension = ThumbnailDimension.dimension1180;

        const imageUrl =
            'https://media.orb.ac/thumbnailDimension768/https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf';

        const expectedImageUrl =
            'https://media.orb.ac/thumbnailDimension1180/https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf';

        final result = replaceThumbnailDimension(imageUrl, thumbnailDimension);
        expect(result, expectedImageUrl);
      });

      test('should not replace the thumbnail dimension if it is not found', () {
        const thumbnailDimension = ThumbnailDimension.dimension1180;

        const imageUrl =
            'https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf';

        final result = replaceThumbnailDimension(imageUrl, thumbnailDimension);
        expect(result, imageUrl);
      });
    });

    group('getThumbnailDimension', () {
      test(
          'returns correct thumbnail dimensions '
          'for sizes smaller than 42', () {
        const sizes = <double>[10, 20, 30, 40, 42];
        for (final size in sizes) {
          final result = getThumbnailDimension(size);
          expect(result, ThumbnailDimension.dimension128);
        }
      });

      test(
          'returns correct thumbnail dimensions '
          'for sizes between 43 and 85', () {
        const sizes = <double>[43, 50, 60, 70, 80, 85];
        for (final size in sizes) {
          final result = getThumbnailDimension(size);
          expect(result, ThumbnailDimension.dimension256);
        }
      });

      test(
          'returns correct thumbnail dimensions '
          'for sizes between 86 and 256', () {
        const sizes = <double>[86, 100, 150, 200, 250, 256];
        for (final size in sizes) {
          final result = getThumbnailDimension(size);
          expect(result, ThumbnailDimension.dimension768);
        }
      });

      test(
          'returns correct thumbnail dimensions '
          'for sizes larger than 256', () {
        const sizes = <double>[257, 300, 400, 500, 600, 700, 800, 900, 1000];
        for (final size in sizes) {
          final result = getThumbnailDimension(size);
          expect(result, ThumbnailDimension.dimension1180);
        }
      });
    });
  });
}
