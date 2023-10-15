import Foundation
import CoreData

class CoreDataManager {
    static var shared : CoreDataManager = CoreDataManager()
    
    lazy var persistentContainer : NSPersistentContainer = {
       let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("UnKnown Error! \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var UserDataEntity: NSEntityDescription? {
        return  NSEntityDescription.entity(forEntityName: "UserData", in: context)
    }
    
    
    //save
    func saveToContext(){
        do{
            try context.save()
        }catch {
            print("CoreDataManager - saveToContext Error!!")
            print(error.localizedDescription)
        }
    }
    
    
    //insert
    func insertUserData(_ data : DataModel){
        print(data)
        if let entity = UserDataEntity {
            let managedObject = NSManagedObject(entity: entity, insertInto: context)
            managedObject.setValue(data.id, forKey: "id")
            managedObject.setValue(data.startDay, forKey: "startDay")
            managedObject.setValue(data.startDrinkDay, forKey: "startDrinkDay")
            managedObject.setValue(data.userdMoney, forKey: "usedMoney")
            saveToContext()
        }else{
            print("error!")
        }
    }
    
    //read
    func fetCoreData() -> [UserData] {
        do {
            let request = UserData.fetchRequest()
            let result = try context.fetch(request)
            return result
        }catch{
            print(error.localizedDescription)
        }
        return []
    }
    func getDataModel() -> DataModel{
        let fetchResults = fetCoreData()
        print(fetchResults)
        
        let dataModel = DataModel(startDay: fetchResults[0].startDay!, startDrinkDay: fetchResults[0].startDrinkDay!, userdMoney: fetchResults[0].usedMoney)
        return dataModel
    }
    
    func deleteUserData(){
        
    }
}
