規格探討
--------
先簡單地列出整個規格。

輸入
----
輸入大概是一堆夾帶著資料夾的 YML 檔案吧。總之，表達出一種層次感。

你可以將層次整個表達在同一份 YML 檔案裡，但是， YML 文件編輯器通常沒有輔助線，若要從頭到尾寫完一份文件，記憶力要很好。所以，我想是以目錄階層搭配著 YML 內容的階層（就像 Java packages 的運用方式），會比較容易整理整個架構。

例如，我想要表達一個小表單，內容能表達一個手機號碼欄位。語言可能寫成這樣的句子：

```
internal:
  fields:
    - myCellNumber: cell_number
forms:
  - userRegistry: form
    - field(myCellNumber)
```

但當你想要有個整體系統感與區隔感時，會編排目錄結構：

```
system/internal/fields.yml
system/forms/userRegistry.yml
```

目錄的層次很好理解：如 `fields.yml` 檔案內容要列出一或多個欄位；而 `userRegistry.yml` 因為是放在目錄 `forms` 裡，必須是一個 `form` 。而二個 YML 檔案的內容應為：

```
# field.yml
- myCellNumber: cell_number
```

```
# userRegistry.yml
- field(myCellNumber)
```

處理
----
雖然以上語言是以 YML 標示，但是，在語言的運用上，要視為一種稱為 eeelang 的語言。（其實，目前是以 YML 為雛形工具。）

如上，
- `internal`， `fields` ， `forms` 是這個語言裡的保留字。
- `cell_number` 是內定的資料類型單元，搭配有如以下二個程式單元：
  - `validate_by(value, type(cell_number))` ：檢驗；
  - `format_by(value, type(cell_number), culture(zh-TW))` ：格式。
- 又
  - `type(_)` 是將字面轉譯為資料類型單元的內定程式單元；它會檢查輸入的文字是系統支援的資料類型；
  - `culture(_)` 是將字面轉譯為文化類型單元的內定程式單元；它會檢查輸入的文字是系統支援的文化類型。
- `field(_)` 是內定程式單元。

輸出
----
一套可以運作的系統。

系統的各部分零件化，並且整理為可根據語彙描述整個系統的組成；語彙的背後，有各部分零件以通用程式語言與編譯器加以支持。

前開的 eeelang 的程式，經過編譯並轉換為系統語彙；語彙由系統零件資訊支持。

eeelang 編譯器須早先接取系統的零件資訊，例如，系統零件資訊指定網站建置工具為 ASP.net Core ，則 eeelang 將表單程式轉換為 ASP.net MVC 程式，然後編譯為網站。
