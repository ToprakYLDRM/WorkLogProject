
using System.ComponentModel.DataAnnotations;

namespace WorkLog.Models
{
    public class Ticket
    {
        public int Id { get; set; }

        [Required]
        public string Baslik { get; set; }

        [Required]
        public string Aciklama { get; set; }

        [Required]
        public string Musteri { get; set; }

        [Required]
        public string Kategori { get; set; }

        [Required]
        public string Kullanici { get; set; }

        [Range(1, 1000)]
        public int Sure { get; set; }

        [DataType(DataType.Date)]
        public DateTime Tarih { get; set; }
    }
}
