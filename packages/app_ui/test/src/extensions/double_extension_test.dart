// ignore_for_file: avoid_redundant_argument_values

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('truncateToDecimalPlaces', () {
    group('en_US (US)', () {
      test('returns 40.99 for 40.999456', () {
        expect(
          40.999456.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('40.99'),
        );
      });

      test('returns 47,890.99 for 47890.999456', () {
        expect(
          47890.999456.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('47,890.99'),
        );
      });

      test('returns 588.82 for 588.82', () {
        expect(
          588.82.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('588.82'),
        );
      });

      test('returns 0.15 for 0.15723', () {
        expect(
          0.15723.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('0.15'),
        );
      });

      test('returns 3.14 for 3.14159', () {
        expect(
          3.14159.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('3.14'),
        );
      });

      test('returns 10.2 for 10.209', () {
        expect(
          10.209.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('10.2'),
        );
      });

      test('returns 20.21 for 20.2105', () {
        expect(
          20.2105.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('20.21'),
        );
      });

      test('returns 10 for 10.0', () {
        expect(
          10.0.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('10'),
        );
      });

      test('returns 0 for 0.0', () {
        expect(
          0.0.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('0'),
        );
      });

      test('returns 1,200.1 for 1200.10', () {
        expect(
          1200.1.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('1,200.1'),
        );
      });

      test('returns 1,200.14 for 1200.147', () {
        expect(
          1200.147.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('1,200.14'),
        );
      });

      test('returns 400.4 for 400.40', () {
        expect(
          400.40.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('400.4'),
        );
      });

      test('returns 89,723.12 for 89723.1273', () {
        expect(
          89723.1273.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('89,723.12'),
        );
      });

      test('returns 21,100 for 21100', () {
        expect(
          21100.0.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('21,100'),
        );
      });

      test('returns 112,457 for 112457', () {
        expect(
          112457.0.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('112,457'),
        );
      });

      test('returns 1,356 for 1356', () {
        expect(
          1356.0.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('1,356'),
        );
      });

      test('returns 1,356.91 for 1356.919', () {
        expect(
          1356.919.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('1,356.91'),
        );
      });

      test('returns 0.21 for 0.218', () {
        expect(
          0.218.truncateToDecimalPlaces(
            2,
            localeName: 'en_US',
            showCompact: false,
          ),
          equals('0.21'),
        );
      });
    });

    group('fi (Finland)', () {
      test('returns 40,99 for 40.999456', () {
        expect(
          40.999456.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('40,99'),
        );
      });

      test('returns 47 890,99 for 47890.999456', () {
        expect(
          47890.999456.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('47 890,99'),
        );
      });

      test('returns 588,82 for 588.82', () {
        expect(
          588.82.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('588,82'),
        );
      });

      test('returns 0,15 for 0.15723', () {
        expect(
          0.15723.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('0,15'),
        );
      });

      test('returns 3,14 for 3.14159', () {
        expect(
          3.14159.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('3,14'),
        );
      });

      test('returns 10,20 for 10.209', () {
        expect(
          10.209.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('10,2'),
        );
      });

      test('returns 20,21 for 20.2105', () {
        expect(
          20.2105.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('20,21'),
        );
      });

      test('returns 10 for 10.0', () {
        expect(
          10.0.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('10'),
        );
      });

      test('returns 0 for 0.0', () {
        expect(
          0.0.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('0'),
        );
      });

      test('returns 1 200,1 for 1200.10', () {
        expect(
          1200.1.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('1 200,1'),
        );
      });

      test('returns 1 200,14 for 1200.147', () {
        expect(
          1200.147.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('1 200,14'),
        );
      });

      test('returns 400,4 for 400.40', () {
        expect(
          400.40.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('400,4'),
        );
      });

      test('returns 89 723,12 for 89723.1273', () {
        expect(
          89723.1273.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('89 723,12'),
        );
      });

      test('returns 21 100 for 21100', () {
        expect(
          21100.0.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('21 100'),
        );
      });

      test('returns 112 457 for 112457', () {
        expect(
          112457.0.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('112 457'),
        );
      });

      test('returns 1 356 for 1356', () {
        expect(
          1356.0.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('1 356'),
        );
      });

      test('returns 1 356,91 for 1356.919', () {
        expect(
          1356.919.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('1 356,91'),
        );
      });

      test('returns 0,21 for 0.218', () {
        expect(
          0.218.truncateToDecimalPlaces(
            2,
            localeName: 'fi',
            showCompact: false,
          ),
          equals('0,21'),
        );
      });
    });

    group('de (Germany)', () {
      test('returns 40,99 for 40.999456', () {
        expect(
          40.999456.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('40,99'),
        );
      });

      test('returns 47.890,99 for 47890.999456', () {
        expect(
          47890.999456.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('47.890,99'),
        );
      });

      test('returns 588,82 for 588.82', () {
        expect(
          588.82.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('588,82'),
        );
      });

      test('returns 0,15 for 0.15723', () {
        expect(
          0.15723.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('0,15'),
        );
      });

      test('returns 3,14 for 3.14159', () {
        expect(
          3.14159.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('3,14'),
        );
      });

      test('returns 10,2 for 10.209', () {
        expect(
          10.209.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('10,2'),
        );
      });

      test('returns 20,21 for 20.2105', () {
        expect(
          20.2105.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('20,21'),
        );
      });

      test('returns 10 for 10.0', () {
        expect(
          10.0.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('10'),
        );
      });

      test('returns 0 for 0.0', () {
        expect(
          0.0.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('0'),
        );
      });

      test('returns 1.200,1 for 1200.10', () {
        expect(
          1200.1.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('1.200,1'),
        );
      });

      test('returns 1.200,14 for 1200.147', () {
        expect(
          1200.147.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('1.200,14'),
        );
      });

      test('returns 400,4 for 400.40', () {
        expect(
          400.40.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('400,4'),
        );
      });

      test('returns 89.723,12 for 89723.1273', () {
        expect(
          89723.1273.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('89.723,12'),
        );
      });

      test('returns 21.100 for 21100', () {
        expect(
          21100.0.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('21.100'),
        );
      });

      test('returns 112.457 for 112457', () {
        expect(
          112457.0.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('112.457'),
        );
      });

      test('returns 1.356 for 1356', () {
        expect(
          1356.0.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('1.356'),
        );
      });

      test('returns 1.356,91 for 1356.919', () {
        expect(
          1356.919.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('1.356,91'),
        );
      });

      test('returns 0,21 for 0.218', () {
        expect(
          0.218.truncateToDecimalPlaces(
            2,
            localeName: 'de',
            showCompact: false,
          ),
          equals('0,21'),
        );
      });
    });

    group('showCompact', () {
      test('returns 10.5K for 10500.25', () {
        expect(
          10500.25.truncateToDecimalPlaces(
            2,
            showCompact: true,
          ),
          equals('10.5K'),
        );
      });

      test('returns 10.5M for 10500000', () {
        expect(
          10500000.25.truncateToDecimalPlaces(
            2,
            showCompact: true,
          ),
          equals('10.5M'),
        );
      });

      test('returns 45.55M for 45550000', () {
        expect(
          45550000.25.truncateToDecimalPlaces(
            2,
            showCompact: true,
          ),
          equals('45.55M'),
        );
      });

      test('returns 10.5B for 10500000000', () {
        expect(
          10500000000.25.truncateToDecimalPlaces(
            2,
            showCompact: true,
          ),
          equals('10.5B'),
        );
      });

      test('returns 99.99K for 99999 (without rounding up)', () {
        expect(
          99999.0.truncateToDecimalPlaces(
            2,
            showCompact: true,
          ),
          equals('99.99K'),
        );
      });

      test('returns 100K for 99999 (with rounding up)', () {
        expect(
          99999.0.truncateToDecimalPlaces(
            2,
            showCompact: true,
            roundUp: true,
          ),
          equals('100K'),
        );
      });

      test('returns 4.55B for 4555555555 (without rounding up)', () {
        expect(
          4555555555.0.truncateToDecimalPlaces(
            2,
            showCompact: true,
          ),
          equals('4.55B'),
        );
      });

      test('returns 4.56B for 4555555555 (with rounding up)', () {
        expect(
          4555555555.0.truncateToDecimalPlaces(
            2,
            showCompact: true,
            roundUp: true,
          ),
          equals('4.56B'),
        );
      });

      test('returns 1.23T for 1234567890123', () {
        expect(
          1234567890123.0.truncateToDecimalPlaces(
            2,
            showCompact: true,
          ),
          equals('1.23T'),
        );
      });
    });

    group('lower than 0.01 for 2 fractional digits', () {
      group('with roundUp false', () {
        test('returns 0.001 for 0.001', () {
          expect(
            0.001.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: false,
            ),
            equals('0.001'),
          );
        });

        test('returns 0.001 for 0.00134', () {
          expect(
            0.00134.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: false,
            ),
            equals('0.001'),
          );
        });

        test('returns 0.001 for 0.00199', () {
          expect(
            0.00199.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: false,
            ),
            equals('0.001'),
          );
        });

        test('returns 0.0001 for 0.00014', () {
          expect(
            0.00014.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: false,
            ),
            equals('0.0001'),
          );
        });

        test('returns 0.0001 for 0.00016', () {
          expect(
            0.00016.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: false,
            ),
            equals('0.0001'),
          );
        });

        test('returns 0.000009 for 0.0000099', () {
          expect(
            0.0000099.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: false,
            ),
            equals('0.000009'),
          );
        });
      });

      group('with roundUp true', () {
        test('returns 0.001 for 0.001', () {
          expect(
            0.001.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: true,
            ),
            equals('0.001'),
          );
        });

        test('returns 0.001 for 0.00134', () {
          expect(
            0.00134.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: true,
            ),
            equals('0.001'),
          );
        });

        test('returns 0.002 for 0.00199', () {
          expect(
            0.00199.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: true,
            ),
            equals('0.002'),
          );
        });

        test('returns 0.0001 for 0.00014', () {
          expect(
            0.00014.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: true,
            ),
            equals('0.0001'),
          );
        });

        test('returns 0.0002 for 0.00016', () {
          expect(
            0.00016.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: true,
            ),
            equals('0.0002'),
          );
        });

        test('returns 0.00001 for 0.0000099', () {
          expect(
            0.0000099.truncateToDecimalPlaces(
              2,
              localeName: 'en_US',
              showCompact: false,
              roundUp: true,
            ),
            equals('0.00001'),
          );
        });
      });
    });
  });
}
