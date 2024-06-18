import 'package:flutter/material.dart';

class PortalCard extends StatefulWidget {
  const PortalCard({super.key});

  @override
  State<PortalCard> createState() => _PortalCardState();
}

class _PortalCardState extends State<PortalCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      shadowColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'AVAILABLE E-POINTS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/e.png',
                          width: 80, // Adjust width as needed
                          height: 80, // Adjust height as needed
                        ),
                        Text(
                          '1650 PTS',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.amber[400]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              'Earn more E-points to unlock more prizes.',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
