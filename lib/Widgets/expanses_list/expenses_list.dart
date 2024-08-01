  import 'package:expenses/Models/expense.dart';
import 'package:expenses/Widgets/expanses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.Expenses,
    required this.onRemoveExpense,
  }) ;

  final List<Expense> Expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     itemCount: Expenses.length,
     itemBuilder: (context, index) => Dismissible(
      background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.7),
      margin: EdgeInsets.symmetric(
        horizontal: Theme.of(context).cardTheme.margin!.horizontal,
      )
      ),
      
      key: ValueKey(Expenses[index]),
      onDismissed: (direction)=> onRemoveExpense(Expenses[index]),
      child: ExpensesItem(expense: Expenses[index],
      )),
     
     );
  }
}