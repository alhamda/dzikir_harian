import 'package:dzikir_harian/ayah.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dzikir Pagi dan Petang',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade400,
          elevation: 0,
        ),
        sliderTheme: SliderThemeData(
          thumbColor: Colors.amber.shade400,
          activeTrackColor: Colors.amber.shade400,
          inactiveTrackColor: Colors.teal.shade500,
        ),
        primarySwatch: Colors.teal,
        useMaterial3: false,
      ),
      home: const DhikrScreen(),
    );
  }
}

class DhikrScreen extends StatefulWidget {
  const DhikrScreen({super.key});

  @override
  State<DhikrScreen> createState() => _DhikrScreenState();
}

class _DhikrScreenState extends State<DhikrScreen>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  bool _showSetting = false;

  double _currentSliderValue = 20;

  double _fontArabicSize = 15.0;
  double _fontLatinSize = 15.0;
  double _fontTerjemahanSize = 15.0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _toggleSetting() {
    setState(() {
      _showSetting = !_showSetting;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_showSetting ? 'Ukuran Huruf' : 'Dzikir Pagi'),
        actions: [
          IconButton(
            onPressed: _toggleSetting,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _showSetting
                  ? const Icon(
                      Icons.close,
                      key: ValueKey<int>(1),
                    )
                  : const Icon(
                      Icons.settings,
                      key: ValueKey<int>(2),
                    ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageViewController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  children: const [
                    Ayah(),
                    Ayah(),
                    Ayah(),
                    Ayah(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  border: Border(
                    top: BorderSide(
                      width: 0.5,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.teal.withOpacity(0.1),
                          child: InkWell(
                            onTap: () {
                              _pageViewController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.chevron_left),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        '${_currentPageIndex + 1} dari 4',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(),
                      )),
                      ClipOval(
                        child: Material(
                          color: Colors.teal.withOpacity(0.1),
                          child: InkWell(
                            onTap: () {
                              _pageViewController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.chevron_right),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(color: Colors.teal.shade400, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ]),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: SizedBox(
                width: double.infinity,
                height: _showSetting ? 260 : 0,
                child: _showSetting
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Arab',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Slider(
                              value: _fontArabicSize,
                              min: 12,
                              max: 100,
                              label: _fontArabicSize.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _fontArabicSize = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Latin',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Slider(
                              value: _fontLatinSize,
                              min: 12,
                              max: 100,
                              label: _fontLatinSize.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _fontLatinSize = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Terjemahan',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Slider(
                              value: _fontTerjemahanSize,
                              min: 12,
                              max: 100,
                              label: _fontTerjemahanSize.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _fontTerjemahanSize = value;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
