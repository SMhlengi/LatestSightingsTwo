<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResizeImageTest.aspx.cs" Inherits="Revamp_LatestSightings.ResizeImageTest" %>

<asp:Content ID="resizeImage" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <asp:FileUpload ID="fileUpload" runat="server" />
    <br /><br /><br />
    <asp:Button ID="UploadImage" runat="server" Text="Upload Image" OnClick="UploadImage_Click" />

</asp:Content>