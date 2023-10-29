project "app"
kind "WindowedApp"
language "C++"
cppdialect "C++20"
staticruntime "on"

targetdir("bin/" .. outputdir .. "/%{prj.name}")
objdir("obj/" .. outputdir .. "/%{prj.name}")

files
{
	"src/**.h",
	"src/**.cpp",
	-- ImGUI files
	"vendor/imgui/*.h",
	"vendor/imgui/*.cpp",
	"vendor/imgui/backends/imgui_impl_glfw.*",
	"vendor/imgui/backends/imgui_impl_vulkan.*",
}
includedirs
{
  "%{VulkanSDK}/Include",
	"vendor/imgui",
	"vendor/glfw/include",
}
links
{
  "GLFW",
  "%{VulkanSDK}/Lib/vulkan-1.lib",
}

filter "system:windows"
systemversion "latest"
entrypoint "mainCRTStartup"
defines "CONF_WINDOWS"

links
{
	"User32.lib",
	"Gdi32.lib",
	"Shell32.lib",
}

filter "configurations:Debug"
defines "CONF_DEBUG"
runtime "Debug"
symbols "off"

filter "configurations:Release"
defines "CONF_RELEASE"
runtime "Release"
optimize "on"