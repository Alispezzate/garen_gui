// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameData _$GameDataFromJson(Map<String, dynamic> json) => GameData(
      activePlayer:
          ActivePlayer.fromJson(json['activePlayer'] as Map<String, dynamic>),
      allPlayers: (json['allPlayers'] as List<dynamic>)
          .map((e) => AllPlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: Events.fromJson(json['events'] as Map<String, dynamic>),
      gameData:
          GameDataClass.fromJson(json['gameData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameDataToJson(GameData instance) => <String, dynamic>{
      'activePlayer': instance.activePlayer,
      'allPlayers': instance.allPlayers,
      'events': instance.events,
      'gameData': instance.gameData,
    };

ActivePlayer _$ActivePlayerFromJson(Map<String, dynamic> json) => ActivePlayer(
      abilities: Abilities.fromJson(json['abilities'] as Map<String, dynamic>),
      championStats:
          ChampionStats.fromJson(json['championStats'] as Map<String, dynamic>),
      currentGold: json['currentGold'] as int,
      fullRunes: FullRunes.fromJson(json['fullRunes'] as Map<String, dynamic>),
      level: json['level'] as int,
      summonerName: json['summonerName'] as String,
      teamRelativeColors: json['teamRelativeColors'] as bool,
    );

Map<String, dynamic> _$ActivePlayerToJson(ActivePlayer instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'championStats': instance.championStats,
      'currentGold': instance.currentGold,
      'fullRunes': instance.fullRunes,
      'level': instance.level,
      'summonerName': instance.summonerName,
      'teamRelativeColors': instance.teamRelativeColors,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      e: E.fromJson(json['E'] as Map<String, dynamic>),
      passive: E.fromJson(json['Passive'] as Map<String, dynamic>),
      q: E.fromJson(json['Q'] as Map<String, dynamic>),
      r: E.fromJson(json['R'] as Map<String, dynamic>),
      w: E.fromJson(json['W'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'E': instance.e,
      'Passive': instance.passive,
      'Q': instance.q,
      'R': instance.r,
      'W': instance.w,
    };

E _$EFromJson(Map<String, dynamic> json) => E(
      abilityLevel: json['abilityLevel'] as int?,
      displayName: json['displayName'] as String,
      id: json['id'] as String?,
      rawDescription: json['rawDescription'] as String,
      rawDisplayName: json['rawDisplayName'] as String,
    );

Map<String, dynamic> _$EToJson(E instance) => <String, dynamic>{
      'abilityLevel': instance.abilityLevel,
      'displayName': instance.displayName,
      'id': instance.id,
      'rawDescription': instance.rawDescription,
      'rawDisplayName': instance.rawDisplayName,
    };

ChampionStats _$ChampionStatsFromJson(Map<String, dynamic> json) =>
    ChampionStats(
      abilityHaste: json['abilityHaste'] as int,
      abilityPower: json['abilityPower'] as int,
      armor: json['armor'] as int,
      armorPenetrationFlat: json['armorPenetrationFlat'] as int,
      armorPenetrationPercent: json['armorPenetrationPercent'] as int,
      attackDamage: (json['attackDamage'] as num).toDouble(),
      attackRange: json['attackRange'] as int,
      attackSpeed: (json['attackSpeed'] as num).toDouble(),
      bonusArmorPenetrationPercent: json['bonusArmorPenetrationPercent'] as int,
      bonusMagicPenetrationPercent: json['bonusMagicPenetrationPercent'] as int,
      critChance: json['critChance'] as int,
      critDamage: json['critDamage'] as int,
      currentHealth: json['currentHealth'] as int,
      healShieldPower: json['healShieldPower'] as int,
      healthRegenRate: (json['healthRegenRate'] as num).toDouble(),
      lifeSteal: json['lifeSteal'] as int,
      magicLethality: json['magicLethality'] as int,
      magicPenetrationFlat: json['magicPenetrationFlat'] as int,
      magicPenetrationPercent: json['magicPenetrationPercent'] as int,
      magicResist: json['magicResist'] as int,
      maxHealth: json['maxHealth'] as int,
      moveSpeed: json['moveSpeed'] as int,
      omnivamp: json['omnivamp'] as int,
      physicalLethality: json['physicalLethality'] as int,
      physicalVamp: json['physicalVamp'] as int,
      resourceMax: json['resourceMax'] as int,
      resourceRegenRate: json['resourceRegenRate'] as int,
      resourceType: json['resourceType'] as String,
      resourceValue: json['resourceValue'] as int,
      spellVamp: json['spellVamp'] as int,
      tenacity: json['tenacity'] as int,
    );

Map<String, dynamic> _$ChampionStatsToJson(ChampionStats instance) =>
    <String, dynamic>{
      'abilityHaste': instance.abilityHaste,
      'abilityPower': instance.abilityPower,
      'armor': instance.armor,
      'armorPenetrationFlat': instance.armorPenetrationFlat,
      'armorPenetrationPercent': instance.armorPenetrationPercent,
      'attackDamage': instance.attackDamage,
      'attackRange': instance.attackRange,
      'attackSpeed': instance.attackSpeed,
      'bonusArmorPenetrationPercent': instance.bonusArmorPenetrationPercent,
      'bonusMagicPenetrationPercent': instance.bonusMagicPenetrationPercent,
      'critChance': instance.critChance,
      'critDamage': instance.critDamage,
      'currentHealth': instance.currentHealth,
      'healShieldPower': instance.healShieldPower,
      'healthRegenRate': instance.healthRegenRate,
      'lifeSteal': instance.lifeSteal,
      'magicLethality': instance.magicLethality,
      'magicPenetrationFlat': instance.magicPenetrationFlat,
      'magicPenetrationPercent': instance.magicPenetrationPercent,
      'magicResist': instance.magicResist,
      'maxHealth': instance.maxHealth,
      'moveSpeed': instance.moveSpeed,
      'omnivamp': instance.omnivamp,
      'physicalLethality': instance.physicalLethality,
      'physicalVamp': instance.physicalVamp,
      'resourceMax': instance.resourceMax,
      'resourceRegenRate': instance.resourceRegenRate,
      'resourceType': instance.resourceType,
      'resourceValue': instance.resourceValue,
      'spellVamp': instance.spellVamp,
      'tenacity': instance.tenacity,
    };

FullRunes _$FullRunesFromJson(Map<String, dynamic> json) => FullRunes(
      generalRunes: (json['generalRunes'] as List<dynamic>)
          .map((e) => Keystone.fromJson(e as Map<String, dynamic>))
          .toList(),
      keystone: Keystone.fromJson(json['keystone'] as Map<String, dynamic>),
      primaryRuneTree:
          Keystone.fromJson(json['primaryRuneTree'] as Map<String, dynamic>),
      secondaryRuneTree:
          Keystone.fromJson(json['secondaryRuneTree'] as Map<String, dynamic>),
      statRunes: (json['statRunes'] as List<dynamic>)
          .map((e) => StatRune.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FullRunesToJson(FullRunes instance) => <String, dynamic>{
      'generalRunes': instance.generalRunes,
      'keystone': instance.keystone,
      'primaryRuneTree': instance.primaryRuneTree,
      'secondaryRuneTree': instance.secondaryRuneTree,
      'statRunes': instance.statRunes,
    };

Keystone _$KeystoneFromJson(Map<String, dynamic> json) => Keystone(
      displayName: json['displayName'] as String,
      id: json['id'] as int,
      rawDescription: json['rawDescription'] as String,
      rawDisplayName: json['rawDisplayName'] as String,
    );

Map<String, dynamic> _$KeystoneToJson(Keystone instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'id': instance.id,
      'rawDescription': instance.rawDescription,
      'rawDisplayName': instance.rawDisplayName,
    };

StatRune _$StatRuneFromJson(Map<String, dynamic> json) => StatRune(
      id: json['id'] as int,
      rawDescription: json['rawDescription'] as String,
    );

Map<String, dynamic> _$StatRuneToJson(StatRune instance) => <String, dynamic>{
      'id': instance.id,
      'rawDescription': instance.rawDescription,
    };

AllPlayer _$AllPlayerFromJson(Map<String, dynamic> json) => AllPlayer(
      championName: json['championName'] as String,
      isBot: json['isBot'] as bool,
      isDead: json['isDead'] as bool,
      items: json['items'] as List<dynamic>,
      level: json['level'] as int,
      position: json['position'] as String,
      rawChampionName: json['rawChampionName'] as String,
      rawSkinName: json['rawSkinName'] as String,
      respawnTimer: json['respawnTimer'] as int,
      runes: Runes.fromJson(json['runes'] as Map<String, dynamic>),
      scores: Scores.fromJson(json['scores'] as Map<String, dynamic>),
      skinId: json['skinID'] as int,
      skinName: json['skinName'] as String,
      summonerName: json['summonerName'] as String,
      summonerSpells: SummonerSpells.fromJson(
          json['summonerSpells'] as Map<String, dynamic>),
      team: json['team'] as String,
    );

Map<String, dynamic> _$AllPlayerToJson(AllPlayer instance) => <String, dynamic>{
      'championName': instance.championName,
      'isBot': instance.isBot,
      'isDead': instance.isDead,
      'items': instance.items,
      'level': instance.level,
      'position': instance.position,
      'rawChampionName': instance.rawChampionName,
      'rawSkinName': instance.rawSkinName,
      'respawnTimer': instance.respawnTimer,
      'runes': instance.runes,
      'scores': instance.scores,
      'skinID': instance.skinId,
      'skinName': instance.skinName,
      'summonerName': instance.summonerName,
      'summonerSpells': instance.summonerSpells,
      'team': instance.team,
    };

Runes _$RunesFromJson(Map<String, dynamic> json) => Runes(
      keystone: Keystone.fromJson(json['keystone'] as Map<String, dynamic>),
      primaryRuneTree:
          Keystone.fromJson(json['primaryRuneTree'] as Map<String, dynamic>),
      secondaryRuneTree:
          Keystone.fromJson(json['secondaryRuneTree'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunesToJson(Runes instance) => <String, dynamic>{
      'keystone': instance.keystone,
      'primaryRuneTree': instance.primaryRuneTree,
      'secondaryRuneTree': instance.secondaryRuneTree,
    };

Scores _$ScoresFromJson(Map<String, dynamic> json) => Scores(
      assists: json['assists'] as int,
      creepScore: json['creepScore'] as int,
      deaths: json['deaths'] as int,
      kills: json['kills'] as int,
      wardScore: json['wardScore'] as int,
    );

Map<String, dynamic> _$ScoresToJson(Scores instance) => <String, dynamic>{
      'assists': instance.assists,
      'creepScore': instance.creepScore,
      'deaths': instance.deaths,
      'kills': instance.kills,
      'wardScore': instance.wardScore,
    };

SummonerSpells _$SummonerSpellsFromJson(Map<String, dynamic> json) =>
    SummonerSpells(
      summonerSpellOne:
          E.fromJson(json['summonerSpellOne'] as Map<String, dynamic>),
      summonerSpellTwo:
          E.fromJson(json['summonerSpellTwo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SummonerSpellsToJson(SummonerSpells instance) =>
    <String, dynamic>{
      'summonerSpellOne': instance.summonerSpellOne,
      'summonerSpellTwo': instance.summonerSpellTwo,
    };

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
      events: (json['Events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'Events': instance.events,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      eventId: json['EventID'] as int,
      eventName: json['EventName'] as String,
      eventTime: json['EventTime'] as int,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'EventID': instance.eventId,
      'EventName': instance.eventName,
      'EventTime': instance.eventTime,
    };

GameDataClass _$GameDataClassFromJson(Map<String, dynamic> json) =>
    GameDataClass(
      gameMode: json['gameMode'] as String,
      gameTime: (json['gameTime'] as num).toDouble(),
      mapName: json['mapName'] as String,
      mapNumber: json['mapNumber'] as int,
      mapTerrain: json['mapTerrain'] as String,
    );

Map<String, dynamic> _$GameDataClassToJson(GameDataClass instance) =>
    <String, dynamic>{
      'gameMode': instance.gameMode,
      'gameTime': instance.gameTime,
      'mapName': instance.mapName,
      'mapNumber': instance.mapNumber,
      'mapTerrain': instance.mapTerrain,
    };
