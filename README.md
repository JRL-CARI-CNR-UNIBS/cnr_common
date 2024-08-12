# cnr_common
A collection of commonly used utility libraries.

## Download

To download the submodules, first move to the workspace directory and create a `/src` folder:
```bash 
cd ~/path_to_your_ws
mkdir src
cd src
```

and then use the following command:
```bash 
git clone --recurse-submodules https://github.com/JRL-CARI-CNR-UNIBS/cnr_common.git
```

Keep the submodules up to date with:
```bash
cd ~/path_to_your_ws/src/cnr_common
git submodule update --init --recursive
. update_submodules.sh
```

## Install

Since these are common packages, it is recommended to compile the workspace without any other workspaces sourced. If you have a chained workspace setup, this should be the first one in the chain.

The package provides a `.sh` file to automate the process of compiling and installing all the packages. Navigate to the workspace folder where `cnr_common` is located (`~/path_to_your_ws`) and follow these instructions:

1. Copy and prepare the build script:
    ```bash
    cp src/cnr_common/build_template.sh build.sh && sed -i '1i PATH_TO_WS="$(pwd)"' build.sh
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
export CNR_COMMON_WS_INSTALL_FOLDER="$HOME/path_to_your_ws/install"

if [[ ":$PATH:" != *":$CNR_COMMON_WS_INSTALL_FOLDER/bin:"* ]]; then
    export PATH="$CNR_COMMON_WS_INSTALL_FOLDER/bin:$PATH"
fi
if [[ ":$LD_LIBRARY_PATH:" != *":$CNR_COMMON_WS_INSTALL_FOLDER/lib:"* ]]; then
    export LD_LIBRARY_PATH="$CNR_COMMON_WS_INSTALL_FOLDER/lib:$LD_LIBRARY_PATH"
fi
if [[ ":$CMAKE_PREFIX_PATH:" != *":$CNR_COMMON_WS_INSTALL_FOLDER:"* ]]; then
    export CMAKE_PREFIX_PATH="$CNR_COMMON_WS_INSTALL_FOLDER:$CMAKE_PREFIX_PATH"
fi
```

Assign to the variable `$CNR_COMMON_WS_INSTALL_FOLDER` the actual path to your install folder. These settings are necessary to make the installed libraries visible.