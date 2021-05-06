import 'package:currency_converter/app/widgets/currency_box.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {  
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  HomeController homeController;  

  @override
  void initState() {    
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * .1,
            left: size.width * .05,
            right: size.width * .05,
          ),
          child: Column(
            children: [
              SafeArea(
                child: Image.asset(
                  'assets/logo.png',
                  width: size.width * .35,
                ),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              CurrencyBox(
                selectedItem: homeController.toCurrency,
                controller: toText ,
                items: homeController.currencies, 
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model;
                  });
                }),
              SizedBox(
                height: size.height * .03,
              ),
              CurrencyBox(
                selectedItem: homeController.fromCurrency,
                controller: fromText, 
                items: homeController.currencies, 
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model;
                  });
                }),
              SizedBox(
                height: size.height * .05,
              ),
              ElevatedButton(
                child: Text('CONVERT'),
                onPressed: () {
                  homeController.convert();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
