import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  // State variables for each switch
  bool _isCardOnline = true;
  bool _isSpendingLimitSet = false;
  bool _isTransactionNotifications = true;
  bool _isInStorePaymentsEnabled = false;
  bool _isInternationalPaymentsEnabled = true;
  bool _isPrivateModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Theme.of(context).primaryColor,
              child: Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ISIMS Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '**** **** **** 1234',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nom',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Safouen Turki',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiration',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '12/25',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CVV',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '123',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.report, color: Colors.white),
                    label: Text('Rapport volé', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.block),
                    label: Text('Bloquer la carte'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.support),
                    label: Text('Support'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Scrollable settings section
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Paramètres de la carte',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    SwitchListTile(
                      title: Text('Activer la carte en ligne'),
                      value: _isCardOnline,
                      onChanged: (bool value) {
                        setState(() {
                          _isCardOnline = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Définir la limite de dépenses'),
                      value: _isSpendingLimitSet,
                      onChanged: (bool value) {
                        setState(() {
                          _isSpendingLimitSet = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Recevoir des notifications de transactions'),
                      value: _isTransactionNotifications,
                      onChanged: (bool value) {
                        setState(() {
                          _isTransactionNotifications = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Activer les paiements en magasin'),
                      value: _isInStorePaymentsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _isInStorePaymentsEnabled = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Permettre les paiements internationaux'),
                      value: _isInternationalPaymentsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _isInternationalPaymentsEnabled = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Activer le mode privé'),
                      value: _isPrivateModeEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _isPrivateModeEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
