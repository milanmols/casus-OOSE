import 'dart:io';
import 'core.dart';

class Server {
	final HOST = InternetAddress.loopbackIPv4;
	final PORT = 8080;

	void start() async {
		var server = await HttpServer.bind(HOST, PORT);

		print('Listening on localhost:${server.port}');

		await for (HttpRequest request in server) {
			handleRequest(request);
		}
	}

	void handleRequest(HttpRequest req) {
		Core core = new Core(req);
		core.init();



//		res.write('Received request ${req.method}: ${req.uri.path}');
//		res.close();
	}
}
