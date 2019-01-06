#    SEND FILES TO Sub-Zero using SFTP
#    This requires PSFTP.EXE from the PUTTY website and FTP-SEND-PROD.STEPS with the commands to transfer files
#
#    Bob LeRoy 03/28/2017
#       Updated for Subzero FTP Servers 08/30/2018
# 
#    Pick a directory for the FTP's to process
cd /SISM/ftp
#
#    Start the FTP process with:
#    -l Username
#    -pw Password
#    -P Port (optional here)
#    -b Batch file to execute
#    -bc Output the commands from the batch file above
# RJL - 08/18 Not needed for Subzero SET SEE_MASK_NOZONECHECKS=1
(./psftp.exe -l App_Som_Sftp_Tisdel -pw gXH2ZFU*ENMubfq9 -P 22 -b szftp-send-prod.steps -bc sftp.subzero.com) 2> $null
get-childitem -path /SISM/ftp/send *.txt -recurse | move-item -destination /SISM/Archive

