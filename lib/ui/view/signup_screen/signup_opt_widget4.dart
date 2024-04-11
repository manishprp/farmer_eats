import 'package:farmer_eats/model/weekday.dart';
import 'package:farmer_eats/model/weekday_data.dart';
import 'package:farmer_eats/routes/app_routes.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_spaces.dart';
import '../../../constants/app_textstyles.dart';
import '../common/app_button_widget.dart';

class SignUpScreenStep4Widget extends StatefulWidget {
  const SignUpScreenStep4Widget({super.key});

  @override
  State<SignUpScreenStep4Widget> createState() =>
      _SignUpScreenStep4WidgetState();
}

var weekDay = [
  WeekDayData(weekday: WeekDay.M),
  WeekDayData(weekday: WeekDay.T),
  WeekDayData(weekday: WeekDay.W),
  WeekDayData(weekday: WeekDay.Th),
  WeekDayData(weekday: WeekDay.F),
  WeekDayData(weekday: WeekDay.S),
  WeekDayData(weekday: WeekDay.Su),
];

bool isFirstSelected = false;
bool isSecondSelected = false;
bool isThirdSelected = false;
bool isFourthSelected = false;
bool isFifthSelected = false;

class _SignUpScreenStep4WidgetState extends State<SignUpScreenStep4Widget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: IconButton(
                onPressed: () {}, icon: Image.asset(AppIcons.backArrowIcon)),
          ),
          AppButton(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.signupDone);
            },
            child: const Center(
              child: Text(
                Appstrings.continueText,
                style: kTS18White,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Appstrings.farmerEats,
                    style: kTS16SpBlack,
                  ),
                  AppSizeConstants.heightConstants[40],
                  Text(
                    Appstrings.signup4Of4,
                    style: kTS14SpLightBlack.copyWith(
                        color: AppColors.black.withOpacity(0.3)),
                  ),
                  AppSizeConstants.heightConstants[10],
                  const Text(
                    Appstrings.businessHours,
                    style: kTS32SpBlackFont,
                  ),
                  AppSizeConstants.heightConstants[24],
                  Text(
                    Appstrings.chooseTheHoursYourFarmIsOpenForPickups,
                    style: kTS14SpUnderLineBlack.copyWith(
                        color: AppColors.black.withOpacity(0.3),
                        decoration: TextDecoration.none),
                  ),
                  AppSizeConstants.heightConstants[30],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Appstrings.attackProofOfRegistration,
                        style: kTS14SpUnderLineBlack.copyWith(
                            color: AppColors.blackFont,
                            decoration: TextDecoration.none),
                      ),
                      AppButton(
                        onTap: () {},
                        borderRadius: 26.5,
                        width: 53,
                        height: 53,
                        child: Center(child: Image.asset(AppIcons.camIcon)),
                      )
                    ],
                  ),
                  AppSizeConstants.heightConstants[40],
                  // weekdays
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: SizedBox(
                      height: 37,
                      width: width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  var prevSelected = weekDay
                                      .where((element) => element.isSelected)
                                      .toList()
                                      .firstOrNull;

                                  for (var element in weekDay) {
                                    element.isSelected = false;
                                  }
                                  weekDay[index].isSelected =
                                      !weekDay[index].isSelected;

                                  if (prevSelected != null) {
                                    if (prevSelected.weekday !=
                                        weekDay[index].weekday) {
                                      isFirstSelected = false;
                                      isSecondSelected = false;
                                      isThirdSelected = false;
                                      isFourthSelected = false;
                                      isFifthSelected = false;
                                    }
                                  }

                                  // weekDay[index] = WeekDayData(
                                  //   weekday: selected.weekday,
                                  //   isSelected: !selected.isSelected,
                                  //   isDone: selected.isDone,
                                  // );
                                });
                              },
                              child: WeekBoxWidget(
                                weekDay: weekDay[index],
                              ),
                            );
                          },
                          itemCount: 7),
                    ),
                  ),
                  AppSizeConstants.heightConstants[20],
                  // timings
                  Row(
                    children: [
                      DayWidget(
                        onSelectionChanged: (isSelected) {
                          isFirstSelected = isSelected;
                        },
                        width: width / 2 - 21,
                        child: Center(
                          child: Text(
                            Appstrings.eightam10am,
                            style: kTS14SpUnderLineBlack.copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      AppSizeConstants.widthConstants[9],
                      DayWidget(
                        onSelectionChanged: (isSelected) {
                          isSecondSelected = isSelected;
                        },
                        width: width / 2 - 21,
                        child: Center(
                          child: Text(
                            Appstrings.temAm1Pm,
                            style: kTS14SpUnderLineBlack.copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  AppSizeConstants.heightConstants[9],
                  Row(
                    children: [
                      DayWidget(
                          onSelectionChanged: (isSelected) {
                            isThirdSelected = isSelected;
                          },
                          width: width / 2 - 21,
                          child: Center(
                              child: Text(
                            Appstrings.onePm4Pm,
                            style: kTS14SpUnderLineBlack.copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ))),
                      AppSizeConstants.widthConstants[9],
                      DayWidget(
                          onSelectionChanged: (isSelected) {
                            isFourthSelected = isSelected;
                          },
                          width: width / 2 - 21,
                          child: Center(
                              child: Text(
                            Appstrings.fourPm7pm,
                            style: kTS14SpUnderLineBlack.copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ))),
                    ],
                  ),
                  AppSizeConstants.heightConstants[9],
                  DayWidget(
                      onSelectionChanged: (isSelected) {
                        isFifthSelected = isSelected;
                      },
                      width: width / 2 - 21,
                      child: Center(
                          child: Text(
                        Appstrings.fourPm7pm,
                        style: kTS14SpUnderLineBlack.copyWith(
                          decoration: TextDecoration.none,
                        ),
                      ))),

                  AppSizeConstants.heightConstants[49],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class DayWidget extends StatefulWidget {
  const DayWidget(
      {super.key,
      required this.width,
      required this.child,
      this.selectedColor = AppColors.yellorangish,
      required this.onSelectionChanged});

  final double width;
  final Widget child;
  final Color selectedColor;

  final Function(bool isSelected) onSelectionChanged;

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onSelectionChanged(isSelected);
      },
      child: Container(
          width: widget.width,
          height: 48,
          decoration: BoxDecoration(
              color: isSelected
                  ? widget.selectedColor
                  : AppColors.blackFont.withOpacity(0.08),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: widget.child),
    );
  }
}

class WeekBoxWidget extends StatefulWidget {
  const WeekBoxWidget(
      {super.key, required this.weekDay, this.bgColor = AppColors.blackFont});
  final WeekDayData weekDay;
  final Color bgColor;

  @override
  State<WeekBoxWidget> createState() => _WeekBoxWidgetState();
}

class _WeekBoxWidgetState extends State<WeekBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      height: 37,
      width: 36,
      decoration: BoxDecoration(
        border: Border.all(
          width: (!widget.weekDay.isDone && !widget.weekDay.isSelected) ? 1 : 0,
          color: AppColors.blackFont.withOpacity(
            0.08,
          ),
        ),
        color: widget.weekDay.isDone
            ? widget.bgColor.withOpacity(0.08)
            : widget.weekDay.isSelected
                ? AppColors.buttonColor
                : AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          widget.weekDay.weekday?.name ?? "",
          style: kTS16FW400Black.copyWith(
            color: widget.weekDay.isDone
                ? AppColors.black
                : widget.weekDay.isSelected
                    ? AppColors.white
                    : widget.bgColor.withOpacity(0.08),
          ),
        ),
      ),
    );
  }
}

List<Widget> signupDetailsWidgetList = [];
