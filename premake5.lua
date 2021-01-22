project "spdlog"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    staticruntime "On"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    files {
        "include/**.h",

        "src/**.cpp",
    }
    
    includedirs {
        "src",
        "include",
    }

    defines {
        "SPDLOG_COMPILED_LIB"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        optimize "Off"
        symbols "On"

    filter "configurations:Release"
        runtime "Debug"
        optimize "Speed"
        vectorextensions "AVX2"
        symbols "On"
        flags {
            "LinkTimeOptimization"
        }

    filter "configurations:Dist"
        runtime "Release"
        optimize "Speed"
        vectorextensions "AVX2"
        symbols "Off"
        flags {
            "LinkTimeOptimization",
            "FatalWarnings"
        }
