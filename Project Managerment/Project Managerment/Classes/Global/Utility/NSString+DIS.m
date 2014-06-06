//
//  NSString+DIS.m
//  iOSUtility
//
//  Created by QuangPC on 2/19/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import "NSString+DIS.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (DIS)

#pragma mark -
#pragma mark Class methods
static char base64EncodingTable[64] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};

+ (NSString *)base64StringFromData: (NSData *)data length: (int)length {
    unsigned long ixtext, lentext;
    long ctremaining;
    unsigned char input[3], output[4];
    short i, charsonline = 0, ctcopy;
    const unsigned char *raw;
    NSMutableString *result;
    
    lentext = [data length];
    if (lentext < 1)
        return @"";
    result = [NSMutableString stringWithCapacity: lentext];
    raw = [data bytes];
    ixtext = 0;
    
    while (true) {
        ctremaining = lentext - ixtext;
        if (ctremaining <= 0)
            break;
        for (i = 0; i < 3; i++) {
            unsigned long ix = ixtext + i;
            if (ix < lentext)
                input[i] = raw[ix];
            else
                input[i] = 0;
        }
        output[0] = (input[0] & 0xFC) >> 2;
        output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
        output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
        output[3] = input[2] & 0x3F;
        ctcopy = 4;
        switch (ctremaining) {
            case 1:
                ctcopy = 2;
                break;
            case 2:
                ctcopy = 3;
                break;
        }
        
        for (i = 0; i < ctcopy; i++)
            [result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
        
        for (i = ctcopy; i < 4; i++)
            [result appendString: @"="];
        
        ixtext += 3;
        charsonline += 4;
        
        if ((length > 0) && (charsonline >= length))
            charsonline = 0;
    }
    return result;
}

+ (NSString *)stringWithUUID {
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
	NSString *UUIDstring = (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
	CFRelease(uuidObj);
	return UUIDstring;
}

#pragma mark -
#pragma mark Instance methods
- (BOOL)isValidEmail {
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isWhitespaceAndNewlines {
    NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![whitespace characterIsMember:c]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)isEmptyOrWhitespace {
    return !self.length ||
    ![self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length;
}

- (NSString *)md5 {
	const char* string = [self UTF8String];
	unsigned char result[16];
	CC_MD5(string, (CC_LONG)strlen(string), result);
	NSString * hash = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                       result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                       result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
    
	return [hash lowercaseString];
}

- (NSString *)trimWhiteSpace {
	NSMutableString *s = [self mutableCopy];
	CFStringTrimWhitespace ((CFMutableStringRef) s);
	return (NSString *) [s copy];
}

- (NSString *)removeWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

// even in the middle, like strange whitespace due &nbsp;
- (NSString *)removeAllWhitespaces {
    return [[self componentsSeparatedByCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString: @""];
}

- (NSString *)replaceAllWhitespacesWithSpace {
    return [[self componentsSeparatedByCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString: @" "];
}

- (NSString *)objcVariableNameStyleToDBNameStyle {
    NSMutableArray *array1 = [NSMutableArray array];
    NSInteger currentLocation = 0;
    NSInteger location = 1;
    for (; location < self.length; location ++) {
        NSString *sub = [self substringWithRange:NSMakeRange(location, 1)];
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[sub characterAtIndex:0]]) {
            NSString *addedString = [self substringWithRange:NSMakeRange(currentLocation, location - currentLocation)];
            [array1 addObject:[addedString lowercaseString]];
            currentLocation = location;
        }
    }
    [array1 addObject:[[self substringWithRange:NSMakeRange(currentLocation, location - currentLocation)] lowercaseString]];
    return [array1 componentsJoinedByString:@"_"];
}

- (float) getHeightWithFont:(UIFont*)font andWidth:(float)width{
    CGSize expectedSize;
    expectedSize = [self sizeWithFont:font
                         constrainedToSize:CGSizeMake(width - 10, CGFLOAT_MAX)
                             lineBreakMode:NSLineBreakByWordWrapping];
    
    return ceilf(expectedSize.height);
}

- (float) getWidthWithFont:(UIFont*)font andHeight:(float)height{
    CGSize expectedSize;
    expectedSize = [self sizeWithFont:font
                    constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)
                        lineBreakMode:NSLineBreakByWordWrapping];
    
    return expectedSize.width;
}

- (BOOL)isNumber
{
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789,."] invertedSet];
    if ([self rangeOfCharacterFromSet:characterSet].location != NSNotFound)
    {
        return NO;
    }
    else
        return YES;
}

- (BOOL) isNumberWithoutDecimal
{
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    if ([self rangeOfCharacterFromSet:characterSet].location != NSNotFound)
    {
        return NO;
    }
    else
        return YES;
}

- (BOOL)isDecimal
{
    if ([self isNumber]) {
        return ([self doubleValue]-(int)[self doubleValue] != 0);
    }
    return NO;
}

- (BOOL)isDecimalNumberWithTwoDecimal
{
    NSString * newString = self;
    NSString *expression = @"^([0-9]+)?(\\.([0-9]{1,2})?)?$";
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:newString options:0 range:NSMakeRange(0, [newString length])];
    if (numberOfMatches == 0)
        return NO;
    return YES;
}

-(BOOL) checkValidNumberOfCellBudgets
{
    if ([self isEqualToString:@""]) {
        return TRUE;
    }
    
//    NSString *regEx = @"0|(^[1-9](\\d*.?[0-9]+)*)";
    NSString *regEx = @"\\d*";
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regEx];
    return [regExPredicate evaluateWithObject: self];
}

- (BOOL)isOnlyNumber{
    if (self.length!=0) {
        NSString *regEx = @"^[0-9](\\d*.?[0-9]+)*";
        NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regEx];
        return [regExPredicate evaluateWithObject: self];
    }
    return NO;
}

