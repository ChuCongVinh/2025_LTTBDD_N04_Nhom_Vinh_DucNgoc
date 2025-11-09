import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class TrangUngHo extends StatelessWidget {
  const TrangUngHo({super.key});
  Widget _buildBankInfoRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isVietnamese,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(icon,
              color: Colors.teal.shade700,
              size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  isVietnamese
                      ? title.split('/').first
                      : title.split('/').last,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 15,
                      color: Colors.grey.shade800,
                      height: 1.4),
                ),
              ],
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
                'vi' ??
            true;
    final Map<String, String> content = {
      'banner_title': isVietnamese
          ? "ĐÓNG GÓP GIÚP ĐỘNG VẬT HOANG DÃ"
          : "CONTRIBUTE TO HELP WILDLIFE",
      'title_1': isVietnamese
          ? "CÙNG NHAU HÀNH ĐỘNG"
          : "LET'S ACT TOGETHER",
      'title_2': isVietnamese
          ? "CỨU NHỮNG CÁ THỂ ĐỘNG VẬT HOANG DÃ NGUY CẤP"
          : "SAVE ENDANGERED WILDLIFE SPECIES",
      'paragraph': isVietnamese
          ? "Trung tâm Bảo tồn Động vật Hoang dã tại Việt Nam (Save Vietnam's Wildlife) là một tổ chức khoa học công nghệ phi lợi nhuận, hoạt động với mục đích phi lợi nhuận. Các hoạt động của chúng tôi dựa vào sự đóng góp, tài trợ của cộng đồng để thực hiện các chương trình bảo vệ, cứu hộ, phục hồi, chăm sóc và tái thả động vật hoang dã nguy cấp. Đừng quên rằng những nỗ lực bảo tồn của chúng tôi được hỗ trợ bởi những đóng góp của bạn!\n\nHãy cùng chúng tôi tiếp tục cuộc đấu tranh cho bảo tồn động vật hoang dã bằng một trong những cách sau:"
          : "Save Vietnam's Wildlife is a non-profit, scientific and technical organization operating for non-profit purposes. Our activities rely on community donations and funding to carry out programs to protect, rescue, rehabilitate, care for, and re-release endangered wildlife. Don't forget that our conservation efforts are supported by your contributions!\n\nPlease join us in continuing the fight for wildlife conservation in one of the following ways:",
      'transfer_title': isVietnamese
          ? "CHUYỂN KHOẢN"
          : "BANK TRANSFER",
      'acc_number_title':
          "Số tài khoản/Account Number",
      'acc_holder_title':
          "Chủ tài khoản/Account Holder",
      'bank_title': "Ngân hàng/Bank",
      'details_title':
          "Nội dung chuyển khoản/Transfer Details",
    };

    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Text(isVietnamese
            ? "Ủng hộ Bảo tồn"
            : "Support Conservation"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(
                        "assets/images/gau_ngua.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withAlpha(
                            153),
                        BlendMode.darken),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(
                        16.0),
                    child: Text(
                      content['banner_title']!,
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.nunitoSans(
                              fontSize: 28,
                              fontWeight:
                                  FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                            Shadow(
                                blurRadius: 10,
                                color: Colors
                                    .black
                                    .withAlpha(
                                        179))
                          ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.1),
                        blurRadius: 10,
                        offset:
                            const Offset(0, 5),
                      )
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 32.0),
                  child: Column(
                    children: [
                      Text(
                        content['title_1']!,
                        textAlign:
                            TextAlign.center,
                        style: GoogleFonts
                            .nunitoSans(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold,
                          color: Colors
                              .green.shade700,
                          height: 1.4,
                        ),
                      ),
                      Text(
                        content['title_2']!,
                        textAlign:
                            TextAlign.center,
                        style: GoogleFonts
                            .nunitoSans(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold,
                          color: Colors
                              .green.shade700,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        content['paragraph']!,
                        style: GoogleFonts
                            .nunitoSans(
                                fontSize: 16,
                                height: 1.6),
                      ),
                      const Divider(
                          height: 48,
                          thickness: 1),
                      Text(
                        content[
                            'transfer_title']!,
                        textAlign:
                            TextAlign.center,
                        style: GoogleFonts
                            .nunitoSans(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 24),

                      _buildBankInfoRow(
                        context,
                        isVietnamese:
                            isVietnamese,
                        icon: Icons
                            .account_balance_wallet,
                        title: content[
                            'acc_number_title']!,
                        subtitle:
                            "345345345",
                      ),
                      _buildBankInfoRow(
                        context,
                        isVietnamese:
                            isVietnamese,
                        icon: Icons.person,
                        title: content[
                            'acc_holder_title']!,
                        subtitle:
                            "SAVE VIETNAM'S WILDLIFE",
                      ),
                      _buildBankInfoRow(
                        context,
                        isVietnamese:
                            isVietnamese,
                        icon:
                            Icons.account_balance,
                        title: content[
                            'bank_title']!,
                        subtitle:
                            "Ngân hàng TMCP Quốc tế Việt Nam – VIB, Chi nhánh Sở Giao Dịch, PGD Cửa Đông, Hà Nội", 
                      ),
                      _buildBankInfoRow(
                        context,
                        isVietnamese:
                            isVietnamese,
                        icon: Icons.description,
                        title: content[
                            'details_title']!,
                        subtitle: isVietnamese
                            ? "Họ tên Cá nhân / Tổ chức – Đóng góp ủng hộ SVW – Email / Số điện thoại"
                            : "Your Name / Organization – Donation for SVW – Email / Phone",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
