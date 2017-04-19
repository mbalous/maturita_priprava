 param (
    [Parameter(Mandatory=$true)]
    [string]
    $author,
    [Parameter(Mandatory=$true)]
    [string]
    $bookName
)




$source = @"
using System;
using System.Diagnostics.CodeAnalysis;
using System.IO;

[SuppressMessage("ReSharper", "CheckNamespace")]
// We can not use string interpolation, because for some reason
// it failes to compile in Powershell...
[SuppressMessage("ReSharper", "UseStringInterpolation")]
public static class DiaryMaker
{
    private const string TemplatePath = "template.md";

    public static void CreateNewEntryFromTemplate(string author, string bookName)
    {
        if (!File.Exists(TemplatePath))
        {
            throw new FileNotFoundException("Template not found.", TemplatePath);
        }

        author = author.Trim();
        bookName = bookName.Trim();

        string targetFileName = string.Format("{0}-{1}.md", author.RemoveDiacritism().Replace(' ', '_').ToLower(), bookName.RemoveDiacritism().Replace(' ', '_').ToLower());
        string templateContent = File.ReadAllText(TemplatePath);

        templateContent = templateContent.Replace(@"%author%", author);
        templateContent = templateContent.Replace(@"%book%", bookName);
        using (StreamWriter sw = File.CreateText(targetFileName))
        {
            sw.Write(templateContent);
        }
    }
    private static string RemoveDiacritism(this string text)
    {
        string stringFormD = text.Normalize(System.Text.NormalizationForm.FormD);
        System.Text.StringBuilder retVal = new System.Text.StringBuilder();
        foreach (char t in stringFormD)
        {
            if (System.Globalization.CharUnicodeInfo.GetUnicodeCategory(t) != System.Globalization.UnicodeCategory.NonSpacingMark)
                retVal.Append(t);
        }
        return retVal.ToString().Normalize(System.Text.NormalizationForm.FormC);
    }
}
"@;



Add-Type -TypeDefinition $source -Language CSharp

[DiaryMaker]::CreateNewEntryFromTemplate($author, $bookName);
