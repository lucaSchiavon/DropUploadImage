﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageUpload.aspx.cs" Inherits="ImageUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


     <script src="DropzoneJs_scripts/jquery.min.js"></script>
    <script src="DropzoneJs_scripts/dropzone.js"></script>
    <link href="DropzoneJs_scripts/dropzone.css" rel="stylesheet" />

        
    <script type="text/javascript">


        $(document).ready(function () {
            console.log("Hello");
            Dropzone.autoDiscover = false;
            var username = $('#<%=lbtUsername.ClientID %>').text().toString();
            $("#dZUpload").dropzone({
                url: "Uploader.ashx?username=" + username.toString(),
                maxFiles: 5,
                addRemoveLinks: true,
                success: function (file, response) {
                    var imgName = response;
                    file.previewElement.classList.add("dz-success");
                    console.log("Successfully uploaded :" + imgName);
                },
                error: function (file, response) {
                    file.previewElement.classList.add("dz-error");
                }
            });
        });
        </script>
  
    

</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
  <asp:LinkButton ID="lbtUsername" runat="server" Font-Names="Verdana" Text="Dotnetdrizzles@gmail.com" Font-Size="Large" Font-Underline="True" ForeColor="#FF0066"></asp:LinkButton>
        <div id="dZUpload" style="width:500px; margin:0 auto;" class="dropzone" >
        <div  class="dz-default dz-message">
           Drag & Drop Images [5] here. 
            <br />
        </div>
    </div> 
    
    </div>
    </form>
</body>
</html>
