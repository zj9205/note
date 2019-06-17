var secondsFromGMT: Int { return TimeZone.current.secondsFromGMT() }
secondsFromGMT  // -7200

var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
localTimeZoneAbbreviation   // "GMT-2"

var localTimeZoneName: String { return TimeZone.current.identifier }
localTimeZoneName   // "America/Sao_Paulo"

var timeZoneAbbreviations: [String:String] { return TimeZone.abbreviationDictionary }
timeZoneAbbreviations   // ["CEST": "Europe/Paris", "WEST": "Europe/Lisbon", "CDT": "America/Chicago", "EET": "Europe/Istanbul", "BRST": "America/Sao_Paulo", "EEST": "Europe/Istanbul", "CET": "Europe/Paris", "MSD": "Europe/Moscow", "MST": "America/Denver", "KST": "Asia/Seoul", "PET": "America/Lima", "NZDT": "Pacific/Auckland", "CLT": "America/Santiago", "HST": "Pacific/Honolulu", "MDT": "America/Denver", "NZST": "Pacific/Auckland", "COT": "America/Bogota", "CST": "America/Chicago", "SGT": "Asia/Singapore", "CAT": "Africa/Harare", "BRT": "America/Sao_Paulo", "WET": "Europe/Lisbon", "IST": "Asia/Calcutta", "HKT": "Asia/Hong_Kong", "GST": "Asia/Dubai", "EDT": "America/New_York", "WIT": "Asia/Jakarta", "UTC": "UTC", "JST": "Asia/Tokyo", "IRST": "Asia/Tehran", "PHT": "Asia/Manila", "AKDT": "America/Juneau", "BST": "Europe/London", "PST": "America/Los_Angeles", "ART": "America/Argentina/Buenos_Aires", "PDT": "America/Los_Angeles", "WAT": "Africa/Lagos", "EST": "America/New_York", "BDT": "Asia/Dhaka", "CLST": "America/Santiago", "AKST": "America/Juneau", "ADT": "America/Halifax", "AST": "America/Halifax", "PKT": "Asia/Karachi", "GMT": "GMT", "ICT": "Asia/Bangkok", "MSK": "Europe/Moscow", "EAT": "Africa/Addis_Ababa"]

var timeZoneIdentifiers: [String] { return TimeZone.knownTimeZoneIdentifiers }
timeZoneIdentifiers // ["Africa/Abidjan", "Africa/Accra", "Africa/Addis_Ababa", "Africa/Algiers", "Africa/Asmara", "Africa/Bamako", "Africa/Bangui", "Africa/Banjul", "Africa/Bissau", "Africa/Blantyre", "Africa/Brazzaville", "Africa/Bujumbura", "Africa/Cairo", "Africa/Casablanca", "Africa/Ceuta", "Africa/Conakry", "Africa/Dakar", "Africa/Dar_es_Salaam", "Africa/Djibouti", "Africa/Douala", "Africa/El_Aaiun", "Africa/Freetown", "Africa/Gaborone", "Africa/Harare", "Africa/Johannesburg", "Africa/Juba", "Africa/Kampala", "Africa/Khartoum", "Africa/Kigali", "Africa/Kinshasa", "Africa/Lagos", "Africa/Libreville", "Africa/Lome", "Africa/Luanda", "Africa/Lubumbashi", "Africa/Lusaka", "Africa/Malabo", "Africa/Maputo", "Africa/Maseru", "Africa/Mbabane", "Africa/Mogadishu", "Africa/Monrovia", "Africa/Nairobi", "Africa/Ndjamena", "Africa/Niamey", "Africa/Nouakchott", "Africa/Ouagadougou", "Africa/Porto-Novo", "Africa/Sao_Tome", "Africa/Tripoli", "Africa/Tunis", "Africa/Windhoek", "America/Adak", "America/Anchorage", "America/Anguilla", "America/Antigua", "America/Araguaina", "America/Argentina/Buenos_Aires", "America/Argentina/Catamarca", "America/Argentina/Cordoba", "America/Argentina/Jujuy", "America/Argentina/La_Rioja", "America/Argentina/Mendoza", "America/Argentina/Rio_Gallegos", "America/Argentina/Salta", "America/Argentina/San_Juan", "America/Argentina/San_Luis", "America/Argentina/Tucuman", "America/Argentina/Ushuaia", "America/Aruba", "America/Asuncion", "America/Atikokan", "America/Bahia", "America/Bahia_Banderas", "America/Barbados", "America/Belem", "America/Belize", "America/Blanc-Sablon", "America/Boa_Vista", "America/Bogota", …, "Pacific/Marquesas", "Pacific/Midway", "Pacific/Nauru", "Pacific/Niue", "Pacific/Norfolk", "Pacific/Noumea", "Pacific/Pago_Pago", "Pacific/Palau", "Pacific/Pitcairn", "Pacific/Pohnpei", "Pacific/Ponape", "Pacific/Port_Moresby", "Pacific/Rarotonga", "Pacific/Saipan", "Pacific/Tahiti", "Pacific/Tarawa", "Pacific/Tongatapu", "Pacific/Truk", "Pacific/Wake", "Pacific/Wallis"]

