namespace EmployeeApi.Models.Dtos
{
    public record AddEmployee(string Name, string Email, int DepartmentId, string Position, decimal Salary, DateTime HireDate);
    public record EditEmployee(int Id, string Name, string Email, int DepartmentId, string Position, decimal Salary, DateTime HireDate);
}
