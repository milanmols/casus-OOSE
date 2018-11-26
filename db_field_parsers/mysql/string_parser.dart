import '../../bin/db_field_parser.dart';

class StringParser implements DbFieldParser {
	@override
	String escape(value) {
		return '"${value}"';
	}

	@override
	parse(String value) {
		return value;
	}

}