//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [self solveTrivia];  // we are calling method to run it. self because this method is defind in this file. Two parts of this method call. Method name: solveTrivia, and self(receiver) where the definition of this method does exist. Whithin this file.
    
    return YES;
}

/*

Write your method here
 
 What is the only state whoes capital contains none of the characters as the state name?

*/

-(NSString *)solveTrivia {
    
    
    // we choose NSDictionary because relationship matters: Keys : Value pare always stay together, but the ordering of Key:Value pairs will be random.
    NSDictionary *StatesAndCapitaLs= @{@"Alabama":@"Montgomery",
                                   @"Alaska":@"Juneau",
                                   @"Arizona":@"Phoenix",
                                   @"Arkansas":@"Little Rock",
                                   @"California":@"Sacramento",
                                   @"Colorado":@"Denver",
                                   @"Connecticut":@"Hartford",
                                   @"Delaware":@"Dover",
                                   @"Florida":@"Tallahassee",
                                   @"Georgia":@"Atlanta",
                                   @"Hawaii":@"Honolulu",
                                   @"Idaho":@"Boise",
                                   @"Illinois":@"Springfield",
                                   @"Indiana":@"Indianapolis",
                                   @"Iowa":@"Des Moines",
                                   @"Kansas":@"Topeka",
                                   @"Kentucky":@"Frankfort",
                                   @"Lousiana":@"Baton Rouge",
                                   @"Maine":@"Augusta",
                                   @"Maryland":@"Annapolis",
                                   @"Massassachusetts":@"Boston",
                                   @"Michigan":@"Lansing",
                                   @"Minnesota":@"Saint Paul",
                                   @"Mississippi":@"Jackson",
                                   @"Missouri":@"Jefferson City",
                                   @"Montana":@"Helena",
                                   @"Nebraska":@"Lincoln",
                                   @"Nevada":@"Carson City",
                                   @"New Hampshire":@"Concord",
                                   @"New Jersey":@"Trenton",
                                   @"New Mexico":@"Santa Fe",
                                   @"New York":@"Albany",
                                   @"North Carolina":@"Raleigh",
                                   @"North Dakota":@"Bismarck",
                                   @"Ohio":@"Columbus",
                                   @"Oklahoma":@"Oklahoma City",
                                   @"Oregon":@"Salem",
                                   @"Pennsylvania":@"Harrisburg",
                                   @"Rhode Island":@"Providence",
                                   @"South Carolina":@"Columbia",
                                   @"South Dakota":@"Pierre",
                                   @"Tennessee":@"Nashville",
                                   @"Texas":@"Austin",
                                   @"Utah":@"Salt Lake City",
                                   @"Vermont":@"Montpelier",
                                   @"Virgina":@"Richmond",
                                   @"Washington":@"Olympia",
                                   @"West Virginia":@"Charleston",
                                   @"Wisconsin":@"Madison",
                                   @"Wyoming":@"Cheyenne"}; // dose not matter if the list alphabetised or not.
    
    
    
    for (NSString *state in StatesAndCapitaLs) {
        NSString *city = StatesAndCapitaLs[state]; // To do the same for every single state : city pair. Iterating over StatesAndCapitaLs  Dictionary. NSString type *state because when you do a for in loop over dictionary you get the keys. Our keys are the state.
        
        // NSString *city = StatesAndCapitaLs[@"Alabama"];
        
        // NSString *state = @"Alabama";
    
    
        
        
// Search separate (or split) NSString by character:
    
//   The separator string can't be blank. If you need to separate a string into its individual characters, just loop through the length of the string and convert each char into a new string:
    
        
        //    NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[myString length]]; // make new mutable array called characters
    
//it iterates all over the array
    
        //    for (NSInteger i=0; i < [myString length]; i++) {
        //    NSString *ichar  = [NSString stringWithFormat:@"%c", [myString characterAtIndex:i]];
        
// NSString yields each character at index
        
        //    [characters addObject:ichar]; //and addes ichar character to characters array.
        
        //    }
    
        
        //Get characters for the State
        
        NSMutableArray *charactersInState = [[NSMutableArray alloc] initWithCapacity:[state length]];
        
        //
        //Returns an mutable array, initialized with enough memory to initially hold a given number of objects.
        //An array initialized with enough memory to hold numItems objects. The returned object might be different than the original receiver.
        //initWithCapacity:0 will request an array with absolutely no allocated space. -init says "I have no expectations for this array; I'll either be adding to and removing from it a lot, or it will likely be pretty small." -initWithCapacity: says "I expect this array to have no more than this many elements for the foreseeable future."
        //Using initWithCapacity:n does not preclude you from adding more than n objects to the array. It's just a suggestion so NSArray can try to do some optimization under-the-hood.
        
        //method called length gives us the number of characters in the string.
        
        for (NSUInteger i=0; i < [state length]; i++) { //iterate over every character in the state.
            NSString *ichar  = [NSString stringWithFormat:@"%c", [state characterAtIndex:i]]; // The item that you access via objectAtIndex: is not created, you just get a reference to it. 'characterAtIndex:i' Returns the character at a given array position, given by index.
            [charactersInState addObject:ichar];
        }
        
        BOOL correctAnswer = true; // We asume that this is correct answer.
        
        
        
        //NSLog(@"The Characters of the state are");
        for (NSString *stateCharacter in charactersInState) {
            //NSLog(@"%@", stateCharacter);
            
            // the need to be inside of this loop because we want to iterate over the city for every single letter in our state, and only place I have  every letter individualized is inside of this loop
            
            // Get Characters for the City
            NSMutableArray *characterInCity = [[NSMutableArray alloc] initWithCapacity:[city length]];
            
            for (NSUInteger i=0; i < [city length]; i++) {  //iterate over every character in the city.

                NSString *ichar  = [NSString stringWithFormat:@"%c", [city characterAtIndex:i]];
                [characterInCity addObject:ichar];
            }
            
            //Done getting characters
            
            // NSLog(@"%@", characterInCity);
            
            for (NSString *cityCharacter in characterInCity) {
                
                NSString *uppercaseCity = [cityCharacter uppercaseString];
                NSString *uppercaseState = [stateCharacter uppercaseString];
                
                if ([uppercaseCity isEqualToString:uppercaseState]) { // Case - insensitive search to check if cityCharacter string is equal to stateCharacter string. If they are equal
                    
                    correctAnswer = false; // if it is not a corect answer we don't want NSLog. We want to continue to the next state : capital pair.
                    
                    // NSLog(@"Not the correct answer because: %@ is in both", stateCharacter);
                }
            }
            
            // NSLog(@"%@", characterInCity);
            
        }
        if(correctAnswer){
            NSLog(@"%@ is the correct answer",state);
            
            return state;
        }
        
    }
    
    
    return @""; // If after iterating over allall states I didn't find correct answer I return empty string @"" not 'nil'!!! Correct answer we are looking for is @"South Dacota"

    
}


@end
