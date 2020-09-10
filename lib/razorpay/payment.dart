import 'package:creopedia/widgets/design.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';


class PaymentHome extends StatefulWidget {
  @override
  _PaymentHomeState createState() => _PaymentHomeState();
}

class _PaymentHomeState extends State<PaymentHome> {
  int totalAmount = 0;
  String description;
  String name;
  Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement 
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();

  }
  void paymentGateway() async {
    var options = {
      'key': 'rzp_test_nbSY73mcRrdRid',
      'amount' : totalAmount * 100,
      'name' : name,
      'description' : description,
      'prefill' : {'contact' : '', 'email': ''},
      'external' : {'wallets' : ['paytm']}

    };
    try{
      _razorpay.open(options);
    }
    catch(e){
      debugPrint(e);
    }
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "Payment Success" + response.paymentId);
  }
  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "Payment Error" + response.code.toString() + "-" + response.message);
  }
  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet" + response.walletName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Payment"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),

      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value){
                setState(() {
                  totalAmount = num.parse(value);
                });
              },
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.payment,
                  color: Colors.black,
                ),
                hintText: 'Enter the amount',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              
              onChanged: (value){
                setState(() {
                  description = value;
                });
              },
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                
                prefixIcon: Icon(
                  Icons.description,
                  color: Colors.black,
                ),
                hintText: 'Enter the description',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              
              onChanged: (value){
                setState(() {
                  name = value;
                });
              },
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: 'Enter the name',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: double.infinity,
          child: RaisedButton(
          elevation: 5.0,
          onPressed: ()  {
            paymentGateway();
            
            
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          color: Colors.red,
          child: Text(
            'MAKE PAYMENT',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          ),
      )
          ],),
        )
          ),
      
      
    );
  }
}