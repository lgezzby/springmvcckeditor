<%--
  Created by IntelliJ IDEA.
  User: zby
  Date: 2017/9/2
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=basePath%>/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="<%=basePath%>/ckfinder/ckfinder.js"></script>
</head>
<body>
    ${msg}
    <form action="<%=request.getContextPath()%>/save" method="post">
        <textarea name="content" id="content" rows="10" cols="80">
            This is my textarea to be replaced with CKEditor.
        </textarea>
        <input type="submit" value="保存">
    </form>
    <script type="text/javascript">
        if( CKEDITOR.instances['content'] ){   //解决 例外被抛出且未被接住 问题
            CKEDITOR.remove(CKEDITOR.instances['content']);
        }
        var editor =CKEDITOR.replace("content");//引号中的字符串要和文本域中name的值一致
        CKFinder.setupCKEditor(editor,'ckfinder/');
    </script>
</body>
</html>
