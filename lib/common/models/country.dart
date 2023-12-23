enum Country {
  afghanistan,
  albania,
  algeria,
  andorra,
  angola,
  antiguaAndBarbuda,
  argentina,
  armenia,
  australia,
  austria,
  azerbaijan,
  bahamas,
  bahrain,
  bangladesh,
  barbados,
  belarus,
  belgium,
  belize,
  benin,
  bhutan,
  bolivia,
  bosniaAndHerzegovina,
  botswana,
  brazil,
  brunei,
  bulgaria,
  burkinaFaso,
  burundi,
  caboVerde,
  cambodia,
  cameroon,
  canada,
  centralAfricanRepublic,
  chad,
  chile,
  china,
  colombia,
  comoros,
  congoBrazzaville,
  congoKinshasa,
  costaRica,
  coteDIvoire,
  croatia,
  cuba,
  cyprus,
  czechRepublic,
  denmark,
  djibouti,
  dominica,
  dominicanRepublic,
  eastTimor,
  ecuador,
  egypt,
  elSalvador,
  equatorialGuinea,
  eritrea,
  estonia,
  eswatini,
  ethiopia,
  fiji,
  finland,
  france,
  gabon,
  gambia,
  georgia,
  germany,
  ghana,
  greece,
  grenada,
  guatemala,
  guinea,
  guineaBissau,
  guyana,
  haiti,
  honduras,
  hungary,
  iceland,
  india,
  indonesia,
  iran,
  iraq,
  ireland,
  israel,
  italy,
  jamaica,
  japan,
  jordan,
  kazakhstan,
  kenya,
  kiribati,
  kosovo,
  kuwait,
  kyrgyzstan,
  laos,
  latvia,
  lebanon,
  lesotho,
  liberia,
  libya,
  liechtenstein,
  lithuania,
  luxembourg,
  madagascar,
  malawi,
  malaysia,
  maldives,
  mali,
  malta,
  marshallIslands,
  mauritania,
  mauritius,
  mexico,
  micronesia,
  moldova,
  monaco,
  mongolia,
  montenegro,
  morocco,
  mozambique,
  myanmar,
  namibia,
  nauru,
  nepal,
  netherlands,
  newZealand,
  nicaragua,
  niger,
  nigeria,
  northMacedonia,
  norway,
  oman,
  pakistan,
  palau,
  palestine,
  panama,
  papuaNewGuinea,
  paraguay,
  peru,
  philippines,
  poland,
  portugal,
  qatar,
  romania,
  russia,
  rwanda,
  saintKittsAndNevis,
  saintLucia,
  saintVincentAndTheGrenadines,
  samoa,
  sanMarino,
  saoTomeAndPrincipe,
  saudiArabia,
  senegal,
  serbia,
  seychelles,
  sierraLeone,
  singapore,
  slovakia,
  slovenia,
  solomonIslands,
  somalia,
  southAfrica,
  southKorea,
  southSudan,
  spain,
  sriLanka,
  sudan,
  suriname,
  sweden,
  switzerland,
  syria,
  taiwan,
  tajikistan,
  tanzania,
  thailand,
  togo,
  tonga,
  trinidadAndTobago,
  tunisia,
  turkey,
  turkmenistan,
  tuvalu,
  uganda,
  ukraine,
  unitedArabEmirates,
  unitedKingdom,
  unitedStates,
  uruguay,
  uzbekistan,
  vanuatu,
  vaticanCity,
  venezuela,
  vietnam,
  yemen,
  zambia,
  zimbabwe,
}

