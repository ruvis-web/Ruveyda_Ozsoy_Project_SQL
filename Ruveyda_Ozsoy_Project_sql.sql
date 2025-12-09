DROP TABLE IF EXISTS "Fines" CASCADE;
DROP TABLE IF EXISTS "Reservations" CASCADE;
DROP TABLE IF EXISTS "Loans" CASCADE;
DROP TABLE IF EXISTS "Books" CASCADE;
DROP TABLE IF EXISTS "Members" CASCADE;
DROP TABLE IF EXISTS "Categories" CASCADE;
DROP TABLE IF EXISTS "Publishers" CASCADE;
DROP TABLE IF EXISTS "Authors" CASCADE;

-- TABLO TANIMLARI 
CREATE TABLE "Authors"(
    "id" SERIAL NOT NULL,
    "Name" TEXT NULL,
    "Surname" TEXT NULL
);
ALTER TABLE "Authors" ADD PRIMARY KEY("id");

CREATE TABLE "Publishers"(
    "id" SERIAL NOT NULL,
    "Publishers_name" TEXT NULL
);
ALTER TABLE "Publishers" ADD PRIMARY KEY("id");

CREATE TABLE "Categories"(
    "id" SERIAL NOT NULL,
    "name" TEXT NULL
);
ALTER TABLE "Categories" ADD PRIMARY KEY("id");

CREATE TABLE "Books"(
    "id" SERIAL NOT NULL,
    "title" TEXT NULL,
    "Category_id" INTEGER NOT NULL,
    "Publisher_id" INTEGER NOT NULL,
    "Author_id" INTEGER NOT NULL,
    "Total_Copies" INTEGER NOT NULL,
    "Available_Copies" INTEGER NOT NULL
);
ALTER TABLE "Books" ADD PRIMARY KEY("id");

CREATE TABLE "Members"(
    "id" SERIAL NOT NULL,
    "First_Name" TEXT NULL,
    "Last_Name" TEXT NULL,
    "Join_Date" DATE NOT NULL
);
ALTER TABLE "Members" ADD PRIMARY KEY("id");

CREATE TABLE "Loans"(
    "id" SERIAL NOT NULL,
    "Book_Id" INTEGER NULL,
    "Member_Id" INTEGER NULL,
    "Loan_Date" DATE NULL,
    "Due_Date" DATE NULL,
    "Return_Date" DATE NULL
);
ALTER TABLE "Loans" ADD PRIMARY KEY("id");

CREATE TABLE "Reservations"(
    "id" SERIAL NOT NULL,
    "Book_Id" INTEGER NULL,
    "Member_Id" INTEGER NULL,
    "Reservation_Date" DATE NULL,
    "Fulfilled" BOOLEAN NOT NULL DEFAULT '0'
);
ALTER TABLE "Reservations" ADD PRIMARY KEY("id");

CREATE TABLE "Fines"(
    "id" SERIAL NOT NULL,
    "Loan_Id" INTEGER NULL,
    "Member_Id" INTEGER NULL,
    "Amount" INTEGER NULL,
    "Created_At" TIMESTAMP(0) WITHOUT TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    "Paid" BOOLEAN NOT NULL DEFAULT '0'
);
ALTER TABLE "Fines" ADD PRIMARY KEY("id");

-- Foreign keys 
ALTER TABLE "Books" ADD CONSTRAINT "books_author_id_foreign" FOREIGN KEY("Author_id") REFERENCES "Authors"("id");
ALTER TABLE "Books" ADD CONSTRAINT "books_category_id_foreign" FOREIGN KEY("Category_id") REFERENCES "Categories"("id");
ALTER TABLE "Fines" ADD CONSTRAINT "fines_member_id_foreign" FOREIGN KEY("Member_Id") REFERENCES "Members"("id");
ALTER TABLE "Books" ADD CONSTRAINT "books_publisher_id_foreign" FOREIGN KEY("Publisher_id") REFERENCES "Publishers"("id");
ALTER TABLE "Reservations" ADD CONSTRAINT "reservations_member_id_foreign" FOREIGN KEY("Member_Id") REFERENCES "Members"("id");
ALTER TABLE "Loans" ADD CONSTRAINT "loans_book_id_foreign" FOREIGN KEY("Book_Id") REFERENCES "Books"("id");
ALTER TABLE "Loans" ADD CONSTRAINT "loans_member_id_foreign" FOREIGN KEY("Member_Id") REFERENCES "Members"("id");
ALTER TABLE "Reservations" ADD CONSTRAINT "reservations_book_id_foreign" FOREIGN KEY("Book_Id") REFERENCES "Books"("id");
ALTER TABLE "Fines" ADD CONSTRAINT "fines_loan_id_foreign" FOREIGN KEY("Loan_Id") REFERENCES "Loans"("id");

