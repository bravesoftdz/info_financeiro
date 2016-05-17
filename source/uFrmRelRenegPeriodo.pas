unit uFrmRelRenegPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPeriodo, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls,
  FMTBcd, DB, SqlExpr, DBClient, Provider, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache, ppCtrls, ppPrnabl,
  ppVar, Spin;

type
  TfrmRelRenegociacaoPeriodo = class(TfrmRelPeriodo)
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    cdsConsultaRNG_CDLOJA: TIntegerField;
    cdsConsultaEMP_RAZAO: TStringField;
    cdsConsultaRNG_CLIENTE: TIntegerField;
    cdsConsultaRNG_NOME_CLIENTE: TStringField;
    cdsConsultaRNG_NRBOX: TStringField;
    cdsConsultaRNG_DTMOVI: TDateField;
    cdsConsultaRGN_TOTAL_RENEGOCIACAO: TFMTBCDField;
    cdsConsultaRGN_DESCONTO: TBCDField;
    cdsConsultaRGN_VLENTRADA: TFMTBCDField;
    cdsConsultaRGN_VLFINANCIADO: TFMTBCDField;
    cdsConsultaRGN_PEJUROS: TBCDField;
    cdsConsultaRGN_QUANTIDADE: TIntegerField;
    cdsConsultaRGN_VLPARCELA: TFMTBCDField;
    cdsConsultaRGN_DTVENC1: TDateField;
    cdsConsultaRGN_DTVENC2: TDateField;
    cdsConsultaRGN_USUARIO: TIntegerField;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppLabel7: TppLabel;
    ppDBText8: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel17: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel18: TppLabel;
    ppLine5: TppLine;
    ppDBImage1: TppDBImage;
    ppLabel10: TppLabel;
    txtCondominio: TppLabel;
    txtPeriodo: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSystemVariable2: TppSystemVariable;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText10: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    Label3: TLabel;
    sedDia: TSpinEdit;
    dstConsulta2: TSQLDataSet;
    dspConsulta2: TDataSetProvider;
    cdsConsulta2: TClientDataSet;
    dsConsulta2: TDataSource;
    cdsConsulta2CLI_CODIGO: TIntegerField;
    cdsConsulta2CLI_RAZAO: TStringField;
    cdsConsulta2CLI_FANTASIA: TStringField;
    cdsConsulta2CLI_CGC: TStringField;
    cdsConsulta2CLI_CDGRUPO: TIntegerField;
    cdsConsulta2CLI_NRBOX: TStringField;
    cdsConsulta2REC_CREDITO: TIntegerField;
    cdsConsulta2REC_PARCELA: TIntegerField;
    cdsConsulta2REC_DATAEMISSAO: TDateField;
    cdsConsulta2REC_DATAVENCIMENTO: TDateField;
    cdsConsulta2REC_DATAPAGAMENTO: TDateField;
    cdsConsulta2REC_VALORPARCELA: TFMTBCDField;
    cdsConsulta2REC_SITUACAO: TStringField;
    cdsConsulta2REC_NOSSO_NUMERO: TStringField;
    ppReport2: TppReport;
    ppDBPipeline2: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppDBImage2: TppDBImage;
    ppLabel14: TppLabel;
    ppLine4: TppLine;
    ppLabel15: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine6: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel16: TppLabel;
    ppDBText13: TppDBText;
    ppLabel19: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLine7: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine8: TppLine;
    cdsConsulta2CLI_TIPOPESSOA: TStringField;
    ppSummaryBand2: TppSummaryBand;
    ppLine9: TppLine;
    ppLabel27: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLine10: TppLine;
    ppLabel28: TppLabel;
    lblCondominio: TppLabel;
    lblPeriodo: TppLabel;
    cdsConsulta2REC_LOJA: TIntegerField;
    cdsConsulta2CGCCPF: TStringField;
    ppLabel29: TppLabel;
    ppDBText19: TppDBText;
    procedure BtImprimirClick(Sender: TObject);
    procedure edtDTFINAKeyPress(Sender: TObject; var Key: Char);
    procedure sedDiaKeyPress(Sender: TObject; var Key: Char);
    procedure cdsConsulta2CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRenegociacaoPeriodo: TfrmRelRenegociacaoPeriodo;

implementation

uses Udm, uFuncoes, DateUtils;

{$R *.dfm}

procedure TfrmRelRenegociacaoPeriodo.BtImprimirClick(Sender: TObject);
Var
   aTextoSql : String;
   iLoja : Integer;
