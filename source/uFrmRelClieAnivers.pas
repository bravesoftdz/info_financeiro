unit uFrmRelClieAnivers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, Provider, DBClient,
  SqlExpr, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl,
  ppDB, ppBands, ppCache, ppDBPipe, ppVar;

type
  TfrmRelClinAniversariantes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    Label1: TLabel;
    edtMes: TEdit;
    lnl_NMMES: TLabel;
    dstClientes: TSQLDataSet;
    cdsClientes: TClientDataSet;
    dspClientes: TDataSetProvider;
    dsClientes: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosCLI_CODIGO: TIntegerField;
    cdsDadosCLI_NOME: TStringField;
    cdsDadosCLI_DTNASC: TDateField;
    cdsDadosCLI_DIA: TIntegerField;
    cdsDadosCLI_FONE: TStringField;
    cdsClientesCLI_CODIGO: TIntegerField;
    cdsClientesCLI_FANTASIA: TStringField;
    cdsClientesCLI_RAZAO: TStringField;
    cdsClientesCLI_FONE1: TStringField;
    cdsClientesCLI_DTANIVERSARIO: TDateField;
    ppReport1: TppReport;
    ppDBClientes: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppDBImage1: TppDBImage;
    ppLine3: TppLine;
    lblRelatorio: TppLabel;
    txtMes: TppLabel;
    ppLine1: TppLine;
    ppLine5: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    dstContatos: TSQLDataSet;
    dspContatos: TDataSetProvider;
    cdsContatos: TClientDataSet;
    cdsContatosCON_CODIGO: TIntegerField;
    cdsContatosCLI_CODIGO: TIntegerField;
    cdsContatosCON_NOME: TStringField;
    cdsContatosCON_DATANASC: TDateField;
    cdsContatosCON_FONE: TStringField;
    cdsContatosCON_CELULAR: TStringField;
    dsContatos: TDataSource;
    cmbMeses: TComboBox;
    procedure BtSairClick(Sender: TObject);
    procedure edtMesKeyPress(Sender: TObject; var Key: Char);
    procedure edtMesExit(Sender: TObject);
    procedure edtMesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
  private
    { Private declarations }
    Function GetMes(Nome : String) : String;
  public
    { Public declarations }
  end;

var
  frmRelClinAniversariantes: TfrmRelClinAniversariantes;
  M_NRFORM : integer;

implementation

uses uFuncoes, Udm;

{$R *.dfm}

