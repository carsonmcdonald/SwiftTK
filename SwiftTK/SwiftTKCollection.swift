import Foundation

public class SwiftTKCollection
{
    public class func each<T>(array: [T], function: (Int, (T)) -> ())
    {
        for (index, elem: (T)) in enumerate(array)
        {
            function(index, elem)
        }
    }
    
    public class func each<KT, VT>(hash: Dictionary<KT, VT>, function: ((KT), (VT)) -> ())
    {
        for (key: KT, value: VT) in hash
        {
            function(key, value)
        }
    }
    
    public class func map<T, R>(array: [T], function: (T) -> R) -> [R]
    {
        return array.map(function)
    }
    
    public class func map<KT, VT, R>(hash: Dictionary<KT, VT>, function: ((KT), (VT)) -> R) -> [R]
    {
        var result: [R] = []
        for (key: KT, value: VT) in hash
        {
            result.append(function(key, value))            
        }
        return result
    }
    
    public class func reduce<T, M>(array: [T], start: M, function: ((M), (T)) -> M) -> M
    {
        return array.reduce(start, function)
    }
    
    public class func find<T>(array: [T], function: (T) -> Bool) -> T?
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
    
    public class func filter<T>(array: [T], function: (T) -> Bool) -> [T]
    {
        return array.filter(function)
    }
    
    public class func _where<KT, VT: Equatable>(array: Array<Dictionary<KT, VT>>, predicate: Dictionary<KT, VT>) -> [Dictionary<KT, VT>]
    {
        var result: [Dictionary<KT, VT>] = []
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
    
    public class func findWhere<KT, VT: Equatable>(array: Array<Dictionary<KT, VT>>, predicate: Dictionary<KT, VT>) -> Dictionary<KT, VT>?
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
    
    public class func reject<T>(array: [T], function: (T) -> Bool) -> [T]
    {
        var result: [T] = []
        for (index, elem: (T)) in enumerate(array)
        {
            if(!function(elem))
            {
                result.append(elem)
            }
        }
        return result
    }
    
    public class func every<T>(array: [T], function: (T) -> Bool) -> Bool
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
    
    public class func some<T>(array: [T], function: (T) -> Bool) -> Bool
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
    
    public class func contains<T: Equatable>(array: [T], value: T) -> Bool
    {
        for (index, elem: (T)) in enumerate(array)
        {
            if(elem == value)
            {
                return true
            }
        }
        return false
    }
}