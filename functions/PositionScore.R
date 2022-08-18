##########################################################################################
############################## Position score function ###################################
##########################################################################################


# Wells positioned in the 96- well plate border are exposed to higher environmental
# perturbations such as evaporation and temperature fluctuations  
# I aim to check if the position is relevant to data variability and heterocedasticity 
# when we try to fit a dose response model.
# This function provides a score related to well position in a 96-well plate. 
# Wells positioned in the external boarder receives a score 4 and the inner wells
#receives small scores.


PositionScore <-  function(i) { 
  if (i == "A01" | i == "A02" | i == "A03" | i == "A04" | i == "A05" | i == "A06" | 
      i == "A07" | i == "A08" | i == "A09" | i == "A10" | i == "A11" | i == "A12" |
      i == "H01" | i == "H02" | i == "H03" | i == "H04" | i == "H05" | i == "H06" | 
      i == "H07" | i == "H08" | i == "H09" | i == "H10" | i == "H11" | i == "H12" | 
      i == "B01" | i == "C01" | i == "D01" | i == "E01" | i == "F01" | i == "G01" | 
      i == "B12" | i == "C12" | i == "D12" | i == "E12" | i == "F12" | i == "G12")
  {return(4)
  } else {
    if (i == "B02" | i == "B03" | i == "B04" | i == "B05" | i == "B06" |
        i == "B07" | i == "B08" | i == "B09" | i == "B10" | i == "B11" | 
        i == "G02" | i == "G03" | i == "G04" | i == "G05" | i == "G06" | 
        i == "G07" | i == "G08" | i == "G09" | i == "G10" | i == "G11" | 
        i == "C02" | i == "D02" | i == "E02" | i == "F02" | i == "C11" | 
        i == "D11" | i == "E11" | i == "F11"){return(3)
    } else {
      if (i == "C03" | i == "C04" | i == "C05" | i == "C06" | i == "C07" |
          i == "C08" | i == "C09" | i == "C10" | i == "F03" | i == "F04" | 
          i == "F05" | i == "F06" | i == "F07" | i == "F08" | i == "F09" | 
          i == "F10" | i == "D03" | i == "E03" | i == "E10"| i == "D10")
      {return(2)} else {return(1)}
    }}}

# i corresponds to a index inside a Well identified column inside a 
# data frame in tyde format originated by plater package. The output is a score to fill a 
# position score column inside the same data frame