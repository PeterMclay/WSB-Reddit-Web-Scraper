import 'package:flutter/material.dart';
import 'package:flutter_front_end/widgets/layout_template/layout_template.dart';
import 'package:flutter_front_end/widgets/layout_template/layout_template_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return LayoutTemplateMobile();
      } else if (sizingInformation.deviceScreenType ==
          DeviceScreenType.tablet) {
        return LayoutTemplate();
      } else {
        return LayoutTemplate();
      }
    });
  }
}
