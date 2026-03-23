
import SwiftUI

struct EmojiItem: Identifiable {
    let id = UUID()
    let emoji: String
    var count: Int
}

struct ContentView: View {

    @State private var emojis: [EmojiItem] = [
        EmojiItem(emoji: "🤣", count: 3),
        EmojiItem(emoji: "😜", count: -2),
        EmojiItem(emoji: "😀", count: 2),
        EmojiItem(emoji: "🤩", count: 1),
        EmojiItem(emoji: "😂", count: -1)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach($emojis) { $item in
                    HStack {
                        Text(item.emoji)
                            .font(.largeTitle)

                        Text("Counter: \(item.count)")
                            .foregroundColor(.red)
                            .padding(.leading, 8)

                        Spacer()

                        HStack(spacing: 12) {
                            Button(action: {
                                item.count += 1
                            }) {
                                Image(systemName: "plus")
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.red, lineWidth: 2)
                                    )
                            }

                            Button(action: {
                                item.count -= 1
                            }) {
                                Image(systemName: "minus")
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.red, lineWidth: 2)
                                    )
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Emoji Counter")
        }
    }
}
