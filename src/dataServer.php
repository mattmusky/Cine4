#!/usr/bin/php
<?php
require_once('rmq/path.inc');
require_once('rmq/get_host_info.inc');
require_once('rmq/rabbitMQLib.inc');

//db functions

require_once('db/query.php');




function requestProcessor($request)
{

  switch ($request['type'])
    {
      case "friendList":
        echo "-Friend List-".PHP_EOL;
        return friendList($request['id']);
        break;
        case "movieFind":
          echo "-Movie-".PHP_EOL;
          return movieFind($request['id']);
          break;
          case "commentFind":
            echo "-commmentfind-".PHP_EOL;
            return commentFind($request['id']);
            break;
            case "commentSub":
              echo "-commentsub-".PHP_EOL;
              return commentSub($request['id'],$request['user'],$request['comment']);
              break;

              case "addSeen":
                echo "-addSeen-".PHP_EOL;
                return addSeen($request['uid'],$request['mid']);
                break;
                case "addFav":
                  echo "-addFav-".PHP_EOL;
                  return addFav($request['uid'],$request['mid']);
                  break;
                  case "getList":
                    echo "-getList-".PHP_EOL;
                    return getList($request['id'],$request['list']);
                    break;
                      case "removeList":
                        echo "-removeList-".PHP_EOL;
                        return removeList($request['uid'],$request['mid'],$request['list']);
                        break;

      }


}


//function end

$server = new rabbitMQServer("rmq/dataMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>
