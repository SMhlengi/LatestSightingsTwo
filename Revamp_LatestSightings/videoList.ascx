<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="videoList.ascx.cs" Inherits="Revamp_LatestSightings.videoList" %>

<% if (userVideos.Count > 0){ %>

<div id="Div1" class="dataTables_wrapper no-footer" style="width: 100%;">
    <div class="dataTables_length" id="Div2" style="width: 100%;">
        <table id="table_id" class="table table-hover responsive dataTable no-footer" role="grid" aria-describedby="basicTable_info" style="width: 100%;">
            <thead class="datatableHeaders">
                <tr>
                    <th style="background-color:#554337; color: #FFFFFF; border-bottom: 0px;">Video Name</th>
                    <th style="background-color:#554337; color: #FFFFFF; border-bottom: 0px;">Alias</th>
                    <th style="background-color:#554337; color: #FFFFFF; border-bottom: 0px;">Rev Split</th>
                    <th style="background-color:#554337; color: #FFFFFF; border-bottom: 0px;">Uploaded</th>
                    <th style="background-color:#554337; color: #FFFFFF; border-bottom: 0px;">Accepted Package</th>
                </tr>
            </thead>
    <tbody>            
            <% foreach(var item in userVideos){ %>
                <tr>
                    <td><%=item.Name %></td>
                    <td><%=item.Alias %></td>
                    <td><%=item.RevSplit %></td>
                    <td><%=item.Uploaded %></td>
                    <td><%=item.Package %></td>
                </tr>
            <%} %>
    </tbody>
        </table>
    </div>
    <br />
    <asp:PlaceHolder ID="vpreview" runat="server"></asp:PlaceHolder>

</div>

<%}else{ %>
    <div class="row">
        <div class="col-md-5 noVideos">
            <p class="text-info">No Videos have been uploaded</p>
        </div>
    </div>
<%} %>

<script>
    $(document).ready(function () {
        $('#table_id').DataTable();
    });
</script>