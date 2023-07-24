import 'package:json_annotation/json_annotation.dart';

part 'game_data.g.dart';

@JsonSerializable()
class GameData {
  @JsonKey(name: "activePlayer")
  ActivePlayer activePlayer;
  @JsonKey(name: "allPlayers")
  List<AllPlayer> allPlayers;
  @JsonKey(name: "events")
  Events events;
  @JsonKey(name: "gameData")
  GameDataClass gameData;

  GameData({
    required this.activePlayer,
    required this.allPlayers,
    required this.events,
    required this.gameData,
  });

  factory GameData.fromJson(Map<String, dynamic> json) => _$GameDataFromJson(json);

  Map<String, dynamic> toJson() => _$GameDataToJson(this);
}

@JsonSerializable()
class ActivePlayer {
  @JsonKey(name: "abilities")
  Abilities abilities;
  @JsonKey(name: "championStats")
  ChampionStats championStats;
  @JsonKey(name: "currentGold")
  int currentGold;
  @JsonKey(name: "fullRunes")
  FullRunes fullRunes;
  @JsonKey(name: "level")
  int level;
  @JsonKey(name: "summonerName")
  String summonerName;
  @JsonKey(name: "teamRelativeColors")
  bool teamRelativeColors;

  ActivePlayer({
    required this.abilities,
    required this.championStats,
    required this.currentGold,
    required this.fullRunes,
    required this.level,
    required this.summonerName,
    required this.teamRelativeColors,
  });

  factory ActivePlayer.fromJson(Map<String, dynamic> json) => _$ActivePlayerFromJson(json);

  Map<String, dynamic> toJson() => _$ActivePlayerToJson(this);
}

@JsonSerializable()
class Abilities {
  @JsonKey(name: "E")
  E e;
  @JsonKey(name: "Passive")
  E passive;
  @JsonKey(name: "Q")
  E q;
  @JsonKey(name: "R")
  E r;
  @JsonKey(name: "W")
  E w;

