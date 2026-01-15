# Ruveyda_Ozsoy_Project_SQL
📚 Library Management System – Proje Hikâyesi / Project Story
🇹🇷 Türkçe Versiyon
🎯 Projenin Hikâyesi
Bir kütüphaneyi düşünün: raflarda yüzlerce kitap, her gün yeni üyeler, ödünç alma ve iade işlemleri, rezervasyon talepleri ve bazen gecikmelerden doğan cezalar…
Bu kadar çok veriyi manuel olarak takip etmek hem zaman alıcı hem de hataya açık. İşte bu noktada Library Management System projesi doğdu.
🛠️ Çözüm
Amacım, kütüphanenin tüm operasyonlarını ilişkisel veri tabanı üzerinden yönetmekti. Bunun için:
- Authors, Publishers, Categories, Books, Members, Loans, Reservations, Fines tablolarını tasarladım.
- Her tabloyu foreign key ilişkileriyle birbirine bağladım, böylece veri bütünlüğü sağladım.
- Gerçek yazarlar, yayınevleri ve kitaplardan oluşan bir veri seti ekledim, projeyi daha gerçekçi hale getirdim.
⚙️ İş Mantığı
Sadece tablolar değil, aynı zamanda iş mantığını da SQL fonksiyonlarıyla kodladım:
- calculate_fine(p_loan_id) → Gecikme gününe göre otomatik ceza hesaplar.
- book_availability(p_book_id) → Kitabın mevcut kopya sayısını kontrol eder.
- member_borrowed_count(p_member_id) → Bir üyenin toplam kaç kitap ödünç aldığını döner.
📊 Sonuç
Bu proje, veri tabanı tasarımı, SQL sorguları ve iş mantığı fonksiyonlarını gerçek bir senaryoya uygulama becerimi gösteriyor.
Kütüphane yönetim sistemi, sadece bir okul projesi değil; aynı zamanda gerçek dünyada kullanılabilecek bir çözümün prototipi.

🇬🇧 English Version
🎯 Project Story
Imagine a library: hundreds of books on the shelves, new members joining every day, loans and returns, reservation requests, and sometimes fines due to late returns…
Tracking all this data manually is time-consuming and error-prone. That’s where the Library Management System project was born.
🛠️ Solution
My goal was to manage all library operations through a relational database. To achieve this:
- I designed tables for Authors, Publishers, Categories, Books, Members, Loans, Reservations, Fines.
- Connected them with foreign keys to ensure data integrity.
- Populated the system with real-world data (authors, publishers, books) to make it more realistic.
⚙️ Business Logic
Beyond tables, I implemented business logic with SQL functions:
- calculate_fine(p_loan_id) → Automatically calculates fines based on overdue days.
- book_availability(p_book_id) → Checks the number of available copies of a book.
- member_borrowed_count(p_member_id) → Returns the total number of books borrowed by a member.
📊 Outcome
This project demonstrates my ability to apply database design, SQL queries, and business logic functions to a real-world scenario.
The library management system is not just a school project; it is a prototype of a solution that could be used in practice.
