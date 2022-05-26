import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/openhwgroup/cv32e41p"

# Module version
version_str = "0.0.post1877"
version_tuple = (0, 0, 1877)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1877")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1741"
data_version_tuple = (0, 0, 1741)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1741")
except ImportError:
    pass
data_git_hash = "bda060eee5bfb22fdbe55029c5e3cf1b62724fff"
data_git_describe = "v0.0-1741-gbda060e"
data_git_msg = """\
commit bda060eee5bfb22fdbe55029c5e3cf1b62724fff
Author: Ibrahim Abu Kharmeh <ibrahim.abu.kharmeh@huawei.com>
Date:   Thu Apr 7 11:28:49 2022 +0100

    Remove PULP build status from README (#25)

"""

# Tool version info
tool_version_str = "0.0.post136"
tool_version_tuple = (0, 0, 136)
try:
    from packaging.version import Version as V
    ptool_version = V("0.0.post136")
except ImportError:
    pass


def data_file(f):
    """Get absolute path for file inside pythondata_cpu_cv32e41p."""
    fn = os.path.join(data_location, f)
    fn = os.path.abspath(fn)
    if not os.path.exists(fn):
        raise IOError("File {f} doesn't exist in pythondata_cpu_cv32e41p".format(f))
    return fn