  Abilities({
    required this.e,
    required this.passive,
    required this.q,
    required this.r,
    required this.w,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class E {
  @JsonKey(name: "abilityLevel")
  int? abilityLevel;
  @JsonKey(name: "displayName")
  String displayName;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "rawDescription")
  String rawDescription;
  @JsonKey(name: "rawDisplayName")
  String rawDisplayName;

  E({
    this.abilityLevel,
    required this.displayName,
    this.id,
    required this.rawDescription,
    required this.rawDisplayName,
  });

  factory E.fromJson(Map<String, dynamic> json) => _$EFromJson(json);

  Map<String, dynamic> toJson() => _$EToJson(this);
}

@JsonSerializable()
class ChampionStats {
  @JsonKey(name: "abilityHaste")
  int abilityHaste;
  @JsonKey(name: "abilityPower")
  int abilityPower;
  @JsonKey(name: "armor")
  int armor;
  @JsonKey(name: "armorPenetrationFlat")
  int armorPenetrationFlat;
  @JsonKey(name: "armorPenetrationPercent")
  int armorPenetrationPercent;
  @JsonKey(name: "attackDamage")
  double attackDamage;
  @JsonKey(name: "attackRange")
  int attackRange;
  @JsonKey(name: "attackSpeed")
  double attackSpeed;
  @JsonKey(name: "bonusArmorPenetrationPercent")
  int bonusArmorPenetrationPercent;
  @JsonKey(name: "bonusMagicPenetrationPercent")
  int bonusMagicPenetrationPercent;
  @JsonKey(name: "critChance")
  int critChance;
  @JsonKey(name: "critDamage")
  int critDamage;
  @JsonKey(name: "currentHealth")
  int currentHealth;
  @JsonKey(name: "healShieldPower")
  int healShieldPower;
  @JsonKey(name: "healthRegenRate")
  double healthRegenRate;
  @JsonKey(name: "lifeSteal")
  int lifeSteal;
  @JsonKey(name: "magicLethality")
  int magicLethality;
  @JsonKey(name: "magicPenetrationFlat")
  int magicPenetrationFlat;
  @JsonKey(name: "magicPenetrationPercent")
  int magicPenetrationPercent;
  @JsonKey(name: "magicResist")
  int magicResist;
  @JsonKey(name: "maxHealth")
  int maxHealth;
  @JsonKey(name: "moveSpeed")
  int moveSpeed;
  @JsonKey(name: "omnivamp")
  int omnivamp;
  @JsonKey(name: "physicalLethality")
  int physicalLethality;
  @JsonKey(name: "physicalVamp")
  int physicalVamp;
  @JsonKey(name: "resourceMax")
  int resourceMax;
  @JsonKey(name: "resourceRegenRate")
  int resourceRegenRate;
  @JsonKey(name: "resourceType")
  String resourceType;
  @JsonKey(name: "resourceValue")
  int resourceValue;
  @JsonKey(name: "spellVamp")
  int spellVamp;
  @JsonKey(name: "tenacity")
  int tenacity;

  ChampionStats({
    required this.abilityHaste,
    required this.abilityPower,
    required this.armor,
    required this.armorPenetrationFlat,
    required this.armorPenetrationPercent,
    required this.attackDamage,
    required this.attackRange,
    required this.attackSpeed,
    required this.bonusArmorPenetrationPercent,
    required this.bonusMagicPenetrationPercent,
    required this.critChance,
    required this.critDamage,
    required this.currentHealth,
    required this.healShieldPower,
    required this.healthRegenRate,
    required this.lifeSteal,
    required this.magicLethality,
    required this.magicPenetrationFlat,
    required this.magicPenetrationPercent,
    required this.magicResist,
    required this.maxHealth,
    required this.moveSpeed,
    required this.omnivamp,
    required this.physicalLethality,
    required this.physicalVamp,
    required this.resourceMax,
    required this.resourceRegenRate,
    required this.resourceType,
    required this.resourceValue,
    required this.spellVamp,
    required this.tenacity,
  });

  factory ChampionStats.fromJson(Map<String, dynamic> json) => _$ChampionStatsFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionStatsToJson(this);
}

@JsonSerializable()
class FullRunes {
  @JsonKey(name: "generalRunes")
  List<Keystone> generalRunes;
  @JsonKey(name: "keystone")
  Keystone keystone;
  @JsonKey(name: "primaryRuneTree")
  Keystone primaryRuneTree;
  @JsonKey(name: "secondaryRuneTree")
  Keystone secondaryRuneTree;
  @JsonKey(name: "statRunes")
  List<StatRune> statRunes;

  FullRunes({
    required this.generalRunes,
    required this.keystone,
    required this.primaryRuneTree,
    required this.secondaryRuneTree,
    required this.statRunes,
  });

  factory FullRunes.fromJson(Map<String, dynamic> json) => _$FullRunesFromJson(json);

  Map<String, dynamic> toJson() => _$FullRunesToJson(this);
}

@JsonSerializable()
class Keystone {
  @JsonKey(name: "displayName")
  String displayName;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "rawDescription")
  String rawDescription;
  @JsonKey(name: "rawDisplayName")
  String rawDisplayName;

  Keystone({
    required this.displayName,
    required this.id,
    required this.rawDescription,
    required this.rawDisplayName,
  });

  factory Keystone.fromJson(Map<String, dynamic> json) => _$KeystoneFromJson(json);

  Map<String, dynamic> toJson() => _$KeystoneToJson(this);
}

@JsonSerializable()
class StatRune {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "rawDescription")
  String rawDescription;

  StatRune({
    required this.id,
    required this.rawDescription,
  });

  factory StatRune.fromJson(Map<String, dynamic> json) => _$StatRuneFromJson(json);

  Map<String, dynamic> toJson() => _$StatRuneToJson(this);
}

