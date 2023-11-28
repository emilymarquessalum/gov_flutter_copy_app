import 'package:flutter/material.dart';

class SolicitationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  const SolicitationCard({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 120,
      child: Card(
        child: InkWell(
          onTap: () {
          },
          child: Column(
            children: [
              const Spacer(),
              Flexible(child: Icon(icon)),
              const Spacer(),
              Flexible(
                flex:2,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
      
                    )
                    )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
