# You can generate something like this using xdg-ninja
let
  XDG_CONFIG_HOME = "$HOME/.config";
  XDG_CACHE_HOME = "$HOME/.cache";
  XDG_DATA_HOME = "$HOME/.local/share";
  XDG_STATE_HOME = "$HOME/.local/state";
  XDG_BIN_HOME = "$HOME/.local/bin";
  XDG_RUNTIME_DIR = "/run/user/$UID";
in
{
  simple = {
    dataHome = XDG_DATA_HOME;
    configHome = XDG_CONFIG_HOME;
    cacheHome = XDG_CACHE_HOME;
  };

  # global env
  global = {
    inherit
      XDG_CONFIG_HOME
      XDG_CACHE_HOME
      XDG_DATA_HOME
      XDG_STATE_HOME
      XDG_BIN_HOME
      XDG_RUNTIME_DIR
      ;
    PATH = [ "$bin" ];
  };

  user =
    xdg:
    let
      data = xdg.dataHome;
      config = xdg.configHome;
      cache = xdg.cacheHome;
    in
    {
      # desktop
      XCOMPOSECACHE = "${cache}/X11/xcompose";
      ERRFILE = "${cache}/X11/xsession-errors";
      WINEPREFIX = "${data}/wine";

      # programs
      GNUPGHOME = "${data}/gnupg";
      LESSHISTFILE = "${data}/less/history";
      INPUTRC = "${config}/readline/inputrc";
      MPLAYER_HOME = "${config}/mplayer";

      # programming
      IPYTHONDIR = "${config}/ipython";
      JUPYTER_CONFIG_DIR = "${config}/jupyter";
    };

  pythonrc.text = ''
    import os
    import atexit
    import readline
    from pathlib import Path

    if readline.get_current_history_length() == 0:

        state_home = os.environ.get("state")
        if state_home is None:
            state_home = Path.home() / ".local" / "state"
        else:
            state_home = Path(state_home)

        history_path = state_home / "python_history"
        if history_path.is_dir():
            raise OSError(f"'{history_path}' cannot be a directory")

        history = str(history_path)

        try:
            readline.read_history_file(history)
        except OSError: # Non existent
            pass

        def write_history():
            try:
                readline.write_history_file(history)
            except OSError:
                pass

        atexit.register(write_history)
  '';
}
