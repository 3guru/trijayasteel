codeunit 50000 "JA Get Item Pic"
{
    procedure "Pic as JSON"(ItemNo: Code[20]): Text;
    var
        Item: Record Item;
        TenantMedia: Record "Tenant Media";
        PicText: Text;
        PicInstr: InStream;
        JObject: JsonObject;
        JToken: JsonToken;
        TempBlob: Codeunit "Temp Blob";
        PicOStr: OutStream;
        Base64: Codeunit "Base64 Convert";
    begin
        Item.Get(ItemNo);
        If Item.Picture.Count = 0 then
            exit('');
        TenantMedia.Get(Item.Picture.Item(1));
        TenantMedia.CalcFields(Content);
        if TenantMedia.Content.HasValue then begin
            Clear(PicText);
            Clear(PicInstr);
            TenantMedia.Content.CreateInStream(PicInstr);
            PicText := Base64.ToBase64(PicInstr);
            JObject.Add('picture', PicText);
            JObject.SelectToken('picture', JToken);
        end;
        exit(JToken.AsValue().AsText());

    end;

    procedure "Cust Pic as JSON"(CustNo: Code[20]): Text;
    var
        Customer: Record Customer;
        TenantMedia: Record "Tenant Media";
        PicText: Text;
        PicInstr: InStream;
        JObject: JsonObject;
        JToken: JsonToken;
        TempBlob: Codeunit "Temp Blob";
        PicOStr: OutStream;
        Base64: Codeunit "Base64 Convert";
        GetGuid: Guid;
    begin
        Customer.get(CustNo);
        // Customer.CalcFields(Image);
        GetGuid := Customer.Image.MediaId;
        // If Customer.Image. = 0 then
        //     exit('');
        TenantMedia.Reset();
        TenantMedia.SetRange(ID, GetGuid);
        if TenantMedia.FindFirst() then begin
            TenantMedia.CalcFields(Content);
            if TenantMedia.Content.HasValue then begin
                Clear(PicText);
                Clear(PicInstr);
                TenantMedia.Content.CreateInStream(PicInstr);
                PicText := Base64.ToBase64(PicInstr);
                JObject.Add('picture', PicText);
                JObject.SelectToken('picture', JToken);
            end;
            exit(JToken.AsValue().AsText());
        end else begin
            exit('');
        end;
    end;
    // }
}