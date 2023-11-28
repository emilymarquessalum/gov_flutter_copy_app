import 'package:flutter/material.dart';

class PaycheckVisualizationOptionsCards extends StatelessWidget {
  const PaycheckVisualizationOptionsCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          for(String display in ["Contracheque detalhado", "Gráficos do contracheque", "Evolução remuneratória"])
          Expanded(
            child: Card(

              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)
              ),
              child: Text(display,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 16
              ),
                maxLines: 3,

                textAlign: TextAlign.center,
              )
            ),
          )
        ],
      ),
    );
  }
}
