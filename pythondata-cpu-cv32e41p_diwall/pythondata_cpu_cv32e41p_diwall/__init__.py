import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/openhwgroup/cv32e41p"

# Module version
version_str = "0.0.post1862"
version_tuple = (0, 0, 1862)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1862")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1736"
data_version_tuple = (0, 0, 1736)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1736")
except ImportError:
    pass
data_git_hash = "cf0ab06e28a7845d0ce736b44a27d1bfab47074a"
data_git_describe = "v0.0-1736-gcf0ab06"
data_git_msg = """\
commit cf0ab06e28a7845d0ce736b44a27d1bfab47074a
Author: Ibrahim Abu Kharmeh <ibrahim.abu.kharmeh@huawei.com>
Date:   Thu Feb 17 12:03:11 2022 +0000

    Merged decoder (#17)
    
    * Merge the decoder and adds Zce parameters
    
    * Update flist
    
    * Trimp trailing spaces and remove redundant comments
    
    * Run Verible on all SV files
    
    * Remove redndant comments and update march id
    
    * Rerun verible on all files

"""

# Tool version info
tool_version_str = "0.0.post126"
tool_version_tuple = (0, 0, 126)
try:
    from packaging.version import Version as V
    ptool_version = V("0.0.post126")
except ImportError:
    pass


def data_file(f):
    """Get absolute path for file inside pythondata_cpu_cv32e41p."""
    fn = os.path.join(data_location, f)
    fn = os.path.abspath(fn)
    if not os.path.exists(fn):
        raise IOError("File {f} doesn't exist in pythondata_cpu_cv32e41p".format(f))
    return fn
