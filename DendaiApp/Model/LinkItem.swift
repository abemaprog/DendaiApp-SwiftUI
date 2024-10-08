import Foundation

struct LinkItem: Identifiable {
    let id = UUID()   // 各リンクの一意のID
    let title: String
    let image: String
    let url: String
}
