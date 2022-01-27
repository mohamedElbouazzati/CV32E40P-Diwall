import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/openhwgroup/cv32e41p"

# Module version
version_str = "0.0.post1856"
version_tuple = (0, 0, 1856)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1856")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1732"
data_version_tuple = (0, 0, 1732)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1732")
except ImportError:
    pass
data_git_hash = "f0353ff7c0e7e9072b340eda9c6bc09477403867"
data_git_describe = "v0.0-1732-gf0353ff"
data_git_msg = """\
commit f0353ff7c0e7e9072b340eda9c6bc09477403867
Author: Pasquale Davide Schiavone <davide@openhwgroup.org>
Date:   Tue Aug 31 17:15:06 2021 +0200

    update README with correct link (#9)

"""

# Tool version info
tool_version_str = "0.0.post124"
tool_version_tuple = (0, 0, 124)
try:
    from packaging.version import Version as V
    ptool_version = V("0.0.post124")
except ImportError:
    pass


def data_file(f):
    """Get absolute path for file inside pythondata_cpu_cv32e41p."""
    fn = os.path.join(data_location, f)
    fn = os.path.abspath(fn)
    if not os.path.exists(fn):
        raise IOError("File {f} doesn't exist in pythondata_cpu_cv32e41p".format(f))
    return fn
