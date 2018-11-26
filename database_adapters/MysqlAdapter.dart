import '../bin/database_adapter.dart';
import '../db_field_parsers/mysql/int_parser.dart';
import '../db_field_parsers/mysql/string_parser.dart';
import '../db_field_parsers/mysql/boolean_parser.dart';
import '../db_field_parsers/mysql/datetime_parser.dart';

class MysqlAdapter extends DatabaseAdapter {

	var _parsers = <String, Object Function()>{
		'int': () => new IntParser(),
		'string': () => new StringParser(),
		'boolean': () => new BooleanParser(),
		'datetime': () => new DatetimeParser(),
	};

  MysqlAdapter(Map options) : super(options);


	@override
	void openConnection() {
		// TODO: implement openConnection
	}

  @override
  void closeConnection() {
    // TODO: implement closeConnection
  }

	@override
	Map doSelect(String table, Map where) {
		var buffer = new StringBuffer();
		buffer.write('SELECT * FROM ');
		buffer.write(table);
		buffer.write(' WHERE 1=1');

		where.forEach((column, value) {
			buffer.write(' AND ');
			buffer.write(column);
			buffer.write(' = ');
			buffer.write(value);
		});

		String query = buffer.toString();

		print(query);
		return const {};
	}

  @override
  bool doInsert(String table, Map colValues) {
		var buffer = new StringBuffer();
		var valuebuffer = new StringBuffer();
		buffer.write('INSERT INTO  ');
		buffer.write(table);
		buffer.write('(');
		valuebuffer.write('VALUES (');

		bool first = true;
		colValues.forEach((column, value) {
			if(first == false){
				buffer.write(', ');
				valuebuffer.write(', ');
			}
			first = false;
			buffer.write(column);
			valuebuffer.write(value);
		});
		buffer.write(')');
		valuebuffer.write(')');

		buffer.write(valuebuffer.toString());

		String query = buffer.toString();

		print(query);
    return null;
  }

  @override
  bool doUpdate(String table, Map colValues, Map where) {
		var buffer = new StringBuffer();
		buffer.write('UPDATE ');
		buffer.write(table);
		buffer.write(' SET ');

		colValues.forEach((column, value) {
			buffer.write(column);
			buffer.write(' = ');
			buffer.write(value);
		});

		buffer.write(' WHERE 1=1');

		where.forEach((column, value) {
			buffer.write(' AND ');
			buffer.write(column);
			buffer.write(' = ');
			buffer.write(value);
		});

		String query = buffer.toString();

		print(query);
    return null;
  }

  @override
  bool doDelete(String table, Map where) {
		var buffer = new StringBuffer();
		buffer.write('DROP * FROM ');
		buffer.write(table);
		buffer.write(' WHERE 1=1');

		where.forEach((column, value) {
			buffer.write(' AND ');
			buffer.write(column);
			buffer.write(' = ');
			buffer.write(value);
		});

		String query = buffer.toString();

		print(query);
    return true;
  }

}