extension CountryExtension on Country {
  String get isoCode {
    switch (this) {
      case Country.afghanistan:
        return "AF";
      case Country.albania:
        return "AL";
      case Country.algeria:
        return "DZ";
      case Country.andorra:
        return "AD";
      case Country.angola:
        return "AO";
      case Country.antiguaAndBarbuda:
        return "AG";
      case Country.argentina:
        return "AR";
      case Country.armenia:
        return "AM";
      case Country.australia:
        return "AU";
      case Country.austria:
        return "AT";
      case Country.azerbaijan:
        return "AZ";
      case Country.bahamas:
        return "BS";
      case Country.bahrain:
        return "BH";
      case Country.bangladesh:
        return "BD";
      case Country.barbados:
        return "BB";
      case Country.belarus:
        return "BY";
      case Country.belgium:
        return "BE";
      case Country.belize:
        return "BZ";
      case Country.benin:
        return "BJ";
      case Country.bhutan:
        return "BT";
      case Country.bolivia:
        return "BO";
      case Country.bosniaAndHerzegovina:
        return "BA";
      case Country.botswana:
        return "BW";
      case Country.brazil:
        return "BR";
      case Country.brunei:
        return "BN";
      case Country.bulgaria:
        return "BG";
      case Country.burkinaFaso:
        return "BF";
      case Country.burundi:
        return "BI";
      case Country.caboVerde:
        return "CV";
      case Country.cambodia:
        return "KH";
      case Country.cameroon:
        return "CM";
      case Country.canada:
        return "CA";
      case Country.centralAfricanRepublic:
        return "CF";
      case Country.chad:
        return "TD";
      case Country.chile:
        return "CL";
      case Country.china:
        return "CN";
      case Country.colombia:
        return "CO";
      case Country.comoros:
        return "KM";
      case Country.congoBrazzaville:
        return "CG";
      case Country.congoKinshasa:
        return "CD";
      case Country.costaRica:
        return "CR";
      case Country.coteDIvoire:
        return "CI";
      case Country.croatia:
        return "HR";
      case Country.cuba:
        return "CU";
      case Country.cyprus:
        return "CY";
      case Country.czechRepublic:
        return "CZ";
      case Country.denmark:
        return "DK";
      case Country.djibouti:
        return "DJ";
      case Country.dominica:
        return "DM";
      case Country.dominicanRepublic:
        return "DO";
      case Country.eastTimor:
        return "TL";
      case Country.ecuador:
        return "EC";
      case Country.egypt:
        return "EG";
      case Country.elSalvador:
        return "SV";
      case Country.equatorialGuinea:
        return "GQ";
      case Country.eritrea:
        return "ER";
      case Country.estonia:
        return "EE";
      case Country.eswatini:
        return "SZ";
      case Country.ethiopia:
        return "ET";
      case Country.fiji:
        return "FJ";
      case Country.finland:
        return "FI";
      case Country.france:
        return "FR";
      case Country.gabon:
        return "GA";
      case Country.gambia:
        return "GM";
      case Country.georgia:
        return "GE";
      case Country.germany:
        return "DE";
      case Country.ghana:
        return "GH";
      case Country.greece:
        return "GR";
      case Country.grenada:
        return "GD";
      case Country.guatemala:
        return "GT";
      case Country.guinea:
        return "GN";
      case Country.guineaBissau:
        return "GW";
      case Country.guyana:
        return "GY";
      case Country.haiti:
        return "HT";
      case Country.honduras:
        return "HN";
      case Country.hungary:
        return "HU";
      case Country.iceland:
        return "IS";
      case Country.india:
        return "IN";
      case Country.indonesia:
        return "ID";
      case Country.iran:
        return "IR";
      case Country.iraq:
        return "IQ";
      case Country.ireland:
        return "IE";
      case Country.israel:
        return "IL";
      case Country.italy:
        return "IT";
      case Country.jamaica:
        return "JM";
      case Country.japan:
        return "JP";
      case Country.jordan:
        return "JO";
      case Country.kazakhstan:
        return "KZ";
      case Country.kenya:
        return "KE";
      case Country.kiribati:
        return "KI";
      case Country.kosovo:
        return "XK";
      case Country.kuwait:
        return "KW";
      case Country.kyrgyzstan:
        return "KG";
      case Country.laos:
        return "LA";
      case Country.latvia:
        return "LV";
      case Country.lebanon:
        return "LB";
      case Country.lesotho:
        return "LS";
      case Country.liberia:
        return "LR";
      case Country.libya:
        return "LY";
      case Country.liechtenstein:
        return "LI";
      case Country.lithuania:
        return "LT";
      case Country.luxembourg:
        return "LU";
      case Country.madagascar:
        return "MG";
      case Country.malawi:
        return "MW";
      case Country.malaysia:
        return "MY";
      case Country.maldives:
        return "MV";
      case Country.mali:
        return "ML";
      case Country.malta:
        return "MT";
      case Country.marshallIslands:
        return "MH";
      case Country.mauritania:
        return "MR";
      case Country.mauritius:
        return "MU";
      case Country.mexico:
        return "MX";
      case Country.micronesia:
        return "FM";
      case Country.moldova:
        return "MD";
      case Country.monaco:
        return "MC";
      case Country.mongolia:
        return "MN";
      case Country.montenegro:
        return "ME";
      case Country.morocco:
        return "MA";
      case Country.mozambique:
        return "MZ";
      case Country.myanmar:
        return "MM";
      case Country.namibia:
        return "NA";
      case Country.nauru:
        return "NR";
      case Country.nepal:
        return "NP";
      case Country.netherlands:
        return "NL";
      case Country.newZealand:
        return "NZ";
      case Country.nicaragua:
        return "NI";
      case Country.niger:
        return "NE";
      case Country.nigeria:
        return "NG";
      case Country.northMacedonia:
        return "MK";
      case Country.norway:
        return "NO";
      case Country.oman:
        return "OM";
      case Country.pakistan:
        return "PK";
      case Country.palau:
        return "PW";
      case Country.palestine:
        return "PS";
      case Country.panama:
        return "PA";
      case Country.papuaNewGuinea:
        return "PG";
      case Country.paraguay:
        return "PY";
      case Country.peru:
        return "PE";
      case Country.philippines:
        return "PH";
      case Country.poland:
        return "PL";
      case Country.portugal:
        return "PT";
      case Country.qatar:
        return "QA";
      case Country.romania:
        return "RO";
      case Country.russia:
        return "RU";
      case Country.rwanda:
        return "RW";
      case Country.saintKittsAndNevis:
        return "KN";
      case Country.saintLucia:
        return "LC";
      case Country.saintVincentAndTheGrenadines:
        return "VC";
      case Country.samoa:
        return "WS";
      case Country.sanMarino:
        return "SM";
      case Country.saoTomeAndPrincipe:
        return "ST";
      case Country.saudiArabia:
        return "SA";
      case Country.senegal:
        return "SN";
      case Country.serbia:
        return "RS";
      case Country.seychelles:
        return "SC";
      case Country.sierraLeone:
        return "SL";
      case Country.singapore:
        return "SG";
      case Country.slovakia:
        return "SK";
      case Country.slovenia:
        return "SI";
      case Country.solomonIslands:
        return "SB";
      case Country.somalia:
        return "SO";
      case Country.southAfrica:
        return "ZA";
      case Country.southKorea:
        return "KR";
      case Country.southSudan:
        return "SS";
      case Country.spain:
        return "ES";
      case Country.sriLanka:
        return "LK";
      case Country.sudan:
        return "SD";
      case Country.suriname:
        return "SR";
      case Country.sweden:
        return "SE";
      case Country.switzerland:
        return "CH";
      case Country.syria:
        return "SY";
      case Country.taiwan:
        return "TW";
      case Country.tajikistan:
        return "TJ";
      case Country.tanzania:
        return "TZ";
      case Country.thailand:
        return "TH";
      case Country.togo:
        return "TG";
      case Country.tonga:
        return "TO";
      case Country.trinidadAndTobago:
        return "TT";
      case Country.tunisia:
        return "TN";
      case Country.turkey:
        return "TR";
      case Country.turkmenistan:
        return "TM";
      case Country.tuvalu:
        return "TV";
      case Country.uganda:
        return "UG";
      case Country.ukraine:
        return "UA";
      case Country.unitedArabEmirates:
        return "AE";
      case Country.unitedKingdom:
        return "GB";
      case Country.unitedStates:
        return "US";
      case Country.uruguay:
        return "UY";
      case Country.uzbekistan:
        return "UZ";
      case Country.vanuatu:
        return "VU";
      case Country.vaticanCity:
        return "VA";
      case Country.venezuela:
        return "VE";
      case Country.vietnam:
        return "VN";
      case Country.yemen:
        return "YE";
      case Country.zambia:
        return "ZM";
      case Country.zimbabwe:
        return "ZW";
    }
  }
}

extension CountryToString on Country {
  String toStringX() {
    var str = toString()
        .split('.')
        .last
        .replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (match) => '${match.group(1)} ${match.group(2)}');
    return str[0].toUpperCase() + str.substring(1);
  }
}
