import Foundation

class SwiftTKCollection
{
    class func each<T>(array: T[], function: (Int, (T)) -> ())
    {
        for (index, elem: (T)) in enumerate(array)
        {
            function(index, elem)
        }
    }
    
    class func each<KT, VT>(hash: Dictionary<KT, VT>, function: ((KT), (VT)) -> ())
    {
        for (key: KT, value: VT) in hash
        {
            function(key, value)
        }
    }
    
    class func map<T, R>(array: T[], function: (T) -> R) -> R[]
    {
        return array.map(function)
    }
    
    class func map<KT, VT, R>(hash: Dictionary<KT, VT>, function: ((KT), (VT)) -> R) -> R[]
    {
        var result: R[] = []
        for (key: KT, value: VT) in hash
        {
            result.append(function(key, value))            
        }
        return result
    }
    
    class func reduce<T, M>(array: T[], start: M, function: ((M), (T)) -> M) -> M
    {
        return array.reduce(start, function)
    }
    
    class func find<T>(array: T[], function: (T) -> Bool) -> T?
    {
        for (index, elem: (T)) in enumerate(array)
        {
            if(function(elem))
            {
                return elem
            }
        }
        return nil
    }
    
    class func filter<T>(array: T[], function: (T) -> Bool) -> T[]
    {
        return array.filter(function)
    }
}