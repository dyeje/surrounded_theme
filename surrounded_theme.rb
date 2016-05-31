in_thread do
  loop do
    play scale(:Eb2, :major, num_octaves: 1).choose, release: 0.4, amp: rrand(0.6, 0.9)
    sleep 0.25
  end
end

with_fx :distortion, mix: 0.1 do
  with_fx :echo, mix: 1.0 do
    with_fx :reverb, mix: 0.8 do
      in_thread do
        loop do
          play scale(:Eb4, :major, num_octaves: 1)[1], release: 1, amp: 0.2
          sleep 4.0

          play scale(:Eb4, :major, num_octaves: 1)[2], release: 1, amp: 0.2
          sleep 4.0

          play scale(:F4, :melodic_minor, num_octaves: 1)[3], release: 1, amp: 0.2
          sleep 2.0

          play scale(:Bb3, :mixolydian, num_octaves: 1)[6], release: 1, amp: 0.2
          sleep 2.0

          play scale(:Eb4, :major, num_octaves: 1)[7], release: 1, amp: 0.2
          sleep 4.0
        end
      end
    end
  end
end

with_fx :echo, mix: 0.8 do |w|
  with_fx :reverb, mix: 0.4 do
    in_thread do
      loop do
        play chord(:Eb3, :major7)
        sleep 4.0

        play chord(:Eb3, :maj9)
        sleep 4.0

        play chord(:F3,:m7)
        sleep 2.0

        play chord(:Bb3, '7')
        sleep 2.0

        play chord(:Eb3, :major7)
        sleep 4.0
      end
    end
  end
end

with_fx :echo, mix: 0.3 do |w|
  with_fx :reverb, mix: 0.6 do |w|
    with_fx :wobble, mix: 0.3 do |w|
      loop do
        3.times do
          sample :drum_bass_soft, amp: 0.8
          sleep 0.125
          sample :drum_bass_soft, amp: 0.8
          sleep 0.125
          sample :drum_bass_soft, amp: 0.8
          sleep 0.5
          sample :drum_snare_soft, amp: 0.8
          sleep 0.25
        end

        1.times do
          sample :drum_bass_soft, amp: 1.0
          sleep 0.125
          sample :drum_bass_soft, amp: 1.0
          sleep 0.125
          sample :drum_bass_soft, amp: 1.0
          sleep 0.25
          sample :drum_snare_soft, amp: 1.0
          sleep 0.25
          sample :drum_snare_soft, amp: 1.0
          sleep 0.25
        end
      end
    end
  end
end