# CatLib
## List of functions:
* `CatLib:AddNewMessage(id)` adds new message id in `Messages.lua` table. Call this before you register wanted message.
* `CatLib:AddNum()` adds unique number to newly generated message by `CatLib:AddNewMessage(id)`.
* `CatLib:PreventCrash(func, variables)` allows you to call function in safe mode which will prevent you from crashing (in most cases) and log error. You can call specific function with up to `3` variables typed in table. Example: `CatLib:PreventCrash(test, {1,2,3})` - this will run function `test` and pass `1,2,3` variables to it.
* `CatLib:dec_round(num, decimals)` rounds up to wanted decimals places. Example: `CatLib:dec_round(10.23, 1)` - returns `10.2`
* `CatLib:string_to_operator(string, x, y)` allows you to convert string to operator. Example: `CatLib:string_to_operator(">", 5, 3)` - checks `5 > 3`, in this case it would return `false`.
