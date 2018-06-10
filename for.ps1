$input=$args[0]
$num=[int]$input
$var="Spit "
For ($i=0; $i -le $num; $i++) {
    
	Add-Content -Path "C:\Users\papa1\workspace\demo\a\dummny.txt" -Value "$var $i"
	 
    }