import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showQR = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 8.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'Presensi App',
            style: TextStyle(fontStyle: ui.FontStyle.italic, fontSize: 14.0),
          ),
        ),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: const [
                Icon(Icons.access_time),
                SizedBox(width: 8.0),
                Text('23:00:12'),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 8.0,
                  bottom: 24.0,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Halo, Bpk John Doe!',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '2014.17.0001.2202',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -10,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFDE03),
                      borderRadius: BorderRadius.circular(12.0)),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 8.0,
                  ),
                  child: const Text(
                    'Selasa, 02 November 2021',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 3.0,
                            color: Colors.red,
                            height: 18.0,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            'Pengenalan Pemrograman',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                          ),
                        ],
                      ),
                      const Text('Pertemuan Ke-1'),
                      const SizedBox(height: 8.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Mulai\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: 'Selesai',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(text: '10:00\n'),
                                  TextSpan(text: '12:00'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          !showQR
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF0266),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        print('hello');
                                      },
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          child: Row(
                                            children: const [
                                              Text('Generate QRCode',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              SizedBox(width: 8.0),
                                              Icon(
                                                Icons.qr_code_2_outlined,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2.0,
                                                  color: Colors.white,
                                                ),
                                                width: 20.0,
                                                height: 20.0,
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                )
                              : QrImage(
                                  data: 'This is a simple QR code',
                                  version: QrVersions.auto,
                                  size: 120,
                                  gapless: false,
                                ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Container(
                            width: 3.0,
                            color: Colors.red,
                            height: 18.0,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            'Status Presensi',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
