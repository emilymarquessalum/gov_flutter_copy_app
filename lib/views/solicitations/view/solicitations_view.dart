
import 'package:flutter/material.dart';
import 'package:gov_flutter_copy_app/views/solicitations/models/solicitation.dart';
import 'package:gov_flutter_copy_app/views/solicitations/style/solicitation_styles.dart';
import 'package:gov_flutter_copy_app/views/solicitations/view/solicitation_card.dart';

class SolicitationsView extends StatelessWidget {
  const SolicitationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    SolicitationStyles solicitationStyles = SolicitationStyles();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text("Solicitações",
           style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const Text("Envie requerimentos para a sua Unidade Gestora"),

        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Wrap(
            children: [

              for(Solicitation solicitation in [
                Solicitation(id: 0),Solicitation(id: 1),Solicitation(id: 2),])
              SolicitationCard(icon: solicitationStyles.iconFrom(solicitation) ,
                  title: solicitationStyles.titleFrom(solicitation))
            ],
          ),
        )
      ],
    );
  }
}