var isDaylightSavingTime: Bool { return TimeZone.current.isDaylightSavingTime(for: Date()) }
print(isDaylightSavingTime) // true (in effect)

var daylightSavingTimeOffset: TimeInterval { return TimeZone.current.daylightSavingTimeOffset() }
print(daylightSavingTimeOffset) // 3600 seconds (1 hour - daylight savings time)

var nextDaylightSavingTimeTransition: Date? {
    return TimeZone.current.nextDaylightSavingTimeTransition
}   // "Feb 18, 2017, 11:00 PM"
print(nextDaylightSavingTimeTransition?.description(with: .current) ?? "none")
nextDaylightSavingTimeTransition    // "Saturday, February 18, 2017 at 11:00:00 PM Brasilia Standard Time\n"

var nextDaylightSavingTimeTransitionAfterNext: Date? {
    guard
        let nextDaylightSavingTimeTransition = nextDaylightSavingTimeTransition
        else { return nil }
    return TimeZone.current.nextDaylightSavingTimeTransition(after: nextDaylightSavingTimeTransition)
}
nextDaylightSavingTimeTransitionAfterNext   //   "Oct 15, 2017, 1:00 AM"



Locale.availableIdentifiers
Locale.isoRegionCodes
Locale.isoCurrencyCodes
Locale.isoLanguageCodes
Locale.commonISOCurrencyCodes

Locale.current.regionCode           // "US"
Locale.current.languageCode         // "en"
Locale.current.currencyCode         // "USD"
Locale.current.currencySymbol       // "$"
Locale.current.groupingSeparator    // ","
Locale.current.decimalSeparator     // "."
Locale.current.usesMetricSystem     // false

Locale.windowsLocaleCode(fromIdentifier: "pt_BR")                   //  1,046
Locale.identifier(fromWindowsLocaleCode: 1046) ?? ""                // "pt_BR"
Locale.windowsLocaleCode(fromIdentifier: Locale.current.identifier) //  1,033 Note: I am in Brasil but I use "en_US" format with all my devices
Locale.windowsLocaleCode(fromIdentifier: "en_US")                                   // 1,033
Locale.identifier(fromWindowsLocaleCode: 1033) ?? ""                                // "en_US"

Locale(identifier: "en_US_POSIX").localizedString(forLanguageCode: "pt")            // "Portuguese"
Locale(identifier: "en_US_POSIX").localizedString(forRegionCode: "br")              // "Brazil"
Locale(identifier: "en_US_POSIX").localizedString(forIdentifier: "pt_BR")           // "Portuguese (Brazil)"

TimeZone.current.localizedName(for: .standard, locale: .current) ?? ""              // "Brasilia Standard Time"
TimeZone.current.localizedName(for: .shortStandard, locale: .current) ?? ""         // "GMT-3
TimeZone.current.localizedName(for: .daylightSaving, locale: .current) ?? ""        // "Brasilia Summer Time"
TimeZone.current.localizedName(for: .shortDaylightSaving, locale: .current) ?? ""   // "GMT-2"
TimeZone.current.localizedName(for: .generic, locale: .current) ?? ""               // "Brasilia Time"
TimeZone.current.localizedName(for: .shortGeneric, locale: .current) ?? ""          // "Sao Paulo Time"

var timeZone: String {
    return TimeZone.current.localizedName(for:
        TimeZone.current.isDaylightSavingTime() ? .daylightSaving : .standard, locale: .current) ?? ""
}

timeZone       // "Brasilia Summer Time"
