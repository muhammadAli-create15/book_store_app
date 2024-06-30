import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key, required this.title}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();

  final String title;
}

class _CreditCardState extends State<CreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      expiryDate = data.expiryDate;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      isCvvFocused = data.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange:
                    (CreditCardBrand) {}, // No need to do anything here
              ),
              CreditCardForm(
                formKey: formKey,
                onCreditCardModelChange: onCreditCardModelChange,
                // themeColor: Colors.blue,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    // Perform the desired action, such as submitting the credit card info
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Credit Card information is valid!')),
                    );
                  }
                },
                child: Text('Validate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
