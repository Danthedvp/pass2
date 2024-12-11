var
    h1,h2:text;
    arr:array of integer;
    middle,i,n,target:integer;

function BINS(arr:array of integer; low,high:integer):integer;
begin
    middle:= (low + high) DIV 2;
    if low > high then exit(0) else
    begin
        if target < arr[middle] then BINS:= BINS(arr, low, middle - 1)
        else if target > arr[middle] then BINS:= BINS(arr, middle + 1, high)
        else exit(1);
    end;
end;

begin
    assign(h1,'BINS.INP');
    assign(h2,'BINS.OUT');
    reset(h1);
    rewrite(h2);

    read(h1,n,target);
    readln(h1);
    setlength(arr, n + 1);
    for i:= 1 to n do
    begin
        read(h1,arr[i]);
    end;

    write(h2,BINS(arr,1,n));

    close(h1);
    close(h2);
end.
