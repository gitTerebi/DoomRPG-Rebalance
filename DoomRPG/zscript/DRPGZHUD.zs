class DRPGZHUD : EventHandler
{
    private transient CVar multi_hud_x;
    private transient CVar multi_hud_y;
    
    private TextureID Tex[2];
    
    override void OnRegister()
    {
        multi_hud_x = CVar.FindCVar('drpg_multiplayer_x');
        multi_hud_y = CVar.FindCVar('drpg_multiplayer_y');
        
        static const string NAMES[] = {
            "MPFill", // Health
            "MPFill2" // Shield
        };
        
        for (int i = 0; i < NAMES.Size(); i++)
        {
            Tex[i] = TexMan.CheckForTexture(NAMES[i], TexMan.Type_Any);
        }
    }
    
    override void RenderUnderlay(RenderEvent e)
    {
        float scale = min(Screen.GetWidth() / 1920.0, Screen.GetHeight() / 1080.0);
        
        if (multiplayer)
        {
            int x = multi_hud_x.GetInt() / 1920.0 * Screen.GetWidth();
            int y = multi_hud_y.GetInt() / 1080.0 * Screen.GetHeight();
            int skip = 0;
            
            for (int i = 0; i < MAXPLAYERS; i++)
            {
                if (!playeringame[i])
                {
                    skip++;
                    continue;
                }
                
                int offset = (i - skip) * 45;
                
                Screen.DrawText(NewSmallFont, Font.CR_WHITE,
                    x / scale, y / scale + offset,
                    players[i].GetUserName(),
                    DTA_VirtualWidth, 1920,
                    DTA_VirtualHeight, 1080,
                    DTA_KeepRatio, true,
                    DTA_Color, Color(players[i].GetColor() | 0xFF000000));
                
                if (players[i].mo.Health >= 0)
                {
                    Screen.DrawTexture(Tex[0], false,
                        x, y + (20 + offset) * scale,
                        DTA_DestWidth, int(200 * min(float(players[i].mo.Health) / float(players[i].mo.GetMaxHealth()), 1.0) * scale),
                        DTA_DestHeight, int(20 * scale),
                        DTA_Alpha, 0.8);
                }
                
                int Cap, Shi;
                
                if (players[i].mo.FindInventory("DRPGShield"))
                {
                    Cap = ACS_NamedExecuteWithResult("GetPlayerShieldCapacity", i);
                    Shi = ACS_NamedExecuteWithResult("GetPlayerShieldCharge", i);
                }
                
                if (Shi > 0)
                {
                    Screen.DrawTexture(Tex[1], false,
                        x, y + (20 + offset) * scale,
                        DTA_DestWidth, int(200 * min(float(Shi) / float(Cap), 1.0) * scale),
                        DTA_DestHeight, int(20 * scale),
                        DTA_Alpha, 0.5);
                    
                    Screen.DrawText(NewSmallFont, Font.CR_LIGHTBLUE,
                        x / scale + 150, y / scale + offset,
                        Shi.."/"..Cap,
                        DTA_VirtualWidth, 1920,
                        DTA_VirtualHeight, 1080,
                        DTA_KeepRatio, true);
                }
                else
                {
                    Screen.DrawText(NewSmallFont, Font.CR_BRICK,
                        x / scale + 150, y / scale + offset,
                        players[i].mo.Health.."/"..players[i].mo.GetMaxHealth(),
                        DTA_VirtualWidth, 1920,
                        DTA_VirtualHeight, 1080,
                        DTA_KeepRatio, true);
                }
            }
        }
    }
}
