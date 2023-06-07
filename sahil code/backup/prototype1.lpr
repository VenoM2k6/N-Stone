program prototype1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, Playerclass, Unit3, Unit4;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tmenu, menu);
  Application.CreateForm(Tingame, ingame);
  Application.CreateForm(Tchoose, choose);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

