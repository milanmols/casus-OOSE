import 'dart:io';

class Endpoint {

	String _modelname;

	Endpoint(String modelname) {
		this._modelname = modelname;
	}

	void handleRequest(HttpRequest request) {

		print('Received request ${request.method}: ${request.uri.path}');

		switch (request.method) {
			case 'GET':
				handleGetRequest(request);
				break;
			case 'POST':
				handlePostRequest(request);
				break;
			case 'PUT':
				handlePutRequest(request);
				break;
			case 'delete':
				handleDeleteRequest(request);
				break;
			default:
				throw Exception('Unsupported request method: ${request.method}');
		}
	}

	void handleGetRequest(HttpRequest request) {

	}
	void handlePostRequest(HttpRequest request) {

	}
	void handlePutRequest(HttpRequest request) {

	}
	void handleDeleteRequest(HttpRequest request) {

	}


}