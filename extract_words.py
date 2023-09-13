import numpy as np
import re


def all_words(words):
    allwords = ' '.join(words)

    # write all words to a file
    file_path_all = 'allwords.txt'
    with open(file_path_all, 'w', encoding='utf-8') as f:
        f.write(allwords)

def unique_words(words):
    unique, counts = np.unique(words, return_counts=True) # returns unique words and their counts

    # write all unique words to a file
    unique = ' '.join(unique)
    file_path_unique = 'uniquewords.txt'
    with open(file_path_unique, 'w', encoding='utf-8') as f:
        f.write(unique)

    return counts

def word_frequency(counts):
    counts, countsOfCounts = np.unique(counts, return_counts=True) # returns the counts of the counts (e.g. a count of 1 occurs 1000 times)

    # convert to dicti
    frequencies = dict(zip(counts, countsOfCounts))

    # write word frequencies to a file
    file_path_freq = 'wordfrequency.txt'
    with open(file_path_freq, 'w', encoding='utf-8') as f:
        for key, value in frequencies.items():
            f.write(f"{key}: {value}\n")

def main():
    # read in text file
    with open('SunAlsoRises.txt', 'r', encoding='utf-8') as f:
        text = f.read()

    words = [re.sub(r'[—.,‘\'"“”!?()\[\]{}:;_/0123456789#$%=&•*-]', '', word) for word in text.split()] # remove unwanted characters (used regex library because strip only removes from the ends of the string)

    words = np.array(words)

    words = np.char.lower(words) # convert all words to lowercase

    words = np.sort(words) # for simplicity

    all_words(words) 

    counts = unique_words(words)

    word_frequency(counts)


if __name__ == '__main__':
    main()