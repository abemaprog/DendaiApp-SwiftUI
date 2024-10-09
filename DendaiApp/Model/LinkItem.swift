import Foundation

struct LinkItem: Identifiable {
    let id = UUID() 
    let title: String
    let image: String
    let url: String
}
