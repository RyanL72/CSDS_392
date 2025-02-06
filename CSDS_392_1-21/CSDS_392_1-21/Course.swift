//
//  Course.swift
//  CSDS_392_1-21
//
//  Created by Ryan Lin on 2/5/25.
//


import Foundation
class Course {
    
    // Immutable
    let name:String
    let credits:Int
    
    //Mutable
    var averageGrade:Double?
    var instructor:String?
    var students = [Student]()
    
    //Constructors
    init(name: String, credits: Int) {
        self.name = name
        self.credits = credits
    }
    init(name: String, credits: Int, instructor: String?) {
        self.name = name
        self.credits = credits
        self.instructor = instructor
    }
    
    //Functions
    public func setGrade(grade:Int) {
        //Type cast
        if grade is Int {
            self.averageGrade = Double(grade)
        }
        //Try to type case or else it will throw an error
        let grade = grade as! Double
    }
    public func addStudent(_ student: Student) {
        students.append(student)
    }
    public func doSomething() {
        let me = Student(firstName: "B", lastName:"K")
        self.addStudent(me)
    }
}

class Student {
    let firstName: String
    let lastName:String
    var age:Int?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func setAge(age:Int) {
        self.age = age
    }
    
}
