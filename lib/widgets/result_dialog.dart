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
      content: SingleChildScrollView(
        child: Container(
          // criar uma coluna dentro do container
          child: Column(
            // mínimo valor na vertical
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTile(
                value: result.amountPieces,
                description: kAmountFloor,
              ),
              _buildTile(
                value: result.amountFooter,
                description: kTotalFloorToFooter,
              ),
              _buildTile(
                value: result.amountPiecesAndFooter,
                description: kTotalFloor,
              ),
              Divider(),
              _buildTile(
                value: result.areaWithoutFooter,
                description: kAreaWithoutFooter,
              ),
              _buildTile(
                value: result.areaWithFooter,
                description: kAreaWithFooter,
              ),
              Divider(),
              _buildTile(
                value: result.totalPriceWithoutFooter,
                description: kAmountToPayWithoutFooter,
              ),
              _buildTile(
                value: result.totalPriceWithFooter,
                description: kAmountToPayWithFooter,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile({num value, String description}) {
    return ListTile(
      title: Text(value.toStringAsFixed(kDecimalPrecisionTwo)),
      subtitle: Text(description),
    );
  }
}
