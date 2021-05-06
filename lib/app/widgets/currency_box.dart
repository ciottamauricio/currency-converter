import 'package:flutter/material.dart';

import '../models/currency_model.dart';
import '../models/currency_model.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final void Function(CurrencyModel) onChanged;
  final CurrencyModel selectedItem;

  const CurrencyBox({Key key, this.items, this.controller, this.onChanged, this.selectedItem}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton<CurrencyModel>(
                value: selectedItem,
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                items: items.map((e) => DropdownMenuItem(
                  value:e,
                  child: Text(e.name))).toList(), 
                onChanged: onChanged,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              onChanged: (_) {},
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
