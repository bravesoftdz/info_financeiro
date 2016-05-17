unit uFrmRelProdutos3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, ppModule, raCodMod, ppBands, ppVar, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB,
  Provider, SqlExpr, DBClient, StdCtrls, Buttons, ExtCtrls, DBXpress;

type
  TfrmRelacaoProdutos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    cmbNMLOJA: TComboBox;
    cmbValor: TComboBox;
    Panel2: TPanel;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    cdsDados: TClientDataSet;
    cdsDadosPRO_NRITEM: TIntegerField;
    cdsDadosPRO_NMPROD: TStringField;
    cdsDadosPRO_NMABRE: TStringField;
    cdsDadosPRO_NMTRIB: TStringField;
    cdsDadosPRO_CDPROD: TStringField;
    cdsDadosPRO_CDUNID: TStringField;
    cdsDadosPRO_QTESTO: TFloatField;
    cdsDadosPRO_VALOR: TCurrencyField;
    dstProdutos: TSQLDataSet;
    dstProdutosPRO_CODIGO: TStringField;
    dstProdutosPRO_DESCRICAO: TStringField;
    dstProdutosPRO_VLCOMPRA: TFMTBCDField;
    dstProdutosPRO_VLVENDA: TFMTBCDField;
    dstProdutosUNI_CODIGO: TStringField;
    dstProdutosTRI_CODIGO: TIntegerField;
    dstProdutosTRI_DESCRICAO: TStringField;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosPRO_VLCOMPRA: TFMTBCDField;
    cdsProdutosPRO_VLVENDA: TFMTBCDField;
    cdsProdutosUNI_CODIGO: TStringField;
    cdsProdutosTRI_CODIGO: TIntegerField;
    cdsProdutosTRI_DESCRICAO: TStringField;
    cdsProdutosPRO_SUBTOTVENDA: TCurrencyField;
    cdsProdutosPRO_SUBTOTCOMPRA: TCurrencyField;
    dsProdutos: TDataSource;
    ppDBProdutos: TppDBPipeline;
    ppRelProdutos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBImage1: TppDBImage;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    txtValor: TppLabel;
    ppLabel13: TppLabel;
    txtRazao: TppLabel;
    txtEndereco: TppLabel;
    txtCNPJ: TppLabel;
    txtMunicipio: TppLabel;
    txtInscEstadual: TppLabel;
    ppLine1: TppLine;
    pplbl_Estoque: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBEstoque: TppDBText;
    ppDBValor: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDBCalc3: TppDBCalc;
    ppLabel11: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine2: TppLine;
    raCodeModule1: TraCodeModule;
    procedure BtSairClick(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
      procedure LOJAS;
      procedure DADOS_LOJA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelacaoProdutos: TfrmRelacaoProdutos;
  M_NMRAZA, M_ENDERE, M_NMMUNI, M_NRCNPJ, M_INSEST : String;

implementation

uses Udm, uFuncoes, UFrmAdmin, udmConsulta;

{$R *.dfm}

procedure TfrmRelacaoProdutos.BtSairClick(Sender: TObject);
begin
     close;
end;

procedure TfrmRelacaoProdutos.BtImprimirClick(Sender: TObject);
Var
  TD : TTransactionDesc;
begin
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Application.MessageBox('Selecione a loja!!!','ATEN��O',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNMLOJA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbValor.Text) Then
     Begin
          Application.MessageBox('Selecione qual campo deseja imprimir!!!','ATEN��O',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbValor.SetFocus;
          Exit;
     End;
     //
     Try
          BtImprimir.Enabled := False;
          // Inicia um transa��o no BD
           TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
           TD.IsolationLevel := xilREADCOMMITTED;
           Dm.SqlAdmin.StartTransaction(TD);
           //
           cdsProdutos.Close;
           With dstProdutos do
           Begin
                Active := False;
                   Commandtext := 'Select P.PRO_CODIGO, P.PRO_DESCRICAO, P.PRO_VLCOMPRA, '+
                               'P.PRO_VLVENDA, P.UNI_CODIGO, P.TRI_CODIGO, '+
                               '(Select TR.TRI_DESCRICAO from TRIBUTACAO TR Where (TR.TRI_CODIGO = P.TRI_CODIGO)) AS TRI_DESCRICAO '+
                               'from PRODUTOS P '+
                               'order by P.PRO_DESCRICAO';
                //
                Active := True;
           End;
           cdsProdutos.Open;
           //
           With ppRelProdutos do
           Begin
                DADOS_LOJA;
                txtRazao.caption     := M_NMRAZA;
                txtEndereco.Caption  := M_ENDERE;
                txtMunicipio.caption := M_NMMUNI;
                txtCNPJ.caption      := uFuncoes.FormataCNPJ(M_NRCNPJ);
                txtInscEstadual.caption  := M_INSEST;
                //
                     pplbl_Estoque.Caption := '';
                     ppDBEstoque.DataField := '';
                     //
                     //pplbl_TOTESTOQUE.Visible := False;
                     //ppDBCalcEstoque.Visible  := False;
                     //
                     //txtValor.Left       := 5.9271;
                     //pplblSubTotal.Left  := 6.6979;
                     //
                     //ppDBValor.Left      := 6.4167;
                     //ppDBSubTotal.Left   := 6.6771;
                //
                If (cmbValor.Text = 'VENDA') Then
                Begin
                    txtValor.Caption    := 'VL.VENDA';
                    ppDBValor.DataField := 'PRO_VLVENDA';
                    //ppDBSubTotal.DataField := 'PRO_SUBTOTVENDA';
                    //
                    //ppDBCValor.DataField     := 'PRO_VLVENDA';
                    //ppDBCSubtotal.DataField  := 'PRO_SUBTOTVENDA';
                    //
                    //ppDBCalc5.DataField     := 'PRO_VLVENDA';
                    //ppDBCalc6.DataField  := 'PRO_SUBTOTVENDA';
                End
                Else
                begin
                    txtValor.Caption := 'VL.COMPRA';
                    ppDBValor.DataField := 'PRO_VLCOMPRA';
                    //ppDBSubTotal.DataField := 'PRO_SUBTOTCOMPRA';
                    //ppDBCValor.DataField     := 'PRO_VLCOMPRA';
                    //ppDBCSubtotal.DataField  := 'PRO_SUBTOTCOMPRA';
                    //
                    //ppDBCalc5.DataField     := 'PRO_VLCOMPRA';
                    //ppDBCalc6.DataField     := 'PRO_SUBTOTCOMPRA';
                End;
                //
                PrintReport;
                //
           End;
           // Grava
           Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
           BtImprimir.Enabled := True;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transa��o no BD.
                Dm.SqlAdmin.Rollback(TD);
                BtImprimir.Enabled := True;
        End;
     End;
end;

procedure TfrmRelacaoProdutos.DADOS_LOJA;
begin
     dm.CdsEmpresas.Close;
     With dm.SdsEmpresas do
     Begin
          Active := False;
          CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
          Params.ParamByName('pCODIGO').AsInteger := uFuncoes.CDLOJA(cmbNMLOJA.Text);
          Active := True;
     End;
     dm.CdsEmpresas.Open;
     //
     M_NMRAZA := dm.CdsEmpresas.FieldByName('EMP_RAZAO').AsString;
     M_ENDERE := dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString + ' -  N�. '+dm.CdsEmpresas.FieldByName('EMP_NUMERO').AsString;
     M_NMMUNI := dm.CdsEmpresas.FieldByName('EMP_NMCIDADE').AsString;
     M_NRCNPJ := dm.CdsEmpresas.FieldByName('EMP_CNPJ').AsString;
     M_INSEST := dm.CdsEmpresas.FieldByName('EMP_INSCRICAOESTADUAL').AsString;
end;

procedure TfrmRelacaoProdutos.FormShow(Sender: TObject);
begin
      LOJAS;
end;

procedure TfrmRelacaoProdutos.LOJAS;
begin
     With dmConsultas.qryLoja do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          First;
     End;
     //
     cmbNMLOJA.Clear;
     While not (dmConsultas.qryLoja.Eof) do
     Begin
          cmbNMLOJA.Items.Add(dmConsultas.qryLoja.FieldByName('EMP_FANTASIA').AsString);
          //
          dmConsultas.qryLoja.Next;
     End;
end;

end.
