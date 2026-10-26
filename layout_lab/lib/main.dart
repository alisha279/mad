
import 'dart:async';
import 'package:flutter/material.dart';

const String studentName = 'Alisha Nasir';
const String rollNo = '04072313019';

const int seed = 19;
const int t = 1;
const int u = 9;
const String course = 'Security';

const int startSec = 10;
const int tick = 1;
const int ticks = 5;
const int stopAt = 15;

const String tileA = 'Hina';
const String tileB = 'Maya';
const String tileC = 'Omar';
const int tapsToMake = 3;

const String mainName = 'spaceEvenly';
const String crossName = 'center';

const double fixedW = 160;
const int flexA = 2;
const int flexB = 2;

const double boxMargin = 6;
const double boxPad = 16;
const double boxRadius = 12;
const double boxBorder = 2;
const String hue = 'pink';

const double dotTop = 8;
const double dotRight = 8;
const double dotBottom = 12;
const double dotLeft = 12;

const Map<String, MaterialColor> swatches = {
  'pink': Colors.pink,
  'blue': Colors.blue,
  'green': Colors.green,
  'orange': Colors.orange,
  'purple': Colors.purple,
};

final List<String> lifecycleLog = [];

void main() => runApp(const LabApp());

class LabApp extends StatelessWidget {
  const LabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Team Board',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Board: $course'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingsCard(),
            const SizedBox(height: 12),
            const Welcome(),
            const SizedBox(height: 12),
            const Clock(),
            const SizedBox(height: 12),
            const SwapBoard(),
            const SizedBox(height: 12),
            const InfoPanel(),
            const SizedBox(height: 12),
            const SummaryRow(),
            const SizedBox(height: 12),
            const ShareRow(),
            const SizedBox(height: 12),
            const InfoBox(),
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const Key('settings'),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          'Seed: $seed | Course: $course\n'
          'Start: $startSec | Tick: $tick | Ticks: $ticks | Stop: $stopAt\n'
          'Tiles: $tileA, $tileB, $tileC | Taps: $tapsToMake\n'
          'Main: $mainName | Cross: $crossName\n'
          'Fixed width: $fixedW | Flex: $flexA:$flexB\n'
          'Margin: $boxMargin | Padding: $boxPad | Radius: $boxRadius\n'
          'Border: $boxBorder | Hue: $hue\n'
          'Dots: $dotTop, $dotRight, $dotBottom, $dotLeft',
          style: const TextStyle(fontFamily: 'monospace'),
        ),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  const SummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    // Constraints go down, sizes go up.
    // Expanded gives each Text part of the available Row width.
    // This allows the text to wrap instead of overflowing.
    return Row(
      children: [
        Expanded(
          child: Text(
            'Part A: read the widget tree of the $course board from top to bottom.',
            key: const Key('sum-a'),
          ),
        ),
        Expanded(
          child: Text(
            'Part B: build each box from small widgets and never extend a built-in class.',
            key: const Key('sum-b'),
          ),
        ),
        Expanded(
          child: Text(
            'Part C: break the layout on purpose, then fix it with Expanded or Wrap.',
            key: const Key('sum-c'),
          ),
        ),
      ],
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer? _timer;
  int _seconds = startSec;
  int _builds = 0;

  @override
  void initState() {
    super.initState();
    lifecycleLog.add('initState');

    _timer = Timer.periodic(
      Duration(seconds: tick),
      (timer) {
        if (_seconds >= stopAt) {
          timer.cancel();
        } else {
          setState(() {
            _seconds += tick;
          });

          if (_seconds >= stopAt) {
            timer.cancel();
          }
        }
      },
    );
  }

  @override
  void dispose() {
    lifecycleLog.add('dispose');
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _builds++;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Clock: $_seconds s',
              key: const Key('clock-seconds'),
            ),
            Text(
              'Builds: $_builds',
              key: const Key('clock-builds'),
            ),
            Probe(seconds: _seconds),
          ],
        ),
      ),
    );
  }
}

class Probe extends StatelessWidget {
  final int seconds;

