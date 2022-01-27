import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

from pythondata_cpu_cv32e41p import version_str

setuptools.setup(
    name="pythondata-cpu-cv32e41p",
    version=version_str,
    author="LiteX Authors",
    author_email="litex@googlegroups.com",
    description="""\
Python module containing system_verilog files for CV32E41P cpu.""",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/litex-hub/pythondata-cpu-cv32e41p",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.5',
    zip_safe=False,
    packages=setuptools.find_packages(),
    package_data={
    	'cpu_cv32e41p': ['cpu_cv32e41p/system_verilog/**'],
    },
    include_package_data=True,
    project_urls={
        "Bug Tracker": "https://github.com/litex-hub/pythondata-cpu-cv32e41p/issues",
        "Source Code": "https://github.com/litex-hub/pythondata-cpu-cv32e41p",
    },
)
