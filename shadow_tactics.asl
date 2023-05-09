state("Shadow Tactics")
{
    byte loading : "mono.dll", 0x001F6994, 0xC, 0xB4, 0x10, 0x68, 0x18, 0x14, 0x6C;
    int levelCode : "Shadow Tactics.exe", 0x00FB0350, 0x120;
    bool onStatsScreen : "mono.dll", 0x0020C574, 0X8, 0X8, 0X1BC, 0X28, 0X28, 0X24, 0X60;
}

init
{
    // Level IDs
    vars.OSAKA = 1;
    vars.NAKASENDO = 2;
    vars.IMAI = 3;
    vars.TSURU = 4;
    vars.YABU = 5;
    vars.HIDA = 6;
    vars.SUGANUMA = 7;
    vars.KANAZAWA = 8;
    vars.KAGE = 9;
    vars.PRISON = 10;
    vars.MATSUYAMA = 11;
    vars.MYOGI = 12;
    vars.SUNPU = 13;

    // Level codes: this value uniquely identifies which is the current level (or skippable intro cutscene)
    vars.OSAKA_CODE = 1654;
    vars.NAKASENDO_CODE = 766;
    vars.NAKASENDO_CUTSCENE_CODE = 754;
    vars.NAKASENDO_CUTSCENE_2_CODE = 756; // Nakasendo's optional cutscene can have two values
    vars.IMAI_CODE = 1526;
    vars.IMAI_CUTSCENE_CODE = 214;
    vars.TSURU_CODE = 1596;
    vars.TSURU_CUTSCENE_CODE = 139;
    vars.YABU_CODE = 1509;
    vars.YABU_CUTSCENE_CODE = 198;
    vars.HIDA_CODE = 1243;
    vars.HIDA_CUTSCENE_CODE = 296;
    vars.SUGANUMA_CODE = 991;
    vars.SUGANUMA_CUTSCENE_CODE = 134;
    vars.KANAZAWA_CODE = 1686;
    vars.KANAZAWA_CUTSCENE_CODE = 975;
    vars.KAGE_CODE = 1122;
    vars.KAGE_CUTSCENE_CODE = 268;
    vars.PRISON_CODE = 1338;
    vars.MATSUYAMA_CODE = 1889;
    vars.MATSUYAMA_CUTSCENE_CODE = 119;
    vars.MYOGI_CODE = 1299;
    vars.MYOGI_CUTSCENE_CODE = 170;
    vars.SUNPU_CODE = 1776;
    vars.SUNPU_CUTSCENE_CODE = 167;

    // Map both the in-level code and cutscene code(s) to its level id
    vars.levelMap = new Dictionary<int,int>();
    vars.levelMap.Add(vars.OSAKA_CODE, vars.OSAKA);
    vars.levelMap.Add(vars.NAKASENDO_CODE, vars.NAKASENDO);
    vars.levelMap.Add(vars.NAKASENDO_CUTSCENE_CODE, vars.NAKASENDO);
    vars.levelMap.Add(vars.NAKASENDO_CUTSCENE_2_CODE, vars.NAKASENDO);
    vars.levelMap.Add(vars.IMAI_CODE, vars.IMAI);
    vars.levelMap.Add(vars.IMAI_CUTSCENE_CODE, vars.IMAI);
    vars.levelMap.Add(vars.TSURU_CODE, vars.TSURU);
    vars.levelMap.Add(vars.TSURU_CUTSCENE_CODE, vars.TSURU);
    vars.levelMap.Add(vars.YABU_CODE, vars.YABU);
    vars.levelMap.Add(vars.YABU_CUTSCENE_CODE, vars.YABU);
    vars.levelMap.Add(vars.HIDA_CODE, vars.HIDA);
    vars.levelMap.Add(vars.HIDA_CUTSCENE_CODE, vars.HIDA);
    vars.levelMap.Add(vars.SUGANUMA_CODE, vars.SUGANUMA);
    vars.levelMap.Add(vars.SUGANUMA_CUTSCENE_CODE, vars.SUGANUMA);
    vars.levelMap.Add(vars.KANAZAWA_CODE, vars.KANAZAWA);
    vars.levelMap.Add(vars.KANAZAWA_CUTSCENE_CODE, vars.KANAZAWA);
    vars.levelMap.Add(vars.KAGE_CODE, vars.KAGE);
    vars.levelMap.Add(vars.KAGE_CUTSCENE_CODE, vars.KAGE);
    vars.levelMap.Add(vars.PRISON_CODE, vars.PRISON);
    vars.levelMap.Add(vars.MATSUYAMA_CODE, vars.MATSUYAMA);
    vars.levelMap.Add(vars.MATSUYAMA_CUTSCENE_CODE, vars.MATSUYAMA);
    vars.levelMap.Add(vars.MYOGI_CODE, vars.MYOGI);
    vars.levelMap.Add(vars.MYOGI_CUTSCENE_CODE, vars.MYOGI);
    vars.levelMap.Add(vars.SUNPU_CODE, vars.SUNPU);
    vars.levelMap.Add(vars.SUNPU_CUTSCENE_CODE, vars.SUNPU);
    
    // Initial value for split tracking
    vars.previousLevel = vars.OSAKA;
}

start
{
    // When we've finished loading the first level
    if (current.loading == 0){
        int level = vars.levelMap[current.levelCode];
        if (level == vars.OSAKA){
            return true;
        }
    }
}

split
{
    // If the level value has changed
    if (current.levelCode != old.levelCode){
        int level = vars.levelMap[current.levelCode];

        // If we've moved forward one level
        if (level == vars.previousLevel + 1) {
            vars.previousLevel = level;
            return true;
        }
    
    // End the timer when entering the final stats screen
    } else if ((vars.previousLevel == vars.SUNPU) && current.onStatsScreen && (current.loading == 0)) {
        return true;
    }
}

isLoading
{
    // The loading byte is either 1 or 2 while loading and 0 while not loading
    if (current.loading != 0){
        return true;
    } else {
        return false;
    }
}