- (NSString *)trimToValidNumber{
    NSString *returnString = [self copy];
    returnString = [returnString trimWhiteSpace];
    while (returnString.length >= 2 && [[returnString substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"00"]) {
        returnString = [returnString substringWithRange:NSMakeRange(1, returnString.length - 1)];
    }
    return returnString;
}

- (NSString *)trimToValidText{
    NSString *returnString = [self copy];
    
    while ([returnString characterAtIndex:0]==' ') {
        returnString = [returnString substringWithRange:NSMakeRange(1, returnString.length-1)];
    }
    
    while ([returnString characterAtIndex:returnString.length-1]==' ') {
        returnString = [returnString substringWithRange:NSMakeRange(0, returnString.length-1)];
    }

    NSCharacterSet *spaces = [NSCharacterSet whitespaceCharacterSet];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF != ''"];
    NSArray *tempArray = [[returnString componentsSeparatedByCharactersInSet:spaces] filteredArrayUsingPredicate:predicate];
    returnString = [tempArray componentsJoinedByString:@" "];
    
    return returnString;
}

- (NSDate *)dateInUTCWithFormat:(NSString *)format
{
    NSDate * localTime = nil;
	static NSDateFormatter* df_local;
    if (!df_local) {
        df_local = [[NSDateFormatter alloc] init];
        [df_local setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    }
	[df_local setDateFormat:format];
	
	localTime = [df_local dateFromString:self];
    return localTime;
}

- (NSString *)dateInUTCTimeWithLocalFormat:(NSString *)localTimeFormat andUTCFormat:(NSString *)UTCTimeFormat
{
    static NSDateFormatter *df_utc;
    static NSDateFormatter *df_local;
    NSString * UTCTime = @"";
    if (!df_utc) {
        df_utc = [[NSDateFormatter alloc] init];
        [df_utc setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    }
    [df_utc setDateFormat:UTCTimeFormat];
    
    if (!df_local) {
        df_local = [[NSDateFormatter alloc] init];
        [df_local setTimeZone:[NSTimeZone localTimeZone]];
    }
    [df_local setDateFormat:localTimeFormat];
    
    NSDate * localDate = [df_local dateFromString:self];
    UTCTime = [df_utc stringFromDate:localDate];
	
	return [UTCTime copy];
}
@end



























