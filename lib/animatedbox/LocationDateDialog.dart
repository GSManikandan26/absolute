import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationDateDialog extends StatefulWidget {
  const LocationDateDialog({Key? key}) : super(key: key);

  @override
  _LocationDateDialogState createState() => _LocationDateDialogState();
}

class _LocationDateDialogState extends State<LocationDateDialog> {
  double _dialogHeight = 400; // Set your preferred height
  final double _dialogWidth = 300; // Set your preferred width
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  List<String> locations = ['None', 'Bangalore', 'Hyderabad', 'Chennai', 'Mumbai'];
  String selectedLocation = 'None';

  List<String> ratingOptions = ['Any', '1 Star', '2 Stars', '3 Stars', '4 Stars', '5 Stars'];
  String selectedRating = 'Any';

  DateTime? checkInDate;
  DateTime? checkOutDate;

  TextEditingController checkInDateController = TextEditingController();
  TextEditingController checkOutDateController = TextEditingController();

  Future<void> _selectDate(
      BuildContext context,
      TextEditingController controller, {
        bool isMonth = false,
        bool isYear = false,
      }) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate.subtract(
        isYear ? const Duration(days: 365 * 10) : const Duration(days: 365),
      ),
      lastDate: currentDate.add(
        isYear ? const Duration(days: 365 * 10) : const Duration(days: 365),
      ),
      initialDatePickerMode: isYear ? DatePickerMode.year : DatePickerMode.day,
    );

    if (picked != null) {
      final formattedDate = isYear
          ? DateFormat('yyyy').format(picked)
          : isMonth
          ? DateFormat('MM/yyyy').format(picked)
          : DateFormat('dd/MM/yyyy').format(picked);
      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        height: _dialogHeight,
        width: _dialogWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close, color: Colors.black),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DropdownButtonFormField<String>(
                            value: selectedLocation,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLocation = newValue!;
                              });
                            },
                            items: locations.map((String location) {
                              return DropdownMenuItem<String>(
                                value: location,
                                child: Text(location),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_on, color: customColor),
                              labelText: 'Location',
                              labelStyle: TextStyle(color: customColor, fontSize: 22),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: customColor),
                              ),
                            ),
                          ),
                          DropdownButtonFormField<String>(
                            value: selectedRating,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedRating = newValue!;
                              });
                            },
                            items: ratingOptions.map((String rating) {
                              return DropdownMenuItem<String>(
                                value: rating,
                                child: Text(rating),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              icon: Icon(Icons.star, color: customColor),
                              labelText: 'Rating',
                              labelStyle: TextStyle(color: customColor, fontSize: 22),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: customColor),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _selectDate(context, checkInDateController),
                            child: TextFormField(
                              controller: checkInDateController,
                              decoration: InputDecoration(
                                labelText: 'Check-in Date',
                                hintText: 'dd/mm/yyyy',
                                labelStyle: TextStyle(color: customColor),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: customColor),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () => _selectDate(context, checkInDateController),
                                  child: Icon(Icons.calendar_today, color: customColor),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _selectDate(context, checkOutDateController),
                            child: TextFormField(
                              controller: checkOutDateController,
                              decoration: InputDecoration(
                                labelText: 'Check-out Date',
                                hintText: 'dd/mm/yyyy',
                                labelStyle: TextStyle(color: customColor),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: customColor),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () => _selectDate(context, checkOutDateController),
                                  child: Icon(Icons.calendar_today, color: customColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              await Future.delayed(const Duration(milliseconds: 50), () {
                                setState(() {
                                  _dialogHeight = 0;
                                });
                              });
                              await Future.delayed(const Duration(milliseconds: 450));
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const Color.fromRGBO(33, 37, 41, 1.0);
                                  }
                                  return customColor;
                                },
                              ),
                            ),
                            child: const Text(
                              'Search',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
