import 'package:flutter/material.dart';
import 'dong_vat.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';

class TrangChiTiet extends StatelessWidget {
  final DongVat dongVat;

  const TrangChiTiet(
      {super.key, required this.dongVat});
  void _showFullScreenImage(BuildContext context,
      String imagePath, String heroTag) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            iconTheme: const IconThemeData(
                color: Colors.white),
          ),
          body: Center(
            child: Hero(
              tag: heroTag,
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 0.5,
                maxScale: 4.0,
                child: Image.asset(imagePath,
                    fit: BoxFit.contain),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildImageGallery(
      BuildContext context) {
    if (dongVat.danhSachAnh.isEmpty)
      return const SizedBox.shrink();

    final isVietnamese = UngDungCuaToi.of(context)
            ?.locale
            .languageCode ==
        'vi';

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          isVietnamese
              ? "Thư viện ảnh"
              : "Image Gallery",
          style: GoogleFonts.nunitoSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2F6B2F),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dongVat.danhSachAnh.length,
            itemBuilder: (context, index) {
              final imagePath =
                  dongVat.danhSachAnh[index];
              final heroTag = imagePath;

              return Padding(
                padding: const EdgeInsets.only(
                    right: 8.0),
                child: GestureDetector(
                  onTap: () =>
                      _showFullScreenImage(
                          context,
                          imagePath,
                          heroTag),
                  child: Hero(
                    tag: heroTag,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(
                              10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black26,
                              blurRadius: 6,
                              offset:
                                  const Offset(
                                      0, 3),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          imagePath,
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context,
                                  error,
                                  stackTrace) =>
                              Container(
                            width: 120,
                            height: 100,
                            color:
                                Colors.grey[200],
                            child: const Icon(
                                Icons
                                    .broken_image,
                                color:
                                    Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildSection(
      String title, String content) {
    if (content.trim().isEmpty)
      return const SizedBox.shrink();

    return Padding(
      padding:
          const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.nunitoSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2F6B2F),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(
                  0xFFFAFCF8),
              borderRadius:
                  BorderRadius.circular(12),
              border: Border.all(
                  color: const Color(0xFFB8E6B8)),
            ),
            child: Text(
              content.trim(),
              textAlign: TextAlign.justify,
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trangThaiUngDung =
        UngDungCuaToi.of(context);
    final isVietnamese =
        trangThaiUngDung?.locale.languageCode ==
            'vi';
    final screenWidth =
        MediaQuery.of(context).size.width;
    bool useRowLayout = screenWidth > 600;
    Widget textContent = Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            dongVat.tenKhoaHoc,
            style: GoogleFonts.nunitoSans(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isVietnamese
                ? dongVat.tenVI
                : dongVat.tenEN,
            style: GoogleFonts.nunitoSans(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2F6B2F),
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
              isVietnamese
                  ? "1. Phân loại khoa học"
                  : "1. Scientific Classification",
              isVietnamese
                  ? dongVat.phanLoaiVI
                  : dongVat.phanLoaiEN),
          _buildSection(
              isVietnamese
                  ? "2. Đặc điểm hình thái"
                  : "2. Morphology",
              isVietnamese
                  ? dongVat.hinhThaiVI
                  : dongVat.hinhThaiEN),
          _buildSection(
              isVietnamese
                  ? "3. Phân bố và môi trường sống"
                  : "3. Distribution & Habitat",
              isVietnamese
                  ? dongVat.phanBoVI
                  : dongVat.phanBoEN),
          _buildSection(
              isVietnamese
                  ? "4. Tập tính và hành vi"
                  : "4. Behavior",
              isVietnamese
                  ? dongVat.tapTinhVI
                  : dongVat.tapTinhEN),
          _buildSection(
              isVietnamese
                  ? "5. Sinh sản và phát triển"
                  : "5. Reproduction",
              isVietnamese
                  ? dongVat.sinhSanVI
                  : dongVat.sinhSanEN),
          _buildSection(
              isVietnamese
                  ? "6. Vai trò sinh thái"
                  : "6. Ecological Role",
              isVietnamese
                  ? dongVat.vaiTroSinhThaiVI
                  : dongVat.vaiTroSinhThaiEN),
          _buildSection(
              isVietnamese
                  ? "7. Tình trạng bảo tồn"
                  : "7. Conservation Status",
              isVietnamese
                  ? dongVat.tinhTrangBaoTonVI
                  : dongVat.tinhTrangBaoTonEN),
          _buildSection(
              isVietnamese
                  ? "8. Thông tin thú vị"
                  : "8. Fun Facts",
              isVietnamese
                  ? dongVat.thongTinThuViVI
                  : dongVat.thongTinThuViEN),
        ],
      ),
    );
    Widget imageContent = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: GestureDetector(
        onTap: () => _showFullScreenImage(
            context,
            dongVat.duongDanAnh,
            dongVat.duongDanAnh),
        child: Hero(
          tag: dongVat.duongDanAnh,
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(12.0),
            child: Image.asset(
              dongVat.duongDanAnh,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) =>
                      Container(
                color: Colors.grey[300],
                child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                    size: 50),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(
          0xFFF6FFF7),
      appBar: AppBar(
        title: Text(isVietnamese
            ? dongVat.tenVI
            : dongVat.tenEN),
        backgroundColor: const Color(0xFF2F6B2F),
        elevation: 1.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: isVietnamese
                ? "Chia sẻ"
                : "Share",
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: useRowLayout
            ? Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: textContent),
                  const SizedBox(width: 32),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        imageContent,
                        const SizedBox(
                            height: 16),
                        _buildImageGallery(
                            context),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  imageContent,
                  const SizedBox(height: 16),
                  _buildImageGallery(context),
                  const SizedBox(height: 8),
                  textContent,
                ],
              ),
      ),
    );
  }
}
