
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:developer' as developer;
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';
import 'package:convert/convert.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Token extends GeneratedContract{
  Token(super.self, super.client, super.chainId);

  Future<Uint8List> sendCoin(
      Credentials credentials,
      ContractFunction function,
      List<dynamic> parameters) async {
    return function.encodeCall(parameters);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: 'WalletConnect',
      description: 'WalletConnect Developer App',
      url: 'https://walletconnect.org',
      icons: [
        'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
      ],
    ),
  );

  String? account;
  var abiCode = '[{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"previousAdmin","type":"address"},{"indexed":false,"internalType":"address","name":"newAdmin","type":"address"}],"name":"AdminChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"beacon","type":"address"}],"name":"BeaconUpgraded","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"buyer","type":"address"},{"indexed":false,"internalType":"address","name":"seller","type":"address"},{"indexed":false,"internalType":"address","name":"token","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"tomenAmount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"}],"name":"Buy","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"buyer","type":"address"},{"indexed":false,"internalType":"address","name":"seller","type":"address"},{"indexed":false,"internalType":"address","name":"token","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"tomenAmount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"}],"name":"BuyMatchSell","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"seller","type":"address"},{"indexed":false,"internalType":"address","name":"token","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"tomenAmount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"}],"name":"CreateAndSell","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint8","name":"version","type":"uint8"}],"name":"Initialized","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"previousAdminRole","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"newAdminRole","type":"bytes32"}],"name":"RoleAdminChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleGranted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleRevoked","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"seller","type":"address"},{"indexed":false,"internalType":"address","name":"token","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"tomenAmount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"}],"name":"Sell","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"implementation","type":"address"}],"name":"Upgraded","type":"event"},{"inputs":[],"name":"DEFAULT_ADMIN_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"FEE_FRACTION","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"FEE_RECEIVER","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"UPGRADER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"feeReceiver","type":"address"},{"internalType":"uint256","name":"feeFraction","type":"uint256"}],"name":"__FeeComp_init","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"internalType":"address","name":"seller","type":"address"},{"components":[{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"tokenAmount","type":"uint256"},{"internalType":"enum LibAsset.AssetType","name":"assetType","type":"uint8"}],"internalType":"struct LibAsset.Asset","name":"asset","type":"tuple"}],"internalType":"struct ExchangeDomain.BuyRequest","name":"buyReq","type":"tuple"}],"name":"buy","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"components":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"nonce","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"}],"internalType":"struct ForwarderUpgradeable.ForwardRequest","name":"createAndSellReq","type":"tuple"},{"internalType":"bytes","name":"createAndSellSignature","type":"bytes"},{"components":[{"internalType":"address","name":"seller","type":"address"},{"components":[{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"tokenAmount","type":"uint256"},{"internalType":"enum LibAsset.AssetType","name":"assetType","type":"uint8"}],"internalType":"struct LibAsset.Asset","name":"asset","type":"tuple"}],"internalType":"struct ExchangeDomain.BuyRequest","name":"buyReq","type":"tuple"}],"name":"buyMatchSell","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"components":[{"components":[{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"tokenAmount","type":"uint256"},{"internalType":"enum LibAsset.AssetType","name":"assetType","type":"uint8"}],"internalType":"struct LibAsset.Asset","name":"asset","type":"tuple"},{"internalType":"string","name":"uri","type":"string"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"uint96","name":"royalty","type":"uint96"}],"internalType":"struct ExchangeDomain.CreateAndSellRequest","name":"createAndSellReq","type":"tuple"}],"name":"createAndSell","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"}],"name":"getRoleAdmin","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"grantRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"hasRole","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"forwarder","type":"address"},{"internalType":"address","name":"admin","type":"address"},{"internalType":"address","name":"feeReceiver","type":"address"},{"internalType":"uint256","name":"feeFraction","type":"uint256"}],"name":"initialize","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"forwarder","type":"address"}],"name":"isTrustedForwarder","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"components":[{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"tokenAmount","type":"uint256"},{"internalType":"enum LibAsset.AssetType","name":"assetType","type":"uint8"}],"internalType":"struct LibAsset.Asset","name":"asset","type":"tuple"}],"name":"offmaket","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"proxiableUUID","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"renounceRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"revokeRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"components":[{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"tokenAmount","type":"uint256"},{"internalType":"enum LibAsset.AssetType","name":"assetType","type":"uint8"}],"internalType":"struct LibAsset.Asset","name":"asset","type":"tuple"},{"internalType":"uint256","name":"price","type":"uint256"}],"internalType":"struct ExchangeDomain.SellRequest","name":"sellReq","type":"tuple"}],"name":"sell","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"}],"name":"sellinfos","outputs":[{"internalType":"uint256","name":"tokenAmount","type":"uint256"},{"internalType":"uint256","name":"price","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"feeReceiver","type":"address"},{"internalType":"uint256","name":"feeFraction","type":"uint256"}],"name":"setFee","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"newImplementation","type":"address"}],"name":"upgradeTo","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"newImplementation","type":"address"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"upgradeToAndCall","outputs":[],"stateMutability":"payable","type":"function"}]';

  Future<void> _onCreateAndSell() async {
    () async {
      var contract = ContractAbi.fromJson(abiCode, 'CreateAndSell');

      ContractFunction? createAndSell = null;
      for (var element in contract.functions) {
        if(element.name == "createAndSell") {
          createAndSell = element;
        }
      }

      var sign = createAndSell!.encodeCall([[
        [
          EthereumAddress.fromHex("0x72F791E1070DDF1cD70D8C61911B4dfb1D1ca4fC"),
          BigInt.tryParse('15923930118298664981669954120985'),
          BigInt.one,
          BigInt.from(3),
        ],
        "https://cloudflare-ipfs.com/ipfs/aaa",
        BigInt.tryParse('1000000000000000'),
        BigInt.from(100),
      ]]);
      developer.log(hex.encode(sign).toString());
    }();
  }
  Future<void> _onBuyMatchSell() async {

    () async {
      var contract = ContractAbi.fromJson(abiCode, 'CreateAndSell');
      developer.log(contract.toString());
      ContractFunction? buyMatchSell = null;
      for (var element in contract.functions) {
        if(element.name == "buyMatchSell") {
          buyMatchSell = element;
          break;
        }
      }

      var sign = buyMatchSell!.encodeCall([
        [
          EthereumAddress.fromHex("0xf6d57a4de2e167df7fcd14a3dadfdd9157eae48a"),
          EthereumAddress.fromHex("0xd1Dcd8E1c1e7DF9dBC670e8F7c4606fA9Fe33B88"),
          BigInt.tryParse('1669947059144'),
          hex.decode('aca30e0e000000000000000000000000000000000000000000000000000000000000002000000000000000000000000072f791e1070ddf1cd70d8c61911b4dfb1d1ca4fc00000000000000000000000000000000000000c9b6d43f22be7b1045b37f2bc80000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000001b4fbd92b5f800000000000000000000000000000000000000000000000000000000000000000640000000000000000000000000000000000000000000000000000000000000007697066733a2f2f00000000000000000000000000000000000000000000000000'),
        ],
        hex.decode('12db031123aae854df6c29c85941736c375c8bc32efc94b7ad7ff0410d9b89b20840885b009a49859e0065ccb25aea1a87d51187853c2deccdb8aa41c5d726681c'),
        [
          EthereumAddress.fromHex("0xf6d57a4de2e167df7fcd14a3dadfdd9157eae48a"),
          [
            EthereumAddress.fromHex("0x72F791E1070DDF1cD70D8C61911B4dfb1D1ca4fC"),
            BigInt.tryParse('15981443527578378261669947059144'),
            BigInt.one,
            BigInt.from(3),
          ]
        ]
      ]);
      developer.log(hex.encode(sign).toString());
    }();
  }

  String ws = '';

  Future<void> _onConnect() async {
    if (!connector.connected) {
      connector.createSession(
          chainId: 80001,
          onDisplayUri: (uri) async {
            setState(() {
              ws = 'metamask://wc?uri=$uri';
            });
            developer.log(ws);
            // await launchUrlString('metamask://wc?uri=$uri', mode: LaunchMode.externalApplication);
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    connector.on('connect', (SessionStatus session) async {
      developer.log(session.toString());
      account = session.accounts.first;
    });
    connector.on('session_update', (payload) => developer.log(payload.toString()));
    connector.on('disconnect', (session) => developer.log(session.toString()));

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ws: $ws'),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton(onPressed: _onConnect, color: CupertinoColors.activeBlue, child: const Text('连接钱包'),)
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton(onPressed: _onBuyMatchSell, color: CupertinoColors.activeBlue, child: const Text('BuyMatchSell'),)
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton(onPressed: _onCreateAndSell, color: CupertinoColors.activeBlue, child: const Text('CreateAndSell'),)
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
