import 'package:expenses/Widgets/charts/chart.dart';
import 'package:expenses/Widgets/expanses_list/expenses_list.dart';
import 'package:expenses/Widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../Models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key,});

  @override
  State<Expenses> createState() => _ExpensesState();
}


class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = [
    Expense(
        category: Category.work,
        title: "Flutter Course ",
        amount: 29,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: "Cinema ",
        amount: 9.71,
        date: DateTime.now()),
    Expense(
        category: Category.food,
        title: "BreakFast ",
        amount: 31.3,
        date: DateTime.now()),
  ];

  void _addExpense(Expense expense){
    setState(() {
      _registerdExpenses.add(expense);
    });

  }

   void _removeExpense(Expense expense){
    setState(() {
      _registerdExpenses.remove(expense);
    });
  }
  @override
  Widget build(BuildContext context) {

    var width  = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Flutter Expense Tracker'),
        actions:  [IconButton(onPressed: () {
          showModalBottomSheet(context: context, builder: (c)=> NewExpense(onAddExpense: _addExpense,), 
          useSafeArea: true,
          isScrollControlled: true,
          );

        }, icon: Icon(Icons.add))], 
      ),
      body: Center(
        child: width < 600?
        Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
           Expanded(child: Chart(expenses: _registerdExpenses)),
               Expanded(  
                 child: ExpensesList(
                   onRemoveExpense: _removeExpense,
                 
                  Expenses: _registerdExpenses, 
                   
                  ),
                
               )
            
           
          ],
        ) : 
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
           Expanded(child: Chart(expenses: _registerdExpenses)),
               Expanded(
                 child: ExpensesList(
                   onRemoveExpense: _removeExpense,
                 
                  Expenses: _registerdExpenses, 
                   
                  ),
         )
            
           
          ],
        )
      ),
    );
  }
}


