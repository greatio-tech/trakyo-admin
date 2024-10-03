import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> fetchNetworkImage(String imageUrl) async {
  try {
    var response = await Dio().get(
      imageUrl,
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data);
  } catch (e) {
    throw Exception('Failed to load image: $e');
  }
}

Future<Uint8List> loadAsset(String path) async {
  final ByteData data = await rootBundle.load(path);
  return data.buffer.asUint8List();
}

Future<Page> pdfPage(url, id) async {
  final Uint8List imageData = await fetchNetworkImage(url);
  final Uint8List logoData = await loadAsset('assets/png/logo.png');
  final Uint8List android = await loadAsset('assets/png/android.png');
  final Uint8List ios = await loadAsset('assets/png/ios.png');

  return Page(
    build: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: .1),
            ),
            width: 250,
            height: 380,
            child: Column(
              children: [
                SizedBox(height: 20),
                Image(MemoryImage(logoData), width: 100),
                Text(
                  'SCAN ME!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Scan - Connect - Notify',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: PdfColor.fromHex("6411CF"),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Image(MemoryImage(android), width: 8),
                          SizedBox(width: 5),
                          Text(
                            'ANDROID',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: PdfColor.fromHex('FFFFFF'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        color: PdfColor.fromHex("6411CF"),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Transform.translate(
                            offset: const PdfPoint(0, 1),
                            child: Image(MemoryImage(ios), width: 8),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'IOS',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: PdfColor.fromHex('FFFFFF'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'www.trakyo.com',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 250,
                  decoration: BoxDecoration(
                    color: PdfColor.fromHex("6411CF"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Scan this to contact owner',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: PdfColor.fromHex('FFFFFF'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: PdfColor.fromHex('FFFFFF'),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image(MemoryImage(imageData), width: 120),
                            Positioned(
                              right: 15,
                              bottom: 3,
                              child: Text(
                                id,
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Powered by ',
                              style: TextStyle(
                                fontSize: 10,
                                color: PdfColor.fromHex('FFFFFF'),
                              ),
                            ),
                            TextSpan(
                              text: 'Trakyo scan',
                              style: TextStyle(
                                fontSize: 10,
                                color: PdfColor.fromHex('FFFFFF'),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
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
    },
  );
}

// class PdfCreator {
//   static Future<void> createPdf(url, id) async {
//     final pdf = Document();
//     pdf.addPage(await pdfPage(url, id));
//     final Uint8List pdfBytes = await pdf.save();
//     savePdfWeb(pdfBytes, "qr.pdf");
//   }

//   static void savePdfWeb(Uint8List pdfBytes, String fileName) {
//     final blob = html.Blob([pdfBytes], 'application/pdf');
//     final url = html.Url.createObjectUrlFromBlob(blob);
//     html.AnchorElement(href: url)
//       ..setAttribute("download", fileName)
//       ..click();
//     html.Url.revokeObjectUrl(url);
//   }
// }
