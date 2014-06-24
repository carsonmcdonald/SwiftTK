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
}