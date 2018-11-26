import 'db_field_parser.dart';

abstract class DatabaseAdapter {
	Map _options;

	var _parsers = <String, Object Function()>{};

	DatabaseAdapter(this._options);

	void openConnection();

	void closeConnection();

	Map doSelect(String table, Map where);

	bool doInsert(String table, Map colValues);

	bool doUpdate(String table, Map colValues, Map where);

	bool doDelete(String table, Map where);


	DbFieldParser getParser(String type){
		try {
			DbFieldParser parser = this._parsers[type]();
			return parser;
		} catch (Exception) {
			throw Exception('Parser not found: $type');
		}
	}
}