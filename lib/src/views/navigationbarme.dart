import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_project_pam/feature/insightmind/presentation/pages/result_page.dart';
=======
import 'package:flutter_project_pam/feature/insightmind/presentation/pages/history_page.dart';
import 'package:flutter_project_pam/feature/insightmind/presentation/pages/result_page.dart';
import 'package:flutter_project_pam/feature/insightmind/presentation/pages/screening_page_psikologi.dart';
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project_pam/feature/insightmind/presentation/pages/home_page.dart';
import 'package:flutter_project_pam/feature/insightmind/presentation/pages/setting.dart';
import 'package:google_fonts/google_fonts.dart';

<<<<<<< HEAD
class Navigationbarme extends StatefulWidget {
  final int initialIndex;

  const Navigationbarme({super.key, this.initialIndex = 0});
=======

class Navigationbarme extends StatefulWidget {
  const Navigationbarme({super.key});
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3

  @override
  State<Navigationbarme> createState() => _NavigationbarmeState();
}

class _NavigationbarmeState extends State<Navigationbarme> {
<<<<<<< HEAD
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  final List<Widget> _listPage = [
    const HomePage(),
    const ResultPage(),
=======
  int selectedIndex = 0;

  final List<Widget> _listPage = [
    const HomePage(),
    const HistoryPage(),
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3
    // const Coba(),
    // const ScreeningPage(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _listPage[selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 8.h, bottom: 6.h),
        decoration: BoxDecoration(
<<<<<<< HEAD
          color: const Color(0xFFE7E3FF),
=======
          color: const Color(0xFFE7E3FF), 
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, "Home", 0),
            _buildNavItem(Icons.history, "History", 1),
            _buildNavItem(Icons.settings_outlined, "Setting", 2),
            // _buildNavItem(Icons.settings_outlined, "Coba", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color(0xFF8A84FF)
                : const Color(0xFF7A76A8),
            size: 28.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
<<<<<<< HEAD
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xFF8A84FF)
                    : const Color(0xFF7A76A8),
              ),
            ),
          ),
          SizedBox(height: 10.h),
=======
            style: GoogleFonts.poppins(textStyle: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? const Color(0xFF8A84FF)
                  : const Color(0xFF7A76A8),
            ),)
          ),
          SizedBox(height: 10.h,),
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 4.h,
            width: isSelected ? 40.w : 0,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF8A84FF) : Colors.transparent,
<<<<<<< HEAD
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.r),
                topRight: Radius.circular(4.r),
              ),
=======
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r), topRight: Radius.circular(4.r)),
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3
            ),
          ),
        ],
      ),
    );
  }
}
<<<<<<< HEAD
=======


>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3
