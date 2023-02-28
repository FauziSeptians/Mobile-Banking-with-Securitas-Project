import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uangin/classes/color_scheme.dart';

class SahamOrder extends StatefulWidget {
  const SahamOrder({super.key});

  @override
  State<SahamOrder> createState() => _SahamOrderState();
}

class _SahamOrderState extends State<SahamOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Order Jual Terkirim',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'OpenSans',
                  color: UsedColor.primaryGreen
                ),
              ),
              const Text(
                'Cek Staus Ordermu',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans',
                  color: UsedColor.primaryGrey
                ),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/orderSuccess.png'),
              InkWell(
                onTap: () {
                  int count = 0;
                  // Navigator.popUntil(context, (route) {return count++ == 4;});
                  HapticFeedback.mediumImpact();
                  Navigator.of(context).popUntil((route) => route.isFirst);

                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: UsedColor.primaryGreen
                  ),
                  child: const Center(
                    child: Text('Kembali ke Home',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'OpenSans',
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}