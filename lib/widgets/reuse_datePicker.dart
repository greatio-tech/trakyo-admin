import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';

class ReusableDatePicker extends StatefulWidget {
  final Function(DateTime) onSave;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String dateFormat;
  final String selectDateButtonText;
  final String saveButtonText;
  final bool? loading;

  const ReusableDatePicker({
    Key? key,
    required this.onSave,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dateFormat = 'yyyy-MM-dd',
    this.selectDateButtonText = 'Select date',
    this.saveButtonText = 'Save',
    this.loading,
  }) : super(key: key);

  @override
  _ReusableDatePickerState createState() => _ReusableDatePickerState();
}

class _ReusableDatePickerState extends State<ReusableDatePicker> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: widget.firstDate!,
      lastDate: widget.lastDate!,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextFiledWidget(
          controller: TextEditingController(
            text: DateFormat('dd-MM-yyyy').format(selectedDate),
          ),
          readOnly: true,
          height: 56.h,
        ),
        const VSpace(20),
        ButtonWidget(
          text: widget.selectDateButtonText,
          onTap: () => _selectDate(context),
          color: AppColors.primaryColor,
          textColor: AppColors.textWhiteColor,
        ),
        const VSpace(10),
        ButtonWidget(
          text: widget.saveButtonText,
          onTap: () => widget.onSave(selectedDate),
          color: AppColors.primaryColor,
          textColor: AppColors.textWhiteColor,
          isLoading: widget.loading,
        ),
      ],
    );
  }
}
