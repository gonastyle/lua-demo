
function receive(prod)
    print("receive is called")
    local status,value = coroutine.resume(prod)
    return value
end

function send(x,prod)
    print("send is called")
    return coroutine.yield(x)
end

function producer()
    return coroutine.create(function ()
        print("producer is called")
        while true do
        print("producer run again")
            local x = io.read()
            send(x)
        end
    end)
end

function filter(prod)
    return coroutine.create(function ()
        for line = 1,1000 do
            print("enter fliter "..line)
            local x = receive(prod)
            print("receive in filter finished")
            x= string.format("%5d %s",line,x)
            send(x,prod)
        end
    end)
end

function consumer(prod)
    print("consumer is called")
    while true do
        print("consumer run again")
        local x = receive(prod)
        print("retrun customer")
        io.write(x,"\n")
    end
end



p = producer()
f=filter(p)
consumer(f)
