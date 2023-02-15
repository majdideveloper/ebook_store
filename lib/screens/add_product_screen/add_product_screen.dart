import 'package:flutter/material.dart';
import 'package:my_own_ebook/resources/book_methods.dart';

import 'package:my_own_ebook/screens/auth/widget/auth_button.dart';

import '../../utils/constants.dart';
import '../auth/widget/textfield_auth.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _nameController = TextEditingController();
  final _autherController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();
  final _priceOnSaleController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  String dropdownvalue = 'Bien-être & vie pratique';
  var items = [
    'Bien-être & vie pratique',
    'Sciences humaines et sociales',
    'Romans',
    'Arts & beaux livres',
  ];

  bool isSwitched = false;
  toggleSwitch() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  @override
  void dispose() {
    _autherController.dispose();
    _nameController.dispose();
    _imageController.dispose();
    _priceController.dispose();
    _priceOnSaleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                MyTextField(
                  controller: _nameController,
                  hintText: 'name book',
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid title ';
                    } else {
                      return null;
                    }
                  },
                ),
                Constants.smallPaddingHor,
                MyTextField(
                  controller: _autherController,
                  hintText: 'Auther',
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valide name';
                    } else {
                      return null;
                    }
                  },
                ),
                Constants.smallPaddingHor,
                MyTextField(
                  controller: _imageController,
                  hintText: 'Url Image',
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valide Url';
                    } else {
                      return null;
                    }
                  },
                ),
                Constants.smallPaddingHor,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,

                        style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                        // Down Arrow Icon
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Constants.smallPaddingHor,
                MyTextField(
                  controller: _priceController,
                  hintText: 'Price',
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valide price ';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'is On Sale:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        ' false',
                        style: TextStyle(fontSize: 20),
                      ),
                      Switch(
                        onChanged: (value) => toggleSwitch(),
                        value: isSwitched,
                        activeColor: Colors.orange,
                        activeTrackColor: Colors.yellow,
                      ),
                      Text(
                        'true',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: isSwitched,
                  child: MyTextField(
                    controller: _priceOnSaleController,
                    hintText: 'Price on sale',
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a price';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: AuthButton(
                      fct: () {
                        if (_keyForm.currentState!.validate()) {
                          if (!isSwitched) {
                            BookMethods().addBook(
                              _nameController.text,
                              _autherController.text,
                              _imageController.text,
                              dropdownvalue,
                              double.parse(_priceController.text),
                              isSwitched,
                            );
                            claerForm();
                          } else {
                            BookMethods().addBook(
                                _nameController.text,
                                _autherController.text,
                                _imageController.text,
                                dropdownvalue,
                                double.parse(_priceController.text),
                                isSwitched,
                                priceOnSale:
                                    double.parse(_priceOnSaleController.text));
                            claerForm();
                          }
                        }
                      },
                      buttonText: "Submit Book"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  claerForm() {
    _nameController.clear();
    _imageController.clear();
    _priceController.clear();
    _priceOnSaleController.clear();
    _autherController.clear();
  }
}
