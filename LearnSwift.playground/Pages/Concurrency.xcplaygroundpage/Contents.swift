//Dining and Calling Asynchronous Functions

func listPhotos(inGallery name: String) async -> [String] {
    let result = ["1"] // ... some aynchromous networking code
    return result
}

func generateSlideshow(forGallery gallery: String) async {
    let photos = await listPhotos(inGallery: gallery)
    for _ in photos {
        await Task.yield()
    }
}


func listPictures(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}


let photos = try await listPictures(inGallery: "A Rainy Weekend")


//func availableRainyWeekedndPhotos() -> Result<[String], Error> {
//    return Result {
//        try listPictures(inGallery: "Pictures")
//    }
//}

//Asynchronous Sequences

//import Foundation
//
//let handle = FileHandle.standardOutput
//for try await line in handle.bytes.lines {
//    print(line)
//}



//Calling Asynchromous Functions in Parallel

func downloadPhotoSimulation(named photoName: String) async throws -> String {
    print("Downloading photo \(photoName)...")
    try await Task.sleep(for: .seconds(3))
    print("Downloaded photo \(photoName)... Returning Value...")
    return "Downloaded \(photoName)"
}

async let firstPhoto = downloadPhotoSimulation(named: "FIRST")
async let secondPhoto = downloadPhotoSimulation(named: "SECOND")
async let thirdPhoto = downloadPhotoSimulation(named: "THIRD")


let photosDownloaded = await [firstPhoto, secondPhoto, thirdPhoto]
print(photosDownloaded)

//Actor - allow only one task access then at a time

actor TemperatureLoger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int
    
    init(label: String, measurement: Int) {
        self.label = labelself.measurements = [measurements]
        self.max = measurement
    }
    
    
}
