class ResultModel {
  double areaFloor;
  int piecesByLength;
  int piecesByWidght;
  double priceBySquareMeter;

  ResultModel({
    this.areaFloor = 0,
    this.piecesByLength = 0,
    this.piecesByWidght = 0,
    this.priceBySquareMeter = 0,
  });

  int get amountPieces => piecesByLength * piecesByWidght;
  int get amountFooter => piecesByLength + piecesByWidght;
  int get amountPiecesAndFooter => amountPieces + amountFooter;
  double get areaWithoutFooter => amountPieces * areaFloor;
  double get areaWithFooter => amountPiecesAndFooter * areaFloor;
  double get totalPriceWithoutFooter => priceBySquareMeter * areaWithoutFooter;
  double get totalPriceWithFooter => priceBySquareMeter * areaWithFooter;
}
