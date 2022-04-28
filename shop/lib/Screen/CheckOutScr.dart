import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/formfield.dart';

import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'Order.dart';
import 'addressScr.dart';

class CheckOutScreen extends StatefulWidget {
  final dynamic cartData;
  final dynamic shipPrice;
  final dynamic subPrice;
  const CheckOutScreen({Key? key, this.cartData, this.shipPrice, this.subPrice})
      : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  dynamic value1 = false;
  dynamic value2 = false;

  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();

  final TextEditingController companyController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  final TextEditingController street1Controller = TextEditingController();
  final TextEditingController street2Controller = TextEditingController();

  final TextEditingController townController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController fNameController2 = TextEditingController();
  final TextEditingController lNameController2 = TextEditingController();

  final TextEditingController companyController2 = TextEditingController();
  final TextEditingController countryController2 = TextEditingController();

  final TextEditingController street1Controller2 = TextEditingController();
  final TextEditingController street2Controller2 = TextEditingController();

  final TextEditingController townController2 = TextEditingController();
  final TextEditingController stateController2 = TextEditingController();
  final TextEditingController pinCodeController2 = TextEditingController();

  final TextEditingController orderDesController = TextEditingController();

  dynamic billing;
  dynamic shipping;
  dynamic description;

  @override
  Widget build(BuildContext context) {
    _saveMethod() async {
      var isvalid = _formKey.currentState!.validate();

      if (!isvalid) {
        return 'Please Enter Valid Data';
      }
      _formKey.currentState!.save();
      if (isvalid == true) {
        // print("condtion is true");

        setState(() {
          billing = {
            "first_name": fNameController.text,
            "last_name": lNameController.text,
            "company": companyController.text,
            "address_1": street1Controller.text,
            "address_2": street2Controller.text,
            "city": townController.text,
            "state": stateController.text,
            "postcode": pinCodeController.text,
            "country": countryController.text,
            "email": emailController.text,
            "phone": mobileController.text
          };

          shipping = {
            "first_name": fNameController2.text,
            "last_name": lNameController2.text,
            "company": companyController2.text,
            "address_1": street1Controller2.text,
            "address_2": street2Controller2.text,
            "city": townController2.text,
            "state": stateController2.text,
            "postcode": pinCodeController2.text,
            "country": countryController2.text,
            "phone": mobileController.text
          };

          description = orderDesController.text;
        });

        
        navigationPush(context, OrderScreen(billing:billing,shipping:shipping,description:description));
      }
    }

    return Scaffold(
      appBar: BaseAppBar(
        title: 'CheckOut Screen',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                AddressField(
                  fNameController: fNameController,
                  lNameController: lNameController,
                  companyController: companyController,
                  countryController: countryController,
                  townController: townController,
                  stateController: stateController,
                  street1Controller: street1Controller,
                  street2Controller: street2Controller,
                  pinCodeController: pinCodeController,
                  emailController: emailController,
                  mobileController: mobileController,
                ),
                // ! Create an Account

                Row(
                  children: [
                    Checkbox(
                      value: value1,
                      onChanged: (bool? value) {
                        setState(() {
                          value1 = value;
                        });
                      },
                    ),
                    Text('Create an Account', style: smallTextStyle),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: value2,
                      onChanged: (bool? value) {
                        setState(() {
                          value2 = value;
                        });
                      },
                    ),
                    Text('shpping address', style: smallTextStyle),
                  ],
                ),
                // ! Shpping Billing Address
                Container(
                    child: value2 == true
                        ? ListView(
                            shrinkWrap: true,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Shpping Address ', style: labelTextStyle),
                              AddressField(
                                fieldShow: false,
                                validate: value2 == true ? true : false,
                                fNameController: fNameController2,
                                lNameController: lNameController2,
                                companyController: companyController2,
                                countryController: countryController2,
                                townController: townController2,
                                stateController: stateController2,
                                street1Controller: street1Controller2,
                                street2Controller: street2Controller2,
                                pinCodeController: pinCodeController2,
                              ),
                            ],
                          )
                        : null),

                EditTextField(
                  textAlign: TextAlign.left,
                  txtColor: txtBlackColor,
                  formBox: true,
                  fillColor: borderColor,
                  vertical: 15,
                  controller: orderDesController,
                  // minLines: 3,
                  // maxLines: 4,
                  headTxt: 'Description',
                  hintText: 'Order Descrtiption (optional)',
                )
              ],
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        child: Btn(
          height: 35,
          width: double.infinity,
          btnName: 'Place Order',
          txtColor: txtWhiteColor,
          color: yellowColor,
          onTap: _saveMethod,
        ),
      ),
    );
  }
}
