return {
  -- The chance for alien nests to spawn Alien goop wells when destroyed
  -- [min: 0.0, max:1.0, default: 0.05]
  goopChance=0.05,

  -- Minimum amount of Alien goop on wells (when its yield can't decrease anymore)
  -- [min: 0, default: 300]
  minimumGoop=300,

  -- The amount of Alien goop inside a 100% yield well
  -- [min: 0, default: 3000]
  baselineGoop=3000,

  -- Variance range on Alien goop well yield: Avg±(var/2)
  -- [min: 0, default: 0.02]
  goopVariance=0.02,

  -- How much the Alien goop well richness will increase, in average, per chunk away from spawn
  -- [min: 0.0, default: 0.02]
  increasePerChunk=0.02
}