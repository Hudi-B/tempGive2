﻿using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace EmployeeApi.Models;

public partial class Department
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    [JsonIgnore]
    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();
}
