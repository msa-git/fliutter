	
    <?php 
        require 'db.php';
       
        $id =$_GET['stu'];
        $id = (Int)  $id;
        $sql="select Name,Code,hall from courses where Code in (select courseCode from register where StuID = ".$id." );";
        $sql1="select FName,LName  from staff where ID in (select DocID from courses where Code in(select CourseCode from register where StuID= ".$id." ));";
	$stmt=$conn->prepare($sql);
    $stmt->bindParam(':id',$id);
	$stmt->execute();
	$result=$stmt->fetchAll();
    $size=$stmt->rowCount();
    $stmt1=$conn->prepare($sql1);
    $stmt1->bindParam(':id',$id);
	$stmt1->execute();
	$result1=$stmt1->fetchAll();
    $array[]=array();
    
    if($size>0)
    {
        $array[0][0]=$size;
        $array[0][1]=$size;
        $array[0][2]=$size;
         $array[0][3]=$size;
        $i=0;
	for ( $i;$i<$size;$i++){   

     $array[$i+1][0]=$result[$i][0];
     $array[$i+1][1]=$result[$i][1];
     $array[$i+1][2]=$result1[$i][0]."  " .$result1[$i][1] ;
     $array[$i+1][3]=$result[$i][2];
     //echo ( $array[$i][0]);
     //echo ( $array[$i][1]);
    // echo ( $array[$i][2]);
    }
    //echo  ($array[$i][0]);
    // echo ($array[$i][1]);
     //echo ($array[$i][2]);
    $message=json_encode($array);
     echo $message;
 
}
else{
$message=json_encode(false);
     echo $message;
}
    
   

        
    ?>