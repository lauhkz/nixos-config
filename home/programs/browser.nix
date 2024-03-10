{
  pkgs,
  config,
  ...
}: {
  programs = {

    chromium = {
      enable = true;
      extensions = [
       { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # Ublock Origin
      ];
    };

    firefox = {
      enable = true;
      profiles.lauhkz = {
        isDefault = true;
        search.default = "DuckDuckGo";
        settings = {
          "ui.key.accelKef" = 91;                 # Rebind ctrl to super (would interfere with tridactyl otherwise)

          # Remove the alt menu
          "ui.key.menuAccessKeyFocuses" = false;

          # Remove the fullscreen pop up
          "full-screen-api.warning.timeout" = 0;

          # Keep the reader button enabled all times
          "reader.parse-on-load.force-enabled" = true;

          # Actual settings
          "app.update.auto" = false;
          "browser.startup.homepage" = "https://www.theodinproject.com/dashboard | https://music.youtube.com/playlist?list=RDTMAK5uy_l3TXw3uC_sIHl4m6RMGqCyKKd2D2_pv28";
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.contentblocking.category" = "strict";
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.protections_panel.infoMessage.seen" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.urlbar.placeHoderName" = "DuckDuckGo";
          "datareporting.policy.dataSubmissionEnable" = false;
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;
          "extensions.getAddons.showPane" = false;
          "extensions.pocket.enabled" = false;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
        };
        bookmarks = [
          {
            name = "Habitify";
            toolbar = true;
          }
          {
            name = "Whatsapp";
            toolbar = true;
            bookmarks = [
              {
                name = "whp";
                tags = [ "messages" ];
                keyword = "msg";
                url = "https://web.whatsapp.com";
              }
            ];
          }
        ];
      };
    };
  };
}
