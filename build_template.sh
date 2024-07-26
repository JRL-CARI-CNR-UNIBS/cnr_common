cd $PATH_TO_WS/cnr_common
mkdir -p $PATH_TO_WS/build/cnr_yaml
cmake -S cnr_yaml -B $PATH_TO_WS/build/cnr_yaml -DCMAKE_INSTALL_PREFIX=$PATH_TO_WS/install
make -C $PATH_TO_WS/build/cnr_yaml install

mkdir -p $PATH_TO_WS/build/cnr_param
cmake -S cnr_param -B $PATH_TO_WS/build/cnr_param -DCMAKE_INSTALL_PREFIX=$PATH_TO_WS/install -DCOMPILE_MAPPED_FILE_MODULE=ON
make -C $PATH_TO_WS/build/cnr_param install

mkdir -p $PATH_TO_WS/build/cnr_logger
cmake -S cnr_logger -B $PATH_TO_WS/build/cnr_logger -DCMAKE_INSTALL_PREFIX=$PATH_TO_WS/install -DUSE_ROS1=False -DCOMPILE_EXAMPLE=True -DENABLE_TESTING=True
make -C $PATH_TO_WS/build/cnr_logger install

mkdir -p $PATH_TO_WS/build/cnr_class_loader
cmake -S cnr_class_loader -B $PATH_TO_WS/build/cnr_class_loader -DCMAKE_INSTALL_PREFIX=$PATH_TO_WS/install
make -C $PATH_TO_WS/build/cnr_class_loader install