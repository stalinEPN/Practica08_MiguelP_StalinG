<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pizzeria.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenedorPrincipal" runat="server">
    <!-- 
    La directiva MasterPageFile especifica el archivo master que define el layout de la página 
    El ContentPlaceHolderID es el ID del ContentPlaceHolder en el master page donde se insertará este contenido
    -->
    <!-- Se muestra el título de la página -->
    <h2>Pizzería de: Stalin Garcia y Miguel Pastuña</h2>
    <!-- Se establece autopostback en "true" para los controles radiobutton y checkbox para generar
        un postback automaticamente cada vez que el estado de los controles cambia.
        El postback enviara toda la página y sus datos al servidor para su procesamiento-->
    <asp:Panel ID="panelTipoMasa" runat="server" GroupingText="Escoge un tipo de masa:">
        <asp:Table ID="tablaTipMasa" runat="server" Width="338px">
            <asp:TableRow>
                <asp:TableCell>
                    <!-- Se define un RadioButton para la masa delgada -->
                    <asp:RadioButton Text="Delgada" ID="rbtDelgada" runat="server" GroupName="grupoTipos" AutoPostBack="True" OnCheckedChanged="Opciones_CheckedChanged" />
                </asp:TableCell>
                <asp:TableCell>
                    <!-- Se muestra el precio de la masa delgada -->
                    <asp:Label Text="$5" ID="lblDelgada" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <!-- Se define un RadioButton para la masa pan pizza -->
                    <asp:RadioButton Text="Pan pizza" ID="rbtPanPizza" runat="server" GroupName="grupoTipos" AutoPostBack="True" OnCheckedChanged="Opciones_CheckedChanged" />
                </asp:TableCell>
                <asp:TableCell>
                    <!-- Se muestra el precio de la masa pan pizza -->
                    <asp:Label Text="$8" ID="lblPanPizza" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <!-- Se define un RadioButton para la masa gruesa -->
                    <asp:RadioButton Text="Gruesa" ID="rbtGruesa" runat="server" GroupName="grupoTipos" AutoPostBack="True" OnCheckedChanged="Opciones_CheckedChanged" />
                </asp:TableCell>
                <asp:TableCell>
                    <!-- Se muestra el precio de la masa gruesa -->
                    <asp:Label Text="$10" ID="lblGruesa" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
    <asp:Panel ID="panelIngredientes" runat="server" GroupingText="Escoge los ingredientes:">
        <asp:Table ID="tablaIngredientes" runat="server" Width="318px">
            <asp:TableRow>
                <asp:TableCell>
                    <!-- Se define un CheckBox para los champiñones -->
                    <asp:CheckBox Text="Champiñones" ID="chkHongo" runat="server" AutoPostBack="True" OnCheckedChanged="Opciones_CheckedChanged" />
                </asp:TableCell>
                <asp:TableCell>
                    <!-- Se muestra el precio de los champiñones -->
                    <asp:Label Text="$8" ID="lblHongo" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <!-- Se define un CheckBox para el peperoni -->
                    <asp:CheckBox Text="Peperoni" ID="chkPeperoni" runat="server" AutoPostBack="True" OnCheckedChanged="Opciones_CheckedChanged" />
                </asp:TableCell>
                <asp:TableCell>
                    <!-- Se muestra el precio del peperoni -->
                    <asp:Label Text="$10" ID="lblPeperoni" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <!-- Se define un CheckBox para la salchicha -->
                    <asp:CheckBox Text="Salchicha" ID="chkSalchicha" runat="server" AutoPostBack="True" OnCheckedChanged="Opciones_CheckedChanged" />
                </asp:TableCell>
                <asp:TableCell>
                    <!-- Se muestra el precio de la salchicha -->
                    <asp:Label Text="$12" ID="lblSalchicha" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
    <!-- Seleccionar tamaño de pizza -->
    <h5>Selecciona el tamaño de tu pizza:</h5>
    <asp:RadioButtonList ID="rblTamanio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Opciones_CheckedChanged">
        <asp:ListItem Text="Personal..$5" Value="Personal" />
        <asp:ListItem Text="Mediana..$8" Value="Mediana" />
        <asp:ListItem Text="Familiar..$10" Value="Familiar" />
        <asp:ListItem Text="Gigante..$12" Value="Gigante" />
    </asp:RadioButtonList>

    <!-- Seleccionar extras -->
    <h5>Selecciona los extras:</h5>
    <asp:CheckBoxList ID="cblExtras" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Opciones_CheckedChanged">
        <asp:ListItem Text="Papas Fritas..$4" Value="PapasFritas" />
        <asp:ListItem Text="Dedos de Queso..$6" Value="DedosQueso" />
        <asp:ListItem Text="Brownie..$3" Value="Brownie" />
        <asp:ListItem Text="Bordes de Queso..$2" Value="BordesQueso" />
        <asp:ListItem Text="Bordes de Salchicha con Queso..$4" Value="BordesSalchichaQueso" />
    </asp:CheckBoxList>

    <!-- Seleccionar bebidas -->
    <h5>Selecciona la bebida:</h5>
    <asp:CheckBoxList ID="cblBebidas" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Opciones_CheckedChanged">
        <asp:ListItem Text="Pepsi..$2" Value="Pepsi" />
        <asp:ListItem Text="Sprite..$2" Value="Sprite" />
        <asp:ListItem Text="Fiora..$2" Value="Fiora" />
        <asp:ListItem Text="Coca Cola..$2" Value="CocaCola" />
    </asp:CheckBoxList>
    <!-- Se define un Literal para mostrar la selección actual -->
    <asp:Literal ID="literalSeleccionActual" runat="server" Text=" "></asp:Literal>
    <br />
    Valor a pagar:&nbsp;&nbsp;&nbsp;&nbsp;
        <!-- Se define un TextBox para mostrar el costo total, solo lectura -->
    <asp:TextBox ID="txtTotal" runat="server" ReadOnly="True"></asp:TextBox>
    <p>
        <!-- Se define un LinkButton para ir a la página de pago -->
        <asp:LinkButton ID="lnkCheckout" runat="server" OnClick="LnkCheckout_Click">Ir a pago...</asp:LinkButton>
    </p>
</asp:Content>
