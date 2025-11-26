<<<<<<< HEAD
class CalculateRiskLevel {
  String execute(int score) {
    String level;
    if (score < 10) {
      level = "Rendah";
    } else if (score < 20) {
      level = "Sedang";
    } else {
      level = "Tinggi";
    }
    return level;
=======
import '../entities/mental_result.dart';

class CalculateRiskLevel {
  MentalResult execute(int score) {
    String level;
    String message;

    if (score <= 9) {
      level = "Normal";
      message = "Kondisi psikologis Anda tergolong stabil dan tidak menunjukkan tanda stres atau depresi yang signifikan.";
    } else if (score <= 19) {
      level = "Ringan";
      message = "Terdapat gejala ringan seperti mudah lelah, sulit fokus, atau sedikit cemas. Disarankan istirahat cukup dan lakukan kegiatan menyenangkan untuk menjaga keseimbangan emosional.";
    } else if (score <= 29) {
      level = "Sedang";
      message = "Mulai menunjukkan gejala stres, cemas, atau depresi sedang. Pertimbangkan untuk berbicara dengan teman, keluarga, atau melakukan konsultasi ringan dengan psikolog.";
    } else if (score <= 44) {
      level = "Cukup Berat";
      message = "Gejala psikologis sudah cukup mengganggu aktivitas sehari-hari. Sangat disarankan untuk berkonsultasi dengan profesional kesehatan mental agar mendapatkan penanganan yang tepat.";
    } else {
      level = "Berat";
      message = "Kondisi psikologis tergolong berat. Anda mungkin mengalami stres atau depresi signifikan. Segera temui psikolog atau psikiater untuk mendapatkan bantuan profesional.";
    }

    return MentalResult(
      score: score,
      riskLevel: level,
      message: message,
    );
>>>>>>> 6eaa85bd5af284d63379b913ffd6ae22ed3cefd3
  }
}
