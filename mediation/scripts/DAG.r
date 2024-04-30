DAG <- dagitty('dag {
AMHI [adjusted,pos="-0.702,0.802"]
Age [adjusted,pos="-0.486,1.390"]
Airway_disease [outcome,pos="0.167,0.789"]
BMI [adjusted,pos="-1.414,1.131"]
Biofuel_exposure [exposure,pos="-1.535,0.802"]
Gender [adjusted,pos="-0.096,1.322"]
Medication [adjusted,pos="-0.980,1.369"]
Occupational_pollution [pos="-1.331,0.480"]
SHS_binary [pos="-0.642,0.251"]
Smoking_binary [pos="-1.022,0.284"]
year2pm25 [pos="-0.215,0.312"]
AMHI -> Airway_disease
Age -> AMHI
Age -> Airway_disease
Age -> Biofuel_exposure
Age -> Occupational_pollution
Age -> SHS_binary
Age -> Smoking_binary
Age -> year2pm25
BMI -> AMHI
BMI -> Airway_disease
BMI -> Biofuel_exposure
BMI -> Occupational_pollution
BMI -> SHS_binary
BMI -> Smoking_binary
BMI -> year2pm25
Biofuel_exposure -> AMHI
Biofuel_exposure -> Airway_disease [pos="-0.731,0.401"]
Gender -> AMHI
Gender -> Airway_disease
Gender -> Biofuel_exposure
Gender -> Occupational_pollution
Gender -> SHS_binary
Gender -> Smoking_binary
Gender -> year2pm25
Medication -> AMHI
Medication -> Airway_disease
Medication -> Biofuel_exposure
Medication -> Occupational_pollution
Medication -> SHS_binary
Medication -> Smoking_binary
Medication -> year2pm25
Occupational_pollution -> AMHI
Occupational_pollution -> Airway_disease
SHS_binary -> AMHI
SHS_binary -> Airway_disease
Smoking_binary -> AMHI
Smoking_binary -> Airway_disease
year2pm25 -> AMHI
year2pm25 -> Airway_disease
}
'
)
