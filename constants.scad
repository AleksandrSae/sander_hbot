$fn = 50;

FRAME_WIDTH = 510;
FRAME_LENGTH = 420;
FRAME_HIGHT = 480;

PROFILE_420 = 420;
PROFILE_450 = 450;
PROFILE_540 = 540; // Z-axis balk

SQUARE_TUBE_15x30x360 = 360;
SQUARE_TUBE_15x30x450 = 450;

Z_AXIS_LEADSCREW_LEN = 350;
MGN_12_RAIL_LEN = 349;

GT2x10 = ["GT", 2.0,  10, 1.38, 0.75, 0.254];
GT2x16x10_pulley        = ["GT2x16_pulley",        "GT2",   16,  9.75, GT2x10,  10.0,  13, 5,   5, 13.0, 1.0,4.5,3.0,  M3_grub_screw, 2];
GT2x20x10_toothed_idler = ["GT2x20_toothed_idler", "GT2",   20, 12.22, GT2x10,  10,  18, 0,   4, 18.0, 1.0, 0, 0,    false,         0];
GT2x16x10_plain_idler   = ["GT2x16_plain_idler",   "GT2",    0,  9.63, GT2x10,  10,  13, 0,   3, 13.0, 1.0, 0, 0,    false,         0];
