import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoTileWidget({
    super.key, 
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(6)),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Color(0xFF252B37).withValues(alpha: 0.6)),
          SizedBox(width: ScreenUtil().setWidth(10)),
          Text(
            "$title:",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600, color: Color(0xFF252B37)),
          ),
          SizedBox(width: ScreenUtil().setWidth(6)),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}