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
  Forms, ingame, playerclass, cardclass, lobbycode, menucode,
  CloseSpecificForms, logincode
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TshowIngame, showIngame);
  Application.CreateForm(Tlobby, lobby);
  Application.CreateForm(TmenuBetween, menuBetween);
  Application.CreateForm(Tloginmenu, loginmenu);
  Application.Run;
end.

