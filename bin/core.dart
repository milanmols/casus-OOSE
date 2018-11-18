import 'dart:io';

class Core {

  final HOST = InternetAddress.loopbackIPv4;
  final PORT = 8080;

  void init() async {
    var server = await HttpServer.bind(HOST, PORT);

    print('Listening on localhost:${server.port}');

    await for (HttpRequest request in server) {
      switch (request.method) {
        case 'GET':
          handleGetRequest(request);
          break;
        case 'POST':
          break;
      }
    }
  }

  void handleGetRequest(HttpRequest req) {
    HttpResponse res = req.response;
    res.write('Received request ${req.method}: ${req.uri.path}');
    res.close();
  }
}