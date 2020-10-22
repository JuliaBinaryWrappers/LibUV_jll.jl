# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule LibUV_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("LibUV")
JLLWrappers.@generate_main_file("LibUV", UUID("183b4373-6708-53ba-ad28-60e28bb38547"))
end  # module LibUV_jll
