$computers = Get-Content C:\Scripts2\computers\computers_all.txt

ForEach ($computer in $computers)

{

  $computer
  Stop-Service -InputObject $(Get-Service -Computer $computer -Name rscorsvc);
  remove-item "\\$computer\e$\edgesight\*" -recurse;
  Start-Service -InputObject $(Get-Service -Computer $computer -Name rscorsvc);	
}
