import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/openhwgroup/cv32e41p"

# Module version
version_str = "0.0.post1865"
version_tuple = (0, 0, 1865)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1865")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1739"
data_version_tuple = (0, 0, 1739)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1739")
except ImportError:
    pass
data_git_hash = "f22dca3090069089cf17eb3d16c90918b7157130"
data_git_describe = "v0.0-1739-gf22dca3"
data_git_msg = """\
commit f22dca3090069089cf17eb3d16c90918b7157130
Author: Ibrahim Abu Kharmeh <ibrahim.abu.kharmeh@huawei.com>
Date:   Mon Mar 7 16:20:15 2022 +0000

    Change PULP_ZFINX to ZFINX (#21)

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
