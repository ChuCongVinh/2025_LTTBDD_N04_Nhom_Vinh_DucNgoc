import 'package:flutter/material.dart';
import 'dong_vat.dart';
import 'du_lieu_dong_vat.dart';
import 'trang_chi_tiet.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'trang_thong_tin_nhom.dart';
import 'trang_ung_ho.dart';

class TrangChu extends StatefulWidget {
  const TrangChu({super.key});

  @override
  State<TrangChu> createState() =>
      _TrangThaiTrangChu();
}

class _TrangThaiTrangChu extends State<TrangChu> {
  TinhTrangBaoTonVN? _boLocHienTai;
  final TextEditingController
      _boDieuKhienTimKiem =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _boDieuKhienTimKiem.addListener(_locDongVat);
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      if (mounted &&
          (ModalRoute.of(context)?.isCurrent ??
              false)) {
        _showIntroAndRulesDialog(context);
      }
    });
  }

  void _locDongVat() {
    setState(() {});
  }

  @override
  void dispose() {
    _boDieuKhienTimKiem
        .removeListener(_locDongVat);
    _boDieuKhienTimKiem.dispose();
    super.dispose();
  }

  // Hàm hiển thị hộp thoại Giới thiệu và Quy tắc
  void _showIntroAndRulesDialog(
      BuildContext context) {
    final isVietnamese = UngDungCuaToi.of(context)
            ?.locale
            .languageCode ==
        'vi';
    bool checkboxValue = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20)),
              backgroundColor:
                  const Color(0xFFF0F4F8),
              titlePadding: const EdgeInsets.only(
                  top: 24.0, bottom: 10.0),
              title: Text(
                isVietnamese
                    ? "Chào mừng & Quy tắc Bảo vệ"
                    : "Welcome & Protection Rules",
                textAlign: TextAlign.center,
                // SỬA PHÔNG CHỮ: Kế thừa Nunito Sans từ theme
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900),
              ),
              content: SizedBox(
                width: MediaQuery.of(context)
                        .size
                        .width *
                    0.8,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        isVietnamese
                            ? "Giới thiệu"
                            : "Introduction",
                        // SỬA PHÔNG CHỮ: Kế thừa Nunito Sans từ theme
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                            color: Colors
                                .blue.shade800),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isVietnamese
                            ? "Việt Nam là một trong những quốc gia có đa dạng sinh học cao nhất thế giới, là ngôi nhà của nhiều loài động vật quý hiếm. Tuy nhiên, nhiều loài đang phải đối mặt với nguy cơ tuyệt chủng do mất môi trường sống và nạn săn bắn trái phép. Ứng dụng này giúp nâng cao nhận thức về việc bảo tồn chúng."
                            : "Vietnam is one of the most biodiverse countries in the world, home to many rare animal species. However, many species are facing the threat of extinction due to habitat loss and illegal poaching. This application aims to raise awareness for their conservation.",
                        // Phông chữ mặc định (Nunito Sans)
                        style: const TextStyle(
                            fontSize: 15,
                            height: 1.4),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        isVietnamese
                            ? "Quy tắc Bảo vệ"
                            : "Protection Rules",
                        // SỬA PHÔNG CHỮ: Kế thừa Nunito Sans từ theme
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                            color: Colors
                                .green.shade800),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isVietnamese
                            ? "1. Không săn bắn, mua bán động vật hoang dã.\n2. Báo cho cơ quan chức năng khi thấy hành vi vi phạm.\n3. Không phá rừng, giữ gìn môi trường sống tự nhiên.\n4. Tìm hiểu và lan tỏa thông điệp bảo tồn."
                            : "1. Do not hunt or trade wildlife.\n2. Report violations to the authorities.\n3. Do not destroy forests, preserve natural habitats.\n4. Learn and spread the message of conservation.",
                        // Phông chữ mặc định (Nunito Sans)
                        style: const TextStyle(
                            fontSize: 15,
                            height: 1.4),
                      ),
                      const Divider(
                          height: 30,
                          thickness: 1),
                      CheckboxListTile(
                        title: Text(
                          isVietnamese
                              ? "Tôi sẽ tuân thủ Quy tắc bảo vệ động vật quý hiếm."
                              : "I will abide by the rules for protecting rare animals.",
                          // Phông chữ mặc định (Nunito Sans)
                          style: const TextStyle(
                              fontSize: 14),
                        ),
                        value: checkboxValue,
                        onChanged:
                            (bool? newValue) {
                          setDialogState(() {
                            checkboxValue =
                                newValue ?? false;
                          });
                        },
                        controlAffinity:
                            ListTileControlAffinity
                                .leading,
                        contentPadding:
                            EdgeInsets.zero,
                        activeColor: Colors.teal,
                      ),
                    ],
                  ),
                ),
              ),
              actionsAlignment:
                  MainAxisAlignment.center,
              actionsPadding:
                  const EdgeInsets.only(
                      bottom: 20.0),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: checkboxValue
                        ? Colors.teal
                        : Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                30)),
                    padding: const EdgeInsets
                        .symmetric(
                        horizontal: 50,
                        vertical: 14),
                  ),
                  onPressed: checkboxValue
                      ? () {
                          Navigator.of(
                                  dialogContext)
                              .pop();
                        }
                      : null,
                  child: Text(
                    isVietnamese
                        ? "Đồng ý"
                        : "Agree",
                    // SỬA PHÔNG CHỮ: Kế thừa Nunito Sans từ theme
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Widget Footer
  Widget _buildFooter(bool isVietnamese) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      color: Colors.teal.shade800,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center,
        children: [
          Text(
            isVietnamese
                ? "Thông tin Liên hệ"
                : "Contact Information",
            // SỬA PHÔNG CHỮ
            style: GoogleFonts.nunitoSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            isVietnamese
                ? "Email: 22010358@st.phenikaa-uni.edu.vn\nHotline: 0975419880\nĐịa chỉ: Hà Đông, Hà Nội"
                : "Email: 22010358@st.phenikaa-uni.edu.vn\nHotline: 0975419880\nAddress: Ha Dong, Hanoi",
            textAlign: TextAlign.center,
            // Phông chữ mặc định (Nunito Sans)
            style: TextStyle(
                color: Colors.teal.shade100,
                height: 1.5),
          ),
          const SizedBox(height: 20),
          Text(
            isVietnamese
                ? "Kết nối với Chúng tôi"
                : "Connect with Us",
            // SỬA PHÔNG CHỮ
            style: GoogleFonts.nunitoSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.facebook,
                      color: Colors.white),
                  onPressed: () {},
                  tooltip: "Facebook"),
              IconButton(
                  icon: const Icon(
                      Icons.photo_camera_outlined,
                      color: Colors.white),
                  onPressed: () {},
                  tooltip: "Instagram"),
              IconButton(
                  icon: const Icon(
                      Icons.play_circle_outline,
                      color: Colors.white),
                  onPressed: () {},
                  tooltip: "YouTube"),
            ],
          ),
          const SizedBox(height: 20),
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

    final String tuKhoaTimKiem =
        _boDieuKhienTimKiem.text.toLowerCase();
    final danhSachDaLoc =
        danhSachDongVat.where((dongVat) {
      final locTinhTrang = (_boLocHienTai ==
              null) ||
          (dongVat.tinhTrang == _boLocHienTai);

      final tenHienThi = (isVietnamese
              ? dongVat.tenVI
              : dongVat.tenEN)
          .toLowerCase();
      final tenKhoaHoc =
          dongVat.tenKhoaHoc.toLowerCase();
      final locTimKiem =
          tenHienThi.contains(tuKhoaTimKiem) ||
              tenKhoaHoc.contains(tuKhoaTimKiem);

      return locTinhTrang && locTimKiem;
    }).toList();

    final orientation =
        MediaQuery.of(context).orientation;
    final isPortrait =
        orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              height: 32,
              errorBuilder:
                  (context, error, stackTrace) {
                return const Icon(Icons.pets,
                    color: Colors.white,
                    size: 28);
              },
            ),
            const SizedBox(width: 10),
            Text(
              isVietnamese
                  ? "Động Vật Việt Nam"
                  : "Animals of Vietnam",
              style: GoogleFonts.pacifico(
                fontSize: 22,
                color: Colors
                    .white,
                fontWeight: FontWeight
                    .normal,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: isVietnamese
                ? 'Switch to English'
                : 'Chuyển sang Tiếng Việt',
            onPressed: () {
              final newLocale = isVietnamese
                  ? const Locale('en')
                  : const Locale('vi');
              trangThaiUngDung
                  ?.setLocale(newLocale);
              setState(() {});
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.teal,
                  image: DecorationImage(
                      image: AssetImage(
                          danhSachDongVat
                                  .isNotEmpty
                              ? danhSachDongVat[0]
                                  .duongDanAnh
                              : 'assets/images/placeholder.jpg'),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(
                              Colors.black
                                  .withAlpha(128),
                              BlendMode.darken))),
              child: Text(
                isVietnamese
                    ? 'Menu Chính'
                    : 'Main Menu',
                style: GoogleFonts.nunitoSans(
                  fontSize: 28,
                  fontWeight:
                      FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading:
                  const Icon(Icons.home_outlined),
              title: Text(isVietnamese
                  ? 'Trang chủ'
                  : 'Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.info_outline),
              title: Text(isVietnamese
                  ? 'Giới thiệu'
                  : 'Introduction'),
              onTap: () {
                _showIntroAndRulesDialog(context);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.pets_outlined),
              title: Text(isVietnamese
                  ? 'Các loài động vật'
                  : 'Species'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.map_outlined),
              title: Text(isVietnamese
                  ? 'Bản đồ phân bố'
                  : 'Distribution Map'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                  Icons.article_outlined),
              title: Text(isVietnamese
                  ? 'Tin tức / Bài viết'
                  : 'News / Articles'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons
                  .volunteer_activism_outlined),
              title: Text(isVietnamese
                  ? 'Ủng hộ Bảo tồn'
                  : 'Support Conservation'),
              onTap: () {
                Navigator.pop(
                    context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const TrangUngHo()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons
                  .group_outlined),
              title: Text(isVietnamese
                  ? 'Thông tin nhóm'
                  : 'Group Info'),
              onTap: () {
                Navigator.pop(
                    context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const TrangThongTinNhom()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.teal.shade50,
              Colors.green.shade100,
            ],
          ),
        ),
        child: ListView(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(danhSachDongVat
                          .isNotEmpty
                      ? danhSachDongVat[0]
                          .duongDanAnh
                      : 'assets/images/ho_dong_duong.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withAlpha(102),
                      BlendMode.darken),
                ),
              ),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.all(16.0),
                  child: Text(
                    isVietnamese
                        ? "Khám phá Thế giới Động vật Quý hiếm Việt Nam"
                        : "Discover Vietnam's Rare Animal World",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                        fontSize: 32,
                        fontWeight: FontWeight
                            .bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              blurRadius: 10,
                              color: Colors.black
                                  .withAlpha(179))
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  16.0, 16.0, 16.0, 8.0),
              child: TextField(
                controller: _boDieuKhienTimKiem,
                decoration: InputDecoration(
                  hintText: isVietnamese
                      ? "Tìm loài theo tên..."
                      : "Search species by name...",
                  prefixIcon:
                      const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                            30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(
                          vertical: 14.0),
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                FilterChip(
                  label: Text(isVietnamese
                      ? "Tất cả"
                      : "All"),
                  selected: _boLocHienTai == null,
                  onSelected: (selected) =>
                      setState(() =>
                          _boLocHienTai = null),
                ),
                FilterChip(
                  label: Text(isVietnamese
                      ? "Quý hiếm"
                      : "Rare"),
                  selected: _boLocHienTai ==
                      TinhTrangBaoTonVN.quyHiem,
                  onSelected: (selected) =>
                      setState(() =>
                          _boLocHienTai =
                              TinhTrangBaoTonVN
                                  .quyHiem),
                ),
                FilterChip(
                  label: Text(isVietnamese
                      ? "Nguy cấp"
                      : "Endangered"),
                  selected: _boLocHienTai ==
                      TinhTrangBaoTonVN.nguyCap,
                  onSelected: (selected) =>
                      setState(() =>
                          _boLocHienTai =
                              TinhTrangBaoTonVN
                                  .nguyCap),
                ),
                FilterChip(
                  label: Text(isVietnamese
                      ? "Đã tuyệt chủng"
                      : "Extinct"),
                  selected: _boLocHienTai ==
                      TinhTrangBaoTonVN
                          .daTuyetChung,
                  onSelected: (selected) =>
                      setState(() =>
                          _boLocHienTai =
                              TinhTrangBaoTonVN
                                  .daTuyetChung),
                ),
              ],
            ),
            GridView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    isPortrait ? 3 : 6,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.8,
              ),
              itemCount: danhSachDaLoc.length,
              itemBuilder: (context, index) {
                final dongVat =
                    danhSachDaLoc[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TrangChiTiet(
                                dongVat: dongVat),
                      ),
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              15.0),
                    ),
                    child: GridTile(
                      footer: GridTileBar(
                        backgroundColor:
                            Colors.black54,
                        title: Text(
                          isVietnamese
                              ? dongVat.tenVI
                              : dongVat.tenEN,
                          textAlign:
                              TextAlign.center,
                          style: const TextStyle(
                              fontSize: 13),
                        ),
                      ),
                      child: Hero(
                        tag: dongVat.duongDanAnh,
                        child: Image.asset(
                          dongVat.duongDanAnh,
                          fit: BoxFit.cover,
                          errorBuilder: (context,
                              error, stackTrace) {
                            return const Icon(
                                Icons
                                    .image_not_supported,
                                color:
                                    Colors.grey,
                                size: 40);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            _buildFooter(isVietnamese),
          ],
        ),
      ),
    );
  }
}
