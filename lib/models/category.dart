import 'package:flutter/material.dart';
import 'package:un1q_app/models/taxon.dart';

class Category extends ChangeNotifier {
  Taxon? taxon;

  void setTaxon(Taxon txn) {
    taxon = txn;
    notifyListeners();
  }

  Taxon? getTaxon() {
    return taxon;
  }
}
