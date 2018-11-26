import '../../bin/db_field_parser.dart';

class BooleanParser implements DbFieldParser {
  @override
  String escape(value) {
    if(value == true || value == 1 || value == 'true' || value == '1'){
    	return '1';
		} else {
    	return '0';
		}
  }

  @override
  bool parse(String value) {
		return (value == 'true' || value == '1');
  }

}