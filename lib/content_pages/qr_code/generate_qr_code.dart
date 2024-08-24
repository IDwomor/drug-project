import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:updated_drug_app/user_auth/mysql.dart';
import 'package:updated_drug_app/widgets/custom_button.dart';
import 'package:updated_drug_app/widgets/custom_textfield.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  final TextEditingController _drugNameController = TextEditingController();
  final TextEditingController _drugExpiryController = TextEditingController();
  final TextEditingController _drugUniqueIdentifierController =
      TextEditingController();

 String _qrData = "";

  /*var db = new Mysql();
  var drugUniqueIdentifier = "";*/


  //final DatabaseReference _dbRef = FirebaseDatabase.instance.ref('https://upgraded-drug-app-default-rtdb.firebaseio.com/'); // Reference to your Firebase node

  void _generateQR() {https://upgraded-drug-app-default-rtdb.firebaseio.com/
    setState(() {
      _qrData =
      "Drug Name: ${_drugNameController.text}\nDrug Expiry: ${_drugExpiryController.text}\nDrug Unique Identifier: ${_drugUniqueIdentifierController.text}";
    });
  }
  /*void _generateQR() async {
    final String drugUniqueIdentifier = _drugUniqueIdentifierController.text.trim();

    // Query Firebase to check if the drug unique identifier exists
    final DataSnapshot snapshot = await _dbRef.get();

    bool isAuthentic = false;

    if (snapshot.exists) {
      final drugs = Map<String, dynamic>.from(snapshot.value as Map);

      drugs.forEach((key, value) {
        final String dbDrugUniqueIdentifier = value['drugUniqueIdentifier'];

        if (dbDrugUniqueIdentifier == drugUniqueIdentifier) {
          isAuthentic = true;
        }
      });
    }

    setState(() {
      if (isAuthentic) {
        _qrData =
        "Drug Name: ${_drugNameController.text}\nDrug Expiry: ${_drugExpiryController.text}\nDrug Status: Authentic";
      } else {
        _qrData =
        "Drug Name: ${_drugNameController.text}\nDrug Expiry: ${_drugExpiryController.text}\nDrug Status: Not Authentic";
      }
    });
  }*/

  /*void _generateQR() async {
    final String drugUniqueIdentifier = _drugUniqueIdentifierController.text.trim();
    print("Drug Unique Identifier entered: $drugUniqueIdentifier");

    // Query Firebase to check if the drug unique identifier exists
    try {
      final DataSnapshot snapshot = await _dbRef.get();

      bool isAuthentic = false;

      if (snapshot.exists) {
        final drugs = Map<String, dynamic>.from(snapshot.value as Map);
        print("Drugs data fetched from Firebase: $drugs");

        drugs.forEach((key, value) {
          final String dbDrugUniqueIdentifier = value['drugUniqueIdentifier'];
          print("Comparing with Firebase drug unique identifier: $dbDrugUniqueIdentifier");

          if (dbDrugUniqueIdentifier == drugUniqueIdentifier) {
            isAuthentic = true;
          }
        });
      }

      setState(() {
        if (isAuthentic) {
          _qrData =
          "Drug Name: ${_drugNameController.text}\nDrug Expiry: ${_drugExpiryController.text}\nDrug Status: Authentic";
          print("Authentic drug - QR data: $_qrData");
        } else {
          _qrData =
          "Drug Name: ${_drugNameController.text}\nDrug Expiry: ${_drugExpiryController.text}\nDrug Status: Not Authentic";
          print("Not authentic drug - QR data: $_qrData");
        }
      });
    } catch (e) {
      print("Error fetching data from Firebase: $e");
    }
  }*/

  /*String _resultMessage = "";

  Future<void> _checkDrugAuthenticity() async {
    try {
      final String inputIdentifier = _drugUniqueIdentifierController.text;

      // Query Firestore to check if the drug unique identifier exists
      final CollectionReference drugsRef = FirebaseFirestore.instance.collection('/drugs');
      final QuerySnapshot snapshot = await drugsRef.where('drugUniqueIdentifier', isEqualTo: inputIdentifier).get();


      if (snapshot.docs.isNotEmpty) {
        setState(() {
          _resultMessage = "Drug is authentic";
        });
      } else {
        setState(() {
          _resultMessage = "Drug is not authentic";
        });
      }
    } catch (e) {
      print("Error fetching data from Firebase: $e");
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xffF7524F),
        title: const Text('Generate QR Code'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: QrImageView(
                  data: _qrData,
                  size: min(MediaQuery.of(context).size.width / 1.6,
                      MediaQuery.of(context).size.height / 2.1),
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField(context),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  _generateQR();
                },
                minWidth: 150,
                height: 45,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                color: const Color(0xffF7524F),
                child: const Text(
                  "Generate",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              //getting new input, new qr code is generated. now let us make download and share button
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _qrDownload(_qrData);
                      },
                      minWidth: 150,
                      height: 45,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      color: const Color(0xffF7524F),
                      child: const Text(
                        "Download",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _share(_qrData);
                      },
                      minWidth: 150,
                      height: 45,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      color: Color(0xffF7524F),
                      child: const Text(
                        "Share",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _drugNameController,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hintText: "Enter drug name",
              hintStyle: const TextStyle(
                color: Colors.black54,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xffF7524F)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xffF7524F)),
              ),
              /*suffixIcon: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                icon: const Icon(
                  Icons.done,
                  size: 30,
                ),
                color: const Color(0xffF7524F),
              ),*/
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _drugExpiryController,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hintText: "Enter drug expiry",
              hintStyle: const TextStyle(
                color: Colors.black54,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xffF7524F)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xffF7524F)),
              ),
              /*suffixIcon: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                icon: const Icon(
                  Icons.done,
                  size: 30,
                ),
                color: const Color(0xffF7524F),
              ),*/
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _drugUniqueIdentifierController,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hintText: "Enter drug unique identifier",
              hintStyle: const TextStyle(
                color: Colors.black54,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xffF7524F)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xffF7524F)),
              ),
              /*suffixIcon: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                icon: const Icon(
                  Icons.done,
                  size: 30,
                ),
                color: const Color(0xffF7524F),
              ),*/
            ),
          ),
        ),
      ],
    );
  }

  _qrCode(String _txt) async {
    final qrValidationResult = QrValidator.validate(
        data: _txt,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.L);

    qrValidationResult.status = QrValidationStatus.valid;
    final qrCode = qrValidationResult.qrCode;

    final painter = QrPainter.withQr(
      qr: qrCode!,
      color: const Color(0xffffffff),
      embeddedImageStyle: null,
      emptyColor: Colors.black,
      gapless: true,
    );

    Directory _tempDir = await getTemporaryDirectory();

    String _tempPath = _tempDir.path;

    final _time = DateTime.now().microsecondsSinceEpoch.toString();
    String _finalPth = '$_tempPath/$_time.png';

    final picData =
        await painter.toImageData(2048, format: ImageByteFormat.png);
    await writeToFile(picData!, _finalPth);
    return _finalPth;
  }

  Future<String?> writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  _share(String _path) async {
    String _filePath = await _qrCode(_path);
    await Share.shareXFiles([
      XFile(
        _filePath,
        mimeType: "image/png",
      )
    ], subject: "My Qr code", text: "Please Scan me");
  }

  _qrDownload(String _path) async {
    String _filePath = await _qrCode(_path);
    final _success = await GallerySaver.saveImage(_filePath);
    if (_success != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Download Successful")));
    }
  }
}
