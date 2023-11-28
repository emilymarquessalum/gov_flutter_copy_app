


import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget  {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 12,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("lib/assets/images/logo.png",height: 50,  ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        child: Text("Servidoria",
                        style: Theme.of(context).textTheme.displaySmall,
                        ),

                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              InkWell(
                onTap: (){},
                child: Badge(
                  padding: const EdgeInsets.all(0),
                  smallSize: 20,
                  largeSize: 20,
                  backgroundColor: Colors.transparent,
                    label: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                        child: Text("99+",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,

                          ),)),
                    child: const Icon(Icons.notifications)),
              ),
              const SizedBox(width: 30,),
              InkWell(
                  onTap: (){},
                  child: Icon(Icons.login_outlined)),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
