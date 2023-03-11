# 安裝Windows後的初始設置

## 0. 安裝Windows前的準備

1. 備份位於硬碟中的應用程式資料到[Backups](Backups)資料夾，以管理員身分執行：
    - [Scripts/Backup-ProgramsData.ps1 <Primary|Secondary>](Scripts/Backup-ProgramsData.ps1)
        - 參數`Primary`：主要的資料，用於舊裝置
        - 參數`Secondary`：次要的資料，用於新裝置

2. 備份位於登錄檔案中的應用程式資料到[Backups](Backups)資料夾，有：
    - Bandizip
    - MPC-HC

3. 備份「Firefox」的擴充套件資料到[Backups](Backups)資料夾，有：
    - Authenticator（保險起見）
    - Enhancer for YouTube
    - Image Search Options
    - Simple Tab Groups（非必要）
    - Social Fixer for Facebook
    - Stylus
    - TWP - Translate Web Pages
    - Tampermonkey
    - User-Agent Switcher and Manager
    - uBlock Origin
    - 新同文堂

## 1. 基本的檢查與設置

1. 關閉「OneDrive」的同步與個人資料夾備份

2. 檢查「Windows Update」與「Microsoft Store」是否有更新，有的化更新並重新啟動電腦

3. 安裝驅動程式、螢幕色彩設定檔等

4. 安裝硬體供應廠商提供的應用程式，用「記事本」打開以下腳本並複製需要的行在「PowerShell」中執行：
    - [Scripts/Install-ProgramsFromHardwareProvider.ps1](Scripts/Install-ProgramsFromHardwareProvider.ps1)

5. （可選）執行系統調整腳本，以管理員身分執行：
    - [Scripts/Correct-FontOfCjkCharactersInShellDialog.ps1](Scripts/Correct-FontOfCjkCharactersInShellDialog.ps1)（修正傳統對話框中的CJK字元的字體）
    - [Scripts/Disable-IdlePowerStateOfNvidiaHdAudioDriver.ps1](Scripts/Disable-IdlePowerStateOfNvidiaHdAudioDriver.ps1)（禁用NVIDIA音效驅動的閒置電源模式）
    - [Scripts/Make-MouseScrollingNaturally.ps1](Scripts/Make-MouseScrollingNaturally.ps1)（讓所有滑鼠使用自然的方式滾動）
    - [Scripts/Remove-LibrariesInFileExplorer.ps1](Scripts/Remove-LibrariesInFileExplorer.ps1)（移除檔案總管中的媒體庫）

