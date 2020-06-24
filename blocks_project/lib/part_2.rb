def all_words_capitalized?(arr)
    arr.all? {|ele| ele == ele.capitalize}
end


def no_valid_url?(urls)
    valid_ends = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        valid_ends.any? {|valid_end| url.include?(valid_end) }
    end
end

def any_passing_students?(arr)
    arr.any? {|student| student[:grades].sum / student[:grades].length >= 75}
end