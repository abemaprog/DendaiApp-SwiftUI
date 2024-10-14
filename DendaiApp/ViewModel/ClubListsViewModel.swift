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
    
    @Published var searchText: String = "" // 検索
    
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
            ClubListItem(name: "卓球部", url: "https://x.com/tdu_ttc"),
            ClubListItem(name: "排球部", url: "https://x.com/tduvolleyball"),
            ClubListItem(name: "籠球部", url: "https://x.com/dendaibaske"),
            ClubListItem(name: "バドミントン部", url: "https://x.com/TDU_badminton1"),
            ClubListItem(name: "洋弓部", url: "https://x.com/TDU_ARCHERY"),
            ClubListItem(name: "水泳部", url: ""),
            ClubListItem(name: "スキー部", url: ""),
            ClubListItem(name: "自動車部", url: "https://x.com/autoclub_denki"),
            ClubListItem(name: "サイクリング部", url: "https://x.com/TDUSenjuCycling"),
            ClubListItem(name: "ゴルフ部", url: "https://x.com/dendai_golf"),
            ClubListItem(name: "陸上競技部", url: "https://x.com/TDU_track_field"),
            ClubListItem(name: "ワンダーフォーゲル部", url: "https://x.com/dendaiWV1961"),
            ClubListItem(name: "ラグビー部", url: ""),
            ClubListItem(name: "ソフトテニス部", url: "https://x.com/BuSofutote2012"),
            ClubListItem(name: "準硬式野球部", url: "https://x.com/dendaibaseball"),
            ClubListItem(name: "フィギュアスケート部", url: ""),
            ClubListItem(name: "ハンドボール同好会", url: "https://x.com/TUD_handball"),
            ClubListItem(name: "フットサル同好会", url: "https://x.com/tdu_futsal2022")
        ]
        senjuCultureClubs = [
            //文化部会団体
            ClubListItem(name: "文化部会本部", url: "https://x.com/tdu_bunka"),
            ClubListItem(name: "管弦楽部", url: "https://x.com/TDU_orc"),
            ClubListItem(name: "ギターアンサンブル部", url: "https://x.com/tdu_guitar"),
            ClubListItem(name: "軽音楽部", url: ""),
            ClubListItem(name: "コーストジャズオーケストラ部", url: "https://x.com/coastjazz"),
            ClubListItem(name: "フォークミュージックアソシエイション部", url: ""),
            ClubListItem(name: "グリー倶楽部", url: "https://x.com/tdugleeclub"),
            ClubListItem(name: "写真部", url: "https://x.com/1010photo"),
            ClubListItem(name: "アミューズメント研究部", url: "https://x.com/TDU_AMken"),
            ClubListItem(name: "モダンジャズ研究会", url: "https://x.com/TDU_MJC"),
            ClubListItem(name: "漫画研究部", url: "https://x.com/mnkn_TDU"),
            ClubListItem(name: "お笑いメディア研究部", url: "https://x.com/tdu_raraparu"),
            ClubListItem(name: "ダンス部", url: ""),
            ClubListItem(name: "競技麻雀部", url: "https://x.com/tdu_mahjong"),
            ClubListItem(name: "ボランティア部らいふ", url: "https://x.com/TDU_vol_life"),
            ClubListItem(name: "演劇部『劇団カラクリ』", url: "https://x.com/tdu1000ju_pd"),
            ClubListItem(name: "吹奏楽同好会", url: "https://x.com/tdu_windinst"),
            ClubListItem(name: "将棋部", url: "https://x.com/tdusenjushogi"),
            ClubListItem(name: "DJ部", url: "https://x.com/TDU_DJ"),
            ClubListItem(name: "マジックサークル部", url: "https://x.com/senju_magicclub"),
            ClubListItem(name: "留学生会", url: "https://x.com/senjunotic"),
            ClubListItem(name: "e-sports部", url: "https://x.com/TDU_esportsclub")
        ]
        senjuAcademicClubs = [
            //学術研究部会
            ClubListItem(name: "アマチュア無線部", url: "https://x.com/JA1YAQ"),
            ClubListItem(name: "オーディオ技術研究部", url: "https://x.com/TDU_Audio"),
            ClubListItem(name: "自動車制御研究部", url: ""),
            ClubListItem(name: "ソフトウェア研究部", url: "https://x.com/sofken_tdu"),
            ClubListItem(name: "鉄道研究部", url: "https://x.com/tdufe"),
            ClubListItem(name: "電子技術研究部", url: "https://x.com/giken_PR"),
            ClubListItem(name: "天文学研究部", url: "https://x.com/TDUtenmonbu"),
            ClubListItem(name: "エネルギー研究部", url: "https://x.com/tdu_eneken"),
            ClubListItem(name: "VOCALOID同好会", url: "https://x.com/vocaken_tdu")
        ]
        senjuVolunteerClubs = [
            ClubListItem(name: "電大ガールズ", url: "https://x.com/TDU_girls")
        ]
        senjuEngineeringClubs = [
            //工学部第二部
            ClubListItem(name: "学生自治会執行委員会", url: "https://x.com/tdu_2info"),
            ClubListItem(name: "旭祭実行委員会", url: "https://x.com/asahisai"),
            ClubListItem(name: "文化部会本部", url: "https://x.com/tdu_gakubunInfo"),
            ClubListItem(name: "写真部", url: "https://x.com/dendai_2ndphoto"),
            ClubListItem(name: "テーブルゲーム研究部", url: "https://x.com/dendaitg"),
            ClubListItem(name: "FLAME部", url: "https://x.com/FLAME_TDU"),
            ClubListItem(name: "漫画研究部", url: ""),
            ClubListItem(name: "アマチュア無線部", url: "https://x.com/JA1YQN"),
            ClubListItem(name: "ソフトウェア研究部", url: "https://x.com/sofken2"),
            ClubListItem(name: "オーディオ部", url: "https://x.com/TDU_2audio")
        ]
        
        
        // 鳩山
        hatoyamaCommiteeClubs = [
            //委員会
            ClubListItem(name: "自治会執行委員会", url: "https://x.com/tdu_sikkou"),
            ClubListItem(name: "旭祭実行委員会", url: "https://x.com/hatoyamasai"),
            ClubListItem(name: "学生環境推進委員会", url: "https://www.example.com/basketball"),
            ClubListItem(name: "放送委員会", url: "https://x.com/KATE_TDU")
        ]
        hatoyamaSportsClubs = [
            //体育会各団体
            ClubListItem(name: "軟式野球部", url: "https://x.com/dendai89"),
            ClubListItem(name: "アーチェリー部", url: "https://x.com/tdu_ac_club"),
            ClubListItem(name: "蹴球部", url: "https://x.com/tdusoccer"),
            ClubListItem(name: "硬式庭球部", url: "https://x.com/tduR_tennis"),
            ClubListItem(name: "剣道部", url: "https://x.com/TduRikoKendo"),
            ClubListItem(name: "陸上競技部", url: "https://x.com/TDU_tf_science"),
            ClubListItem(name: "卓球部", url: ""),
            ClubListItem(name: "少林寺拳法部", url: "https://x.com/dendaisyorinji"),
            ClubListItem(name: "ラグビー部", url: "https://x.com/tdurfc15"),
            ClubListItem(name: "バドミントン部", url: "https://x.com/tdu_bad_hato"),
            ClubListItem(name: "バスケットボール部", url: "https://x.com/tdubasketball"),
            ClubListItem(name: "モータースポーツ部", url: "https://x.com/TDUmotorsport")
        ]
        hatoyamaAcademicClubs = [
            //学術文化部会
            ClubListItem(name: "管弦楽部", url: "https://x.com/TDU_orc"),
            ClubListItem(name: "FRCreation部", url: ""),
            ClubListItem(name: "写真部", url: "https://x.com/TDUsyashinbu"),
            ClubListItem(name: "棋道部", url: ""),
            ClubListItem(name: "映画部", url: "https://x.com/boudogeimusa"),
            ClubListItem(name: "自動車部", url: ""),
            ClubListItem(name: "JAZZ研究部会", url: "https://x.com/tdu_r_jazz"),
            ClubListItem(name: "天文学部", url: ""),
            ClubListItem(name: "フォークソング部", url: "https://x.com/tdu_folk"),
            ClubListItem(name: "ロボット研究会部", url: "https://x.com/tdu_ssr"),
            ClubListItem(name: "模型部", url: "https://x.com/TDUmodelingclubm"),
            ClubListItem(name: "曲作りサークル部", url: ""),
            ClubListItem(name: "鉄道研究部", url: "https://x.com/TDU_TEKKEN"),
            ClubListItem(name: "漫画研究部", url: ""),
            ClubListItem(name: "ヒューマノイド研究部", url: ""),
            ClubListItem(name: "アニメ・声優研究部", url: ""),
            ClubListItem(name: "競技麻雀研究部", url: "")
        ]
    }
    // フィルター
    func filteredClubs(for clubs: [ClubListItem]) -> [ClubListItem] {
        if searchText.isEmpty {
            return clubs
        } else {
            return clubs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
