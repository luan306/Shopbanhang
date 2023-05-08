using System;
using System.Collections.Generic;

namespace Shoplinhkien.Models;

public partial class Shipper
{
    public int ShipperId { get; set; }

    public string? ShipperCompName { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