6. 確保Windows授權有啟用
    - [國立東華大學KMS工具](https://software.ndhu.edu.tw/NDHU_KMS.exe)（選用）

7. 設置「檔案總管」、「設定」與「Windows 安全性」的選項

    :::info

    - 設置切換輸入法的快速鍵
        1. 執行`rundll32 Shell32.dll,Control_RunDLL input.dll,,{C07337D3-DB2C-4D0B-9A93-B722A6C106E2}{HOTKEYS}`指令，打開「文字服務和輸入語言」視窗
        2. 在「進階按鍵組合」分頁中設置以下快速鍵：
            | 動作 | 按鍵順序 |
            | :- | :-: |
            | 切換輸入語言 | （無） |
            | 切換到中文（繁體，台灣）—微軟注音 | Left Alt + Shift + 1 |
            | 切換到日本（日本）—微軟輸入法 | Left Alt + Shift + 2 |
            | 切換到英文（美國）—US | Left Alt + Shift + 0 |
        3. 按下「確定」按鈕
        4. 執行 `control intl.cpl` 指令，打開「地區」視窗
        5. 在「系統管理」分頁中按下「複製設定」按鈕，打開「歡迎畫面及新的使用者帳戶設定」視窗
        6. 勾選所有「將目前設定複製到：」下的選項後，按下「確定」按鈕

    - 禁用驅動程式的自動更新
        7. 執行 `SystemPropertiesHardware` 指令，打開「系統內容」視窗
        8. 在「硬體」分頁中按下「裝置安裝設定」按鈕，打開「裝置安裝設定」視窗
        9. 選擇「否（您的裝置可能無法如預期般運作）」後，按下「儲存變更」按鈕

    :::

8. 設置個人資料夾的位置

9. 重新啟動電腦

## 2. 安裝與移除內建的應用程式與功能

1. （可選）如果Windows是Home版本，安裝Pro有但在Home缺失的元件，以管理員身分執行：
    - [Scripts/Install-MissingPackagesInWindowsHome.ps1](Scripts/Install-MissingPackagesInWindowsHome.ps1)

2. 移除預裝的應用程式，以管理員身分執行：
    - [Scripts/Remove-PreinstalledPrograms.ps1](Scripts/Remove-PreinstalledPrograms.ps1)

3. 移除預裝的選用功能，以管理員身分執行：
    - [Scripts/Remove-PreinstalledFeatures.ps1](Scripts/Remove-PreinstalledFeatures.ps1)

4. 關閉已經預先開啟的Windows選用功能，以管理員身分執行：
    - [Scripts/Disable-WindowsOptionalFeatures.ps1](Scripts/Disable-WindowsOptionalFeatures.ps1)

5. 開啟沒有預先開啟的Windows選用功能，以管理員身分執行：
    - [Scripts/Enable-WindowsOptionalFeatures.ps1](Scripts/Enable-WindowsOptionalFeatures.ps1)

6. 重新啟動電腦

## 3. 安裝並設置終端機環境

1. 安裝與終端機相關的應用程式，以管理員身分執行：
    - [Scripts/Install-ProgramsRelatedToTerminal.ps1](Scripts/Install-ProgramsRelatedToTerminal.ps1)

    :::info

    安裝「clink」時，取消勾選「Autorun when cmd.exe starts」選項即可，其他維持

    :::

2. 安裝殼層描述檔，執行：
    - [ShellProfiles/install_windows.bat](ShellProfiles/install_windows.bat)

3. 重新啟動終端機

## 4. 下載並安裝字體

1. 下載常用的字體，執行：
    - [Scripts/Download-FontsCommonlyUsed.ps1](Scripts/Download-FontsCommonlyUsed.ps1)

2. 到「下載\Fonts」資料夾中，全選所有字體檔案並選擇右鍵選單中的「安裝」，將字體安裝到當前使用者的字體資料夾中

## 5. 還原應用程式的備份資料

1. 從[Backups](Backups)資料夾還原位於硬碟中的應用程式資料，以管理員身分執行：
    - [Scripts/Restore-ProgramsData.ps1](Scripts/Backup-ProgramsData.ps1)

2. 匯入[Backups](Backups)資料夾中的登錄檔檔案以還原位於登錄檔中的應用程式資料，有：
    - Bandizip
    - MPC-HC

## 6. 安裝主要使用的應用程式

1. 安裝主要使用的應用程式，以管理員身分執行：
    - [Scripts/Install-ProgramsMainlyUsed.ps1](Scripts/Install-ProgramsMainlyUsed.ps1)

2. 設置主要使用的應用程式以及「Microsoft Edge」

    :::info

    - 檢查「Firefox」在登入帳號並同步之後，歷史紀錄以及擴充套件是否遺失

        :::spoiler 擴充套件列表

        - [Absolute Enable Right Click & Copy](https://addons.mozilla.org/zh-TW/firefox/addon/absolute-enable-right-click/)
        - [Add to Buyee](https://addons.mozilla.org/zh-TW/firefox/addon/add-to-buyee/)
        - [Authenticator](https://addons.mozilla.org/zh-TW/firefox/addon/auth-helper/)
        - [BigGo歷史價格 購物幫手](https://addons.mozilla.org/zh-TW/firefox/addon/biggo%E6%AF%94%E5%80%8B%E5%A4%A0%E5%B0%8F%E5%B9%AB%E6%89%8B/)
        - [Bitwarden – 免費密碼管理工具](https://addons.mozilla.org/zh-TW/firefox/addon/bitwarden-password-manager/)
        - [Copy Selected Tabs to Clipboard](https://addons.mozilla.org/zh-TW/firefox/addon/copy-selected-tabs-to-clipboar/)
        - [Distill Web Monitor](https://addons.mozilla.org/zh-TW/firefox/addon/distill-web-monitor-ff/)
        - [DownThemAll!](https://addons.mozilla.org/zh-TW/firefox/addon/downthemall/)
        - [Enhancer for YouTube](https://addons.mozilla.org/zh-TW/firefox/addon/enhancer-for-youtube/)
        - [Tracking & Ad Removal on Facebook](https://addons.mozilla.org/zh-TW/firefox/addon/facebook-tracking-removal/)
        - [Flagfox](https://addons.mozilla.org/zh-TW/firefox/addon/flagfox/)
        - [File Icon for GitHub and GitLab](https://addons.mozilla.org/zh-TW/firefox/addon/github-file-icons/)
        - [Image Search Options](https://addons.mozilla.org/zh-TW/firefox/addon/image-search-options/)
        - [新同文堂](https://addons.mozilla.org/zh-TW/firefox/addon/new_tongwentang/)
        - [Open Multiple URLs](https://addons.mozilla.org/zh-TW/firefox/addon/open-multiple-urls/)
        - [Refined GitHub](https://addons.mozilla.org/zh-TW/firefox/addon/refined-github-/)
        - [Return YouTube Dislike](https://addons.mozilla.org/zh-TW/firefox/addon/return-youtube-dislikes/)
        - [Simple Tab Groups](https://addons.mozilla.org/zh-TW/firefox/addon/simple-tab-groups/)
        - [Social Fixer](https://addons.mozilla.org/zh-TW/firefox/addon/socialfixer/)
        - [SponsorBlock - Skip Sponsorships on YouTube](https://addons.mozilla.org/zh-TW/firefox/addon/sponsorblock/)
        - [SteamDB](https://addons.mozilla.org/zh-TW/firefox/addon/steam-database/)
        - [Stylus](https://addons.mozilla.org/zh-TW/firefox/addon/styl-us/)
        - [Surfshark VPN Proxy](https://addons.mozilla.org/zh-TW/firefox/addon/surfshark-vpn-proxy/)
        - [Tampermonkey](https://addons.mozilla.org/zh-TW/firefox/addon/tampermonkey/)
        - [TWP - Translate Web Pages](https://addons.mozilla.org/zh-TW/firefox/addon/traduzir-paginas-web/)
        - [uBlock Origin](https://addons.mozilla.org/zh-TW/firefox/addon/ublock-origin/)
        - [Unblock Youku](https://addons.mozilla.org/zh-TW/firefox/addon/unblock-youku-firefox/)
        - [User-Agent Switcher and Manager](https://addons.mozilla.org/zh-TW/firefox/addon/user-agent-string-switcher/)
        - [View Image](https://addons.mozilla.org/zh-TW/firefox/addon/view-image/)
        - [Web Archives](https://addons.mozilla.org/zh-TW/firefox/addon/view-page-archive/)
        - [Vue.js devtools](https://addons.mozilla.org/zh-TW/firefox/addon/vue-js-devtools/)

        :::

    - 檢查「Firefox」的擴充套件的設置是否有正確同步，並將以下擴充套件手動匯入備份：
        - Authenticator（如果沒有同步）
        - Enhancer for YouTube
        - Image Search Options
        - Simple Tab Groups（非必要）
        - Social Fixer for Facebook
        - Stylus
        - TWP - Translate Web Pages
        - Tampermonkey
        - User-Agent Switcher and Manager
        - uBlock Origin
        - 新同文堂

    - 設置「Microsoft Edge」的實驗性功能
        1. 進入「[edge://flags](edge://flags)」頁面
        2. 將下列旗標的選項設置為「Enabled」
            - `#edge-visual-rejuv-mica`
            - `#edge-visual-rejuv-mica`
            - `#edge-overlay-scrollbars-win-style`
            - `#edge-visual-rejuv-materials-menu`

    - 在「Microsoft Edge」中安裝以下網站應用程式：
        - Chrome Remote Desktop：<https://remotedesktop.google.com/>
        - PowerPanel Business Local：<http://localhost:3052/>
        - Spotify Release List：<https://spotifyreleaselist.netlify.app/>
        - アイドルマスター シャイニーカラーズ：<https://shinycolors.enza.fun/>
    :::

3. 到「設定」的「應用程式 → 預設應用程式」，將安裝好的應用程式按表格順序設為預設的打開方式

    | 項目 | 預設應用程式 |
    | :-: | :- |
    | 網頁瀏覽器 | Firefox Developer Edition |
    | 文字編輯器 | Notepad++ |
    | 圖片瀏覽器 | XnView MP |
    | 音樂播放器 | foobar2000 |
    | 影片播放器 | MPC-HC |
    | 壓縮檔管理器 | Bandizip |
    | 電子郵件客戶端 | Outlook For Windows |
    | PDF檢視器 | Foxit PDF Reader |

## 6. 安裝Windows子系統

1. 安裝Windows子系統「Ubuntu」及「Android」發行版，執行：
    - [Scripts/Install-DistrosOfWindowsSubsystem.ps1](Scripts/Install-DistrosOfWindowsSubsystem.ps1)

2. 在Windows子系統的「Ubuntu」中，執行：

    ```sh
    sudo sed -i -e "s/# zh_TW.UTF-8 UTF-8/zh_TW.UTF-8 UTF-8/" /etc/locale.gen
    sudo dpkg-reconfigure --frontend=noninteractive locales
    sudo update-locale LANG=zh_TW.UTF-8

    sudo apt update
    sudo apt upgrade -y
    sudo apt install nala -y
    ```

3. 在Windows子系統的「Ubuntu」中，於檔案`/root/.bashrc`與`~/.bashrc`後面加入：

    ```sh
    apt() {
      command nala "$@"
    }

    sudo() {
      if [ "$1" = "apt" ]; then
        shift
        command sudo nala "$@"
      else
        command sudo "$@"
      fi
    }
    ```

4. 設置「Windows子系統Android版設定」的選項

## 7. 安裝並設置開發環境

1. 安裝開發環境，以管理員身分執行：
    - [Scripts/Install-ProgramsForDevelopment.ps1](Scripts/Install-ProgramsForDevelopment.ps1)

    :::info

    - 安裝「Visual Studio Code」時，將選項全部勾選
    - 安裝「Git」時，在「Select Components」除了「Add a Git Bash Profile to Windows Terminal」以外全部勾選，在「Choosing the SSH executable」選擇「Use external OpenSSH」選項

    :::

2. 重新啟動終端機

3. 開啟「Android Studio」進行初始化設置

4. 設置開發環境，執行：
    - [Scripts/Setup-DevelopmentEnvironments.ps1](Scripts/Setup-DevelopmentEnvironments.ps1)

5. 匯入個人PGP金鑰

## 8. 安裝應用程式

1. 安裝用於命令行的應用程式，以管理員身分執行：
    - [Scripts/Install-ProgramsInCommandLine.ps1](Scripts/Install-ProgramsInCommandLine.ps1)

2. 安裝可轉散發執行套件，以管理員身分執行：
    - [Scripts/Install-RedistributableRuntimes.ps1](Scripts/Install-RedistributableRuntimes.ps1)

3. 安裝Microsoft Office的應用程式，以管理員身分執行：
    - [Scripts/Install-ProgramsOfMicrosoftOffice.ps1](Scripts/Install-ProgramsOfMicrosoftOffice.ps1)

4. 安裝平常使用的應用程式，以管理員身分執行：
    - [Scripts/Install-ProgramsCommonlyUsed.ps1](Scripts/Install-Install-ProgramsCommonlyUsed.ps1)

5. （可選）安裝用於特定裝置的應用程式，以管理員身分執行：
    - [Scripts/Install-ProgramsForMainDevice.ps1](Scripts/Install-ProgramsForMainDevice.ps1)（僅限主要裝置）
    - [Scripts/Install-ProgramsForGamingDevice.ps1](Scripts/Install-ProgramsForGamingDevice.ps1)（僅限遊戲裝置）

6. （可選）安裝只有需要時才會安裝的應用程式，用「記事本」打開以下腳本並複製需要的行在「PowerShell」中執行：
    - [Scripts/Install-ProgramsSeldomUsed](Scripts/Install-ProgramsSeldomUsed)

7. 逐一開啟應用程式進行設置
