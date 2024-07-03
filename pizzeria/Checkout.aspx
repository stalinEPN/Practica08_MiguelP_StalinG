<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="pizzeria.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenedorPrincipal" runat="server">
    <!-- 
    La directiva MasterPageFile especifica el archivo master que define el layout de la página 
    El ContentPlaceHolderID es el ID del ContentPlaceHolder en el master page donde se insertará este contenido
    -->
    <!-- Encabezado -->
    <h4>Tu selección para la pizza es:</h4>    
    <!-- Literal para mostrar el texto "El valor a pagar por tu pizza es: " -->
    <p>
        <asp:Literal ID="literalSeleccion" runat="server" Text="El valor a pagar por tu pizza es: "></asp:Literal>
    </p>
    
    <!-- TextBox para mostrar el costo de la pizza -->    
    <p>
        <asp:TextBox ID="txtCosto" runat="server"></asp:TextBox>
    </p>
        <!-- Mensaje de agradecimiento -->
    <p>
        Gracias por tu compra!... vuelve pronto
    </p>
</asp:Content>
