newtype Stack a = StackImpl [a]

flushStack :: Stack a
flushStack = StackImpl[]

pushStack :: a -> Stack a -> Stack a
pushStack a (StackImpl s) = StackImpl(a:s)

popStack :: Stack a -> a
popStack (StackImpl (a:as)) = a