-- AUTHORS 
INSERT INTO "Authors" ("Name", "Surname") VALUES
('Ahmet', 'Ümit'),
('Sabahattin', 'Ali'),
('John', 'Steinbeck'),
('George', 'Orwell'),
('Fyodor', 'Dostoyevski'),
('Victor', 'Hugo'),
('Paulo', 'Coelho'),
('J.K.', 'Rowling'),
('Stefan', 'Zweig'),
('Orhan', 'Pamuk');

-- PUBLISHERS 
INSERT INTO "Publishers" ("Publishers_name") VALUES
('Can Yayınları'),
('YKY'),
('İş Bankası Kültür'),
('Penguin Books'),
('Alfa Yayınları'),
('Everest Yayınları'),
('Domingo'),
('Timaş Yayınları'),
('Altın Kitaplar'),
('Dokuz Yayınları');

-- CATEGORIES 
INSERT INTO "Categories" ("name") VALUES
('Roman'),
('Tarih'),
('Psikoloji'),
('Bilim Kurgu'),
('Kişisel Gelişim'),
('Felsefe'),
('Macera'),
('Polisiye'),
('Klasik'),
('Çocuk');

-- BOOKS 
INSERT INTO "Books" ("title","Category_id","Publisher_id","Author_id","Total_Copies","Available_Copies") VALUES
('Kürk Mantolu Madonna',1,1,2,8,8),
('Tutunamayanlar',1,2,10,5,4),
('Simyacı',5,7,7,12,9),
('Beyaz Diş',7,4,3,6,5),
('1984',4,4,4,10,8),
('Cesur Yeni Dünya',4,4,4,4,2),
('Suç ve Ceza',9,9,5,7,6),
('Sefiller',9,3,6,9,9),
('Harry Potter ve Felsefe Taşı',10,9,8,15,14),
('Şeker Portakalı',1,10,9,11,10),
('Satranç',3,10,9,9,8),
('Benim Adım Kırmızı',9,6,10,14,13),
('Masumiyet Müzesi',9,1,10,13,11),
('Hayvan Çiftliği',4,4,4,10,9),
('İnce Memed',1,5,1,8,7);

-- MEMBERS 
INSERT INTO "Members" ("First_Name","Last_Name","Join_Date") VALUES
('Mehmet','Demir','2024-01-01'),
('Ayşe','Kaya','2024-02-10'),
('Fatma','Çelik','2024-03-05'),
('Ali','Yılmaz','2024-03-20'),
('Zeynep','Koç','2024-04-15');

-- LOANS 
INSERT INTO "Loans" ("Book_Id","Member_Id","Loan_Date","Due_Date","Return_Date") VALUES
(1,1,'2025-01-03','2025-01-15',NULL),
(2,2,'2025-01-01','2025-01-10','2025-01-12'),
(3,3,'2025-01-05','2025-01-15',NULL),
(4,4,'2025-01-02','2025-01-20',NULL),
(5,5,'2025-01-04','2025-01-14','2025-01-30');

-- RESERVATIONS 
INSERT INTO "Reservations" ("Book_Id","Member_Id","Reservation_Date","Fulfilled") VALUES
(4,2,'2025-01-06',FALSE),
(9,1,'2025-01-10',TRUE),
(12,3,'2025-01-08',FALSE);

