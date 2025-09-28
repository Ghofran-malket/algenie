import 'package:algenie/presentation/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  _TermsConditionsScreenState createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {

  final ScrollController _scrollController = ScrollController();
  bool checked = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              //appBar
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(17),
                    vertical: ScreenUtil().setHeight(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                            Localizations.localeOf(context).languageCode == 'ar'
                                ? Icon(Icons.keyboard_arrow_right,
                                    color: Color(0xFF252B37),
                                    size: ScreenUtil().setSp(25))
                                : Icon(Icons.keyboard_arrow_left,
                                    color: Color(0xFF252B37),
                                    size: ScreenUtil().setSp(25))),
                    Expanded(
                      child: Text(
                        "Terms and Conditions",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Poppin-semibold",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: SizedBox(
                  height: ScreenUtil().setHeight(140),
                  child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset('assets/algenie_logo.png')),
                ),
              ),
              
              SizedBox(height: 30,),
              
              Scrollbar(
                thumbVisibility: true,
                controller: _scrollController,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(17)),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(17)),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.31),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.12),
                            offset: Offset(
                              0.0,
                              ScreenUtil().setWidth(1.0),
                            ), //(x,y)
                            blurRadius: ScreenUtil().setWidth(6.0),
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setWidth(20))),
                      ),
                      height: MediaQuery.of(context).size.height/ 3,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(17)),
                        controller: _scrollController,
                        children: [
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's"
                          "standard dummy text ever since the 1500s, "
                          "when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                        ],
                      )),
                ),
              ),

            

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(17),
                    vertical: ScreenUtil().setHeight(12)),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      checked = !checked;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: ScreenUtil().setHeight(30),
                        width: ScreenUtil().setHeight(30),
                        decoration: BoxDecoration(
                            borderRadius: const 
                                BorderRadius.all(Radius.circular(3.0)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(0, 0, 0, 0.16),
                                offset: Offset(
                                  0.0,
                                  ScreenUtil().setWidth(1.0),
                                ), //(x,y)
                                blurRadius: ScreenUtil().setWidth(3.0),
                              ),
                            ],
                            color: Colors.white),
                        child: checked
                            ? Icon(
                                Icons.check,
                                color: Color(0xFFAB2929),
                                size: ScreenUtil().setHeight(25),
                              )
                            : Container(),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(12),
                      ),
                      Text(
                        "I agree to all terms of use",
                        style: const TextStyle(
                          fontFamily: "Poppin-semibold",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Spacer(),

              checked
                ? Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(17)),
                    child: PrimaryButtonWidget(color: Color(0xFFAB2929), title: 'I AGREE', isLoading: false, function: ()=> {})
                  )
                : Container(),
              
            ],
          ),
        ),
      
    );
  }
}
