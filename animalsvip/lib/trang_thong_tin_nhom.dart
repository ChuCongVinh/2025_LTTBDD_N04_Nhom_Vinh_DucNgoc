import 'package:flutter/material.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';

class TrangThongTinNhom extends StatelessWidget {
  const TrangThongTinNhom({super.key});
  Widget _buildMemberCard(
      {required String ten,
      required String msv,
      required String lop,
      required String anh,
      required String
          tyLeDongGop,
      required bool isVietnamese}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor:
                  Colors.teal.shade100,
              backgroundImage: AssetImage(anh),
              onBackgroundImageError:
                  (exception, stackTrace) {
              },
              child: (AssetImage(anh).assetName ==
                      anh)
                  ? null
                  : const Icon(Icons.person,
                      size: 40,
                      color: Colors
                          .teal),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    ten,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold),
                  ),
                  const SizedBox(
                      height: 8),
                  Text(
                    msv,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16,
                        color:
                            Colors.grey.shade700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lop,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16,
                        color:
                            Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center,
                children: [
                  Text(
                    isVietnamese
                        ? 'Đóng góp'
                        : 'Contribution',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight:
                            FontWeight.w500),
                  ),
                  Text(
                    tyLeDongGop,
                    style: GoogleFonts.nunitoSans(
                        fontSize:
                            18,
                        color: Colors.black87,
                        fontWeight:
                            FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trangThaiUngDung =
        UngDungCuaToi.of(context);
    final isVietnamese =
        trangThaiUngDung?.locale.languageCode ==
                'vi' ??
            true;

    return Scaffold(
      appBar: AppBar(
        title: Text(isVietnamese
            ? "Thông tin nhóm"
            : "Group Info"),
        backgroundColor: Colors.teal,
      ),
      backgroundColor:
          Colors.teal.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              isVietnamese
                  ? "Nhóm: 2025_LTTBDD_N04_Nhom_Vinh_DucNgoc"
                  : "Group: 2025_LTTBDD_N04_Nhom_Vinh_DucNgoc",
              style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800),
            ),
            const SizedBox(height: 20),
            _buildMemberCard(
              ten: "Chu Công Vinh",
              tyLeDongGop:
                  "50%",
              msv: isVietnamese
                  ? "MSV: 22010358"
                  : "ID: 22010358",
              lop: isVietnamese
                  ? "Lớp: Lập trình cho thiết bị di động-1-1-25(N04)"
                  : "Class: Mobile Device Programming-1-1-25(N04)",
              anh:
                  "assets/images/vinh.jpg",
              isVietnamese: isVietnamese,
            ),

            _buildMemberCard(
              ten: "Nguyễn Đức Ngọc",
              tyLeDongGop:
                  "50%",
              msv: isVietnamese
                  ? "MSV: 22010457"
                  : "ID: 22010457",
              lop: isVietnamese
                  ? "Lớp: Lập trình cho thiết bị di động-1-1-25(N04)"
                  : "Class: Mobile Device Programming-1-1-25(N04)",
              anh:
                  "assets/images/ngoc.jpg",
              isVietnamese: isVietnamese,
            ),
          ],
        ),
      ),
    );
  }
}
