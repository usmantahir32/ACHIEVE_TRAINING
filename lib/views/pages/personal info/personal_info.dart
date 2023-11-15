import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/colors.dart';
import 'package:training/constants/icons.dart';
import 'package:training/controllers/personal_info.dart';
import 'package:training/views/pages/auth/change%20email/change_email.dart';
import 'package:training/views/pages/personal%20info/components/text_field.dart';
import 'package:training/views/widgets/age_picker.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});

  final cont = Get.put(PersonalInfoCont());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppbar(title: ""),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.y(2),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Personal Info",
                  style: textTheme.headlineLarge!.copyWith(
                    fontSize: SizeConfig.textMultiplier * 3.2,
                    color: AppColors.primaryClr,
                  ),
                ),
              ),
              Spacing.y(2),
              Text(
                "Name",
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
              Spacing.y(.5),
              PersonalInfoTextField(
                controller: cont.name,
              ),
              Text(
                "Email",
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
              Spacing.y(.5),
              PersonalInfoTextField(
                controller: cont.email,
                readOnly: true,
                onTap: () {
                  Get.to(() => ChangeEmailScreen(),
                      transition: Transition.rightToLeft);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 44,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Gender",
                          style: textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Spacing.y(.5),
                        PersonalInfoTextField(
                          controller: cont.gender,
                          readOnly: true,
                          onTap: () {
                            Get.bottomSheet(
                              ChooseGenderBottomSheet(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 44,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Age",
                          style: textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Spacing.y(.5),
                        PersonalInfoTextField(
                          controller: cont.age,
                          readOnly: true,
                          onTap: () {
                            Get.bottomSheet(
                              AgePickerBottomSheet(),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "Contact",
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
              Spacing.y(.5),
              PersonalInfoTextField(
                controller: cont.number,
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgePickerBottomSheet extends StatefulWidget {
  const AgePickerBottomSheet({
    super.key,
  });

  @override
  State<AgePickerBottomSheet> createState() => _AgePickerBottomSheetState();
}

class _AgePickerBottomSheetState extends State<AgePickerBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Container(
        width: SizeConfig.widthMultiplier * 100,
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 2,
          horizontal: SizeConfig.widthMultiplier * 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Age",
              style: textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Spacing.y(3),
            const AgePicker()
          ],
        ),
      ),
    );
  }
}

class ChooseGenderBottomSheet extends StatefulWidget {
  const ChooseGenderBottomSheet({
    super.key,
  });

  @override
  State<ChooseGenderBottomSheet> createState() =>
      _ChooseGenderBottomSheetState();
}

class _ChooseGenderBottomSheetState extends State<ChooseGenderBottomSheet> {
  final cont = Get.find<PersonalInfoCont>();
  List<String> gendersTitle = ["MALE", "FEMALE"];
  List<String> genderIcons = [AppIcons.male, AppIcons.female];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Container(
        height: SizeConfig.heightMultiplier * 25,
        width: SizeConfig.widthMultiplier * 100,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 4,
            vertical: SizeConfig.heightMultiplier * 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Gender",
              style: textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Spacing.y(3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                  gendersTitle.length,
                  (index) => InkWell(
                    onTap: () {
                      cont.selectedGender.value = index;

                      if (cont.selectedGender.value == 0) {
                        cont.gender.text == "Male";
                      } else {
                        cont.gender.text = "Female";
                      }
                      print(cont.selectedGender.value);
                      // setState(() {});
                    },
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 6,
                          width: SizeConfig.widthMultiplier * 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300),
                          alignment: Alignment.center,
                          child: Image.asset(
                            genderIcons[index],
                            height: index == 0
                                ? SizeConfig.imageSizeMultiplier * 8
                                : SizeConfig.imageSizeMultiplier * 6,
                            color: cont.selectedGender.value == index
                                ? Colors.black
                                : AppColors.grey,
                          ),
                        ),
                        Text(
                          gendersTitle[index],
                          style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: cont.selectedGender.value == index
                                  ? Colors.black
                                  : AppColors.grey),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
