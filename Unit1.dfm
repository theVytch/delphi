object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 284
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 56
    Top = 104
    Width = 97
    Height = 41
    Caption = 'Cadastrar-se'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 104
    Width = 97
    Height = 41
    Caption = 'Comparar'
    TabOrder = 1
  end
  object Button3: TButton
    Left = 360
    Top = 104
    Width = 97
    Height = 41
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = Button3Click
  end
end
