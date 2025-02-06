using System;
using System.Collections.Generic;

namespace P20_Tran.Models
{
    public partial class Traveller
    {
        public int TravellerId { get; set; }
        public int? TouristId { get; set; }
        public int? BookingId { get; set; }
        public string Name { get; set; } = null!;
        public int Age { get; set; }
        public string Gender { get; set; } = null!;
        public string ContactNo { get; set; } = null!;

        public virtual Booking? Booking { get; set; }
        public virtual Tourist? Tourist { get; set; }
    }
}