  const Probe({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    final scaffoldFound =
        context.findAncestorWidgetOfExactType<Scaffold>();

    // Widget: configuration describing what should appear.
    // Element: connects the widget to its place in the tree.
    // RenderObject: handles layout and painting.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Probe sees: $seconds',
          key: const Key('probe-seen'),
        ),
        const Text(
          'Widget: Probe',
          key: Key('probe-widget'),
        ),
        const Text(
          'Element: mounted in the widget tree',
          key: Key('probe-element'),
        ),
        const Text(
          'Context: gives access to this location in the tree',
          key: Key('probe-context'),
        ),
        Text(
          'Scaffold ancestor found: ${scaffoldFound != null}',
          key: const Key('probe-above'),
        ),
      ],
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome, $studentName',
        key: const Key('welcome'),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  final String label;

  const Tile(this.label, {super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  int taps = 0;

  @override
  Widget build(BuildContext context) {
    // Composition means building a widget using other widgets.
    return ElevatedButton(
      onPressed: () {
        setState(() {
          taps++;
        });
      },
      child: Text('${widget.label}: $taps'),
    );
  }
}

class SwapBoard extends StatefulWidget {
  const SwapBoard({super.key});

  @override
  State<SwapBoard> createState() => _SwapBoardState();
}

class _SwapBoardState extends State<SwapBoard> {
  var tiles = [
    Tile(tileA, key: ValueKey(tileA)),
    Tile(tileB, key: ValueKey(tileB)),
    Tile(tileC, key: ValueKey(tileC)),
  ];

  void swap() {
    setState(() {
      tiles = tiles.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Keys help Flutter match each tile with its existing State.
    // Without keys, State can remain attached to a position when reordered.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: tiles),
        ElevatedButton(
          key: const Key('swap'),
          onPressed: swap,
          child: const Text('Swap'),
        ),
      ],
    );
  }
}

class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    // A Column's main axis is vertical and its cross axis is horizontal.
    // A Row's main axis is horizontal and its cross axis is vertical.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          key: const Key('info-row'),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Start: $startSec s',
              key: const Key('row-a'),
            ),
            Text(
              'Tick: $tick s',
              key: const Key('row-b'),
            ),
            Text(
              'Stop: $stopAt s',
              key: const Key('row-c'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          key: const Key('info-col'),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Name: $studentName',
              key: const Key('col-a'),
            ),
            Text(
              'Roll no: $rollNo',
              key: const Key('col-b'),
            ),
            Text(
              'Course: $course',
              key: const Key('col-c'),
            ),
          ],
        ),
      ],
    );
  }
}

class ShareRow extends StatelessWidget {
  const ShareRow({super.key});

  @override
  Widget build(BuildContext context) {
    // The fixed child takes its requested width first.
    // The remaining width is divided according to flexA:flexB.
    // Expanded fills its share; Flexible can remain at its natural size.
    //
    // If Expanded and Flexible are swapped, the first button (Exp) can
    // stay at its natural size while the second button (Flex) must fill
    // its share. Expanded is Flexible with fit: FlexFit.tight.
    return Row(
      key: const Key('share-row'),
      children: [
        SizedBox(
          key: const Key('fixed'),
          width: fixedW,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('F'),
          ),
        ),
        Expanded(
          flex: flexA,
          child: ElevatedButton(
            key: const Key('exp'),
            onPressed: () {},
            child: const Text('Exp'),
          ),
        ),
        Flexible(
          flex: flexB,
          child: ElevatedButton(
            key: const Key('flex'),
            onPressed: () {},
            child: const Text('Flex'),
          ),
        ),
      ],
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Padding is inside the border; margin is outside the border.
    // Use Padding for simple inner space or SizedBox for fixed dimensions
    // or gaps. Use Container when several layout and decoration settings
    // are needed together.
    return Container(
      key: const Key('info-box'),
      margin: EdgeInsets.all(boxMargin),
      padding: EdgeInsets.all(boxPad),
      decoration: BoxDecoration(
        color: swatches[hue]!.shade100,
        borderRadius: BorderRadius.circular(boxRadius),
        border: Border.all(width: boxBorder),
      ),
      child: Text(
        'Course: $course',
        key: const Key('box-text'),
      ),
    );
  }
}
