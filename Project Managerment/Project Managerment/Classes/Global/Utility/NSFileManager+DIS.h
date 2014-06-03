//
//  NSFileManager+DIS.h
//  iOSUtility
//
//  Created by QuangPC on 2/19/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *NSDocumentsFolder(void);
NSString *NSLibraryFolder(void);
NSString *NSBundleFolder(void);

@interface NSFileManager (DIS)

+ (NSString *)pathForItemNamed:(NSString *)fname inFolder:(NSString *)path;

+ (NSString *)pathForDocumentNamed:(NSString *)fname;

+ (NSString *)pathForBundleDocumentNamed:(NSString *)fname;

+ (NSArray *)pathsForItemsMatchingExtension:(NSString *)ext inFolder:(NSString *)path;

+ (NSArray *)pathsForDocumentsMatchingExtension:(NSString *)ext;

+ (NSArray *)pathsForBundleDocumentsMatchingExtension:(NSString *)ext;

+ (NSArray *)filesInFolder:(NSString *)path;


@end
