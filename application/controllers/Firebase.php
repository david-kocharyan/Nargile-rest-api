<?php
require_once "./vendor/autoload.php";

use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;

class Firebase
{

	const ANDROID = "android";
	const IOS = "ios";
	const IS_ANDROID = 1;
	const IS_IOS = 0;

//    send notification

	public static function send($notif, $ids, $event = null, $id = null)
	{
		$serviceAccount = ServiceAccount::fromJsonFile("./system/credentials/go-narguile-firebase-adminsdk-xojjl-5849f0c8a3.json");
		$firebase = (new Factory)
			->withServiceAccount($serviceAccount)
			->create();

		$messaging = $firebase->getMessaging();
		$data = array(
			"title" => "notification",
			"body" => $notif,
			"click_action" => $event,
			"action_id" => $id
		);

//  Notification for ios versions
		if (isset($ids[self::IOS]) && count($ids[self::IOS]) > 1) {
			$deviceTokens = $ids[self::IOS];
			$message = CloudMessage::new()->withData($data)->withNotification(Notification::create($notif));
			try {
				$messaging->sendMulticast($message, $deviceTokens);
			} catch (Exception $e) {
				var_dump($e);
				die;
			}
		} elseif (isset($ids[self::IOS]) && count($ids[self::IOS]) == 1) {
			$message = CloudMessage::withTarget('token', $ids[self::IOS][0])
				->withData($data)->withNotification(Notification::create($notif));
			try {
				$messaging->send($message);
			} catch (Exception $e) {
				var_dump($e);
				die;
			}
		}

//  Notification for android versions
		if (isset($ids[self::ANDROID]) && count($ids[self::ANDROID]) > 1) {
			$deviceTokens = $ids[self::ANDROID];
			$message = CloudMessage::new()->withData($data);
			try {
				$messaging->sendMulticast($message, $deviceTokens);
			} catch (Exception $e) {
				var_dump($e);
				die;
			}
		} elseif (isset($ids[self::ANDROID]) && count($ids[self::ANDROID]) == 1) {
			$message = CloudMessage::withTarget('token', $ids[self::ANDROID][0])
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
