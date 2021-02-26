unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, Data.Win.ADODB;

type
  TFormCadastro = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    Button1: TButton;
    DataSource1: TDataSource;
    Button2: TButton;
    Button3: TButton;
    FDQuery2: TFDQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQuery2cargo: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure sqlInser;
    procedure sqlAltera;
    procedure sqlDelete;
    function validaLetras(S: string): Boolean;
    procedure validaCampos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}


procedure TFormCadastro.validaCampos;
begin
if (Edit1.Text = '') OR (Edit2.Text = '') OR (DBLookupComboBox1.Text = '') then
  begin
    ShowMessage('Campo nome, cpf e cargo nao podem ficar em branco!');
    abort;
  end
else if validaLetras(Edit1.text) = false then
begin
  ShowMessage('o campo nome nao pode ter numeros!');
  abort;
end;
end;

procedure TFormCadastro.Button1Click(Sender: TObject);
begin
   validaCampos;
    sqlInser;
    FormCadastro.Destroy;
end;

procedure TFormCadastro.sqlInser;
const sql : String =  'INSERT INTO candidato(NOME,CPF,DATA_NASCIMENTO, CARGO)VALUES( :NOME, :CPF, :DATA_NASCIMENTO, :CARGO)';
begin
    FDQuery1.Active := False;
    FDQuery1.SQL.Add(sql);
    FDQuery1.Params.ParamByName('NOME').AsString := Edit1.Text;
    FDQuery1.Params.ParamByName('CPF').AsString := Edit2.Text;
    FDQuery1.Params.ParamByName('DATA_NASCIMENTO').AsDate := DateTimePicker1.DateTime;
    FDQuery1.Params.ParamByName('CARGO').AsString := DBLookupComboBox1.Text;
    FDQuery1.ExecSQL;
end;


procedure TFormCadastro.Button2Click(Sender: TObject);
begin
  if Edit2.Text = ''then
    begin
    ShowMessage('Campo cpf nao podem ficar em branco!');
    end
    else
    begin
    sqlAltera;
    FormCadastro.Destroy;
    end;
end;

procedure TFormCadastro.Button3Click(Sender: TObject);
begin
if Edit2.Text = ''then
    begin
    ShowMessage('Campo cpf nao podem ficar em branco!');
    end
    else
    begin
    sqlDelete;
    FormCadastro.Destroy;
    end;
end;

procedure TFormCadastro.FormShow(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
end;

procedure TFormCadastro.sqlAltera;
const sql : String =  'UPDATE candidato SET NOME = :NOME, DATA_NASCIMENTO = :DATA_NASCIMENTO, CPF = :CPF, CARGO = :CARGO  WHERE CPF = :CPF ';
begin
    FDQuery1.Active := False;
    FDQuery1.SQL.Add(sql);
    FDQuery1.Params.ParamByName('NOME').AsString := Edit1.Text;
    FDQuery1.Params.ParamByName('CPF').AsString := Edit2.Text;
    FDQuery1.Params.ParamByName('DATA_NASCIMENTO').AsDate := DateTimePicker1.DateTime;
     FDQuery1.Params.ParamByName('CARGO').AsString := DBLookupComboBox1.Text;
    FDQuery1.ExecSQL;
end;

procedure TFormCadastro.sqlDelete;
const sql : String =  'DELETE FROM candidato WHERE CPF = :CPF ';
begin
    FDQuery1.Active := False;
    FDQuery1.SQL.Add(sql);
    FDQuery1.Params.ParamByName('CPF').AsString := Edit2.Text;
    FDQuery1.ExecSQL;
end;

function TFormCadastro.validaLetras(S: string): Boolean;
var
  i: Integer;
begin
  for i := 1 to Length(S) do
    if not(S[i] in ['0' .. '9']) then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
  Exit;
end;


end.
