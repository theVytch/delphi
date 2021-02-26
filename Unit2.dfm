object FormCadastro: TFormCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 317
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 82
    Top = 85
    Width = 19
    Height = 16
    Caption = 'Cpf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 67
    Top = 181
    Width = 34
    Height = 16
    Caption = 'Cargo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 6
    Top = 133
    Width = 95
    Height = 16
    Caption = 'Data nascimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 68
    Top = 45
    Width = 33
    Height = 16
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 104
    Top = 40
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 104
    Top = 80
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 11
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
    Text = 'Edit1'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 104
    Top = 128
    Width = 145
    Height = 24
    Date = 44250.000000000000000000
    Time = 0.567475289353751600
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 262
    Top = 284
    Width = 75
    Height = 25
    Hint = 'Salva candidato'
    Caption = 'salvar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 166
    Top = 284
    Width = 75
    Height = 25
    Hint = 
      'Para atualizar coloque o cpf, atualizara o nome e a data de nasc' +
      'imento'
    Caption = 'Atualizar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 69
    Top = 284
    Width = 75
    Height = 25
    Hint = 'Para deletar s'#243' precisa colocar o CPF'
    Caption = 'Deletar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Button3Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 107
    Top = 176
    Width = 145
    Height = 24
    DataField = 'cargo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'cargo'
    ListField = 'cargo'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 3
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Database=cadastro'
      'DriverID=MySQL')
    Connected = True
    Left = 32
    Top = 200
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 56
    Top = 256
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\Nk1\Documents\Embarcadero\Studio\Projects\libmysql.dll'
    Left = 16
    Top = 65528
  end
  object DataSource1: TDataSource
    DataSet = FDQuery2
    Left = 264
    Top = 216
  end
  object FDQuery2: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select cargo from vagas')
    Left = 280
    Top = 144
    object FDQuery2cargo: TStringField
      FieldName = 'cargo'
      Origin = 'CARGO'
      Required = True
      Size = 40
    end
  end
end
