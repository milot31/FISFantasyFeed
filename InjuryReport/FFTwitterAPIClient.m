//
//  FFTwitterAPIClient.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FFTwitterAPIClient.h"

@implementation FFTwitterAPIClient

+(void)getTwitterStatuses: (NSString *)playerName fromTeam:(NSString *)team withCompletion: (void (^) (NSArray* statuses))completionBlock{
    
    STTwitterAPI *twitter = [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:consumerKey
                                                            consumerSecret:consumerSecret];

    [twitter verifyCredentialsWithUserSuccessBlock:^(NSString *username, NSString *userID) {
        
        NSString *teamString = [self getLocalTweetsForTeam:team];

        NSString *searchQuery = [NSString stringWithFormat:@"(from:Stephania_ESPN OR from:MatthewBerryTMR OR from:thepme OR from:Michael_Fabiano OR from:YahooFootball OR from:evansilva OR from:scotteRotoEx OR from:nfl OR from:espn OR from:sportscenter OR from:TMZ_Sports OR from:ProFootballTalk OR from:pfrumors OR from:SINow OR from:Deadspin OR from:AlberBreer OR %@) AND %@ since:2015-09-01", teamString, playerName];
        
        [twitter getSearchTweetsWithQuery:searchQuery successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
            
            //NSLog(@"TWITTER STATUSES:  %@", statuses);
            
            completionBlock(statuses);
        } errorBlock:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"-- %@", [error localizedDescription]);
        
    }];
}

