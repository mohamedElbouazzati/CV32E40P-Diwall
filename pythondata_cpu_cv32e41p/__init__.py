import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/openhwgroup/cv32e41p"

# Module version
version_str = "0.0.post1864"
version_tuple = (0, 0, 1864)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1864")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1738"
data_version_tuple = (0, 0, 1738)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1738")
except ImportError:
    pass
data_git_hash = "61c9913dc41d0cbec57f8919e29ae294cd370187"
data_git_describe = "v0.0-1738-g61c9913"
data_git_msg = """\
commit 61c9913dc41d0cbec57f8919e29ae294cd370187
Author: Ibrahim Abu Kharmeh <ibrahim.abu.kharmeh@huawei.com>
Date:   Thu Mar 3 15:52:59 2022 +0000

    Fix lint warnings (#20)

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
