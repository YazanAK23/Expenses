import 'package:expenses/Models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

    final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expense.title , style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('\$${expense.amount.toStringAsFixed(2)}'),
                     const Spacer(),

                    Row(
                  children: [
                    Icon(categoryIcon[expense.category]),
                    // const CircularProgressIndicator.adaptive(),
                 
                   const SizedBox(width: 10),

                    Text(expense.formateDate, 
                    )
                  ],
                )
                      
                  ],
               
                ),
                
              ],
            ),
          ],
         
        ), 
        padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 15),
      ),
    );
  }
}