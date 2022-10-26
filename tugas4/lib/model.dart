class Warnet {
  final String title;
  final String description;
  final double rating;
  final String gambar;
  final String open;

  const Warnet({
    required this.title,
    required this.description,
    required this.rating,
    required this.gambar,
    required this.open,
  });
}

const List<Warnet> listWarnet = [
  Warnet(
      title: "Tokyo Gaming Space",
      description:
          "Jl. Kincan Raya No.22, RT.001/RW.002, Jatibening Baru, Kec. Pd. Gede, Kota Bks, Jawa Barat 17412",
      rating: 4.6,
      gambar: "lib/images/warnet1.jpg",
      open: "24 Hours"),
  Warnet(
      title: "WCG Esport",
      description:
          "10, Jl. KH.Moh.Mansyur No.206c, RT.10/RW.5, Tanah Sereal, Kec. Tambora, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11260",
      rating: 4.4,
      gambar: "lib/images/warnet2.jpg",
      open: "24 Hours"),
  Warnet(
      title: "Gamers Paradise",
      description:
          "Jl. KH. Ahmad Dahlan Kby. No.32, RT.3/RW.3, Kramat Pela, Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12130",
      rating: 4.9,
      gambar: "lib/images/warnet3.jpg",
      open: "10AM-11PM"),
  Warnet(
      title: "Khronos Esport Arena",
      description:
          "Jl. Batununggal Indah Raya No.148, Batununggal, Kec. Bandung Kidul, Kota Bandung, Jawa Barat 40267",
      rating: 4.9,
      gambar: "lib/images/warnet4.jpg",
      open: "24 Hours"),
  Warnet(
      title: "Aorus Icafe",
      description:
          "Jl. Jelambar Utama No.18B, RT.2/RW.8, Wijaya Kusuma, Kec. Grogol petamburan, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11460",
      rating: 4.5,
      gambar: "lib/images/warnet5.jpg",
      open: "24 Hours"),
];
