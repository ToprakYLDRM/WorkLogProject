using System.ComponentModel.DataAnnotations;

namespace WorkLog.Models
{
    public class Kullanici
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Kullanıcı adı zorunludur.")]
        [StringLength(100)]
        public string Ad { get; set; }
    }
}
