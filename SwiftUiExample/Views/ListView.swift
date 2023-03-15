import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.changeStatus(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.onDelete)
            .onMove(perform: listViewModel.onMove)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todos")
        .navigationBarItems(
            leading:EditButton(),
            trailing: NavigationLink("ADD", destination: AddView())
        )

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
