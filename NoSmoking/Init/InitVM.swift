import Foundation

class InitVM : ObservableObject {
    
    @Published var startDrinkDay = Date()
    @Published var startDay = Date()
    
    @Published var money = ""
    @Published var count = ""
    @Published var Sig_avg = ""
    
    
    
    func isDisable() -> Bool {
        if count.isEmpty || money.isEmpty {
            return true
        }
        return false
    }
    
    func saveToCoreData(){

        let offsetComps = Calendar.current.dateComponents([.year,.month,.day], from: startDrinkDay , to: startDay)
        var resultMoney = 0
        if case let (y?, m?, d?) = (offsetComps.year, offsetComps.month, offsetComps.day) {
            resultMoney = (y * 365 + m * 30 + d) / 7 * Int(count)! * Int(money)!
            print("지금까지의 차액 \(resultMoney)")
        }
        
//        return
        let userData = DataModel(startDay: startDay, startDrinkDay: startDrinkDay, userdMoney: Int32(resultMoney))
        CoreDataManager.shared.insertUserData(userData)
    }
    
    
}
