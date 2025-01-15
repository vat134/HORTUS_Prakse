table 80000 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; RichTextBlob; Blob)
        {
            DataClassification = CustomerContent;
            Description = 'Contains a rich text value';
        }
    }

    procedure GetRichText(): Text
    var
        InStream: Instream;
        TextValue: Text;
    begin
        Rec.CalcFields(Rec.RichTextBlob);
        Rec.RichTextBlob.CreateInStream(InStream);
        InStream.Read(TextValue);

        exit(TextValue);
    end;

    procedure SaveRichText(RichText: Text)
    var
        OutStream: OutStream;
    begin
        Rec.RichTextBlob.CreateOutStream(OutStream);
        OutStream.Write(RichText);
        Rec.Modify();
    end;
}