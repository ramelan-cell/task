import 'package:flutter/material.dart';

class FooterLoginPage extends StatelessWidget {
  const FooterLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              'PT Tangkas Cipta Optimal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Citra Towers, North Tower, 23rd & 25th Floor'),
                Text('Jl. Benyamin Sueb Kav. A6,Kemayoran'),
                Text('Jakarta Pusat, 10630')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
