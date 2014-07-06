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
    
    class func _where<KT, VT: Equatable>(array: Array<Dictionary<KT, VT>>, predicate: Dictionary<KT, VT>) -> Dictionary<KT, VT>[]
    {
        var result: Dictionary<KT, VT>[] = []
        for (index, elem: (Dictionary<KT, VT>)) in enumerate(array)
        {
            var found: Bool = true
            for (key: KT, value: VT) in predicate
            {
                if(elem[key] && elem[key]! == value)
                {
                    found = true
                }
                else
                {
                    found = false
                    break
                }
            }
            if(found)
            {
                result.append(elem)
            }
        }
        return result
    }
    
    class func findWhere<KT, VT: Equatable>(array: Array<Dictionary<KT, VT>>, predicate: Dictionary<KT, VT>) -> Dictionary<KT, VT>?
    {
        for (index, elem: (Dictionary<KT, VT>)) in enumerate(array)
        {
            var found: Bool = true
            for (key: KT, value: VT) in predicate
            {
                if(elem[key] && elem[key]! == value)
                {
                    found = true
                }
                else
                {
                    found = false
                    break
                }
            }
            if(found)
            {
                return elem
            }
        }
        return nil
    }
    
    class func reject<T>(array: T[], function: (T) -> Bool) -> T[]
    {
        var result: T[] = []
        for (index, elem: (T)) in enumerate(array)
        {
            if(!function(elem))
            {
                result.append(elem)
            }
        }
        return result
    }
    
    class func every<T>(array: T[], function: (T) -> Bool) -> Bool
    {
        for (index, elem: (T)) in enumerate(array)
        {
            if(!function(elem))
            {
                return false
            }
        }
        return true
    }
    
    class func some<T>(array: T[], function: (T) -> Bool) -> Bool
    {
        for (index, elem: (T)) in enumerate(array)
        {
            if(function(elem))
            {
                return true
            }
        }
        return false
    }
}