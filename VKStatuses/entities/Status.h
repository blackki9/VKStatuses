//
//  Status.h
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CoreData+MagicalRecord.h>
@class StatusGroup;

@interface Status : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSSet *groups;
@end

@interface Status (CoreDataGeneratedAccessors)

- (void)addGroupsObject:(StatusGroup *)value;
- (void)removeGroupsObject:(StatusGroup *)value;
- (void)addGroups:(NSSet *)values;
- (void)removeGroups:(NSSet *)values;

@end
