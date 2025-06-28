📘 WorkLog Projesi Teknik Dökümantasyonu
🔍 Proje Hakkında
WorkLog, .NET 9 ve C# 13 ile geliştirilmiş, Razor Pages tabanlı bir iş kayıt ve takip uygulamasıdır. Uygulama; kullanıcıların, firmada tamamladıkları işleri sisteme kaydedebileceği, bu kayıtları düzenleyebileceği ve yönetebileceği şekilde tasarlanmıştır.

Kullanıcılar; müşteri, kategori ve kullanıcı bazlı iş kayıtları oluşturabilir, güncelleyebilir, silebilir ve arama yapabilir.

🎯 Temel Özellikler
İş Kaydı Yönetimi:
Başlık, açıklama, müşteri, kategori, kullanıcı, süre ve tarih gibi alanlarla tamamlanmış işlerin sisteme kaydedilmesi ve düzenlenmesi.

Müşteri, Kullanıcı ve Kategori Yönetimi:
CRUD işlemleri (ekleme, düzenleme, silme) ile sistemdeki müşteri, kullanıcı ve kategori verilerinin yönetimi.

Arama Özelliği:
Girilmiş iş kayıtları arasında başlık, müşteri, tarih vb. kriterlere göre filtreleme ve arama yapılabilir.

Validasyon:
Formlarda alan doğrulama ve kullanıcıya anlamlı hata mesajları gösterimi.

Kısmi Görünümler (Partial Views):
Tekrarlayan form bileşenleri _FormPartial.cshtml dosyasında tanımlanarak daha modüler bir yapı sağlanmıştır.

📁 Proje Yapısı
Controllers:
İş mantığını ve veri yönetimini sağlar. (Örnek: IsKayitlariController.cs)

Models:
Veri modelleri içerir. (Örnek: IsKaydi, Musteri, Kategori, Kullanici)

Views:
Razor Pages yapısıyla oluşturulmuş kullanıcı arayüzleri. Alt klasörlerde iş kayıtları, kategoriler, kullanıcılar ve müşterilere ait sayfalar yer alır.

Views/Shared:
Layout ve kısmi görünümlerin bulunduğu ortak klasördür.

🗂️ Önemli Dosyalar
WorkLog/Views/IsKayitlari/_FormPartial.cshtml
İş kaydı oluşturma ve düzenleme formlarında kullanılan kısmi görünüm.

WorkLog/Controllers/IsKayitlariController.cs
İş kaydı işlemlerinin (listeleme, oluşturma, düzenleme, silme) kontrol edildiği controller dosyası.

WorkLog/Views/Shared/_Layout.cshtml
Tüm sayfalarda ortak kullanılan genel layout tasarımı.

🧰 Kullanılan Teknolojiler
.NET 9

C# 13

Razor Pages

Entity Framework

CSS

Bootstrap

⚙️ Kurulum ve Çalıştırma

Projeyi çalıştırmadan önce **appsettings.json** dosyasında yer alan ConnectionString değerini kendi veritabanı ortamınıza göre güncelleyin.

Proje içerisinde size hazır olarak sunulmuş bir .sql dosyası bulunmaktadır. Bu dosyayı kullanarak mevcut bir veritabanına direkt olarak kurulum yapabilirsiniz.

Yeni bir veritabanı oluşturmak istiyorsanız, appsettings.json içindeki ConnectionString değerinde yer alan Database adını değiştirmeniz yeterlidir. Ardından Entity Framework ile yeni veritabanı şemasını oluşturmak için migration işlemi gerçekleştirmeniz gerekecektir.

Migration işlemi için terminalde proje dizininde olduğunuzdan emin olun ve aşağıdaki komutları sırasıyla çalıştırın:


dotnet ef migrations add InitialCreate
dotnet ef database update

Son olarak projeyi başlatmak için aşağıdaki komutları kullanabilirsiniz:

dotnet build
dotnet run

























