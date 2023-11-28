import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/bloc/paycheck_information_bloc.dart';

import '../../../paycheck_information/style/paycheck_type_style.dart';

class PaycheckDetailsCard extends StatefulWidget {

  final PaycheckInformationType paycheckType;
  const  PaycheckDetailsCard({
    super.key, required  this.paycheckType,
  });

  @override
  State<PaycheckDetailsCard> createState() => _PaycheckDetailsCardState();
}

class _PaycheckDetailsCardState extends State<PaycheckDetailsCard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  bool visible = false;

  @override
  Widget build(BuildContext context) {


    PaycheckTypeStyle paycheckTypeStyle = PaycheckTypeStyle(type: widget.paycheckType);

    return InkWell(
      onTap: (){
        setState(() {
          visible = !visible;
        });
      },
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(paycheckTypeStyle.iconData,
                  color: paycheckTypeStyle.colorFromType(),),
                  Text(paycheckTypeStyle.titleFromType,),
                  const Spacer(),
                  Icon(

                      visible ? Icons.keyboard_arrow_up :
                      Icons.keyboard_arrow_down),
                ],
              ),

              Visibility(
                visible: visible,
                child: Column(
                  children: [

                    for(PaycheckInformation information
                    in BlocProvider.of<PaycheckInformationBloc>(context).getPaychecksInformationByType(widget.paycheckType))
                      Card(
                        color: Colors.white,
                       child: Padding(
                         padding: const EdgeInsets.all(16.0) ,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Flexible(child: Text(information.name,
                             maxLines: 2,
                             )),
                             Text(information.value.toString()),
                           ],
                         ),
                       )
                      )

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
