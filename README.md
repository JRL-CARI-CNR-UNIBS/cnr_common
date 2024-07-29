# cnr_common
A collection of commonly used utility libraries.

## Download

To download the submodules, use the following command:
```bash 
git clone --recurse-submodules https://github.com/JRL-CARI-CNR-UNIBS/cnr_common.git
```

Keep the submodules up to date with:
```bash
cd cnr_common
git submodule update --init --recursive
. update_submodules.sh
```

## Install

Since these are common packages, it is recommended to compile the workspace without any other workspaces sourced. If you have a chained workspace setup, this should be the first one in the chain.

The package provides a `.sh` file to automate the process of compiling and installing all the packages. Navigate to the workspace folder where `cnr_common` is located and follow these instructions:

1. Copy and prepare the build script:
    ```bash
    cp cnr_common/build_template.sh build.sh && sed -i '1i PATH_TO_WS="$(pwd)"' build.sh
    ```

2. Run the build script:
    ```bash
    . build.sh
    ```

### Environment Configuration

Note that `cnr_param` requires the environment variable `CNR_PARAM_ROOT_DIRECTORY` to be defined. For example, you can define it in the `~/.bashrc` file as follows:

```bash
export CNR_PARAM_ROOT_DIRECTORY="/tmp/cnr_param"
```

This is the folder used by `cnr_param` to save parameters. See the dedicated [GitHub page](https://github.com/CNR-STIIMA-IRAS/cnr_param) for more information.

### Final Configuration

At the end of the process, add these lines to your `~/.bashrc` file to ensure the installed libraries are visible:

```bash
if [[ ":$PATH:" != *":path_to_your_ws/install/bin:"* ]]; then
    export PATH="path_to_your_ws/install/bin:$PATH"
fi
if [[ ":$LD_LIBRARY_PATH:" != *":path_to_your_ws/install/lib:"* ]]; then
    export LD_LIBRARY_PATH="path_to_your_ws/install/lib:$LD_LIBRARY_PATH"
fi
if [[ ":$CMAKE_PREFIX_PATH:" != *":path_to_your_ws/install:"* ]]; then
    export CMAKE_PREFIX_PATH="path_to_your_ws/install:$CMAKE_PREFIX_PATH"
fi
```

Replace `path_to_your_ws/install` with the actual path to your install folder. These settings are necessary to make the installed libraries visible.
