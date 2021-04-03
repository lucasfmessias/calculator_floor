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
      builder: (BuildContext context) => ResultDialog(result: result),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(kResult),
      content: Container(
        // criar uma coluna dentro do container
        child: Column(
          // mínimo valor na vertical
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTile(result.amountPieces, kUnitFloor, kAmountFloor),
            _buildTile(result.amountFooter, kUnitFloor, kTotalFloorToFooter),
            _buildTile(result.amountPiecesAndFooter, kUnitFloor, kTotalFloor),
            Divider(),
            _buildTile(
                result.areaWithoutFooter, kUnitSquareMeter, kAreaWithoutFooter),
            _buildTile(
                result.areaWithFooter, kUnitSquareMeter, kAreaWithFooter),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(num value, String type, String description) {
    if (type != kUnitSquareMeter) {
      return ListTile(
        title: Text('${value.toStringAsFixed(kDecimalPrecisionZero)} $type'),
        subtitle: Text(description),
      );
    } else {
      return ListTile(
        title: Text('${value.toStringAsFixed(kDecimalPrecisionTwo)} $type'),
        subtitle: Text(description),
      );
    }
  }
}
