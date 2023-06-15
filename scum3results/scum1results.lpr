program scum1results;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, ingame, playerclass, cardclass, lobbycode, menucode
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TshowIngame, showIngame);
  Application.CreateForm(Tlobby, lobby);
  Application.CreateForm(Tmenu, menu);
  Application.Run;
end.

