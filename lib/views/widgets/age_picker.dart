import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:training/constants/colors.dart';
import 'package:training/controllers/personal_info.dart';
import '../../utils/size_config.dart';

class AgePicker extends StatefulWidget {
  const AgePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  @override
  Widget build(BuildContext context) {
    final cont = Get.find<PersonalInfoCont>();
    return Obx(
      () => Center(
        child: NumberPicker(
            value: cont.selectedAge.value,
            minValue: 14,
            maxValue: 40,
            textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.textMultiplier * 3,
                color: Colors.grey.shade500),
            itemHeight: SizeConfig.heightMultiplier * 8,
            selectedTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.textMultiplier * 3,
                color: AppColors.primaryClr),
            onChanged: (value) {
              cont.selectedAge.value = value;
              cont.age.text = value.toString();
            }),
      ),
    );
  }
}
