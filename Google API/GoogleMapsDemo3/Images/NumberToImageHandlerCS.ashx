<%@ WebHandler Language="C#" Class="NumberToImageHandlerCS" %>

using System;
using System.Web;
using Microsoft.Web;
using System.Drawing;
using System.Drawing.Imaging;

//For more information on dynamically generating images see:
//
//   Dynamically Generating and Caching Images in ASP.NET with the GeneratedImage Control 
//   http://www.4guysfromrolla.com/articles/042209-1.aspx
//

public class NumberToImageHandlerCS : ImageHandler
{
    public NumberToImageHandlerCS()
    {
        base.ContentType = ImageFormat.Png;

        base.EnableClientCache = true;
    }

    public override ImageInfo GenerateImage(System.Collections.Specialized.NameValueCollection parameters)
    {
        SizeF sz;
        
        var numberFont = new Font("Verdana", 12, FontStyle.Bold);
        
        using (var dummyBitmap = new Bitmap(1, 1)) {
            var dummyGraphics = Graphics.FromImage(dummyBitmap);
            sz = dummyGraphics.MeasureString(parameters["number"], numberFont);
        }
        
        var realWidth = sz.Width + 6;
        var realHeight = sz.Height + 4;
        
        var realBitmap = new Bitmap(Convert.ToInt32(realWidth), Convert.ToInt32(realHeight));
        var realGraphics = Graphics.FromImage(realBitmap);
        realGraphics.Clear(Color.Transparent);
        realGraphics.FillEllipse(Brushes.Navy, 0, 0, realWidth, realHeight);
        realGraphics.DrawString(parameters["number"], numberFont, new SolidBrush(Color.White), 3, 2);

        return new ImageInfo(realBitmap);
    }
}