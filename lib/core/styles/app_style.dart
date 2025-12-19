import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static final BoxShadow primaryShowStyle = BoxShadow(
    color: Color(0xFF252B37).withValues(alpha: 0.4),
    offset: Offset(4, 4),
    blurRadius: ScreenUtil().setWidth(6.0),
  );
  static final BoxShadow softShowStyle = BoxShadow(
    color: Color(0xFF252B37).withValues(alpha: 0.3),
    offset: Offset(2, 2),
    blurRadius: ScreenUtil().setWidth(10.0),
  );

  static final ButtonStyle primaryElevatedBtnStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shadowColor: Color(0xFFAB2929),
    elevation: ScreenUtil().setWidth(6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(8)),
    ),
    padding: EdgeInsets.all(
      ScreenUtil().setHeight(17),
    ),
  );

  static final ButtonStyle secElevatedBtnStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shadowColor: Color(0xFF252B37).withValues(alpha: 0.3),
    elevation: ScreenUtil().setWidth(6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(8)),
    ),
    padding: EdgeInsets.all(
      ScreenUtil().setHeight(10),
    ),
  );

  // static final BoxShadow strong = BoxShadow(
  //   color: const Color(0xFF252B37).withOpacity(0.6),
  //   offset: const Offset(6, 6),
  //   blurRadius: ScreenUtil().setWidth(10),
  // );
}
