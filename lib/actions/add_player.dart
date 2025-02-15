import 'package:flutter/material.dart';

class AddPlayer extends StatefulWidget {
  //final TeamModel teamModel;
  const AddPlayer({
    super.key,
    //required this.teamModel
  });

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  int? selectedAge = 16;
  String? selectedPosition = 'GK';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _wageController = TextEditingController();
  final TextEditingController _ovrController = TextEditingController();

  final List<int> ages = [
    16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40
  ];

  final List<String> positions = [
    'GK', 'CB', 'LB', 'RB', 'CM', 'CDM', 'LM', 'RM', 'CAM', 'ST', 'RW', 'LW'
  ];

  void onChanged(int? value) {
    setState(() {
      selectedAge = value;
    });
  }

  void onChanged1(String? value) {
    setState(() {
      selectedPosition = value;
    });
  }

  void addNewPlayer(BuildContext context) {
    int? playerAge = int.parse(selectedAge.toString());
    String playerPosition = selectedPosition.toString();
    int? playerOVR = int.parse(_ovrController.text);
    double? playerValue = double.parse(_valueController.text);
    double? playerWage = double.parse(_wageController.text);
    //PlayerModel playerModel = PlayerModel(id: 1, name: _nameController.text, age: playerAge, position: playerPosition, overall: playerOVR, value: playerValue, wage: playerWage);
    //widget.teamModel.addPlayer(playerModel);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Add a player',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text('Player Name'),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        Icons.flag,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: _valueController,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      label: Text('Player value'),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        Icons.euro,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: _wageController,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      label: Text('Player wage'),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        Icons.euro,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: _ovrController,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      label: Text('Player OVR'),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        Icons.add_chart,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    DropdownButton<int>(
                      value: selectedAge,
                      onChanged: onChanged,
                      items: ages.map((int age) {
                        return DropdownMenuItem<int>(
                          value: age,
                          child: Text(age.toString(), style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      dropdownColor: Colors.black,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'Pos: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    DropdownButton<String>(
                      value: selectedPosition,
                      onChanged: onChanged1,
                      items: positions.map((String position) {
                        return DropdownMenuItem<String>(
                          value: position,
                          child: Text(position.toString(), style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      dropdownColor: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    if(_nameController.text.isNotEmpty && _ovrController.text.isNotEmpty && _valueController.text.isNotEmpty && _wageController.text.isNotEmpty){
                      addNewPlayer(context);
                    }
                  },
                  child: Text(
                    'Add Player',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
