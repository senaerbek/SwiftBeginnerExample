import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var textField: String = ""
    
    var body: some View {
        ScrollView{
            TextField("Type here...", text : $textField)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color.gray)
                .padding(.horizontal)
            Button(action: onSaveButtonPress,
                     label: {
                Text("Add")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.black)
                    .padding(.horizontal)
            })
        }
        .navigationTitle("Add new Item")
    }
    
    func onSaveButtonPress(){
        listViewModel.addNewItem(itemText: textField)
        presentationMode.wrappedValue.dismiss()
    }
    
    func onChangeStatusPress(){
       
    }

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
