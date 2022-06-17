import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents PdfView for Navigation
class PdfView extends StatefulWidget {
  
  const PdfView({Key? key}) : super(key: key);

  @override
  _PdfView createState() => _PdfView();
}

class _PdfView extends State<PdfView> {

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القرآن نسخة شخصية'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.bookmark,
        //       color: Colors.white,
        //       semanticLabel: 'Bookmark',
        //     ),
        //     onPressed: () {
        //       _pdfViewerKey.currentState?.openBookmarkView();
        //     },
        //   ),
        // ],
      ),
      body: SfPdfViewer.asset(
        'assets/pdf/asdf.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}
