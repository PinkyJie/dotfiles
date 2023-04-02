Remove osxfuse if installed via homebrew:
> brew uninstall osxfuse

Install osxfuse binary and choose to install the MacFUSE compatibility layer:
http://sourceforge.net/projects/osxfuse/files/latest/download?source=files

Reboot (optional but recommended by osxfuse)

Install ntfs-3g via homebrew:
> brew update && brew install ntfs-3g

Link mount_ntfs:
> sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.original
> sudo ln -s /usr/local/Cellar/ntfs-3g/2014.2.15/sbin/mount_ntfs /sbin/mount_ntfs

The output of the following should be as below:
> ls -l /sbin/mount_ntfs*
/sbin/mount_ntfs -> /usr/local/Cellar/ntfs-3g/2014.2.15/sbin/mount_ntfs
/sbin/mount_ntfs.original -> /System/Library/Filesystems/ntfs.fs/Contents/Resources/mount_ntfs

Reboot and voila
