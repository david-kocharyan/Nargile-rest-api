<?php
require_once "./vendor/autoload.php";

use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;

class Firebase
{

	const IS_ANDROID = "android";
	const IS_IOS = "ios";

//    send notification

	public static function send($notif, $event = null, $id = null)
	{
		$serviceAccount = ServiceAccount::fromJsonFile("./system/credentials/nargile-253210-firebase-adminsdk-9k5sd-7a61678992.json");
		$firebase = (new Factory)
			->withServiceAccount($serviceAccount)
			->create();

		$messaging = $firebase->getMessaging();
		$data = array(
			"title" => "notification",
			"body" => $notif,
			"click_action" => $event,
		);

//  Notification for ios versions
		if (isset($ids[self::IS_IOS]) && count($ids[self::IS_IOS]) > 1) {
			$deviceTokens = $ids;
			$message = CloudMessage::new()->withData($data)->withNotification(Notification::create($notif));
			try {
				$messaging->sendMulticast($message, $deviceTokens);
			} catch (Exception $e) {
				var_dump($e);
				die;
			}
		} elseif (isset($ids[self::IS_IOS]) && count($ids[self::IS_IOS]) == 1) {
			$message = CloudMessage::withTarget('token', $ids[self::IS_IOS][0])
				->withData($data)->withNotification(Notification::create($notif));
			try {
				$messaging->send($message);
			} catch (Exception $e) {
				var_dump($e);
				die;
			}
		}

//  Notification for android versions
		if (isset($ids[self::IS_ANDROID]) && count($ids[self::IS_ANDROID]) > 1) {
			$deviceTokens = $ids;
			$message = CloudMessage::new()->withData($data);
			try {
				$messaging->sendMulticast($message, $deviceTokens);
			} catch (Exception $e) {
				var_dump($e);
				die;
			}
		} elseif (isset($ids[self::IS_ANDROID]) && count($ids[self::IS_ANDROID]) == 1) {
			$message = CloudMessage::withTarget('token', $ids[self::IS_ANDROID][0])
				->withData($data);
			try {
				$messaging->send($message);
			} catch (Exception $e) {
				var_dump($e);
				die;
			}
		}
	}
}
