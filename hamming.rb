require_relative "testing_library"

def hamming(strand_1, strand_2)

  strand1_array = strand_1.split("")
  strand2_array = strand_2.split("")

  mutants = 0

  strand1_array.each_with_index do |letter,index |
    break if strand2_array[index] == nil
    mutants += 1 if letter != strand2_array[index]
    end
  mutants
end

check("Hamming distance between identical strands",
      hamming("A", "A") == 0)

check("Hamming distance for single nucleotide strand",
      hamming("A", "G") == 1)

check("Hamming distance between small strands",
      hamming("AG", "CT") == 2)

check("Hamming distance between two other small strands",
      hamming("AT", "CT") == 1)

check("Hamming distance in longer strands",
      hamming("GGACG", "GGTCG") == 1)

check("Ignoring extra length in the first strand when it's longer",
      hamming("AAAG", "AAA") == 0)

check("Ignoring extra length in the second strand when it's longer",
      hamming("AAA", "AAAG") == 0)