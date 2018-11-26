import 'dart:io';
import 'config.dart';
import 'database_adapter.dart';
import '../database_adapters/MysqlAdapter.dart';

class Core {

	HttpRequest request;
	static DatabaseAdapter database;

	Core(this.request);

  void init() {
		this.startDatabase();
		this.dispatchRequest();
  }

  void startDatabase() {
		Core.database = new MysqlAdapter(config['database']);
	}

	void dispatchRequest(){
  	// hier op basis van de config checken of een endpoint is aangeroepen die bestaat
		// Als endpoint gevonden is, instance van creeren met juiste model en request aan doorgeven

	}

}