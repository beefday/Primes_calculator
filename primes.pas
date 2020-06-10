program primes;
{$mode objfpc}{$H+}
uses crt,sysutils;
var cis,i,l,pprv:QWord;
    F,FF,FFF:TextFile;
begin
AssignFile(FFF,'save.txt');
AssignFile(FF,'logprv.txt');
AssignFile(F,'prv.txt');
try
    // Create the file, write some text and close it.
    reset(FFF);
    Readln(FFF,cis);

  except
    // If there was an error the reason can be found here
    on E: EInOutError do
    begin
    rewrite(FFF);
    cis:=1;
    end;
end;
  try
      // Create the file, write some text and close it.
      reset(F);
      reset(FF);

    except
      // If there was an error the reason can be found here
      on E: EInOutError do
      begin
      Rewrite(F);
      rewrite(FF);
      end;
  end;
clrscr;
Writeln(cis);
repeat
 begin
 cis:=cis+2;
 l:=0;
 If (((cis)mod(2))=0) then
 begin
 l:=l+1;
 end;
 If (((cis)mod(2))<>0) then
 begin
 i:=(cis-(cis-1));
 repeat
   begin
   i:=i+2;
  If (((cis)mod(i))=0) then
      begin
        l:=l+1
      end;
   end;
 until (i=(cis-2)) or (l>0);
 end;
  If (l=0) then
   begin
     pprv:=cis;
     append(F);
     append(FF);
     writeln(F,pprv);
     writeln(FF,pprv);
     writeln(FF,DateTimeToStr(now));
     writeln(FF,' ');
     CloseFile(FF);
     CloseFile(F);
   end;
 end;
rewrite(FFF);
writeln(FFF,cis);
CloseFile(FFF);
until keypressed;
clrscr;
writeln('Nejvetsi nalezene prvocislo ',pprv);
writeln;
writeln('Pro ukonceni stisknete ENTER!');
readln;
readln;
end.
