
function Write-Output-Color
{
    # DO NOT SPECIFY param(...)
    #    we parse colors ourselves.

    $allColors = ("-Black",   "-DarkBlue","-DarkGreen","-DarkCyan","-DarkRed","-DarkMagenta","-DarkYellow","-Gray",
                  "-Darkgray","-Blue",    "-Green",    "-Cyan",    "-Red",    "-Magenta",    "-Yellow",    "-White")
    $foreground = (Get-Host).UI.RawUI.ForegroundColor # current foreground
    $color = $foreground
    [bool]$nonewline = $false
    $sofar = ""
    $total = ""

    foreach($arg in $args)
    {
        if ($arg -eq "-nonewline") { $nonewline = $true }
        elseif ($arg -eq "-foreground")
        {
            if ($sofar) { Write-Host $sofar -foreground $color -nonewline }
            $color = $foregrnd
            $sofar = ""
        }
        elseif ($allColors -contains $arg)
        {
            if ($sofar) { Write-Host $sofar -foreground $color -nonewline }
            $color = $arg.substring(1)
            $sofar = ""
        }
        else
        {
            $sofar += "$arg "
            $total += "$arg "
        }
    }
    # last bit done special
    if (!$nonewline)
    {
        Write-Host $sofar -foreground $color
    }
    elseif($sofar)
    {
        Write-Host $sofar -foreground $color -nonewline
    }
}

function Read-Prompt-Color
{
    # DO NOT SPECIFY param(...)
    #    we parse colors ourselves.

    $allColors = ("-Black",   "-DarkBlue","-DarkGreen","-DarkCyan","-DarkRed","-DarkMagenta","-DarkYellow","-Gray",
                  "-Darkgray","-Blue",    "-Green",    "-Cyan",    "-Red",    "-Magenta",    "-Yellow",    "-White")
    $foreground = (Get-Host).UI.RawUI.ForegroundColor # current foreground
    $color = $foreground
    [bool]$nonewline = $false
    $sofar = ""
    $total = ""

    foreach($arg in $args)
    {
        if ($arg -eq "-nonewline") { $nonewline = $true }
        elseif ($arg -eq "-foreground")
        {
            if ($sofar) { Write-Host $sofar -foreground $color -nonewline }
            $color = $foregrnd
            $sofar = ""
        }
        elseif ($allColors -contains $arg)
        {
            if ($sofar) { Write-Host $sofar -foreground $color -nonewline }
            $color = $arg.substring(1)
            $sofar = ""
        }
        else
        {
            $sofar += "$arg "
            $total += "$arg "
        }
    }
    # last bit done special
    if (!$nonewline)
    {
       Read-Host -prompt $sofar
    }
    elseif($sofar)
    {
        Write-Host $sofar -foreground $color -nonewline
    }
}

Export-ModuleMember -function Write-Output-Color
Export-ModuleMember -function Read-Prompt-Color