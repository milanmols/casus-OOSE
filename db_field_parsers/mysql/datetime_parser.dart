import '../../bin/db_field_parser.dart';

class DatetimeParser implements DbFieldParser {
	@override
	String escape(value) {
		return '"${value.toString()}"';
	}

	@override
	parse(String value) {
		return value;
	}

}