procedure TfrmRelClinAniversariantes.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelClinAniversariantes.edtMesKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (Key = #13) and not uFuncoes.Empty(edtMes.Text) Then
    Begin
         key:=#0;
         BtImprimir.SetFocus; 
    End;
end;

procedure TfrmRelClinAniversariantes.edtMesExit(Sender: TObject);
Var
   M_NUMMES : Word;
begin
     If not uFuncoes.Empty(edtMes.Text) Then
     Begin
         If (StrtoInt(edtMes.Text) < 1)
           or (StrtoInt(edtMes.Text) > 12) Then
         begin
             Application.MessageBox('M�s inv�lido!!!','ATEN��O',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             edtMes.Clear; 
             edtMes.SetFocus;
             Exit;
         End;
         //
         M_NUMMES := StrtoInt(edtMes.Text);
         edtMes.Text := uFuncoes.StrZero(edtMes.Text,2);
         lnl_NMMES.Caption := uFuncoes.MesExtenso2(M_NUMMES);
     End;
end;

procedure TfrmRelClinAniversariantes.edtMesChange(Sender: TObject);
begin
    If uFuncoes.Empty(edtMes.Text) Then
      lnl_NMMES.Caption := '';
end;

procedure TfrmRelClinAniversariantes.FormShow(Sender: TObject);
begin
      lnl_NMMES.Caption := '';
end;

procedure TfrmRelClinAniversariantes.BtImprimirClick(Sender: TObject);
Var
    M_NUMMES : String;
begin
     If uFuncoes.Empty(cmbMeses.text) Then
     Begin
           Application.MessageBox('Selecione o m�s!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbMeses.SetFocus;
           Exit;
     End;
     //
   M_NUMMES := GetMes(cmbMeses.Text);
   //
   If (M_NRFORM = 1) Then
   begin
    try
     Screen.Cursor := crHourGlass;
     BtImprimir.Enabled := False;
     try
          cdsClientes.Close;
          With dstClientes do
          Begin
               Active := False;
               CommandText := 'Select CLI_CODIGO, CLI_FANTASIA, CLI_RAZAO, CLI_FONE1, CLI_DTANIVERSARIO from CLIENTES order by CLI_FANTASIA';
               Active := True;
          End;
          cdsClientes.Open;
          //
          cdsClientes.First;
          If (cdsDados.Active = False) Then
             cdsDados.Open;
          //
          cdsDados.EmptyDataSet;
          //
          While not (cdsClientes.Eof) do
          Begin
               If (Copy(cdsClientesCLI_DTANIVERSARIO.AsString,4,2) = M_NUMMES) Then
               Begin
                     With cdsDados do
                     Begin
                          Append;
                          FieldByName('CLI_CODIGO').AsInteger := cdsClientesCLI_CODIGO.AsInteger;
                          FieldByName('CLI_NOME').AsString    := cdsClientesCLI_FANTASIA.AsString;
                          FieldByName('CLI_DTNASC').AsDateTime := cdsClientesCLI_DTANIVERSARIO.AsDateTime;
                          FieldByName('CLI_DIA').AsInteger    :=  StrtoInt(Copy(cdsClientesCLI_DTANIVERSARIO.AsString,1,2));
                          If not uFuncoes.Empty(cdsClientesCLI_FONE1.AsString) Then
                            FieldByName('CLI_FONE').AsString    :=  '('+
                             Copy(cdsClientesCLI_FONE1.AsString,1,2)+')'+
                             Copy(cdsClientesCLI_FONE1.AsString,3,4)+'-'+
                             Copy(cdsClientesCLI_FONE1.AsString,7,4);
                          //
                          Post;
                     End;
               End;
               //
               cdsClientes.Next;
          End;
          //
          If (cdsDados.RecordCount > 0) Then
          Begin
               With ppReport1 do
               Begin
                    lblRelatorio.Caption := 'RELA��O DE CLIENTES ANIVERSARIANTES';
                    txtMes.Caption := 'M�S...: '+ cmbMeses.Text;
                    PrintReport;
               End;
          End
          Else
          Begin
             Application.MessageBox('N�o h� anivesariantes no m�s indicado!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             cmbMeses.SetFocus;
             Exit;
          End;
          //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
    Finally
         BtImprimir.Enabled := True;
          Screen.Cursor := crDefault;
    End;
    Application.ProcessMessages;
   End;
   //
   If (M_NRFORM = 2) Then
    begin
        try
           Screen.Cursor := crHourGlass;
           BtImprimir.Enabled := False;
           //
           try
             Screen.Cursor := crHourGlass;
             BtImprimir.Enabled := False;
             //
             With cdsContatos do
              Begin
                   Close;
                   CommandText := 'Select CON_CODIGO, CLI_CODIGO, CON_NOME, CON_DATANASC, CON_FONE, CON_CELULAR '
                                 +' from CONTATOS order by CON_NOME, CON_DATANASC ';
                   Open;
              End;
              //
              cdsContatos.First;
              If (cdsDados.Active = False) Then
                 cdsDados.Open;
              //
              cdsDados.EmptyDataSet;
              //
              While not (cdsContatos.Eof) do
              Begin
                   If (Copy(cdsContatosCON_DATANASC.AsString,4,2) = M_NUMMES) Then
                   Begin
                        With cdsDados do
                         Begin
                              Append;
                              FieldByName('CLI_CODIGO').AsInteger := cdsContatosCON_CODIGO.AsInteger;
                              FieldByName('CLI_NOME').AsString    := cdsContatosCON_NOME.AsString;
                              FieldByName('CLI_DTNASC').AsDateTime := cdsContatosCON_DATANASC.AsDateTime;
                              FieldByName('CLI_DIA').AsInteger    :=  StrtoInt(Copy(cdsContatosCON_DATANASC.AsString,1,2));
                              If not uFuncoes.Empty(cdsContatosCON_FONE.AsString) Then
                                FieldByName('CLI_FONE').AsString    :=  uFuncoes.FormataFONE(cdsContatosCON_FONE.AsString);
                              //
                              Post;
                         End;
                   End;
                  //
                   cdsContatos.Next;
              End;
              //
              If (cdsDados.RecordCount > 0) Then
              Begin
                   With ppReport1 do
                   Begin
                        lblRelatorio.Caption := 'RELA��O DE CONTATOS DE CLIENTES ANIVERSARIANTES';
                        txtMes.Caption := 'M�S...: '+ cmbMeses.Text;
                        PrintReport;
                   End;
              End
              Else
              Begin
                   Application.MessageBox('N�o h� anivesariantes no m�s indicado!!!','ATEN��O',
                       MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   cmbMeses.SetFocus;
                   Exit;
               End;
               //
           Except
              on Exc:Exception do
              begin
                   Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                        + Exc.Message),
                        'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              End;
           End;
         Finally
             BtImprimir.Enabled := True;
             Screen.Cursor := crDefault;
         End;
         Application.ProcessMessages;
    End;
end;

function TfrmRelClinAniversariantes.GetMes(Nome: String): String;
begin
     If (Nome = 'JANEIRO') Then
         Result := '01';
     If (Nome = 'FEVEREIRO') Then
         Result := '02';
     If (Nome = 'MAR�O') Then
         Result := '03';
     If (Nome = 'ABRIL') Then
         Result := '04';
     If (Nome = 'MAIO') Then
         Result := '05';
     If (Nome = 'JUNHO') Then
         Result := '06';
     If (Nome = 'JULHO') Then
         Result := '07';
     If (Nome = 'AGOSTO') Then
         Result := '08';
     If (Nome = 'SETEMBRO') Then
         Result := '09';
     If (Nome = 'OUTUBRO') Then
         Result := '10';
     If (Nome = 'NOVEMBRO') Then
         Result := '11';
     If (Nome = 'DEZEMBRO') Then
         Result := '12';
end;

end.
