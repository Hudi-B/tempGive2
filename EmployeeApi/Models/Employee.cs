using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace EmployeeApi.Models;

public partial class Employee
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Email { get; set; } = null!;

    public int DepartmentId { get; set; }

    public string Position { get; set; } = null!;

    public decimal Salary { get; set; }

    public DateTime HireDate { get; set; }

    public DateTime EditDate { get; set; }

    public virtual Department Department { get; set; } = null!;
}
