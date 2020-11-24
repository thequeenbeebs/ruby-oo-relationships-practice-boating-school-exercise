class Student
    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(name, status, instructor)
        BoatingTest.new(self, instructor, name, status)
    end

    def all_instructors
        instructors = []
        BoatingTest.all.each do |test|
            if test.student == self
                instructors << test.instructor
            end
        end
        instructors
    end

    def self.find_student(first_name)
        self.all.find do |student|
            student.first_name == first_name
        end
    end

    def grade_percentage
        passed = BoatingTest.all.select {|test| test.student == self && test.status == "passed"}
        all = BoatingTest.all.select {|test| test.student == self}
        (passed.length.to_f/all.length.to_f) * 100
    end

end
