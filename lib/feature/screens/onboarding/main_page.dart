import 'package:yell/core/barrel/barrel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Widget> pages = const [OnboardOne(), OnboardTwo(), OnboardThree()];

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, AMRoutes.login);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => currentIndex = _controller.page?.round() ?? 0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) => setState(() => currentIndex = index),
              children: pages,
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: pages.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Theme.of(context).primaryColor,
              dotColor: isDark
                  ? AMColors.white.withValues(alpha: 0.4)
                  : Colors.grey.shade400,
              dotHeight: 8,
              dotWidth: 8,
              spacing: 10,
              expansionFactor: 2,
            ),
          ),
          AMGap.h15,
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: OnboardButton(
              pageController: _controller,
              currentIndex: currentIndex,
              onLastPage: _navigateToLogin,
            ),
          ),
        ],
      ),
    );
  }
}
