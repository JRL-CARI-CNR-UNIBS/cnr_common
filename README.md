# cnr_common
List of commonly used utility libraries.

## Download
Download the submodules:
```bash 
git clone --recurse-submodules https://github.com/JRL-CARI-CNR-UNIBS/cnr_common.git
```
Keep the submodules update with:
```bash
git submodule update --init --recursive
```

## Install

1. Set the installation directory:
    ```bash
    export PATH_TO_INSTALL_FOLDER=path_to_your_ws/install
    ```

2. Compile and install `cnr_yaml`:
    ```bash
    mkdir -p build/cnr_yaml
    cmake -S cnr_yaml -B build/cnr_yaml -DCMAKE_INSTALL_PREFIX=$PATH_TO_INSTALL_FOLDER
    make -C build/cnr_yaml install
    ```

3. Compile and install `cnr_param`:
    ```bash
    mkdir -p build/cnr_param
    cmake -S cnr_param -B build/cnr_param -DCMAKE_INSTALL_PREFIX=$PATH_TO_INSTALL_FOLDER -DCOMPILE_MAPPED_FILE_MODULE=ON
    make -C build/cnr_param install
    ```

Note that `cnr_param` needs the environment variable `CNR_PARAM_ROOT_DIRECTORY` to be defined. For example, you can define it in the `~/.bashrc` file as follows:

```bash
export CNR_PARAM_ROOT_DIRECTORY="/tmp/cnr_param"
```
This is the folder used by `cnr_param` to save parameters. See the dedicated [GitHub page](https://github.com/CNR-STIIMA-IRAS/cnr_param) for more information.

4. Compile and install `cnr_logger`:
    ```bash
    mkdir -p build/cnr_logger
    cmake -S cnr_logger -B build/cnr_logger -DCMAKE_INSTALL_PREFIX=$PATH_TO_INSTALL_FOLDER -DUSE_ROS1=False -DCOMPILE_EXAMPLE=True -DENABLE_TESTING=True
    make -C build/cnr_logger install
    ```

5. Compile and install `cnr_class_loader`:
    ```bash
    mkdir -p build/cnr_class_loader
    cmake -S cnr_class_loader -B build/cnr_class_loader -DCMAKE_INSTALL_PREFIX=$PATH_TO_INSTALL_FOLDER
    make -C build/cnr_class_loader install
    ```

Add these lines to your `~.bashrc` file:
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
where `path_to_your_ws/install` is the path to the install folder. These are necessary to make the installed libraries visible.