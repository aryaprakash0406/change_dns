import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DNS Configuration',
      key: _scaffoldKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DNS Configuration'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              setDnsServer(context);
            },
            child: const Text('Set DNS Server'),
          ),
        ),
      ),
    );
  }

  void setDnsServer(BuildContext context) async {
    // Predefined IP address of the DNS server
    String dnsServerIp = '192.168.1.100';

    try {
      // Make an API call to update the DNS settings
      var response = await http.post(
        Uri.parse('http://placekitten.com/200/300'),
        body: {'dns_server': dnsServerIp},
      );

      if (response.statusCode == 200) {
        print('DNS server set successfully.');
      
      } else {
        print('Failed to set DNS server. Status code: ${response.statusCode}');
        // Display error message
      }
    } catch (e) {
      print('Error setting DNS server: $e');
    }
  }
}
