# After creating new project install reticulate
install.packages("reticulate")
install.packages("renv")
install.packages("yaml")


# Then install python (not sure if this step is neccesary)
reticulate::install_python(version = "3.9.13")

# Create and load a new environment with a specific version of python
reticulate::virtualenv_create("new-env", version = "3.9.13")
reticulate::use_virtualenv("new-env")

# Get the location of the python executable (does this work on unix based OSes?)
py_loc <- reticulate::py_exe()

# Tell renv to use the executable located in the environment
renv::use_python(py_loc)

# Install packages in this environment
reticulate::py_install("gapminder", pip = T)
reticulate::py_install("markdownTable", pip = T)
reticulate::py_install("jupyter", pip = T)

# Record changes to the R and Python enviroments
renv::snapshot()
