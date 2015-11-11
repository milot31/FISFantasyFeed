//
//  Player+CoreDataProperties.h
//  InjuryReport
//
//  Created by Linda NG on 11/10/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface Player (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *fullName;
@property (nullable, nonatomic, retain) NSString *position;
@property (nullable, nonatomic, retain) NSString *team;

@end

NS_ASSUME_NONNULL_END
