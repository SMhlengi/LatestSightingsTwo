<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddImage.aspx.cs" Inherits="Revamp_LatestSightings.AddImage" %>

<asp:Content ID="addImage" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:FileUpload ID="ImageFileUpload" runat="server" />
    <br />
    <asp:Button ID="UploadImage" runat="server" Text="Upload" OnClick="UploadImage_Click" />


</asp:Content>