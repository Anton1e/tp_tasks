from tree_utils_02.size_tree import SizeTree
from tree_utils_02.size_node import FileSizeNode
from tree_utils_02.tree import Tree


def test_size_tree():
    size_tree = SizeTree()
    tree = Tree()

    #CHECKING construct_filenode
    #when given a directory set size to BLOCKSIZE=4096

    dir_path = "/home/anton/test"

    file_size_node = size_tree.construct_filenode(dir_path, True)
    ans = FileSizeNode("test", True, [], 4096)

    assert file_size_node == ans

    #when given a file set size to file size

    file_path = "/home/anton/test/main.cpp"

    file_size_node = size_tree.construct_filenode(file_path, False)
    ans = FileSizeNode("main.cpp", False, [], 0)

    assert file_size_node == ans

    #CHECKING update_filenode

    file_size_node = FileSizeNode("test_size", True, [FileSizeNode("main.cpp", False, [], 51), FileSizeNode("lib.h", False, [], 14)], 0)
    ans = file_size_node
    ans.size = 65
    
    file_size_node = size_tree.update_filenode(file_size_node)

    assert ans == file_size_node

