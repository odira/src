import Foundation
import SwiftUI

var persons: [Person] = loadPersons()

func loadPersons() -> [Person] {
    @ObservedObject var model: Model = Model()
    return model.persons
}
