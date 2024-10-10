import SwiftUI

class ClubListsViewModel: ObservableObject {
    //千住
    @Published var senjuCommiteeClubs: [ClubListItem] = []
    @Published var senjuSportsClubs: [ClubListItem] = []
    @Published var senjuCultureClubs: [ClubListItem] = []
    @Published var senjuAcademicClubs: [ClubListItem] = []
    @Published var senjuEngineeringClubs: [ClubListItem] = []
    @Published var senjuVolunteerClubs: [ClubListItem] = []
    
    //鳩山
    @Published var hatoyamaCommiteeClubs: [ClubListItem] = []
    @Published var hatoyamaSportsClubs: [ClubListItem] = []
    @Published var hatoyamaAcademicClubs: [ClubListItem] = []
    
    
    init() {
        loadClubs()
    }
    
    func loadClubs() {
        // クラブデータをカテゴリごとに設定
        // 千住
        senjuCommiteeClubs = [
            //委員会
            ClubListItem(name: "自治会執行委員会", url: "https://x.com/tdu_sikkou"),
            ClubListItem(name: "新聞委員会", url: "https://x.com/tdupress5507d"),
            ClubListItem(name: "放送委員会", url: "https://x.com/TBC_1010"),
            ClubListItem(name: "旭祭実行委員会", url: "https://x.com/asahisai"),
            ClubListItem(name: "体育祭実行委員会", url: "https://x.com/taiikusai_TDU"),
            ClubListItem(name: "学生CSIRT委員会", url: "https://x.com/tdugakuseicsirt")
        ]
        senjuSportsClubs = [
            //体育会各団体
            ClubListItem(name: "合気道部", url: "https://x.com/TDUaikidou"),
            ClubListItem(name: "空手道部", url: ""),
            ClubListItem(name: "剣道部", url: "https://x.com/tdu_kendo"),
            ClubListItem(name: "少林寺拳法部", url: "https://x.com/dendaisyorinji"),
            ClubListItem(name: "硬式野球部", url: "https://x.com/TokyoDenki_bbc"),
            ClubListItem(name: "硬式庭球部", url: "https://x.com/tennis_dendai"),
            ClubListItem(name: "蹴球部", url: "https://x.com/tdufc_official"),
            ClubListItem(name: "卓球部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "排球部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "籠球部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "バドミントン部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "洋弓部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "水泳部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "スキー部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "自動車部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "サイクリング部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ゴルフ部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "陸上競技部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ワンダーフォーゲル部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ラグビー部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ソフトテニス部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "準硬式野球部", url: "https://x.com/dendaibaseball"),
            ClubListItem(name: "フィギュアスケート部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ハンドボール部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "フットサル同好会", url: "https://www.example.com/soccer")
        ]
        senjuCultureClubs = [
            //文化部会団体
            ClubListItem(name: "文化部会本部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "管弦楽部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ギターアンサンブル部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "軽音楽部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "コーストジャズオーケストラ部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "フォークミュージックアソシエーション部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "グリー倶楽部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "写真部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "アミューズメント研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "モダンジャズ研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "漫画研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "お笑いメディア研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ダンス部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "競技麻雀部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ボランティア部らいふ", url: "https://www.example.com/soccer"),
            ClubListItem(name: "演劇部『劇団カラクリ』", url: "https://www.example.com/soccer"),
            ClubListItem(name: "吹奏楽同好会", url: "https://www.example.com/soccer"),
            ClubListItem(name: "将棋部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "DJ部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "マジックサークル部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "留学生部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "e-sports同好会", url: "https://www.example.com/soccer")
        ]
        senjuAcademicClubs = [
            //学術研究部会
            ClubListItem(name: "アマチュア部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "オーディオ技術研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "自動車制御研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ソフトウェア研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "鉄道研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "電子技術研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "天文学研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "エネルギー研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "VOCALOID同好会", url: "https://www.example.com/soccer")
        ]
        senjuVolunteerClubs = [
            ClubListItem(name: "電大ガールズ", url: "https://x.com/tdu_2info")
        ]
        senjuEngineeringClubs = [
            //工学部第二部
            ClubListItem(name: "学生自治会執行委員会", url: "https://x.com/tdu_2info"),
            ClubListItem(name: "旭祭実行委員会", url: "https://x.com/tdu_2info"),
            
            ClubListItem(name: "文化部会本部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "写真部", url: "https://www.example.com/basketball"),
            ClubListItem(name: "テーブルゲーム研究部", url: "https://www.example.com/committee"),
            ClubListItem(name: "FLAME部", url: "https://x.com/tdu_2info"),
            ClubListItem(name: "漫画研究部", url: "https://x.com/tdu_2info"),
            ClubListItem(name: "アマチュア無線部", url: "https://x.com/tdu_2info"),
            ClubListItem(name: "ソフトウェア研究部", url: "https://x.com/tdu_2info"),
            ClubListItem(name: "オーディオ部", url: "https://x.com/tdu_2info")
        ]
        
        
        // 鳩山
        hatoyamaCommiteeClubs = [
            //委員会
            ClubListItem(name: "自治会執行委員会", url: "https://x.com/tdu_sikkou"),
            ClubListItem(name: "旭祭実行委員会", url: ""),
            ClubListItem(name: "学生環境推進委員会", url: "https://www.example.com/basketball"),
            ClubListItem(name: "放送委員会", url: "https://x.com/KATE_TDU")
        ]
        hatoyamaSportsClubs = [
            //体育会各団体
            ClubListItem(name: "軟式野球部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "アーチェリー部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "蹴球部", url: "https://x.com/tdusoccer"),
            ClubListItem(name: "硬式庭球部", url: "https://x.com/tduR_tennis"),
            ClubListItem(name: "剣道部", url: "https://x.com/TduRikoKendo"),
            ClubListItem(name: "陸上競技部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "卓球部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "少林寺拳法部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ラグビー部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "バドミントン部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "バスケットボール部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "モータースポーツ部", url: "https://www.example.com/soccer")
        ]
        hatoyamaAcademicClubs = [
            //学術文化部会
            ClubListItem(name: "管弦楽部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "FRCreation部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "写真部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "棋道部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "映画部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "自動車部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "JAZZ研究部会", url: "https://www.example.com/soccer"),
            ClubListItem(name: "天文学部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "フォークソング部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ロボット研究会部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "模型部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "曲作りサークル部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "鉄道研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "漫画研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "ヒューマノイド研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "アニメ・声優研究部", url: "https://www.example.com/soccer"),
            ClubListItem(name: "競技麻雀研究部", url: "https://www.example.com/soccer")
        ]
    }
}
