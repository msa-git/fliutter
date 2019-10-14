	
    <?php 
        require 'db.php'; 
        $name =$_GET['name'];
        $sql="select * from halls where  name= '".$name."';";
	$stmt=$conn->prepare($sql);
	$stmt->execute();
	$result=$stmt->fetchAll();
    $size=$stmt->rowCount();
    
  
    $message=json_encode($result[0]);
     echo $message;
    
   

        
    ?>