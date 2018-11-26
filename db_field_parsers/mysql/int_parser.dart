import '../../bin/db_field_parser.dart';

class IntParser implements DbFieldParser {
  @override
  String escape(value) {
		return '"${value.toString()}"';
  }

  @override
  parse(String value) {
		return int.parse(value);
  }

}