import matplotlib.pyplot as plt

from research_template.shared_cache_manager import CM


@CM.collect
def simple_example():
    return {"a": [1, 2, 4, 3], "b": 5}


if __name__ == "__main__":
    use_cached = True
    ex = CM.simple_example(use_cached=use_cached)
    plt.plot(ex["a"])
    plt.show()
