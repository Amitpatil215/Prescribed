import 'package:flutter/material.dart';

class ASAuthForm extends StatefulWidget {
  final void Function(
    String phoneNo,
  ) submitAuthForm;

  const ASAuthForm(this.submitAuthForm);

  @override
  _ASAuthFormState createState() => _ASAuthFormState();
}

class _ASAuthFormState extends State<ASAuthForm> {
  var _phoneNo = '';
  final _formKey = GlobalKey<FormState>();

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    //for closing soft keyboard
    FocusScope.of(context).unfocus();

    if (isValid) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          'Sending OTP request...',
        ),
        backgroundColor: Colors.green,
      ));

      _formKey.currentState.save();

      widget.submitAuthForm(
        _phoneNo,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'We will send you an ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                        text: 'One Time Password ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        )),
                    TextSpan(
                      text: 'on this mobile number',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 18,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Phone No",
                    border: OutlineInputBorder(),
                    hintText: "+91..",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.length < 10) {
                      return "Enter valid Mobile No";
                    } else if (value.length == 10) {
                      return null;
                    }
                    return "Check Credientials";
                  },
                  onSaved: (newValue) {
                    _phoneNo = newValue;
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Next..",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: _trySubmit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
