import 'dart:convert';

import 'package:athang_expense_tracker/base/style/text_styles.dart';
import 'package:athang_expense_tracker/domain/landing/transaction_model.dart';
import 'package:athang_expense_tracker/domain/landing/transaction_repo.dart';
import 'package:athang_expense_tracker/plugins/http.dart';
import 'package:flutter/material.dart';

class SummaryTransactions extends StatefulWidget {
  const SummaryTransactions({super.key});

  @override
  State<SummaryTransactions> createState() => _SummaryTransactionsState();
}

class _SummaryTransactionsState extends State<SummaryTransactions> {
  List<TransactionModel> transactions = [];
  @override
  void initState() {
    // super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final res = await loadTransactionData();
    setState(() {
      transactions = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Recent transactions',
              style: TypoStyles().kSectionHeader,
            ),
          ),
          Container(
            child: Column(
              children: transactions
                  .map(
                    (transaction) => ListTile(
                      title: Text(transaction.title),
                      subtitle: Text(transaction.note),
                      trailing: Text('Nu. ${transaction.amount}',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: transaction.type == 'EXPENSE'
                                  ? Colors.red
                                  : Colors.green)),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