begin
  inherited;
 if (sedDia.Value = 0) Then
  begin
     BtImprimir.Enabled := false;
     try
         if not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text))
           and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
         begin
            aTextoSql := 'select R.RNG_CDLOJA, E.EMP_RAZAO, R.RNG_CLIENTE, R.RNG_NOME_CLIENTE, R.RNG_NRBOX, R.RNG_DTMOVI,';
            aTextoSql := aTextoSql+'    R.RGN_TOTAL_RENEGOCIACAO, R.RGN_DESCONTO, ';
            aTextoSql := aTextoSql+'    R.RGN_VLENTRADA, R.RGN_VLFINANCIADO, R.RGN_PEJUROS, ';
            aTextoSql := aTextoSql+'    R.RGN_QUANTIDADE, R.RGN_VLPARCELA, R.RGN_DTVENC1, ';
            aTextoSql := aTextoSql+'    R.RGN_DTVENC2, ';
            aTextoSql := aTextoSql+'    R.RGN_USUARIO from RENEGOCIACAO R ';
            aTextoSql := aTextoSql+'inner join EMPRESAS E ON E.EMP_CODIGO = R.RNG_CDLOJA';
            aTextoSql := aTextoSql+' where (R.RNG_DTMOVI >= '+QuotedStr(edtDTINIC.Text)+') and (R.RNG_DTMOVI <= '+QuotedStr(edtDTFINA.Text)+') ';
            //
             dm.RefreshCDS(Dm.CdsConfig);
            With cdsConsulta, ppReport1 do
              begin
                   Close;
                   //CommandText := aTextoSql;
                   Params.ParamByName('pDTINIC').AsDate := edtDTINIC.Date;
                   Params.ParamByName('pDTFINA').AsDate := edtDTFINA.Date;
                   Open;
                   //
                   if not (IsEmpty) Then
                   begin
                        txtCondominio.Caption := FIELDBYNAME('EMP_RAZAO').AsString;
                        txtPeriodo.Caption    := 'PER�ODO : '+edtDTINIC.Text + ' A '+edtDTFINA.Text;
                        //
                        PrintReport;
                   End
                   Else
                       Application.MessageBox(PChar('N�o h� movimento no per�odo indicado.'),
                          'ATEN��O', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
              End;
         End;
     Finally
           BtImprimir.Enabled := true;
     End;
  End
  Else
  begin
       BtImprimir.Enabled := false;
       try
            With cdsConsulta2 do
            begin
                 Close;
                 Params.ParamByName('pDATA').AsDate    := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate := edtDTFINA.Date;
                 Params.ParamByName('pDIA').AsInteger  := sedDia.Value;
                 Params.ParamByName('pFLSITU').AsString := 'A';
                 Open;
                 //
                 if not (IsEmpty) Then
                   begin
                        lblCondominio.Caption := 'SITUA��O : ABERTAS';
                        lblPeriodo.Caption    := 'DATA VENCIMENTO : '+edtDTINIC.Text + ' A '+edtDTFINA.Text;
                        ppReport2.PrintReport;
                   End
                   Else
                       Application.MessageBox(PChar('N�o h� movimento no per�odo indicado.'),
                          'ATEN��O', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
            End;
       Finally
           BtImprimir.Enabled := true;
       End;
  End;
end;

procedure TfrmRelRenegociacaoPeriodo.edtDTFINAKeyPress(Sender: TObject;
  var Key: Char);
begin
 // inherited;
     if (key = #13) and not uFuncoes.Empty(ufuncoes.RemoveChar(edtDTFINA.Text)) then
     begin
          key := #0;
          if (sedDia.Enabled) Then
              sedDia.SetFocus;
     End;
end;

procedure TfrmRelRenegociacaoPeriodo.sedDiaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if (key = #13) and not uFuncoes.Empty(ufuncoes.RemoveChar(sedDia.Text)) then
     begin
          key := #0;
          if (BtImprimir.Enabled) Then
              BtImprimir.SetFocus;
     End;
end;

procedure TfrmRelRenegociacaoPeriodo.cdsConsulta2CalcFields(
  DataSet: TDataSet);
begin
  inherited;
      If (cdsConsulta2.State in [dsInternalCalc]) and
        NOT uFuncoes.Empty(cdsConsulta2CLI_TIPOPESSOA.AsString) Then
         if  (cdsConsulta2CLI_TIPOPESSOA.AsString = 'F') Then
             cdsConsulta2CGCCPF.AsString :=  uFuncoes.FormataCPF(cdsConsulta2CLI_CGC.AsString)
         Else
             cdsConsulta2CGCCPF.AsString :=  uFuncoes.FormataCNPJ(cdsConsulta2CLI_CGC.AsString);
end;

end.
