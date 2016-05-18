//
//  Calculator.m
//  cementTool
//
//  Created by AOCC2013 on 13-2-21.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator



-(id)init
{
    if (self = [super init])
    {
        plantName = [NSString new];
        rawGrindingProcess = [NSString new];
        burningProcess = [NSString new];
        cementGrindingProcess = [NSString new];
        coolerType = [NSString new];
        dryingRequirment = [NSString new];
        kilnGasBypass = [NSString new];
    }
    return self;
}

/*-(void)encodeWithCoder:(NSCoder *)enCoder{
    [enCoder encodeObject:self.plantName forKey:@"name"];
}

-(id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init]){
        self.plantName = [decoder decodeObjectForKey:@"name"];
    }
    return self;
}*/   //暂时不采用


- (float)chooseAchievableSPC
{
    if (self.averageClinkerLineCapacity<2500)
    {
        if ([self.rawGrindingProcess isEqualToString:@"Vertical Mill"])
        {
            self.achievableClinkerSPC=68;
        }
        else self.achievableClinkerSPC=75.7;
    }
    else if((self.averageClinkerLineCapacity>=2500)&&(self.averageClinkerLineCapacity<4000))
    {
        if ([self.rawGrindingProcess isEqualToString:@"Vertical Mill"])
        {
            self.achievableClinkerSPC=65;
        }
        else self.achievableClinkerSPC=72.7;
    }
    else if ((self.averageClinkerLineCapacity>=4000)&&(self.averageClinkerLineCapacity<6000)){
        if ([self.rawGrindingProcess isEqualToString:@"Vertical Mill"])
        {
            self.achievableClinkerSPC=56;
        }
        else self.achievableClinkerSPC=63.7;
    } else {
        if ([self.rawGrindingProcess isEqualToString:@"Vertical Mill"])
        {
            self.achievableClinkerSPC=53;
        }
    }
    return self.achievableClinkerSPC;
}

- (float)chooseIntAdvancedSPC{
    if (self.averageClinkerLineCapacity<2500)
    {
        if ([self.rawGrindingProcess isEqualToString:@"Vertical Mill"])
        {
            self.intAdvancedClinkerSPC=66;
        }
        else self.intAdvancedClinkerSPC=73.7;
    }
    else if((self.averageClinkerLineCapacity>=2500)&&(self.averageClinkerLineCapacity<4000))
    {
        if ([self.rawGrindingProcess isEqualToString:@"Vertical Mill"])
        {
            self.intAdvancedClinkerSPC=58;
        }
        else self.intAdvancedClinkerSPC=65.7;
    }
    else  if ((self.averageClinkerLineCapacity>=4000)&&(self.averageClinkerLineCapacity<6000)){
        if ([self.rawGrindingProcess isEqualToString:@"Vertical Mill"])
        {
            self.intAdvancedClinkerSPC=53;
        }
        else self.intAdvancedClinkerSPC=60.7;
    } else {
        if ([self.rawGrindingProcess isEqualToString:@"Vertical Mill"])
        {
            self.intAdvancedClinkerSPC=49;
        }
    }
    return self.intAdvancedClinkerSPC;
    
}
- (float)chooseAchievableSHC{
    if (self.averageClinkerLineCapacity < 2500)
    {
        if ([self.burningProcess isEqualToString:@"Wet Process"])
        {
            self.achievableClinkerSHC = 6322;
        }
        else if ([self.burningProcess isEqualToString:@"Dry Process"])
        {
            self.achievableClinkerSHC = 4470;
        }
        else self.achievableClinkerSHC = 3365;
    }
    else if((self.averageClinkerLineCapacity>=2500)&&(self.averageClinkerLineCapacity<4000))
    {
        if ([self.burningProcess isEqualToString:@"Modern Dry"])
        {
            self.achievableClinkerSHC=3160;
        }
    }
    else if ((self.averageClinkerLineCapacity>=4000)&&(self.averageClinkerLineCapacity<6000))
    {
        if ([self.burningProcess isEqualToString:@"Modern Dry"])
        {
            self.achievableClinkerSHC=3100;
        }
    } else {
        if ([self.burningProcess isEqualToString:@"Modern Dry"])
        {
            self.achievableClinkerSHC=3000;
        }
    }
    return self.achievableClinkerSHC;
}

