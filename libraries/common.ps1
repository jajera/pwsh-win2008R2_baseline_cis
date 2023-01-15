#Get hostname
$hostname = [System.Net.Dns]::GetHostName()

#Get report file location
$cur_path = $(Split-Path -Path $MyInvocation.MyCommand.Path).Split('\')
$report_path = "$($cur_path[0..($cur_path.count-2)] -join '\')\reports"
$log_location = "$($report_path)\$($hostname).csv"

function Write-Report($line)
{
  #Append line to report file
  $line | Out-File -Encoding Ascii -Append $log_location
}

function describe()
{
  Param(
    [parameter(Mandatory=$true)]
    $control, 
    [parameter(Mandatory=$true)]
    $item, 
    [parameter(Mandatory=$false)]
    $current_value = $null, 
    [parameter(Mandatory=$false)]
    $expected_value = $null,
    [parameter(Mandatory=$false)]
    $opr = "-eq",
    [parameter(Mandatory=$false)]
    $only_if = $true
    )

  $status = "pass"
  $opr_list = @('-eq','-ge','-gt','-le','-like','-lt','-ne','-notlike')
  $opr_index = $opr_list.IndexOf($opr)
  $opr_desc = @('equal','greater_than_equal','greater_than','less_than_equal','like','less_than','not_equal','not_like')

  if($false -eq $only_if)
  {
    $status = "skip"
    Write-Host "Control $control" -ForegroundColor Yellow
  }
  else
  {
    if($opr_index -eq -1)
    {
      Write-Error "$($opr) operator is invalid!" 
      break;
    }
    elseif($opr_index -eq 0) 
    {
      if(-not($current_value -eq $expected_value)) { $status = 'fail' }
    }
    elseif($opr_index -eq 1) 
    {
      if(-not($current_value -ge $expected_value)) { $status = 'fail' }
    }
    elseif($opr_index -eq 2) 
    {
      if(-not($current_value -gt $expected_value)) { $status = 'fail' }
    }
    elseif($opr_index -eq 3) 
    {
      if(-not($current_value -le $expected_value)) { $status = 'fail' }
    }
    elseif($opr_index -eq 4) 
    {
      if(-not($current_value -like $expected_value)) { $status = 'fail' }
    }
    elseif($opr_index -eq 5) 
    {
      if(-not($current_value -lt $expected_value)) { $status = 'fail' }
    }
    elseif($opr_index -eq 6) 
    {
      if(-not($current_value -ne $expected_value)) { $status = 'fail' }
    }
    elseif($opr_index -eq 7) 
    {
      if(-not($current_value -notlike $expected_value)) { $status = 'fail' }
    }

    if($status -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item)' is $($opr_desc[$opr_index]) '$($expected_value)'" -ForegroundColor Green
    }
    else
    {
      Write-Host "Control $control" -ForegroundColor Red
      Write-Host "  item: $($item) is $($opr_desc[$opr_index]) '$($expected_value)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value)'" -ForegroundColor Red
    }
  }

  #Write report
  if($status -eq 'skip')
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)"  
  }
  else 
  {
    $report_line = "$($hostname)`t$($control)`t$($item) is $($opr_desc[$opr_index]) '$($expected_value)'`t$($expected_value)`t$($current_value)`t$($status)"  
  }
  
  Write-Report $report_line
}

