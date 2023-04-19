using System;
using System.Collections.Generic;

namespace Shoplinhkien.Models;

public partial class Category
{
    public int CatId { get; set; }

    public string? CatName { get; set; }

    public string? Description { get; set; }

    public int? ParentId { get; set; }

    public int? Levels { get; set; }

    public int? Ordering { get; set; }

    public bool? Published { get; set; }

    public string? Thumb { get; set; }

    public string? Title { get; set; }

    public string? Alias { get; set; }

    public string? MetaDesc { get; set; }

    public string? Metakey { get; set; }

    public string? Cover { get; set; }

    public string? SchemaMarkup { get; set; }

    public int? PdGroupId { get; set; }

    public string? Creator { get; set; }

    public string? UpdateBy { get; set; }

    public virtual PdGroup? PdGroup { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