-- FINES 
INSERT INTO "Fines" ("Loan_Id","Member_Id","Amount","Paid") VALUES
(5,5,25,TRUE),
(2,2,12,FALSE);

-- AUTHORS 
INSERT INTO "Authors" ("Name","Surname") VALUES
('Albert','Camus'),
('Franz','Kafka'),
('Lev','Tolstoy'),
('Herman','Hesse'),
('Haruki','Murakami'),
('Jean-Paul','Sartre'),
('Miguel','de Cervantes'),
('Jules','Verne'),
('Jack','London'),
('Dostoevsky','Ivanovich');

-- PUBLISHERS
INSERT INTO "Publishers" ("Publishers_name") VALUES
('Martı Yayınları'),
('Kronik Kitap'),
('Metis Yayınları'),
('İthaki Yayınları'),
('Epsilon'),
('Kolektif Kitap'),
('Mundi'),
('Karakarga'),
('Kapı Yayınları'),
('Canopus Press');

-- CATEGORIES
INSERT INTO "Categories" ("name") VALUES
('Biyografi'),
('Deneme'),
('Şiir'),
('Dram'),
('Fantastik Kurgu'),
('Öykü'),
('Sanat'),
('Eğitim'),
('Ekonomi'),
('Sosyoloji');

-- BOOKS 
INSERT INTO "Books" ("title","Category_id","Publisher_id","Author_id","Total_Copies","Available_Copies") VALUES
('Yabancı',1,11,11,10,9),
('Dönüşüm',3,12,12,8,7),
('Anna Karenina',9,13,13,12,10),
('Bozkırkurdu',3,14,14,11,9),
('1Q84',4,15,15,14,12),
('Bulantı',6,16,16,9,8),
('Don Kişot',9,17,17,10,10),
('80 Günde Devri Alem',7,18,18,13,13),
('Martin Eden',1,19,19,9,8),
('Karamazov Kardeşler',9,20,20,10,9),
('Notre Dame’in Kamburu',9,3,6,10,8),
('Körlük',1,8,7,12,10),
('Kırmızı Pazartesi',1,2,7,10,8),
('Hayvanlardan Tanrılara Sapiens',8,13,4,18,18),
('Şeker Portakalı 2',1,10,9,10,10),
('Sitem',3,12,12,6,5),
('Gurur ve Önyargı',1,14,15,15,13),
('Kızıl',9,19,10,10,9),
('Kör Baykuş',6,11,11,9,9),
('Babil',5,18,6,8,7);

-- MEMBERS
INSERT INTO "Members" ("First_Name","Last_Name","Join_Date") VALUES
('Hasan','Uçar','2024-05-02'),
('Elif','Arslan','2024-05-12'),
('Murat','Şahin','2024-06-01'),
('Derya','Kurt','2024-06-11'),
('Okan','Baş','2024-06-22'),
('Esra','Er','2024-07-03'),
('Yunus','Karaca','2024-07-14'),
('Seda','Tuna','2024-07-28'),
('Oğuz','Bilir','2024-08-01'),
('Berk','Altun','2024-08-16'),
('Nisa','Güler','2024-09-09'),
('Kerem','Yıldız','2024-09-21'),
('Yaren','Kurtuluş','2024-10-03'),
('Melis','Öztürk','2024-10-17'),
('Tuna','Aslan','2024-10-29');

-- LOANS 
INSERT INTO "Loans" ("Book_Id","Member_Id","Loan_Date","Due_Date","Return_Date") VALUES
(10,6,'2025-01-12','2025-01-25',NULL),
(7,7,'2025-01-15','2025-01-26','2025-01-28'),
(14,8,'2025-01-09','2025-01-20','2025-01-19'),
(12,9,'2025-01-10','2025-01-24',NULL),
(4,10,'2025-01-05','2025-01-15','2025-01-30'),
(3,11,'2025-01-08','2025-01-20',NULL),
(1,12,'2025-01-04','2025-01-14','2025-01-18'),
(18,13,'2025-01-19','2025-01-29',NULL),
(22,14,'2025-01-07','2025-01-19','2025-01-25'),
(25,15,'2025-01-06','2025-01-16',NULL),
(30,16,'2025-01-12','2025-01-22','2025-01-29'),
(17,17,'2025-01-14','2025-01-24',NULL),
(32,18,'2025-01-11','2025-01-23','2025-02-01'),
(29,19,'2025-01-03','2025-01-17',NULL),
(33,20,'2025-01-10','2025-01-22','2025-01-27');

