//
//  LocationTableViewController.swift
//  Places
//
//  Created by MacBook on 4/3/22.
//

import UIKit
import RealmSwift
import CoreLocation
import MapKit

class LocationTableViewController: UITableViewController {
    
    let realm = try! Realm()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData();
        
    }
    override func viewDidLoad() {
        title="Favorite Locations"
        super.viewDidLoad()
        let landMark = realm.objects(LandMark.self)
        Locations.shared.LandMarks = landMark
        tableView.register(UINib(nibName: "LocationViewCell", bundle: nil), forCellReuseIdentifier: LocationViewCell.identifier)
        
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Locations.shared.LandMarks.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationViewCell.identifier, for: indexPath) as? LocationViewCell else{
            return UITableViewCell();
        }
        
        cell.name.text = Locations.shared.LandMarks[indexPath.row].name
        cell.time.text = DateFormatter.localizedString(from: Locations.shared.LandMarks[indexPath.row].time , dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.short)
        
        cell.detailss.text = Locations.shared.LandMarks[indexPath.row].details

        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let latitude:CLLocationDegrees =  Locations.shared.LandMarks[indexPath.row].lat
        let longitude:CLLocationDegrees =  Locations.shared.LandMarks[indexPath.row].lon

        let regionDistance:CLLocationDistance = 10000
        
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude);

        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let landMark = Locations.shared.LandMarks[indexPath.row]

    try! self.realm.write{
        self.realm.delete(landMark)
        }
    tableView.reloadData()

    }
    

}
