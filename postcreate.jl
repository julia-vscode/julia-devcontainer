#!/usr/local/julia/bin/julia

using Pkg

function has_manifest_file()
    return isfile(joinpath(pwd(),"Manifest.toml")) || isfile(joinpath(pwd(),"JuliaManifest.toml"))
end

function has_project_file()
    return isfile(joinpath(pwd(),"Project.toml")) || isfile(joinpath(pwd(),"JuliaProject.toml"))
end

function is_package()
    return has_project_file() && !has_manifest_file()
end

function is_app()
    return has_project_file() && has_manifest_file()
end

if is_app()
    Pkg.activate(pwd())
    Pkg.instantiate()    
elseif is_package()
    Pkg.develop(path=pwd())    
end
	