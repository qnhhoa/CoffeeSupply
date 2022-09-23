pragma solidity ^0.4.23;

contract SupplyChainStorage {
    
    event Added(uint256 index);
    
    /* User Related */
    struct State{
        string description;
        address person;
    }
    
    // mapping(address => user) userDetails;
    
    /* Caller Mapping */
    // mapping(address => uint8) authorizedCaller;
    
    /* authorize caller */
    // function authorizeCaller(address _caller) public onlyOwner returns(bool) 
    // {
    //     authorizedCaller[_caller] = 1;
    //     emit AuthorizedCaller(_caller);
    //     return true;
    // }
    
    // /* deauthorize caller */
    // function deAuthorizeCaller(address _caller) public onlyOwner returns(bool) 
    // {
    //     authorizedCaller[_caller] = 0;
    //     emit DeAuthorizedCaller(_caller);
    //     return true;
    // }
    
    /*User Roles
        SUPER_ADMIN,
        FARM_INSPECTION,
        HARVESTER,
        EXPORTER,
        IMPORTER,
        PROCESSOR
    */
    
    /* Process Related */
     struct basicDetails {
        string registrationNo;
        string farmerName;
        string farmAddress;
        string exporterName;
        string importerName;   
    }
    
    struct kiemDinh {
        uint256 inspectorNo;
        uint256 contentOfHumus;
        uint256 farmerNo;
        uint256 checkingTime;
        string coffeeFamily;
        string typeOfSeed;
        string fertilizerUsed;
    }
    
    struct thuHoach {
        uint256 harvesterNo;
        uint256 production;
        uint256 ripePercent;
        uint256 harvestTime;
    }    
    
    struct nhapKho {
        uint256 warehouseNo;
        uint256 batchNo;
        uint256 shipNo;
        uint256 quantity;
        uint256 importDateTime;
    }
    
    struct cheBien {
        uint256 ProcessorNo;
        uint256 humidity;
        uint256 temperature;
        uint256 peelingTime;
        uint256 fermentationTime;
        uint256 dryingTime;
        uint256 processingTime;
    }
    
    struct chietXuat {
        uint256 extractorNo;
        uint256 roastingTime;
        uint256 grindingTime;
        uint256 temperature;
        uint256 packageDateTime;
    }

    struct xuatKho {
        uint256 distributorNo;
        uint256 exportDateTime;
    }
    
    mapping (address => basicDetails) batchBasicDetails;
    mapping (address => kiemDinh) batchFarmInspector;
    mapping (address => thuHoach) batchHarvester;
    mapping (address => xuatKho) batchExporter;
    mapping (address => nhapKho) batchImporter;
    mapping (address => cheBien) batchProcessor;
    mapping (address => chietXuat) batchProcessor;
    mapping (address => string) nextAction;
    uint256 items=0;
    
    /*Initialize struct pointer*/
    user userDetail;
    basicDetails basicDetailsData;
    farmInspector farmInspectorData;
    harvester harvesterData;
    exporter exporterData;
    importer importerData;
    processor processorData; 
    
    
    function concat(string memory _a, string memory _b) public returns (string memory){
        bytes memory bytes_a = bytes(_a);
        bytes memory bytes_b = bytes(_b);
        string memory length_ab = new string(bytes_a.length + bytes_b.length);
        bytes memory bytes_c = bytes(length_ab);
        uint k = 0;
        for (uint i = 0; i < bytes_a.length; i++) bytes_c[k++] = bytes_a[i];
        for (uint i = 0; i < bytes_b.length; i++) bytes_c[k++] = bytes_b[i];
        return string(bytes_c);
    }
    
    /* Get User Role */
    
    /*get batch basicDetails*/
    function getBasicDetails(address _batchNo) public onlyAuthCaller view returns(string registrationNo,
                             string farmerName,
                             string farmAddress,
                             string exporterName,
                             string importerName) {
        
        basicDetails memory tmpData = batchBasicDetails[_batchNo];
        
        return (tmpData.registrationNo,tmpData.farmerName,tmpData.farmAddress,tmpData.exporterName,tmpData.importerName);
    }
    
    /*set batch basicDetails*/
    function setBasicDetails(string _registrationNo,
                             string _farmerName,
                             string _farmAddress,
                             string _exporterName,
                             string _importerName
                             
                            ) public onlyAuthCaller returns(address) {
        
        uint tmpData = uint(keccak256(msg.sender, now));
        address batchNo = address(tmpData);
        
        basicDetailsData.registrationNo = _registrationNo;
        basicDetailsData.farmerName = _farmerName;
        basicDetailsData.farmAddress = _farmAddress;
        basicDetailsData.exporterName = _exporterName;
        basicDetailsData.importerName = _importerName;
        
        batchBasicDetails[batchNo] = basicDetailsData;
        
        nextAction[batchNo] = 'FARM_INSPECTION';   
        
        
        return batchNo;
    }
    
    /*set farm Inspector data*/
    function setKiemDinh(address batchNo,
                                uint256 inspectorNo,
                                uint256 contentOfHumus,
                                uint256 farmerNo,
                                uint256 checkingTime,
                                string coffeeFamily,
                                string typeOfSeed,
                                string fertilizerUsed) public returns(bool){
        farmInspectorData.inspectorNo = _inspectorNo;
        farmInspectorData.contentOfHumus = _contentOfHumus;
        farmInspectorData.farmerNo = _farmerNo;
        farmInspectorData.coffeeFamily = _coffeeFamily;
        farmInspectorData.typeOfSeed = _typeOfSeed;
        farmInspectorData.fertilizerUsed = _fertilizerUsed;
        farmInspectorData.checkingTime = _checkingTime;
        
        batchFarmInspector[batchNo] = farmInspectorData;
        
        nextAction[batchNo] = 'HARVESTER'; 
        
        return true;
    }
    
    
    /*get farm inspactor data*/
    function getFarmInspectorData(address batchNo) public onlyAuthCaller view returns (string coffeeFamily,string typeOfSeed,string fertilizerUsed){
        
        farmInspector memory tmpData = batchFarmInspector[batchNo];
        return (tmpData.coffeeFamily, tmpData.typeOfSeed, tmpData.fertilizerUsed);
    }
    

    /*set Harvester data*/
    function setHarvesterData(address batchNo,
                              string _cropVariety,
                              string _temperatureUsed,
                              string _humidity) public onlyAuthCaller returns(bool){
        harvesterData.cropVariety = _cropVariety;
        harvesterData.temperatureUsed = _temperatureUsed;
        harvesterData.humidity = _humidity;
        
        batchHarvester[batchNo] = harvesterData;
        
        nextAction[batchNo] = 'EXPORTER'; 
        
        return true;
    }
    
    /*get farm Harvester data*/
    function getHarvesterData(address batchNo) public onlyAuthCaller view returns(string cropVariety,
                                                                                           string temperatureUsed,
                                                                                           string humidity){
        
        harvester memory tmpData = batchHarvester[batchNo];
        return (tmpData.cropVariety, tmpData.temperatureUsed, tmpData.humidity);
    }
    
    /*set Exporter data*/
    function setExporterData(address batchNo,
                              uint256 _quantity,    
                              string _destinationAddress,
                              string _shipName,
                              string _shipNo,
                              uint256 _estimateDateTime,
                              uint256 _exporterId) public onlyAuthCaller returns(bool){
        
        exporterData.quantity = _quantity;
        exporterData.destinationAddress = _destinationAddress;
        exporterData.shipName = _shipName;
        exporterData.shipNo = _shipNo;
        exporterData.departureDateTime = now;
        exporterData.estimateDateTime = _estimateDateTime;
        exporterData.exporterId = _exporterId;
        
        batchExporter[batchNo] = exporterData;
        
        nextAction[batchNo] = 'IMPORTER'; 
        
        return true;
    }
    
    /*get Exporter data*/
    function getExporterData(address batchNo) public onlyAuthCaller view returns(uint256 quantity,
                                                                string destinationAddress,
                                                                string shipName,
                                                                string shipNo,
                                                                uint256 departureDateTime,
                                                                uint256 estimateDateTime,
                                                                uint256 exporterId){
        
        
        exporter memory tmpData = batchExporter[batchNo];
        
        
        return (tmpData.quantity, 
                tmpData.destinationAddress, 
                tmpData.shipName, 
                tmpData.shipNo, 
                tmpData.departureDateTime, 
                tmpData.estimateDateTime, 
                tmpData.exporterId);
                
        
    }

    
    /*set Importer data*/
    function setImporterData(address batchNo,
                              uint256 _quantity, 
                              string _shipName,
                              string _shipNo,
                              string _transportInfo,
                              string _warehouseName,
                              string _warehouseAddress,
                              uint256 _importerId) public onlyAuthCaller returns(bool){
        
        importerData.quantity = _quantity;
        importerData.shipName = _shipName;
        importerData.shipNo = _shipNo;
        importerData.arrivalDateTime = now;
        importerData.transportInfo = _transportInfo;
        importerData.warehouseName = _warehouseName;
        importerData.warehouseAddress = _warehouseAddress;
        importerData.importerId = _importerId;
        
        batchImporter[batchNo] = importerData;
        
        nextAction[batchNo] = 'PROCESSOR'; 
        
        return true;
    }
    
    /*get Importer data*/
    function getImporterData(address batchNo) public onlyAuthCaller view returns(uint256 quantity,
                                                                                        string shipName,
                                                                                        string shipNo,
                                                                                        uint256 arrivalDateTime,
                                                                                        string transportInfo,
                                                                                        string warehouseName,
                                                                                        string warehouseAddress,
                                                                                        uint256 importerId){
        
        importer memory tmpData = batchImporter[batchNo];
        
        
        return (tmpData.quantity, 
                tmpData.shipName, 
                tmpData.shipNo, 
                tmpData.arrivalDateTime, 
                tmpData.transportInfo,
                tmpData.warehouseName,
                tmpData.warehouseAddress,
                tmpData.importerId);
                
        
    }

    /*set Proccessor data*/
    function setProcessorData(address batchNo,
                              uint256 _quantity, 
                              string _temperature,
                              uint256 _rostingDuration,
                              string _internalBatchNo,
                              uint256 _packageDateTime,
                              string _processorName,
                              string _processorAddress) public onlyAuthCaller returns(bool){
        
        
        processorData.quantity = _quantity;
        processorData.temperature = _temperature;
        processorData.rostingDuration = _rostingDuration;
        processorData.internalBatchNo = _internalBatchNo;
        processorData.packageDateTime = _packageDateTime;
        processorData.processorName = _processorName;
        processorData.processorAddress = _processorAddress;
        
        batchProcessor[batchNo] = processorData;
        
        nextAction[batchNo] = 'DONE'; 
        
        return true;
    }
    
    
    /*get Processor data*/
    function getProcessorData( address batchNo) public onlyAuthCaller view returns(
                                                                                        uint256 quantity,
                                                                                        string temperature,
                                                                                        uint256 rostingDuration,
                                                                                        string internalBatchNo,
                                                                                        uint256 packageDateTime,
                                                                                        string processorName,
                                                                                        string processorAddress){

        processor memory tmpData = batchProcessor[batchNo];
        
        
        return (
                tmpData.quantity, 
                tmpData.temperature, 
                tmpData.rostingDuration, 
                tmpData.internalBatchNo,
                tmpData.packageDateTime,
                tmpData.processorName,
                tmpData.processorAddress);
                
        
    }
  
}    
