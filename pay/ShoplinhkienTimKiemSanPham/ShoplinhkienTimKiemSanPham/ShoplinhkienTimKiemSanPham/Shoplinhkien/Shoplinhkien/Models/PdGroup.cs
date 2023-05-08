using System;
using System.Collections.Generic;

namespace Shoplinhkien.Models;

public partial class PdGroup
{
    public int PdGroupId { get; set; }

    public string? NamePdGroup { get; set; }

    public virtual ICollection<Category> Categories { get; set; } = new List<Category>();
}