+(NSString *)getLocalTweetsForTeam:(NSString *)team {
    if ([team isEqual:@"BUF"]) {
        return @"from:SalSports OR from:buffalobills OR from:BuffRumblings OR from:JaySkurski OR from:salmaiorana";
    }
    if ([team isEqual:@"NE"]) {
        return @"from:patriots OR from:MikeReiss OR from:MarkDanielsPJ OR from:DougKyed OR from:patspulpit OR from:BenVolin OR from:PhilAPerry OR from:tomecurran";
    }
    if ([team isEqual:@"IND"]) {
        return @"from:zkeefer OR from:TribStarJames OR from:Colts OR from:Colts OR from:mchappell OR from:MikeWellsNFL OR from:StampedeBlue";
    }
    if ([team isEqual:@"DAL"]) {
        return @"from:dallascowboys OR from:clarencehilljr OR from:jonmachota OR from:fishsports OR from:RickGosselinDMN OR from:espn_watkins OR from:BloggingTheBoys";
    }
    if ([team isEqual:@"NYG"]) {
        return @"from:Giants OR from:DanGrazianoESPN OR from:RVacchianoNYDN OR from:BigBlueView OR from:TomRock_Newsday";
    }
    if ([team isEqual:@"MIA"]) {
        return @"from:MiamiDolphins OR from:thephinsider OR from:chrisperk OR from:JamesWalkerNFL OR from:OmarKelly OR from:SSMiamiDolphins";
    }
    if ([team isEqual:@"CIN"]) {
        return @"from:CincyJungle OR from:ColeyHarvey OR from:Bengals OR from:GeoffHobsonCin OR from:JimOwczarski";
    }
    if ([team isEqual:@"CLE"]) {
        return @"from:Browns OR from:MaryKayCabot OR from:sdoerschukREP OR from:ESPNCleveland OR from:DawgsByNature OR from:TonyGrossi";
    }
    if ([team isEqual:@"DEN"]) {
        return @"from:PostBroncos OR from:9NEWSSports OR from:MileHighReport OR from:MikeKlis OR form:NickiJhabvala";
    }
    if ([team isEqual:@"CHI"]) {
        return @"from:bears_insider OR from:ChicagoBears OR from:BradBiggs OR from:kfishbain OR from:WindyCGridiron OR from:DickersonESPN OR from:BarstoolBigCat";
    }
    if ([team isEqual:@"SEA"]) {
        return @"FieldGulls OR from:Seahawks OR from:CHawk_Talk OR from:gbellseattle OR from:HawksChronicle";
    }
    if ([team isEqual:@"NYJ"]) {
        return @"from:nyjets OR from:BrianCoz OR from:GangGreenNation OR from:Brian_Bassett OR from:DarrylSlater OR from:KMart_LI";
    }
    if ([team isEqual:@"PHI"]) {
        return @"from:EaglesInsider OR from:JimmyKempski OR from:PhiladelphiaSN OR from:kracze OR from:BleedingGreen OR from:Eagles OR from:EliotShorrParks";
    }
    if ([team isEqual:@"JAC"]) {
        return @"from:Jaguars OR from:BigCatCountry OR from:ryanohalloran OR from:johnOehser OR from:ESPNdirocco OR from:JaguarsOnScout OR from:HaysCarlyon";
    }
    if ([team isEqual:@"GB"]) {
        return @"from:JerseyAlGBP OR from:cheeseheadtv OR from:ByRyanWood OR from:acmepackingco OR from:Stucourt OR from:jasonjwilde OR from:RobDemovsky";
    }
    if ([team isEqual:@"BAL"]) {
        return @"from:BMoreBeatdown OR from:CSNRavens IR from:RussellStReport OR from:Ravens OR from:sportguyRSR";
    }
    if ([team isEqual:@"MIN"]) {
        return @"from:vikingsterritory OR from:Vikings OR from:Kevin_VFB OR from:DailtNorseman OR from:AccessVikings OR from:Andrew_Krammer";
    }
    if ([team isEqual:@"PIT"]) {
        return @"from:steelers OR from:Steelersdepot OR from:EdBouchette OR from:dlolleyor OR from:gerrydulac";
    }
    if ([team isEqual:@"WAS"]) {
        return @"from:Redskins OR from:Rich_TandlerCSN OR from:john_keim OR from:HogsHaven OR from:CSNRedskins OR from:Insider";
    }
    if ([team isEqual:@"STL"]) {
        return @"from:nwagoner OR from:RamsNFL OR from:MylesASimmons OR from:jthom1 OR from:STL_RamsNews";
    }
    if ([team isEqual:@"NO"]) {
        return @"from:Saints OR from:nick_underhill OR from:SaintsCSC OR from:KristianGaric OR from:LarryHolder OR from:Kat_Terrell OR from:MikeTriplett";
    }
    if ([team isEqual:@"HOU"]) {
        return @"from:HoustonTexans OR from:McClain_on_NFL OR from:AaronWilson_NFL OR from:batteredblog OR from:taniaganguli OR from:TexansVoice";
    }
    if ([team isEqual:@"KC"]) {
        return @"from:ArrowheadAddict OR from:HerbieTeope OR from:jeff_rosen88 OR from:Chiefs OR from:ArrowheadPride";
    }
    if ([team isEqual:@"TB"]) {
        return @"from:TBBuccaneers OR from:PewterReport OR from:Bucs_Nation OR from:JennaLaineBucs OR from:CommishOnline";
    }
    if ([team isEqual:@"ARI"]) {
        return@"from:AZCardinals OR from:revengeofbirds OR from:mikejurecki OR from:Kyle_Odegard";
    }
    if ([team isEqual:@"ATL"]) {
        return @"from:TheFalcoholic OR from:AtlantaFalcons OR from:FalconsKelsey OR from:FalconsJAdams OR from:DOrlandoAJC OR from:knoxbardeen OR from:vxmcclure23";
    }
    if ([team isEqual:@"SF"]) {
        return @"from:49ers OR from:NinersNation OR from:Joe_Fann OR from:CamInman OR from:SakamotoRyan OR from:MBachCSN";
    }
    if ([team isEqual:@"TEN"]) {
        return @"from:Titans OR from:TitansMCM OR from:JasonWolf OR from:PaulKuharskyNFL OR from:glennonsports";
    }
    if ([team isEqual:@"SD"]) {
        return @"from:BFTB_Chargers OR from:eric_d_williams OR from:Chargers OR from:BB_Chargers";
    }
    if ([team isEqual:@"DET"]) {
        return @"from:Lions OR from:PrideOfDetroit OR from:davebirkett OR from:LionsMLive OR from:Newslions OR from:mikerothstein";
    }
    if ([team isEqual:@"CAR"]) {
        return @"from:Panthers OR from:josephperson OR from:CatScratchReadr OR from:mikepersinger";
    }
    if ([team isEqual:@"OAK"]) {
        return @"from:RAIDERS OR from:Jimmy_Durkin OR from:SilverBlakPride OR from:LeviDamien OR from:RaidersBeat";
    }
    return nil;
}



@end
