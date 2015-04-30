<%@ WebHandler Language="VB" Class="NumberToImageHandler" %>

Imports System
Imports System.Web
Imports Microsoft.Web
Imports System.Drawing

'For more information on dynamically generating images see:
'
'   Dynamically Generating and Caching Images in ASP.NET with the GeneratedImage Control 
'   http://www.4guysfromrolla.com/articles/042209-1.aspx
'

Public Class NumberToImageHandler : Inherits ImageHandler
    
    Public Sub New()
        MyBase.ContentType = Imaging.ImageFormat.Png
        
        MyBase.EnableClientCache = True
    End Sub

    Public Overrides Function GenerateImage(ByVal parameters As System.Collections.Specialized.NameValueCollection) As Microsoft.Web.ImageInfo
        Dim sz As SizeF = Nothing
        
        Dim numberFont As New Font("Verdana", 12, FontStyle.Bold)
        
        Using dummyBitmap As New Bitmap(1, 1)
            Dim dummyGraphics As Graphics = Graphics.FromImage(dummyBitmap)
            sz = dummyGraphics.MeasureString(parameters("number"), numberFont)
        End Using
        
        Dim realWidth = sz.Width + 6
        Dim realHeight = sz.Height + 4
        
        Dim realBitmap As New Bitmap(Convert.ToInt32(realWidth), Convert.ToInt32(realHeight))
        Dim realGraphics As Graphics = Graphics.FromImage(realBitmap)
        realGraphics.Clear(Color.Transparent)
        realGraphics.FillEllipse(Brushes.Navy, 0, 0, realWidth, realHeight)
        realGraphics.DrawString(parameters("number"), numberFont, New SolidBrush(Color.White), 3, 2)
        
        Return New ImageInfo(realBitmap)
    End Function
End Class