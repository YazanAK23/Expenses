import 'dart:math';
import 'dart:developer' as dv;
import 'package:expenses/Models/expense.dart';
import 'package:expenses/Widgets/charts/chartbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  get maxtotalExpense {
    double maxtotalExpense = 0;

    for (var element in buckets) {
      if (element.totalExpenses > maxtotalExpense) {
        maxtotalExpense = element.totalExpenses;
      }
    }
    return maxtotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return LayoutBuilder(builder: (context, constraints) {
      dv.log(constraints.minHeight.toString());
      dv.log(constraints.maxHeight.toString());
      dv.log(constraints.minHeight.toString());
      dv.log(constraints.maxHeight.toString());
      return Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        width: double.infinity,
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0.0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  for (final ele in buckets)
                    Chartbar(
                        fill: ele.totalExpenses == 0
                            ? 0
                            : ele.totalExpenses / maxtotalExpense),
                ],
              ),
            ),
            constraints.minHeight < 200
                ? Container()
                : const SizedBox(
                    height: 12,
                  ),
            SizedBox(
              height: 10,
            ),
            constraints.minHeight < 200
                ? Container()
                : Row(
                    children: buckets
                        .map((e) => Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  categoryIcon[e.category],
                                  color: isDarkMode
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.7),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
          ],
        ),
      );
    });
  }
}
