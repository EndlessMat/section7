import 'package:flutter/material.dart';

class AjouterTache {
  String titre;
  String description;
  int niveau;
  String hourlimit;
  String categorie;

  AjouterTache(
      {required this.titre,
      required this.description,
      required this.niveau,
      required this.hourlimit,
      required this.categorie});
}
