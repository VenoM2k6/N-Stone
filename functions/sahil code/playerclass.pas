unit playerclass;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
   TPlayerclass = class
   private
      fName: string;
      fHp, fMana: integer;
      fClassP: string;
   public
      property Name: string read fName write fName;
      property Hp: integer read fHp write fHp;
      property Mana: integer read fMana write fMana;
      property ClassP: string read fClassP write fClassP;
   end;

implementation

end.

