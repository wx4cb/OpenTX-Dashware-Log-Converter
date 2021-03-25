<# 
    Open TX logfile script to generate separate latitude and longitude fields for importation into dashware

    Copyright (c) 2021 Charles Blackburn
    All rights reserved.

    Redistribution and use in SOURCE ONLY form, with or without modification, are permitted (subject to the limitations in the disclaimer below) provided that the following conditions are met:

    Redistributions of source code must retain the above copyright notice, this list of conditions, Revision histories and the following disclaimer.
   
    Redistributions in binary form are not permitted at all

    Neither the name of "Charles Blackburn" nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

    NO EXPRESS OR IMPLIED LICENSES TO ANY PARTY'S PATENT RIGHTS ARE GRANTED BY THIS LICENSE. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
    IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
    WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

    Version 1.0 - 3.25.2021

    Revision History

    3.25.2021 - CB - Initial Version
#>

# Generate output filename
$outfile = $args[0]+".processed.csv"

# Import the openTX log file using the standard header format with crossfire fields included.
# This must be changed to be the same as the header line inthe openTX logfiles'','' but you must
# add the "Latitude"'','' "Longitude" lines to the end of the header and enclose each one field
# in single q
$csv = Import-Csv $args[0]  -Header 'Date','Time','Ptch','Roll','Yaw','1RSS','2RSS','RQly','RSNR','ANT','RFMD','TPWR','TRSS','TQly','TSNR','RxBt','Curr','Capa','BatPC','FM','GPS','GSpd','Hdg','Alt','Sats','VSpd','Rud','Ele','Thr','Ail','S1','6P','S2','EX1','EX2','LS','RS','SA','SB','SC','SD','SE','SF','SG','SH','LSW','TxBat','Latitude','Longitude'
#Date','Time','1RSS','2RSS','RQly','RSNR','ANT','RFMD','TPWR','TRSS','TQl','TSNR','VSpd','Ptch','Roll','Yaw','RxBt','Curr','Capa','BatPC','FM','GPS','GSpd','Hdg','Alt','Sats','Rud','Ele','Thr','Ail','S1','6P','S2','EX1','EX2','LS','RS','SA','SB','SC','SD','SE','SF','SG','SH','LSW','TxBat','Latitude','Longitude'

Write-Output "Got input CSV: $args[0]"
	
# Loop through each line in the header and strip out the lines where the "RSSI" is zero 
# This is usually the first couple of lines
# Split the gps into the extra two fields
$csv | foreach {
    if ($_.TPWR -notlike "0") {
		$Latitude,$longitude = $_.GPS -split " ",2

		# Write it all out
		$_.Latitude = $Latitude
		$_.Longitude = $Longitude
		$_
    }
#        Write-Error [string]"$($_)"
# Export it to results.csv skipping the header file from the imported CSV
} | Select -Skip 1 | Export-Csv $outfile -NoTypeInformation
