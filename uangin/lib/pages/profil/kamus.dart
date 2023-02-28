import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/profil/dataKamus.dart';



class KamusPage extends StatefulWidget {
  const KamusPage({super.key});

  @override
  State<KamusPage> createState() => _KamusPageState();
}

class _KamusPageState extends State<KamusPage> {


static List<dataKamus> data_list = [
    dataKamus("AUM/Asset Under Management","AUM (total dana kelolaan) adalah keseluruhan dana yang dikelola oleh suatu Manajer Investasi."),
    dataKamus("Reksa Dana Campuran","Reksa dana campuran merupakan reksa dana yang menanamkan dana pada beberapa instrumen investasi sekaligus, termasuk saham, obligasi, dan pasar uang."),
    dataKamus("Bearish/bear market","Bear market adalah kondisi pasar yang ditandai dengan menurunnya harga instrumen investasi. Biasanya mendorong para investor untuk menjual aset mereka guna mencegah kerugian yang lebih besar."),
    dataKamus("Blue Chip","Saham blue chip mengacu pada saham dalam sebuah perusahaan dengan reputasi nasional untuk kualitas, keandalan, dan kemampuan untuk beroperasi secara menguntungkan di saat baik maupun buruk. Bisa dikatakan sebagai pilihan baik bagi investor, baik pemula maupun ahli."),
    dataKamus("Obligasi","Obligasi merupakan surat pernyataan utang/surat utang. Pemegang obligasi berarti memegang janji dari suatu badan/instansi bahwa utang (beserta bunganya) akan dibayar dalam tempo tertentu."),
    dataKamus("Broker/pialang","Broker atau pialang adalah individu/perusahaan yang menjadi perantara jual-beli saham."),
    dataKamus("Bullish/bull market","Bullish/bull market merupakan adalah kondisi pasar keuangan ketika harga naik atau diperkirakan akan naik. Istilah ini paling sering merujuk pada pasar saham, tetapi dapat diterapkan juga untuk instrumen investasi apa pun yang diperdagangkan, seperti obligasi, real estat, mata uang (forex), dan berbagai komoditas."),
    dataKamus("CAGR/Compound Annual Growth Rate","CAGR adalah tingkat pertumbuhan reksa dana dalam jangka waktu (tahun-tahun) terakhir. Misalnya, CAGR 3Y berarti pertumbuhan dalam 3 tahun terakhir."),
    dataKamus("Capital Gain","Capital gain adalah keuntungan yang diperoleh dengan menjual aset. Misalnya, jika beli suatu efek dengan harga Rp5.000, dan dijual dengan harga Rp7.500, Rp2.500-lah yang disebut Capital Gain."),
    dataKamus("Capital Loss","Capital loss adalah kerugian yang disebabkan oleh penjualan aset. Misalnya, jika beli suatu efek dengan harga Rp5.000, dan dijual dengan harga Rp3.000, Rp2.000-lah yang disebut Capital Loss."),
    dataKamus("Kapitalisasi","Kapitalisasi merupakan nilai total dari seluruh efek, utang jangka panjang, dan pendapatan tersimpan yang dimiliki perusahaan."),
    dataKamus("Compounding Interest/Bunga majemuk","Bunga majemuk merupakan yang diberi berdasarkan modal awal dan akumulasi bunga pada periode sebelumnya. Singkatnya, bunga yang kamu dapat, bisa berbunga lagi"),
    dataKamus("Kreditur","Kreditur adalah pihak pemberi utang. Melalui pembelian obligasi, kamu telah menjadi kreditur dari yang mengeluarkan obligasi."),
    dataKamus("Kustodian","Kustodian adalah lembaga yang bertanggung jawab untuk mengamankan aset keuangan dari suatu perusahaan ataupun perorangan. Bank kustodian dalam investasi reksa dana bertugas untuk menyimpan, mengawasi, dan mengamankan uangmu."),
    dataKamus("Debitur","Debitur adalah pihak yang berhutang. Melalui penerbitan obligasi, suatu badan telah menjadi debitur."),
    dataKamus("Deposito/Simpanan Berjangka","Simpanan berjangka di bank yang menjanjikan bunga lebih tinggi ketimbang tabungan biasa. Deposito tidak bisa dicairkan sebelum jatuh tempo, dan biasanya tersedia dalam jangka waktu 1, 3, 6, hingga 12 bulan."),
    dataKamus("Diversifikasi","Diversifikasi berarti menyalurkan dana investasi ke berbagai produk berbeda. Tujuannya untuk menstabilkan arus uang. Sangat direkomendasikan untuk siapa saja! Bila nilai satu produk investasi jatuh, kamu masih punya produk lainnya yang bernilai lebih tinggi."),
    dataKamus("Dividen","Dividen adalah pembayaran yang dilakukan oleh perusahaan kepada pemegang sahamnya, biasanya sebagai bagi untung/pembagian laba. Ketika sebuah perusahaan menghasilkan laba atau surplus, perusahaan tersebut dapat menginvestasikan kembali laba dalam bisnis dan membayar proporsi laba sebagai dividen kepada pemegang saham."),
    dataKamus("Dana Darurat","Dana darurat merupakan uang yang kamu simpan dengan tujuan menghadapi keadaan genting di masa depan. Dana darurat tidak boleh dibelanjakan kecuali memang benar-benar darurat, misalnya PHK, sakit, dll. Tujuannya agar kamu lebih siap menghadapi hal-hal tidak terduga dalam hidup."),
    dataKamus("Ekuitas","Ekuitas merupakan persenan dari harta perusahaan yang menjadi hak pemilik perusahaan."),
    dataKamus("Beban Operasi","Beban operasi suatu reksa dana/manajer investasi adalah persentase total aset dana yang digunakan untuk administrasi, manajemen, iklan, dan semua biaya lainnya. Rasio pengeluaran sebesar 1% per tahun, berarti 1% dari total aset dana akan digunakan untuk menutupi biaya operasional."),
    dataKamus("Perencana Keuangan","Perencana keuangan adalah suatu perusahaan/individu yang tugasnya membantu pengguna jasa untuk mencapai tujuan-tujuan keuangan mereka. Misalnya pengelolaan arus keluar-masuknya uang, manajemen risiko, tujuan jangka pendek, menengah, dan panjang."),
    dataKamus("Pasar Forex/Valas","Pasar valuta asing (valas) merupakan jenis transaksi yang memperdagangkan mata uang suatu negara terhadap mata uang negara lainnya. Keuntungan diperoleh melalui selisih kurs antara mata uang yang digunakan untuk bertransaksi."),
    dataKamus("Reksa Dana Pendapatan Tetap","Reksa dana pendapatan tetap adalah jenis reksa dana yang mengalokasikan > 80% asetnya dalam bentuk obligasi/surat utang."),
    dataKamus("Fluktuatif","Fluktuasi berarti naik-turunnya harga produk di pasar efek. Bisa melonjak tajam, atau turun drastis. Pasar yang fluktuatif berarti pasar yang harga produknya naik-turun terus-menerus."),
    dataKamus("Fund Facts Sheet/FFS/Informasi Pengelolaan Dana","Informasi pengelolaan dana merupakan laporan berisi informasi kinerja, dana kelolaan, dan portofolio produk reksa dana di bawah naungan suatu Manajer Investasi."),
    dataKamus("Harga Reksa Dana","Harga reksa dana dapat diilustrasikan sebagai berikut: ketika kamu memiliki unit reksa danamu sendiri, saldo yang tampak di aplikasi adalah harga reksa dana di hari itu. Uangmu tidak berkurang, hanya harganya saja naik-turun. Lihat definisi NAB."),
    dataKamus("Periode Holding/Holding Period","Periode holding merupakan durasi waktu seorang investor mempertahankan investasinya."),
    dataKamus("Indeks","Indeks merupakan performa gabungan dari berbagai saham berkategori khusus. Indeks dapat mengindikasikan kondisi pasar secara keseluruhan. Misalnya Indeks LQ45 berarti performa dari 45 perusahaan pilihan. Bila indeks naik, berarti harga saham 45 perusahaan tersebut disimpulkan bergerak naik."),
    dataKamus("Reksa Dana Saham","Reksa dana saham merupakan jenis reksa dana yang mengalokasikan asetnya untuk membeli berbagai saham."),
    dataKamus("Inflasi","Inflasi merupakan proses meningkatnya harga-harga secara umum dan terus-menerus"),
    dataKamus("Manajer Investasi","Perusahaan yang melakukan pengelolaan dana untuk nasabah lewat investasi efek."),
    dataKamus("Pendapatan Investasi","Pendapatan investasi dapat berupa bunga atau dividen. Diperoleh dari hasil investasi."),
    dataKamus("Likuid","Likuid adalah sifat aset/instrumen investasi yang bisa dikonversi menjadi uang tunai dengan cepat. Reksa dana dapat dikatakan bersifat likuid karena bisa dicairkan kapan saja."),
    dataKamus("Ekonomi Makro","Ekonomi makro merupakan pembelajaran mengenai ekonomi secara keseluruhan. Menjelaskan perubahan aspek ekonomi, seperti pasar tenaga kerja, pemerintah, perusahaan, dan lain-lain yang memengaruhi banyak masyakarakat, perusahaan, dan pasar."),
    dataKamus("Ekonomi Mikro","Ekonomi mikro merupakan pembelajaran mengenai perilaku konsumen dan perusahaan, serta penentuan harga-harga pasar dan kuantitas barang dan jasa."),
    dataKamus("Pasar Uang","Pasar uang disebut juga pasar kredit jangka pendek. Wadah untuk jual-beli dana atau surat berharga dengan masa jatuh tempo di bawah satu tahun."),
    dataKamus("Reksa Dana","Reksa dana adalah wadah yang digunakan masyarakat pemodal (investor seperti kamu!) untuk mengumpulkan dana, yang kemudian dialokasikan pada portfolio efek oleh Manajer Investasi"),
    dataKamus("NAB (Nilai Aktiva Bersih)/Unit","NAB merupakan nilai/harga bersih suatu unit penyertaan reksa dana di hari itu. Setiap harinya, harga ini akan berubah sesuai dengan jual/beli reksa dana oleh investor, harga pasar, dan perubahan dana kelolaan"),
    dataKamus("Reksa Dana Pasar Uang","Reksa dana pasar uang merupakan jenis reksa dana yang mengalokasikan asetnya dalam ke transaksi-transaksi pasar uang."),
    dataKamus("OJK/Otoritas Jasa Keuangan","Otoritas Jasa Keuangan adalah lembaga negara yang tugasnya menyelenggarakan sistem pengaturan dan pengawasan yang terintegrasi terhadap keseluruhan kegiatan di dalam sektor jasa keuangan."),
    dataKamus("Portofolio","Portofolio merupakan kumpulan aset investasi yang dimiliki oleh individu/perusahaan."),
    dataKamus("Prospektus","Prospektus merupakan dokumen resmi berisi profil perusahaan dan laporan tahunan untuk memberi gambaran performa keuangan."),
    dataKamus("Return/Pengembalian","Return adalah hasil yang diperoleh dari investasi. Return bernilai negatif berarti nilai investasi sedang turun."),
    dataKamus("Risiko","Risiko merupakan tingkat potensi kerugian yang timbul karena perolehan hasil investasi tak sesuai harapan. Semakin tinggi risiko, semakin besar pula potensi kerugiannya, meskipun biasanya hasilnya juga lebih besar."),
    dataKamus("Sekuritas","Sekuritas merupakan surt utang yang dapat diuangkan dengan mudah dan cepat."),
    dataKamus("Spekulasi","Spekulasi adalah aktivitas bisnis untuk mendapatkan untung besar tanpa khawatir dengan besarnya risiko yang ada. Tujuannya untuk dapat untung besar sesegera mungkin."),
    dataKamus("Saham","Saham merupakan surat berharga penanda kepemilikan suatu perusahaan. Ketika perusahaan sedang untung, pemilik saham akan mendapatkan bagian."),
    dataKamus("Bursa Efek","Bursa efek adalah tempat jual-beli efek perusahaan."),
    dataKamus("Efek","Efek merupakan surat-surat berharga perusahaan yang dapat diperdagangkan. Termasuk saham, obligasi, surat pengakuan utang, dan lain-lain."),
    dataKamus("Trader","Trader adalah pelaku trading. Pihak yang membeli instrumen investasi dengan tujuan untuk dijual lagi dalam waktu dekat."),
    dataKamus("Trading","Trading, dalam istilah investasi, mengacu pada kegiatan membeli instrumen investasi untuk kemudian dijual lagi dalam waktu dekat. Para investor aktif seringkali melakukannya untuk memeroleh keuntungan ssingkat."),
    dataKamus("Unit","Unit merupakan satuan untuk suatu produk reksa dana. Ketika kamu \"membeli\" reksa dana, kamu akan mendapatkan unit. Harga unit, ketika naik, akan menjadi keuntungan untukmu."),
    dataKamus("Volatilitas","Volatilitas adalah jarak antara fluktuasi/naik-turunnya harga suatu produk efek. Volatilitas tinggi berarti harga bisa melonjak tinggi, dan segera turun drastis secara cepat. Begitu pula sebaliknya."),
    dataKamus("Gold","Sepanjang sejarah, emas merupakan komoditas unggulan. Logam mulia satu ini pun banyak dipilih sebagai instrumen investasi. Emas relatif mudah untuk dijual kembali atau sekadar digadaikan. Saat ini, kamu bisa berinvestasi emas tidak hanya dengan datang langsung ke toko, tapi juga bisa dilakukan secara online."),
    dataKamus("Jual Beli Emas","Jual-beli emas seringkali dilakukan guna meraup keuntungan. Seperti jual-beli instrumen investasi lainnya, pihak yang membeli emas mengharapkan untuk dapat menjualnya kembali dengan harga lebih tinggi."),
    dataKamus("Nabung Emas","Seperti menabung uang, siapapun bisa memilih untuk menabung kekayaan dalam bentuk emas. Memiliki tabungan dalam bentuk emas dipercaya lebih memberikan keuntungan ketimbang menabung uang tunai."),
    dataKamus("Investasi Emas","Emas seringkali dipilih sebagai instrumen investasi karena sifatnya yang mudah, relatif murah, dan memiliki pengembalian hasil tahunan yang relatif tinggi, meskipun tak luput dari risiko penurunan nilai. Emas relatif mudah untuk dijual kembali atau sekadar digadaikan. Saat ini, kamu bisa berinvestasi emas tidak hanya dengan datang langsung ke toko, tapi juga bisa dilakukan secara online."),
    dataKamus("Pegadaian","Pegadaian adalah Badan Usaha Milik Negara (BUMN) yang memiliki izin resmi melakukan kegiatan lembaga keuangan berupa pembiayaan dalam bentuk penyaluran dana ke masyarakat atas dasar hukum gadai"),
    dataKamus("Analisa Emas","Analisa emas dalam konteks investasi merupakan kajian untuk mengetahui apakah harga emas akan berubah atau tidak. Analisa dilakukan oleh para pemain pasar emas untuk mengetahui waktu yang tepat untuk menjual atau membeli emas."),
    dataKamus("Trading Saham","Trading saham merupakan metode menambah kekayaan dengan memperdagangkan saham jangka pendek. Trading bisa dilakukan harian, mingguan, maupun bulanan. Prinsipnya adalah membeli saham dengan harga rendah, dan menjual dengan harga tinggi. Ada juga prinsip meminimalisir kerugian, yakni buru-buru menjual saham yang harganya jatuh, untuk mencegah kerugian yang lebih besar."),
    dataKamus("Jenis Saham","Saham dibedakan jenisnya menurut kepemilikan, karakter, maupun kapitalisasi pasarnya. Jenis-jenis saham yang populer di kalangan investor pemula meliputi: saham blue chip, saham pendapatan, saham tumbuh, dan saham nilai."),
    dataKamus("Beli Saham","Saham dapat dibeli di Bursa Efek Indonesia melalui pembukaan rekening saham di perusahaan sekuritas. Pastikan untuk memilih perusahaan sekuritas yang terpercaya dan telah mendapatkan lisensi dari OJK."),
    dataKamus("Analisa Saham","Analisa saham dalam konteks investasi merupakan kajian untuk mengetahui apakah saham tertentu memiliki potensi. Tipe analisa yang cukup sering digunakan adalah analisa fundamental dan analisa teknikal."),
    dataKamus("Bisnis Saham","Orang yang menganggap saham sebagai bisnis pada umumnya melakukan trading, baik harian, mingguan, maupun bulanan. Prinsipnya adalah membeli saham dengan harga rendah, dan menjual dengan harga lebih tinggi. Ada juga prinsip meminimalisir kerugian, yakni buru-buru menjual saham yang harganya jatuh, untuk mencegah kerugian yang lebih besar."),
    dataKamus("Saham Online","Investasi saham online artinya kamu dapat membeli saham dari sebuah perusahaan atau badan usaha secara online. Investasi ini dapat dilakukan melalui komputer atau handphone yang terhubung internet."),
    dataKamus("Pasar Saham","Tempat saham perusahaan yang dimiliki secara publik dapat dibeli dan dijual, baik secara OTC (luar bursa) maupun melalui bursa yang dipusatkan."),
    dataKamus("Saham Syariah","Saham syariah adalah sebuah surat berharga yang mencerminkan suatu kepemilikan perusahaan yang kegiatan usaha dan cara pengolahannya sesuai dengan prinsip-prinsip syariah."),
    dataKamus("1 Lot Saham","Lot adalah satuan perdagangan saham. 1 lot setara dengan 100 lembar saham. Minimal pembelian saham di pasar reguler tidak bisa kurang dari 1 lot."),
    dataKamus("Investasi Jangka Panjang","Investasi jangka panjang adalah investasi yang dilakukan dalam rentang waktu yang lama, biasanya minimal satu tahun. Dalam investasi jangka panjang investor tidak akan menarik modal maupun keuntungan yang didapat dalam kurun waktu yang cukup lama."),
    dataKamus("investasi jangka pendek","Investasi jangka pendek adalah investasi yang dilakukan kurang dari satu tahun. Artinya, investor biasanya menarik modal dan keuntungan yang didapatkan dari investasi jangka pendek dalam durasi kurang dari satu tahun."),
    dataKamus("investasi online","Investasi online adalah kegiatan dalam jaringan internet (daring) yang berkaitan dengan keuangan dan ekonomi yang ditujukan untuk mendapatkan keuntungan. Pastikan aplikasi investasi online yang kamu gunakan sudah mendapat sertifikasi OJK."),
    dataKamus("investasi syariah","Kegiatan penempatan dana pada satu asset perusahaan atau lebih dengan tujuan mendapatkan keuntungan yang sesuai dengan prinsip dan hukum Islam yang berpegangan pada syariah Islam."),
    dataKamus("investasi properti","Investasi properti adalah kegiatan menanamkan modal atau dana serta kemampuan kita dalam pengembangan properti."),
    dataKamus("Daftar negatif investasi","Daftar Negatif Investasi (DNI) adalah salah satu produk hukum yang diciptakan untuk membuat investor asing memiliki kejelasan pilihan bidang usaha yang ada di Indonesia. DNI berisi daftar bidang usaha tertutup dan terbuka bagi asing, beserta dengan persyaratannya."),
    dataKamus("jenis jenis investasi","Jenis-jenis investasi yang populer di Indonesia meliputi properti, logam mulia (emas), deposito, saham, obligasi, reksa dana, peer-to-peer lending."),
    dataKamus("Reksa dana syariah","Reksa dana syariah adalah wadah untuk menghimpun dana masyarakat yang dikelola oleh Manajer Investasi (MI) untuk diinvestasikan ke dalam surat berharga seperti saham, obligasi dan instrumen pasar uang yang disesuaikan dengan ketentuan dan prinsip syariah Islam."),
    dataKamus("Tabungan berjangka","Tabungan berjangka adalah jenis tabungan di mana masyarakat harus menentukan jangka waktu yang diinginkan untuk tetap menabung di bank. Jangka waktu bisa dipilih mulai dari enam bulan hingga 20 tahun dengan besaran setoran bulanan sesuai keinginan dan kemampuan nasabah."),
    dataKamus("buku tabungan","Buku tabungan adalah buku yang dikeluarkan oleh bank yang di dalamnya dicantumkan jumlah simpanan nasabah pada rekening tabungan di bank tersebut. Buku ini harus diperlihatkan pada setiap penyetoran maupun penarikan dan pada saat membukukan bunga."),
    dataKamus("Tabungan haji","Tabungan haji adalah sejumlah uang yang ditabungkan untuk digunakan mendanai perjalanan ibadah haji ke Mekkah, Arab Saudi. Sebagai negara dengan mayoritas penduduk beragama Islam, tabungan haji adalah produk perbankan yang populer di Indonesia. Banyak bank menawarkan program tabungan haji yang beragam dengan keunikan masing-masing."),
    dataKamus("Bank","Bank adalah badan usaha yang menghimpun dana dari masyarakat dalam bentuk simpanan dan menyalurkannya kepada masyarakat dalam bentuk kredit dan bentuk-bentuk lainnya dalam rangka meningkatkan taraf hidup masyarakat luas."),
    dataKamus("Perbankan","Perbankan adalah segala sesuatu yang terkait dengan bank dan kegiatan keuangan yang terproses di dalamnya."),
    dataKamus("Bunga Bank","Bunga bank adalah sejumlah imbalan yang diberikan oleh bank kepada nasabah atas dana yang tersimpan di bank. Bunga bank dihitung sebesar persentase tertentu dari pokok simpanan dan jangka waktu simpanan ataupun tingkat bunga yang dikenakan terhadap pinjaman yang diberikan bank kepada debiturnya."),
    dataKamus("Bunga Deposito","Bunga deposito adalah sejumlah uang yang harus diberikan oleh pihak bank kepada nasabah, sebagai imbalan atas simpanan nasabah yang tidak bisa ditariknya dalam jangka waktu tertentu. Bunga deposito cenderung lebih tinggi ketimbang tabungan biasa karena sifatnya yang tidak fleksibel (uang tidak bisa bebas diambil kapan saja)"),
    dataKamus("Bitcoin","Bitcoin merupakan mata uang elektronik berbasis blockchain. Bitcoin memungkinkan kepemilikan aset secara anonim. Transaksi dilakukan secara umum dan terbuka. Banyak yang menjadikannya sebagai instrumen investasi, meskipun volatilitas nilainya sangat tinggi"),
    dataKamus("Blockchain","Blockchain merupakan salah satu contoh sistem komputasi terdistribusi. Bentuknya seperti buku besar (ledger) terbuka yang dapat mencatat transaksi dengan aman dan efektif, karena keakuratan transaksi dapat diverifikasi oleh berbagai orang yang memiliki akses terhadap blockchain tersebut. Salah satu penggunaan blockchain yang terkenal di dunia keuangan adalah dalam mata uang kripto (cryptocurrency)"),
    dataKamus("P2PLending","P2PLending merupakan salah satu jenis financial technology (fintech) yang menjadi wadah pertemuan bagi pemilik dana (lender), dengan peminjam dana (borrower)."),
    dataKamus("Crowdfunding","Crowdfunding, atau disebut juga urun dana, merupakan upaya penggalangan dana untuk kemudian disalurkan bagi kepentingan tertentu (pada umumnya proyek maupun bisnis). Crowdfunding dapat dilakukan secara online."),
    dataKamus("Lending/pinjaman","Pada dunia keuangan, lending/pinjaman mengacu pada pemberian uang pada individu/organisasi, dengan perjanjian bahwa uang tersebut akan dikembalikan dalam jangka waktu tertentu, biasanya dengan bunga, sesuai dengan perjanjian."),
    dataKamus("Property Crowdfunding","Metode investasi properti yang melibatkan sekelompok orang yang menanamkan dananya pada satu asset properti yang sama, sehingga setiap orang memiliki bagian saham dari asset properti tersebut."),
    dataKamus("Afiliasi","Hubungan antara perusahaan dengan pihak yang secara langsung atau tidak langsung mengendalikan, dikendalikan, atau di bawah suatu pengendalian dari perusahaan tersebut atau hubungan antara perusahaan dengan pemegang saham utama"),
    dataKamus("Agio Saham","Selisih lebih setoran pemegang saham diatas nilai nominalnya dalam hal saham dikeluarkan dengan nilai nominal."),
    dataKamus("Aktiva Berwujud Bersih (Net Tangible Assets)","Total Aktiva dikurangi dengan Aktiva Tidak Berwujud, Aktiva Pajak Tangguhan, dan Total Kewajiban termasuk Hak Kepemilikan Minoritas."),
    dataKamus("Aktiva Tidak Berwujud","Aktiva non moneter yang dapat diidentifikasi dan tidak memiliki wujud fisik serta dimiliki untuk digunakan dalam menghasilkan barang atau jasa, disewakan kepada pihak lainnya, atau untuk tujuan administratif."),
    dataKamus("Akuisisi","Penggabungan badan usaha dengan cara menguasai sebagian besar saham badan usaha lain. Dengan akuisisi, dua atau lebih badan usaha tersebut tetap eksis secara hukum dan badan usaha yang menguasai saham paling besar menjadi induk perusahaan yang harus menyajikan laporan keuangan konsolidasi."),
    dataKamus("Allotment (Penjatahan)","Suatu jumlah yang disetujui untuk dipenuhi bagi setiap permohonan pembelian efek yang diajukan para pemodal sebagai akibat tidak terpenuhinya seluruh permohonan karena jumlah permohonan melebihi jumlah penawaran pada masa Pasar Perdana."),
    dataKamus("Anggota Bursa","Perusahaan efek yang telah memiliki izin usaha sebagai Perantara Pedagang efek dari OJK dan telah memperoleh Persetujuan Keanggotaan bursa."),
    dataKamus("Annual Report (Laporan Tahunan)","Suatu laporan resmi mengenai keadaan keuangan emiten dalam jangka waktu 1 tahun. Termasuk di dalam laporan ini antara lain Neraca Perusahaan, Laporan Laba/Rugi dan Neraca Arus Kas. Laporan ini harus disampaikan kepada para pemegang saham untuk disetujui di dalam RUPS untuk selanjutnya disahkan sebagai laporan tahunan resmi perusahaan."),
    dataKamus("Ask Price","Harga penawaran atas order jual. Sistem JATS akan memprioritaskan harga dengan penawaran jual terendah."),
    dataKamus("Auto Reject","Penolakan secara otomatis oleh JATS terhadap penawaran jual dan atau permintaan beli efek yang dimasukkan ke JATS akibat dilampauinya batasan harga yang ditetapkan oleh bursa."),
    dataKamus("Balance Sheet","Laporan keuangan perusahaan yang menunjukan keadaan aset, utang dan modal per tanggal tertentu."),
    dataKamus("Bearish","Kondisi bursa ketika harga saham, obligasi dan komoditas yang diperdagangkan turun dalam jangka waktu yang cukup lama."),
    dataKamus("Beneficial Owner","Hak pemegang rekening efek atas manfaat tertentu berkaitan dengan efek yang dicatat dalam penitipan kolektif rekening efek pada perusahaan efek"),
    dataKamus("Biro Administrasi Efek (BAE)","Pihak yang berdasarkan kontrak dengan emiten melaksanakan melaksanakan pencatatan kepemilikan efek dan pembagian hak yang berkaitan dengan efek"),
    dataKamus("BI Rate","Suku bunga kebijakan yang mencerminkan sikap atau stance kebijakan moneter yang ditetapkan oleh bank Indonesia dan diumumkan kepada publik."),
    dataKamus("Bid","Penawaran yang diajukan oleh calon pembeli saham."),
    dataKamus("Bid Price","Harga penawaran atas order beli. Sistem JATS akan memprioritaskan harga dengan penawaran beli tertinggi."),
    dataKamus("Block Trading","Perdagangan dalam jumlah besar atau minimal 200.000 lembar saham."),
    dataKamus("Blue Chip","Saham-saham unggulan, saham-saham dari perusahaan yang mempunyai reputasi baik dan mudah diperjualbelikan di bursa saham karena banyak peminatnya."),
    dataKamus("Bond (Obligasi)","Sertifikat bukti utang yang dikeluarkan oleh suatu perseroan terbatas atau institusi tertentu baik pemerintah maupun lembaga lainnya dengan tujuan mendapatkan modal. Perusahaan membayar bunga atas obligasi tersebut pada tanggal-tanggal yang telah ditentukan secara periodik, dan pada akhirnya menebus nilai utang tersebut pada saat jatuh tempo dengan mengembalikan jumlah pokok pinjaman ditambah bunga yang terutang."),
    dataKamus("Book Value","Nilai perusahaan dihitung dari total aset dikurangi harta tidak terwujud, dikurangi utang dan nilai nominal dari saham preferen."),
    dataKamus("Book Value Per Share","Indikator finansial yang mengukur nilai modal perusahaan dibagi dengan jumlah saham."),
    dataKamus("Booking Order","Antrian antara pembeli(buyers) dan penjual(seller) yang disusun dalam suatu rangkaian harga dimana pada masing-masing fraksi harga terdapat antrian lot dari buyers dan sellers."),
    dataKamus("Bullish","Kondisi bursa ketika harga saham, obligasi dan komoditas yang diperdagangkan naik dalam jangka waktu yang cukup lama."),
    dataKamus("Bursa Efek","Pihak yang menyelenggarakan dan menyediakan sistem serta sarana untuk mempertemukan penawaran jual dan beli efek Pihak-Pihak lain dengan tujuan memperdagangkan efek di antara mereka."),
    dataKamus("Buyback","Pembelian kembali saham atau obligasi yang beredar oleh emiten dengan beragam alasan dan tujuan."),
    dataKamus("Capital Gain","Capital Gain merupakan selisih antara harga beli dan harga jual yang terbentuk dengan adanya aktivitas perdagangan saham di pasar sekunder."),
    dataKamus("Capital Loss","Suatu kondisi dimana investor menjual saham lebih rendah dari harga beli."),
    dataKamus("Capital Asset Pricing Model (CAPM)","Suatu teori penetapan harga aktiva di mana tingkat pengembalian dari aktiva atau surat berharga adalah sebesar tingkat bunga bebas risiko ditambah dengan faktor penyesuaian sebesar risk premium dikalikan dengan risiko sistematik aktiva tersebut"),
    dataKamus("Cash Flow","Pencatatan perubahan modal kerja sehubungan dengan kegiatan usaha perusahaan yang dilaporkan. Catatan memperlihatkan perincian sumber uang kas dan penggunaannya."),
    dataKamus("Continous Auction","Metode perdagangan di mana transaksi dilakukan berdasarkan proses tawar-menawar secara berkesinambungan"),
    dataKamus("Corporate Action","Suatu tindakan/keputusan perusahaan publik yang akan berpengaruh terhadap kepentingan pemegang saham, seperti pembagian dividen, pemberian saham bonus, stock split, penawaran umum terbatas, dll."),
    dataKamus("Conflict of Interest (Benturan Kepentingan)","Perbedaan antara kepentingan eknomi perusahaan dengan kepentingan ekonomi direktur, komisaris, atau pemegang saham utama perusahaan"),
    dataKamus("Crossing","Transaksi jual beli yang dilakukan hanya oleh anggota bursa yang sama."),
    dataKamus("Cut Loss","Upaya untuk menghindari kerugian yang lebih besar dengan menjual saham pada posisi merugi."),
    dataKamus("Current Ratio (Rasio Lancar)","Rasio yang menunjukkan sejauh mana aktiva lancar dapat menutupi kewajiban lancar."),
    dataKamus("Delisting","Penghapusan efek dari daftar efek yang tercatat di bursa sehingga efek tersebut tidak dapat diperdagangkan di bursa. Saham-saham yang telah di delist tetap dapat diperdagangkan di luar bursa dan status emiten tetap sebagai perusahaan publik."),
    dataKamus("Derivatif","Kontrak finansial antara 2 (dua) atau lebih pihak-pihak guna memenuhi janji untuk membeli atau menjual aset/komoditas yang dijadikan sebagai objek yang diperdagangkan pada waktu dan harga yang merupakan kesepakatan bersama antara pihak penjual dan pihak pembeli. Adapun nilai di masa mendatang dari objek yang diperdagangkan tersebut sangat dipengaruhi oleh instrumen induknya yang ada di spot market."),
    dataKamus("Dilusi","Penurunan persentase pemilikan dari pemegang saham suatu perusahaan sebagai akibat dari bertambahnya jumlah saham yang beredar."),
    dataKamus("Disclaimer","Pernyataan penolakan bertanggung jawab atas resiko investasi yang mungkin muncul akibat penggunaan informasi yang terdapat pada suatu laporan riset, surat pernyataan atau sejenisnya."),
    dataKamus("Diversifikasi Portofolio","Cara berinvestasi dengan menanamkan uang pada beragam instrument investasi untuk mengurangi resiko."),
    dataKamus("Divestasi","Penjualan kembali saham perusahaan."),
    dataKamus("Dividend Payout Ratio (Rasio Pembayaran Dividen)","Persentase tertentu dari dari laba perusahaan yang dibayarkan sebagai dividen kas kepada pemegang saham."),
    dataKamus("Dividend Yield","Rasio nilai dividen terhadap harga saham."),
    dataKamus("Dual Listing","Pencatatan saham di lebih dari satu bursa sehingga likuiditas surat berharga tersebut lebih terjaga."),
    dataKamus("Earnings Per Share (EPS)","Laba bersih per saham suatu perusahaan. Cara menghitungnya, laba bersih perusahaan dibagi dengan jumlah seluruh saham yang beredar."),
    dataKamus("Efek","Surat berharga, yaitu surat pengakuan utang, surat berharga komersial, saham, obligasi, tanda bukti utang, Unit Penyertaan kontrak investasi kolektif, kontrak berjangka atas efek, dan setiap derivatif dari efek."),
    dataKamus("Emiten","Pihak atau perusahaan yang menawarkan efeknya kepada masyarakat investor melalui penawaran umum."),
    dataKamus("Entitas Anak","Perusahaan yang laporan keuangannya dikonsolidasikan dengan Perseroan sesuai dengan standar akuntansi yang berlaku di Indonesia."),
    dataKamus("ESA (Employee Stock Allocation)","Program alokasi saham untuk karyawan."),
    dataKamus("ETF (Exchange Trade Fund)","Kontrak investasi kolektif yang unit penyertaannya dicatat dan diperdagangkan di bursa efek seperti halnya saham."),
    dataKamus("Face Value","Nilai nominal, nilai yang tercantum pada sekuritas seperti wesel, obligasi dan instrumen sejenisnya."),
    dataKamus("Fakta Material","Informasi atau fakta penting dan relevan mengenai peristiwa, kejadian atau fakta yang dapat mempengaruhi harga efek atau keputusan pemodal, calon pemodal, atau pihak lain yang berkepentingan atas informasi atau fakta tersebut"),
    dataKamus("Fraksi Harga","Perubahan harga minimum atau satuan pecahan terhadap perubahan harga saham."),
    dataKamus("Go Public","Penawaran umum saham yang dilakukan perusahaan kepada publik"),
    dataKamus("Go Private","Perubahan status perusahaan dari perusahaan terbuka menjadi perusahaan tertutup"),
    dataKamus("Growth Stock","Saham suatu perseroan yang sudah memperlihatkan perolehan penghasilan yang lebih cepat dari rata-rata selama beberapa tahun terakhir dan diharapkan akan menunjukkan tingkat pertumbuhan laba yang tinggi"),
    dataKamus("Harga Nominal","Nilai yang ditetapkan emiten untuk menilai setiap saham yang mereka terbitkan."),
    dataKamus("Harga Pasar","Harga terakhir yang dilaporkan saat saham terjual di bursa."),
    dataKamus("Harga Pembukaan","Harga yang terjadi pertama kali pada saat jam bursa dibuka."),
    dataKamus("Harga Penutupan","Harga yang terjadi terakhir pada saat akhir jam bursa."),
    dataKamus("Harga Perdana","Harga pada waktu pertama kali suatu efek dikeluarkan/ditawarkan kepada masyarakat."),
    dataKamus("Harga Tertinggi/Terendah","Harga saham yang paling tinggi atau paling rendah terjadi pada satu hari bursa."),
    dataKamus("Hari Bursa","Hari di mana bursa efek atau badan hukum yang menggantikannya menyelenggarakan kegiatan bursa efek menurut peraturan perundang-undangan yang berlaku dan ketentuan-ketentuan bursa efek tersebut serta kliring dapat dilakukan oleh bank."),
    dataKamus("Hedging","Lindung nilai dengan cara melakukan transaksi di pasar berjangka dengan posisi berlawanan dari pasar spot."),
    dataKamus("HMETD","Hak Memesan efek Terlebih Dahulu."),
    dataKamus("Holding Company","Perusahaan yang memiliki saham dengan hak suara yang cukup di dalam perusahaan lain untuk mempengaruhi dewan direksi sehingga dapat mengendalikan kebijaksanaan dan manajemen perusahaan tersebut."),
    dataKamus("Halting","Penghentian sementara perdagangan saham secara umum di bursa efek karena terjadi kenaikan/penurunan harga yang signifikan tanpa didukung adanya informasi yang relevan"),
    dataKamus("Indeks Harga Saham","Index harga saham merupakan indikator utama yang menggambarkan pergerakan harga saham."),
    dataKamus("Indeks Harga Saham Gabungan (IHSG)","Indikator gabungan dari pergerakan harga seluruh saham yang tercatat di Bursa Efek Indonesia, baik saham biasa maupun saham preferen. Hari dasar perhitungan IHSG adalah tanggal 10 Agustus 1982 dengan nilai 100."),
    dataKamus("Ijin Perseorangan (Individual License)","Ijin yang diberikan perorangan untuk menjalankan kegiatan usaha, dalam hal ini sebagai Wakil Penjamin Emisi efek (WPEE),"),
    dataKamus("Inflasi","Fenomena kenaikan tingkat harga secara umum dan terus-menerus."),
    dataKamus("Insider Trading","Transaksi saham berdasarkan bocoran informasi rahasia dari orang dalam, pihak-pihak yang terkait dengan emiten, konsultan perusahaan atau regulator (insider information). Transaksi seperti ini umumnya melibatkan orang-orang yang menurut aturan tidak boleh melakukan transaksi, seperti direktur perusahaan yang memperdagangkan saham perusahaan sendiri."),
    dataKamus("Investasi","Kegiatan menanam dana atau modal dengan tujuan untuk mendapatkan keuntungan dimasa mendatang."),
    dataKamus("JATS (Jakarta Automated Trading System)","Singkatan dari Jakarta Automated Trading System yang merupakan sistem perdagangan efek yang berlaku di Bursa Efek Indonesia untuk perdagangan yang dilakukan secara otomatis dengan menggunakan sarana komputer."),
    dataKamus("JONEC (Jakarta Open Network Environment Client)","Sarana di Anggota bursa efek yang terdiri dari perangkat lunak dan perangkat keras yang digunakan oleh Anggota bursa efek untuk mengakses JATS melalui Jaringan dan Terminal Remote Trading sesuai dengan Panduan Perdagangan efek Bersifat Ekuitas."),
    dataKamus("JONES (Jakarta Open Network Environment Server)","Sarana di bursa yang terdiri dari perangkat lunak dan perangkat keras yang digunakan oleh bursa untuk meneruskan penawaran jual dan atau permintaan beli dari Anggota bursa efek ke JATS sesuai dengan Panduan Perdagangan efek Bersifat Ekuitas."),
    dataKamus("Kalender Bursa","Kalender mengenai hari diselenggarakan perdagangan efek di bursa."),
    dataKamus("Kapitalisasi Pasar","Harga saham perusahaan dikalikan dengan jumlah saham yang beredar."),
    dataKamus("KIK (Kontrak Investasi Kolektif)","Kontrak antara Manajer Investasi (MI) dan Bank Kustodian. Dalam kontrak itu MI diberi wewenang mengelola portofolio investasi secara kolektif, dan Bank Kustodian diberi wewenang untuk menerima penitipan secara kolektif."),
    dataKamus("Kliring","Proses penentuan hak dan kewajiban Anggota Kliring yang timbul atas transaksi bursa yang dilakukan di bursa efek. Tujuan dari proses kliring adalah agar masing-masing Anggota Kliring mengetahui hak dan kewajibannya baik berupa efek maupun uang untuk diselesaikan pada tanggal penyelesaian."),
    dataKamus("KPEI","Lembaga yang menyelenggarakan jasa kliring dan penjaminan penyelesaian transaksi bursa."),
    dataKamus("KSEI","PT Kustodian Sentral efek Indonesia, berkedudukan di Jakarta Selatan, yang merupakan Lembaga Penyelesaian dan Penyimpanan sesuai dengan peraturan perundang-undangan di bidang Pasar Modal."),
    dataKamus("Kustodian","Pihak yang memberikan jasa penitipan efek dan harta lain yang berkaitan dengan efek serta jasa lainnya termasuk menerima dividen dan hak-hak lain, menyelesaikan transaksi efek dan mewakili pemegang rekening yang menjadi nasabahnya sesuai dengan ketentuan undang undang pasar modal yang meliputi KSEI, Perusahaan efek dan Bank Kustodian."),
    dataKamus("Kontrak Opsi Saham (KOS)","Satuan perdagangan opsi saham yang ditetapkan dalam satu satuan kontrak"),
    dataKamus("Laporan Keuangan Auditan","Laporan keuangan perusahaan yang telah diaudit yang disertai dengan opini dan telah ditandatangani oleh akuntan publik yang telah terdaftar di OJK"),
    dataKamus("Laporan Keuangan Interim","Laporan keuangan triwulanan atau tengah tahunan"),
    dataKamus("Leverage","Rasio antara jumlah jaminan dan dana yang dipinjam yang dialokasikan untuk trading."),
    dataKamus("Likuiditas","Karakteristik suatu saham yang jumlahnya cukup banyak di dalam peredaran sehingga memungkinkan relative mudah untuk ditransaksikan."),
    dataKamus("Lock Up","Suatu istilah yang menunjukkan bahwa suatu surat berharga atau saham tidak boleh diperjualbelikan dalam kurun waktu tertentu"),
    dataKamus("Lot","Satuan perdagangan saham di bursa (100 saham)."),
    dataKamus("LQ-45","Indeks di Bursa Efek Indonesia yang terbentuk dari 45 saham dengan likuiditas dan kapitalisasi pasar tertinggi dan diseleksi melalui beberapa kriteria pemilihan. LQ-45 dievaluasi setiap enam bulan sekali."),
    dataKamus("Management Fee","Sejumlah dana yang diberikan ke sejumlah pihak yang terkait dengan pengelolaan reksadana, seperti biaya transaksi pialang, biaya jasa MI, Notaris, Akuntan Publik, Bank Kustodian dan sebagainya."),
    dataKamus("Manajer Investasi","Pihak yang mendapat izin dari Bapepam untuk mengadakan kegiatan usaha mengelola Portfolio efek bagi para nasabah atau mengelola Portfolio Investasi kolektif untuk sekelompok nasabah."),
    dataKamus("Manipulasi Pasar","Upaya mempengaruhi investor lain dalam mengambil keputusan investasi melalui informasi yang tidak benar."),
    dataKamus("Margin Call","Suatu keadaan atau kondisi dimana sisa dana yang digunakan untuk menahan pergerakan market tidak mencukupi lagi."),
    dataKamus("Margin Trading","Perdagangan saham dengan sebagian modal pinjaman dari pialang dengan jaminan saham yang dibeli."),
    dataKamus("Market Share","Bagian pasar yang dapat diraih oleh perusahaan. Pangsa pasar menjadi salah satu indikator meningkatnya kinerja pemasaran suatu perusahaan."),
    dataKamus("MESOP (Management and Employee Stock Option Program)","Penerbitan opsi bagi para manajemen dan karyawan Perseroan untuk membeli saham Perseroan berdasarkan ketentuan yang telah ditetapkan oleh Perseroan dan peraturan perundangan pasar modal yang berlaku."),
    dataKamus("Modal Kerja Bersih Disesuaikan (MKBD)","Jumlah aset lancar dikurangi dengan seluruh liabilitas perusahaan dan Ranking Liabilities, ditambah dengan Utang Subordinasi."),
    dataKamus("Monthly Statement","Laporan bank kepada nasabah mereka yang berisi catatan (informasi) mengenai transaksi selama satu bulan dan posisi keuangan pada akhir bulan bersangkutan."),
    dataKamus("Mudharabah","Bentuk kerja sama antara dua atau lebih pihak di mana pemilik modal (shahibul amal) mempercayakan sejumlah modal kepada pengelola (mudharib) dengan suatu perjanjian di awal."),
    dataKamus("Musyarakah","Perjanjian di antara para pemilik dana/modal untuk mencampurkan dana/modal mereka pada suatu usaha tertentu, dengan pembagian keuntungan diantara pemilik dana/modal berdasarkan nisbah yang telah disepakati sebelumnya, sedangkan kerugian ditanggung semua pemilik dana/modal berdasarkan bagian dana/modal masing-masing."),
    dataKamus("NAB (Nilai Aktiva Bersih)","Nilai yang menggambarkan total kekayaan bersih Reksa Dana setiap harinya."),
    dataKamus("NAB/UP","Angka yang menyatakan harga suatu reksa dana, dan transaksi dilakukan berdasarkan nilai tersebut."),
    dataKamus("Netting","Kegiatan kliring yang menimbulkan hak dan kewajiban bagi setiap anggota kliring untuk menyerahkan atau menerima saldo efek tertentu utuk setiap jenis efek yang ditransaksikan dan untuk menerima atau membayar sejumlah uang untuk seluruh efek yang ditransaksikan"),
    dataKamus("Nisbah","Rasio atau perbandingan pembagian keuntungan (bagi hasil) antara shahib al-mal dan mudharib."),
    dataKamus("Obligasi","Surat utang jangka menengah-panjang yang dapat dipindahtangankan yang berisi janji dari pihak yang menerbitkan untuk membayar imbalan berupa bunga pada periode tertentu dan melunasi pokok utang pada waktu yang telah ditentukan kepada pihak pembeli obligasi tersebut."),
    dataKamus("Odd lot","Satuan jumlah saham yang jumlahnya lebih kecil dari satuan perdagangan saham di bursa efek, sehingga jumlah tersebut tidak dapat diperdagangkan di pasar regular. Satuan perdagangan di BEI adalah 100 saham."),
    dataKamus("Offer","Penawaran jual suatu saham di bursa oleh calon penjual dimana harga penawarannya disebut offer price."),
    dataKamus("Open Price","Harga pada saat bursa pertama kali dibuka setiap hari."),
    dataKamus("Option (Opsi)","Hak untuk membeli atau menjual suatu saham pada harga yang telah diperjanjikan sebelumnya."),
    dataKamus("Otoritas Jasa Keuangan (OJK)","Lembaga negara yang dibentuk berdasarkan UU Nomor 21 Tahun 2011 yang berfungsi menyelenggarakan sistem pengaturan dan pengawasan yang terintegrasi terhadap keseluruhan kegiatan di dalam sektor jasa keuangan."),
    dataKamus("Over The Counter (OTC)","Pembelian dan penjualan instrumen keuangan yang terjadi di luar bursa yang terorganisir seperti bursa efek. Pasar OTC biasanya memperdagangkan saham dan surat berharga lainnya menggunakan jaringan komputerisasi antar dealer."),
    dataKamus("Pasar Modal","Pasar untuk memperjualbelikan berbagai instrumen keuangan jangka panjang, baik surat utang (obligasi), ekuiti (saham), reksa dana, instrumen derivatif maupun instrumen lainnya dan memfasilitasi berbagai sarana dan prasarana kegiatan jual beli dan kegiatan terkait lainnya."),
    dataKamus("Pasar Perdana","Penawaran dan penjualan Saham yang ditawarkan Perseroan dan Pemegang Saham Penjual kepada masyarakat selama masa tertentu sebelum saham tersebut dicatatkan pada BEI."),
    dataKamus("Pasar Sekunder (Secondary Market)","Pasar sekunder adalah suatu istilah yang menunjukan perdagangan efek setelah diterbitkan dan dijual untuk pertama kali (emisi baru). Atau, setelah pasar perdana atau perdagangan di bursa efek."),
    dataKamus("Pasar Negosiasi","Pasar di mana perdagangan efek di bursa dilaksanakan berdasarkan tawar menawar langsung secara individual dan tidak secara lelang (auction) dan penyelesaian transaksinya dapat dilakukan berdasarkan kesepakatan anggota bursa efek"),
    dataKamus("Pasar Tunai","Pasar di mana perdagangan efek di bursa dilaksanakan berdasarkan tawar menawar tidak secara lelang (auction) layaknya transaksi reguler dan penyelesaian transaksinya dilakukan pada hari yang sama (T+0)"),
    dataKamus("Papan Utama (Main Board)","Papan pencatatan yang disediakan untuk mencatatkan saham dari perusahaan yang memiliki aktiva berwujud bersih sekurang-kurangnya Rp 100 milyar dan memiliki pengalaman operasional sekurang-kurangnya 36 bulan"),
    dataKamus("Papan Pengembangan (Development Board)","Papan pencatatan yang disediakan untuk mencatatkan saham dari perusahaan yang memiliki aktiva berwujud bersih sekurang-kurangnya Rp 5 milyar dan memiliki pengalaman operasional sekurang-kurangnya 12 bulan"),
    dataKamus("Pemegang Saham","Masyarakat yang memiliki manfaat atas saham yang disimpan dan di administrasikan dalam daftar Pemegang Saham Perseroan, rekening efek pada Kustodian Sentral efek Indonesia, rekening efek pada KSEI melalui perusahaan efek atau Bank Kustodian."),
    dataKamus("Pemegang Saham Utama","Setiap pihak yang, baik secara langsung maupun tidak langsung, memiliki sekurang-kurangnya 20% (dua puluh persen) hak suara dari seluruh saham yang mempunyai hak suara yang dikeluarkan oleh Perseroan."),
    dataKamus("Penasihat Investasi","Seseorang atau perusahaan yang mendapat izin resmi dari Bapepam untuk bertindak sebagai pemberi nasehat kepada pemodal awam yang ingin menanamkan modalnya dengan harapan memperoleh penghasilan yang memadai."),
    dataKamus("Penawaran Umum Perdana (IPO)","Kegiatan penawaran umum Saham Yang Ditawarkan yang dilakukan oleh Perseroan dan Pemegang Saham Penjual untuk menjual saham kepada masyarakat untuk pertama kalinya berdasarkan tata cara yang diatur dalam Undang-undang Pasar Modal dan ketentuan-ketentuan lain yang berhubungan."),
    dataKamus("Penjamin Emisi Efek/Underwriter","Perseroan Terbatas baik sendiri maupun bersama-sama dengan beberapa Perseroan Terbatas yang menjamin atas pembelian dan pembayaran sisa efek yang tidak diambil oleh masyarakat sesuai dengan bagian penjaminannya sesuai dengan syarat dan ketentuan dalam Perjanjian Penjaminan Emisi efek."),
    dataKamus("Perantara Pedagang Efek","Perusahaan yang bertindak sebagai perantara bagi pemodal yang ingin membeli atau menjual saham di pasar modal/bursa. Perusahaan yang sama dapat juga membeli atau menjual efek atas namanya sendiri, bila ia bertindak bukan lagi sebagai perantara tetapi sebagai pedagang."),
    dataKamus("Perusahaan Afiliasi","Perusahaan yang mempunyai hubungan Afiliasi dengan Perseroan sebagaimana dimaksud dalam UUPM dan peraturan pelaksanaannya."),
    dataKamus("Perusahaan Efek","Pihak yang melakukan kegiatan usaha sebagai Penjamin Emisi efek, Perantara Pedagang efek dan/atau Manajer Investasi sebagaimana dimaksud dalam Undang-Undang Pasar Modal."),
    dataKamus("Perusahaan Efek (Sekuritas)","Perusahaan yang telah memiliki ijin usaha untuk menjalankan satu atau beberapa kegiatan sebagai penjamin emisi, pialang, manajer investasi atau penasihat investasi."),
    dataKamus("Perusahaan Publik","Perusahaan yang sahamnya telah dimiliki sekurang-kurangnya oleh 300 (tiga ratus) pemegang saham dan memiliki modal disetor sekurang-kurangnya Rp. 3.000.000.000 (tiga miliar rupiah) atau suatu jumlah pemegang saham dan modal disetor yang ditetapkan dengan Peraturan Pemerintah."),
    dataKamus("Perusahaan Tercatat (listed company)","Perusahaan yang saham-sahamnya tercatat atau terdaftar dan dapat diperdagangkan pada suatu bursa efek. Masing-masing bursa efek mempunyai persyaratan tersendiri bagi suatu perusahaan yang akan tercatat di bursa tersebut."),
    dataKamus("Pialang/Broker","Pihak yang melaksanakan pembelian dan atau penjualan saham atas perintah investor. Dari aktivitasnya tersebut, pialang mendapatkan komisi (fee)."),
    dataKamus("Pooling Order","Orang-orang yang melakukan order pada saham secara kolektif sehingga mampu menciptakan fluktuasi terhadap harga suatu saham."),
    dataKamus("Portofolio","Melakukan diversifikasi investasi pada lebih dari sebuah saham atau dengan kombinasi obligasi, valas, properti atau aktiva lainnya dengan tujuan mengurangi resiko, maka Anda telah menciptakan portfolio."),
    dataKamus("Price & Time Priority","Prioritas dalam melakukan transaksi jual beli saham di bursa efek (di Pasar Reguler) dimana pihak yang menawarkan harga paling tinggi untuk membeli atau paling rendah untuk menjual akan mendapatkan prioritas dalam suatu transaksi, sementara penawaran pada harga yang sama baik untuk beli maupun untuk jual, prioritas diberikan kepada siapa yang lebih dahulu memasukan penawaran tersebut."),
    dataKamus("Prospektus","Setiap informasi tertulis sehubungan dengan penawaran umum dengan tujuan agar pihak lain membeli efek."),
    dataKamus("Prospektus Awal","Dokumen tertulis yang memuat seluruh informasi dalam Prospektus yang disampaikan kepada Bapepam & LK, sebagai bagian dari Pernyataan pendaftaran, kecuali informasi mengenai harga penawaran, penjaminan emisis efek atau hal-hal lain yang berhubuangan dengan persyaratan penawaran yang belum dapat ditentukan."),
    dataKamus("Prospektus Ringkas","Ringkasan Prospektus yang disusun dan diterbitkan oleh Perseroan bersama-sama dengan Penjamin Pelaksana Emisi dan diumumkan dalam sekurang-kurangnya 1 (satu) surat kabar kabar harian berbahasa Indonesia yang mempunyai peredaran nasional dalam waktu selambat-lambatnya 2 (dua) hari kerja setelah diterimanya pernyataan OJK bahwa Perseroan wajib mengumumkan Prospektus Ringkas."),
    dataKamus("PSAK","Prinsip Standar Akuntansi Keuangan yang berlaku umum di Indonesia."),
    dataKamus("Quote","Kependekan dari kata quotation, menunjukan harga saat ini (real time price) untuk saham yang ditawarkan."),
    dataKamus("Rekening Dana Investor (RDI)","Rekening di bank atas nama investor yang terpisah dari rekening di sekuritas."),
    dataKamus("Rekening Efek","Rekening yang memuat posisi saham dan/atau dana milik Pemegang Saham yang diadministrasikan oleh KSEI, bank Kustodian, atau Perusahaan efek berdasarkan perjanjian pembuakaan rekening efek yang ditandatangani dengan Pemegang Saham."),
    dataKamus("Rekening Penawaran Umum","Rekening atas nama Penjamin Pelaksana Emisi efek pada bank penerima untuk menampung dan menerima uang pemesanan atas saham yang ditawarkan pada harga penawaran."),
    dataKamus("Reksa Dana","Wadah dan pola pengelolaan dana/modal bagi sekumpulan investor untuk berinvestasi dalam instrumen-instrumen investasi yang tersedia di Pasar dengan cara membeli unit penyertaan reksadana. Dana ini kemudian dikelola oleh Manajer Investasi (MI) ke dalam portofolio investasi, baik berupa saham, obligasi, pasar uang ataupun efek/sekuriti lainnya."),
    dataKamus("Remote Trading","Sistem perdagangan di BEI dimana order dilakukan tidak lagi di lantai bursa, namun dapat dilakukan langsung melalui kantor Perusahaan efek."),
    dataKamus("Return","Hasil yang diperoleh dari penanaman modal tertentu dalam suatu perusahaan pada periode tertentu."),
    dataKamus("Right","Hak yang diterbitkan untuk pemegang saham yang sudah ada guna mengizinkan mereka untuk menjaga persentase kepemilikan ketika saham baru akan diterbitkan."),
    dataKamus("Rights Issue (Penawaran Umum Terbatas)","Salah satu bentuk peningkatan modal disetor suatu perseroan. Dalam right issue/penawaran umum terbatas, perseroan menawarkan hak (right) kepada pemegang saham yang ada untuk mendapatkan saham baru yang tentu saja berarti menyetor modal dengan rasio tertentu."),
    dataKamus("ROA","Singkatan dari Return on Asset, yaitu Imbal Hasil Aset yang merupakan perbandingan antara jumlah laba setelah pajak tahun berjalan dengan jumlah aset dalam tahun yang sama."),
    dataKamus("ROE","Singkatan dari Return on Equity, yaitu Imbal Hasil Ekuitas yang merupakan perbandingan antara jumlah laba setelah pajak tahun berjalan dengan jumlah ekuitas dalam tahun yang sama."),
    dataKamus("RUPS","Singkatan dari Rapat Umum Pemegang Saham, yang diselenggarakan sesuai dengan ketentuan Anggaran Dasar Perseroan."),
    dataKamus("RUPSLB","Singkatan dari Rapat Umum Pemegang Saham Luar Biasa Perseroan yang dilakukan sesuai dengan ketentuan Anggaran Dasar Perseroan."),
    dataKamus("Saham","Bukti penyertaan modal di suatu perusahaan, atau merupakan bukti kepemilikan atas suatu perusahaan."),
    dataKamus("Saham Bonus","Saham yang dibagikan secara cuma-cuma kepada pemegang saham bedasarkan jumlah saham yang dimiliki."),
    dataKamus("Saham Gorengan","Saham perusahaan-perusahaan yang umumnya diperdagangkan bukan berdasarkan fundamentalnya, tapi berdasarkan rumor atau isu."),
    dataKamus("Saham Marjin","efek yang memenuhi syarat untuk ditransaksikan dengan pembiayaan penyelesaian transaksi efek oleh perusahaan efek bagi nasabah (secara margin)."),
    dataKamus("Saham Tidur","Saham yang tidak aktif diperdagangkan."),
    dataKamus("Saldo Laba","Akumulasi hasil usaha periodik setelah memperhitungkan pembagian dividend an koreksi laba rugi periode lalu."),
    dataKamus("Scripless Trading","Sistem perdagangan tanpa warkat dan penyelesaian transaksi dilakukan dengan pemindahbukuan (book entry settlement)"),
    dataKamus("Stock Split","Pemecahan setiap satuan unit saham menjadi lebih dari satu sehingga akan menambah jumlah saham yang beredar."),
    dataKamus("Subscription","Pemesanan atau pembelian UP (Unit Penyertaan) Reksa Dana"),
    dataKamus("Sukuk","Obligasi yang berdasarkan prinsip syariah."),
    dataKamus("Sukuk Ijarah","Sukuk yang diterbitkan berdasarkan perjanjian atau akad ijarah, dimana satu pihak bertindak sendiri atau melalui wakilnya menyewakan hak manfaat atas suatu aset kepada pihak lain berdasarkan harga dan periode yang disepakati, tanpa diikuti perpindahan kepemilikan aset itu sendiri."),
    dataKamus("Sukuk Istishna","Sukuk yang diterbitkan berdasarkan perjanjian atau akad istishna, dimana para pihak menyepakati jual-beli dalam rangka pembiayaan suatu proyek atau barang. Adapun harga, waktu penyerahan dan spesifikasi proyek barang ditentukan terlebih dahulu berdasarkan kesepakatan."),
    dataKamus("Sukuk Mudharabah","Sukuk yang diterbitkan berdasarkan perjanjian atau akad mudharabah, dimana satu pihak menyediakan modal (rab-al-maal/shahibul maal) dan pihak lain menydiakan tenaga dan keahlian (mudharib), keuntungan dari kerjasama tersebut akan dibagi berdasarkan proporsi perbandingan (nisbah) yang disepakati sebelumnya. Kerugian yang timbul akan ditanggung sepenuhnya oleh pihak penyedia modal, sepanjang kerugian tersebut tidak ada unsur moral hazard (niat tidak baik dari mudharib)."),
    dataKamus("Sukuk Musyarakah","Sukuk yang diterbitkan berdasarka perjanjian atau akad musyarakah, dimana dua pihak atau lebih bekerjasama menggabungkan modal untuk membangun proyek baru, mengembangkan proyek yang sudah ada, atau membiayai kegiatan usaha. Keuntungan maupun kerugian yang timbul ditanggung bersama sesuai dengan jumlah partisipasi modal masing-masing pihak."),
    dataKamus("Suspensi saham","Penghentian sementara perdagangan suatu saham di bursa efek. Penghentian ini dapat disebabkan karena permintaan Emiten sendiri atau merupakan keputusan bursa dalam rangka memberikan perlindungan kepada investor atau dapat pula karena pengenaan sanksi oleh bursa efek kepada suatu Emiten."),
    dataKamus("T+2","Istilah dalam penyelesaian transaksi yang artinya setelah transaksi hak dan kewajiban diselesaikan dalam waktu 2 hari bursa."),
    dataKamus("Trade Confirmation (TC)","Laporan yang diterima nasabah pada hari yang sama (24 jam) setelah nasabah melakuakn transaksi efek baik jual maupun beli."),
    dataKamus("Trading Floor","Tempat transaksi saham atau efek berlangsung."),
    dataKamus("Transaksi Bursa","Transaksi yang dilakukan oleh Anggota bursa efek yang tertuang dalam bentuk kontrak kesepakatan dengan bursa efek."),
    dataKamus("Transaksi di Luar Bursa","Transaksi efek yang dilakukan di luar bursa dan tidak diatur oleh bursa."),
    dataKamus("Undang-Undang Pasar Modal","Undang-undang Republik Indonesia No. 8 tahun 1995 tanggal 10 November 1995 tentang Pasar Modal, Lembaran Negara Republik Indonesia No. 64 Tahun 1995, Tambahan No. 3608 beserta peraturan pelaksanaannya berikut perubahan-perubahannya."),
    dataKamus("Undersubscribed","Jumlah permintaan terhadap saham perdana kurang dari jumlah saham yang akan diterbitkan. Kebalikannya adalah oversubscribed."),
    dataKamus("Undervalued","Saham atau surat berharga diperdagangkan dengan harga dibawah nilai asetnya."),
    dataKamus("Unusual Market Activity (UMA)","Aktivitas perdagangan dan/atau pergerakan harga suatu efek yang tidak biasa pada suatu kurun waktu tertentu di bursa yang menurut penilaian bursa dapat berpotensi mengganggu terselenggaranya perdagangan efek yang teratur, wajar dan efisien."),
    dataKamus("UUPT","Undang-undang Republik Indonesia No. 40 Tahun 2007 tentang Perseroan Terbatas, Lembaran Negara Republik Indonesia No. 106 Tahun 2007 Tambahan no. 4756, beserta peraturan pelaksanaannya berikut perubahan-perubahannya."),
    dataKamus("WAPERD (Wakil Agen Penjual Efek Reksa Dana)","Orang perseorangan yang mendapatkan izin dari Badan Pengawas Pasar Modal (dan Lembaga Keuangan) untuk bertindak sebagai Penjual efek Reksa Dana."),
    dataKamus("Waran","efek yang diterbitkan oleh suatu perusahaan yang memberi hak kepada pemegang efek untuk memesan/membeli saham perusahaan tersebut pada harga tertentu setelah 6 bulan atau lebih."),
    dataKamus("Warrant","efek yang dijual oleh perusahaan secara tunai, umumnya terkait penerbitan efek lainnya."),
    dataKamus("Window Dressing","Teknik manajer investasi untuk mempercantik kinerja dengan mengangkat harga saham-saham yang ada di portfolionya, dan melepas saham-saham dengan performa kurang baik."),
    dataKamus("WMI (Wakil Manajer Investasi)","Pihak yang memberikan nasihat investasi, baik membeli atau menjual suatu efek, dengan mendapatkan imbalan atas jasanya."),
    dataKamus("WPEE (Wakil Penjamin Emisi Efek)","Pihak yang bertugas untuk mempersiapkan dan menghantarkan sebuah perusahaan untuk menjual efeknya kepada masyarakat luas (go public)."),
    dataKamus("WPPE (Wakil Perantara Pedagang Efek)","Pihak yang melakukan kegiatan usaha jual beli efek untuk kepentingan sendiri atau pihak lain."),
  ];

