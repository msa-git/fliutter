	
        <?php 
        require 'db.php';
       
        $user_mail =$_GET['Usermail'];
        $user_password=$_GET['Password'];
        $sql="select * from student where Mail=:mail and Pass=:pass ;"; 
	$stmt=$conn->prepare($sql);
	$stmt->bindParam(':mail',$user_mail);
	$stmt->bindParam(':pass',$user_password);
	$stmt->execute();
	$result=$stmt->fetchAll();
    $size=$stmt->rowCount();
    $array[]=array();
	if($size >0){
     $array =$result[0];
     $message=json_encode($array);
     echo $message;
    }
    else
   {echo json_encode("false");}
        
    ?>