-- RESERVATIONS
INSERT INTO "Reservations" ("Book_Id","Member_Id","Reservation_Date","Fulfilled") VALUES
(2,6,'2025-01-12',FALSE),
(3,7,'2025-01-13',TRUE),
(7,8,'2025-01-15',FALSE),
(10,9,'2025-01-18',TRUE),
(15,10,'2025-01-21',FALSE),
(20,11,'2025-01-25',TRUE),
(27,12,'2025-01-02',FALSE),
(30,13,'2025-01-08',FALSE),
(35,14,'2025-01-11',TRUE),
(17,15,'2025-01-04',FALSE);

-- FINES 
INSERT INTO "Fines" ("Loan_Id","Member_Id","Amount","Paid") VALUES
(6,6,15,TRUE),
(7,7,10,FALSE),
(9,9,20,TRUE),
(10,10,30,FALSE),
(11,11,18,TRUE),
(12,12,22,FALSE),
(14,14,25,FALSE),
(15,15,16,TRUE),
(17,17,12,FALSE),
(18,18,40,TRUE);

--  FONKSİYONLAR
--    (calculate_fine, book_availability, member_borrowed_count)
-- calculate_fine(p_loan_id) -> gecikme başına 2.50 birim
CREATE OR REPLACE FUNCTION calculate_fine(p_loan_id INTEGER)
RETURNS NUMERIC(8,2) AS $$
DECLARE
  v_due DATE;
  v_return DATE;
  v_days INTEGER;
  v_amount NUMERIC(8,2);
BEGIN
  SELECT "Due_Date", "Return_Date" INTO v_due, v_return FROM "Loans" WHERE "id" = p_loan_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Loan id % bulunamadı', p_loan_id;
  END IF;

  IF v_return IS NULL THEN
    v_return := CURRENT_DATE;
  END IF;

  v_days := GREATEST(0, (v_return - v_due));
  v_amount := v_days * 2.50;
  RETURN ROUND(v_amount::NUMERIC,2);
END;
$$ LANGUAGE plpgsql;

-- book_availability(p_book_id) -> 'AVAILABLE: x of y' / 'UNAVAILABLE'
CREATE OR REPLACE FUNCTION book_availability(p_book_id INTEGER)
RETURNS TEXT AS $$
DECLARE
  v_avail INTEGER;
  v_total INTEGER;
BEGIN
  SELECT "Available_Copies", "Total_Copies" INTO v_avail, v_total FROM "Books" WHERE "id" = p_book_id;
  IF NOT FOUND THEN
    RETURN 'BOOK_NOT_FOUND';
  END IF;

  IF v_avail > 0 THEN
    RETURN format('AVAILABLE: %s of %s', v_avail, v_total);
  ELSE
    RETURN format('UNAVAILABLE: 0 of %s', v_total);
  END IF;
END;
$$ LANGUAGE plpgsql;

-- member_borrowed_count(p_member_id) -> açık ödünç (Return_Date IS NULL)
CREATE OR REPLACE FUNCTION member_borrowed_count(p_member_id INTEGER)
RETURNS INTEGER AS $$
DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM "Loans" WHERE "Member_Id" = p_member_id AND "Return_Date" IS NULL;
  RETURN COALESCE(v_count,0);
END;
$$ LANGUAGE plpgsql;

