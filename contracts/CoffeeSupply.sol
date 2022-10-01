pragma solidity ^0.4.23;

contract SupplyChain {
    
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
        FARM_INSPECTOR,
        HARVESTER,
        IMPORTER,
        EXTRACTOR,
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
        uint256 harvestDateTime;
    }    
    
    struct nhapKho {
        uint256 warehouseNo;
        uint256 importerNo;
        uint256 shipNo;
        uint256 quantity;
        uint256 importDateTime;
    }
    
    struct cheBien {
        uint256 warehouseNo;
        uint256 humidity;
        uint256 temperature;
        uint256 peelingTime;
        uint256 fermentTime;
        uint256 dryingTime;
        uint256 processingTime;
    }
    
    struct chietXuat {
        uint256 warehouseNo;
        uint256 roastingTime;
        uint256 grindingTime;
        uint256 temperature;
        uint256 packageDateTime;
    }

    struct xuatKho {
        uint256 exporterNo;
        uint256 distributorNo;
        uint256 quantity;
        uint256 exportDateTime;
    }
    
    mapping (address => basicDetails) batchBasicDetails;
    mapping (uint256 => kiemDinh) batchKiemDinh;
    mapping (uint256 => thuHoach) batchThuHoach;
    mapping (uint256 => xuatKho) batchXuatKho;
    mapping (uint256 => nhapKho) batchNhapKho;
    mapping (uint256 => cheBien) batchCheBien;
    mapping (uint256 => chietXuat) batchChietXuat;
    mapping (uint256 => string) nextAction;
    uint256 items=0;
    
    /*Initialize struct pointer*/
    // user userDetail;
    basicDetails basicDetailsData;
    kiemDinh kiemDinhData;
    thuHoach thuHoachData;
    xuatKho xuatKhoData;
    nhapKho nhapKhoData;
    cheBien cheBienData; 
    chietXuat chietXuatData;
    
   
    // function concat(string memory _a, string memory _b) public returns (string memory){
    //     bytes memory bytes_a = bytes(_a);
    //     bytes memory bytes_b = bytes(_b);
    //     string memory length_ab = new string(bytes_a.length + bytes_b.length);
    //     bytes memory bytes_c = bytes(length_ab);
    //     uint k = 0;
    //     for (uint i = 0; i < bytes_a.length; i++) bytes_c[k++] = bytes_a[i];
    //     for (uint i = 0; i < bytes_b.length; i++) bytes_c[k++] = bytes_b[i];
    //     return string(bytes_c);
    // }
    
    /* Get User Role */
    
    /*get batch basicDetails*/
    // function getBasicDetails(address _batchNo) public onlyAuthCaller view returns(string registrationNo,
    //                          string farmerName,
    //                          string farmAddress,
    //                          string exporterName,
    //                          string importerName) {
        
    //     basicDetails memory tmpData = batchBasicDetails[_batchNo];
        
    //     return (tmpData.registrationNo,tmpData.farmerName,tmpData.farmAddress,tmpData.exporterName,tmpData.importerName);
    // }
    
    // /*set batch basicDetails*/
    // function setBasicDetails(string _registrationNo,
    //                          string _farmerName,
    //                          string _farmAddress,
    //                          string _exporterName,
    //                          string _importerName
                             
    //                         ) public onlyAuthCaller returns(address) {
        
    //     uint tmpData = uint(keccak256(msg.sender, now));
    //     address batchNo = address(tmpData);
        
    //     basicDetailsData.registrationNo = _registrationNo;
    //     basicDetailsData.farmerName = _farmerName;
    //     basicDetailsData.farmAddress = _farmAddress;
    //     basicDetailsData.exporterName = _exporterName;
    //     basicDetailsData.importerName = _importerName;
        
    //     batchBasicDetails[batchNo] = basicDetailsData;
        
    //     nextAction[batchNo] = 'FARM_INSPECTION';   
        
        
    //     return batchNo;
    // }
    
    /*set farm Inspector data*/
    function setKiemDinhData(uint256 batchNo,
                                uint256 inspectorNo,
                                uint256 contentOfHumus,
                                uint256 farmerNo,
                                uint256 checkingTime,
                                string coffeeFamily,
                                string typeOfSeed,
                                string fertilizerUsed) public returns(bool){
        kiemDinhData.inspectorNo = inspectorNo;
        kiemDinhData.contentOfHumus = contentOfHumus;
        kiemDinhData.farmerNo = farmerNo;
        kiemDinhData.coffeeFamily = coffeeFamily;
        kiemDinhData.typeOfSeed = typeOfSeed;
        kiemDinhData.fertilizerUsed = fertilizerUsed;
        kiemDinhData.checkingTime = checkingTime;
        
        batchKiemDinh[batchNo] = kiemDinhData;
        
        nextAction[batchNo] = 'thuHoach'; 
        
        return true;
    }
      
    /*get farm inspector data*/
    function getKiemDinhData(uint256 batchNo) public view returns (
                                uint256 inspectorNo,
                                uint256 contentOfHumus,
                                uint256 farmerNo,
                                uint256 checkingTime,
                                string coffeeFamily,
                                string typeOfSeed,
                                string fertilizerUsed){
        
        kiemDinh memory tmpData = batchKiemDinh[batchNo];
        return (tmpData.inspectorNo, tmpData.contentOfHumus, tmpData.farmerNo,tmpData.checkingTime,tmpData.coffeeFamily,tmpData.typeOfSeed,tmpData.fertilizerUsed);
    }



    /*set Harvester data*/
    function setThuHoachData(uint256 batchNo,
                                uint256 harvesterNo,
                                uint256 production,
                                uint256 ripePercent,
                                uint256 harvestDateTime) public returns(bool){
        thuHoachData.harvesterNo = harvesterNo;
        thuHoachData.production = production;
        thuHoachData.ripePercent = ripePercent;
        thuHoachData.harvestDateTime = harvestDateTime;
        
        batchThuHoach[batchNo] = thuHoachData;
        
        nextAction[batchNo] = 'nhapKho'; 
        
        return true;
    }

    /*get farm Harvester data*/
    function getThuHoachData(uint256 batchNo) public view returns (
                                uint256 harvesterNo,
                                uint256 production,
                                uint256 ripePercent,
                                uint256 harvestDateTime){
        
        thuHoach memory tmpData = batchThuHoach[batchNo];
        return (tmpData.harvesterNo, tmpData.production, tmpData.ripePercent,tmpData.harvestDateTime);
    }



    /*set nhapKho data*/
    function setNhapKhoData(uint256 batchNo,
                                uint256 warehouseNo,
                                uint256 importerNo,
                                uint256 shipNo,
                                uint256 quantity,
                                uint256 importDateTime) public returns(bool){
        nhapKhoData.warehouseNo = warehouseNo;
        nhapKhoData.importerNo = importerNo;
        nhapKhoData.shipNo = shipNo;
        nhapKhoData.quantity = quantity;
        nhapKhoData.importDateTime = importDateTime;
        
        batchNhapKho[batchNo] = nhapKhoData;
        
        nextAction[batchNo] = 'cheBien'; 
        
        return true;
    }

    /*get nhapKho data*/
    function getNhapKhoData(uint256 batchNo) public view returns (
                                uint256 warehouseNo,
                                uint256 importerNo,
                                uint256 shipNo,
                                uint256 quantity,
                                uint256 importDateTime){
        
        nhapKho memory tmpData = batchNhapKho[batchNo];
        return (tmpData.warehouseNo, tmpData.importerNo, tmpData.shipNo, tmpData.quantity,tmpData.importDateTime);
    }



    /*set cheBien data*/
    function setCheBienData(uint256 batchNo,
                                uint256 warehouseNo,
                                uint256 humidity,
                                uint256 temperature,
                                uint256 peelingTime,
                                uint256 fermentTime,
                                uint256 dryingTime,
                                uint256 processingTime) public returns(bool){
        cheBienData.warehouseNo = warehouseNo;
        cheBienData.humidity = humidity;
        cheBienData.temperature = temperature;
        cheBienData.peelingTime = peelingTime;
        cheBienData.humidity = humidity;
        cheBienData.temperature = temperature;
        cheBienData.peelingTime = peelingTime;
        
        batchCheBien[batchNo] = cheBienData;
        
        nextAction[batchNo] = 'chietXuat'; 
        
        return true;
    }

    /*get cheBien data*/
    function getCheBienData(uint256 batchNo) public view returns (
                                uint256 warehouseNo,
                                uint256 humidity,
                                uint256 temperature,
                                uint256 peelingTime,
                                uint256 fermentTime,
                                uint256 dryingTime,
                                uint256 processingTime){
        
        cheBien memory tmpData = batchCheBien[batchNo];
        return (tmpData.warehouseNo, tmpData.humidity, tmpData.temperature,tmpData.peelingTime,tmpData.fermentTime,tmpData.dryingTime,tmpData.processingTime);
    }



    /*set chietXuat data*/
    function setChietXuatData(uint256 batchNo,
                                uint256 warehouseNo,
                                uint256 roastingTime,
                                uint256 grindingTime,
                                uint256 temperature,
                                uint256 packageDateTime) public returns(bool){
        chietXuatData.warehouseNo = warehouseNo;
        chietXuatData.roastingTime = roastingTime;
        chietXuatData.grindingTime = grindingTime;
        chietXuatData.temperature = temperature;
        chietXuatData.packageDateTime = packageDateTime;
        
        batchChietXuat[batchNo] = chietXuatData;
        
        nextAction[batchNo] = 'xuatKho'; 
        
        return true;
    }
    
    /*get chietXuat data*/
    function getChietXuatData(uint256 batchNo) public view returns (
                                uint256 warehouseNo,
                                uint256 roastingTime,
                                uint256 grindingTime,
                                uint256 temperature,
                                uint256 packageDateTime){
        
        chietXuat memory tmpData = batchChietXuat[batchNo];
        return (tmpData.warehouseNo, tmpData.roastingTime, tmpData.grindingTime,tmpData.temperature,tmpData.packageDateTime);
    }



    /*set xuatKho data*/
    function setXuatKhoData(uint256 batchNo,
                                uint256 distributorNo,
                                uint256 exporterNo,
                                uint256 quantity,
                                uint256 exportDateTime) public returns(bool){
        xuatKhoData.distributorNo = distributorNo;
        xuatKhoData.exporterNo = exporterNo;
        xuatKhoData.quantity = quantity;
        xuatKhoData.exportDateTime = exportDateTime;
        
        batchXuatKho[batchNo] = xuatKhoData;
        
        nextAction[batchNo] = 'DONE'; 
        
        return true;
    }

    /*get xuatKho data*/
    function getXuatKhoData(uint256 batchNo) public view returns (
                                uint256 distributorNo,
                                uint256 exporterNo,
                                uint256 quantity,
                                uint256 exportDateTime){
        
        xuatKho memory tmpData = batchXuatKho[batchNo];
        return (tmpData.distributorNo, tmpData.exporterNo, tmpData.quantity, tmpData.exportDateTime);
    }

}    
