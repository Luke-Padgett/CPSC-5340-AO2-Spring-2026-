import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel

    var body: some View {
        NavigationView {
            List {
                if !viewModel.favoriteCities.isEmpty {
                    Section(header: Text("Favorite Cities")) {
                        ForEach(Array(viewModel.favoriteCities), id: \.self) { city in
                            HStack {
                                Text(city)
                                Spacer()
                                Button {
                                    viewModel.toggleCity(city)
                                } label: {
                                    Image(systemName: "heart.fill")
                                }
                            }
                        }
                    }
                }

                if !viewModel.favoriteHobbies.isEmpty {
                    Section(header: Text("Favorite Hobbies")) {
                        ForEach(Array(viewModel.favoriteHobbies), id: \.self) { hobby in
                            HStack {
                                Text(hobby)
                                Spacer()
                                Button {
                                    viewModel.toggleHobby(hobby)
                                } label: {
                                    Image(systemName: "heart.fill")
                                }
                            }
                        }
                    }
                }

                if !viewModel.favoriteBooks.isEmpty {
                    Section(header: Text("Favorite Books")) {
                        ForEach(Array(viewModel.favoriteBooks), id: \.self) { book in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(book.title)
                                    Text(book.author).font(.subheadline).foregroundColor(.gray)
                                }
                                Spacer()
                                Button {
                                    viewModel.toggleBook(book)
                                } label: {
                                    Image(systemName: "heart.fill")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView().environmentObject(FavoritesViewModel())
}
