<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  

<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type  content="text/html; charset=utf-8" >
<title>Word文档生成</title>
<!--[if gte mso 9]><xml><w:WordDocument><w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel><w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery><w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery><w:DocumentKind>DocumentNotSpecified</w:DocumentKind><w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing><w:PunctuationKerning></w:PunctuationKerning><w:View>Print</w:View><w:Compatibility><w:DontGrowAutofit/><w:BalanceSingleByteDoubleByteWidth/><w:DoNotExpandShiftReturn/><w:UseFELayout/></w:Compatibility><w:Zoom>0</w:Zoom></w:WordDocument></xml><![endif]--><!--[if gte mso 9]><xml><w:LatentStyles DefLockedState="false"  DefUnhideWhenUsed="true"  DefSemiHidden="true"  DefQFormat="false"  DefPriority="99"  LatentStyleCount="260" >
<w:LsdException Locked="false"  Priority="0"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Normal" ></w:LsdException>
<w:LsdException Locked="false"  Priority="9"  SemiHidden="false"  UnhideWhenUsed="false"  QFormat="true"  Name="heading 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="9"  SemiHidden="false"  QFormat="true"  Name="heading 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="9"  SemiHidden="false"  QFormat="true"  Name="heading 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="9"  SemiHidden="false"  QFormat="true"  Name="heading 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="9"  SemiHidden="false"  QFormat="true"  Name="heading 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="9"  SemiHidden="false"  QFormat="true"  Name="heading 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="9"  SemiHidden="false"  QFormat="true"  Name="heading 7" ></w:LsdException>
<w:LsdException Locked="false"  Priority="9"  SemiHidden="false"  QFormat="true"  Name="heading 8" ></w:LsdException>
<w:LsdException Locked="false"  Priority="9"  SemiHidden="false"  QFormat="true"  Name="heading 9" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index 7" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index 8" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index 9" ></w:LsdException>
<w:LsdException Locked="false"  Priority="39"  SemiHidden="false"  Name="toc 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="39"  SemiHidden="false"  Name="toc 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="39"  SemiHidden="false"  Name="toc 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="39"  SemiHidden="false"  Name="toc 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="39"  SemiHidden="false"  Name="toc 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="39"  SemiHidden="false"  Name="toc 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="39"  SemiHidden="false"  Name="toc 7" ></w:LsdException>
<w:LsdException Locked="false"  Priority="39"  SemiHidden="false"  Name="toc 8" ></w:LsdException>
<w:LsdException Locked="false"  Priority="39"  SemiHidden="false"  Name="toc 9" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Normal Indent" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="footnote text" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="annotation text" ></w:LsdException>
<w:LsdException Locked="false"  Priority="0"  SemiHidden="false"  UnhideWhenUsed="false"  Name="header" ></w:LsdException>
<w:LsdException Locked="false"  Priority="0"  SemiHidden="false"  UnhideWhenUsed="false"  Name="footer" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="index heading" ></w:LsdException>
<w:LsdException Locked="false"  Priority="35"  SemiHidden="false"  QFormat="true"  Name="caption" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="table of figures" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="envelope address" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="envelope return" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="footnote reference" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="annotation reference" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="line number" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="page number" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="endnote reference" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="endnote text" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="table of authorities" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="macro" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="toa heading" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Bullet" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Number" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Bullet 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Bullet 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Bullet 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Bullet 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Number 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Number 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Number 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Number 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="10"  SemiHidden="false"  UnhideWhenUsed="false"  QFormat="true"  Name="Title" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Closing" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Signature" ></w:LsdException>
<w:LsdException Locked="false"  Priority="0"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Default Paragraph Font" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Body Text" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Body Text Indent" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Continue" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Continue 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Continue 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Continue 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="List Continue 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Message Header" ></w:LsdException>
<w:LsdException Locked="false"  Priority="11"  SemiHidden="false"  UnhideWhenUsed="false"  QFormat="true"  Name="Subtitle" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Salutation" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Date" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Body Text First Indent" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Body Text First Indent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Note Heading" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Body Text 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Body Text 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Body Text Indent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Body Text Indent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Block Text" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Hyperlink" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="FollowedHyperlink" ></w:LsdException>
<w:LsdException Locked="false"  Priority="22"  SemiHidden="false"  UnhideWhenUsed="false"  QFormat="true"  Name="Strong" ></w:LsdException>
<w:LsdException Locked="false"  Priority="20"  SemiHidden="false"  UnhideWhenUsed="false"  QFormat="true"  Name="Emphasis" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Document Map" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Plain Text" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="E-mail Signature" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Normal (Web)" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Acronym" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Address" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Cite" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Code" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Definition" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Keyboard" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Preformatted" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Sample" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Typewriter" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="HTML Variable" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Normal Table" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="annotation subject" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="No List" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Simple 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Simple 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Simple 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Classic 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Classic 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Classic 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Classic 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Colorful 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Colorful 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Colorful 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Columns 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Columns 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Columns 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Columns 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Columns 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Grid 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Grid 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Grid 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Grid 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Grid 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Grid 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Grid 7" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Grid 8" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table List 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table List 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table List 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table List 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table List 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table List 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table List 7" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table List 8" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table 3D effects 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table 3D effects 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table 3D effects 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Contemporary" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Elegant" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Professional" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Subtle 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Subtle 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Web 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Web 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Web 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Balloon Text" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Grid" ></w:LsdException>
<w:LsdException Locked="false"  Priority="99"  SemiHidden="false"  Name="Table Theme" ></w:LsdException>
<w:LsdException Locked="false"  Priority="60"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Shading" ></w:LsdException>
<w:LsdException Locked="false"  Priority="61"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light List" ></w:LsdException>
<w:LsdException Locked="false"  Priority="62"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Grid" ></w:LsdException>
<w:LsdException Locked="false"  Priority="63"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="64"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="65"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="66"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="67"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="68"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="69"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="70"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Dark List" ></w:LsdException>
<w:LsdException Locked="false"  Priority="71"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Shading" ></w:LsdException>
<w:LsdException Locked="false"  Priority="72"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful List" ></w:LsdException>
<w:LsdException Locked="false"  Priority="73"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Grid" ></w:LsdException>
<w:LsdException Locked="false"  Priority="60"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Shading Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="61"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light List Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="62"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Grid Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="63"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 1 Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="64"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 2 Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="65"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 1 Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="66"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 2 Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="67"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 1 Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="68"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 2 Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="69"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 3 Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="70"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Dark List Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="71"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Shading Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="72"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful List Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="73"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Grid Accent 1" ></w:LsdException>
<w:LsdException Locked="false"  Priority="60"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Shading Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="61"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light List Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="62"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Grid Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="63"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 1 Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="64"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 2 Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="65"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 1 Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="66"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 2 Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="67"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 1 Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="68"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 2 Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="69"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 3 Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="70"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Dark List Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="71"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Shading Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="72"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful List Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="73"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Grid Accent 2" ></w:LsdException>
<w:LsdException Locked="false"  Priority="60"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Shading Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="61"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light List Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="62"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Grid Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="63"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 1 Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="64"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 2 Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="65"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 1 Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="66"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 2 Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="67"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 1 Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="68"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 2 Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="69"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 3 Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="70"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Dark List Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="71"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Shading Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="72"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful List Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="73"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Grid Accent 3" ></w:LsdException>
<w:LsdException Locked="false"  Priority="60"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Shading Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="61"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light List Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="62"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Grid Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="63"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 1 Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="64"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 2 Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="65"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 1 Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="66"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 2 Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="67"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 1 Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="68"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 2 Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="69"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 3 Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="70"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Dark List Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="71"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Shading Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="72"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful List Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="73"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Grid Accent 4" ></w:LsdException>
<w:LsdException Locked="false"  Priority="60"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Shading Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="61"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light List Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="62"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Grid Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="63"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 1 Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="64"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 2 Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="65"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 1 Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="66"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 2 Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="67"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 1 Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="68"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 2 Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="69"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 3 Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="70"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Dark List Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="71"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Shading Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="72"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful List Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="73"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Grid Accent 5" ></w:LsdException>
<w:LsdException Locked="false"  Priority="60"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Shading Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="61"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light List Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="62"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Light Grid Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="63"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 1 Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="64"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Shading 2 Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="65"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 1 Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="66"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium List 2 Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="67"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 1 Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="68"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 2 Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="69"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Medium Grid 3 Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="70"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Dark List Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="71"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Shading Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="72"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful List Accent 6" ></w:LsdException>
<w:LsdException Locked="false"  Priority="73"  SemiHidden="false"  UnhideWhenUsed="false"  Name="Colorful Grid Accent 6" ></w:LsdException>
</w:LatentStyles></xml><![endif]-->
<style>
@font-face {
font-family:"Times New Roman";
}
 @font-face {
font-family:"宋体";
}
 @font-face {
font-family:"Wingdings";
}
 @font-face {
font-family:"Arial";
}
 @font-face {
font-family:"黑体";
}
 @font-face {
font-family:"????";
}
 @list l0:level1 {
mso-level-number-format:decimal;
mso-level-suffix:tab;
mso-level-text:"%1.";
mso-level-tab-stop:39.0000pt;
mso-level-number-position:left;
margin-left:39.0000pt;
text-indent:-18.0000pt;
font-family:'Times New Roman';
}
 @list l1:level1 {
mso-level-number-format:bullet;
mso-level-suffix:tab;
mso-level-text:\F06C;
mso-level-tab-stop:81.0000pt;
mso-level-number-position:left;
margin-left:81.0000pt;
text-indent:-18.0000pt;
font-family:Wingdings;
}
 @list l2:level1 {
mso-level-number-format:decimal;
mso-level-suffix:tab;
mso-level-text:"%1.";
mso-level-tab-stop:18.0000pt;
mso-level-number-position:left;
margin-left:18.0000pt;
text-indent:-18.0000pt;
font-family:'Times New Roman';
}
 @list l3:level1 {
mso-level-number-format:bullet;
mso-level-suffix:tab;
mso-level-text:\F06C;
mso-level-tab-stop:18.0000pt;
mso-level-number-position:left;
margin-left:18.0000pt;
text-indent:-18.0000pt;
font-family:Wingdings;
}
 @list l4:level1 {
mso-level-number-format:bullet;
mso-level-suffix:tab;
mso-level-text:\F06C;
mso-level-tab-stop:60.0000pt;
mso-level-number-position:left;
margin-left:60.0000pt;
text-indent:-18.0000pt;
font-family:Wingdings;
}
 @list l5:level1 {
mso-level-number-format:decimal;
mso-level-suffix:tab;
mso-level-text:"%1.";
mso-level-tab-stop:60.0000pt;
mso-level-number-position:left;
margin-left:60.0000pt;
text-indent:-18.0000pt;
font-family:'Times New Roman';
}
 @list l6:level1 {
mso-level-number-format:bullet;
mso-level-suffix:tab;
mso-level-text:\F06C;
mso-level-tab-stop:39.0000pt;
mso-level-number-position:left;
margin-left:39.0000pt;
text-indent:-18.0000pt;
font-family:Wingdings;
}
 @list l7:level1 {
mso-level-number-format:bullet;
mso-level-suffix:tab;
mso-level-text:\F06C;
mso-level-tab-stop:102.0000pt;
mso-level-number-position:left;
margin-left:102.0000pt;
text-indent:-18.0000pt;
font-family:Wingdings;
}
 @list l8:level1 {
mso-level-number-format:decimal;
mso-level-suffix:tab;
mso-level-text:"%1.";
mso-level-tab-stop:81.0000pt;
mso-level-number-position:left;
margin-left:81.0000pt;
text-indent:-18.0000pt;
font-family:'Times New Roman';
}
 @list l9:level1 {
mso-level-number-format:decimal;
mso-level-suffix:tab;
mso-level-text:"%1.";
mso-level-tab-stop:102.0000pt;
mso-level-number-position:left;
margin-left:102.0000pt;
text-indent:-18.0000pt;
font-family:'Times New Roman';
}
 @list l10:level1 {
mso-level-number-format:decimal;
mso-level-suffix:none;
mso-level-text:"%1.";
mso-level-tab-stop:none;
mso-level-number-position:left;
margin-left:0.0000pt;
text-indent:0.0000pt;
font-family:'Times New Roman';
}
p.MsoNormal {
	mso-style-name:正文;
	mso-style-parent:"";
	margin:0pt;
	margin-bottom:.0001pt;
	mso-pagination:none;
	text-align:justify;
	text-justify:inter-ideograph;
	font-family:'Times New Roman';
	mso-fareast-font-family:宋体;
	font-size:10.5000pt;
	mso-font-kerning:1.0000pt;
}
h1 {
	mso-style-name:"标题 1";
	mso-style-next:正文;
	margin-top:17.0000pt;
	margin-bottom:16.5000pt;
	mso-para-margin-top:0.0000gd;
	mso-para-margin-bottom:0.0000gd;
	page-break-after:avoid;
	mso-pagination:lines-together;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-outline-level:1;
	line-height:240%;
	font-family:'Times New Roman';
	mso-fareast-font-family:宋体;
	font-weight:bold;
	font-size:22.0000pt;
	mso-font-kerning:22.0000pt;
}
h2 {
	mso-style-name:"标题 2";
	mso-style-noshow:yes;
	mso-style-next:正文;
	margin-top:13.0000pt;
	margin-bottom:13.0000pt;
	mso-para-margin-top:0.0000gd;
	mso-para-margin-bottom:0.0000gd;
	page-break-after:avoid;
	mso-pagination:lines-together;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-outline-level:2;
	line-height:172%;
	font-family:Arial;
	mso-fareast-font-family:黑体;
	font-weight:bold;
	font-size:16.0000pt;
	mso-font-kerning:1.0000pt;
}
h3 {
	mso-style-name:"标题 3";
	mso-style-noshow:yes;
	mso-style-next:正文;
	margin-top:13.0000pt;
	margin-bottom:13.0000pt;
	mso-para-margin-top:0.0000gd;
	mso-para-margin-bottom:0.0000gd;
	page-break-after:avoid;
	mso-pagination:lines-together;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-outline-level:3;
	line-height:172%;
	font-family:'Times New Roman';
	mso-fareast-font-family:宋体;
	font-weight:bold;
	font-size:16.0000pt;
	mso-font-kerning:1.0000pt;
}
h4 {
	mso-style-name:"标题 4";
	mso-style-noshow:yes;
	mso-style-next:正文;
	margin-top:14.0000pt;
	margin-bottom:14.5000pt;
	mso-para-margin-top:0.0000gd;
	mso-para-margin-bottom:0.0000gd;
	page-break-after:avoid;
	mso-pagination:lines-together;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-outline-level:4;
	line-height:155%;
	font-family:Arial;
	mso-fareast-font-family:黑体;
	font-weight:bold;
	font-size:14.0000pt;
	mso-font-kerning:1.0000pt;
}
span.10 {
	font-family:'Times New Roman';
}
span.15 {
	font-family:'Times New Roman';
	color:rgb(0,0,255);
	text-decoration:underline;
	text-underline:single;
}
p.MsoHeader {
	mso-style-name:页眉;
	margin:0pt;
	margin-bottom:.0001pt;
	border-top:none;
	;
	mso-border-top-alt:none;
	;
	border-right:none;
	;
	mso-border-right-alt:none;
	;
	border-bottom:none;
	;
	mso-border-bottom-alt:none;
	;
	border-left:none;
	;
	mso-border-left-alt:none;
	;
	padding:1pt 4pt 1pt 4pt;
	layout-grid-mode:char;
	mso-pagination:none;
	text-align:justify;
	text-justify:inter-ideograph;
	font-family:'Times New Roman';
	mso-fareast-font-family:宋体;
	font-size:9.0000pt;
	mso-font-kerning:1.0000pt;
}
p.MsoFooter {
	mso-style-name:页脚;
	margin:0pt;
	margin-bottom:.0001pt;
	layout-grid-mode:char;
	mso-pagination:none;
	text-align:left;
	font-family:'Times New Roman';
	mso-fareast-font-family:宋体;
	font-size:9.0000pt;
	mso-font-kerning:1.0000pt;
}
p.NewStyle18 {
	mso-style-name:标题4;
	mso-style-parent:"标题 4";
	margin-top:14.0000pt;
	margin-bottom:14.5000pt;
	mso-para-margin-top:0.0000gd;
	mso-para-margin-bottom:0.0000gd;
	page-break-after:avoid;
	mso-pagination:lines-together;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-outline-level:4;
	line-height:155%;
	font-family:'Times New Roman';
	mso-fareast-font-family:黑体;
	font-weight:bold;
	font-size:14.0000pt;
	mso-font-kerning:1.0000pt;
}
span.msoIns {
	mso-style-type:export-only;
	mso-style-name:"";
	text-decoration:underline;
	text-underline:single;
	color:blue;
}
span.msoDel {
	mso-style-type:export-only;
	mso-style-name:"";
	text-decoration:line-through;
	color:red;
}
table.MsoNormalTable {
	mso-style-name:普通表格;
	mso-style-parent:"";
	mso-style-noshow:yes;
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt;
	mso-para-margin:0pt;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-family:'Times New Roman';
	font-size:10.0000pt;
	mso-ansi-language:#0400;
	mso-fareast-language:#0400;
	mso-bidi-language:#0400;
}
@page {
mso-page-border-surround-header:no;
 mso-page-border-surround-footer:no;
}
@page Section0 {
	margin-top:72.0000pt;
	margin-bottom:72.0000pt;
	margin-left:90.0000pt;
	margin-right:90.0000pt;
	size:595.3000pt 841.9000pt;
	layout-grid:15.6000pt;
}
div.Section0 {
	page:Section0;
}
</style>
</head>
<body style="tab-interval:21pt; text-justify-trim:punctuation; " >

