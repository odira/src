import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let surname: String
    let name: String
    let middleName: String
    let birthday: String
    let imageName: String
    
}

struct PersonList {
    static let persons = [
        Person(surname: "Аверкин", name: "Анатолий", middleName: "Вячеславович",
               birthday: "25.10.1969",
               imageName: "Аверкин"),
        Person(surname: "Аверкин", name: "Вячеслав", middleName: "Анатольевич",
               birthday: "10.09.1995",
               imageName: "Аверкин2"),
        Person(surname: "Агапов", name: "Павел", middleName: "Николаевич",
               birthday: "23.10.1990",
               imageName: "Агапов"),
        Person(surname: "Акимов", name: "Алексей", middleName: "Николаевич",
               birthday: "20.11.1980",
               imageName: "Акимов"),
        Person(surname: "Алексеев", name: "Виктор", middleName: "Валерьевич",
               birthday: "26.06.1985",
               imageName: "Алексеев"),
    ]
}
