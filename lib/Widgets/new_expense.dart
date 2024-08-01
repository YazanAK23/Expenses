import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../Models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat().add_yMd();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.travel;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void _ShowDialog(){
    Platform.isIOS ? 
                            showCupertinoDialog(context: context, builder: (ctx)=> CupertinoAlertDialog(
                              title: Text('Erorr'),
                            content: Text('invalid data'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: Text('ok'),
                              )
                            ],
                            ),)
                        // log('Erorr');

                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        :showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Erorr'),
                            content: Text('invalid data'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: Text('ok'),
                              )
                            ],
                          ),
                        );
  }

  // void _saveTitleInput(String inputValue){
  //   setState(() {
  //     _title = inputValue;
  //     log(_title)
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                // onChanged: _saveTitleInput,
                controller: _titleController,

                maxLength: 50,
                decoration: InputDecoration(label: Text("Title")),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      // onChanged: _saveTitleInput,
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      maxLength: 50,
                      decoration: InputDecoration(
                        label: Text("Amount"),
                        prefixText: '\$ ',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null
                            ? "No Date Selected"
                            : formatter.format(_selectedDate!)),
                        IconButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final firstDate =
                                DateTime(now.year - 1, now.month, now.day);
                            final DateTime? pickDate = await showDatePicker(
                                context: context,
                                firstDate: firstDate,
                                lastDate: now);
                            setState(() {
                              _selectedDate = pickDate;
                            });
                          },
                          icon: Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e.name),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (newCat) {
                        if (newCat == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = newCat;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final double? enterdAmount =
                          double.tryParse(_amountController.text);
                      final bool amountIsInValid =
                          enterdAmount == null || enterdAmount <= 0;
                      // const snackBar = SnackBar(content: Text('Error'),);

                      if (_titleController.text.trim().isEmpty ||
                          amountIsInValid ||
                          _selectedDate == null) {
                            _ShowDialog();
                      } else {
                        widget.onAddExpense(
                          Expense(
                              title: _titleController.text,
                              amount: enterdAmount!,
                              date: _selectedDate!,
                              category: _selectedCategory),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("save Expense"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
