class Instructor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def tests
        BoatingTest.all.select do |test|
            test.instructor == self
        end
    end

    def passed_students
        passed = []
        self.tests.select do |test|
            if test.status == "passed"
                passed << test.student
            end
        end
        passed
    end

    def pass_student(student, test_name)
        new_test = nil
        BoatingTest.all.each do |test| 
            if test.student == student && test.name == test_name
                test.status = "passed"
                new_test = test
            else
                new_test = BoatingTest.new(student, self, test_name, "passed")
            end
        end
        new_test
    end

    def fail_student(student, test_name)
        new_test = nil
        BoatingTest.all.each do |test| 
            if test.student == student && test.name == test_name
                test.status = "failed"
                new_test = test
            else
                new_test = BoatingTest.new(student, self, test_name, "failed")
            end
        end
        new_test
    end

    def all_students
        students = []
        BoatingTest.all.each do |test|
            if test.instructor == self
                students << test.student
            end
        end
        students.uniq
    end

end
