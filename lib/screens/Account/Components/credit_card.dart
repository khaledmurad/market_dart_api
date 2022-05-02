import 'dart:convert';

// import 'package:credit_card/credit_card_form.dart';
// import 'package:credit_card/credit_card_model.dart';
// import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Models/profile_model.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/providers/profile_provider.dart';
import 'package:spree/screens/Account/Components/add_new_card.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:toast/toast.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool defaultCard = false;
  var type = '';
  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  bool _validate4 = false;
  List savedCardsList = [
    {
      'cardType': 'Visa',
      'cardNumber': '4678 9109 8768 9540',
      'isDefault': true
    },
    {
      'cardType': 'Mastercard',
      'cardNumber': '5260 9109 8768 9540',
      'isDefault': false
    },
    {
      'cardType': 'American Express',
      'cardNumber': '3478 9109 8768 9540',
      'isDefault': false
    }
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<dynamic> cards = [];
  @override
  void initState() {
    super.initState();

    StripePayment.setOptions(
      StripeOptions(
          publishableKey:
              "pk_test_51HAVtEHT5fE06PMkM5d8mhS4fppSU8RcU3NPdtCeXRBXTMWRYeWua4ea9bM0mnsTLYQcCCs9Kyy08EdWl78viinl00cQt1howv",
          merchantId: "test",
          androidPayMode: 'test'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              screenPop(context);
            },
          ),
          // actions: [
          //   IconButton(
          //       icon: Icon(Icons.credit_card),
          //       onPressed: () async {
          //         print("call");
          //         CallApi().getItemsToCart(context: context).then((value) {
          //           print(value);
          //         });
          //       })
          // ],
          title: Text(
            "Credit cards",
            style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(
              //   padding: EdgeInsets.all(size.width * 0.05),
              //   child:
              //
              //   CreditCardWidget(
              //     cardBgColor: Colors.blue,
              //     cardNumber: cardNumber,
              //     expiryDate: expiryDate,
              //     cardHolderName: cardHolderName,
              //     cvvCode: cvvCode,
              //     showBackView: isCvvFocused,
              //     textStyle: TextStyle(
              //         color: Colors.white, fontWeight: FontWeight.w600),
              //     animationDuration: Duration(milliseconds: 1000),
              //     // width: size.width*0.8,
              //     // height: size.height*0.25,
              //     //true when you want to show cvv(back) view
              //   ),
              // ),
              // CreditCardForm(
              //   key: formKey,
              //   themeColor: Color(0xff0059ff),
              //   onCreditCardModelChange: (CreditCardModel data) {
              //     setState(() {
              //       isCvvFocused = data.isCvvFocused == null ? '' : data.isCvvFocused;
              //       expiryDate = data.expiryDate == null ? '' : data.expiryDate;
              //       cvvCode = data.cvvCode == null ? '' : data.cvvCode;
              //       cardHolderName = data.cardHolderName == null ? '' : data.cardHolderName;
              //       cardNumber = data.cardNumber;
              //       type = detectCCType(cardNumber).toString().split('.')[1];
              //       type = '${type[0].toUpperCase()}${type.substring(1)}';
              //       cardNumber.isEmpty ? _validate1 = true : _validate1 = false;
              //       expiryDate.isEmpty ? _validate2 = true : _validate2 = false;
              //       cvvCode.isEmpty ? _validate3 = true : _validate3 = false;
              //       cardHolderName.isEmpty ? _validate4 = true : _validate4 = false;
              //
              //
              //
              //     });
              //   },
              //   cardNumberDecoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Number',
              //     hintText: 'XXXX XXXX XXXX XXXX',
              //     suffix: Text(type.toString()),
              //     errorText: _validate1 ? 'Card no. can\'t Be Empty' : null,
              //   ),
              //   expiryDateDecoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Expired Date',
              //     hintText: 'XX/XX',
              //     errorText: _validate2 ? 'Expiry date can\'t Be Empty' : null,
              //   ),
              //   cvvCodeDecoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'CVV',
              //     hintText: 'XXX',
              //     errorText: _validate3 ? 'CVV can\'t Be Empty' : null,
              //   ),
              //   cardHolderDecoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Card Holder',
              //     errorText: _validate4 ? 'Card holder can\'t Be Empty' : null,
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //     primary: Colors.blue,
              //   ),
              //   child: Container(
              //     height: size.height * 0.04,
              //     alignment: Alignment.center,
              //     width: size.width * 0.6,
              //     margin: const EdgeInsets.all(8),
              //     child: Text('ADD CARD',
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontWeight: FontWeight.w600,
              //             letterSpacing: 1,
              //             fontSize: size.width * 0.04)),
              //   ),
              //   onPressed: () {
              //     if (cardNumber.length > 15 &&
              //         expiryDate.length > 4 &&
              //         cardHolderName.length > 1 &&
              //         cvvCode.length > 2) {
              //       final CreditCard testCard = CreditCard(
              //         number: '$cardNumber',
              //         expMonth: int.parse(expiryDate.split('/').first),
              //         expYear: int.parse(expiryDate.split('/').last),
              //         cvc: '$cvvCode',
              //         name: '$cardHolderName',
              //         currency: 'usd',
              //       );
              //
              //       setState(() {
              //         savedCardsList.add({
              //           'cardType': type.toString(),
              //           'cardNumber': cardNumber.toString(),
              //           'isDefault': defaultCard
              //         });
              //       });
              //
              //
              //       StripePayment.createTokenWithCard(
              //         testCard,
              //       ).then((token) {
              //         final snackBar =
              //             SnackBar(content: Text('Card added successfully'));
              //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //         print(token.tokenId);
              //
              //         CallApi().addCard(
              //             context: context, name: cardHolderName.toString(), stripeToken: token.tokenId.toString());
              //       }).catchError((error) {
              //         print(error);
              //       });
              //     } else {
              //       Toast.show(
              //         "Invalid card",
              //         context,
              //         gravity: 1,
              //       );
              //     }
              //   },
              // ),
              //
              // SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Checkbox(
              //       checkColor: Colors.white,
              //       activeColor: Colors.black,
              //       value: defaultCard,
              //
              //       onChanged: (bool value) {
              //         setState(() {
              //           defaultCard = value;
              //         });
              //       },
              //     ),
              //     Text('Save this card as default card',
              //       // style: TextStyle(
              //       //     fontSize: 20,
              //       //     fontWeight: FontWeight.normal
              //       // ),
              //
              //     ),
              //
              //   ],
              // ),
              // SizedBox(height: 70,),
              // Container(color: Colors.black, height: 1, width: size.width - 20),
              //
              // SizedBox(height: 20,),
              //
              //
              // Text('Your cards',
              //   style: TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold
              //   ),
              //
              // ),
              SizedBox(height: 10,),
              Container(
                height: size.height*0.8,
                child: savedCardsList.isEmpty ?
                Center(child: Text('No Cards found',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                  ),

                ),)
                :Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemCount: savedCardsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${savedCardsList[index]['cardNumber']}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),

                        ),
                        subtitle: Text('${savedCardsList[index]['cardType']}'),
                        trailing: savedCardsList[index]['isDefault'] ? Container(
                          width: 80,
                          child: Row(
                              // mainAxisSize: MainAxisSize.min,

                            children: [
                              Expanded(child: Text('Default'), flex: 2,),
                              Expanded(child: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red,),
                                onPressed: () {
                                  setState(() {
                                    savedCardsList.removeAt(index);
                                  });
                                },
                              ))
                            ],
                          ),
                        ) : Container(
                          alignment: Alignment.centerRight,
                          width: 80,
                          child: Row(
                            children: [
                              Expanded(child: Text(''), flex: 2,),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red,),
                                  onPressed: () {
                                    setState(() {
                                      savedCardsList.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            ],
                          )

                          //Icon(Icons.delete, color: Colors.red,)
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(3,3)
                      )
                    ]
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    primary: Colors.blue,
                  ),
                  child: Container(
                    height: size.height * 0.04,
                    alignment: Alignment.center,
                    width: size.width * 0.6,
                    margin: const EdgeInsets.all(8),
                    child: Text('ADD NEW CARD',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            fontSize: size.width * 0.04)),
                  ),
                  onPressed: () {
                    screenPush(context, AddNewCard());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
