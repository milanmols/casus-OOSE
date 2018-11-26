import 'core.dart';
import 'package:recase/recase.dart';

abstract class Model {

	String _tableName;
	Map _tableColumns;

	int _id = 0;


	Model([int id]) {
		if(id != null){
			Map colValues = {
				'id': id.toString()
			};
			this.loadBy(colValues);
		}
	}

	String getTableName() {
		return this._tableName;
	}

	Map getTableColumns() {
		return this._tableColumns;
	}

	bool save() {

	}

	bool delete() {

	}

	void loadBy(Map colValues) {
		Map where;
		this._tableColumns.forEach((column, type){
			if(colValues.containsKey(column)){
				where[column] = colValues[column];
			}
		});

		Map rawData = Core.database.doSelect(this.getTableName(), where);

		this.processRawData(rawData);
	}

	void processRawData(Map rawData) {
		this._tableColumns.forEach((column, type) {
				if (rawData.containsKey(column)) {
					this._setValue(column, Core.database.getParser(type).parse(rawData[column]));
				} else {
					throw Exception('Field not found: ${column}');
				}
			}
		);
	}

	Map prepareQueryData() {
		Map queryData;
		this._tableColumns.forEach((column, type){
			queryData[column] = Core.database.getParser(type).escape(this._getValue(column));
		});
		return queryData;
	}

	dynamic _getValue(String column){
		String method = this.toCamelCase('get_${column}');
		return '';
	}

	void _setValue(String column, dynamic value){
		String method = this.toCamelCase('set_${column}');
	}

	String toCamelCase(String str) {
		ReCase rc = new ReCase(str);
		return rc.camelCase;
	}

	String toSnakeCase(String str){
		ReCase rc = new ReCase(str);
		return rc.snakeCase;
	}
}