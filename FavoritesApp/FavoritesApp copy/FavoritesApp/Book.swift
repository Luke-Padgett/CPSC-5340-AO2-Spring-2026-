	import Foundation

struct Book: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let author: String
}
