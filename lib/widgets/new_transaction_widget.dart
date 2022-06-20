import 'package:flutter/material.dart';

class NewTransactionWidget extends StatefulWidget {
  final Function(String, double) addNewTxn;

  NewTransactionWidget(this.addNewTxn, {Key? key}) : super(key: key);

  @override
  State<NewTransactionWidget> createState() => _NewTransactionWidgetState();
}

class _NewTransactionWidgetState extends State<NewTransactionWidget> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _addNew() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (!enteredTitle.isEmpty && enteredAmount > 0)
      widget.addNewTxn(
        enteredTitle,
        enteredAmount,
      );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              textCapitalization: TextCapitalization.sentences,
              controller: titleController,
              textInputAction: TextInputAction.next,
              // onChanged: (String val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => _addNew(),
            ),
            TextButton(
              onPressed: _addNew,
              child: Text('Add transaction'),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
