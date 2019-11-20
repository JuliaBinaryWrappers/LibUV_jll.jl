# Autogenerated wrapper script for LibUV_jll for x86_64-unknown-freebsd11.1
export libuv

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libuv`
const libuv_splitpath = ["lib", "libuv.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libuv_path = ""

# libuv-specific global declaration
# This will be filled out by __init__()
libuv_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libuv = "libuv.so.2"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libuv_path = abspath(joinpath(artifact"LibUV", libuv_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libuv_handle = dlopen(libuv_path)
    push!(LIBPATH_list, dirname(libuv_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

