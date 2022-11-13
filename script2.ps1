New-Item -Type "directory" -Force -Path sxs | Out-Null
Copy-Item -Force -Recurse e:/sources/sxs/* ./sxs
Get-ChildItem -Recurse ./sxs | Select-Object -Expand Fullname
