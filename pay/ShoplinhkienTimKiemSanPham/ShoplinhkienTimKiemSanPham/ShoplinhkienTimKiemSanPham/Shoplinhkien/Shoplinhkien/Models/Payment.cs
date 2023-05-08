using System;
using System.Collections.Generic;

namespace Shoplinhkien.Models;

public partial class Payment
{
    public int PaymentId { get; set; }

    public string? PaymentName { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
