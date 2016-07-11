<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@ include file="../PubPackage.jsp"%>
<% 

String strSql="select * from article ";
DbConnection conn=new DbConnection();
ResultSet rs=conn.executeQuerySql(strSql);



%>
<html><head><title>文章管理</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<link href='CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
<script src="../JS/prototype.js"></script>
<script src="../JS/checklogin.js"></script>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>  <tr class='topbg'> 
    <td height='22' colspan='10'><table width='100%'><tr class='topbg'><td align='center'><b>文章中心管理----添加文章</b></td></tr></table></td>
  </tr>
  <tr class='tdbg'>    <td width='70' height='30' ><strong>管理导航：</strong></td><td colspan='5'><a href='Admin_Article.html'>文章管理首页</a>&nbsp;|&nbsp;<a href='Admin_Article_Add.html'>添加文章</a>&nbsp;|&nbsp;<a href='Admin_Article.asp?ChannelID=1&ManageType=Check&Status=0'>审核文章</a>&nbsp;|&nbsp;<a href='Admin_Article.asp?ChannelID=1&ManageType=Special'>专题文章管理</a>&nbsp;|&nbsp;<a href='Admin_Article.asp?ChannelID=1&ManageType=Recyclebin&Status=9'>文章回收站管理</a></td>
  </tr>
</table>
<script language = 'JavaScript'>