function describe_dual_duo_all()
{
  Param(
    [parameter(Mandatory=$true)]
    $control, 
    [parameter(Mandatory=$true)]
    $item1, 
    [parameter(Mandatory=$true)]
    $item2, 
    [parameter(Mandatory=$false)]
    $current_value1 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1 = $null,
    [parameter(Mandatory=$false)]
    $current_value2 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2 = $null,
    [parameter(Mandatory=$false)]
    $opr1 = "-eq",
    [parameter(Mandatory=$false)]
    $opr2 = "-eq",
    [parameter(Mandatory=$false)]
    $only_if = $true
    )

  $status1 = "pass"
  $status2 = "pass"
  $opr_list = @('-eq','-ge','-gt','-le','-like','-lt','-ne','-notlike')
  $opr_index1 = $opr_list.IndexOf($opr1)
  $opr_index2 = $opr_list.IndexOf($opr2)
  $opr_desc = @('equal','greater_than_equal','greater_than','less_than_equal','like','less_than','not_equal','not_like')

  if($false -eq $only_if)
  {
    $status = "skip"
    Write-Host "Control $control" -ForegroundColor Yellow
  }
  else
  {
    if($opr_index1 -eq -1)
    {
      Write-Error "$($opr1) operator is invalid!" 
      break;
    }
    elseif($opr_index1 -eq 0) 
    {
      if(-not($current_value1 -eq $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 1) 
    {
      if(-not($current_value1 -ge $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 2) 
    {
      if(-not($current_value1 -gt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 3) 
    {
      if(-not($current_value1 -le $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 4) 
    {
      if(-not($current_value1 -like $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 5) 
    {
      if(-not($current_value1 -lt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 6) 
    {
      if(-not($current_value1 -ne $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 7) 
    {
      if(-not($current_value1 -notlike $expected_value1)) { $status1 = 'fail' }
    }

    if($opr_index2 -eq -1)
    {
      Write-Error "$($opr2) operator is invalid!" 
      break;
    }
    elseif($opr_index2 -eq 0) 
    {
      if(-not($current_value2 -eq $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 1) 
    {
      if(-not($current_value2 -ge $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 2) 
    {
      if(-not($current_value2 -gt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 3) 
    {
      if(-not($current_value2 -le $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 4) 
    {
      if(-not($current_value2 -like $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 5) 
    {
      if(-not($current_value2 -lt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 6) 
    {
      if(-not($current_value2 -ne $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 7) 
    {
      if(-not($current_value2 -notlike $expected_value2)) { $status2 = 'fail' }
    }    

    if($status1 -eq 'pass' -and $status2 -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Green
      Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Green
    }
    else
    {
      Write-Host "Control $control" -ForegroundColor Red
      if($status1 -eq 'pass')
      {
        Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value1)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value1)'" -ForegroundColor Red
      }

      if($status2 -eq 'pass')
      {
        Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value2)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value2)'" -ForegroundColor Red
      }
    }
  }

  #Write report
  if($status -eq 'skip')
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)" 
    Write-Report $report_line
  }
  else 
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1) is $($opr_desc[$opr_index1]) '$($expected_value1)'`t$($expected_value1)`t$($current_value1)`t$($status1)"
    Write-Report $report_line1
    $report_line2 = "$($hostname)`t$($control)`t$($item2) is $($opr_desc[$opr_index2]) '$($expected_value2)'`t$($expected_value2)`t$($current_value2)`t$($status2)"
    Write-Report $report_line2
  }
}

function describe_dual_trio_all()
{
  Param(
    [parameter(Mandatory=$true)]
    $control, 
    [parameter(Mandatory=$true)]
    $item1, 
    [parameter(Mandatory=$true)]
    $item2, 
    [parameter(Mandatory=$true)]
    $item3,
    [parameter(Mandatory=$false)]
    $current_value1 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1 = $null,
    [parameter(Mandatory=$false)]
    $current_value2 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2 = $null,
    [parameter(Mandatory=$false)]
    $current_value3 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value3 = $null,
    [parameter(Mandatory=$false)]
    $opr1 = "-eq",
    [parameter(Mandatory=$false)]
    $opr2 = "-eq",
    [parameter(Mandatory=$false)]
    $opr3 = "-eq",
    [parameter(Mandatory=$false)]
    $only_if = $true
    )

  $status1 = "pass"
  $status2 = "pass"
  $status3 = "pass"
  $opr_list = @('-eq','-ge','-gt','-le','-like','-lt','-ne','-notlike')
  $opr_index1 = $opr_list.IndexOf($opr1)
  $opr_index2 = $opr_list.IndexOf($opr2)
  $opr_index3 = $opr_list.IndexOf($opr3)
  $opr_desc = @('equal','greater_than_equal','greater_than','less_than_equal','like','less_than','not_equal','not_like')

  if($false -eq $only_if)
  {
    $status = "skip"
    Write-Host "Control $control" -ForegroundColor Yellow
  }
  else
  {
    if($opr_index1 -eq -1)
    {
      Write-Error "$($opr1) operator is invalid!" 
      break;
    }
    elseif($opr_index1 -eq 0) 
    {
      if(-not($current_value1 -eq $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 1) 
    {
      if(-not($current_value1 -ge $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 2) 
    {
      if(-not($current_value1 -gt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 3) 
    {
      if(-not($current_value1 -le $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 4) 
    {
      if(-not($current_value1 -like $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 5) 
    {
      if(-not($current_value1 -lt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 6) 
    {
      if(-not($current_value1 -ne $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 7) 
    {
      if(-not($current_value1 -notlike $expected_value1)) { $status1 = 'fail' }
    }

    if($opr_index2 -eq -1)
    {
      Write-Error "$($opr2) operator is invalid!" 
      break;
    }
    elseif($opr_index2 -eq 0) 
    {
      if(-not($current_value2 -eq $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 1) 
    {
      if(-not($current_value2 -ge $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 2) 
    {
      if(-not($current_value2 -gt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 3) 
    {
      if(-not($current_value2 -le $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 4) 
    {
      if(-not($current_value2 -like $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 5) 
    {
      if(-not($current_value2 -lt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 6) 
    {
      if(-not($current_value2 -ne $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 7) 
    {
      if(-not($current_value2 -notlike $expected_value2)) { $status2 = 'fail' }
    }

    if($opr_index3 -eq -1)
    {
      Write-Error "$($opr3) operator is invalid!" 
      break;
    }
    elseif($opr_index3 -eq 0) 
    {
      if(-not($current_value3 -eq $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 1) 
    {
      if(-not($current_value3 -ge $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 2) 
    {
      if(-not($current_value3 -gt $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 3) 
    {
      if(-not($current_value3 -le $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 4) 
    {
      if(-not($current_value3 -like $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 5) 
    {
      if(-not($current_value3 -lt $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 6) 
    {
      if(-not($current_value3 -ne $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 7) 
    {
      if(-not($current_value3 -notlike $expected_value3)) { $status3 = 'fail' }
    }

    if($status1 -eq 'pass' -and $status2 -eq 'pass' -and $status3 -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Green
      Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Green
      Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Green
    }
    else
    {
      Write-Host "Control $control" -ForegroundColor Red
      if($status1 -eq 'pass')
      {
        Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value1)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value1)'" -ForegroundColor Red
      }

      if($status2 -eq 'pass')
      {
        Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value2)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value2)'" -ForegroundColor Red
      }

      if($status3 -eq 'pass')
      {
        Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value3)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value3)'" -ForegroundColor Red
      }
    }
  }

  #Write report
  if($status -eq 'skip')
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)" 
    Write-Report $report_line
  }
  else 
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1) is $($opr_desc[$opr_index1]) '$($expected_value1)'`t$($expected_value1)`t$($current_value1)`t$($status1)"
    Write-Report $report_line1
    $report_line2 = "$($hostname)`t$($control)`t$($item2) is $($opr_desc[$opr_index2]) '$($expected_value2)'`t$($expected_value2)`t$($current_value2)`t$($status2)"
    Write-Report $report_line2
    $report_line3 = "$($hostname)`t$($control)`t$($item3) is $($opr_desc[$opr_index3]) '$($expected_value3)'`t$($expected_value3)`t$($current_value3)`t$($status3)"
    Write-Report $report_line3
  }
}

function describe_dual_duo_one()
{
  Param(
    [parameter(Mandatory=$true)]
    $control,
    [parameter(Mandatory=$true)]
    $item1a,
    [parameter(Mandatory=$true)]
    $item1b,
    [parameter(Mandatory=$true)]
    $item2a,
    [parameter(Mandatory=$true)]
    $item2b,
    [parameter(Mandatory=$false)]
    $current_value1a = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1a = $null,
    [parameter(Mandatory=$false)]
    $current_value1b = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1b = $null,
    [parameter(Mandatory=$false)]
    $current_value2a = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2a = $null,
    [parameter(Mandatory=$false)]
    $current_value2b = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2b = $null,
    [parameter(Mandatory=$false)]
    $opr1a = "-eq",
    [parameter(Mandatory=$false)]
    $opr2a = "-eq",
    [parameter(Mandatory=$false)]
    $opr1b = "-eq",
    [parameter(Mandatory=$false)]
    $opr2b = "-eq",
    [parameter(Mandatory=$false)]
    $only_if = $true
    )

  $statusA = "pass"
  $statusB = "pass"
  $status1a = "pass"
  $status1b = "pass"
  $status2a = "pass"
  $status2b = "pass"

  $opr_list = @('-eq','-ge','-gt','-le','-like','-lt','-ne','-notlike')
  $opr_index1a = $opr_list.IndexOf($opr1a)
  $opr_index1b = $opr_list.IndexOf($opr1b)
  $opr_index2a = $opr_list.IndexOf($opr2a)
  $opr_index2b = $opr_list.IndexOf($opr2b)
  $opr_desc = @('equal','greater_than_equal','greater_than','less_than_equal','like','less_than','not_equal','not_like')

  if($false -eq $only_if)
  {
    $status = "skip"
    Write-Host "Control $control" -ForegroundColor Yellow
  }
  else
  {
    if($opr_index1a -eq -1)
    {
      Write-Error "$($opr1a) operator is invalid!" 
      break;
    }
    elseif($opr_index1a -eq 0) 
    {
      if(-not($current_value1a -eq $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 1) 
    {
      if(-not($current_value1a -ge $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 2) 
    {
      if(-not($current_value1a -gt $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 3) 
    {
      if(-not($current_value1a -le $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 4) 
    {
      if(-not($current_value1a -like $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 5) 
    {
      if(-not($current_value1a -lt $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 6) 
    {
      if(-not($current_value1a -ne $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 7) 
    {
      if(-not($current_value1a -notlike $expected_value1a)) { $status1a = 'fail' }
    }

    if($opr_index1b -eq -1)
    {
      Write-Error "$($opr1b) operator is invalid!" 
      break;
    }
    elseif($opr_index1b -eq 0) 
    {
      if(-not($current_value1b -eq $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 1) 
    {
      if(-not($current_value1b -ge $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 2) 
    {
      if(-not($current_value1b -gt $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 3) 
    {
      if(-not($current_value1b -le $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 4) 
    {
      if(-not($current_value1b -like $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 5) 
    {
      if(-not($current_value1b -lt $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 6) 
    {
      if(-not($current_value1b -ne $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 7) 
    {
      if(-not($current_value1b -notlike $expected_value1b)) { $status1b = 'fail' }
    }
    
    if($opr_index2a -eq -1)
    {
      Write-Error "$($opr2a) operator is invalid!" 
      break;
    }
    elseif($opr_index2a -eq 0) 
    {
      if(-not($current_value2a -eq $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 1) 
    {
      if(-not($current_value2a -ge $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 2) 
    {
      if(-not($current_value2a -gt $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 3) 
    {
      if(-not($current_value2a -le $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 4) 
    {
      if(-not($current_value2a -like $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 5) 
    {
      if(-not($current_value2a -lt $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 6) 
    {
      if(-not($current_value2a -ne $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 7) 
    {
      if(-not($current_value2a -notlike $expected_value2a)) { $status2a = 'fail' }
    }

    if($opr_index2b -eq -1)
    {
      Write-Error "$($opr2b) operator is invalid!" 
      break;
    }
    elseif($opr_index2b -eq 0) 
    {
      if(-not($current_value2b -eq $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 1) 
    {
      if(-not($current_value2b -ge $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 2) 
    {
      if(-not($current_value2b -gt $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 3) 
    {
      if(-not($current_value2b -le $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 4) 
    {
      if(-not($current_value2b -like $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 5) 
    {
      if(-not($current_value2b -lt $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 6) 
    {
      if(-not($current_value2b -ne $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 7) 
    {
      if(-not($current_value2b -notlike $expected_value2b)) { $status2b = 'fail' }
    }

    if($status1a -eq 'pass' -and $status2a -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1a)' is $($opr_desc[$opr_index1a]) '$($expected_value1a)'" -ForegroundColor Green
      Write-Host "  '$($item2a)' is $($opr_desc[$opr_index2a]) '$($expected_value2a)'" -ForegroundColor Green
      $statusA = 'pass'
    }
    elseif($status1b -eq 'pass' -and $status2b -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1b)' is $($opr_desc[$opr_index1b]) '$($expected_value1b)'" -ForegroundColor Green
      Write-Host "  '$($item2b)' is $($opr_desc[$opr_index2b]) '$($expected_value2b)'" -ForegroundColor Green
      $statusB = 'pass'
    }
    else 
    {
      Write-Host "Control $control" -ForegroundColor Red
      Write-Host "  '$($item1a)' is $($opr_desc[$opr_index1a]) '$($expected_value1a)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value1a)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value1a)'" -ForegroundColor Red
      Write-Host "  '$($item2a)' is $($opr_desc[$opr_index2a]) '$($expected_value2a)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value2a)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value2a)'" -ForegroundColor Red
      Write-Host "  '$($item1b)' is $($opr_desc[$opr_index1b]) '$($expected_value1b)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value1b)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value1b)'" -ForegroundColor Red
      Write-Host "  '$($item2b)' is $($opr_desc[$opr_index2b]) '$($expected_value2b)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value2b)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value2b)'" -ForegroundColor Red
    }
  }

  #Write report
  if($status -eq 'skip')
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)" 
    Write-Report $report_line
  }
  elseif($statusA -eq 'pass')
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1a)`t$($expected_value1a)`t$($current_value1a)`t$($status1a)"
    $report_line2 = "$($hostname)`t$($control)`t$($item2a)`t$($expected_value2a)`t$($current_value2a)`t$($status2a)"
    Write-Report $report_line1
    Write-Report $report_line2
  }
  elseif($statusB -eq 'pass')
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1b)`t$($expected_value1b)`t$($current_value1b)`t$($status1b)"
    $report_line2 = "$($hostname)`t$($control)`t$($item2b)`t$($expected_value2b)`t$($current_value2b)`t$($status2b)"
    Write-Report $report_line1
    Write-Report $report_line2
  }
  else
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1a)`t$($expected_value1a)`t$($current_value1a)`t$($status1a)"
    $report_line2 = "$($hostname)`t$($control)`t$($item2a)`t$($expected_value2a)`t$($current_value2a)`t$($status2a)"
    $report_line3 = "$($hostname)`t$($control)`t$($item1b)`t$($expected_value1b)`t$($current_value1b)`t$($status1b)"
    $report_line4 = "$($hostname)`t$($control)`t$($item2b)`t$($expected_value2b)`t$($current_value2b)`t$($status2b)"
    Write-Report $report_line1
    Write-Report $report_line2
    Write-Report $report_line3
    Write-Report $report_line4
  }
}

function describe_dual_trio_one()
{
  Param(
    [parameter(Mandatory=$true)]
    $control,
    [parameter(Mandatory=$true)]
    $item1a,
    [parameter(Mandatory=$true)]
    $item1b,
    [parameter(Mandatory=$true)]
    $item1c,
    [parameter(Mandatory=$true)]
    $item2a,
    [parameter(Mandatory=$true)]
    $item2b,
    [parameter(Mandatory=$true)]
    $item2c,
    [parameter(Mandatory=$false)]
    $current_value1a = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1a = $null,
    [parameter(Mandatory=$false)]
    $current_value1b = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1b = $null,
    $current_value1c = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1c = $null,
    [parameter(Mandatory=$false)]
    $current_value2a = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2a = $null,
    [parameter(Mandatory=$false)]
    $current_value2b = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2b = $null,
    [parameter(Mandatory=$false)]
    $current_value2c = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2c = $null,
    [parameter(Mandatory=$false)]
    $opr1a = "-eq",
    [parameter(Mandatory=$false)]
    $opr2a = "-eq",
    [parameter(Mandatory=$false)]
    $opr1b = "-eq",
    [parameter(Mandatory=$false)]
    $opr2b = "-eq",
    [parameter(Mandatory=$false)]
    $opr1c = "-eq",
    [parameter(Mandatory=$false)]
    $opr2c = "-eq",
    [parameter(Mandatory=$false)]
    $only_if = $true
    )

  $statusA = "pass"
  $statusB = "pass"
  $statusC = "pass"
  $status1a = "pass"
  $status1b = "pass"
  $status1c = "pass"
  $status2a = "pass"
  $status2b = "pass"
  $status2c = "pass"

  $opr_list = @('-eq','-ge','-gt','-le','-like','-lt','-ne','-notlike')
  $opr_index1a = $opr_list.IndexOf($opr1a)
  $opr_index1b = $opr_list.IndexOf($opr1b)
  $opr_index1c = $opr_list.IndexOf($opr1c)
  $opr_index2a = $opr_list.IndexOf($opr2a)
  $opr_index2b = $opr_list.IndexOf($opr2b)
  $opr_index2c = $opr_list.IndexOf($opr2c)
  $opr_desc = @('equal','greater_than_equal','greater_than','less_than_equal','like','less_than','not_equal','not_like')

  if($false -eq $only_if)
  {
    $status = "skip"
    Write-Host "Control $control" -ForegroundColor Yellow
  }
  else
  {
    if($opr_index1a -eq -1)
    {
      Write-Error "$($opr1a) operator is invalid!" 
      break;
    }
    elseif($opr_index1a -eq 0) 
    {
      if(-not($current_value1a -eq $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 1) 
    {
      if(-not($current_value1a -ge $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 2) 
    {
      if(-not($current_value1a -gt $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 3) 
    {
      if(-not($current_value1a -le $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 4) 
    {
      if(-not($current_value1a -like $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 5) 
    {
      if(-not($current_value1a -lt $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 6) 
    {
      if(-not($current_value1a -ne $expected_value1a)) { $status1a = 'fail' }
    }
    elseif($opr_index1a -eq 7) 
    {
      if(-not($current_value1a -notlike $expected_value1a)) { $status1a = 'fail' }
    }

    if($opr_index1b -eq -1)
    {
      Write-Error "$($opr1b) operator is invalid!" 
      break;
    }
    elseif($opr_index1b -eq 0) 
    {
      if(-not($current_value1b -eq $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 1) 
    {
      if(-not($current_value1b -ge $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 2) 
    {
      if(-not($current_value1b -gt $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 3) 
    {
      if(-not($current_value1b -le $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 4) 
    {
      if(-not($current_value1b -like $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 5) 
    {
      if(-not($current_value1b -lt $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 6) 
    {
      if(-not($current_value1b -ne $expected_value1b)) { $status1b = 'fail' }
    }
    elseif($opr_index1b -eq 7) 
    {
      if(-not($current_value1b -notlike $expected_value1b)) { $status1b = 'fail' }
    }

    if($opr_index1c -eq -1)
    {
      Write-Error "$($opr1c) operator is invalid!" 
      break;
    }
    elseif($opr_index1c -eq 0) 
    {
      if(-not($current_value1c -eq $expected_value1c)) { $status1c = 'fail' }
    }
    elseif($opr_index1c -eq 1) 
    {
      if(-not($current_value1c -ge $expected_value1c)) { $status1c = 'fail' }
    }
    elseif($opr_index1c -eq 2) 
    {
      if(-not($current_value1c -gt $expected_value1c)) { $status1c = 'fail' }
    }
    elseif($opr_index1c -eq 3) 
    {
      if(-not($current_value1c -le $expected_value1c)) { $status1c = 'fail' }
    }
    elseif($opr_index1c -eq 4) 
    {
      if(-not($current_value1c -like $expected_value1c)) { $status1c = 'fail' }
    }
    elseif($opr_index1c -eq 5) 
    {
      if(-not($current_value1c -lt $expected_value1c)) { $status1c = 'fail' }
    }
    elseif($opr_index1c -eq 6) 
    {
      if(-not($current_value1c -ne $expected_value1c)) { $status1c = 'fail' }
    }
    elseif($opr_index1c -eq 7) 
    {
      if(-not($current_value1c -notlike $expected_value1c)) { $status1c = 'fail' }
    }

    if($opr_index2a -eq -1)
    {
      Write-Error "$($opr2a) operator is invalid!" 
      break;
    }
    elseif($opr_index2a -eq 0) 
    {
      if(-not($current_value2a -eq $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 1) 
    {
      if(-not($current_value2a -ge $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 2) 
    {
      if(-not($current_value2a -gt $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 3) 
    {
      if(-not($current_value2a -le $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 4) 
    {
      if(-not($current_value2a -like $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 5) 
    {
      if(-not($current_value2a -lt $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 6) 
    {
      if(-not($current_value2a -ne $expected_value2a)) { $status2a = 'fail' }
    }
    elseif($opr_index2a -eq 7) 
    {
      if(-not($current_value2a -notlike $expected_value2a)) { $status2a = 'fail' }
    }

    if($opr_index2b -eq -1)
    {
      Write-Error "$($opr2b) operator is invalid!" 
      break;
    }
    elseif($opr_index2b -eq 0) 
    {
      if(-not($current_value2b -eq $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 1) 
    {
      if(-not($current_value2b -ge $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 2) 
    {
      if(-not($current_value2b -gt $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 3) 
    {
      if(-not($current_value2b -le $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 4) 
    {
      if(-not($current_value2b -like $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 5) 
    {
      if(-not($current_value2b -lt $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 6) 
    {
      if(-not($current_value2b -ne $expected_value2b)) { $status2b = 'fail' }
    }
    elseif($opr_index2b -eq 7) 
    {
      if(-not($current_value2b -notlike $expected_value2b)) { $status2b = 'fail' }
    }

    if($opr_index2c -eq -1)
    {
      Write-Error "$($opr2c) operator is invalid!" 
      break;
    }
    elseif($opr_index2c -eq 0) 
    {
      if(-not($current_value2c -eq $expected_value2c)) { $status2c = 'fail' }
    }
    elseif($opr_index2c -eq 1) 
    {
      if(-not($current_value2c -ge $expected_value2c)) { $status2c = 'fail' }
    }
    elseif($opr_index2c -eq 2) 
    {
      if(-not($current_value2c -gt $expected_value2c)) { $status2c = 'fail' }
    }
    elseif($opr_index2c -eq 3) 
    {
      if(-not($current_value2c -le $expected_value2c)) { $status2c = 'fail' }
    }
    elseif($opr_index2c -eq 4) 
    {
      if(-not($current_value2c -like $expected_value2c)) { $status2c = 'fail' }
    }
    elseif($opr_index2c -eq 5) 
    {
      if(-not($current_value2c -lt $expected_value2c)) { $status2c = 'fail' }
    }
    elseif($opr_index2c -eq 6) 
    {
      if(-not($current_value2c -ne $expected_value2c)) { $status2c = 'fail' }
    }
    elseif($opr_index2c -eq 7) 
    {
      if(-not($current_value2c -notlike $expected_value2c)) { $status2c = 'fail' }
    }

    if($status1a -eq 'pass' -and $status2a -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1a)' is $($opr_desc[$opr_index1a]) '$($expected_value1a)'" -ForegroundColor Green
      Write-Host "  '$($item2a)' is $($opr_desc[$opr_index2a]) '$($expected_value2a)'" -ForegroundColor Green
      $statusA = 'pass'
    }
    elseif($status1b -eq 'pass' -and $status2b -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1b)' is $($opr_desc[$opr_index1b]) '$($expected_value1b)'" -ForegroundColor Green
      Write-Host "  '$($item2b)' is $($opr_desc[$opr_index2b]) '$($expected_value2b)'" -ForegroundColor Green
      $statusB = 'pass'
    }
    elseif($status1c -eq 'pass' -and $status2c -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1c)' is $($opr_desc[$opr_index1c]) '$($expected_value1c)'" -ForegroundColor Green
      Write-Host "  '$($item2c)' is $($opr_desc[$opr_index2c]) '$($expected_value2c)'" -ForegroundColor Green
      $statusC = 'pass'
    }
    else 
    {
      Write-Host "Control $control" -ForegroundColor Red
      Write-Host "  '$($item1a)' is $($opr_desc[$opr_index1a]) '$($expected_value1a)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value1a)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value1a)'" -ForegroundColor Red
      Write-Host "  '$($item2a)' is $($opr_desc[$opr_index2a]) '$($expected_value2a)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value2a)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value2a)'" -ForegroundColor Red
      Write-Host "  '$($item1b)' is $($opr_desc[$opr_index1b]) '$($expected_value1b)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value1b)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value1b)'" -ForegroundColor Red
      Write-Host "  '$($item2b)' is $($opr_desc[$opr_index2b]) '$($expected_value2b)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value2b)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value2b)'" -ForegroundColor Red
      Write-Host "  '$($item1c)' is $($opr_desc[$opr_index1c]) '$($expected_value1c)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value1c)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value1c)'" -ForegroundColor Red
      Write-Host "  '$($item2c)' is $($opr_desc[$opr_index2c]) '$($expected_value2c)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value2c)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value2c)'" -ForegroundColor Red
    }
  }

  #Write report
  if($status -eq 'skip')
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)" 
    Write-Report $report_line
  }
  elseif($statusA -eq 'pass')
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1a)`t$($expected_value1a)`t$($current_value1a)`t$($status1a)"
    $report_line2 = "$($hostname)`t$($control)`t$($item2a)`t$($expected_value2a)`t$($current_value2a)`t$($status2a)"
    Write-Report $report_line1
    Write-Report $report_line2
  }
  elseif($statusB -eq 'pass')
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1b)`t$($expected_value1b)`t$($current_value1b)`t$($status1b)"
    $report_line2 = "$($hostname)`t$($control)`t$($item2b)`t$($expected_value2b)`t$($current_value2b)`t$($status2b)"
    Write-Report $report_line1
    Write-Report $report_line2
  }
  elseif($statusC -eq 'pass')
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1c)`t$($expected_value1c)`t$($current_value1c)`t$($status1c)"
    $report_line2 = "$($hostname)`t$($control)`t$($item2c)`t$($expected_value2c)`t$($current_value2c)`t$($status2c)"
    Write-Report $report_line1
    Write-Report $report_line2
  }
  else
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1a)`t$($expected_value1a)`t$($current_value1a)`t$($status1a)"
    $report_line2 = "$($hostname)`t$($control)`t$($item2a)`t$($expected_value2a)`t$($current_value2a)`t$($status2a)"
    $report_line3 = "$($hostname)`t$($control)`t$($item1b)`t$($expected_value1b)`t$($current_value1b)`t$($status1b)"
    $report_line4 = "$($hostname)`t$($control)`t$($item2b)`t$($expected_value2b)`t$($current_value2b)`t$($status2b)"
    $report_line5 = "$($hostname)`t$($control)`t$($item1c)`t$($expected_value1c)`t$($current_value1c)`t$($status1c)"
    $report_line6 = "$($hostname)`t$($control)`t$($item2c)`t$($expected_value2c)`t$($current_value2c)`t$($status2c)"
    Write-Report $report_line1
    Write-Report $report_line2
    Write-Report $report_line3
    Write-Report $report_line4
    Write-Report $report_line5
    Write-Report $report_line6
  }
}

function describe_single_duo_one()
{
  Param(
    [parameter(Mandatory=$true)]
    $control, 
    [parameter(Mandatory=$true)]
    $item1, 
    [parameter(Mandatory=$true)]
    $item2, 
    [parameter(Mandatory=$false)]
    $current_value1 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1 = $null,
    [parameter(Mandatory=$false)]
    $current_value2 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2 = $null,
    [parameter(Mandatory=$false)]
    $opr1 = "-eq",
    [parameter(Mandatory=$false)]
    $opr2 = "-eq",
    [parameter(Mandatory=$false)]
    $only_if = $true
    )

    $status1 = "pass"
    $status2 = "pass"

    $opr_list = @('-eq','-ge','-gt','-le','-like','-lt','-ne','-notlike')
    $opr_index1 = $opr_list.IndexOf($opr1)
    $opr_index2 = $opr_list.IndexOf($opr2)

    $opr_desc = @('equal','greater_than_equal','greater_than','less_than_equal','like','less_than','not_equal','not_like')

    
  if($false -eq $only_if)
  {
    $status = "skip"
    Write-Host "Control $control" -ForegroundColor Yellow
  }
  else
  {
    if($opr_index1 -eq -1)
    {
      Write-Error "$($opr1) operator is invalid!" 
      break;
    }
    elseif($opr_index1 -eq 0) 
    {
      if(-not($current_value1 -eq $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 1) 
    {
      if(-not($current_value1 -ge $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 2) 
    {
      if(-not($current_value1 -gt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 3) 
    {
      if(-not($current_value1 -le $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 4) 
    {
      if(-not($current_value1 -like $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 5) 
    {
      if(-not($current_value1 -lt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 6) 
    {
      if(-not($current_value1 -ne $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 7) 
    {
      if(-not($current_value1 -notlike $expected_value1)) { $status1 = 'fail' }
    }

    if($opr_index2 -eq -1)
    {
      Write-Error "$($opr1) operator is invalid!" 
      break;
    }
    elseif($opr_index2 -eq 0) 
    {
      if(-not($current_value2 -eq $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 1) 
    {
      if(-not($current_value2 -ge $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 2) 
    {
      if(-not($current_value2 -gt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 3) 
    {
      if(-not($current_value2 -le $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 4) 
    {
      if(-not($current_value2 -like $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 5) 
    {
      if(-not($current_value2 -lt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 6) 
    {
      if(-not($current_value2 -ne $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 7) 
    {
      if(-not($current_value2 -notlike $expected_value2)) { $status2 = 'fail' }
    }
  }

  #Write report
  if($status -eq 'skip')
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)" 
    Write-Report $report_line
  }
  elseif($status1 -eq 'pass')
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1)`t$($expected_value1)`t$($current_value1)`t$($status1)"
    Write-Report $report_line1
  }
  elseif($status2 -eq 'pass')
  {
    $report_line2 = "$($hostname)`t$($control)`t$($item2)`t$($expected_value2)`t$($current_value2)`t$($status2)"
    Write-Report $report_line2
  }
  else 
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)" 
    $report_line1 = "$($hostname)`t$($control)`t$($item1)`t$($expected_value1)`t$($current_value1)`t$($status1)"
    $report_line2 = "$($hostname)`t$($control)`t$($item2)`t$($expected_value2)`t$($current_value2)`t$($status2)"
    Write-Report $report_line
    Write-Report $report_line1
    Write-Report $report_line2
  }
}

function describe_single_quad_all()
{
  Param(
    [parameter(Mandatory=$true)]
    $control, 
    [parameter(Mandatory=$true)]
    $item1, 
    [parameter(Mandatory=$true)]
    $item2, 
    [parameter(Mandatory=$true)]
    $item3,
    [parameter(Mandatory=$true)]
    $item4,
    [parameter(Mandatory=$false)]
    $current_value1 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1 = $null,
    [parameter(Mandatory=$false)]
    $current_value2 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2 = $null,
    [parameter(Mandatory=$false)]
    $current_value3 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value3 = $null,
    [parameter(Mandatory=$false)]
    $current_value4 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value4 = $null,
    [parameter(Mandatory=$false)]
    $opr1 = "-eq",
    [parameter(Mandatory=$false)]
    $opr2 = "-eq",
    [parameter(Mandatory=$false)]
    $opr3 = "-eq",
    [parameter(Mandatory=$false)]
    $opr4 = "-eq",
    [parameter(Mandatory=$false)]
    $only_if = $true
    )

  $status1 = "pass"
  $status2 = "pass"
  $status3 = "pass"
  $status4 = "pass"
  $opr_list = @('-eq','-ge','-gt','-le','-like','-lt','-ne','-notlike')
  $opr_index1 = $opr_list.IndexOf($opr1)
  $opr_index2 = $opr_list.IndexOf($opr2)
  $opr_index3 = $opr_list.IndexOf($opr3)
  $opr_index4 = $opr_list.IndexOf($opr4)
  $opr_desc = @('equal','greater_than_equal','greater_than','less_than_equal','like','less_than','not_equal','not_like')

  if($false -eq $only_if)
  {
    $status = "skip"
    Write-Host "Control $control" -ForegroundColor Yellow
  }
  else
  {
    if($opr_index1 -eq -1)
    {
      Write-Error "$($opr1) operator is invalid!" 
      break;
    }
    elseif($opr_index1 -eq 0) 
    {
      if(-not($current_value1 -eq $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 1) 
    {
      if(-not($current_value1 -ge $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 2) 
    {
      if(-not($current_value1 -gt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 3) 
    {
      if(-not($current_value1 -le $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 4) 
    {
      if(-not($current_value1 -like $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 5) 
    {
      if(-not($current_value1 -lt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 6) 
    {
      if(-not($current_value1 -ne $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 7) 
    {
      if(-not($current_value1 -notlike $expected_value1)) { $status1 = 'fail' }
    }

    if($opr_index2 -eq -1)
    {
      Write-Error "$($opr2) operator is invalid!" 
      break;
    }
    elseif($opr_index2 -eq 0) 
    {
      if(-not($current_value2 -eq $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 1) 
    {
      if(-not($current_value2 -ge $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 2) 
    {
      if(-not($current_value2 -gt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 3) 
    {
      if(-not($current_value2 -le $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 4) 
    {
      if(-not($current_value2 -like $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 5) 
    {
      if(-not($current_value2 -lt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 6) 
    {
      if(-not($current_value2 -ne $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 7) 
    {
      if(-not($current_value2 -notlike $expected_value2)) { $status2 = 'fail' }
    }    

    if($opr_index3 -eq -1)
    {
      Write-Error "$($opr3) operator is invalid!" 
      break;
    }
    elseif($opr_index3 -eq 0) 
    {
      if(-not($current_value3 -eq $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 1) 
    {
      if(-not($current_value3 -ge $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 2) 
    {
      if(-not($current_value3 -gt $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 3) 
    {
      if(-not($current_value3 -le $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 4) 
    {
      if(-not($current_value3 -like $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 5) 
    {
      if(-not($current_value3 -lt $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 6) 
    {
      if(-not($current_value3 -ne $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 7) 
    {
      if(-not($current_value3 -notlike $expected_value3)) { $status3 = 'fail' }
    }    

    if($opr_index4 -eq -1)
    {
      Write-Error "$($opr4) operator is invalid!" 
      break;
    }
    elseif($opr_index4 -eq 0) 
    {
      if(-not($current_value4 -eq $expected_value4)) { $status4 = 'fail' }
    }
    elseif($opr_index4 -eq 1) 
    {
      if(-not($current_value4 -ge $expected_value4)) { $status4 = 'fail' }
    }
    elseif($opr_index4 -eq 2) 
    {
      if(-not($current_value4 -gt $expected_value4)) { $status4 = 'fail' }
    }
    elseif($opr_index4 -eq 3) 
    {
      if(-not($current_value4 -le $expected_value4)) { $status4 = 'fail' }
    }
    elseif($opr_index4 -eq 4) 
    {
      if(-not($current_value4 -like $expected_value4)) { $status4 = 'fail' }
    }
    elseif($opr_index4 -eq 5) 
    {
      if(-not($current_value4 -lt $expected_value4)) { $status4 = 'fail' }
    }
    elseif($opr_index4 -eq 6) 
    {
      if(-not($current_value4 -ne $expected_value4)) { $status4 = 'fail' }
    }
    elseif($opr_index4 -eq 7) 
    {
      if(-not($current_value4 -notlike $expected_value4)) { $status4 = 'fail' }
    }    

    if($status1 -eq 'pass' -and $status2 -eq 'pass' -and $status3 -eq 'pass' -and $status4 -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Green
      Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Green
      Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Green
      Write-Host "  '$($item4)' is $($opr_desc[$opr_index4]) '$($expected_value4)'" -ForegroundColor Green
    }
    else
    {
      Write-Host "Control $control" -ForegroundColor Red
      if($status1 -eq 'pass')
      {
        Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value1)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value1)'" -ForegroundColor Red
      }

      if($status2 -eq 'pass')
      {
        Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value2)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value2)'" -ForegroundColor Red
      }

      if($status3 -eq 'pass')
      {
        Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value3)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value3)'" -ForegroundColor Red
      }
    
      if($status4 -eq 'pass')
      {
        Write-Host "  '$($item4)' is $($opr_desc[$opr_index4]) '$($expected_value4)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item4)' is $($opr_desc[$opr_index4]) '$($expected_value4)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value4)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value4)'" -ForegroundColor Red
      }
    }
  }

  #Write report
  if($status -eq 'skip')
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)" 
    Write-Report $report_line
  }
  else 
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1) is $($opr_desc[$opr_index1]) '$($expected_value1)'`t$($expected_value1)`t$($current_value1)`t$($status1)"
    Write-Report $report_line1
    $report_line2 = "$($hostname)`t$($control)`t$($item2) is $($opr_desc[$opr_index2]) '$($expected_value2)'`t$($expected_value2)`t$($current_value2)`t$($status2)"
    Write-Report $report_line2
    $report_line3 = "$($hostname)`t$($control)`t$($item3) is $($opr_desc[$opr_index3]) '$($expected_value3)'`t$($expected_value3)`t$($current_value3)`t$($status3)"
    Write-Report $report_line3
    $report_line4 = "$($hostname)`t$($control)`t$($item4) is $($opr_desc[$opr_index4]) '$($expected_value4)'`t$($expected_value4)`t$($current_value4)`t$($status4)"
    Write-Report $report_line4
  }
}

function describe_single_trio_all()
{
  Param(
    [parameter(Mandatory=$true)]
    $control, 
    [parameter(Mandatory=$true)]
    $item1, 
    [parameter(Mandatory=$true)]
    $item2, 
    [parameter(Mandatory=$true)]
    $item3,
    [parameter(Mandatory=$false)]
    $current_value1 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1 = $null,
    [parameter(Mandatory=$false)]
    $current_value2 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2 = $null,
    [parameter(Mandatory=$false)]
    $current_value3 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value3 = $null,
    [parameter(Mandatory=$false)]
    $opr1 = "-eq",
    [parameter(Mandatory=$false)]
    $opr2 = "-eq",
    [parameter(Mandatory=$false)]
    $opr3 = "-eq",
    [parameter(Mandatory=$false)]
    $only_if = $true
    )

  $status1 = "pass"
  $status2 = "pass"
  $status3 = "pass"
  $opr_list = @('-eq','-ge','-gt','-le','-like','-lt','-ne','-notlike')
  $opr_index1 = $opr_list.IndexOf($opr1)
  $opr_index2 = $opr_list.IndexOf($opr2)
  $opr_index3 = $opr_list.IndexOf($opr3)
  $opr_desc = @('equal','greater_than_equal','greater_than','less_than_equal','like','less_than','not_equal','not_like')

  if($false -eq $only_if)
  {
    $status = "skip"
    Write-Host "Control $control" -ForegroundColor Yellow
  }
  else
  {
    if($opr_index1 -eq -1)
    {
      Write-Error "$($opr1) operator is invalid!" 
      break;
    }
    elseif($opr_index1 -eq 0) 
    {
      if(-not($current_value1 -eq $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 1) 
    {
      if(-not($current_value1 -ge $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 2) 
    {
      if(-not($current_value1 -gt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 3) 
    {
      if(-not($current_value1 -le $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 4) 
    {
      if(-not($current_value1 -like $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 5) 
    {
      if(-not($current_value1 -lt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 6) 
    {
      if(-not($current_value1 -ne $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 7) 
    {
      if(-not($current_value1 -notlike $expected_value1)) { $status1 = 'fail' }
    }

    if($opr_index2 -eq -1)
    {
      Write-Error "$($opr2) operator is invalid!" 
      break;
    }
    elseif($opr_index2 -eq 0) 
    {
      if(-not($current_value2 -eq $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 1) 
    {
      if(-not($current_value2 -ge $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 2) 
    {
      if(-not($current_value2 -gt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 3) 
    {
      if(-not($current_value2 -le $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 4) 
    {
      if(-not($current_value2 -like $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 5) 
    {
      if(-not($current_value2 -lt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 6) 
    {
      if(-not($current_value2 -ne $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 7) 
    {
      if(-not($current_value2 -notlike $expected_value2)) { $status2 = 'fail' }
    }    

    if($opr_index3 -eq -1)
    {
      Write-Error "$($opr3) operator is invalid!" 
      break;
    }
    elseif($opr_index3 -eq 0) 
    {
      if(-not($current_value3 -eq $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 1) 
    {
      if(-not($current_value3 -ge $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 2) 
    {
      if(-not($current_value3 -gt $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 3) 
    {
      if(-not($current_value3 -le $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 4) 
    {
      if(-not($current_value3 -like $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 5) 
    {
      if(-not($current_value3 -lt $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 6) 
    {
      if(-not($current_value3 -ne $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 7) 
    {
      if(-not($current_value3 -notlike $expected_value3)) { $status3 = 'fail' }
    }    

    if($status1 -eq 'pass' -and $status2 -eq 'pass' -and $status3 -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Green
      Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Green
      Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Green
    }
    else
    {
      Write-Host "Control $control" -ForegroundColor Red
      if($status1 -eq 'pass')
      {
        Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value1)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value1)'" -ForegroundColor Red
      }

      if($status2 -eq 'pass')
      {
        Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value2)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value2)'" -ForegroundColor Red
      }

      if($status3 -eq 'pass')
      {
        Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Green
      }
      else 
      {
        Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Red
        Write-Host "  expected: '$($expected_value3)'" -ForegroundColor Red
        Write-Host "       got: '$($current_value3)'" -ForegroundColor Red
      }
    }
  }

  #Write report
  if($status -eq 'skip')
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)" 
    Write-Report $report_line
  }
  else 
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1) is $($opr_desc[$opr_index1]) '$($expected_value1)'`t$($expected_value1)`t$($current_value1)`t$($status1)"
    Write-Report $report_line1
    $report_line2 = "$($hostname)`t$($control)`t$($item2) is $($opr_desc[$opr_index2]) '$($expected_value2)'`t$($expected_value2)`t$($current_value2)`t$($status2)"
    Write-Report $report_line2
    $report_line3 = "$($hostname)`t$($control)`t$($item3) is $($opr_desc[$opr_index3]) '$($expected_value3)'`t$($expected_value3)`t$($current_value3)`t$($status3)"
    Write-Report $report_line3
  }
}

function describe_single_trio_one()
{
  Param(
    [parameter(Mandatory=$true)]
    $control, 
    [parameter(Mandatory=$true)]
    $item1, 
    [parameter(Mandatory=$true)]
    $item2, 
    [parameter(Mandatory=$true)]
    $item3,
    [parameter(Mandatory=$false)]
    $current_value1 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value1 = $null,
    [parameter(Mandatory=$false)]
    $current_value2 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value2 = $null,
    [parameter(Mandatory=$false)]
    $current_value3 = $null, 
    [parameter(Mandatory=$false)]
    $expected_value3 = $null,
    [parameter(Mandatory=$false)]
    $opr1 = "-eq",
    [parameter(Mandatory=$false)]
    $opr2 = "-eq",
    [parameter(Mandatory=$false)]
    $opr3 = "-eq",
    [parameter(Mandatory=$false)]
    $only_if = $true
    )

  $status1 = "pass"
  $status2 = "pass"
  $status3 = "pass"
  $opr_list = @('-eq','-ge','-gt','-le','-like','-lt','-ne','-notlike')
  $opr_index1 = $opr_list.IndexOf($opr1)
  $opr_index2 = $opr_list.IndexOf($opr2)
  $opr_index3 = $opr_list.IndexOf($opr3)
  $opr_desc = @('equal','greater_than_equal','greater_than','less_than_equal','like','less_than','not_equal','not_like')

  if($false -eq $only_if)
  {
    $status = "skip"
    Write-Host "Control $control" -ForegroundColor Yellow
  }
  else
  {
    if($opr_index1 -eq -1)
    {
      Write-Error "$($opr1) operator is invalid!" 
      break;
    }
    elseif($opr_index1 -eq 0) 
    {
      if(-not($current_value1 -eq $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 1) 
    {
      if(-not($current_value1 -ge $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 2) 
    {
      if(-not($current_value1 -gt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 3) 
    {
      if(-not($current_value1 -le $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 4) 
    {
      if(-not($current_value1 -like $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 5) 
    {
      if(-not($current_value1 -lt $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 6) 
    {
      if(-not($current_value1 -ne $expected_value1)) { $status1 = 'fail' }
    }
    elseif($opr_index1 -eq 7) 
    {
      if(-not($current_value1 -notlike $expected_value1)) { $status1 = 'fail' }
    }

    if($opr_index2 -eq -1)
    {
      Write-Error "$($opr2) operator is invalid!" 
      break;
    }
    elseif($opr_index2 -eq 0) 
    {
      if(-not($current_value2 -eq $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 1) 
    {
      if(-not($current_value2 -ge $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 2) 
    {
      if(-not($current_value2 -gt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 3) 
    {
      if(-not($current_value2 -le $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 4) 
    {
      if(-not($current_value2 -like $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 5) 
    {
      if(-not($current_value2 -lt $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 6) 
    {
      if(-not($current_value2 -ne $expected_value2)) { $status2 = 'fail' }
    }
    elseif($opr_index2 -eq 7) 
    {
      if(-not($current_value2 -notlike $expected_value2)) { $status2 = 'fail' }
    }    

    if($opr_index3 -eq -1)
    {
      Write-Error "$($opr3) operator is invalid!" 
      break;
    }
    elseif($opr_index3 -eq 0) 
    {
      if(-not($current_value3 -eq $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 1) 
    {
      if(-not($current_value3 -ge $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 2) 
    {
      if(-not($current_value3 -gt $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 3) 
    {
      if(-not($current_value3 -le $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 4) 
    {
      if(-not($current_value3 -like $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 5) 
    {
      if(-not($current_value3 -lt $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 6) 
    {
      if(-not($current_value3 -ne $expected_value3)) { $status3 = 'fail' }
    }
    elseif($opr_index3 -eq 7) 
    {
      if(-not($current_value3 -notlike $expected_value3)) { $status3 = 'fail' }
    }    

    if($status1 -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Green
    }
    elseif($status2 -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Green
    }
    elseif($status3 -eq 'pass')
    {
      Write-Host "Control $control" -ForegroundColor Green
      Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Green
    }
    else
    {
      Write-Host "Control $control" -ForegroundColor Red
      Write-Host "  '$($item1)' is $($opr_desc[$opr_index1]) '$($expected_value1)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value1)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value1)'" -ForegroundColor Red
      Write-Host "  '$($item2)' is $($opr_desc[$opr_index2]) '$($expected_value2)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value2)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value2)'" -ForegroundColor Red
      Write-Host "  '$($item3)' is $($opr_desc[$opr_index3]) '$($expected_value3)'" -ForegroundColor Red
      Write-Host "  expected: '$($expected_value3)'" -ForegroundColor Red
      Write-Host "       got: '$($current_value3)'" -ForegroundColor Red
    }
  }

  #Write report
  if($status -eq 'skip')
  {
    $report_line = "$($hostname)`t$($control)`t$('')`t$('')`t$('')`t$($status)" 
    Write-Report $report_line
  }
  elseif($status1 -eq 'pass')
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1) is $($opr_desc[$opr_index1]) '$($expected_value1)'`t$($expected_value1)`t$($current_value1)`t$($status1)"
    Write-Report $report_line1
  }
  elseif($status2 -eq 'pass')
  {
    $report_line2 = "$($hostname)`t$($control)`t$($item2) is $($opr_desc[$opr_index2]) '$($expected_value2)'`t$($expected_value2)`t$($current_value2)`t$($status2)"
    Write-Report $report_line2
  }
  elseif($status3 -eq 'pass')
  {
    $report_line3 = "$($hostname)`t$($control)`t$($item3) is $($opr_desc[$opr_index3]) '$($expected_value3)'`t$($expected_value3)`t$($current_value3)`t$($status3)"
    Write-Report $report_line3
  }
  else 
  {
    $report_line1 = "$($hostname)`t$($control)`t$($item1) is $($opr_desc[$opr_index1]) '$($expected_value1)'`t$($expected_value1)`t$($current_value1)`t$($status1)"
    Write-Report $report_line1
    $report_line2 = "$($hostname)`t$($control)`t$($item2) is $($opr_desc[$opr_index2]) '$($expected_value2)'`t$($expected_value2)`t$($current_value2)`t$($status2)"
    Write-Report $report_line2
    $report_line3 = "$($hostname)`t$($control)`t$($item3) is $($opr_desc[$opr_index3]) '$($expected_value3)'`t$($expected_value3)`t$($current_value3)`t$($status3)"
    Write-Report $report_line3
  }
}
