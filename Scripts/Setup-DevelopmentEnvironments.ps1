pnpm env use --global lts
pnpm add --global prettier cspell yarn
flutter doctor --android-licenses
conda config --set channel_priority strict
conda update --all -y
conda create --name dev python
New-Item "~\.ssh" -ItemType "Directory"
ssh-keygen -t ed25519 -f "$Home\.ssh\id_ed25519" -N ""
Copy-item "..\Configurations\.gitconfig" "~" -Force
Copy-item "..\Configurations\.prettierrc.yaml" "~" -Force