-- TRIGGERLAR
-- A) BEFORE INSERT ON "Loans": stok kontrol ve azaltma
CREATE OR REPLACE FUNCTION trg_decrease_stock_on_borrow()
RETURNS TRIGGER AS $$
BEGIN
  -- mevcut stok kontrolü
  IF (SELECT "Available_Copies" FROM "Books" WHERE "id" = NEW."Book_Id") <= 0 THEN
    RAISE EXCEPTION 'Kitap id=% için müsait kopya yok.', NEW."Book_Id";
  END IF;

  UPDATE "Books" SET "Available_Copies" = "Available_Copies" - 1 WHERE "id" = NEW."Book_Id";
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_decrease_stock
BEFORE INSERT ON "Loans"
FOR EACH ROW
EXECUTE FUNCTION trg_decrease_stock_on_borrow();

-- B) AFTER UPDATE ON "Loans": return_date set edildiğinde ceza oluşturma
CREATE OR REPLACE FUNCTION trg_create_fine_on_return()
RETURNS TRIGGER AS $$
DECLARE
  v_fine NUMERIC(8,2);
BEGIN
  IF TG_OP = 'UPDATE' AND NEW."Return_Date" IS NOT NULL AND OLD."Return_Date" IS NULL THEN
    v_fine := calculate_fine(NEW."id");
    IF v_fine > 0 THEN
      -- eğer daha önce eklenmemişse
      IF NOT EXISTS (SELECT 1 FROM "Fines" WHERE "Loan_Id" = NEW."id") THEN
        INSERT INTO "Fines"("Loan_Id","Member_Id","Amount") VALUES (NEW."id", NEW."Member_Id", v_fine);
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_create_fine
AFTER UPDATE ON "Loans"
FOR EACH ROW
WHEN (OLD."Return_Date" IS NULL AND NEW."Return_Date" IS NOT NULL)
EXECUTE FUNCTION trg_create_fine_on_return();

-- C) AFTER UPDATE ON "Loans": return_date set edildiğinde stok artırma
CREATE OR REPLACE FUNCTION trg_increase_stock_on_return()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' AND NEW."Return_Date" IS NOT NULL AND OLD."Return_Date" IS NULL THEN
    UPDATE "Books" SET "Available_Copies" = "Available_Copies" + 1 WHERE "id" = NEW."Book_Id";
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_increase_stock
AFTER UPDATE ON "Loans"
FOR EACH ROW
WHEN (OLD."Return_Date" IS NULL AND NEW."Return_Date" IS NOT NULL)
EXECUTE FUNCTION trg_increase_stock_on_return();


-- STORED PROCEDURE'LER
CREATE OR REPLACE PROCEDURE sp_borrow_book(p_member_id INTEGER, p_book_id INTEGER, p_days INTEGER DEFAULT 14)
LANGUAGE plpgsql
AS $$
DECLARE
  v_open_loans INTEGER;
BEGIN
  -- üyenin açık ödünç sayısı limit 5
  SELECT COUNT(*) INTO v_open_loans FROM "Loans" WHERE "Member_Id" = p_member_id AND "Return_Date" IS NULL;
  IF v_open_loans >= 5 THEN
    RAISE EXCEPTION 'Üye % zaten maksimum açık ödünç sayısına (% ) ulaşmış.', p_member_id, v_open_loans;
  END IF;

  -- stok kontrol (ön kontrol, trigger da kontrol eder)
  IF (SELECT "Available_Copies" FROM "Books" WHERE "id" = p_book_id) <= 0 THEN
    RAISE EXCEPTION 'Kitap % için stok yok.', p_book_id;
  END IF;

  INSERT INTO "Loans"("Book_Id","Member_Id","Loan_Date","Due_Date")
  VALUES (p_book_id, p_member_id, CURRENT_DATE, (CURRENT_DATE + (p_days || ' days')::INTERVAL)::DATE);

  RAISE NOTICE 'Kitap % üye % için ödünç verildi (son teslim: %).', p_book_id, p_member_id, (CURRENT_DATE + (p_days || ' days')::INTERVAL)::DATE;
END;
$$;

CREATE OR REPLACE PROCEDURE sp_return_book(p_loan_id INTEGER, p_return_date DATE DEFAULT CURRENT_DATE)
LANGUAGE plpgsql
AS $$
DECLARE
  v_exists INTEGER;
  v_updated INTEGER;
