import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/openhwgroup/cv32e41p"

# Module version
version_str = "0.0.post1858"
version_tuple = (0, 0, 1858)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1858")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1734"
data_version_tuple = (0, 0, 1734)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1734")
except ImportError:
    pass
data_git_hash = "4b6befd76b09ffd3294d5936b276891682b19c2e"
data_git_describe = "v0.0-1734-g4b6befd"
data_git_msg = """\
commit 4b6befd76b09ffd3294d5936b276891682b19c2e
Merge: f0353ff 188e8a5
Author: Pasquale Davide Schiavone <davide@openhwgroup.org>
Date:   Wed Feb 9 18:41:31 2022 +0100

    Merge pull request #15 from abukharmeh/master
    
    1) Update the assertions and tracer ifdefs

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
