module RIOPA

import MPI

function __init__()
    # - Initialize here instead of main so that the MPI context can be available
    # for tests.
    # - Conditional allows for case when external users (or tests) have already
    # initialized an MPI context.
    if !MPI.Initialized()
        MPI.Init()
    end
end

include(joinpath("helper", "Ratios.jl"))

include(joinpath("core", "Config.jl"))
include(joinpath("core", "Args.jl"))
include(joinpath("core", "DataSet.jl"))
include(joinpath("core", "datagen", "DataGen.jl"))
include(joinpath("core", "io", "IO.jl"))
include(joinpath("core", "Ctrl.jl"))

include(joinpath("core", "io", "HDF5IOBackend.jl"))

# include(joinpath("hello", "adios2.jl"))
include(joinpath("hello", "hdf5.jl"))
include(joinpath("hello", "hello.jl"))

end
