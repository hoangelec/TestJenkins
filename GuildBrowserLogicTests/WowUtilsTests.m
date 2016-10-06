//
//  WowUtilsTests.m
//  GuildBrowser
//
//  Created by Hoang Cap on 10/6/16.
//  Copyright © 2016 Charlie Fulton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WoWUtils.h"
@interface WowUtilsTests : XCTestCase

@end

@implementation WowUtilsTests

-(void)testCharacterClassNameLookup
{
    // 2
    XCTAssertEqualObjects(@"Warrior",
                         [WoWUtils classFromCharacterType:1],
                         @"ClassType should be Warrior");
    // 3
    XCTAssertFalse([@"Mage" isEqualToString:[WoWUtils classFromCharacterType:2]]);
    
    // 4
    XCTAssertTrue([@"Paladin" isEqualToString:[WoWUtils classFromCharacterType:2]]);
    // add the rest as an exercise
}

- (void)testRaceTypeLookup
{
    XCTAssertEqualObjects(@"Human", [WoWUtils raceFromRaceType:1]);
    XCTAssertEqualObjects(@"Orc", [WoWUtils raceFromRaceType:2]);
    XCTAssertFalse([@"Night Elf" isEqualToString:[WoWUtils raceFromRaceType:45]]);
    // add the rest as an exercise
}

- (void)testQualityLookup
{
    XCTAssertEqualObjects(@"Grey", [WoWUtils qualityFromQualityType:1]);
    XCTAssertFalse([@"Purple" isEqualToString:[WoWUtils qualityFromQualityType:10]]);
    // add the rest as an exercise
}

// 1
-(void)testCreateCharacterFromDetailJsonProps
{
    XCTAssertEqualObjects(_testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail url is wrong");
    XCTAssertEqualObjects(_testGuy.name, @"Hagrel", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    XCTAssertEqualObjects(_testGuy.realm, @"Borean Tundra", @"realm is wrong");
    XCTAssertEqualObjects(_testGuy.achievementPoints, @3130, @"achievement points is wrong");
    XCTAssertEqualObjects(_testGuy.level,@85, @"level is wrong");
    
    XCTAssertEqualObjects(_testGuy.classType, @"Warrior", @"class type is wrong");
    XCTAssertEqualObjects(_testGuy.race, @"Human", @"race is wrong");
    XCTAssertEqualObjects(_testGuy.gender, @"Male", @"gener is wrong");
    XCTAssertEqualObjects(_testGuy.averageItemLevel, @379, @"avg item level is wrong");
    XCTAssertEqualObjects(_testGuy.averageItemLevelEquipped, @355, @"avg item level is wrong");
}

// 2
-(void)testCreateCharacterFromDetailJsonValidateItems
{
    XCTAssertEqualObjects(_testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.wristItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.waistItem.name,@"Girdle of the Queen's Champion", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.handsItem.name,@"Time Strand Gauntlets", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.shoulderItem.name,@"Temporal Pauldrons", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.chestItem.name,@"Ruthless Gladiator's Plate Chestpiece", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.fingerItem1.name,@"Thrall's Gratitude", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.fingerItem2.name,@"Breathstealer Band", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.shirtItem.name,@"Black Swashbuckler's Shirt", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.tabardItem.name,@"Tabard of the Wildhammer Clan", @"nname is wrong");
    XCTAssertEqualObjects(_testGuy.headItem.name,@"Vicious Pyrium Helm", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.backItem.name,@"Cloak of the Royal Protector", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.legsItem.name,@"Bloodhoof Legguards", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.feetItem.name,@"Treads of the Past", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.mainHandItem.name,@"Axe of the Tauren Chieftains", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.offHandItem.name,nil, @"offhand should be nil");
    XCTAssertEqualObjects(_testGuy.trinketItem1.name,@"Rosary of Light", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.trinketItem2.name,@"Bone-Link Fetish", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.rangedItem.name,@"Ironfeather Longbow", @"neck name is wrong");
}

@end
