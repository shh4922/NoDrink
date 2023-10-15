import Foundation

struct DataModel : Codable, Equatable {
    var id = UUID().uuidString
    var startDay : Date
    var startDrinkDay : Date
    var userdMoney : Int32
    
}
