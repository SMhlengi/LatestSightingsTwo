<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="htings.aspx.cs" Inherits="Revamp_LatestSightings.htings" %>

<asp:Content id="homepageTings" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .sitemap , .footer{
            display:none;
        }
    </style>
    <asp:PlaceHolder ID="hometings" runat="server"></asp:PlaceHolder>

</asp:Content>