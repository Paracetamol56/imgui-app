workspace "ImGUI Application"
architecture "x64"
startproject "Application"

configurations
{
	"Debug",
	"Release"
}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
VulkanSDK = os.getenv("VULKAN_SDK")

group "Dependencies"
	include "app/vendor/glfw"
group ""

include "app"
