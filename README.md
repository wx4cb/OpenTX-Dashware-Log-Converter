# OpenTX-Dashware-Log-Converter
Power Shell Script - Converts the OpenTX Logs stored by inav on the transmitter into a format dashware can read properly.

Includes crossfire telemetry additions.

Please make sure that you set the header in the same order as found on your open TX logs and remove all extraneous brackets etc (such as (mah), (@) etc) and also make sure you enclose each element in a single quote set.

runs fine on Windows 10 x86/x64 but you must do the following to enable scripts to be run on your windows machine.

Installation instructions
-------------------------

Due to microsofts increased stupidity with running scripts, you must set powershell to be allowed to run unsigned scripts.

To change the execution policy to run PowerShell scripts, use these steps:

    *   Open Start.
    
    *   Search for PowerShell, right-click the top result, and select the Run as administrator option.
    *   Type the following command to allow scripts to run and press Enter:
       Set-ExecutionPolicy Unrestricted

    *    Type A and press Enter (if applicable).


How to use
----------

Run companion and exprt the particular flight you are interested in from your opentx logfile for that day

Now you can run the script by calling:
    OpenTX2Dashware.ps1 <Name of OTX Logfile>
    
You then should have a processed CSV in that directory which you can then import into Dashware

License: BSD 3 Clause (modified - see below for details)

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

