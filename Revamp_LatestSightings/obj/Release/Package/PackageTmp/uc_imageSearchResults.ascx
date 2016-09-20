<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_imageSearchResults.ascx.cs" Inherits="Revamp_LatestSightings.uc_imageSearchResults" %>


<div class="row">
    <%if (imageResults != null && imageResults.Count > 0){ %>
    <%foreach(var item in imageResults){ %>
      <div class="col-sm-6 col-md-4" data-toggle="modal" data-target="#myModal<%=item["id"].ToString() %>">
        <div class="thumbnail">
          <img src="https://latestsightings.com/UploadedImages/650x650/<%=item["filename"] %>" alt="...">
          <div class="caption">
            <h5><%=item["title"] %></h5>
           <%-- <p>...</p>--%>
            <%--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>--%>
          </div>
        </div>
      </div>
      <%} %>
    <%} %>
</div>

    <%if (imageResults != null && imageResults.Count > 0){ %>
    <%foreach(var item in imageResults){ %>
        <!-- Modal -->
        <div class="modal fade" id="myModal<%=item["id"] %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><%=item["title"].ToString() %></h4>
              </div>
              <div class="modal-body">
                <img src="https://latestsightings.com/UploadedImages/650x650/<%=item["filename"] %>" />
              </div>
<%--              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>--%>
            </div>
          </div>
        </div>
      <%} %>
    <%} %>