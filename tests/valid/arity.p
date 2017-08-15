# vim: ft=plasma
# This is free and unencumbered software released into the public domain.
# See ../LICENSE.unlicense

module Arity

func main() -> Int using IO {
    foo!(int_to_string(bar(3, 5)) ++ "\n")

    do_pm!(7)
    do_pm!(-23)

    x = 3 # Check that the stack is still aligned.
    foo2!("Test foo2\n")
    foo3!("Test foo3\n")
    noop()

    return x - 3
}

# Test a function that returns nothing.
func foo(x : String) using IO {
    print!(x)
}

# This function returns numthing, but ends in an assignment, which is stupid
# but for now legal.  It should generate a warning in the future.
func foo2(x : String) using IO {
    print!(x)
    y = x
}

# Test a function that returns nothing, and has an empty return statement.
func foo3(x : String) using IO {
    print!(x)
    return
}

func noop() using IO {}

# A function that returns one thing.
func bar(a : Int, b : Int) -> Int {
    return a + b
}

func do_pm(x : Int) using IO {
    p, m = pm(x)
    print!("p: " ++ int_to_string(p) ++ ", m: " ++ int_to_string(m) ++ "\n")
}

# A function that returns two things.
func pm(x : Int) -> Int, Int {
    if (x < 0) {
        x_abs = x * -1
    } else {
        x_abs = x
    }
    return x_abs, x_abs * -1
}
