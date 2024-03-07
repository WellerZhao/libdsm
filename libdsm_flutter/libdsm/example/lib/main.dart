import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:libdsm/libdsm.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  Dsm dsm = Dsm();

  void _create() async {
    await dsm.init();
  }

  void _release() async {
    await dsm.release();
  }

  void _startDiscovery() async {
    dsm.onDiscoveryChanged.listen(_discoveryListener);
    await dsm.startDiscovery();
  }

  void _discoveryListener(String json) async {
    debugPrint('Discovery : $json');
  }

  void _stopDiscovery() async {
    dsm.onDiscoveryChanged.listen(null);
    await dsm.stopDiscovery();
  }

  void _resolve() async {
    String name = 'biezhihua';
    await dsm.resolve(name);
  }

  void _inverse() async {
    String address = '192.168.1.1';
    await dsm.inverse(address);
  }

  void _login() async {
    await dsm.login("BIEZHIHUA-PC", "test", "test");
  }

  void _logout() async {
    await dsm.logout();
  }

  void _getShareList() async {
    var list = await dsm.getShareList();
    print(list.toString());
  }

  int tid = 0;

  void _treeConnect() async {
    tid = await dsm.treeConnect("jimmy");
  }

  void _treeDisconnect() async {
    int result = await dsm.treeDisconnect(tid);
    tid = 0;
  }

  void _find() async {
    var result = await dsm.find(tid, "\\*");

    result = await dsm.find(tid, "\\Documents\\*");
    print(result);
  }

  void _fileStatus() async {
    var result =
        await dsm.fileStatus(tid, "\\Documents\\code.zip");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter LIBDSM'),
        ),
        body: Column(
          // <Widget> is the type of items in the list.
          children: <Widget>[
            MaterialButton(
              onPressed: _create,
              child: Text('create'),
            ),
            MaterialButton(
              onPressed: _release,
              child: Text('release'),
            ),
            MaterialButton(
              onPressed: _startDiscovery,
              child: Text('startDiscovery'),
            ),
            MaterialButton(
              onPressed: _stopDiscovery,
              child: Text('stopDiscovery'),
            ),
            MaterialButton(
              onPressed: _resolve,
              child: Text('resolve'),
            ),
            MaterialButton(
              onPressed: _inverse,
              child: Text('inverse'),
            ),
            MaterialButton(
              onPressed: _login,
              child: Text('login'),
            ),
            MaterialButton(
              onPressed: _logout,
              child: Text('logout'),
            ),
            MaterialButton(
              onPressed: _getShareList,
              child: Text('getShareList'),
            ),
            MaterialButton(
              onPressed: _treeConnect,
              child: Text('treeConnect'),
            ),
            MaterialButton(
              onPressed: _treeDisconnect,
              child: Text('treeDisconnect'),
            ),
            MaterialButton(
              onPressed: _find,
              child: Text('find'),
            ),
            MaterialButton(
              onPressed: _fileStatus,
              child: Text('fileStatus'),
            ),
          ],
        ),
      ),
    );
  }
}
