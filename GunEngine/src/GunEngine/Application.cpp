#include "gepch.h"
#include "Application.h"
#include <GunEngine/Events/ApplicationEvent.h>
#include <GunEngine/Log.h>
namespace GunEngine {

	Application::Application()
	{
		
	}
	Application::~Application()
	{

	}


	void Application::Run() {
		WindowResizeEvent e(1280, 720);
		GE_TRACE(e);

		while (true);
	}
}