using HDF5
using PyPlot

"""
    Open files with the same parameters Q and T
    file1 = h5open("../data/potential/filename.hdf5","r")
    file2 = h5open("../data/potential/filename.hdf5","r")
    ...
    filen = h5open("../data/potential/filename.hdf5","r")
"""

filename = "gg2cQP"
potential = filename[end-1:end]

#    Particular example
file = h5open("../data/$potential/$filename.hdf5","r")
#file2 = h5open("../data/HO/8rleHO.hdf5","r")

l1 = read(file, "lyapexpsinitcond")
#l2 = read(file2, "lyapexpsinitcond")

#l = vcat(l1,l2)
l = l1


try
    mkdir("../plots")
end

fig = plt[:figure](figsize=(6,8))
fig[:subplots_adjust](hspace=.5)


ax = fig[:add_subplot](311)
ax[:set_xlabel](L"$\lambda_1$",fontsize="18")
#ax[:set_ylabel](L"$p$",fontsize="18")
ax[:hist](l[:,1])

ax = fig[:add_subplot](312)
ax[:set_xlabel](L"$\lambda_2$",fontsize="18")
#ax[:set_ylabel](L"$S$", fontsize="18")
ax[:hist](l[:,2])


ax = fig[:add_subplot](313)
ax[:set_xlabel](L"$\lambda_3$",fontsize="18")
#ax[:set_ylabel](L"$S$",fontsize="18")
ax[:hist](l[:,3])

plt[:savefig]("../plots/$filename.png")

println("Figure succesfully generated. See file  ../plots/$filename.png")
