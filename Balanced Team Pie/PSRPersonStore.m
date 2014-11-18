//
//  PSRPersonStore.m
//  Balanced Team Pie
//
//  Created by Peter Srivongse on 11/17/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import "PSRPersonStore.h"
#import "PSRPerson.h"

@interface PSRPersonStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation PSRPersonStore

+ (instancetype)sharedStore
{
    static PSRPersonStore *sharedStore = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
    return sharedStore;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if(self){
        NSString *path = [self itemArchivePath];
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!_privateItems) {
            _privateItems = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingString:@"items.archive"];
}

- (NSArray *)allItems{
    return self.privateItems;
}

- (PSRPerson *)createPerson{
    PSRPerson *person = [[PSRPerson alloc] init];
    
    [self.privateItems addObject:person];
    
    return person;
}

- (void)removeItem:(PSRPerson *)person{
//    NSString *key = person.personKey;
    
    [self.privateItems removeObjectIdenticalTo:person];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex{
    if (fromIndex == toIndex){
        return;
    }
    
    PSRPerson *person = self.privateItems[fromIndex];
    
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    [self.privateItems insertObject:person atIndex:toIndex];
}

- (BOOL)saveChanges{
    NSString *path = [self itemArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}
@end
