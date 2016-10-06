//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by Hoang Cap on 10/6/16.
//  Copyright © 2016 Charlie Fulton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Character.h"
#import "WoWUtils.h"
@interface CharacterTests : XCTestCase

@end

@implementation CharacterTests
{
    // 1
    NSDictionary *_characterDetailJson;
}

// 2
-(void)setUp
{
    // 3
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class]
                             URLForResource:@"character" withExtension:@"json"];
    
    // 4
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    // 5
    id json = [NSJSONSerialization JSONObjectWithData:sampleData
                                              options:kNilOptions
                                                error:&error];
    XCTAssertNotNil(json, @"invalid test data");
    
    
    _characterDetailJson = json;
}

-(void)tearDown
{
    // 6
    _characterDetailJson = nil;
}

// 1
- (void)testCreateCharacterFromDetailJson
{
    // 2
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    XCTAssertNotNil(testGuy1, @"Could not create character from detail json");
    
    // 3
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    XCTAssertNotNil(testGuy2, @"Could not create character from nil data");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
