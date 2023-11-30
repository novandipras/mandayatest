import 'package:intl/intl.dart';

extension StringExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');


  String toPhoneNumber(){
    if(split('').first == '0') {
      return replaceFirst('0', '62');
    }else if ((split('').first != '0') && (split('').first + split('')[1] != '62')){
      return '62$this';
    } else {
      return this;
    }
  }


  String toHariTanggalan() {
    return DateFormat(
      'EEE dd MMM yyy, K:mm a',
      'id_ID',
    ).format(
      (DateTime.parse(
        this,
      )).toLocal(),
    );
  }

  String toHariTanggalanSimpleDate() {
    return DateFormat(
      'dd MMM yyyy ',
      'id_ID',
    ).format(
      (DateTime.parse(
        this,
      )).toLocal(),
    );
  }
  String toHariTanggalanSimpleClock() {
    return DateFormat(
      'K:mm a',
      'id_ID',
    ).format(
      (DateTime.parse(
        this,
      )).toLocal(),
    );
  }
}
