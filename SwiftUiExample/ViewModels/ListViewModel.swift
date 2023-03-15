import Foundation

class ListViewModel: ObservableObject{
    @Published var items:[ItemModel] = []{
        didSet{
            saveItems() // item degistiginde calisacak
        }
    }
    
    init(){
        getItems()
    }
    
   func getItems(){
       guard let data = UserDefaults.standard.data(forKey: "todo_items"),
             let savedItem = try? JSONDecoder().decode([ItemModel].self, from:data)
       else {
           return
       }

       
       self.items = savedItem
    }
    
    func onDelete(index:IndexSet){
        items.remove(atOffsets: index)
    }
    
    func onMove(from:IndexSet,to:Int){
        items.move(fromOffsets:from,toOffset:to)
    }
    
    func addNewItem(itemText:String){
        let newItem =  ItemModel(title: itemText, isCompleted: false)
        items.append(newItem)
    }
    
    func changeStatus(item:ItemModel){
        if let updatedItemIndex = items.firstIndex(where: {$0.id == item.id}){
            items[updatedItemIndex] = ItemModel(title:item.title,isCompleted: !item.isCompleted)
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: "todo_items")
        }
    }
}
