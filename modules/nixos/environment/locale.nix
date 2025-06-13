{ lib, config, ... }:
{
  time = {
    timeZone = if config.grimoire.profiles.server.enable then "UTC" else "America/Los_Angeles";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8/UTF-8";

    extraLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
    ];
  };
}