function selectPaginationType(){
  document.myform.PaginationType.value=2;
}
function rUseLinkUrl(){
  if(document.myform.UseLinkUrl.checked==true){
    document.myform.LinkUrl.disabled=false;
     ArticleContent.style.display='none';
     ArticleContent2.style.display='none';
     ArticleContent3.style.display='none';
  }
  else{
    document.myform.LinkUrl.disabled=true;
    ArticleContent.style.display='';
    ArticleContent2.style.display='';
    ArticleContent3.style.display='';
  }
}
function CheckForm(){
  var CurrentMode=editor.CurrentMode;
  if (CurrentMode==0){
    document.myform.Content.value=editor.HtmlEdit.document.body.innerHTML; 
  }
  else if(CurrentMode==1){
    document.myform.Content.value=editor.HtmlEdit.document.body.innerText;
  }
  else{
    alert('预览状态不能保存！请先回到编辑状态后再保存');
    return false;
  }
  if (document.myform.Title.value==''){
    ShowTabs(0);
    alert('文章标题不能为空！');
    document.myform.Title.focus();
    return false;
  }
  if (document.myform.Keyword.value==''){
    ShowTabs(0);
    alert('关键字不能为空！');
    document.myform.Keyword.focus();
    return false;
  }
  if(document.myform.UseLinkUrl.checked==true){
    if (document.myform.LinkUrl.value==''||document.myform.LinkUrl.value=='http://'){
      ShowTabs(0);
      alert('请输入转向链接的地址！');
      document.myform.LinkUrl.focus();
      return false;
    }
  }
  else{
    if (document.myform.Content.value==''){
      ShowTabs(0);
      alert('文章内容不能为空！');
      editor.HtmlEdit.focus();
      return false;
    }
  }
  var obj=document.myform.ClassID;
  var iCount=0;
  for(var i=0;i<obj.length;i++){
    if(obj.options[i].selected==true){
      iCount=iCount+1;
      if(obj.options[i].value==''){
        ShowTabs(0);
        alert('文章所属栏目不能指定为外部栏目！');
        document.myform.ClassID.focus();
        return false;
      }
      if(obj.options[i].selected==true&&obj.options[i].value=='0'){
        ShowTabs(0);
        alert('指定的栏目不允许添加文章！只允许在其子栏目中添加文章。');
        document.myform.ClassID.focus();
        return false;
      }
    }
  }
  if (iCount==0){
    ShowTabs(0);
    alert('请选择所属栏目！');
    document.myform.ClassID.focus();
    return false;
  }
  return true;  
}
var tID=0;
function ShowTabs(ID){
  if(ID>0){
    Tabs_Bottom.style.display='none';
  }
  else{
    Tabs_Bottom.style.display='';
  }
  if(ID!=tID){
    TabTitle[tID].className='title5';
    TabTitle[ID].className='title6';
    Tabs[tID].style.display='none';
    Tabs[ID].style.display='';
    tID=ID;
    if(ID==0){
      editor.yToolbarsCss();
    }
  }
}
function SelectUser(){
    var arr=showModalDialog('Admin_SourceList.asp?TypeSelect=UserList&DefaultValue='+document.myform.InceptUser.value,'','dialogWidth:600px; dialogHeight:450px; help: no; scroll: yes; status: no');
    if (arr != null){
        document.myform.InceptUser.value=arr;
    }
}
function getPayMoney(){
  document.myform.CopyMoney1.value=document.myform.PerWordMoney.value*document.myform.WordNumber.value/1000;
}
function IsDigit(){
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
function CopyTitle(){
  if (document.myform.VoteTitle.value==''){
     document.myform.VoteTitle.value = document.myform.Title.value;
  }
}
function moreitem(inputname,listnum,ichannelid,inputype){
    var chedkurl = '../inc/checklist.asp';
    var CheckDOM = new ActiveXObject("Microsoft.XMLDOM");
    CheckDOM.async=false;
    var p = CheckDOM.createProcessingInstruction('xml','version=\"1.0\" encoding=\"utf-8\"'); 
    CheckDOM.appendChild(p); 
    var CheckRoot = CheckDOM.createElement('root');
    var CField = CheckDOM.createNode(1,'text',''); 
    CField.text = $F(inputname);
    CheckRoot.appendChild(CField);
    CField = CheckDOM.createNode(1,'lnum',''); 
    CField.text = listnum;
    CheckRoot.appendChild(CField);
    CField = CheckDOM.createNode(1,'channelid',''); 
    CField.text = ichannelid;
    CheckRoot.appendChild(CField);
    CField = CheckDOM.createNode(1,'type',''); 
    CField.text = inputype;
    CheckRoot.appendChild(CField);
    CField = CheckDOM.createNode(1,'inputname',''); 
    CField.text = inputname;
    CheckRoot.appendChild(CField);
    CheckDOM.appendChild(CheckRoot);
    var CHttp = getHTTPObject();
    CHttp.open('POST',chedkurl,true);
    CHttp.onreadystatechange = function () 
    {
        if(CHttp.readyState == 4 && CHttp.status==200){
            if(CHttp.responseText == ''){
                Element.hide(inputype);
            }else{
                Element.show(inputype);
                $(inputype).innerHTML=CHttp.responseText;
            }
        }
    }
    CHttp.send(CheckDOM);
}
function addinput(iname,ivalue){
  if(iname!='' && ivalue!=''){
     $(iname).value=ivalue;
  }
}
</script>
<br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Article.asp?ChannelID=1'>文章中心管理</a>&nbsp;&gt;&gt;&nbsp;添加文章</td></tr></table><form method='POST' name='myform' onSubmit='return CheckForm();' action='Admin_Article.asp' target='_self'><table width='100%'  border='0' align='center' cellpadding='0' cellspacing='0'>
  <tr align='center'>
    <td id='TabTitle' class='title6' onclick='ShowTabs(0)'>基本信息</td>
    <td id='TabTitle' class='title5' onclick='ShowTabs(1)'>所属专题</td>
    <td id='TabTitle' class='title5' onclick='ShowTabs(2)'>属性设置</td>
    <td id='TabTitle' class='title5' onclick='ShowTabs(3)'>收费选项</td>
    <td id='TabTitle' class='title5' onclick='ShowTabs(4)' style='display:none'>签收设置</td>
    <td id='TabTitle' class='title5' onclick='ShowTabs(5)' style='display:none'>稿费设置</td>
    <td id='TabTitle' class='title5' onclick='ShowTabs(6);CopyTitle()'>调查设置</td>
    <td id='TabTitle' class='title5' onclick='ShowTabs(7)'>自定义选项</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width='100%' border='0' align='center' cellpadding='5' cellspacing='0' class='border'>  <tr align='center'>    <td class='tdbg' height='200' valign='top'>      <table width='98%' border='0' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF'>        <tbody id='Tabs' style='display:'>
          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>所属栏目：</td>            <td>              <select name='ClassID'><option value=''>请先添加栏目</option><option value='-1'>不指定任何栏目</option></select>              &nbsp;&nbsp;&nbsp;&nbsp;<font color='#FF0000'><strong>注意：</strong></font>              <font color='#0000FF'>不能指定为外部栏目</font>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>文章标题：</td>            <td>              <table width='100%' border='0' cellpadding='0' cellspacing='2'>                                <tr>                  <td width='64' class='tdbg5'>完整标题：</td>                  <td><input name='TitleIntact' type='text' id='TitleIntact' value='' size='80' maxlength='500'></td>                </tr>                <tr>                  <td width='64' class='tdbg5'>副 标 题：</td>                  <td><input name='Subheading' type='text' id='Subheading' value='' size='80' maxlength='500'></td>                </tr>                              </table>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>关键字：</td>            <td>              <div style="clear: both;"><input name='Keyword' type='text' style="clear:both" id='Keyword' value='' autocomplete='off' size='50' maxlength='255' onPropertyChange="moreitem('Keyword',10,1,'skey');" onBlur="setTimeout('Element.hide(skey)',500);"> <font color='#FF0000'>*</font> <font color='blue'><=【<font color='green' onclick="document.myform.Keyword.value+=(document.myform.Keyword.value==''?'':'|')+'test'" style="cursor:hand;">test</font>】【<font color='green' onclick="window.open('Admin_SourceList.asp?ChannelID=1&TypeSelect=KeyList', 'KeyList', 'width=600,height=450,resizable=0,scrollbars=yes');" style="cursor:hand;">更多</font>】</font>              </div><div id="skey" style='display:none'></div>
          <font color='#0000FF'>用来查找相关文章，可输入多个关键字，中间用<font color='#FF0000'>“|”</font>隔开。不能出现&quot;'&?;:()等字符。</font>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>文章作者：</td>            <td>              <div style="clear: both;"><input name='Author' type='text' id='Author' value='' autocomplete='off' size='50' maxlength='100' onPropertyChange="moreitem('Author',10,1,'sauthor');" onBlur="setTimeout('Element.hide(sauthor)',500);"><font color='blue'><=【<font color='green' onclick="document.myform.Author.value='佚名'" style="cursor:hand;">佚名</font>】【<font color='green' onclick="document.myform.Author.value='未知'" style="cursor:hand;">未知</font>】【<font color='green' onclick="document.myform.Author.value='admin'" style="cursor:hand;">admin</font>】【<font color='green' onclick="window.open('Admin_SourceList.asp?TypeSelect=AuthorList&ChannelID=1', 'AuthorList', 'width=600,height=450,resizable=0,scrollbars=yes');" style="cursor:hand;">更多</font>】</font>              </div><div id="sauthor" style='display:none'></div>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>文章来源：</td>            <td>              <div style="clear: both;"><input name='CopyFrom' type='text' id='CopyFrom' value='' autocomplete='off' size='50' maxlength='100' onPropertyChange="moreitem('CopyFrom',10,1,'scopyfrom');" onBlur="setTimeout('Element.hide(scopyfrom)',500);"><font color='blue'><=【<font color='green' onclick="document.myform.CopyFrom.value='本站原创'" style="cursor:hand;">本站原创</font>】【<font color='green' onclick="window.open('Admin_SourceList.asp?TypeSelect=CopyFromList&ChannelID=1', 'CopyFromList', 'width=600,height=450,resizable=0,scrollbars=yes');" style="cursor:hand;">更多</font>】</font>              </div><div id="scopyfrom" style='display:none'></div>            </td>          </tr>                    <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>文章简介：</td>            <td><textarea name='Intro' cols='80' rows='4'></textarea></td>          </tr>          <tr class='tdbg' id='ArticleContent' style="display:''">            <td width='120' align='right' valign='bottom' class='tdbg5'><p>文章内容：</p><br><br><br><br></td>            <td>              <textarea name='Content' style='display:none'></textarea>              <iframe ID='editor' src='../editor.asp?ChannelID=1&ShowType=0&tContentid=Content' frameborder='1' scrolling='no' width='600' height='600' ></iframe>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'><font color='#FF0000'>首页图片：</font></td>            <td>              <input name='DefaultPicUrl' type='text' id='DefaultPicUrl' size='56' maxlength='200'>              用于在首页的图片文章处显示 <br>直接从上传图片中选择：              <select name='DefaultPicList' id='DefaultPicList' onChange="DefaultPicUrl.value=this.value;frmPreview.img.src=((this.value == '') ? '../images/nopic.gif' : '/powereasy_2006/Article/UploadFiles/'+this.value);">                <option selected>不指定首页图片</option>              </select>              <input name='UploadFiles' type='hidden' id='UploadFiles'>            </td>          </tr>          <tr class='tdbg' id='ArticleContent2' style="display:''">             <td width='120' align='right' class='tdbg5'>内容分页方式：</td>            <td>              <select name='PaginationType' id='PaginationType'>                <option value='0' selected>不分页</option>                <option value='1'>自动分页</option>                <option value='2'>手动分页</option>              </select>              &nbsp;&nbsp;&nbsp;&nbsp;<strong><font color='#0000FF'>注：</font></strong><font color='#0000FF'>手动分页符标记为“</font><font color='#FF0000'>[NextPage]</font><font color='#0000FF'>”，注意大小写</font>            </td>          </tr>          <tr class='tdbg' id='ArticleContent3' style="display:''">            <td width='120' align='right' class='tdbg5'>&nbsp;</td>            <td>自动分页时的每页大约字符数（包含HTML标记且必须大于100）：<input name='MaxCharPerPage' type='text' id='MaxCharPerPage' value='10000' size='8' maxlength='8'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>文章状态：</td>            <td><input name='Status' type='radio' id='Status' value='-1'>草稿&nbsp;&nbsp;<input Name='Status' Type='Radio' Id='Status' Value='0'>待审核&nbsp;&nbsp;<input Name='Status' Type='Radio' Id='Status' Value='3' checked>终审通过            </td>          </tr>        </tbody>
<SCRIPT language='javascript'>
function SelectAll(){
  for(var i=0;i<document.myform.SpecialID.length;i++){
    document.myform.SpecialID.options[i].selected=true;}
}
function UnSelectAll(){
  for(var i=0;i<document.myform.SpecialID.length;i++){
    document.myform.SpecialID.options[i].selected=false;}
}
</script>
        <tbody id='Tabs' style='display:none'>
          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>所属专题：</td>            <td>              <select name='SpecialID' size='2' multiple style='height:300px;width:260px;'></select>              <br><input type='button' name='Submit' value='  选定所有专题  ' onclick='SelectAll()'>              <br><input type='button' name='Submit' value='取消选定所有专题' onclick='UnSelectAll()'>            </td>          </tr>        </tbody>
        <tbody id='Tabs' style='display:none'>
          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>文章属性：</td>            <td>              <input name='OnTop' type='checkbox' id='OnTop' value='yes'> 固顶文章&nbsp;&nbsp;&nbsp;&nbsp;              <input name='Hot' type='checkbox' id='Hot' value='yes' onClick="javascript:document.myform.Hits.value='1000'"> 热门文章&nbsp;&nbsp;&nbsp;&nbsp;              <input name='Elite' type='checkbox' id='Elite' value='yes'> 推荐文章&nbsp;&nbsp;&nbsp;&nbsp;              文章评分等级： <select name='Stars' id='Stars'><option value='5'>★★★★★</option><option value='4'>★★★★</option><option value='3' selected>★★★</option><option value='2'>★★</option><option value='1'>★</option><option value='0'>无</option></select>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>点击数初始值：</td>            <td>              <input name='Hits' type='text' id='Hits' value='0' size='10' maxlength='10' style='text-align:center'>&nbsp;&nbsp; <font color='#0000FF'>这功能是提供给管理员作弊用的。不过尽量不要用呀！^_^</font>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>录入时间：</td>            <td>              <input name='UpdateTime' type='text' id='UpdateTime' value='2007-8-15 21:58:07' maxlength='50'> 时间格式为“年-月-日 时:分:秒”，如：<font color='#0000FF'>2003-5-12 12:32:47</font>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>配色风格：</td>            <td><select Name='SkinID'><option value='0' selected>系统默认风格</option><option value='1'>蓝色经典</option><option value='2'>动易2006典雅系列</option><option value='3'>动易2006海蓝（默认）</option><option value='4'>动易2006海之恋风格</option></select>&nbsp;相关模板中包含CSS、颜色、图片等信息</td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>版面设计模板：</td>            <td><select Name='TemplateID'><option value='0' selected>系统默认内容页模板</option><option value='32'>文章内容页模板（一列式）</option><option value='33'>文章内容页模板（二列式(左小右大)）</option><option value='34'>文章内容页模板（二列式(左大右小)）</option><option value='152'>文章内容页模板（一列式）</option><option value='153'>文章内容页模板（二列式(左小右大)）</option><option value='154'>文章内容页模板（二列式(左大右小)）</option><option value='270'>2006海蓝文章内容页模板（一列式）（默认）</option><option value='271'>2006海蓝文章内容页模板（二列式(左小右大)）</option><option value='272'>2006海蓝文章内容页模板（二列式(左大右小)）</option><option value='384'>海之恋文章内容页模板（左小右大）</option></select>&nbsp;相关模板中包含了版面设计的版式等信息</td>          </tr>        </tbody>
        <tbody id='Tabs' style='display:none'>
          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>阅读权限：</td>            <td><input name='InfoPurview' type='radio' value='0' checked>继承栏目权限（当所属栏目为认证栏目时，建议选择此项）<br>            <input name='InfoPurview' type='radio' value='1'>所有会员（当所属栏目为开放栏目，想单独对某些文章进行阅读权限设置，可以选择此项）<br>            <input name='InfoPurview' type='radio' value='2'>指定会员组（当所属栏目为开放栏目，想单独对某些文章进行阅读权限设置，可以选择此项）<br><table width='95%' align='right'><tr><td><input type='checkbox' name='arrGroupID' value='8'>未验证会员</td><td><input type='checkbox' name='arrGroupID' value='7'>待审批会员</td><td><input type='checkbox' name='arrGroupID' value='1'>注册会员</td><td><input type='checkbox' name='arrGroupID' value='2'>商业客户</td><td><input type='checkbox' name='arrGroupID' value='3'>VIP客户</td></tr><tr><td><input type='checkbox' name='arrGroupID' value='4'>普通代理</td><td><input type='checkbox' name='arrGroupID' value='5'>金牌代理</td><td><input type='checkbox' name='arrGroupID' value='6'>钻石代理</td></table>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>阅读点数：</td>            <td><input name='InfoPoint' type='text' id='InfoPoint' value='' size='5' maxlength='4' style='text-align:center'>               &nbsp;&nbsp;<font color='#0000FF'>如果点数大于0，则有权限的会员阅读此文章时将消耗相应点数（设为9999时除外），游客将无法阅读此文章</font>            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>重复收费：</td>            <td><input name='ChargeType' type='radio' value='0' checked>不重复收费<br>            <input name='ChargeType' type='radio' value='1'>距离上次收费时间 <input name='PitchTime' type='text' value='24' size='8' maxlength='8' style='text-align:center'> 小时后重新收费<br>            <input name='ChargeType' type='radio' value='2'>会员重复阅读此文章 <input name='ReadTimes' type='text' value='10' size='8' maxlength='8' style='text-align:center'> 次后重新收费<br>            <input name='ChargeType' type='radio' value='3'>上述两者都满足时重新收费<br>            <input name='ChargeType' type='radio' value='4'>上述两者任一个满足时就重新收费<br>            <input name='ChargeType' type='radio' value='5'>每阅读一次就重复收费一次（建议不要使用）            </td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>分成比例：</td>            <td><input name='DividePercent' type='text' id='DividePercent' value='0' size='5' maxlength='4' style='text-align:center'> %              &nbsp;&nbsp;<font color='#0000FF'>如果比例大于0，则将按比例把向阅读者收取的点数支付给录入者</font>            </td>          </tr>        </tbody>
        <tbody id='Tabs' style='display:none'>
        </tbody>
        <tbody id='Tabs' style='display:none'>
        </tbody>
        <tbody id='Tabs' style='display:none'>
          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>启用调查：</td><td><input name='ShowVote' type='checkbox' id='ShowVote' value='yes'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>调查主题：</td><td><textarea name='VoteTitle' cols='50' rows='4'></textarea></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>选项1：</td><td><input type='text' name='select1' size='36'>&nbsp;票数：<input type='text' name='answer1' size='10'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>选项2：</td><td><input type='text' name='select2' size='36'>&nbsp;票数：<input type='text' name='answer2' size='10'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>选项3：</td><td><input type='text' name='select3' size='36'>&nbsp;票数：<input type='text' name='answer3' size='10'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>选项4：</td><td><input type='text' name='select4' size='36'>&nbsp;票数：<input type='text' name='answer4' size='10'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>选项5：</td><td><input type='text' name='select5' size='36'>&nbsp;票数：<input type='text' name='answer5' size='10'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>选项6：</td><td><input type='text' name='select6' size='36'>&nbsp;票数：<input type='text' name='answer6' size='10'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>选项7：</td><td><input type='text' name='select7' size='36'>&nbsp;票数：<input type='text' name='answer7' size='10'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>选项8：</td><td><input type='text' name='select8' size='36'>&nbsp;票数：<input type='text' name='answer8' size='10'></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>调查类型：</td><td><select name='VoteType' id='VoteType'><option value='Single' selected>单选</option><option value='Multi'>多选</option></select></td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>开始时间：</td><td><input type='text' name='BeginTime' size='20' value='2007-8-15 21:58:07'>&nbsp;调查开始的时间</td>          </tr>          <tr class='tdbg'>            <td width='120' align='right' class='tdbg5'>终止时间：</td><td><input type='text' name='EndTime' size='20' value='2007-9-14 21:58:07'>&nbsp;调查结束的时间</td>          </tr>        </tbody>
        <tbody id='Tabs' style='display:none'>
        </tbody>
        </table>      </td>    </tr>  </table><table id='Tabs_Bottom' width='100%'  border='0' align='center' cellpadding='0' cellspacing='0'>
  <tr align='center' height='24'>
    <td id='TabBottom' class='title4' onclick='ShowTabs(0)'>基本信息</td>
    <td id='TabBottom' class='title3' onclick='ShowTabs(1)'>所属专题</td>
    <td id='TabBottom' class='title3' onclick='ShowTabs(2)'>属性设置</td>
    <td id='TabBottom' class='title3' onclick='ShowTabs(3)'>收费选项</td>
    <td id='TabBottom' class='title3' onclick='ShowTabs(4)' style='display:none'>签收设置</td>
    <td id='TabBottom' class='title3' onclick='ShowTabs(5)' style='display:none'><br><br><br>稿费设置<br><br><br><br><br><br></td>
    <td id='TabBottom' class='title3' onclick='ShowTabs(6);CopyTitle()'>调查设置</td>
    <td id='TabBottom' class='title3' onclick='ShowTabs(7)'>自定义选项</td>
    <td>&nbsp;</td>
  </tr>
</table>
  <p align='center'>   <input name='Action' type='hidden' id='Action' value='SaveAdd'>   <input name='ChannelID' type='hidden' id='ChannelID' value='1'>   <input name='add' type='submit'  id='Add' value=' 添 加 ' onClick="document.myform.Action.value='SaveAdd';document.myform.target='_self';" style='cursor:hand;'>&nbsp;    <input name='Preview' type='submit'  id='Preview' value=' 预 览 ' onClick="document.myform.Action.value='Preview';document.myform.target='_blank';" style='cursor:hand;'>   <input name='Cancel' type='button' id='Cancel' value=' 取 消 ' onClick="window.location.href='Admin_Article.asp?ChannelID=1&Action=Manage';" style='cursor:hand;'>  </p><br></form></body></html>
<!-- Powered by: PowerEasy 2005 -->