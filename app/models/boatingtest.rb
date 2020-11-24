class BoatingTest
    attr_accessor :student, :instructor, :name, :status

    @@all = []

    def initialize(student, instructor, name, status)
        @student = student
        @instructor = instructor
        @name = name
        @status = status
        self.class.all << self
    end

    def self.all
        @@all
    end

end
