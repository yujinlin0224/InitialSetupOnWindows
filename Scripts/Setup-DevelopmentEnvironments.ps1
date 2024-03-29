pnpm env use --global lts
pnpm add --global prettier cspell yarn
flutter doctor --android-licenses
dart --disable-analytics
conda config --set channel_priority strict
conda update --all --yes
conda create --name dev --yes python
New-Item "~\.ssh" -ItemType "Directory"
ssh-keygen -t ed25519 -f "$Home\.ssh\id_ed25519" -N ""
Copy-item "$PSScriptRoot\..\Configurations\.gitconfig" "~" -Force
Copy-item "$PSScriptRoot\..\Configurations\.prettierrc.yaml" "~" -Force
