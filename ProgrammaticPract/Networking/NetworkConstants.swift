class NetworkConstants{
    
    public static let  shared: NetworkConstants = NetworkConstants()
    
    private init(){
        // Singleton class
    }
    
    public var apiKey: String {
        get {
             return "9b4b3f249ba9b2fda6405d30f581b83f"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    } 
}
