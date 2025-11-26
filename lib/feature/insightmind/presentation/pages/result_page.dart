import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/history_providers.dart';
import '../../domain/entities/mental_result.dart';
import 'history_detail_page.dart';

const Color kHistoryPageBackgroundColor = Color(0xFF9B9AFF);
const Color kHistoryPageBodyColor = Color(0xFFE0E0FF);
=======
import '../providers/score_provider.dart'; 
import '../providers/history_providers.dart'; 
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3

class ResultPage extends ConsumerStatefulWidget {
  const ResultPage({super.key});

  @override
  ConsumerState<ResultPage> createState() => _ResultPageState();
}

<<<<<<< HEAD
class _ResultPageState extends ConsumerState<ResultPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
=======
class _ResultPageState extends ConsumerState<ResultPage> {
  bool _saved = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_saved) {
      final result = ref.read(resultProvider); 
      ref
          .read(historyRepositoryProvider)
          .addRecord(score: result.score, riskLevel: result.riskLevel);
      _saved = true;
    }
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: kHistoryPageBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeader(context),
            _buildSubtitle(context),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kHistoryPageBodyColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Card(
                          elevation: 1,
                          child: SizedBox(width: 60.w, height: 7.h),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 40.h,
                      child: TabBar(
                        controller: _tabController,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0.w,
                          ),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white.withOpacity(0.5),
                        labelStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        unselectedLabelStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.sp,
                          ),
                        ),
                        tabs: const [
                          Tab(text: 'Tes Psikologi'),
                          Tab(text: 'Tes Mental'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          HistoryListTab(
                            provider: psikologiHistoryProvider,
                            type: HistoryType.psikologi,
                          ),
                          HistoryListTab(
                            provider: mentalHistoryProvider,
                            type: HistoryType.mental,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/img/logonotext.png', width: 40.w),
              SizedBox(width: 10.w),
              Text(
                'SoulScan',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'History',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
      child: Text(
        'Yukk Jaga Kesehatan Mental dan Sikologi kalian',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

enum HistoryType { psikologi, mental }

class HistoryListTab extends ConsumerWidget {
  final StateNotifierProvider<HistoryNotifier, List<MentalResult>> provider;
  final HistoryType type;

  const HistoryListTab({super.key, required this.provider, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MentalResult> historyList = ref.watch(provider);

    if (historyList.isEmpty) {
      return const Center(
        child: Text(
          'No history found.',
          style: TextStyle(color: Colors.black54),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: historyList.length,
      itemBuilder: (context, index) {
        final MentalResult result = historyList[index];

        if (type == HistoryType.psikologi) {
          return HistoryCardPsikologi(result: result);
        } else {
          return HistoryCardMental(result: result);
        }
      },
    );
  }
}

class HistoryCardPsikologi extends ConsumerWidget {
  final MentalResult result;
  const HistoryCardPsikologi({super.key, required this.result});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Image.asset('assets/img/logoOtak.png', width: 60.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tes Psikologi',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    result.description,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryDetailPage(
                            title: 'History Psikologi',
                            result: result,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFB7C5),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Lihat History Tes',
                      style: GoogleFonts.poppins(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Show confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Hapus Riwayat'),
                    content: const Text(
                      'Apakah Anda yakin ingin menghapus riwayat ini?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          ref
                              .read(psikologiHistoryProvider.notifier)
                              .removeResultFromHistory(result);
                          Navigator.pop(context);
                        },
                        child: const Text('Hapus'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryCardMental extends ConsumerWidget {
  final MentalResult result;
  const HistoryCardMental({super.key, required this.result});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Image.asset('assets/img/logoMental.png', width: 60.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tes Kesehatan Mental',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    result.description,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryDetailPage(
                            title: 'History Mental',
                            result: result,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA8E6CF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Lihat History Tes',
                      style: GoogleFonts.poppins(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Show confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Hapus Riwayat'),
                    content: const Text(
                      'Apakah Anda yakin ingin menghapus riwayat ini?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          ref
                              .read(mentalHistoryProvider.notifier)
                              .removeResultFromHistory(result);
                          Navigator.pop(context);
                        },
                        child: const Text('Hapus'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
=======
    final result = ref.watch(resultProvider);

    // String recommendation;
    // switch (result.riskLevel) {
    //   case 'Tinggi':
    //     recommendation = 'Pertimbangkan berbicara dengan konselor atau psikolog. '
    //         'Kurangi beban, istirahat cukup, dan hubungi layanan konseling.';
    //     break;
    //   case 'Sedang':
    //     recommendation =
    //         'Lakukan relaksasi rutin, olahraga ringan, dan evaluasi beban harian.';
    //     break;
    //   default:
    //     recommendation =
    //         'Pertahankan kebiasaan baik. Jaga pola tidur, makan, dan olahraga.';
    // }

    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Screening')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.emoji_objects, size: 60, color: Colors.indigo),
                  const SizedBox(height: 12),
                  Text(
                    'Skor Anda: ${result.score}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Tingkat Risiko: ${result.riskLevel}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: result.riskLevel == 'Tinggi'
                          ? Colors.red
                          : result.riskLevel == 'Sedang'
                              ? Colors.orange
                              : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    result.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Hasil telah disimpan di perangkat (Riwayat).',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali'),
                  ),
                ],
              ),
            ),
          ),
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3
        ),
      ),
    );
  }
}
