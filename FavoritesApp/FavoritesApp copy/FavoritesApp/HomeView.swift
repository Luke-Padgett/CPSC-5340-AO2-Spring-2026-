import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Cities")) {
                    ForEach(viewModel.cities, id: \.self) { city in
                        HStack {
                            Text(city)
                            Spacer()
                            Button {
                                viewModel.toggleCity(city)
                            } label: {
                                Image(systemName: viewModel.favoriteCities.contains(city) ? "heart.fill" : "heart")
                            }
                        }
                    }
                }

                Section(header: Text("Hobbies")) {
                    ForEach(viewModel.hobbies, id: \.self) { hobby in
                        HStack {
                            Text(hobby)
                            Spacer()
                            Button {
                                viewModel.toggleHobby(hobby)
                            } label: {
                                Image(systemName: viewModel.favoriteHobbies.contains(hobby) ? "heart.fill" : "heart")
                            }
                        }
                    }
                }

                Section(header: Text("Books")) {
                    ForEach(viewModel.books) { book in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(book.title)
                                Text(book.author).font(.subheadline).foregroundColor(.gray)
                            }
                            Spacer()
                            Button {
                                viewModel.toggleBook(book)
                            } label: {
                                Image(systemName: viewModel.favoriteBooks.contains(book) ? "heart.fill" : "heart")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites App")
        }
    }
}

#Preview {
    HomeView().environmentObject(FavoritesViewModel())
}
