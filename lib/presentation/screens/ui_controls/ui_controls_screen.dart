import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles Adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        ExpansionTile(
          title: const Text('Vehiculos de Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedTransportation = value;
                  });
                }
              },
              child: Column(
                children: const [
                  RadioListTile<Transportation>(
                    title: Text('Car'),
                    subtitle: Text('Viajar en Carro'),
                    value: Transportation.car,
                  ),
                  RadioListTile<Transportation>(
                    title: Text('Plane'),
                    subtitle: Text('Viajar en Avion'),
                    value: Transportation.plane,
                  ),
                  RadioListTile<Transportation>(
                    title: Text('Boat'),
                    subtitle: Text('Viajar en Barco'),
                    value: Transportation.boat,
                  ),
                  RadioListTile<Transportation>(
                    title: Text('Submarine'),
                    subtitle: Text('Viajar en Submarino'),
                    value: Transportation.submarine,
                  ),
                ],
              ),
            ),
          ],
        ),

        //TODO: por aqui
        CheckboxListTile(
          title: const Text('Desayuno'),
          subtitle: const Text('Quieres desayunar'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo'),
          subtitle: const Text('Quieres almorzar'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Cena'),
          subtitle: const Text('Quieres cenar'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
