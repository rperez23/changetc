#!/usr/bin/perl

#change first timecode to 01:00:00;00

foreach $inf (@ARGV)
{

  $deleteme = 'YES';
  $nummods  = 0;


  $outf = "fixed-tc/$inf";
  #$outf =~ s/.scc/_ENG.scc/;
  #print("$inf -> $outf\n");


  unless (open INF, "<$inf")
  {
    print("Cannot Open input file $inf\n");
    exit(1);
  }

  unless (open OUTF, ">$outf")
  {
    print("Cannot open output file $outf\n");
    exit(1);
  }

  while(<INF>)
  {
    chomp;

    $txt = $_;

    if (/^00:\d{2}:\d{2}([:;])\d{2}/)
    {
      #$txt =~ s/^00:/01:/;
      $txt = "01:00:00${1}00$'";
      $deleteme = 'NO';
      $nummods += 1;
    }

    print OUTF ("$txt\n");
  }

  close(INF);
  close(OUTF);

  if ($deleteme eq 'YES')
  {
    #delete the out file since nothing was done
    $delcmd = "rm fixed-tc/$inf";
    #print("No changes : $delcmd\n");
    `$delcmd`;
  }
  else
  {
    print("$inf : $nummods changes made\n");
  }

}
