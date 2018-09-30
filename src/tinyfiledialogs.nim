## TinyFileDialogs Nim
## ===================
##
## TinyFileDialogs wrapper for Nim.
##
## Cross-platform InputBox, PasswordBox, MessageBox, OpenFileDialog, SaveFileDialog, SelectFolderDialog.
## Native dialogs for Windows, Mac, OSX, GTK+, Qt, Console.
## SSH supported via automatic switch to console mode or X11 forwarding.
##
## Widgets:
## --------
##
## - Beep Sound.
## - Notify popup.
## - Message Dialog.
## - Question Dialog.
## - Input Dialog.
## - Password Dialog.
## - Save file Dialog.
## - Open file Dialog.
## - Select folder Dialog.
##
## API
## ---
##
## - ``aDialogType`` must be one of ``"ok"``, ``"okcancel"``, ``"yesno"``, ``"yesnocancel"``, ``string`` type.
## - ``aIconType`` must be one of ``"info"``, ``"warning"``, ``"error"``, ``"question"``, ``string`` type.
## - ``aDefaultButton`` must be one of ``0`` (for Cancel), ``1`` (for Ok), ``2`` (for No), ``range[0..2]`` type.
## - ``aDefaultInput`` must be ``nil`` (for Password entry field) or any string for plain text entry field with a default value, ``string`` or ``nil`` type.
## - ``aAllowMultipleSelects`` must be ``0`` (false) or ``1`` (true), multiple selection returns 1 ``string`` with paths divided by ``|``, ``int`` type.
# All Credit for TinyFileDialogs lib goes to TinyFileDialogs Authors. This is just a tiny wrapper. Feel free to use your own "tinyfiledialogs.c" too.

{.compile: "tinyfiledialogs.c".}

proc tinyfd_beep*(): void {.importc.}

proc tinyfd_notifyPopup*(aTitle: cstring, aMessage: cstring, aDialogType: cstring, aIconType: cstring, aDefaultButton: range[0..2]): cint {.importc.}

proc tinyfd_messageBox*(aTitle: cstring, aMessage: cstring, aDialogType: cstring, aIconType: cstring, aDefaultButton: range[0..2]): cint {.importc.}

proc tinyfd_inputBox*(aTitle: cstring, aMessage: cstring, aDefaultInput: cstring = nil): cstring {.importc.}

proc tinyfd_openFileDialog*(aTitle: cstring, aDefaultPathAndFile: cstring, aNumOfFilterPatterns: cint = 0, aFilterPattern: cstring = "*.*", aSingleFilterDescription: cstring = "", aAllowMultipleSelects: range[0..1] = 0): cstring {.importc.}

proc tinyfd_saveFileDialog*(aTitle: cstring, aDefaultPathAndFile: cstring, aNumOfFilterPatterns: cint = 0, aFilterPatterns: cstring = "*.*", aSingleFilterDescription: cstring = "", aAllowMultipleSelects: range[0..1] = 0): cstring {.importc.}

proc tinyfd_selectFolderDialog*(aTitle: cstring, aDefaultPath: cstring): cstring {.importc.}


runnableExamples:
  tinyfd_beep()
  echo tinyfd_notifyPopup("Title", "aMessage", "yesnocancel", "info", 1)
  echo tinyfd_messageBox("Title", "aMessage", "yesnocancel", "info", 1)
  echo tinyfd_inputBox("a password box", "some message")               # Password.
  echo tinyfd_inputBox("plain text box", "some message", "any string") # Plain Text.
  echo tinyfd_openFileDialog("You can Open Files with this", "")
  echo tinyfd_saveFileDialog("You can Save Files with this", "")
  echo tinyfd_selectFolderDialog("You can Open Folders with this", "")
