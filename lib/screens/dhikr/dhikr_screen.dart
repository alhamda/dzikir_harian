import 'package:dzikir_harian/models/dhikr_model.dart';
import 'package:flutter/material.dart';
import 'package:dzikir_harian/cubits/setting_cubit.dart';
import 'package:dzikir_harian/screens/dhikr/widgets/dhikr_item_widget.dart';
import 'package:dzikir_harian/screens/dhikr/widgets/setting_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DhikrScreen extends StatefulWidget {
  final String title;
  final List<DhikrModel> data;
  const DhikrScreen({super.key, required this.title, required this.data});

  @override
  State<DhikrScreen> createState() => _DhikrScreenState();
}

class _DhikrScreenState extends State<DhikrScreen>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  bool _showSetting = false;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: widget.data.length, vsync: this);
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
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SafeArea(
        child: Stack(
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
                    children: widget.data
                        .map((item) => DhikrItemWidget(dhikr: item))
                        .toList(),
                  ),
                ),
                _footerNav(),
              ],
            ),
            SettingWidget(isVisible: _showSetting)
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget? _appBar() {
    return AppBar(
      centerTitle: true,
      elevation: _showSetting ? 0 : 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      title: Text(
        _showSetting ? 'Ukuran Huruf' : widget.title,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        AnimatedScale(
          scale: _showSetting ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 150),
          child: IconButton(
            tooltip: 'Reset Ukuran Huruf',
            onPressed: () => context.read<SettingCubit>().reset(),
            icon: const Icon(Icons.replay_outlined),
          ),
        ),
        IconButton(
          tooltip: _showSetting ? 'Tutup' : 'Pengaturan',
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
    );
  }

  Widget _footerNav() {
    return Container(
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
                color: _currentPageIndex > 0
                    ? Colors.green.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.1),
                child: InkWell(
                  onTap: _currentPageIndex > 0
                      ? () {
                          _pageViewController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.chevron_left),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Text(
              '${_currentPageIndex + 1} dari ${widget.data.length}',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(),
            )),
            ClipOval(
              child: Material(
                color: _currentPageIndex < widget.data.length - 1
                    ? Colors.green.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.1),
                child: InkWell(
                  onTap: _currentPageIndex < widget.data.length - 1
                      ? () {
                          _pageViewController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
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
    );
  }
}
