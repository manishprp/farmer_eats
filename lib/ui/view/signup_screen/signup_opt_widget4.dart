import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../../../constants/colors.dart';
import '../../../model/datamodel/register_model.dart';
import '../../../model/weekday.dart';
import '../../../model/weekday_data.dart';
import '../../../routes/app_routes.dart';
import '../../../viewmodel/signup_bloc/bloc/signup_bloc_bloc.dart';
import '../common/app_button_widget.dart';

List<List<String>> listOfWeek = [
  [],
  [],
  [],
  [],
  [],
  [],
  [],
];

bool isFifthSelected = false;
bool isFirstSelected = false;
bool isFourthSelected = false;
bool isSecondSelected = false;
bool isThirdSelected = false;
List<Widget> signupDetailsWidgetList = [];
int currentSelectedIndex = 0;
var weekDay = [
  WeekDayData(weekday: WeekDay.M),
  WeekDayData(weekday: WeekDay.T),
  WeekDayData(weekday: WeekDay.W),
  WeekDayData(weekday: WeekDay.Th),
  WeekDayData(weekday: WeekDay.F),
  WeekDayData(weekday: WeekDay.S),
  WeekDayData(weekday: WeekDay.Su),
];

class WeekBoxWidget extends StatefulWidget {
  final WeekDayData weekDay;
  final Color bgColor;
  const WeekBoxWidget({
    super.key,
    required this.weekDay,
    this.bgColor = AppColors.blackFont,
  });

  @override
  State<WeekBoxWidget> createState() => _WeekBoxWidgetState();
}

class SignUpScreenStep4Widget extends StatefulWidget {
  const SignUpScreenStep4Widget({super.key});

  @override
  State<SignUpScreenStep4Widget> createState() =>
      _SignUpScreenStep4WidgetState();
}

class DayWidget extends StatefulWidget {
  final double width;
  bool isSelected;
  final Widget child;
  final Color selectedColor;
  final Function(bool isSelected) onSelectionChanged;

  DayWidget(
      {super.key,
      required this.width,
      required this.child,
      this.selectedColor = AppColors.yellorangish,
      required this.onSelectionChanged,
      this.isSelected = false});

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
        widget.onSelectionChanged(widget.isSelected);
      },
      child: Container(
          width: widget.width,
          height: 48,
          decoration: BoxDecoration(
            color: widget.isSelected
                ? widget.selectedColor
                : AppColors.blackFont.withOpacity(0.08),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: widget.child),
    );
  }
}

class _SignUpScreenStep4WidgetState extends State<SignUpScreenStep4Widget> {
  @override
  Widget build(BuildContext context) {
    final sharedObjectBloc = GetIt.I<SignupBlocBloc>();

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(AppIcons.backArrowIcon)),
          ),
          AppButton(
            onTap: () {
              // inserting data
              var businessHours = BusinessHours(
                mon: listOfWeek[0],
                tue: listOfWeek[1],
                wed: listOfWeek[2],
                thu: listOfWeek[3],
                fri: listOfWeek[4],
                sat: listOfWeek[5],
                sun: listOfWeek[6],
              );
              sharedObjectBloc.sharedObject.businessHours = businessHours;

              sharedObjectBloc.sharedObject.deviceToken =
                  Appstrings.deviceToken;
              sharedObjectBloc.sharedObject.type = Appstrings.type;
              sharedObjectBloc.sharedObject.socialId = Appstrings.socialId;
              sharedObjectBloc.sharedObject.role = Appstrings.role;

              sharedObjectBloc.add(SignupEvent());

              //end
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
      body: BlocConsumer<SignupBlocBloc, SignupBlocState>(
        bloc: sharedObjectBloc,
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.of(context).pushNamed(AppRoutes.signupDone);
          }
          if (state is SignupFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(Appstrings.somethingWentWrong),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SignupLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
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
                                      currentSelectedIndex = index;
                                      var prevSelected = weekDay
                                          .where(
                                              (element) => element.isSelected)
                                          .toList()
                                          .firstOrNull;

                                      for (int i = 0; i < weekDay.length; i++) {
                                        weekDay[i].isSelected = false;
                                        weekDay[i].isDone =
                                            listOfWeek[i].isNotEmpty;
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
                            isSelected: listOfWeek[currentSelectedIndex]
                                .contains(Appstrings.eightam10am),
                            onSelectionChanged: (isSelected) {
                              isFirstSelected = isSelected;
                              selectedDayTimingItem(
                                  isFirstSelected, Appstrings.eightam10am);
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
                            isSelected: listOfWeek[currentSelectedIndex]
                                .contains(Appstrings.temAm1Pm),
                            onSelectionChanged: (isSelected) {
                              isSecondSelected = isSelected;
                              selectedDayTimingItem(
                                  isSecondSelected, Appstrings.temAm1Pm);
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
                              isSelected: listOfWeek[currentSelectedIndex]
                                  .contains(Appstrings.onePm4Pm),
                              onSelectionChanged: (isSelected) {
                                isThirdSelected = isSelected;
                                selectedDayTimingItem(
                                    isThirdSelected, Appstrings.onePm4Pm);
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
                              isSelected: listOfWeek[currentSelectedIndex]
                                  .contains(Appstrings.fourPm7pm),
                              onSelectionChanged: (isSelected) {
                                isFourthSelected = isSelected;
                                selectedDayTimingItem(
                                    isFourthSelected, Appstrings.fourPm7pm);
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
                          isSelected: listOfWeek[currentSelectedIndex]
                              .contains(Appstrings.sevenPm10pm),
                          onSelectionChanged: (isSelected) {
                            isFifthSelected = isSelected;
                            selectedDayTimingItem(
                                isFifthSelected, Appstrings.sevenPm10pm);
                          },
                          width: width / 2 - 21,
                          child: Center(
                              child: Text(
                            Appstrings.sevenPm10pm,
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
          );
        },
      ),
    );
  }

  void selectedDayTimingItem(bool isNumSelected, String timingItem) {
    if (isNumSelected &&
        !listOfWeek[currentSelectedIndex].contains(timingItem)) {
      listOfWeek[currentSelectedIndex].add(timingItem);
    }
    if (!isNumSelected &&
        listOfWeek[currentSelectedIndex].contains(timingItem)) {
      listOfWeek[currentSelectedIndex].remove(timingItem);
    }
  }
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
        color: widget.weekDay.isSelected
            ? AppColors.buttonColor
            : widget.weekDay.isDone
                ? widget.bgColor.withOpacity(0.08)
                : AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          widget.weekDay.weekday?.name ?? "",
          style: kTS16FW400Black.copyWith(
            color: widget.weekDay.isSelected
                ? AppColors.white
                : widget.weekDay.isDone
                    ? AppColors.black
                    : widget.bgColor.withOpacity(0.08),
          ),
        ),
      ),
    );
  }
}
