using EmployeeApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using EmployeeApi.Models.Dtos;

namespace EmployeeApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : Controller
    {
        private readonly RosterContext _context;
        public EmployeeController(RosterContext context)
        {
            _context = context;
        }

        [HttpGet("GetAllEmployees")]
        public async Task<IActionResult> GetAllEmployees()
        {
            try
            {
                var employees = await _context.Employees
                                                    .Include(x => x.Department)
                                                    .ToListAsync();
                return Ok(employees);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        [HttpGet("GetEmployeeById")]
        public async Task<IActionResult> GetEmployeeById([FromHeader]int id)
        {
            try
            {
                var employee = await _context.Employees.Include(x => x.Department).FirstOrDefaultAsync(x => x.Id == id);

                if (employee == null) return NotFound("Employee with id not found.");

                return Ok(employee);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        [HttpGet("GetAllDepartments")]
        public async Task<IActionResult> GetAllDepartments()
        {
            try
            {
                var departments = await _context.Departments.ToListAsync();

                return Ok(departments);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        [HttpPost("AddEmployee")]
        public async Task<IActionResult> AddEmployee([FromBody]AddEmployee newEmployee)
        {
            try
            {
                Employee employee = new Employee
                {
                    Name = newEmployee.Name,
                    Email = newEmployee.Email,
                    DepartmentId = newEmployee.DepartmentId,
                    Position = newEmployee.Position,
                    Salary = newEmployee.Salary,
                    HireDate = newEmployee.HireDate,
                    EditDate = DateTime.Now,
                };

                _context.Employees.Add(employee);
                await _context.SaveChangesAsync();

                return Ok("Successfully added a new employee.");
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        [HttpPut("EditEmployeeById")]
        public async Task<IActionResult> EditEmployeeById([FromHeader]int id, [FromBody]EditEmployee editedEmployee)
        {
            try
            {
                var employee = await _context.Employees.FindAsync(id);

                if (employee == null) return NotFound("Employee with id not found.");

                if (employee.Id != editedEmployee.Id)
                {
                    var employeeWithNewId = await _context.Employees.FindAsync(editedEmployee.Id);

                    if (employeeWithNewId != null)
                    {
                        return BadRequest("The provided employee ID is already in use.");
                    }
                }

                employee.Name = editedEmployee.Name;
                employee.Email = editedEmployee.Email;
                employee.DepartmentId = editedEmployee.DepartmentId;
                employee.Position = editedEmployee.Position;
                employee.Salary = editedEmployee.Salary;
                employee.HireDate = editedEmployee.HireDate;
                employee.EditDate = DateTime.Now;

                await _context.SaveChangesAsync();

                return Ok("Successfully updated an employee.");
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        [HttpDelete("DeleteEmployeeById")]
        public async Task<IActionResult> DeleteEmployeeById([FromHeader]int id)
        {
            try
            {
                var employee = await _context.Employees.FindAsync(id);

                if (employee == null) return NotFound("Employee with id not found.");

                _context.Employees.Remove(employee);
                await _context.SaveChangesAsync();

                return Ok("Successfully deleted an employee.");
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }
    }
}
