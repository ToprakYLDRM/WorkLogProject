using System.ComponentModel.DataAnnotations;

namespace WorkLog.Models
{
    public class Kategori
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Kategori adı zorunludur.")]
        [StringLength(100)]
        public string Ad { get; set; }
    }
}
