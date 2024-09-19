import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/AppColorCollections.dart';
import '../Bloc/WelcomePage4Bloc.dart';
import '../Bloc/WelcomePage4BlocEvent.dart';

//Drop down button

Widget DropDownButton(BuildContext context, double fromTop) {
  return Container(
    color: ColorCollections.WhiteColor,
    margin: EdgeInsets.only(top: fromTop, left: 70),
    child: DropdownMenu(
      width: 220,
      initialSelection: 'None',
      menuStyle: MenuStyle(
          backgroundColor:
              WidgetStateProperty.all(ColorCollections.WhiteColor)),
      onSelected: (value) {
        context
            .read<Welcomepage4blocs>()
            .add(Welcomepage4blocEvent(SelectedItem: value!));
        // print();
      },
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: 'AASTU',
          label: 'AASTU',
        ),
        DropdownMenuEntry(
          value: 'ASTU',
          label: 'ASTU',
        ),
        DropdownMenuEntry(
          value: 'Gonder',
          label: 'Gonder',
        ),
        DropdownMenuEntry(
          value: 'Bahir Dar',
          label: 'Bahir Dar',
        ),
        DropdownMenuEntry(
          value: 'Mekele',
          label: 'Mekele',
        ),
        DropdownMenuEntry(
          value: 'Welkite',
          label: 'Welkite',
        ),
        DropdownMenuEntry(
          value: 'Hawasa',
          label: 'Hawasa',
        ),
        DropdownMenuEntry(
          value: 'Gima',
          label: 'Gima',
        ),
        DropdownMenuEntry(
          value: 'value9',
          label: 'Weldya',
        ),
        DropdownMenuEntry(
          value: 'Dese',
          label: 'Dese',
        ),
        DropdownMenuEntry(
          value: 'Arsi',
          label: 'Arsi',
        ),
        DropdownMenuEntry(
          value: 'None',
          label: 'None',
        ),
      ],
    ),
  );
}

// DropdownButton<String>(
//   value: 'one',
//   items: [
//     DropdownMenuItem(
//       value: 'one',
//       child: Text(' gega'),
//     ),
//     DropdownMenuItem(
//       value: 'two',
//       child: Text('data'),
//     ),
//     DropdownMenuItem(
//       value: 'three',
//       child: Text('yes'),
//     ),
//   ],
//   onChanged: (value) {},
// ),
