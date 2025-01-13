# Set the user account to check process for 
$user = "Administrator" # Modify this to the user account you're interested in
Write-Output "Listing processes running under the user account: $user"

# Get all processes and filter by the specified user
Get-WmiObject Win32_Process | Where-Object { $_.GetOwner().User -eq $user } |
Select-Object -Property Name, ProcessID, @{Name="User";Expression={$_.GetOwner().User}}, @{Name="Domain";Expression={$_.GetOwner().Domain}}, @{Name="MemoryUsage";Expression={$_.WorkingSetSize/1MB -as [int]}} |

Write-Output "Filtered process listing for user $user completed."
