import 'package:flutter/material.dart';

class SwipingScreen extends StatefulWidget {
  const SwipingScreen({super.key});

  @override
  State<SwipingScreen> createState() => _SwipingScreenState();
}

class _SwipingScreenState extends State<SwipingScreen> {
  List<Color> containerColors = [Colors.red, Colors.red, Colors.red];
  bool finished = false;

  void _onContainerTouched(int index) {
    setState(() {
      containerColors = [...containerColors]..[index] = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const size = 100.0;

    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Stack(
          children: [
            Positioned(
              left: 16,
              bottom: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              top: height * 0.15 - size / 2,
              left: width * 0.5 - size / 2,
              child: Semantics(
                label: 'Container 0',
                child: GestureDetector(
                  onTapDown: (_) => _onContainerTouched(0),
                  child: Container(
                    width: size,
                    height: size,
                    color: containerColors[0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.5 - size / 2,
              left: width * 0.15 - size / 2,
              child: GestureDetector(
                onTapDown: (_) => _onContainerTouched(1),
                child: Semantics(
                  label: 'Container 1',
                  child: Container(
                    width: size,
                    height: size,
                    color: containerColors[1],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.85 - size / 2,
              left: width * 0.85 - size / 2,
              child: GestureDetector(
                onTapDown: (_) => _onContainerTouched(2),
                child: Semantics(
                  label: 'Container 2',
                  child: Container(
                    width: size,
                    height: size,
                    color: containerColors[2],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.5 - size / 2,
              left: width * 0.85 - size / 2,
              child: GestureDetector(
                onTapDown: (_) => setState(() => finished = true),
                child: Container(
                  width: size,
                  height: size,
                  color: Colors.grey,
                  child: const Text('End here!'),
                ),
              ),
            ),
            if (containerColors.every((c) => c == Colors.green) && finished)
              const Center(child: Text('All green'))
          ],
        ),
      ),
    );
  }
}