@JsonSerializable()
class AllPlayer {
  @JsonKey(name: "championName")
  String championName;
  @JsonKey(name: "isBot")
  bool isBot;
  @JsonKey(name: "isDead")
  bool isDead;
  @JsonKey(name: "items")
  List<dynamic> items;
  @JsonKey(name: "level")
  int level;
  @JsonKey(name: "position")
  String position;
  @JsonKey(name: "rawChampionName")
  String rawChampionName;
  @JsonKey(name: "rawSkinName")
  String rawSkinName;
  @JsonKey(name: "respawnTimer")
  int respawnTimer;
  @JsonKey(name: "runes")
  Runes runes;
  @JsonKey(name: "scores")
  Scores scores;
  @JsonKey(name: "skinID")
  int skinId;
  @JsonKey(name: "skinName")
  String skinName;
  @JsonKey(name: "summonerName")
  String summonerName;
  @JsonKey(name: "summonerSpells")
  SummonerSpells summonerSpells;
  @JsonKey(name: "team")
  String team;

  AllPlayer({
    required this.championName,
    required this.isBot,
    required this.isDead,
    required this.items,
    required this.level,
    required this.position,
    required this.rawChampionName,
    required this.rawSkinName,
    required this.respawnTimer,
    required this.runes,
    required this.scores,
    required this.skinId,
    required this.skinName,
    required this.summonerName,
    required this.summonerSpells,
    required this.team,
  });

  factory AllPlayer.fromJson(Map<String, dynamic> json) => _$AllPlayerFromJson(json);

  Map<String, dynamic> toJson() => _$AllPlayerToJson(this);
}

@JsonSerializable()
class Runes {
  @JsonKey(name: "keystone")
  Keystone keystone;
  @JsonKey(name: "primaryRuneTree")
  Keystone primaryRuneTree;
  @JsonKey(name: "secondaryRuneTree")
  Keystone secondaryRuneTree;

  Runes({
    required this.keystone,
    required this.primaryRuneTree,
    required this.secondaryRuneTree,
  });

  factory Runes.fromJson(Map<String, dynamic> json) => _$RunesFromJson(json);

  Map<String, dynamic> toJson() => _$RunesToJson(this);
}

@JsonSerializable()
class Scores {
  @JsonKey(name: "assists")
  int assists;
  @JsonKey(name: "creepScore")
  int creepScore;
  @JsonKey(name: "deaths")
  int deaths;
  @JsonKey(name: "kills")
  int kills;
  @JsonKey(name: "wardScore")
  int wardScore;

  Scores({
    required this.assists,
    required this.creepScore,
    required this.deaths,
    required this.kills,
    required this.wardScore,
  });

  factory Scores.fromJson(Map<String, dynamic> json) => _$ScoresFromJson(json);

  Map<String, dynamic> toJson() => _$ScoresToJson(this);
}

@JsonSerializable()
class SummonerSpells {
  @JsonKey(name: "summonerSpellOne")
  E summonerSpellOne;
  @JsonKey(name: "summonerSpellTwo")
  E summonerSpellTwo;

  SummonerSpells({
    required this.summonerSpellOne,
    required this.summonerSpellTwo,
  });

  factory SummonerSpells.fromJson(Map<String, dynamic> json) => _$SummonerSpellsFromJson(json);

  Map<String, dynamic> toJson() => _$SummonerSpellsToJson(this);
}

@JsonSerializable()
class Events {
  @JsonKey(name: "Events")
  List<Event> events;

  Events({
    required this.events,
  });

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);
}

@JsonSerializable()
class Event {
  @JsonKey(name: "EventID")
  int eventId;
  @JsonKey(name: "EventName")
  String eventName;
  @JsonKey(name: "EventTime")
  int eventTime;

  Event({
    required this.eventId,
    required this.eventName,
    required this.eventTime,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class GameDataClass {
  @JsonKey(name: "gameMode")
  String gameMode;
  @JsonKey(name: "gameTime")
  double gameTime;
  @JsonKey(name: "mapName")
  String mapName;
  @JsonKey(name: "mapNumber")
  int mapNumber;
  @JsonKey(name: "mapTerrain")
  String mapTerrain;

  GameDataClass({
    required this.gameMode,
    required this.gameTime,
    required this.mapName,
    required this.mapNumber,
    required this.mapTerrain,
  });

  factory GameDataClass.fromJson(Map<String, dynamic> json) => _$GameDataClassFromJson(json);

  Map<String, dynamic> toJson() => _$GameDataClassToJson(this);
}
