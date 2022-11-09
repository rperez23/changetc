#! /usr/bin/perl

$inf = shift(@ARGV);

unless (open INF,"<$inf")
{
  print("   ~~~Cannot open input file $inf~~~\n");
  exit(1);
}

while(<INF>)
{
  chomp;

  if (/^01(.+)/)
  {
    $rest = $1;
    print("00$rest\n");
  }
  else
  {
    print("$_\n");
  }

}
close(INF);
