# ImGUI-app template

This is a template for creating an applications using:
- [C++ 20](https://en.cppreference.com/w/cpp/20)
- [ImGUI](https://github.com/ocornut/imgui)
- [GLFW (forked by TheCherno)](https://github.com/TheCherno/glfw)
- [Vulkan](https://www.vulkan.org/)

## Setup

- Download and install the [Vulkan SDK](https://vulkan.lunarg.com/sdk/homehttps://www.lunarg.com/vulkan-sdk/).
- Git clone this repository:
  ```bash	
  git clone git@github.com:Paracetamol56/imgui-app.git
  cd imgui-app
  # Initialize submodules
  git submodule update --init
  ```
- Build the project
  - For Windows (Visual Studio 2022):
    ```bash
    ./vendor/premake/premake5.exe vs2022
    ```
    Then open the generated solution file and build it.
  - For Linux (GNU Make):
    ```bash
    premake5 gmake2
    make
    ```
- Run the project

## Configuration

You can obviously change the project name. To do so, you need to rename the `app` directory, change the include path in the `premake5.lua` (line 18) file and the `%{prj.name}/premake5.lua` file (line 1).

## Troubleshooting

```txt
2>GLFW.lib(init.obj) : error LNK2019: unresolved external symbol __imp_realloc referenced in function defaultReallocate
2>GLFW.lib(input.obj) : error LNK2019: unresolved external symbol __imp_strcspn referenced in function glfwUpdateGamepadMappings
2>GLFW.lib(input.obj) : error LNK2019: unresolved external symbol __imp_strspn referenced in function glfwUpdateGamepadMappings
2>GLFW.lib(win32_monitor.obj) : error LNK2019: unresolved external symbol __imp_wcscpy referenced in function createMonitor
```
If you get this kind of error on Windows with Visual Studio, open project properties of GLFW, then 'C/C++' > 'Code Generation' > 'Runtime Library' and select 'Multi-threaded (/MT)' or 'Multi-threaded Debug (/MTd)' depending on your configuration.

