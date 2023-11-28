


import 'package:flutter/material.dart';
import 'package:gov_flutter_copy_app/views/solicitations/models/solicitation.dart';


class SolicitationStyles {


  iconFrom(Solicitation solicitation) {
    return [
      Icons.health_and_safety,
      Icons.people_alt_sharp,
      Icons.house

    ][solicitation.id];
  }

  titleFrom(Solicitation solicitation) {
    return [
      "Saúde Suplementar",
      "Cadastro de Dependente",
      "Moradia"
    ][solicitation.id];
  }

}