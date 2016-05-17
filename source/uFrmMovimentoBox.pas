unit uFrmMovimentoBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit, Buttons, Grids, DBGrids, DB,
  FMTBcd, DBClient, Provider, SqlExpr;

type
  TFrmMovimentoBox = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtUsuario: TEdit;
    Label2: TLabel;
    edtDtMovi: TDateEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    grdConsultar: TDBGrid;
    btnConsulta: TBitBtn;
    dsCadastro: TDataSource;
    SQLDataSet1: TSQLDataSet;
    dstConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    dsConsultar: TDataSource;
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_FANTASIA: TStringField;
    cdsConsultarCLI_CGC: TStringField;
    cdsConsultarCLI_NRBOX: TStringField;
    cdsConsultarCLI_TIPOPESSOA: TStringField;
    cdsConsultarCLI_CDGRUPO: TIntegerField;
    Panel4: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    lblRegistro: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure edtDtMoviExit(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovimentoBox: TFrmMovimentoBox;

implementation

uses udmDados, UFrmAdmin, uFuncoes;

{$R *.dfm}

procedure TFrmMovimentoBox.FormShow(Sender: TObject);
begin
     edtDtMovi.Date := Date();
     //
     edtUsuario.Text := uFuncoes.NOME_CAIXA(StrtoInt(UFrmAdmin.M_CDUSUA))
end;

procedure TFrmMovimentoBox.btnConsultaClick(Sender: TObject);
Var
   iLoja, iUsuario, iCliente : Integer;
   aHora, aBox : String;
begin
      If uFuncoes.Empty(uFuncoes.RemoveChar(edtDtMovi.Text)) Then
      begin
           Application.MessageBox('Digite uma data.',
                   'ATEN��O', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           //
           edtDtMovi.Date := Date;
           edtDtMovi.SetFocus;
           Exit;
      End;
      //
      iLoja := 1;
      iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
      aHora := Copy(TimetoStr(Time),1,5);
      //
    btnConsulta.enabled := False;
    try
      Screen.Cursor := crHourGlass;
      //
      With dmDados.cdsMovimentoBox do
      begin
           DisableControls;
           Close;
           Params[0].AsDate    := edtDtMovi.Date;
           Params[1].AsInteger := iUsuario;
           Open;
           //
           If (IsEmpty) Then
           begin
                With cdsConsultar do
                begin
                     Close;
                     Params[0].AsInteger := 3;
                     Params[1].AsInteger := 17;
                     Open;
                     //
                     If not (IsEmpty) Then
                     begin
                          First;
                          While not (Eof) do
                          begin
                               iCliente := FieldByName('CLI_CODIGO').AsInteger;
                               aBox     := FieldByName('CLI_NRBOX').AsString;
                               {iLoja, iCLIENTE, iUSUARIO: Integer;
                               aDTMOVI: TDATE; aHOMOVI, aNUMBOX: String
                               }
                               dmDados.AddRegistroMov_Box(iLoja, iCliente, iUsuario, edtDtMovi.Date, aHora, aBox);
                               //
                               Next;
                          End;
                     End;
                     //
                End;
           End;
           //
           EnableControls;
      End;
    Finally
        Screen.Cursor := crDefault;
        btnConsulta.enabled := true;
    End;
    Application.ProcessMessages;
end;

procedure TFrmMovimentoBox.edtDtMoviExit(Sender: TObject);
begin
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDtMovi.Text)) Then
     Begin
          try
              StrToDate(edtDtMovi.Text);
              edtDtMovi.Text := DatetoStr(edtDtMovi.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDtMovi.Clear;
                     edtDtMovi.SetFocus;
                End;
           end;
     End;
end;

procedure TFrmMovimentoBox.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
  //
  lblRegistro.Caption := 'Registro(s): '+ InttoStr(dsCadastro.DataSet.RecNo)+'/'+ InttoStr(dsCadastro.DataSet.RecordCount);
end;

procedure TFrmMovimentoBox.sbPrimeiroClick(Sender: TObject);
begin
     If (dsCadastro.DataSet.Active) then
        dsCadastro.DataSet.First;
end;

procedure TFrmMovimentoBox.sbAnteriorClick(Sender: TObject);
begin
     If (dsCadastro.DataSet.Active) then
        dsCadastro.DataSet.Prior;
end;

procedure TFrmMovimentoBox.sbProximoClick(Sender: TObject);
begin
     If (dsCadastro.DataSet.Active) then
        dsCadastro.DataSet.Next;
end;

procedure TFrmMovimentoBox.sbUltimoClick(Sender: TObject);
begin
     If (dsCadastro.DataSet.Active) then
        dsCadastro.DataSet.Last;
end;

end.
