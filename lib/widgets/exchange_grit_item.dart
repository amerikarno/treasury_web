// import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:treasury_web/models/exchange.dart';

class ExchangeGridItem extends StatefulWidget {
  const ExchangeGridItem({super.key});

  @override
  State<ExchangeGridItem> createState() => _ExchangeGridItemState();
}

class _ExchangeGridItemState extends State<ExchangeGridItem> {
  List<Exchange> _exchanges = [];

  @override
  void initState() {
    super.initState();
    _getExchanges();
  }

  void _getExchanges() async {
    final url = Uri(host: 'localhost', port: 8080);
    final response = await http.get(url);
    final listData = jsonDecode(response.body);
    final List<Exchange> _loadedItems = [];
    for (final item in listData) {
      _loadedItems.add(
        Exchange(
          exch: item['exchange'],
          currency: item['currency'],
          buying: item['buying'],
          selling: item['selling'],
          description: item['description'],
        ),
      );
    }
    setState(() {
      _exchanges = _loadedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No data available, please contact admin'),
    );
    if (_exchanges.isNotEmpty) {
      content = GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 1.5,
        ),
        itemCount: _exchanges.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _exchanges[index].exch != 'BITKUB'? Text(_exchanges[index].description, style: const TextStyle(color: Colors.white, fontSize: 18,),) :
                          Text(
                            _exchanges[index].currency,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            _exchanges[index].exch,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _exchanges[index].exch == 'BITKUB' &&
                                      double.parse(_exchanges[index].buying) >=
                                          1000
                                  ? Row(
                                      children: [
                                        const Icon(Icons.arrow_upward),
                                        Text(_exchanges[index].buying)
                                      ],
                                    )
                                  : _exchanges[index].exch == 'BBL bank'
                                      ? Row(
                                          children: [
                                            const Icon(Icons.arrow_downward),
                                            Text(_exchanges[index].buying)
                                          ],
                                        )
                                      : _exchanges[index].exch == 'SCB bank'
                                          ? Row(
                                              children: [
                                                const Icon(
                                                    Icons.arrow_downward),
                                                Text(_exchanges[index].buying)
                                              ],
                                            )
                                          : Text(
                                              _exchanges[index].buying,
                                            ),
                              const SizedBox(
                                width: 10,
                              ),
                              _exchanges[index].exch == 'BBL bank'
                                  ? Row(
                                      children: [
                                        const Icon(Icons.arrow_downward),
                                        Text(_exchanges[index].selling)
                                      ],
                                    )
                                  : _exchanges[index].exch == 'SCB bank'
                                      ? Row(
                                          children: [
                                            const Icon(Icons.arrow_downward),
                                            Text(_exchanges[index].selling)
                                          ],
                                        )
                                      : Text(
                                          _exchanges[index].selling,
                                        ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(_exchanges[index].currency),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Text(
              //       '${_exchanges[index].exch}: ',
              //       textAlign: TextAlign.center,
              //     ),
              //     Text(
              //       _exchanges[index].description,
              //       style: const TextStyle(
              //         fontSize: 8,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Column(
              //       children: [
              //         Text(
              //           _exchanges[index].buying,
              //           textAlign: TextAlign.center,
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     Column(
              //       children: [
              //         Text(
              //           _exchanges[index].selling,
              //           textAlign: TextAlign.center,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // ListTile(
              //   title: Text(_exchanges[index].exch,),
              //   subtitle: Text(_exchanges[index].currency),
              //   trailing: Text(_exchanges[index].description),
              //   tileColor: _exchanges[index].color,
              //   titleTextStyle: const TextStyle(color: Colors.black, fontSize: 12),
              //   subtitleTextStyle: const TextStyle(color: Colors.brown, fontSize: 14),
              //   leadingAndTrailingTextStyle: const TextStyle(color: Colors.black, fontSize: 10),
              // ),
              // ListTile(
              //   leading: Text(_exchanges[index].buying,),
              //   trailing: Text(_exchanges[index].selling,),
              //   tileColor:const Color.fromARGB(255, 54, 45, 18),
              // ),
            ],
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exchanges'),
        // _getExchanges(),
      ),
      body: content,
    );
  }
}
