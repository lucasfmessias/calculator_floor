import '../controllers/calculator_controller.dart';
import '../widgets/number_input_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_header.dart';
import '../core/constants.dart';
import '../widgets/result_dialog.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.cleaning_services_rounded),
            onPressed: _clearFields,
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          // Use FocusScope.of(context) to get the current FocusNode
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          // To solve overflow de keyboard use SingleChildScrollView
          child: Form(
            key: _formKey,
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      // espaçamento nas bordas
      padding: EdgeInsets.all(kSpace),
      child: Column(
        // esticar todos os filhos
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextHeader(label: kEnvironmentHeader),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kWidth ($kMeters)',
            onSaved: _controller.setRoomWidth,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kLenght ($kMeters)',
            onSaved: _controller.setRoomLength,
          ),
          SizedBox(height: kBigSpace),
          TextHeader(label: kFloorHeader),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kWidth ($kMeters)',
            onSaved: _controller.setFloorWidth,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kLenght ($kMeters)',
            onSaved: _controller.setFloorLength,
          ),
          SizedBox(height: kBigSpace),
          TextHeader(label: kPriceBySquareMeterHeader),
          SizedBox(height: kSpace),
          NumberInputField(
            label: kEmblemCoin,
            onSaved: _controller.setPrice,
          ),
          SizedBox(height: kBigSpace),
          UnconstrainedBox(
            child: PrimaryButton(
              label: kCalculateButton,
              onPressed: _onCalculate,
            ),
          ),
        ],
      ),
    );
  }

  void _onCalculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final result = _controller.calculate();
      ResultDialog.show(context, result);
    }
  }

  void _clearFields() {
    _formKey.currentState?.reset();
  }
}
