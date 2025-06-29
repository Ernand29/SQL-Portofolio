# SQL-Portofolio
## 📝 Ringkasan Proyek

Proyek ini bertujuan untuk menganalisis data operasional sebuah restoran menggunakan SQL. Analisis mencakup eksplorasi menu, pola pemesanan pelanggan, dan performa penjualan secara keseluruhan. Dengan menggunakan serangkaian query SQL, saya menggali data untuk menjawab pertanyaan-pertanyaan bisnis kunci dan memberikan wawasan yang dapat ditindaklanjuti untuk meningkatkan strategi menu dan operasional restoran.

Proyek ini terbagi menjadi tiga objektif analisis utama:
1.  **Analisis Menu:** Memahami komposisi, harga, dan kategori item pada menu.
2.  **Analisis Pesanan:** Menganalisis volume dan tren pesanan dari waktu ke waktu.
3.  **Analisis Performa Penjualan:** Menggabungkan data menu dan pesanan untuk mengidentifikasi item terlaris dan perilaku belanja pelanggan.

---

## 🎯 Objektif & Pertanyaan Bisnis

Setiap file SQL dalam repositori ini dirancang untuk menjawab pertanyaan bisnis spesifik:

### **Objective 1: Analisis Menu (`Objective1.sql`)**
* Berapa jumlah total item yang tersedia di menu?
* Apa saja item yang paling mahal dan paling murah?
* Berapa banyak hidangan dalam setiap kategori (misalnya, American, Asian, Italian)?
* Berapa harga rata-rata hidangan per kategori?

### **Objective 2: Analisis Pesanan (`Objective2.sql`)**
* Apa rentang tanggal dari data pesanan yang dimiliki?
* Berapa total pesanan unik yang terjadi?
* Berapa total item yang dipesan secara keseluruhan?
* Pesanan mana yang memiliki jumlah item terbanyak? Apakah ada pesanan dalam jumlah besar (lebih dari 12 item)?

### **Objective 3: Analisis Performa Penjualan (`Objective3.sql`)**
* Item mana yang paling laris dan paling jarang dipesan?
* Apa kategori hidangan yang paling populer?
* Pesanan mana yang menghasilkan pendapatan tertinggi (top 5 spenders)?
* Item apa saja yang dibeli pada pesanan dengan pendapatan tertinggi?

---

## 🗄️ Skema Database

Database `restaurant_db` terdiri dari dua tabel utama yang saling berhubungan: `menu_items` dan `order_details`.

* **`menu_items`**: Menyimpan informasi detail tentang setiap item menu.
* **`order_details`**: Mencatat setiap item yang dipesan sebagai bagian dari sebuah transaksi.

Hubungan antara kedua tabel adalah **One-to-Many**, di mana satu `menu_item` dapat muncul di banyak `order_details` melalui `item_id`.

```
[menu_items]          [order_details]
- menu_item_id (PK)   - order_details_id (PK)
- item_name           - order_id
- category            - order_date
- price               - order_time
                      - item_id (FK)
```

File `create_restaurant_db.sql` berisi skema (DDL) dan data (DML) lengkap untuk membuat ulang database ini.

---

## 💡 Contoh query Analisis

Berikut adalah beberapa contoh query SQL yang digunakan untuk mendapatkan wawasan dari data:

#### 1. Menemukan 5 Pesanan dengan Total Belanja Tertinggi
query ini menggabungkan data menu dan pesanan, menghitung total belanja untuk setiap pesanan, dan mengurutkannya untuk menemukan 5 pesanan teratas.

```sql
-- Dari file: Objective3.sql
SELECT
    order_id,
    SUM(price) AS total_spend
FROM
    menu_items mi
JOIN
    order_details od ON mi.menu_item_id = od.item_id
GROUP BY
    order_id
ORDER BY
    total_spend DESC
LIMIT 5;
```

#### 2. Menganalisis Detail Item pada Pesanan dengan Belanja Tertinggi (`order_id = 440`)
Setelah menemukan pesanan teratas, query ini digunakan untuk melihat item apa saja yang dibeli dan dari kategori mana.

```sql
-- Dari file: Objective3.sql
SELECT
    category,
    COUNT(item_id) AS num_items
FROM
    menu_items mi
JOIN
    order_details od ON mi.menu_item_id = od.item_id
WHERE
    order_id = 440
GROUP BY
    category
ORDER BY
    num_items DESC;
```

#### 3. Menghitung Jumlah Hidangan per Kategori
query ini memberikan gambaran tentang distribusi item menu di berbagai kategori.

```sql
-- Dari file: Objective1.sql
SELECT
    category,
    COUNT(*) AS total_dish
FROM
    menu_items
GROUP BY
    category;
```

---

## 📬 Hubungi Saya

Jika Anda memiliki pertanyaan atau ingin berdiskusi mengenai proyek ini, jangan ragu untuk menghubungi saya.

* **LinkedIn:** https://www.linkedin.com/in/ernando-taufiq-nur-hidayat/
* **Email:** ernando.taufiq29@gmail.com
