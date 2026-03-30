import SwiftUI

class FavoritesViewModel: ObservableObject {
    @Published var cities = ["New York", "London", "Tokyo"]
    @Published var hobbies = ["Reading", "Gaming", "Cooking"]
    @Published var books = [
        Book(title: "1984", author: "George Orwell"),
        Book(title: "The Hobbit", author: "J.R.R. Tolkien"),
        Book(title: "To Kill a Mockingbird", author: "Harper Lee")
    ]

    @Published var favoriteCities: Set<String> = []
    @Published var favoriteHobbies: Set<String> = []
    @Published var favoriteBooks: Set<Book> = []

    func toggleCity(_ city: String) {
        if favoriteCities.contains(city) {
            favoriteCities.remove(city)
        } else {
            favoriteCities.insert(city)
        }
    }

    func toggleHobby(_ hobby: String) {
        if favoriteHobbies.contains(hobby) {
            favoriteHobbies.remove(hobby)
        } else {
            favoriteHobbies.insert(hobby)
        }
    }

    func toggleBook(_ book: Book) {
        if favoriteBooks.contains(book) {
            favoriteBooks.remove(book)
        } else {
            favoriteBooks.insert(book)
        }
    }
}
