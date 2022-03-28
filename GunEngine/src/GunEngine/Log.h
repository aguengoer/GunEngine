#pragma once
#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/fmt/ostr.h"



namespace GunEngine {
	class GE_ENGINE_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}


//Core Logger
#define GE_CORE_ERROR(...)   ::GunEngine::Log::GetCoreLogger()->error(__VA_ARGS__)
#define GE_CORE_WARN(...)    ::GunEngine::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define GE_CORE_INFO(...)    ::GunEngine::Log::GetCoreLogger()->info(__VA_ARGS__)
#define GE_CORE_TRACE(...)   ::GunEngine::Log::GetCoreLogger()->trace(__VA_ARGS__)

//Client Logger
#define GE_ERROR(...)        ::GunEngine::Log::GetClientLogger()->error(__VA_ARGS__)
#define GE_WARN(...)         ::GunEngine::Log::GetClientLogger()->warn(__VA_ARGS__)
#define GE_INFO(...)         ::GunEngine::Log::GetClientLogger()->info(__VA_ARGS__)
#define GE_TRACE(...)        ::GunEngine::Log::GetClientLogger()->trace(__VA_ARGS__)


