import '../bin/model.dart';

class Test extends Model {
	final String _tableName = 'test';
	final Map _tableColumns = {
		'test_column': 'string'
	};

	String _test_column = '';

	String getTestColumn() {
		return this._test_column;
	}

	void setTestColumn(String test_column) {
		this._test_column = test_column;
	}
}