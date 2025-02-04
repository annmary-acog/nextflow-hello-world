nextflow.enable.dsl=2

process hello {
    output:
        path "hello.txt"
    
    script:
    """
    echo "Hello, World!" > hello.txt
    """
}

process count_lines {
    input:
        path input_file
    output:
        stdout
    
    script:
    """
    wc -l < \$input_file
    """
}

workflow {
    hello()
    count_lines(hello.out)
}
