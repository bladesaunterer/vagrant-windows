# Windows 10 Vagrant Box for ICs

Will set up a virtual machine with all the windows specific applications required for IC work
 * Rhapsody IDE 6.5+
 * Notepad++
 * SQL Server Management Studio
 * Git Bash
 * Chrome
 * Firefox
 * 7zip

Other features
 * Shared clipboard between VM and host machine
 * The repository directory on the host machine is shared with the C:\vagrant directory in the VM
 * Port forwarding pre-configured


### Prerequisites

Requires vagrant 2.2+
https://www.vagrantup.com/

Requires virtualbox 6.0 (6.1 not currently supported by vagrant)
https://www.virtualbox.org/wiki/Download_Old_Builds_6_0

Requires Rhapsody 6.5+
* Raise RM ticket for IDE download

### Installing

Clone this repository

```
git clone <repository>
```

Copy RhapsodyIDE.exe installer into the cloned repository 
NOTE: Make sure the filename is 'RhapsodyIDE.exe'

```
mv ~/Downloads/RhapsodyIDE.exe <working directory>/windows-10-box/RhapsodyIDE.exe
```

The directory should look as follows:
```
windows-10-box
├── README.md
├── RhapsodyIDE.exe
├── Vagrantfile
└── setup.ps1
```

Run vagrant up. This will start setting up the virtual machine. Please allow 3 hours for setup to complete (The first time running will take the longest as the Windows 10 image needs to be downladed, subsequent runs will be approx. 45 minutes). Once the vagrant command completes, the virtual machine will restart and continue setting up the applications with Powershell.

```
vagrant up
```

When prompted to do so within the VM, type in 'enter' and press the return key to complete the setup

```
enter
```




### Uninstalling

Run vagrant destroy from host machine

```
vagrant destroy
```

