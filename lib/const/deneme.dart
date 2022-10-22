// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

void main() {
  final liste = <int>[];
  final random = Random();
  final sonuc = <int, Map<String, dynamic>>{};
  for (final element in kadroListe) {
    var id = 0;
    do {
      id = random.nextInt(900000) + 100000;
    } while (liste.contains(id));
    liste.add(id);
    sonuc[id] = element;
  }
}

const kadroListe = [
  {
    'sira': 1,
    'İL': 'ADANA',
    'kurum': 'Çukurova Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 7,
    'basvurabilen': ['ADANA', 'OSMANİYE']
  },
  {
    'sira': 2,
    'İL': 'ADANA',
    'kurum': 'SBÜ Adana Şehir Hastanesi',
    'tür': 'ŞH.',
    'kontenjan': 14,
    'basvurabilen': ['ADANA', 'OSMANİYE']
  },
  {
    'sira': 3,
    'İL': 'AFYONKARAHİSAR',
    'kurum': 'Afyonkarahisar Sağlık Bilimleri Üniversitesi',
    'tür': 'ÜNV.',
    'kontenjan': 10,
    'basvurabilen': ['AFYONKARAHİSAR']
  },
  {
    'sira': 4,
    'sehir': 'ANKARA',
    'kurum': 'Ankara Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 5,
    'basvurabilen': ['ANKARA', 'ÇANKIRI', 'KIRIKKALE', 'KIRŞEHİR']
  },
  {
    'sira': 5,
    'İL': 'ANKARA',
    'kurum': 'Başkent Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 5,
    'basvurabilen': ['ANKARA', 'ÇANKIRI', 'KIRIKKALE', 'KIRŞEHİR']
  },
  {
    'sira': 6,
    'İL': 'ANKARA',
    'kurum': 'SBÜ Gülhane Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 5,
    'basvurabilen': ['ANKARA', 'ÇANKIRI', 'KIRIKKALE', 'KIRŞEHİR']
  },
  {
    'sira': 7,
    'İL': 'ANKARA',
    'kurum': 'SBÜ Ankara Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 9,
    'basvurabilen': ['ANKARA', 'ÇANKIRI', 'KIRIKKALE', 'KIRŞEHİR']
  },
  {
    'sira': 8,
    'İL': 'ANKARA',
    'kurum': 'SBÜ Dışkapı Yıldırım Beyazıt Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 9,
    'basvurabilen': ['ANKARA', 'ÇANKIRI', 'KIRIKKALE', 'KIRŞEHİR']
  },
  {
    'sira': 9,
    'İL': 'ANKARA',
    'kurum': 'SBÜ Ankara Atatürk Sanatoryum Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 5,
    'basvurabilen': ['ANKARA', 'ÇANKIRI', 'KIRIKKALE', 'KIRŞEHİR']
  },
  {
    'sira': 10,
    'İL': 'ANKARA',
    'kurum': 'Hacettepe Üniversitesi',
    'tür': 'ÜNV.',
    'kontenjan': 4,
    'basvurabilen': ['ANKARA', 'ÇANKIRI', 'KIRIKKALE', 'KIRŞEHİR']
  },
  {
    'sira': 11,
    'İL': 'ANKARA',
    'kurum': 'SBÜ Ankara Şehir Hastanesi',
    'tür': 'ŞH.',
    'kontenjan': 20,
    'basvurabilen': ['ANKARA', 'ÇANKIRI', 'KIRIKKALE', 'KIRŞEHİR']
  },
  {
    'sira': 12,
    'İL': 'ANKARA',
    'kurum': 'Ankara Yıldırım Beyazıt Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 18,
    'basvurabilen': ['ANKARA', 'ÇANKIRI', 'KIRIKKALE', 'KIRŞEHİR']
  },
  {
    'sira': 13,
    'İL': 'ANTALYA',
    'kurum': 'Akdeniz Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 7,
    'basvurabilen': ['ANTALYA']
  },
  {
    'sira': 14,
    'İL': 'ANTALYA',
    'kurum': 'SBÜ Antalya Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 9,
    'basvurabilen': ['ANTALYA']
  },
  {
    'sira': 15,
    'İL': 'AYDIN',
    'kurum': 'Adnan Menderes Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 6,
    'basvurabilen': ['AYDIN']
  },
  {
    'sira': 16,
    'İL': 'BOLU',
    'kurum':
        'Bolu Abant İzzet Baysal Üniversitesi İzzet Baysal Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 6,
    'basvurabilen': ['BOLU']
  },
  {
    'sira': 17,
    'İL': 'BURSA',
    'kurum': 'Uludağ Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 9,
    'basvurabilen': ['BURSA', 'BALIKESİR']
  },
  {
    'sira': 18,
    'İL': 'BURSA',
    'kurum': 'SBÜ Bursa Yüksek İhtisas Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 18,
    'basvurabilen': ['BURSA', 'BALIKESİR']
  },
  {
    'sira': 19,
    'İL': 'ÇANAKKALE',
    'kurum': 'Çanakkale Onsekiz Mart Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 6,
    'basvurabilen': ['ÇANAKKALE']
  },
  {
    'sira': 20,
    'İL': 'ÇORUM',
    'kurum': 'Hitit Üniversitesi Tıp Erol Olçok Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 7,
    'basvurabilen': ['ÇORUM']
  },
  {
    'sira': 21,
    'İL': 'DENİZLİ',
    'kurum': 'Pamukkale Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 8,
    'basvurabilen': ['DENİZLİ']
  },
  {
    'sira': 22,
    'İL': 'DİYARBAKIR',
    'kurum': 'Dicle Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 27,
    'basvurabilen': ['DİYARBAKIR', 'BATMAN', 'MARDİN', 'MUŞ', 'SİİRT', 'ŞIRNAK']
  },
  {
    'sira': 23,
    'İL': 'DÜZCE',
    'kurum': 'Düzce Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 7,
    'basvurabilen': ['DÜZCE']
  },
  {
    'sira': 24,
    'İL': 'EDİRNE',
    'kurum': 'Trakya Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 5,
    'basvurabilen': ['EDİRNE', 'KIRKLARELİ']
  },
  {
    'sira': 25,
    'İL': 'ELAZIĞ',
    'kurum': 'Fırat Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 10,
    'basvurabilen': ['ELAZIĞ', 'BİNGÖL', 'TUNCELİ']
  },
  {
    'sira': 26,
    'İL': 'ERZİNCAN',
    'kurum':
        'Binali Yıldırım Üniversitesi Mengücek Gazi Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 3,
    'basvurabilen': ['ERZİNCAN']
  },
  {
    'sira': 27,
    'İL': 'ERZURUM',
    'kurum': 'Atatürk Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 13,
    'basvurabilen': ['ERZURUM', 'AĞRI', 'BAYBURT']
  },
  {
    'sira': 28,
    'İL': 'ESKİŞEHİR',
    'kurum': 'Eskişehir Osmangazi Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 12,
    'basvurabilen': ['ESKİŞEHİR', 'BİLECİK']
  },
  {
    'sira': 29,
    'İL': 'GAZİANTEP',
    'kurum': 'Gaziantep Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 28,
    'basvurabilen': ['GAZİANTEP', 'KİLİS']
  },
  {
    'sira': 30,
    'İL': 'GİRESUN',
    'kurum':
        'Giresun Üniversitesi Prof. Dr. A. İlhan Özdemir Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 5,
    'basvurabilen': ['GİRESUN']
  },
  {
    'sira': 31,
    'İL': 'HATAY',
    'kurum': 'Mustafa Kemal Üniversitesi Tayfur Ata Sökmen Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 10,
    'basvurabilen': ['HATAY']
  },
  {
    'sira': 32,
    'İL': 'ISPARTA',
    'kurum': 'Süleyman Demirel Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 9,
    'basvurabilen': ['ISPARTA', 'BURDUR']
  },
  {
    'sira': 33,
    'İL': 'İSTANBUL',
    'kurum': 'Bezmiâlem Vakıf Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 6,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 34,
    'İL': 'İSTANBUL',
    'kurum': 'İstanbul Üniversitesi Cerrahpaşa Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 2,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 35,
    'İL': 'İSTANBUL',
    'kurum': 'İstanbul Üniversitesi İstanbul Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 2,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 36,
    'İL': 'İSTANBUL',
    'kurum': 'Marmara Üniversitesi Pendik Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 10,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 37,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Bağcılar Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 8,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 38,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Bakırköy Dr. Sadi Konuk Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 8,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 39,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Dr. Lütfi Kırdar Kartal Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 12,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 40,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Fatih Sultan Mehmet Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 7,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 41,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Gaziosmanpaşa Taksim Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 7,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 42,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Haseki Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 8,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 43,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Haydarpaşa Numune Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 11,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 44,
    'İL': 'İSTANBUL',
    'kurum':
        'İstanbul Medeniyet Üniversitesi Göztepe Prof. Dr. Süleyman Yalçın Şehir Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 8,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 45,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Prof. Dr. Cemil Taşçıoğlu Şehir Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 9,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 46,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Şişli Hamidiye Etfal Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 7,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 47,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Ümraniye Eğitim ve Araştırma Hastanesi',
    'tür': 'ÜNV.',
    'kontenjan': 8,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 48,
    'İL': 'İSTANBUL',
    'kurum': 'Acıbadem Mehmet Ali Aydınlar Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 4,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 49,
    'İL': 'İSTANBUL',
    'kurum': 'İstanbul Okan Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 4,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 50,
    'İL': 'İSTANBUL',
    'kurum': 'Maltepe Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 2,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 51,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ Başakşehir Çam ve Sakura Şehir Hastanesi',
    'tür': 'ŞH.',
    'kontenjan': 8,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 52,
    'İL': 'İSTANBUL',
    'kurum': 'SBÜ İstanbul Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 3,
    'basvurabilen': ['İSTANBUL']
  },
  {
    'sira': 53,
    'İL': 'İZMİR',
    'kurum': 'Dokuz Eylül Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 7,
    'basvurabilen': ['İZMİR']
  },
  {
    'sira': 54,
    'İL': 'İZMİR',
    'kurum': 'SBÜ Bozyaka Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 9,
    'basvurabilen': ['İZMİR']
  },
  {
    'sira': 55,
    'İL': 'İZMİR',
    'kurum':
        'İzmir Kâtip Çelebi Üniversitesi Atatürk Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 9,
    'basvurabilen': ['İZMİR']
  },
  {
    'sira': 56,
    'İL': 'İZMİR',
    'kurum': 'SBÜ Tepecik Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 8,
    'basvurabilen': ['İZMİR']
  },
  {
    'sira': 57,
    'İL': 'İZMİR',
    'kurum': 'İzmir Demokrasi Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 3,
    'basvurabilen': ['İZMİR']
  },
  {
    'sira': 58,
    'İL': 'KAHRAMANMARAŞ',
    'kurum': 'Kahramanmaraş Sütçü İmam Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 9,
    'basvurabilen': ['KAHRAMANMARAŞ']
  },
  {
    'sira': 59,
    'İL': 'KARABÜK',
    'kurum': 'Karabük Üniversitesi Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 7,
    'basvurabilen': ['KARABÜK', 'KASTAMONU']
  },
  {
    'sira': 60,
    'İL': 'KARS',
    'kurum': 'Kafkas Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 10,
    'basvurabilen': ['KARS', 'ARDAHAN', 'IĞDIR']
  },
  {
    'sira': 61,
    'İL': 'KAYSERİ',
    'kurum': 'Erciyes Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 10,
    'basvurabilen': ['KAYSERİ', 'NEVŞEHİR', 'NİĞDE']
  },
  {
    'sira': 62,
    'İL': 'KAYSERİ',
    'kurum': 'Kayseri Şehir Hastanesi',
    'tür': 'ŞH.',
    'kontenjan': 7,
    'basvurabilen': ['KAYSERİ', 'NEVŞEHİR', 'NİĞDE']
  },
  {
    'sira': 63,
    'İL': 'KOCAELİ',
    'kurum': 'Kocaeli Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 11,
    'basvurabilen': ['KOCAELİ', 'YALOVA']
  },
  {
    'sira': 64,
    'İL': 'KONYA',
    'kurum': 'Necmettin Erbakan Üniversitesi Meram Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 6,
    'basvurabilen': ['KONYA', 'AKSARAY', 'KARAMAN']
  },
  {
    'sira': 65,
    'İL': 'KONYA',
    'kurum': 'Selçuk Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 5,
    'basvurabilen': ['KONYA', 'AKSARAY', 'KARAMAN']
  },
  {
    'sira': 66,
    'İL': 'KONYA',
    'kurum': 'SBÜ Konya Şehir Hastanesi',
    'tür': 'ŞH.',
    'kontenjan': 10,
    'basvurabilen': ['KONYA', 'AKSARAY', 'KARAMAN']
  },
  {
    'sira': 67,
    'İL': 'KONYA',
    'kurum': 'SBÜ Konya Beyhekim Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 6,
    'basvurabilen': ['KONYA', 'AKSARAY', 'KARAMAN']
  },
  {
    'sira': 68,
    'İL': 'KÜTAHYA',
    'kurum':
        'Kütahya Sağlık Bilimleri Üniversitesi Evliya Çelebi Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 6,
    'basvurabilen': ['KÜTAHYA']
  },
  {
    'sira': 69,
    'İL': 'MALATYA',
    'kurum': 'İnönü Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 11,
    'basvurabilen': ['MALATYA']
  },
  {
    'sira': 70,
    'İL': 'MANİSA',
    'kurum': 'Celal Bayar Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 10,
    'basvurabilen': ['MANİSA']
  },
  {
    'sira': 71,
    'İL': 'MERSİN',
    'kurum': 'Mersin Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 9,
    'basvurabilen': ['MERSİN']
  },
  {
    'sira': 72,
    'İL': 'MUĞLA',
    'kurum': 'Muğla Sıtkı Koçman Üniversitesi Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 7,
    'basvurabilen': ['MUĞLA']
  },
  {
    'sira': 73,
    'İL': 'ORDU',
    'kurum': 'Ordu Üniversitesi Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 7,
    'basvurabilen': ['ORDU']
  },
  {
    'sira': 74,
    'İL': 'RİZE',
    'kurum': 'Recep Tayyip Erdoğan Üniversitesi Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 7,
    'basvurabilen': ['RİZE', 'ARTVİN']
  },
  {
    'sira': 75,
    'İL': 'SAKARYA',
    'kurum': 'Sakarya Üniversitesi Eğitim ve Araştırma Hastanesi',
    'tür': 'AFİLİYE',
    'kontenjan': 10,
    'basvurabilen': ['SAKARYA']
  },
  {
    'sira': 76,
    'İL': 'SAMSUN',
    'kurum': 'Ondokuz Mayıs Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 7,
    'basvurabilen': ['SAMSUN', 'AMASYA', 'SİNOP']
  },
  {
    'sira': 77,
    'İL': 'SAMSUN',
    'kurum': 'SBÜ Samsun Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 10,
    'basvurabilen': ['SAMSUN', 'AMASYA', 'SİNOP']
  },
  {
    'sira': 78,
    'İL': 'SİVAS',
    'kurum': 'Cumhuriyet Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 12,
    'basvurabilen': ['SİVAS']
  },
  {
    'sira': 79,
    'İL': 'ŞANLIURFA',
    'kurum': 'Harran Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 18,
    'basvurabilen': ['ŞANLIURFA', 'ADIYAMAN']
  },
  {
    'sira': 80,
    'İL': 'TEKİRDAĞ',
    'kurum': 'Namık Kemal Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 6,
    'basvurabilen': ['TEKİRDAĞ']
  },
  {
    'sira': 81,
    'İL': 'TOKAT',
    'kurum': 'Gaziosmanpaşa Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 10,
    'basvurabilen': ['TOKAT']
  },
  {
    'sira': 82,
    'İL': 'TRABZON',
    'kurum': 'Karadeniz Teknik Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 9,
    'basvurabilen': ['TRABZON', 'GÜMÜŞHANE']
  },
  {
    'sira': 83,
    'İL': 'TRABZON',
    'kurum': 'SBÜ Trabzon Kanuni Eğitim ve Araştırma Hastanesi',
    'tür': 'EAH.',
    'kontenjan': 4,
    'basvurabilen': ['TRABZON', 'GÜMÜŞHANE']
  },
  {
    'sira': 84,
    'İL': 'UŞAK',
    'kurum': 'Uşak Üniversitesi Uşak EAH',
    'tür': 'AFİLİYE',
    'kontenjan': 5,
    'basvurabilen': ['UŞAK']
  },
  {
    'sira': 85,
    'İL': 'VAN',
    'kurum': 'Yüzüncü Yıl Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 18,
    'basvurabilen': ['VAN', 'BİTLİS', 'HAKKÂRİ']
  },
  {
    'sira': 86,
    'İL': 'YOZGAT',
    'kurum': 'Yozgat Bozok Üniversitesi',
    'tür': 'ÜNV.',
    'kontenjan': 6,
    'basvurabilen': ['YOZGAT']
  },
  {
    'sira': 87,
    'İL': 'ZONGULDAK',
    'kurum': 'Bülent Ecevit Üniversitesi Tıp Fakültesi',
    'tür': 'ÜNV.',
    'kontenjan': 11,
    'basvurabilen': ['ZONGULDAK', 'BARTIN']
  }
];
