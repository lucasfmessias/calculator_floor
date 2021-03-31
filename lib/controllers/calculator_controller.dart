import 'package:calculator_floor/helpers/parse_helper.dart';
import 'package:calculator_floor/models/floor_model.dart';
import 'package:calculator_floor/models/result_model.dart';
import 'package:calculator_floor/models/room_model.dart';

class CalculatorController {
  final RoomModel _room = RoomModel();
  final FloorModel _floor = FloorModel();

  void setRoomWidth(String value) {
    _room.width = ParseHelper.toDouble(value);
  }

  void setRoomLength(String value) {
    _room.length = ParseHelper.toDouble(value);
  }

  void setFloorWidth(String value) {
    _floor.width = ParseHelper.toDouble(value);
  }

  void setFloorLength(String value) {
    _floor.length = ParseHelper.toDouble(value);
  }

  ResultModel calculate() {
    return ResultModel(
      piecesByWidght: (_room.width / _floor.width).ceil(),
      piecesByLength: (_room.length / _floor.length).ceil(),
      areaFloor: (_floor.width * _floor.length),
    );
  }
}
