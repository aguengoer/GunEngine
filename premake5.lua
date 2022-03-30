workspace "GunEngine"
	architecture "x64"
	startproject "Sandbox"


	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "GunEngine/vendor/GLFW/include"
IncludeDir["Glad"] = "GunEngine/vendor/Glad/include"

include "GunEngine/vendor/GLFW"
include "GunEngine/vendor/Glad"

group "Dependencies"
		include "GunEngine/vendor/GLFW"
		include "GunEngine/vendor/Glad"
group ""

project "GunEngine"
	location "GunEngine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "gepch.h"
	pchsource "GunEngine/src/gepch.cpp"

	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}"
	}

	links 
	{ 
		"GLFW",
		"Glad",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		
		defines{
			"GE_PLATFORM_WINDOWS",
			"GE_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
		
		postbuildcommands
		{
			 ("{MKDIR} ../bin/" .. outputdir .. "/Sandbox"),
             ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "GE_DEBUG"
		buildoptions "/MDd"
		symbols "On"
	filter "configurations:Release"
		defines "GE_RELEASE"
		buildoptions "/MDd"
		optimize "On"
	filter "configurations:Dist"
		defines "GE_DIST"
		buildoptions "/MDd"
		optimize "On"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}
	
	includedirs
	{
		"GunEngine/vendor/spdlog/include",
		"GunEngine/src",
		"GunEngine/vendor"
	}
	
	links
	{
		"GunEngine"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		
		defines{
			"GE_PLATFORM_WINDOWS"
		}
		
	
	filter "configurations:Debug"
		defines "GE_DEBUG"
		buildoptions "/MDd"
		symbols "On"
	filter "configurations:Release"
		defines "GE_RELEASE"
		buildoptions "/MDd"
		optimize "On"
	filter "configurations:Dist"
		defines "GE_DIST"
		buildoptions "/MDd"
		optimize "On"	