- (float)chooseIntAdvancedSHC{
    if (self.averageClinkerLineCapacity < 2500)
    {
        if ([self.burningProcess isEqualToString:@"Wet Process"])
        {
            self.intAdvancedClinkerSHC = 5690;
        }
        else if ([self.burningProcess isEqualToString:@"Dry Process"])
        {
            self.intAdvancedClinkerSHC = 3366;
        }
        else self.intAdvancedClinkerSHC = 3160;
    }
    else if((self.averageClinkerLineCapacity>=2500)&&(self.averageClinkerLineCapacity<4000))
    {
        if ([self.burningProcess isEqualToString:@"Modern Dry"])
        {
            self.intAdvancedClinkerSHC=3043;
        }
    }
    else if ((self.averageClinkerLineCapacity>=4000)&&(self.averageClinkerLineCapacity<6000)){
        if ([self.burningProcess isEqualToString:@"Modern Dry"])
        {
            self.intAdvancedClinkerSHC=3000;
        }
    } else {
        if ([self.burningProcess isEqualToString:@"Modern Dry"])
        {
            self.intAdvancedClinkerSHC=2900;
        }
    }
    return self.intAdvancedClinkerSHC;
}


- (float)chooseAchievableFGSPC{
    if (self.totalPlantCementMilloutput < 50)
    {
        if ([self.cementGrindingProcess isEqualToString:@"VerticalMill or RollerPress+BallMill"])
        {
            self.achievableCementFGSPC = 36;
        }
        else self.achievableCementFGSPC = 42;
    }
    else if((self.totalPlantCementMilloutput>=50)&&(self.totalPlantCementMilloutput<100))
    {
        if ([self.cementGrindingProcess isEqualToString:@"VerticalMill or RollerPress+BallMill"])
        {
            self.achievableCementFGSPC=35;
        }
        else self.achievableCementFGSPC = 40;
    }
    else if((self.totalPlantCementMilloutput>=100)&&(self.totalPlantCementMilloutput<150))
    {
        if ([self.cementGrindingProcess isEqualToString:@"VerticalMill or RollerPress+BallMill"])
        {
            self.achievableCementFGSPC=34;
        }
        else self.achievableCementFGSPC = 39;
    } else {
        if ([self.cementGrindingProcess isEqualToString:@"VerticalMill or RollerPress+BallMill"])
        {
            self.achievableCementFGSPC=33;
        }
    }
    return self.achievableCementFGSPC;
}

- (float)chooseIntAdvancedFGSPC{
    if (self.totalPlantCementMilloutput < 50)
    {
        if ([self.cementGrindingProcess isEqualToString:@"VerticalMill or RollerPress+BallMill"])
        {
            self.intAdvancedCementFGSPC = 34;
        }
        else self.intAdvancedCementFGSPC = 40;
    }
    else if((self.totalPlantCementMilloutput>=50)&&(self.totalPlantCementMilloutput<100))
    {
        if ([self.cementGrindingProcess isEqualToString:@"VerticalMill or RollerPress+BallMill"])
        {
            self.intAdvancedCementFGSPC=33;
        }
        else self.intAdvancedCementFGSPC = 38;
    }
    else if((self.totalPlantCementMilloutput>=100)&&(self.totalPlantCementMilloutput<150))
    {
        if ([self.cementGrindingProcess isEqualToString:@"VerticalMill or RollerPress+BallMill"])
        {
            self.intAdvancedCementFGSPC=28;
        }
        else self.intAdvancedCementFGSPC = 33;
    } else {
        if ([self.cementGrindingProcess isEqualToString:@"VerticalMill or RollerPress+BallMill"])
        {
            self.intAdvancedCementFGSPC=27;
        }
    }
    return self.intAdvancedCementFGSPC;
}

