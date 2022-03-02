import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/openhwgroup/cv32e41p"

# Module version
version_str = "0.0.post1863"
version_tuple = (0, 0, 1863)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1863")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1737"
data_version_tuple = (0, 0, 1737)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1737")
except ImportError:
    pass
data_git_hash = "43b04003bf9be75a6169a313243c7ea188c08d2e"
data_git_describe = "v0.0-1737-g43b0400"
data_git_msg = """\
commit 43b04003bf9be75a6169a313243c7ea188c08d2e
Author: Ibrahim Abu Kharmeh <ibrahim.abu.kharmeh@huawei.com>
Date:   Wed Mar 2 14:03:25 2022 +0000

    Adds simple ZCE instructions (#18)

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
