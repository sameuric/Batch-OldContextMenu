OLD RIGHT-CLICK CONTEXT MENU FOR WINDOWS 11 (v1.0)
==================================================

The new context menu of the file explorer in Windows 11 offers less options than the old legacy one in Windows 10. This repository contains a Batch script that brings back the old context menu of Windows 10 in Windows 11.

![cap1](https://github.com/user-attachments/assets/108e2265-f0d8-4c14-869d-9bf198b01a52)    ![cap2](https://github.com/user-attachments/assets/55711290-6bfe-4977-9a12-8ae968b566c3)


References
----------

Registry key values and commands in this script are based on:
- https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/reg-add
- https://learn.microsoft.com/en-us/answers/questions/610602/disable-windows-11-file-context-menu


Usage and installation
----------------------

Make sure you are using this script on Windows 11 only.  
Copy the `script.bat` file on your computer.


Entropy in cybersecurity
------------------------

In the cybersecurity field, entropy can be used to detect potential malware trying to hide themselves from antivirus solutions. Encrypted or obfuscated malware files have high entropy values due to their random looking-like code. Because high-entropy files are not necessarily malware, they might be flagged as suspicious until deeper investigation is conducted.

More information on this topic can be [found here](https://umbrella.cisco.com/blog/using-entropy-to-spot-the-malware-hiding-in-plain-sight).

Future work
-----------

A few ideas to improve this project:
- Add extra explanations on entropy's definition in a separate window.
- Make sure the program works with files bigger than 1 Gb.
- Benchmark the program against another implementation in a high-level language.

License
-------

This work is shared under the [MIT license](LICENSE).  
The program's icon has been taken from the examples codes installed with the MASM32 SDK.
