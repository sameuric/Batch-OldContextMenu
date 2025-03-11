Old right-click context menu for Windows 11 (v1.0)
==================================================

The new context menu of the file explorer in Windows 11 offers less options than the old legacy one in Windows 10. This repository contains a Batch script that brings back the old context menu of Windows 10 in Windows 11.

![Capture d’écran (15)](https://github.com/user-attachments/assets/cfbe6a99-9e34-4830-80d9-db199230ecce)


---
The script first checks if it is executing on Windows 11. Then, it edits a specific Windows registry key [see References section below] in order to get the old context menu back. To apply changes, the script restarts `explorer.exe`. During this restart, the Windows desktop might look buggy for a few seconds, then everything gets back to normal. I am open for any suggestion to avoid this buggy-looking behavior.

References
----------

Registry key values and commands in this script are based on:
- https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/reg-add
- https://learn.microsoft.com/en-us/answers/questions/610602/disable-windows-11-file-context-menu


Installation
------------

Make sure you are using this script on Windows 11 only.  
Copy the `script.bat` file on your computer, then double-click on it and follow instructions.

Future work
-----------

A few ideas to improve this project:
- Find a way to avoid the buggy-looking restart of `explorer.exe`.
- Make sure the script won't be executed on future version of Windows.

License
-------

This work is shared under the [MIT license](LICENSE).
