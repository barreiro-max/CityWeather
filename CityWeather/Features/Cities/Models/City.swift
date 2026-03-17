enum City: String {
    case kyiv = "Київ"
    case lviv = "Львів"
    case odesa = "Одеса"
    case kharkiv = "Харків"
    case dnipro = "Дніпро"
    case uzhhorod = "Ужгород"
    case zaporizhzhia = "Запоріжжя"
    case vinnytsia = "Вінниця"
    case ivanoFrankivsk = "Івано-Франківськ"
    case ternopil = "Тернопіль"
    case chernivtsi = "Чернівці"
    case rivne = "Рівне"
    case kremenchuk = "Кременчук"
    
    var name: String {
        rawValue
    }
}

extension City: CaseIterable { }

extension City: Hashable { }

extension City: Identifiable {
    var id: String { name }
}
