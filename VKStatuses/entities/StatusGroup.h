//
//  StatusGroup.h
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StatusGroup : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *statuses;
@end

@interface StatusGroup (CoreDataGeneratedAccessors)

- (void)addStatusesObject:(NSManagedObject *)value;
- (void)removeStatusesObject:(NSManagedObject *)value;
- (void)addStatuses:(NSSet *)values;
- (void)removeStatuses:(NSSet *)values;

@end
