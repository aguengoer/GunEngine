workspace "GunEngine"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "GunEngine"
	location "GunEngine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		
		defines{
			"GE_PLATFORM_WINDOWS",
			"GE_BUILD_DLL",
		}
		
		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox\"")
		}

	filter "configurations:Debug"
		defines "GE_DEBUG"
		runtime "Debug"
		symbols "On"
	filter "configurations:Release"
		defines "GE_RELEASE"
		runtime "Release"
		optimize "On"
	filter "configurations:Dist"
		defines "GE_DIST"
		runtime "Release"
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
		staticruntime "Off"
		systemversion "latest"
		
		defines{
			"GE_PLATFORM_WINDOWS"
		}
		
	
	filter "configurations:Debug"
		defines "GE_DEBUG"
		runtime "Debug"
		symbols "On"
	filter "configurations:Release"
		defines "GE_RELEASE"
		runtime "Release"
		optimize "On"
	filter "configurations:Dist"
		defines "GE_DIST"
		runtime "Release"
		optimize "On"	