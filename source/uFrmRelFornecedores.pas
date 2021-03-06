unit uFrmRelFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, Provider, DB, SqlExpr,
  DBClient, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBPipe,
  ppCtrls, ppPrnabl, ppBands, ppCache, ppVar;

type
  TfrmRelFornecedores = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    cmbUF: TComboBox;
    dstFornecedores: TSQLDataSet;
    dspForncedores: TDataSetProvider;
    cdsFornecedores: TClientDataSet;
    dsFornecedores: TDataSource;
    ppRepFornecedor: TppReport;
    ppDBFornecedor: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLabel8: TppLabel;
    txtUF: TppLabel;
    ppLine3: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    cdsFornecedoresFOR_CODIGO: TIntegerField;
    cdsFornecedoresFOR_FANTASIA: TStringField;
    cdsFornecedoresFOR_RAZAO: TStringField;
    cdsFornecedoresFOR_FONE1: TStringField;
    cdsFornecedoresFOR_UF: TStringField;
    cdsFornecedoresFOR_CONTATO1: TStringField;
    cdsFornecedoresFOR_FONECON1: TStringField;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine5: TppLine;
    cdsFornecedoresCODIGO: TStringField;
    cdsFornecedoresFONE: TStringField;
    cdsFornecedoresFONE2: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure cdsFornecedoresCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFornecedores: TfrmRelFornecedores;

implementation

uses uFuncoes, Udm;

{$R *.dfm}

procedure TfrmRelFornecedores.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelFornecedores.BtImprimirClick(Sender: TObject);
Var
   M_UFFORN : String;
begin
     try
        If not uFuncoes.Empty(cmbUF.Text) Then
        begin
          M_UFFORN := cmbUF.Text;
          //
          cdsFornecedores.Close;
          With dstFornecedores do
          Begin
             Active := False;
             CommandText := 'Select FOR_CODIGO, FOR_FANTASIA, FOR_RAZAO, FOR_FONE1, '
                           +' FOR_UF, FOR_CONTATO1, FOR_FONECON1 '
                           +' from FORNECEDORES Where (FOR_UF = '+QuotedStr(M_UFFORN)+')'
                           +' order by FOR_FANTASIA ';
             Active := True;
          End;
          cdsFornecedores.Open;
        End
        Else
        begin
          cdsFornecedores.Close;
          With dstFornecedores do
          Begin
             Active := False;
             CommandText := 'Select FOR_CODIGO, FOR_FANTASIA, FOR_RAZAO, FOR_FONE1, '
                           +' FOR_UF, FOR_CONTATO1, FOR_FONECON1 '
                           +' from FORNECEDORES order by FOR_FANTASIA ';
             Active := True;
          End;
          cdsFornecedores.Open;
        End;
        //
        If not (cdsFornecedores.IsEmpty) Then
        begin
          With ppRepFornecedor do
          Begin
               If not uFuncoes.Empty(cmbUF.Text) Then
                   txtUF.Caption := 'UF...: '+ cmbUF.Text
               Else
                   txtUF.Caption := 'UF...: TODOS';
               //
               PrintReport;
          End;
        End
        Else
           Application.MessageBox(PChar('N�o h� fornecedores na UF indicada!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
end;

procedure TfrmRelFornecedores.cdsFornecedoresCalcFields(DataSet: TDataSet);
begin
     cdsFornecedoresCODIGO.AsString := uFuncoes.StrZero(cdsFornecedoresFOR_CODIGO.AsString,5);
     //
     If not uFuncoes.Empty(cdsFornecedoresFOR_FONE1.AsString) Then
        cdsFornecedoresFONE.AsString   :=
           '('+Copy(cdsFornecedoresFOR_FONE1.AsString,1,2)+')'
           +Copy(cdsFornecedoresFOR_FONE1.AsString,3,4)+'-'
           +Copy(cdsFornecedoresFOR_FONE1.AsString,7,4);
     //
     If not uFuncoes.Empty(cdsFornecedoresFOR_FONECON1.AsString) Then
        cdsFornecedoresFONE2.AsString  :=
           '('+Copy(cdsFornecedoresFOR_FONECON1.AsString,1,2)+')'
           +Copy(cdsFornecedoresFOR_FONECON1.AsString,3,4)+'-'
           +Copy(cdsFornecedoresFOR_FONECON1.AsString,7,4);
end;

end.
