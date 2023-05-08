using System;
using System.Collections.Generic;

namespace Shoplinhkien.Models;

public partial class LoaiTin
{
    public int LoaitinId { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<TblTinTuc> TblTinTucs { get; set; } = new List<TblTinTuc>();
}