- (float)chooseAchievableWHRClinkerSPG
{
    switch (self.averageNumberOfPreheaterStages)
    {
        case 0:            
            if ([self.dryingRequirment isEqualToString:@"H"]) {
                  self.achievableAverageWHRnePowerGeneration = 14.5;
              }
              else if([self.dryingRequirment isEqualToString:@"M"]) {
                  self.achievableAverageWHRnePowerGeneration = 16.2;
              }
              else self.achievableAverageWHRnePowerGeneration = 18;
              break;

        case 2:
            if ([self.dryingRequirment isEqualToString:@"H"])
            {
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.achievableAverageWHRnePowerGeneration = 43;
                    }
                    else self.achievableAverageWHRnePowerGeneration = 46;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.achievableAverageWHRnePowerGeneration = 51;
                }
                else self.achievableAverageWHRnePowerGeneration = 54;
            }
            else if ([self.dryingRequirment isEqualToString:@"M"])
            {
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.achievableAverageWHRnePowerGeneration = 44.75;
                    }
                    else self.achievableAverageWHRnePowerGeneration = 47.75;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.achievableAverageWHRnePowerGeneration = 52.75;
                }
                else self.achievableAverageWHRnePowerGeneration = 55.75;
            }
            else
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
            {
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.achievableAverageWHRnePowerGeneration = 46.5;
                }
                else self.achievableAverageWHRnePowerGeneration = 49.5;
            }
            else if([self.kilnGasBypass isEqualToString:@"Yes"])
            {
                self.achievableAverageWHRnePowerGeneration = 54.5;
            }
            else self.achievableAverageWHRnePowerGeneration = 57.5;
            break;
        
        case 4:
            if ([self.dryingRequirment isEqualToString:@"H"])
            {
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.achievableAverageWHRnePowerGeneration = 25;
                    }
                    else self.achievableAverageWHRnePowerGeneration = 28;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.achievableAverageWHRnePowerGeneration = 33;
                }
                else self.achievableAverageWHRnePowerGeneration = 36;
            }
            else if ([self.dryingRequirment isEqualToString:@"M"])
            {
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.achievableAverageWHRnePowerGeneration = 26.75;
                    }
                    else self.achievableAverageWHRnePowerGeneration = 29.75;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.achievableAverageWHRnePowerGeneration = 34.75;
                }
                else self.achievableAverageWHRnePowerGeneration = 37.75;
            }
            else
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.achievableAverageWHRnePowerGeneration = 28.5;
                    }
                    else self.achievableAverageWHRnePowerGeneration = 31.5;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.achievableAverageWHRnePowerGeneration = 36.5;
                }
                else self.achievableAverageWHRnePowerGeneration = 39.5;
            break;

        case 5:
            if ([self.dryingRequirment isEqualToString:@"H"])
            {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.achievableAverageWHRnePowerGeneration = 28;
                    }
                    else self.achievableAverageWHRnePowerGeneration = 31;
            }
            else if ([self.dryingRequirment isEqualToString:@"M"])
            {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.achievableAverageWHRnePowerGeneration = 29.75;
                    }
                    else self.achievableAverageWHRnePowerGeneration = 32.75;
            }
            else
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.achievableAverageWHRnePowerGeneration = 31.5;
                    }
                    else self.achievableAverageWHRnePowerGeneration = 34.5;
            break;

        case 6:
            if ([self.dryingRequirment isEqualToString:@"H"])
            {
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.achievableAverageWHRnePowerGeneration = 21.5;
                }
                else self.achievableAverageWHRnePowerGeneration = 24.5;
            }
            else if ([self.dryingRequirment isEqualToString:@"M"])
            {
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.achievableAverageWHRnePowerGeneration = 22.25;
                }
                else self.achievableAverageWHRnePowerGeneration = 22.25;
            }
            else
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.achievableAverageWHRnePowerGeneration = 23;
                }
                else self.achievableAverageWHRnePowerGeneration = 26;
            break;
            
        default:
            break;
    }
    return self.achievableAverageWHRnePowerGeneration;
}

