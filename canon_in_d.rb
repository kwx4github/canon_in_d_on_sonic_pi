# Welcome to Sonic Pi
canon_in_d_bass = [:D3,:A2,:B2,:Fs2,:G2,:D2,:G2,:A2]

canon_in_d_harpsichord_with_rest = [
  :r,:Fs3,:A3,:D4,
  :r,:E3,:A3,:Cs4,
  :r,:D3,:Fs3,:B3,
  :r,:Cs3,:Fs3,:A3,
  :r,:B2,:D3,:G3,
  :r,:A2,:D3,:Fs3,
  :r,:B2,:D3,:G3,
  :r,:Cs3,:E3,:A3,
]

canon_in_d_harpsichord_without_rest = [
  :D3,:Fs3,:A3,:D4,
  :A2,:E3,:A3,:Cs4,
  :B2,:D3,:Fs3,:B3,
  :Fs2,:Cs3,:Fs3,:A3,
  :G2,:B2,:D3,:G3,
  :D2,:A2,:D3,:Fs3,
  :G2,:B2,:D3,:G3,
  :A2,:Cs3,:E3,:A3,
]

use_bpm 52

s=0.8;r=1-s

with_fx :reverb,room: 0.6,mix: 0.6 do
  with_fx :level,amp: 0.6 do
    use_synth :blade
    in_thread do
      28.times do
        for i in 0..canon_in_d_bass.length-1
          play canon_in_d_bass[i],sustain: 0.9,release: 0.1,amp: 0.6 ,pan: 0.8
          sleep 1
        end
      end
    end
  end
end

with_fx :reverb,room: 0.8 do
  use_synth :pluck
  in_thread do
    28.times do
      for i in 0..canon_in_d_harpsichord_with_rest.length-1
        play canon_in_d_harpsichord_with_rest[i],amp: 0.7
        sleep 0.25
      end
    end
  end
end
