var
    h1, h2: text;
    i, n: integer;
    arr: array of integer;

function partition(var arr: array of integer; low, high: integer): integer;
var
    pivot, j, temp: integer;
begin
    pivot := arr[high];
    i := low - 1;
    for j := low to high - 1 do
    begin
        if arr[j] < pivot then
        begin
            Inc(i);
            temp := arr[j];
            arr[j] := arr[i];
            arr[i] := temp;
        end;
    end;
    temp := arr[high];
    arr[high] := arr[i + 1];
    arr[i + 1] := temp;
    partition := i + 1;
end;

procedure qsort(var arr: array of integer; low, high: integer);
var
    pivotIndex: integer;
begin
    if low < high then
    begin
        pivotIndex := partition(arr, low, high);
        qsort(arr, low, pivotIndex - 1);
        qsort(arr, pivotIndex + 1, high);
    end;
end;

begin
    assign(h1, 'Qsort.INP');
    assign(h2, 'Qsort.OUT');
    reset(h1);
    rewrite(h2);

    readln(h1, n);
    SetLength(arr, n + 1);
    for i := 1 to n do
    begin
        read(h1, arr[i]);
    end;

    qsort(arr, 1, n);

    for i := 1 to n do
        writeln(h2, arr[i]);

    close(h1);
    close(h2);
end.

