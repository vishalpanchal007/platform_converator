import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'mic/color.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String ampm = "AM";
  TimeOfDay? time = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();
  TextEditingController dateInput = TextEditingController();
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 20, color: AppColors.commonColor),
                          ),
                        ),
                        Text(
                          DateFormat('dd,MMM-yyyy').format(_dateTime),
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.commonColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: OutlinedButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: _dateTime,
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2100));
                                if (pickedDate != null) {
                                  pickedDate;
                                  setState(() {
                                    _dateTime = pickedDate;
                                  });
                                }
                              },
                              child: Text(
                                'Change Date',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 130),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.commonColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Time",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.commonColor),
                                ),
                              ),
                              Text(
                                time!.format(context),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.commonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            children: [
                              Container(
                                child: Center(
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      var pickedtime = await showTimePicker(
                                          context: context, initialTime: time!);
                                      if (pickedtime != null) {
                                        pickedtime.format(context);
                                        setState(() {
                                          time = pickedtime!;
                                        });
                                      }
                                    },
                                    child: Text(
                                      'Change Time',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 130),
                                      ),
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          AppColors.commonColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
