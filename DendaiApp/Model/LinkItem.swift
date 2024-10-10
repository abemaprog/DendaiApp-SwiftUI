import Foundation
import SwiftUICore

struct LinkItem: Identifiable {
    let id = UUID() 
    let title: String
    let image: String
    let url: String
    var color: Color
}
