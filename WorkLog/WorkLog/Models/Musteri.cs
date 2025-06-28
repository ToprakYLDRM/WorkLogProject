using System.ComponentModel.DataAnnotations;

namespace WorkLog.Models
{
    public class Musteri
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Müşteri adı gereklidir.")]
        [StringLength(100)]
        public string Ad { get; set; }
    }
}
