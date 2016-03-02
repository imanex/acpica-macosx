----
ACPICA-MacOSX
----
A build script for the ACPICA source tars/zips released by Intel.

----
What is ACPICA?
----
The ACPI Component Architecture (ACPICA) project provides an operating system (OS)-independent reference implementation of the Advanced Configuration and Power Interface Specification (ACPI). It can be easily adapted to execute under any host OS. The ACPICA code is meant to be directly integrated into the host OS as a kernel-resident subsystem. Hosting the ACPICA subsystem requires no changes to the core ACPICA code. Instead, a small OS-specific interface layer is written specifically for each host OS in order to interface the ACPICA code to the native OS services.<br>
<br>
The complexity of the ACPI specification leads to a lengthy and difficult implementation in operating system software. The primary purpose of the ACPI Component Architecture is to simplify ACPI implementations for operating system vendors (OSVs) by providing major portions of an ACPI implementation in OS-independent ACPI modules that can be easily integrated into any OS.

----
How to Use
----
Simple as fuck. Snag a copy of the required files using Git and run the script.</br>
</br>
You can run the script from your terminal specifying a download URL for the source tarball by typing:</br>
<code>git clone https://github.com/imanex/acpica-macosx/ --depth=1 -b master <br>.
./buildACPICA.sh [URL-Goes-Here]</code></br>
</br>
You can find the source pacages hosted on the ACPICA website hosted <a href='https://www.acpica.org/downloads/'>here</a>.</br>
<code>https://www.acpica.org/downloads/</code>

