enum TinhTrangBaoTonVN {
  quyHiem,
  nguyCap,
  daTuyetChung,
}
class DongVat {
  final String tenVI;
  final String tenEN;
  final String tenKhoaHoc;
  final String
      tenTimKiem;
  final String duongDanAnh;
  final TinhTrangBaoTonVN tinhTrang;
  final List<String> danhSachAnh;
  final String phanLoaiVI;
  final String phanLoaiEN;
  final String hinhThaiVI;
  final String hinhThaiEN;
  final String phanBoVI;
  final String phanBoEN;
  final String tapTinhVI;
  final String tapTinhEN;
  final String sinhSanVI;
  final String sinhSanEN;
  final String vaiTroSinhThaiVI;
  final String vaiTroSinhThaiEN;
  final String tinhTrangBaoTonVI;
  final String tinhTrangBaoTonEN;
  final String thongTinThuViVI;
  final String thongTinThuViEN;

  DongVat({
    required this.tenVI,
    required this.tenEN,
    required this.tenKhoaHoc,
    required this.tenTimKiem,
    required this.duongDanAnh,
    required this.tinhTrang,
    this.danhSachAnh = const [],
    required this.phanLoaiVI,
    required this.phanLoaiEN,
    required this.hinhThaiVI,
    required this.hinhThaiEN,
    required this.phanBoVI,
    required this.phanBoEN,
    required this.tapTinhVI,
    required this.tapTinhEN,
    required this.sinhSanVI,
    required this.sinhSanEN,
    required this.vaiTroSinhThaiVI,
    required this.vaiTroSinhThaiEN,
    required this.tinhTrangBaoTonVI,
    required this.tinhTrangBaoTonEN,
    required this.thongTinThuViVI,
    required this.thongTinThuViEN,
  });
}
