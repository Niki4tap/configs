{lib, ...}:

{
    mkOptIn = with lib; description: mkOption {
        inherit description;
        type = types.bool;
        default = false;
        example = true;
    };
    mkOptOut = with lib; description: mkOption {
        inherit description;
        type = types.bool;
        default = true;
        example = false;
    };
}