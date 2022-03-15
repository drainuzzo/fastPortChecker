function testport ($hostname=$args[0],[int[]]$Port=$args[1],$timeout=200) {

    ForEach ($P  in $Port)  {
      $requestCallback = $state = $null
      $client = New-Object System.Net.Sockets.TcpClient
      $beginConnect = $client.BeginConnect($hostname,$P,$requestCallback,$state)
      Start-Sleep -milli $timeOut
      if ($client.Connected) { $open = $true } else { $open = $false }
      $client.Close()
      [pscustomobject]@{hostname=$hostname;port=$P;open=$open}
    }
}


testport $args[0] $args[1]
