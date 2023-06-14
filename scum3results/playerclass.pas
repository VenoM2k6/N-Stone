unit playerclass;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  TPlayer = class
    private
      FHp: Integer;
      FMana: Integer;
      FManaPerRound: Integer;
    public
      property Hp: Integer read FHp write FHp;
      property Mana: Integer read FMana write FMana;
      property ManaPerRound: Integer read FManaPerRound write FManaPerRound;
  end;

implementation

end.

