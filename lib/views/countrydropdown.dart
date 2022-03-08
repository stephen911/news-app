import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDropdown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final Function(String) onChanged;

  const CountryDropdown({
    @required this.countries,
    @required this.country,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), topLeft: Radius.circular(6))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconEnabledColor: Colors.white,
          // style: TextStyle(color: Colors.black),
          dropdownColor: Theme.of(context).accentColor,
          //iconDisabledColor: Colors.black,
          value: country,

          items: countries
              .map((e) => DropdownMenuItem(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 12.0,
                          child: SvgPicture.asset("assets/icons/$e.svg"),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          (() {
                            if (e == "us") {
                              return "United States";
                            } else if (e == "ar") {
                              return "Argentina";
                            } else if (e == "au") {
                              return "Australia";
                            } else if (e == "at") {
                              return "Austria";
                            } else if (e == "be") {
                              return "Belgium";
                            } else if (e == "br") {
                              return "Brazil";
                            } else if (e == "bg") {
                              return "Bulgaria";
                            } else if (e == "ca") {
                              return "Canada";
                            } else if (e == "cn") {
                              return "China";
                            } else if (e == "co") {
                              return "Colombia";
                            } else if (e == "cu") {
                              return "Cuba";
                            } else if (e == "cz") {
                              return "Czech Republic";
                            } else if (e == "eg") {
                              return "Egypt";
                            } else if (e == "fr") {
                              return "France";
                            } else if (e == "de") {
                              return "Germany";
                            } else if (e == "gr") {
                              return "Greece";
                            } else if (e == "hk") {
                              return "Hong Kong";
                            } else if (e == "hu") {
                              return "Hungary";
                            } else if (e == "in") {
                              return "India";
                            } else if (e == "id") {
                              return "Indonesia";
                            } else if (e == "ie") {
                              return "Ireland";
                            } else if (e == "il") {
                              return "Israel";
                            } else if (e == "it") {
                              return "Italy";
                            } else if (e == "jp") {
                              return "Japan";
                            } else if (e == "lv") {
                              return "Latvia";
                            } else if (e == "lt") {
                              return "Lithuania";
                            } else if (e == "my") {
                              return "Malaysia";
                            } else if (e == "mx") {
                              return "Mexico";
                            } else if (e == "ma") {
                              return "Morocco";
                            } else if (e == "nl") {
                              return "Netherlands";
                            } else if (e == "nz") {
                              return "New Zealand";
                            } else if (e == "ng") {
                              return "Nigeria";
                            } else if (e == "no") {
                              return "Norway";
                            } else if (e == "ph") {
                              return "Philippines";
                            } else if (e == "pl") {
                              return "Poland";
                            } else if (e == "pt") {
                              return "Portugal";
                            } else if (e == "ro") {
                              return "Romania";
                            } else if (e == "ru") {
                              return "Russia";
                            } else if (e == "sa") {
                              return "Saudi Arabia";
                            } else if (e == "rs") {
                              return "Serbia";
                            } else if (e == "sg") {
                              return "Singapore";
                            } else if (e == "sk") {
                              return "Slovakia";
                            } else if (e == "si") {
                              return "Slovenia";
                            } else if (e == "za") {
                              return "South Africa";
                            } else if (e == "kr") {
                              return "South Korea";
                            } else if (e == "se") {
                              return "Sweden";
                            } else if (e == "ch") {
                              return "Switzerland";
                            } else if (e == "tw") {
                              return "Taiwan";
                            } else if (e == "th") {
                              return "Thailand";
                            } else if (e == "tr") {
                              return "Turkey";
                            } else if (e == "ae") {
                              return "UAE";
                            } else if (e == "ua") {
                              return "Ukraine";
                            } else if (e == "gb") {
                              return "United Kingdom";
                            } else if (e == "us") {
                              return "United States";
                            } else if (e == "ve") {
                              return "Venuzuela";
                            } else {
                              return e;
                            }
                          })(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// class CountriesButton extends StatefulWidget {
//   const CountriesButton({Key key}) : super(key: key);

//   @override
//   _CountriesButtonState createState() => _CountriesButtonState();
// }

// class _CountriesButtonState extends State<CountriesButton> {
//   List<DropdownMenuItem<CountryOption>> _countryItems;
//   CountryOption _selectedCountry;

//   @override
//   void initState() {
//     // Get all countries
//     List<CountryOption> countries = CountryOption.allCountries;

//     // Initialise your items only once
//     _countryItems = countries.map<DropdownMenuItem<CountryOption>>(
//       (CountryOption countryOption) {
//         return DropdownMenuItem<CountryOption>(
//           value: countryOption,
//           child: Text(countryOption.fullName),
//         );
//       },
//     ).toList();

//     // Initialiste your dropdown with the first country in the list
//     // (might be different in your specific scenario)
//     _selectedCountry = countries[0];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: DropdownButton<CountryOption>(
//         isExpanded: true,
//         underline: SizedBox(),
//         icon: Icon(Icons.home), //SvgPicture.asset("assets/icons/dropdown.svg"),
//         value: _selectedCountry,
//         items: _countryItems,
//         onChanged: (newValue) {
//           setState(() {
//             _selectedCountry = newValue;
//           });
//         },
//       ),
//     );
//   }
// }

// class CountryOption {
//   final String key;
//   final String fullName;

//   CountryOption(this.key, this.fullName);

//   static List<CountryOption> get allCountries => [
//         CountryOption('ar', 'Argentina'),
//         CountryOption('in', 'India'),
//         CountryOption('us', 'United States'),
//         CountryOption('gb', 'UK'),
//         CountryOption('br', 'brazil'),
//       ];
// }
