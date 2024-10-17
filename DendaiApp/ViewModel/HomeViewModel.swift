import Foundation

class HomeViewModel: ObservableObject {
    @Published var lectureItems: [HomeItem] = [] {
        didSet {
            saveLectures()
        }
    }
    
    init() {
        loadLectures()
    }
    
    // 講義を保存する関数
    func saveLectures() {
        if let encodedData = try? JSONEncoder().encode(lectureItems) {
            UserDefaults.standard.set(encodedData, forKey: "lectures")
        }
    }
    
    // 講義を読み込む関数
    func loadLectures() {
        if let savedData = UserDefaults.standard.data(forKey: "lectures"),
           let decodedItems = try? JSONDecoder().decode([HomeItem].self, from: savedData) {
            lectureItems = decodedItems
        }
    }
    
    // 講義を追加
    func addLecture(lectureName: String, period: Int, room: String, day: String, time: String) {
        let newLecture = HomeItem(lectureName: lectureName, period: period, room: room, day: day, time: time)
        lectureItems.append(newLecture)
    }
    
    // 講義を編集
    func editLecture(item: HomeItem, lectureName: String, period: Int, room: String, time: String) {
        if let index = lectureItems.firstIndex(where: { $0.id == item.id }) {
            lectureItems[index].lectureName = lectureName
            lectureItems[index].period = period
            lectureItems[index].room = room
            lectureItems[index].time = time
        }
    }
    
    // 講義を削除
    func deleteLecture(item: HomeItem) {
        lectureItems.removeAll { $0.id == item.id }
    }
    
    // 講義の並び替え
    func moveLecture(from source: IndexSet, to destination: Int, forDay day: String) {
        var filteredLectures = lectureItems.filter { $0.day == day }
        filteredLectures.move(fromOffsets: source, toOffset: destination)
        
        // 並び替え後のデータを再配置
        let nonFilteredLectures = lectureItems.filter { $0.day != day }
        lectureItems = nonFilteredLectures + filteredLectures
    }
}
