import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/openhwgroup/cv32e41p"

# Module version
version_str = "0.0.post1866"
version_tuple = (0, 0, 1866)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1866")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1740"
data_version_tuple = (0, 0, 1740)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1740")
except ImportError:
    pass
data_git_hash = "f1d53463befa1ab91c8b00ba537d2e0f09ab9882"
data_git_describe = "v0.0-1740-gf1d5346"
data_git_msg = """\
commit f1d53463befa1ab91c8b00ba537d2e0f09ab9882
Author: Ibrahim Abu Kharmeh <ibrahim.abu.kharmeh@huawei.com>
Date:   Wed Mar 23 08:31:01 2022 +0000

    Complete merging the decoder (#22)

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