BEGIN
  SELECT 1 INTO v_exists FROM "Loans" WHERE "id" = p_loan_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Loan % bulunamadı', p_loan_id;
  END IF;

  UPDATE "Loans" SET "Return_Date" = p_return_date WHERE "id" = p_loan_id AND "Return_Date" IS NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;

  IF v_updated = 0 THEN
    RAISE NOTICE 'Loan % için zaten iade kaydı mevcut.', p_loan_id;
  ELSE
    RAISE NOTICE 'Loan % için iade kaydedildi: %', p_loan_id, p_return_date;
  END IF;
END;
$$;

-- VIEW'LER
CREATE OR REPLACE VIEW vw_most_borrowed_books AS
SELECT b."id" AS book_id, b."title", a."Name" || ' ' || a."Surname" AS author,
       COUNT(l."id") AS borrow_count
FROM "Books" b
LEFT JOIN "Loans" l ON b."id" = l."Book_Id"
LEFT JOIN "Authors" a ON b."Author_id" = a."id"
GROUP BY b."id", b."title", author
ORDER BY borrow_count DESC;

CREATE OR REPLACE VIEW vw_member_statistics AS
SELECT m."id" AS member_id, m."First_Name" || ' ' || m."Last_Name" AS member_name,
       COUNT(l."id") FILTER (WHERE l."Return_Date" IS NULL) AS currently_borrowed,
       COUNT(l."id") AS total_borrows,
       COUNT(f."id") AS total_fines,
       COALESCE(SUM(f."Amount"),0) AS total_fine_amount
FROM "Members" m
LEFT JOIN "Loans" l ON m."id" = l."Member_Id"
LEFT JOIN "Fines" f ON l."id" = f."Loan_Id"
GROUP BY m."id", member_name
ORDER BY total_borrows DESC;

-- SORGULAR 
-- 1. Kategorilere göre kitap sayıları ve ödünç alınma oranları
-- borrow_rate = total_loans / total_books
SELECT c."id" AS category_id, c."name" AS category,
       COUNT(b."id") AS total_books,
       COUNT(l."id") AS total_loans,
       CASE WHEN COUNT(b."id") = 0 THEN 0 ELSE ROUND((COUNT(l."id")::NUMERIC / COUNT(b."id"))::NUMERIC,3) END AS borrow_rate
FROM "Categories" c
LEFT JOIN "Books" b ON c."id" = b."Category_id"
LEFT JOIN "Loans" l ON b."id" = l."Book_Id"
GROUP BY c."id", c."name"
ORDER BY total_loans DESC;

-- 2. Yazarlara göre toplam ödünç alınma sayıları
SELECT a."id" AS author_id, a."Name" || ' ' || a."Surname" AS author,
       COUNT(l."id") AS total_borrows
FROM "Authors" a
LEFT JOIN "Books" b ON a."id" = b."Author_id"
LEFT JOIN "Loans" l ON b."id" = l."Book_Id"
GROUP BY a."id", author
ORDER BY total_borrows DESC;

-- 3. Subquery ile: Ortalamadan fazla gecikmesi olan üyeler
-- gecikme gün sayısı = GREATEST(0, Return_Date - Due_Date)
WITH delays AS (
  SELECT "Member_Id", GREATEST(0, ("Return_Date" - "Due_Date"))::INTEGER AS days_delayed
  FROM "Loans"
  WHERE "Return_Date" IS NOT NULL
)
SELECT m."id", m."First_Name" || ' ' || m."Last_Name" AS member_name, AVG(d.days_delayed)::NUMERIC(10,2) AS avg_delay
FROM "Members" m
JOIN delays d ON m."id" = d."Member_Id"
GROUP BY m."id", member_name
HAVING AVG(d.days_delayed) > (
  SELECT AVG(GREATEST(0, ("Return_Date" - "Due_Date"))) FROM "Loans" WHERE "Return_Date" IS NOT NULL
);

-- Fonksiyon testleri
SELECT calculate_fine(1) AS fine_loan_1;
SELECT calculate_fine(2) AS fine_loan_2;
SELECT book_availability(8) AS book8_avail;
SELECT member_borrowed_count(1) AS member1_open_loans;

