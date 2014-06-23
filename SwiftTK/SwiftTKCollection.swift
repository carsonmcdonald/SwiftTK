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
}