  List<dataKamus> display_list = List.from(data_list);

  void update_list(String value) {
    setState(() {
      display_list = data_list
        .where((element) => 
          element.title!.toLowerCase().contains
          (value.toLowerCase()))
        .toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        shape: const CircleBorder(),
                        foregroundColor: const Color(0xff5ADFB2),
                        disabledForegroundColor:const Color(0xff5ADFB2),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 22,
                        color: Color(0xff5ADFB2),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Kamus Investasi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: UsedColor.primaryGrey,
                            fontFamily: "OpenSans"
                          ),
                        ),
                      ],
                    ),
                    )
                    
                  
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 40,
                width: double.infinity,
                child: TextField(
                  // textAlign: TextAlign.center,
                  onChanged: (value) => update_list(value),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: const Color(0xffF0F0F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Cari Istilah...",
                    prefixIcon: const Icon(Icons.search, color: UsedColor.primaryGreen,),
                  ),
                ),
              ),
              const SizedBox(height: 13,),              
              SizedBox(
                height: 700,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => 
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: Container(
                      
                      decoration: BoxDecoration(
                        color: _customTileExpanded ? Colors.amberAccent : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        // border: Border.all(color: UsedColor.primaryGrey, width: 0.5)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: ExpansionTile(
                          backgroundColor: UsedColor.primaryGreen,
                          
                          
                          title: Container(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(display_list[index].title!, 
                              style: const TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.black,
                          textColor: Colors.white,
                          collapsedTextColor: Colors.black,
                          children: 
                          <Widget>[
                            ListTile(
                              contentPadding: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 0),
                              title: Text(display_list[index].content!, 
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "OpenSans",
                                  fontSize: 14
                                ),
                              )
                            ),
                            // SizedBox(height: 20,)
                          ],
                                          ),
                      ),
                    ),
                  ),
                ),
                // separatorBuilder: (context, index) => SizedBox(
                //   height: 10,
                // )
                
              ),
              const SizedBox(height: 200,),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Initial(name) {
  String getInitials(String name) => name.isNotEmpty
    ? name.trim().split(' ').map((l) => l[0]).take(2).join()
    : '';

  return Container(
    width: 50,
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: UsedColor.primaryGreen,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      getInitials(name),
      style: const TextStyle(
        fontFamily: "OpenSans",
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold

      ),
    ),
  );
}


