require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.include?(title) ? true : false
    end

    def >(other_startup)
        self.funding > other_startup.funding ? true : false
    end
    
    def hire(name, title)
        if !valid_title?(title)
            raise 'Title is not valid'
        else
            employee = Employee.new(name, title)
            @employees << employee
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        amt = @salaries[employee.title]
        if @funding  > amt
            employee.pay(amt)
            @funding -= amt
        else
            raise 'funding is not enough'
        end
    end

    def payday
        @employees.map {|employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each {|employee| sum += employee.pay(@salaries[employee.title])}
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        @salaries = other_startup.salaries.merge(@salaries)
        other_startup.employees.each {|employee| @employees << employee}
        other_startup.close
    end
end
