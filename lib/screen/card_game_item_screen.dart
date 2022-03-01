import 'package:coop_player/model/game.dart';
import 'package:coop_player/model/party.dart';
import 'package:coop_player/model/user.dart';
import 'package:coop_player/provider/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../home.dart';

class CardGameItemScreen extends StatefulWidget {
  const CardGameItemScreen(
      {Key? key, required this.onCreate, required this.onUpdate, this.party})
      : isUpdate = party != null,
        super(key: key);
  final Function(Party) onCreate;
  final Function(Party) onUpdate;
  final Party? party;
  final bool isUpdate;

  @override
  State<CardGameItemScreen> createState() => _CardGameItemScreenState();
}

enum TimeGame { start, end }

class _CardGameItemScreenState extends State<CardGameItemScreen> {
  final items = GameHome.games;
  String _currentGame = "";
  String _description = "";
  String _require = "";
  int _quantity = 0;
  final _currentColor = Colors.green;
  DateTime _dataStart = DateTime.now();
  TimeOfDay _timeStart = TimeOfDay.now();
  TimeOfDay _timeEnd = TimeOfDay.now();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController requireController = TextEditingController();

  @override
  void initState() {

    super.initState();

    if (widget.party != null) {
      final partyNotNull = widget.party!;
      _currentGame = partyNotNull.uuidGame;
      _description = partyNotNull.description;
      _require = partyNotNull.require;
      _quantity = partyNotNull.amount;
      _dataStart = partyNotNull.date;
      _timeStart = partyNotNull.timeToPlay;
      _timeEnd = partyNotNull.timeOut;

      descriptionController.text = _description;
      requireController.text = _require;

    }

    setState(() {
      _currentGame = items.first.uuid;
    });

    descriptionController.addListener(() {
      _description = descriptionController.text;
    });

    requireController.addListener(() {
      _require = requireController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create party',
          style: GoogleFonts.lato(fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final party = Party(
                    host: User.users.first,
                    require: _require,
                    description: _description,
                    date: _dataStart,
                    amount: _quantity,
                    timeToPlay: _timeStart,
                    timeOut: _timeEnd,
                    uuidGame: _currentGame);

                if (widget.isUpdate) {
                  widget.onUpdate(party);
                } else {
                  widget.onCreate(party);
                }

                Navigator.pop(context);
              },
              icon: const Icon(Icons.done)),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(children: [
              buildDropdown(),
              const SizedBox(
                height: 10,
              ),
              buildTextField("Description", descriptionController),
              const SizedBox(
                height: 10,
              ),
              buildTextField("Require", requireController),
              const SizedBox(
                height: 10,
              ),
              buildDate(),
              const SizedBox(
                height: 15,
              ),
              buildTimeField(context, TimeGame.start),
              const SizedBox(
                height: 15,
              ),
              buildTimeField(context, TimeGame.end),
              const SizedBox(
                height: 15,
              ),
              buildQuantityField()
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildQuantityField() {
    // 1
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 2
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            const SizedBox(width: 16.0),
            Text(
              _quantity.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        // 3
        Slider(
          // 4
          inactiveColor: _currentColor.withOpacity(0.5),
          activeColor: _currentColor,
          // 5
          value: _quantity.toDouble(),
          // 6
          min: 0.0,
          max: 100.0,
          // 7
          divisions: 100,
          // 8
          label: _quantity.toInt().toString(),
          // 9
          onChanged: (double value) {
            setState(() {
              _quantity = value.toInt();
            });
          },
        ),
      ],
    );
  }

  Widget buildTimeField(BuildContext context, TimeGame timeGame) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              timeGame == TimeGame.start ? "Time start" : "Time End",
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                // 1
                final timeOfDay = await showTimePicker(
                  // 2
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                // 3
                setState(() {
                  if (timeOfDay != null) {
                    setState(() {
                      if (timeGame == TimeGame.start) {
                        _timeStart = timeOfDay;
                      } else {
                        _timeEnd = timeOfDay;
                      }
                    });
                  }
                });
              },
            ),
          ],
        ),
        Text(timeGame == TimeGame.start
            ? _timeStart.format(context)
            : _timeEnd.format(context)),
      ],
    );
  }

  Widget buildDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Date start",
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            // 5
            TextButton(
              child: const Text('Select'),
              // 6
              onPressed: () async {
                final currentDate = DateTime.now();
                // 7
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );

                // 8
                setState(
                  () {
                    if (selectedDate != null) {
                      _dataStart = selectedDate;
                    }
                  },
                );
              },
            ),
          ],
        ),
        // 9
        Text(DateFormat('yyyy-MM-dd').format(_dataStart)),
      ],
    );
  }

  Widget buildTextField(text, controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: GoogleFonts.lato(fontSize: 28, color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          controller: controller,
        ),
      ],
    );
  }

  Widget buildDropdown() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Type Games:',
          style: GoogleFonts.lato(fontSize: 28, color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        DropdownButton<String>(
          isExpanded: true,
          items: items.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              child: Text(value.name),
              value: value.uuid,
            );
          }).toList(),
          value: _currentGame,
          onChanged: (value) {
            setState(() {
              if (value != null) {
                _currentGame = value;
              }
            });
          },
        ),
      ],
    );
  }
}