- (float)chooseIntAdvancedWHRClinkerSPG{
    if (self.plantClinkerSHC > ([self chooseAchievableSHC]*1.05))
  {
    switch (self.averageNumberOfPreheaterStages)
    {
        case 0:
        {
            if ([self.dryingRequirment isEqualToString:@"H"]) {
                self.intAdvancedAverageWHRnePowerGeneration = 14.5;
            }
            else if([self.dryingRequirment isEqualToString:@"M"]) {
                self.intAdvancedAverageWHRnePowerGeneration = 16.2;
            }
            else self.intAdvancedAverageWHRnePowerGeneration = 18;
            break;
        }
        case 2:
        {
            if ([self.dryingRequirment isEqualToString:@"H"])
            {
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 43;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 46;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 51;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 54;
            }
            else if ([self.dryingRequirment isEqualToString:@"M"])
            {
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 44.75;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 47.75;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 52.75;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 55.75;
            }
            else
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 46.5;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 49.5;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 54.5;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 57.5;
            break;
        }
        case 4:
        {
            if ([self.dryingRequirment isEqualToString:@"H"])
            {
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 25;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 28;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 33;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 36;
            }
            else if ([self.dryingRequirment isEqualToString:@"M"])
            {
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 26.75;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 29.75;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 34.75;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 37.75;
            }
            else
                if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 28.5;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 31.5;
                }
                else if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 36.5;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 39.5;
            break;
        }
        case 5:
        {
            if ([self.dryingRequirment isEqualToString:@"H"])
            {
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 28;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 31;
            }
            else if ([self.dryingRequirment isEqualToString:@"M"])
            {
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 29.75;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 32.75;
            }
            else
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 31.5;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 34.5;
            break;
        }
        case 6:
        {
            if ([self.dryingRequirment isEqualToString:@"H"])
            {
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 21.5;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 24.5;
            }
            else if ([self.dryingRequirment isEqualToString:@"M"])
            {
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 22.25;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 22.25;
            }
            else
                if([self.kilnGasBypass isEqualToString:@"Yes"])
                {
                    self.intAdvancedAverageWHRnePowerGeneration = 23;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 26;
            break;
        }
        default:
            break;
    }
      return self.intAdvancedAverageWHRnePowerGeneration;
  }
    else {
        switch (self.averageNumberOfPreheaterStages)
        {
            case 0:
            {
                if ([self.dryingRequirment isEqualToString:@"H"]) {
                    self.intAdvancedAverageWHRnePowerGeneration = 11.5;
                }
                else if([self.dryingRequirment isEqualToString:@"M"]) {
                    self.intAdvancedAverageWHRnePowerGeneration = 13.2;
                }
                else self.intAdvancedAverageWHRnePowerGeneration = 15;
                break;
            }
            case 2:
            {
                if ([self.dryingRequirment isEqualToString:@"H"])
                {
                    if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                    {
                        if([self.kilnGasBypass isEqualToString:@"Yes"])
                        {
                            self.intAdvancedAverageWHRnePowerGeneration = 40;
                        }
                        else self.intAdvancedAverageWHRnePowerGeneration = 43;
                    }
                    else if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 48;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 51;
                }
                else if ([self.dryingRequirment isEqualToString:@"M"])
                {
                    if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                    {
                        if([self.kilnGasBypass isEqualToString:@"Yes"])
                        {
                            self.intAdvancedAverageWHRnePowerGeneration = 41.75;
                        }
                        else self.intAdvancedAverageWHRnePowerGeneration = 44.75;
                    }
                    else if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 49.75;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 52.75;
                }
                else
                    if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                    {
                        if([self.kilnGasBypass isEqualToString:@"Yes"])
                        {
                            self.intAdvancedAverageWHRnePowerGeneration = 43.5;
                        }
                        else self.intAdvancedAverageWHRnePowerGeneration = 46.5;
                    }
                    else if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 51.5;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 54.5;
                break;
            }
            case 4:
            {
                if ([self.dryingRequirment isEqualToString:@"H"])
                {
                    if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                    {
                        if([self.kilnGasBypass isEqualToString:@"Yes"])
                        {
                            self.intAdvancedAverageWHRnePowerGeneration = 22;
                        }
                        else self.intAdvancedAverageWHRnePowerGeneration = 25;
                    }
                    else if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 30;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 33;
                }
                else if ([self.dryingRequirment isEqualToString:@"M"])
                {
                    if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                    {
                        if([self.kilnGasBypass isEqualToString:@"Yes"])
                        {
                            self.intAdvancedAverageWHRnePowerGeneration = 23.75;
                        }
                        else self.intAdvancedAverageWHRnePowerGeneration = 26.75;
                    }
                    else if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 31.75;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 34.75;
                }
                else
                    if ([self.coolerType isEqualToString:@"Satelite Cooler"])
                    {
                        if([self.kilnGasBypass isEqualToString:@"Yes"])
                        {
                            self.intAdvancedAverageWHRnePowerGeneration = 25.5;
                        }
                        else self.intAdvancedAverageWHRnePowerGeneration = 28.5;
                    }
                    else if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 33.5;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 36.5;
                break;
            }
            case 5:
            {
                if ([self.dryingRequirment isEqualToString:@"H"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 25;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 28;
                }
                else if ([self.dryingRequirment isEqualToString:@"M"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 26.75;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 29.75;
                }
                else
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 28.5;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 31.5;
                break;
            }
            case 6:
            {
                if ([self.dryingRequirment isEqualToString:@"H"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 20;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 23;
                }
                else if ([self.dryingRequirment isEqualToString:@"M"])
                {
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 20.75;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 23.75;
                }
                else
                    if([self.kilnGasBypass isEqualToString:@"Yes"])
                    {
                        self.intAdvancedAverageWHRnePowerGeneration = 21.5;
                    }
                    else self.intAdvancedAverageWHRnePowerGeneration = 24.5;
                break;
            }
            default:
                break;
        }
        return self.intAdvancedAverageWHRnePowerGeneration;
    }
}

- (void)calculateSavings
{
    self.maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction = self.totalPlantClinkerProduction*(self.plantClinkerSPC - [self chooseIntAdvancedSPC])/1000;
    if (self.maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction < 0) {
        self.maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction = 0;
    }
    self.maximumAnnualSavingsOnPowerCostfromClinkerProduction = self.averageSpecificPowerCost*self.maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction;
    self.achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction = self.totalPlantClinkerProduction*(self.plantClinkerSPC - [self chooseAchievableSPC])/1000;
    if (self.achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction < 0) {
        self.achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction = 0;
    }
    self.achievableAnnualSavingsOnPowerCostfromClinkerProduction = self.averageSpecificPowerCost*self.achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction;
    
    self.maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding = self.totalPlantCementProduction*(self.plantCementFGSPC- [self chooseIntAdvancedFGSPC])/1000;
    if (self.maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding < 0) {
        self.maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding = 0;
    }
    self.maximumAnnualSavingsOnPowerCostfromCementFinishGrinding = self.averageSpecificPowerCost*self.maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
    self.achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding = self.totalPlantCementProduction*(self.plantCementFGSPC - [self chooseAchievableFGSPC])/1000;
    if (self.achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding < 0) {
        self.achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding = 0;
    }
    self.achievableAnnualSavingsOnPowerCostfromCementFinishGrinding = self.averageSpecificPowerCost*self.achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
    
    self.maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction = self.totalPlantClinkerProduction*(self.plantClinkerSHC-[self chooseIntAdvancedSHC])/1000;
    if (self.maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction < 0) {
        self.maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction = 0;
    }
    self.maximumAnnualSavingsOnHeatCostfromClinkerProduction = self.maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction*self.averageSpecificHeatCost;
    self.achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction = self.totalPlantClinkerProduction*(self.plantClinkerSHC-[self chooseAchievableSHC])/1000;
    if (self.achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction < 0) {
        self.achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction = 0;
    }
    self.achievableAnnualSavingsOnHeatCostfromClinkerProduction = self.achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction*self.averageSpecificHeatCost;
    
    self.achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration = self.totalPlantClinkerProduction*([self chooseAchievableWHRClinkerSPG]-self.averageWHRnePowerGeneration)/1000;
    if (self.achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration < 0) {
        self.achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration = 0;
    }
    self.achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration = self.achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration * self.averageSpecificPowerCost;
    
}

-(float) calculateTotalSavingsOnDisplay
{
    float leftTopSavings = self.plantClinkerSPC < self.achievableClinkerSPC ? self.maximumAnnualSavingsOnPowerCostfromClinkerProduction : self.achievableAnnualSavingsOnPowerCostfromClinkerProduction;
    float leftbottomSavings = self.plantCementFGSPC < self.achievableCementFGSPC ? self.maximumAnnualSavingsOnPowerCostfromCementFinishGrinding : self.achievableAnnualSavingsOnPowerCostfromCementFinishGrinding;
    float rightTopSavings = self.plantClinkerSHC < self.achievableClinkerSHC ? self.maximumAnnualSavingsOnHeatCostfromClinkerProduction : self.achievableAnnualSavingsOnHeatCostfromClinkerProduction;
    float rightbottomSavings = self.achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration;
    float totolSavings = leftTopSavings + leftbottomSavings + rightTopSavings + rightbottomSavings;
    return totolSavings;
}


@end

