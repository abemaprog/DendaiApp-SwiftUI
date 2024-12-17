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
        do {
            let encodedData = try JSONEncoder().encode(lectureItems)
            UserDefaults.standard.set(encodedData, forKey: "lectures")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // 講義を削除
    func deleteLecture(item: HomeItem) {
        lectureItems.removeAll { $0.id == item.id }
    }
    
    // 講義を読み込む関数
    func loadLectures() {
        do {
            if let savedData = UserDefaults.standard.data(forKey: "lectures") {
                lectureItems = try JSONDecoder().decode([HomeItem].self, from: savedData)
            }
        } catch {
            print(error.localizedDescription)
            lectureItems = []
        }
    }
    
    // 講義を追加
    func addLecture(_ addLecture: HomeItem) {
        lectureItems.append(addLecture)
    }
    
    // 講義を編集
    func editLecture(_ editLecture: HomeItem) {
        if let index = lectureItems.firstIndex(where: { $0.id == editLecture.id }) {
            lectureItems[index] = editLecture
        }
    }
    // 指定の曜日・時限の講義を取得
    func lectureFor(day: String, period: Int) -> HomeItem? {
        lectureItems.first { $0.day == day && $0.period == period }
    }
    
    // 講義が存在するか判定
    func lectureExists(_ lecture: HomeItem) -> Bool {
        lectureItems.contains { $0.id == lecture.id }
    }
   
}
