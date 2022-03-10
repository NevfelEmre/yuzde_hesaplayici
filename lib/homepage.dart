import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }
  UnfocusDisposition disposition = UnfocusDisposition.scope;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 40, 30, 0),
                child: TextFormField(
                  controller: textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Ham Değer :',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: textController1.text.isNotEmpty
                        ? InkWell(
                      onTap: () =>
                          setState(
                                () => textController1.clear(),
                          ),
                      child: Icon(
                        Icons.clear,
                        color: Color(0xFF757575),
                        size: 20,
                      ),
                    )
                        : null,
                  ),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 40, 30, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                        child: TextFormField(
                          onChanged: (_) =>
                              EasyDebounce.debounce(
                                'textController2',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                          controller: textController2,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Yüzde kaçı ?',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            suffixIcon: textController2.text.isNotEmpty
                                ? InkWell(
                              onTap: () =>
                                  setState(
                                        () => textController2.clear(),
                                  ),
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFF757575),
                                size: 20,
                              ),
                            )
                                : null,
                          ),
                          style:
                          TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.percent,
                      color: Colors.black,
                      size: 40,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 40),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            primaryFocus.unfocus(disposition: disposition);
                          });
                          Calculate();
                          CalculateDiscount();
                          bottomSheet(context);
                        },
                        child: Text("Hesapla"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.purple),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all(const Size(
                              4000, 40)),
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                                fontSize: 17, fontFamily: 'Poppins'),
                          ),
                        ),
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
  void Calculate(){
    num a = double.parse(textController1.text);
    num b = double.parse(textController2.text);
    sonuc = (a * (b/100));
  }
  void CalculateDiscount(){
    num a = double.parse(textController1.text);
    indirim = a - sonuc;
  }
}
num sonuc, indirim;
  bottomSheet(context) {
    showModalBottomSheet(context: context,
        builder: (BuildContext c) {
          return Wrap(
              children: <Widget>[Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 50, 70, 50),
                    child: Text("Sonuç: ${sonuc.toStringAsFixed(2)} \n\nİndirimli Hali: ${indirim.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              ]
          );
        });
  }
