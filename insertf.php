	
    <?php 
        require 'db.php'; 
        try{
        $id =$_GET['id'];
        $loc =$_GET['loc'];
        $code =$_GET['code'];
        $date =$_GET['date'];
        $lec =$_GET['lec'];
        $att =$_GET['att'];
        $att = (Int)  $att;
        $id = (Int)  $id;
        $sql="insert into attend values (?,?,?,?,?,?);";
    $stmt=$conn->prepare($sql);   
    $result=$stmt->execute(array($code,$id,$lec,$date,$loc,$att));
    $message=json_encode($result);
    echo $message;
        }
        catch(PDOException $e)
        {
            echo json_encode(false);
        }
    ?>