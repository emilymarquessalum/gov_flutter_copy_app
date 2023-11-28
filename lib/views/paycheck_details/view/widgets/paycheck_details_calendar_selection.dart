import 'package:flutter/material.dart';
import 'package:gov_flutter_copy_app/models/extensions/date_br.dart';
import 'package:gov_flutter_copy_app/shared_widgets/listing/simple_scroll_view.dart';

class PaycheckDetailsCalendarSelection extends StatelessWidget {
  const PaycheckDetailsCalendarSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleScrollView(
        scrollPadding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal ,

        child: Container(
          height:60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < 12; i++)
                PaycheckDetailsCalendarMonth(i: i)
            ],
          ),
        ));
  }
}

class PaycheckDetailsCalendarMonth extends StatelessWidget {
  const PaycheckDetailsCalendarMonth({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {



    if(isCurrentMonth()) {

      WidgetsBinding.instance.scheduleFrameCallback((_) {
        Scrollable.ensureVisible(context);
      });
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateExtension.monthAbbreviation(i),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: isCurrentMonth() ?

                Colors.black:
                Colors.grey
              ),
          ),



          Container(
            width:    isCurrentMonth() ? 20 : 0,
            child: Divider(
              color: Theme.of(context).primaryColor,
              thickness: 3,

            ),
          )


        ],
      ),
    );
  }

  bool isCurrentMonth() => i == DateTime.now().month-1;
}
