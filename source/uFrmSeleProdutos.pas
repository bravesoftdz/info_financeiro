unit uFrmSeleProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, FMTBcd, DB,
  DBClient, Provider, SqlExpr;

type
  TfrmSelecionaProduto = class(TForm)
    Panel2: TPanel;
    lblTexto: TLabel;
    edtNMDESC: TEdit;
    Panel1: TPanel;
    GridProdutos: TDBGrid;
    Panel3: TPanel;
    btFechar: TBitBtn;
    btnOk: TBitBtn;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_BARRAS: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosPRO_VLCOMPRA: TFMTBCDField;
    cdsProdutosPRO_VLCUSTO: TFMTBCDField;
    cdsProdutosPRO_REFERENCIA: TStringField;
    cdsProdutosSECNOME: TStringField;
    cdsProdutosSUBNOME: TStringField;
    cdsProdutosNOME_FORN: TStringField;
    cdsProdutosPRO_VLVENDA: TFMTBCDField;
    cdsProdutosPRO_VLPROM: TCurrencyField;
    rgConsultar: TRadioGroup;
    procedure btFecharClick(Sender: TObject);
    procedure edtNMDESCChange(Sender: TObject);
    procedure GridProdutosDblClick(Sender: TObject);
    procedure edtNMDESCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNMDESCKeyPress(Sender: TObject; var Key: Char);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure rgConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;

var
  frmSelecionaProduto: TfrmSelecionaProduto;
  M_CDFORN, M_CDSECA, M_CDSUBS : Integer;
  M_NMREFE : String;

implementation

uses uFuncoes, Udm;

{$R *.dfm}

procedure TfrmSelecionaProduto.btFecharClick(Sender: TObject);
begin
    close;
end;

procedure TfrmSelecionaProduto.edtNMDESCChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNMDESC.Text) Then
     begin
         With cdsProdutos  do
         Begin
              DisableControls;
              Close;
              CommandText := 'Select P.PRO_CODIGO, P.PRO_BARRAS, P.PRO_DESCRICAO, P.PRO_VLCOMPRA, P.PRO_VLCUSTO, ' +
                             'PRO_VLVENDA, P.PRO_REFERENCIA, '+
                             '(Select S.SEC_DESCRICAO from SECAO S WHERE (P.SEC_CODIGO = S.SEC_CODIGO)) AS SECNOME,  '+
                             '(Select SU.SUB_DESCRICAO from SUBSECAO SU WHERE (P.SUB_CODIGO = SU.SUB_CODIGO)) AS SUBNOME,  '+
                             '(Select F.for_fantasia from FORNECEDORES F WHERE (P.FOR_CODIGO = F.FOR_CODIGO)) AS NOME_FORN  '+
                             'from PRODUTOS P ';
              //
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where UPPER(P.PRO_REFERENCIA) like ' + QuotedStr(AnsiUpperCase(edtNMDESC.Text) + '%');
               1: CommandText := CommandText + ' where UPPER(P.PRO_DESCRICAO) like ' +  QuotedStr(AnsiUpperCase(edtNMDESC.Text) + '%');
             end;

              //CommandText := CommandText + 'Where (P.PRO_DESCRICAO like :pNOME) ';
              {If (M_CDFORN > 0) then
              Begin
                   CommandText := CommandText + ' and (P.FOR_CODIGO = :pCDFORN) ';
                   Params.ParamByName('pCDFORN').AsInteger  := M_CDFORN;
              End;}
              // Se��o
              If (M_CDSECA > 0) then
              Begin
                   CommandText := CommandText + ' and (P.SEC_CODIGO = :pCDSECA) ';
                   Params.ParamByName('pCDSECA').AsInteger  := M_CDSECA;
              End;
              // Sub-se��o
              If (M_CDSUBS > 0) then
              Begin
                   CommandText := CommandText + ' and (P.SUB_CODIGO = :pCDSUBS) ';
                   Params.ParamByName('pCDSUBS').AsInteger  := M_CDSUBS;
              End;
              //
              {If not uFuncoes.Empty(M_NMREFE) Then
                 CommandText := CommandText + ' and (P.PRO_DESCRICAO = '+QuotedStr(M_NMREFE)+') ';}
              //
              //Params.ParamByName('pNOME').AsString    := edtNMDESC.Text+'%';
              Open;
              EnableControls;
         End;  // end-with
     End
     Else
         cdsProdutos.Close;
end;


procedure TfrmSelecionaProduto.GridProdutosDblClick(Sender: TObject);
begin
     if not (cdsProdutos.IsEmpty ) Then
          btnOk.Click;
end;

procedure TfrmSelecionaProduto.edtNMDESCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     IF (KEY=38) and (cdsProdutos.Active) then // avalio se � seta para cima ou para baixo;
          cdsProdutos.Prior;
     //
     IF (key=40) and (cdsProdutos.Active) then
          cdsProdutos.Next;
end;

procedure TfrmSelecionaProduto.edtNMDESCKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) and not (cdsProdutos.IsEmpty ) Then
      begin
           Key := #0;
           close;
      End;
end;

procedure TfrmSelecionaProduto.cdsProdutosCalcFields(DataSet: TDataSet);
Var
   NumeroDia : Integer;
begin
      if (cdsProdutos.State = dsInternalCalc) Then
       begin
            NumeroDia := uFuncoes.NumeroDiadaSemana(DatetoStr(Date));
            //
            cdsProdutosPRO_VLPROM.AsCurrency := dm.GetValorPromocao(cdsProdutosPRO_CODIGO.AsString, NumeroDia);
       End;
end;

procedure TfrmSelecionaProduto.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblTexto.Caption := 'Refer�ncia:';
      edtNMDESC.Clear;
    end;
    1:
    begin
      lblTexto.Caption := 'Descri��o:';
      edtNMDESC.Clear;
    end;
  end;

  if edtNMDESC.CanFocus then
    edtNMDESC.SetFocus;
end;

procedure TfrmSelecionaProduto.FormShow(Sender: TObject);
begin
     lblTexto.Caption := 'Descri��o:';
end;

end.
