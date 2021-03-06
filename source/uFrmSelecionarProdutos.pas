unit uFrmSelecionarProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, StdCtrls, Buttons, ComObj, WordXP,
  OleServer, ComCtrls, DBCtrls, FMTBcd, SqlExpr, DBClient, Provider, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport;

type
  TfrmSeleProdutos = class(TForm)
    pnlSuperior: TPanel;
    pnlCentral: TPanel;
    dsProdutos: TDataSource;
    Label1: TLabel;
    edtCDINIC: TEdit;
    edtCDFINA: TEdit;
    memCarta: TMemo;
    GridCliente: TDBGrid;
    Panel2: TPanel;
    BtSair: TBitBtn;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_BARRAS: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    btFiltar: TBitBtn;
    cdsProdutosPRO_VLCOMPRA: TFMTBCDField;
    cdsProdutosPRO_VLCUSTO: TFMTBCDField;
    cdsProdutosPRO_VLVENDA: TFMTBCDField;
    btImprimir: TBitBtn;
    cdsEtiquetas: TClientDataSet;
    cdsEtiquetasETI_CODIGO: TStringField;
    cdsEtiquetasETI_DESCRICAO: TStringField;
    cdsEtiquetasETI_VALOR: TCurrencyField;
    cdsEtiquetasETI_BARRAS: TStringField;
    cdsEtiquetasETI_IMAGEM: TGraphicField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCDINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDINICExit(Sender: TObject);
    procedure edtCDFINAExit(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure edtCDINICEnter(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure btFiltarClick(Sender: TObject);
    procedure edtCDFINAChange(Sender: TObject);
    procedure edtCDINICChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtCDFINAKeyPress(Sender: TObject; var Key: Char);
  private
    procedure CONSULTA;
    procedure CONSULTA2;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeleProdutos: TfrmSeleProdutos;
  MSWord: Variant;
  M_NRFORM : Integer;

implementation

uses Udm, uFuncoes, uFrmRelGondulas, uRelEtiquetaProdutos, udmConsulta;


{$R *.dfm}

procedure TfrmSeleProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     cdsProdutos.Close;
     //
     Action := caFree;
end;

procedure TfrmSeleProdutos.GridClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;

procedure TfrmSeleProdutos.edtCDINICKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
    //
    If (Key = #13) and not uFuncoes.Empty(edtCDINIC.Text) then
    begin
         Key := #0;
         edtCDFINA.SetFocus;
    End;
end;

procedure TfrmSeleProdutos.edtCDINICExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDINIC.Text) Then
      If uFuncoes.PROCURAR(uFuncoes.StrZero(edtCDINIC.Text,13)) = True Then
         edtCDINIC.Text := uFuncoes.StrZero(edtCDINIC.Text,13)
      Else
      Begin
           Application.MessageBox(PChar('C�digo de produto n�o cadastro!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtCDINIC.Clear;
           edtCDINIC.SetFocus;
           Exit;
      End;
end;

procedure TfrmSeleProdutos.edtCDFINAExit(Sender: TObject);
Begin
     //
     IF not (uFuncoes.Empty(edtCDINIC.Text))
     and NOT (uFuncoes.Empty(edtCDFINA.Text)) Then
     begin
         If StrtoInt(edtCDFINA.Text) < StrtoInt(edtCDINIC.Text) Then
         Begin
             Application.MessageBox(PChar('C�digo final deve ser maior que o inicial!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             edtCDFINA.Clear;
             edtCDFINA.SetFocus;
             Exit;
          End;
          //
          If uFuncoes.PROCURAR(uFuncoes.StrZero(edtCDFINA.Text,13)) = True Then
             edtCDFINA.Text := uFuncoes.StrZero(edtCDFINA.Text,13)
          Else
          Begin
             Application.MessageBox(PChar('C�digo de produto n�o cadastro!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             edtCDFINA.Clear;
             edtCDFINA.SetFocus;
             Exit;
          End;
          //
      End;
end;


procedure TfrmSeleProdutos.btConfirmaClick(Sender: TObject);
Var
    M_CDCLIE : String;
begin

end;

procedure TfrmSeleProdutos.edtCDINICEnter(Sender: TObject);
begin
     //
     edtCDINIC.Clear;
     edtCDFINA.Clear;
end;

procedure TfrmSeleProdutos.btImprimirClick(Sender: TObject);
begin
     Application.CreateForm(TfrmRelGondulas, frmRelGondulas);
     frmRelGondulas.qrGondulas.Preview;
     frmRelGondulas.Free;
end;



procedure TfrmSeleProdutos.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSeleProdutos.CONSULTA;
Var
   Linha : String;
begin
     //
     cdsProdutos.Close;
     With dstProdutos do
     Begin
             Active := False;
             Linha := 'Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA from PRODUTOS '
                   +' Where (PRO_CODIGO >= :pCDINIC) And (PRO_CODIGO <= :pCDFINA)'
                   +' order by PRO_DESCRICAO';
             CommandText := Linha;
             //
             Params.ParamByName('pCDINIC').AsString := uFuncoes.StrZero(edtCDINIC.Text,13);
             Params.ParamByName('pCDFINA').AsString := uFuncoes.StrZero(edtCDFINA.Text,13);
             //
             Active := True;
     End;    //Fim-with
     //
    //cdsProdutos.FetchParams;
     cdsProdutos.Open;
     //
     If (cdsProdutos.RecordCount > 0) Then
             btImprimir.Enabled := True
     Else
             btImprimir.Enabled := False
end;

procedure TfrmSeleProdutos.btFiltarClick(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDINIC.Text)
         and not uFuncoes.Empty(edtCDFINA.Text) Then
          CONSULTA;
     //
     If uFuncoes.Empty(edtCDINIC.Text)
         and uFuncoes.Empty(edtCDFINA.Text) Then
          CONSULTA2;
end;

procedure TfrmSeleProdutos.edtCDFINAChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDFINA.Text) Then
        cdsProdutos.Close;
end;

procedure TfrmSeleProdutos.edtCDINICChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDINIC.Text) Then
        cdsProdutos.Close;
end;

procedure TfrmSeleProdutos.BitBtn1Click(Sender: TObject);
begin
    // G�ndulas de produtos
    If (M_NRFORM = 1) Then
    begin
         Application.CreateForm(TfrmRelGondulas, frmRelGondulas);
         frmRelGondulas.qrGondulas.Preview;
         frmRelGondulas.Free;
    End;
    // Etiquetas de produtos
    If (M_NRFORM = 2) Then
    begin
         Application.CreateForm(TfrmRelEtiqueta, frmRelEtiqueta);
         frmRelEtiqueta.qrEtiquetas.Preview;
         frmRelEtiqueta.Free;
    End;
end;

procedure TfrmSeleProdutos.CONSULTA2;
begin
     //
     cdsProdutos.Close;
     With dstProdutos do
     Begin
             Active := False;
             CommandText := 'Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA from PRODUTOS order by PRO_DESCRICAO ';
             Active := True;
     End;    //Fim-with
     //
     cdsProdutos.Open;
     If (cdsProdutos.RecordCount > 0) Then
         btImprimir.Enabled := True
     Else
         btImprimir.Enabled := False;
end;

procedure TfrmSeleProdutos.edtCDFINAKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (Key = #13) and not uFuncoes.Empty(edtCDINIC.Text) then
    begin
         Key := #0;
         //edtCDFINA.SetFocus;
    End;
end;

end.
