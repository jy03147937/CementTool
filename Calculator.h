//
//  Calculator.h
//  cementTool
//
//  Created by AOCC2013 on 13-2-21.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Calculator : NSObject<NSCoding>{
    NSString *plantName;  //PlantProduction
    
    float totalPlantClinkerProduction;
    float totalPlantCementProduction;     //production
    
    float averageClinkerLineCapacity;
    float totalPlantCementMilloutput;      //PlantCapacity
    
    float plantClinkerSPC;
    float plantClinkerSHC;
    float plantCementFGSPC;
    float averageWHRnePowerGeneration;
    float achievableClinkerSPC;
    float achievableClinkerSHC;
    float achievableCementFGSPC;
    float achievableAverageWHRnePowerGeneration;
    float intAdvancedClinkerSPC;
    float intAdvancedClinkerSHC;
    float intAdvancedCementFGSPC;
    float intAdvancedAverageWHRnePowerGeneration;          //PlantMajorKPIs
    
    float averageSpecificHeatCost;
    float averageSpecificPowerCost;
    float averageSpecificPowerCostFromWHR;     //plant cost
    
    int numberOfClinkerLines;
    int numberOfCementMills;
    NSString *rawGrindingProcess;
    NSString *burningProcess;
    NSString *cementGrindingProcess;
    NSString *kilnGasBypass;
    NSString *coolerType;
    NSString *dryingRequirment;
    int averageNumberOfPreheaterStages;      //PlantConfiguration
    
    float maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction;
    float maximumAnnualSavingsOnPowerCostfromClinkerProduction;
    float achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction;
    float achievableAnnualSavingsOnPowerCostfromClinkerProduction;      //savings
    
    float maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
    float maximumAnnualSavingsOnPowerCostfromCementFinishGrinding;
    float achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
    float achievableAnnualSavingsOnPowerCostfromCementFinishGrinding;
    
    float maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction;
    float maximumAnnualSavingsOnHeatCostfromClinkerProduction;
    float achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction;
    float achievableAnnualSavingsOnHeatCostfromClinkerProduction;
    
    float achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration;
    float achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration;
    
}

@property NSString *plantName;

@property float totalPlantClinkerProduction;
@property float totalPlantCementProduction;
@property float averageClinkerLineCapacity;
@property float totalPlantCementMilloutput;

@property float plantClinkerSPC;
@property float plantClinkerSHC;
@property float plantCementFGSPC;
@property float averageWHRnePowerGeneration;
@property float achievableClinkerSPC;
@property float achievableClinkerSHC;
@property float achievableCementFGSPC;
@property float achievableAverageWHRnePowerGeneration;
@property float intAdvancedClinkerSPC;
@property float intAdvancedClinkerSHC;
@property float intAdvancedCementFGSPC;
@property float intAdvancedAverageWHRnePowerGeneration;

@property float averageSpecificHeatCost;
@property float averageSpecificPowerCost;
@property float averageSpecificPowerCostFromWHR;

@property int numberOfClinkerLines;
@property int numberOfCementMills;
@property int averageNumberOfPreheaterStages;
@property NSString *rawGrindingProcess;
@property NSString *burningProcess;
@property NSString *cementGrindingProcess;
@property NSString *kilnGasBypass;
@property NSString *coolerType;
@property NSString *dryingRequirment;

@property float maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction;
@property float maximumAnnualSavingsOnPowerCostfromClinkerProduction;
@property float achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction;
@property float achievableAnnualSavingsOnPowerCostfromClinkerProduction;

@property float maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
@property float maximumAnnualSavingsOnPowerCostfromCementFinishGrinding;
@property float achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
@property float achievableAnnualSavingsOnPowerCostfromCementFinishGrinding;

@property float maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction;
@property float maximumAnnualSavingsOnHeatCostfromClinkerProduction;
@property float achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction;
@property float achievableAnnualSavingsOnHeatCostfromClinkerProduction;

@property float achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration;
@property float achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration;



- (float)chooseAchievableSPC;
- (float)chooseIntAdvancedSPC;
- (float)chooseAchievableSHC;
- (float)chooseIntAdvancedSHC;
- (float)chooseAchievableFGSPC;
- (float)chooseIntAdvancedFGSPC;
- (float)chooseAchievableWHRClinkerSPG;
- (float)chooseIntAdvancedWHRClinkerSPG;
- (void)calculateSavings;
- (float)calculateTotalSavingsOnDisplay;


@end











