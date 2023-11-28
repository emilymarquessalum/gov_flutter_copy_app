import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov_flutter_copy_app/views/professional_information/bloc/professional_information_bloc.dart';

import '../../../shared_widgets/display/field_information_text.dart';


class ProfessionalInformationView extends StatelessWidget {
  const ProfessionalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<ProfessionalInformationBloc, ProfessionalInformationState>(
        builder: (context, state) {

          if (state is ProfessionalInformationInitial) {
            BlocProvider.of<ProfessionalInformationBloc>(context)
                .add(LoadProfessionalInformationEvent());

          }


          return Card(

            color: const Color(0xffebedf5),
            child: DefaultTextStyle(
              style: Theme
                  .of(context)
                  .textTheme
                  .labelSmall ?? const TextStyle(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldInformationText(
                      title: 'Vínculo Órgão - Uorg - Matrícula',
                      information:
                      state is ProfessionalInformationLoaded ?
                      "${state.userProfessionalInformation.institutionalBody} - ${state.userProfessionalInformation.Uorg} - ${state.userProfessionalInformation.id}"
                          : '',

                    ),
                    FieldInformationText(
                      title: 'Cargo', information:
                    state is ProfessionalInformationLoaded ?
                    state.userProfessionalInformation.role
                         :
                    '',
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
