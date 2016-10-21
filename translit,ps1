function global:Translit {

param([string]$inString)

$Translit= @{

[char]‘а’="a"

[char]‘А’="A"

[char]‘б’="b"

[char]‘Б’="B"

[char]‘в’="v"

[char]‘В’="V"

[char]‘г’="g"

[char]‘Г’="G"

[char]‘д’="d"

[char]‘Д’="D"

[char]‘е’="e"

[char]‘Е’="E"

[char]‘ё’="yo"

[char]‘Ё’="Yo"

[char]‘ж’="zh"

[char]‘Ж’="Zh"

[char]‘з’="z"

[char]‘З’="Z"

[char]‘и’="i"

[char]‘И’="I"

[char]‘й’="y"

[char]‘Й’="Y"

[char]‘к’="k"

[char]‘К’="K"

[char]‘л’="l"

[char]‘Л’="L"

[char]‘м’="m"

[char]‘М’="M"

[char]‘н’="n"

[char]‘Н’="N"

[char]‘о’="o"

[char]‘О’="O"

[char]‘п’="p"

[char]‘П’="P"

[char]‘р’="r"

[char]‘Р’="R"

[char]‘с’="s"

[char]‘С’="S"

[char]‘т’="t"

[char]‘Т’="T"

[char]‘у’="u"

[char]‘У’="U"

[char]‘ф’="f"

[char]‘Ф’="F"

[char]‘х’="kh"

[char]‘Х’="Kh"

[char]‘ц’="ts"

[char]‘Ц’="Ts"

[char]‘ч’="ch"

[char]‘Ч’="Ch"

[char]‘ш’="sh"

[char]‘Ш’="Sh"

[char]‘щ’="shch"

[char]‘Щ’="Shch"

[char]‘ъ’=""

[char]‘Ъ’=""

[char]‘ы’="y"

[char]‘Ы’="Y"

[char]‘ь’=""

[char]‘Ь’=""

[char]‘э’="e"

[char]‘Э’="E"

[char]‘ю’="yu"

[char]‘Ю’="Yu"

[char]‘я’="ya"

[char]‘Я’="Ya"

}

$outChars=""

foreach ($c in $inChars=$inString.ToCharArray())

{

if ($Translit[$c] -cne $Null )

{

$outChars+=$Translit[$c]

}

else

{

$outChars+=$c

}

}

Write-Output $outChars

}


$FirstName = read-host -Prompt "Имя"
$LastName = read-host -Prompt "Фамилия"

(Translit "$($FirstName[0]).$($LastName)").ToLower()
