var
    h1,h2:text;
    n,i:integer;
    sum:longint;
    arr:array of longint;

function bins(var arr:array of longint; low,high,target:integer):longint;
var middle,sum:integer;
begin
    sum:= 0;
    while low < high do
    begin
        middle:= (low + high) DIV 2;
        if arr[middle] >= target then
        begin
            sum:= sum + middle - low;
            low:= middle + 1;
        end else high:= middle - 1;
    end;
    bins:= sum;
end;

function partition(var arr:array of longint; low,high:integer):integer;
var j,temp:integer;
begin
    i:= low - 1;
    for j:= low to high - 1 do
    begin
        if arr[j] >= arr[high] then
        begin
            INC(i);
            temp:= arr[j];
            arr[j]:= arr[i];
            arr[i]:= temp;
        end;
    end;

    INC(i);
    temp:= arr[high];
    arr[high]:= arr[i];
    arr[i]:= temp;

    partition:= i;
end;

procedure qsort(var arr:array of longint; low,high:integer);
var pivot:integer;
begin
    if low < high then
    begin
        pivot:= partition(arr,low,high);
        qsort(arr,pivot + 1,high);
        qsort(arr,low,pivot - 1);
    end;
end;

begin
    assign(h1,'GHEPCAP.INP');
    assign(h2,'GHEPCAP.OUT');
    reset(h1);
    rewrite(h2);

    readln(h1,n);
    setlength(arr,n + 1);
    for i:= 1 to n do
    begin
        read(h1,arr[i]);
    end;

    qsort(arr,1,n);
    sum:= 0;
    for i:= 1 to n do
    begin
        sum:= sum + bins(arr,i - 1,n,(arr[i] * 9) DIV 10);
    end;
    write(h2,sum);

    close(h1);
    close(h2);
end.