<img width="268"  height="271"  src="${img}" >
<!--StartFragment-->
<div class="Section0"  style="layout-grid:15.6000pt; " >
  <h1><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:22.0000pt; mso-font-kerning:22.0000pt; " >Word<font face="宋体" >文档生成</font></span><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:22.0000pt; mso-font-kerning:22.0000pt; " >
    <o:p></o:p>
  </span></h1>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >作者：何荣靖</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >时间：<font face="Times New Roman" >2016-05-11</font></span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <h2><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:Arial; mso-hansi-font-family:Arial; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >方法一</span><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:Arial; mso-hansi-font-family:Arial; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></h2>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >完全对丢<font face="Times New Roman" >freemarker&nbsp;</font><font face="宋体" >的处理方式&nbsp;</font></span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <h3><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >第一步&nbsp;模板文件生成</span><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></h3>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >&nbsp;用高版本<font face="Times New Roman" >office</font><font face="宋体" >或者</font><font face="Times New Roman" >WPS</font><font face="宋体" >开发</font></span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>

  <p class=MsoNormal ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >另存为</span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >html</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >格式</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >注意：默认另存的<font face="Times New Roman" >html</font><font face="宋体" >模板文件的打开模式是&nbsp;&nbsp;</font></span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >web<font face="宋体" >版式</font></span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >那么用这样的模板文件生成出来的<font face="Times New Roman" >word</font><font face="宋体" >文件默认打开也是</font></span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >&nbsp;web<font face="宋体" >版式</font></span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >正常的模式是&nbsp;&nbsp;页面视图</span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >用<font face="Times New Roman" >WPS</font><font face="宋体" >打开</font><font face="Times New Roman" >html</font><font face="宋体" >打开&nbsp;模板后&nbsp;点击右下角的&nbsp;</font></span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >页面视图&nbsp;</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >然后在模板的任意文件添加一个空格然后保存模板&nbsp;再关闭模板，重新打开模板文件如果默认显示的模式为&nbsp;</span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >页面视图&nbsp;</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >的话&nbsp;则显示为正常</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <h3><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >第二步&nbsp;模板文件代码格式化&nbsp;</span><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></h3>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >用</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >工具打开模板文件</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >&nbsp;，<font face="Times New Roman" >32</font><font face="宋体" >位操作系统和</font><font face="Times New Roman" >64</font><font face="宋体" >位操作系统需要安装软件不同</font></span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >点击</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >&nbsp;</span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >应用源格式</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >&nbsp;&nbsp;对&nbsp;模板文件的代码进行格式化处理</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >格式化的目的主要是为了</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >&nbsp;页面赋值</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <h3><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >第三步&nbsp;页面赋值</span><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></h3>
  <p class=NewStyle18 ><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; font-weight:bold; font-size:14.0000pt; mso-font-kerning:1.0000pt; " >Java<font face="黑体" >部分</font></span><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; font-weight:bold; font-size:14.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoFooter ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:9.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=NewStyle18 ><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; font-weight:bold; font-size:14.0000pt; mso-font-kerning:1.0000pt; " >Struts<font face="黑体" >部分</font></span><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; font-weight:bold; font-size:14.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoFooter ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:9.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoFooter ><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:9.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=NewStyle18 ><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; font-weight:bold; font-size:14.0000pt; mso-font-kerning:1.0000pt; " >Jsp<font face="黑体" >部分</font></span><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; font-weight:bold; font-size:14.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoHeader ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:9.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal >&nbsp;</p>
  <p class=MsoHeader ><span style="mso-spacerun:'yes'; font-family:宋体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; font-size:9.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoHeader ><span style="mso-spacerun:'yes'; font-family:宋体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; color:rgb(255,0,0); font-size:9.0000pt; mso-font-kerning:1.0000pt; " >备注：页面赋值和&nbsp;列表循环和&nbsp;普通的<font face="Times New Roman" >jsp</font><font face="宋体" >页面处理方式相同</font></span><span style="mso-spacerun:'yes'; font-family:宋体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; color:rgb(255,0,0); font-size:9.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoHeader ><span style="mso-spacerun:'yes'; font-family:宋体; mso-ascii-font-family:'Times New Roman'; mso-hansi-font-family:'Times New Roman'; color:rgb(255,0,0); font-size:9.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <h2><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:Arial; mso-hansi-font-family:Arial; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >方法二&nbsp;</span><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:Arial; mso-hansi-font-family:Arial; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></h2>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >freemarker&nbsp;<font face="宋体" >生成</font><font face="Times New Roman" >word&nbsp;</font></span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <h3><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >Java<font face="宋体" >部分</font></span><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></h3>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >在方法一的基础上处理好模板文件并放在对应的</span><span style="mso-spacerun:'yes'; font-family:????; color:rgb(63,127,95); font-size:12.0000pt; mso-font-kerning:1.0000pt; background:rgb(255,255,255); mso-highlight:rgb(255,255,255); " >resource</span><span style="mso-spacerun:'yes'; font-family:宋体; mso-ascii-font-family:????; mso-hansi-font-family:????; color:rgb(63,127,95); font-size:12.0000pt; mso-font-kerning:1.0000pt; background:rgb(255,255,255); mso-highlight:rgb(255,255,255); " >&nbsp;</span><span style="mso-spacerun:'yes'; font-family:宋体; mso-ascii-font-family:????; mso-hansi-font-family:????; font-size:12.0000pt; mso-font-kerning:1.0000pt; background:rgb(255,255,255); mso-highlight:rgb(255,255,255); " >目录下面</span><span style="mso-spacerun:'yes'; font-family:宋体; mso-ascii-font-family:????; mso-hansi-font-family:????; font-size:12.0000pt; mso-font-kerning:1.0000pt; background:rgb(255,255,255); mso-highlight:rgb(255,255,255); " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><br><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <h3><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >模板部分</span><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></h3>
  <p class=MsoNormal ><br><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >基本按照</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >&nbsp;</span><span style="mso-spacerun:'yes'; font-family:宋体; color:rgb(255,0,0); font-size:10.5000pt; mso-font-kerning:1.0000pt; " >freemarker&nbsp;</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >标签的语法进行取值</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <h3><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >freemarker&nbsp;<font face="宋体" >语法</font></span><span style="mso-spacerun:'yes'; font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></h3>
  <p class=MsoNormal  style="mso-para-margin-top:0.0000gd; mso-para-margin-bottom:0.0000gd; text-align:left; " ><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; font-size:13.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal  style="mso-para-margin-top:0.0000gd; mso-para-margin-bottom:0.0000gd; text-align:left; " >&nbsp;</p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; color:rgb(128,128,128); font-size:12.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:'Times New Roman'; mso-fareast-font-family:宋体; color:rgb(128,128,128); font-size:12.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
  <h2><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:Arial; mso-hansi-font-family:Arial; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >S标签列表：</span><span style="mso-spacerun:'yes'; font-family:黑体; mso-ascii-font-family:Arial; mso-hansi-font-family:Arial; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></h2>
  <p class=MsoNormal  style="mso-list:l10 level1 lfo1; " ><![if !supportLists]><span style="font-family:宋体; font-size:12.0000pt; mso-font-kerning:1.0000pt; " ><span style='mso-list:Ignore; ' >1.</span></span><![endif]><span style="mso-spacerun:'yes'; font-family:宋体; font-size:12.0000pt; mso-font-kerning:1.0000pt; " >如果是单个只包含表格&nbsp;图片等数据，<font face="Times New Roman" >word</font><font face="宋体" >文档中可以显示的最好用方法一</font></span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal  style="mso-list:l10 level1 lfo1; " ><![if !supportLists]><span style="font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " ><span style='mso-list:Ignore; ' >2.</span></span><![endif]><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >如果导出列表中上传的一些附件&nbsp;建议使用方法二</span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  

  <p class=MsoNormal  style="mso-pagination:none; text-align:justify; text-justify:inter-ideograph; " ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >3&nbsp;.&nbsp;<font face="宋体" >注意生成模板文件的编码方式</font></span><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p></o:p>
  </span></p>
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
 
  <p class=MsoNormal ><span style="mso-spacerun:'yes'; font-family:宋体; font-size:10.5000pt; mso-font-kerning:1.0000pt; " >
    <o:p>&nbsp;</o:p>
  </span></p>
</div>

<style   type="text/css">

.table_border{  
    border: solid 1px #B4B4B4;  
    border-collapse: collapse;     --折叠样式.  
}  
.table_border tr th{  
    background:url("../../images/gray/bg_table_th.gif") repeat;  
    padding-left:4px;  
    height:27px;  
    border: solid 1px #B4B4B4;  
}  
.table_border tr td{  
    height:25px;  
    padding:4px;  
    border: solid 1px #B4B4B4;  
}  
</style>
 
<table width="100%"  class="table_border" width="100%" border="0" id="high_light" lang="tabRowData"  
         cellpadding="0" cellspacing="0" >
  <tr>
    <td>序号</td>
    <td>名称</td>
    <td>时间</td>
  </tr>
 <s:iterator value="#request.list" status="sta">
	  <tr>
	    <td>${sta.index+1}</td>
	    <td>${bname}</td>
	    <td>${date}</td>
	   
	  </tr>
</s:iterator>
</table>

<!--EndFragment-->
</body>
</html>