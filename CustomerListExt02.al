pageextension 50120 CustomerListExt extends "Customer List"
{
    actions
    {
        addafter(ApplyTemplate)
        {
            action("Item list - Test01")
            {
                ApplicationArea = All;
                Caption = 'Item list - Test01';
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    OpenSpecifiedView('aa49406f-6f68-4565-b857-496faa0e77aa_Test0112223', Page::"Item List");
                end;
            }
            action("Item list - Test02")
            {
                ApplicationArea = All;
                Caption = 'Item list - Test02';
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    OpenSpecifiedView('aa49406f-6f68-4565-b857-496faa0e77aa_Test0221625', Page::"Item List");
                end;
            }
            action("Item list - ZYTest")
            {
                ApplicationArea = All;
                Caption = 'Item list - ZYTest';
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    OpenSpecifiedView('aa49406f-6f68-4565-b857-496faa0e77aa_ZYTest00045', Page::"Item List");
                end;
            }
            action("Customer Ledger Entries - Invoice")
            {
                ApplicationArea = All;
                Caption = 'Customer Ledger Entries - Invoice';
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    OpenSpecifiedView('aa49406f-6f68-4565-b857-496faa0e77aa_Invoice07400', Page::"Customer Ledger Entries");
                end;
            }
        }
    }

    local procedure OpenSpecifiedView(ViewID: Text; PageID: Integer)
    var
        DefaultView: Text;
        URL: Text;
        ZYHyperLink: Page "ZY HyperLink";
    begin
        DefaultView := '&view=' + ViewID;
        URL := GetUrl(CurrentClientType, CompanyName, ObjectType::Page, PageID) + DefaultView;
        ZYHyperLink.SetURL(URL);
        ZYHyperLink.Run();
    end;
}

page 50111 "ZY HyperLink"
{
    Extensible = false;
    Caption = 'HyperLink';
    Editable = false;
    PageType = Card;

    layout
    {
        area(content)
        {
            group(Control5)
            {
                ShowCaption = false;
            }
            usercontrol(WebPageViewer; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
            {
                ApplicationArea = All;

                trigger ControlAddInReady(callbackUrl: Text)
                begin
                    CurrPage.WebPageViewer.Navigate(URL);
                end;

                trigger Callback(data: Text)
                begin
                    CurrPage.Close();
                end;
            }
        }
    }

    var
        URL: Text;

    procedure SetURL(NavigateToURL: Text)
    begin
        URL := NavigateToURL;
    end;
}
