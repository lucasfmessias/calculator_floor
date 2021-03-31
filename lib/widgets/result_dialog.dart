import '../models/result_model.dart';
import '../core/constants.dart';
import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final ResultModel result;

  const ResultDialog({
    Key key,
    this.result,
  }) : super(key: key);

  static void show(BuildContext context, ResultModel result) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ResultDialog(
        result: result,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(kResult),
      content: Container(
        child: Column(
          // criar uma coluna dentro do container
          mainAxisSize: MainAxisSize.min, // mínimo valor na vertical
          children: [
            _buildTile(result.amountPieces, kAmountFloor),
            _buildTile(result.amountFooter, kTotalFloorToFooter),
            _buildTile(result.amountPiecesAndFooter, kTotalFloor),
            Divider(),
            _buildTile(result.areaWithoutFooter, kAreaWithoutFooter),
            _buildTile(result.areaWithFooter, kAreaWithFooter),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(num value, String description) {
    return ListTile(
      title: Text(value.toStringAsFixed(kDecimalPrecision)),
      subtitle: Text(description),
    );
  }
}
