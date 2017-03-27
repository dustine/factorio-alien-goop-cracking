-- The chance for alien spawners to spawn Alien goop wells when destroyed.
-- [min: 0.0, max: 1.0, default: 0.05]
aliengoopcracking.goopChance = 0.05

-- The chance for Alien goop wells to get boosted when an alien spawner is destroyed above them (if no well is spawned on death). This is rolled per well.
-- [min: 0.0, max: 1.0, default: 0.20]
aliengoopcracking.boostChance = 0.20

-- Minimum amount of Alien goop on wells (when its yield can't decrease anymore).
-- [min: 0, default: 300]
aliengoopcracking.minimumGoop = 300

-- The amount of Alien goop inside a 100% yield well.
-- [min: 0, default: 3000]
aliengoopcracking.baselineGoop = 3000

-- Variance range on Alien goop well yield: Avg±(var/2).
-- [min: 0, default: 0.02]
aliengoopcracking.goopVariance = 0.02

-- How much the Alien goop well richness will increase, in average, per chunk away from spawn.
-- [min: 0.0, default: 0.02]
aliengoopcracking.increasePerChunk = 0.02
