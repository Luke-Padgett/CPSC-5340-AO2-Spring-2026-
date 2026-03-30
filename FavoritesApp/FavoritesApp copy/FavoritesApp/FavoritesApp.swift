import SwiftUI

@main
struct FavoritesApp: App {
    @StateObject var viewModel = FavoritesViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
            }
            .environmentObject(viewModel)
        }
    }
}
