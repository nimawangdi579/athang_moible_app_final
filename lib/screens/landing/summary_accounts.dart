import 'package:athang_expense_tracker/base/style/text_styles.dart';
import 'package:athang_expense_tracker/domain/account/account_model.dart';
import 'package:athang_expense_tracker/domain/account/account_repo.dart';
import 'package:flutter/material.dart';

import '../../screens/common/account_card.dart';

class SummaryAccount extends StatefulWidget {
  const SummaryAccount({super.key});

  @override
  State<SummaryAccount> createState() => _SummaryAccountState();
}

class _SummaryAccountState extends State<SummaryAccount> {
  List<AccountModel> accounts = [];

  @override
  void initState() {
    loadData();
  }

  Future loadData() async {
    final res = await AccountRepo().loadMyAccounts();
    setState(() {
      accounts = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // color: Colors.red,
      margin: EdgeInsets.only(bottom: 16),
      // padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Current Balance', style: TypoStyles().kSectionHeader),
          ),
          Container(
              // color: Colors.white,
              height: 200,
              margin: EdgeInsets.only(bottom: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: accounts
                      .map(
                        (val) => AccountCard(val),
                      )
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }
}
