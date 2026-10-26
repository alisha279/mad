
Name: Alisha Nasir
Roll Number: 04072313019

A1: 15
A2: 6
A3: 3
A4: 50

B1: LabApp, HomePage, SettingsCard, SummaryRow, Probe, Welcome, InfoPanel, ShareRow, InfoBox, and StampStack are StatelessWidgets because they do not manage changing state. Clock, Tile, and SwapBoard are StatefulWidgets because they need state that can change while the app runs.

B2: When setState is called, Flutter rebuilds the affected widget subtree. New Widget configurations are created, while existing Elements and RenderObjects are generally reused when possible. Probe showed the current clock seconds, information about the widget and context, and whether a Scaffold ancestor was found.

B3: Constraints go down from parent widgets to their children, and sizes go up from children to their parents. In ShareRow, the Row provides the available width. The fixed button takes 160 pixels, and the remaining width is shared according to flexA:flexB. Expanded fills its share, while Flexible can remain smaller.
