import SwiftUI

@main
struct SwiftUiExampleApp: App {
    let persistenceController = PersistenceController.shared
    
   @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
