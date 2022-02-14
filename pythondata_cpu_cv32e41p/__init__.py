import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/openhwgroup/cv32e41p"

# Module version
version_str = "0.0.post1861"
version_tuple = (0, 0, 1861)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1861")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1735"
data_version_tuple = (0, 0, 1735)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1735")
except ImportError:
    pass
data_git_hash = "d432b96f958db9145ffb5a8d80ecc2bd84d96f47"
data_git_describe = "v0.0-1735-gd432b96"
data_git_msg = """\
commit d432b96f958db9145ffb5a8d80ecc2bd84d96f47
Author: Ibrahim Abu Kharmeh <ibrahim.abu.kharmeh@huawei.com>
Date:   Mon Feb 14 16:56:26 2022 +0000

    Convert documentation to CV32E41P (#19)
    
    * Convert documentation to CV32E41P
    
    * Update links and Verible version
    
    * Add comments about the RTL status
    
    Co-authored-by: Tariq Kurd <tariq.kurd@huawei.com>

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
