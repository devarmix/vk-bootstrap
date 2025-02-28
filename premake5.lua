project "VK-Bootstrap"
    location "%{wks.location}/SpikeEngine/vendor/vk-bootstrap"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp"
	}

	includedirs
	{
		"%{IncludeDir.VULKAN_SDK}"
	}

	filter("system:windows")
		systemversion "latest"

	filter "configurations:Debug"
		defines "HR_DEBUG"
		symbols "on"

	filter "configurations:Release"
		defines "HR_RELEASE"
		optimize "on"