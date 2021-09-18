import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _date = "";
  List<String> _powers = const ['Fly', 'X-ray', 'Strength'];
  String _dropdownSelection = 'Fly';

  final _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inputs"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearFirstNameField(),
          const Divider(),
          _createEmailField(),
          const Divider(),
          _createPasswordField(),
          const Divider(),
          _createDateField(context),
          const Divider(),
          _createDropdown(),
          const Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _crearFirstNameField() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) => setState(() => _name = value),
      decoration: InputDecoration(
          counter: Text('Words ${_name.length}'),
          hintText: "First Name",
          helperText: "Just the Fist Name",
          labelText: "First Name",
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text("First Name: $_name"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_dropdownSelection),
    );
  }

  Widget _createEmailField() {
    return TextField(
      onChanged: (value) => setState(() => _email = value),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          counter: Text('Words ${_name.length}'),
          hintText: "Email",
          helperText: "Just the Email",
          labelText: "Email",
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );
  }

  Widget _createPasswordField() {
    return TextField(
      onChanged: (value) => setState(() => _password = value),
      obscureText: true,
      decoration: InputDecoration(
          counter: Text('Words ${_name.length}'),
          hintText: "Password",
          helperText: "Just the Password",
          labelText: "Password",
          suffixIcon: const Icon(Icons.lock_open),
          icon: const Icon(Icons.lock),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );
  }

  Widget _createDateField(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
          counter: Text('Words ${_name.length}'),
          hintText: "Date Birth",
          helperText: "Like dd:mm:yy",
          labelText: "Date Birth",
          suffixIcon: const Icon(Icons.perm_contact_calendar_rounded),
          icon: const Icon(Icons.calendar_today),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> list = [];
    for (String power in _powers) {
      list.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    }
    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton<String>(
            value: _dropdownSelection,
            items: getDropdownItems(),
            onChanged: (item) => setState(() => _dropdownSelection = item!),
            hint: const Text("Click to open"),
          ),
        ),
      ],
    );
  }
}
