Return-Path: <linux-kbuild+bounces-11584-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAssHi95qWl77wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11584-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:38:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC15E211CBB
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C76E303C594
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 12:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517053988E1;
	Thu,  5 Mar 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="p7tW/kKM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021096.outbound.protection.outlook.com [52.101.100.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA03845BF;
	Thu,  5 Mar 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714063; cv=fail; b=tJvDo0paOq9SqPwh2qvgHK/tqJPZFxLm0Kf17FTCiJIQkskDitSVPo9fLAwdUEF/bZCTG+kR6P7V/kqx/FEEruTWosBI55X+doOpefLczLXw9TqvMrVUIviG/NKcDuRkwul6Ppwuj8bkmSTKelLVwJ9v4iFW7emXcQx4bEwkFXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714063; c=relaxed/simple;
	bh=UC/umYz48n9l8TZ6gGVo3NMTH0dEeqyS8/NKN6ou1UI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=d8z9DKucpc43H8AaHeJFeLZ7Kdo2EycxTnVWaKXqSsgzUrr8JR3Z5RDAGea3udfGshWYO1A9x5r5k/Llunj4jd4ojU7GPJjEl5nWQLMiuMlhxlnKVQmJVPnYsokcWdxSzoSbG/Ao1899QIsTfaqmZFbh4sCAspmf3piRPRAHrz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=p7tW/kKM; arc=fail smtp.client-ip=52.101.100.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCOWoxCuRr4RH5dISryx9U2WuxEI9FQ3Bt+tZBX7XMGJ8p/EzNy3ZTLKuFQ0dlwhwOnjZ5zEZH3T1npwAls4ciU59fdRqJgMPp2npjKFGYJHkTc6u57/H07QSjRtUrk4ivRQJECe4ZsxIxTWUxMFjBdr+aMKb1acYotY9sO9GUHzosj2aCr/SnuDLTWESiA3S3EljGdLa72xghgKMJHosSNi9215xwdxmWWCGchMRlgX1E7HJIVhJ5RncCFpqRoHPCZyT0RgwSCf9D8Ela7pV21Nqlwui+9ljxekou0qkZFEp5tiOGy/nGZmOlDD4wMBsVzVzfg9NfqcVEUSOsmNlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UC/umYz48n9l8TZ6gGVo3NMTH0dEeqyS8/NKN6ou1UI=;
 b=Y1FZvxSUd9OZyv2h14ONkeEeA2FfCwZ8gxdqQuOLc/kXSiU5GodyoPMbAqfBHg+sgf4BJdwEIDmpwvyYA7TEMEo2TTZx3ltlau/X2bory/kQY7ajSKJh0jrd38xE8Juk9/KAsjsri6XfNIvOzaNEesN/AuizcsZhwsgFANc+PkmyqK5joN0buI3EiuCLnMN8ott7Eww20+KQ4N2/CBsWYmIn55B47gxCLxW3aLb+ussiEe99aq/ey6hHKd8fS7ZY3wvKXm5TSmQPQd1IJ3GMFEjLptl+PfrUmvgpomIquvrDP+Nlwwx2dwW9EkRQMFCV9FvChl810SEyYSJxrBdszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UC/umYz48n9l8TZ6gGVo3NMTH0dEeqyS8/NKN6ou1UI=;
 b=p7tW/kKMGcvIFqI+ZM1MVItltWIClqwXDia0UL9TNBNhtN+g2Vqof+x73rEeQdAGfeRCz7ZyQLKWZXsYiGkg/Ktoik6qWOaslV0MR2xDJPqCnSnw8Q2mNkIVRZg32syYDBBmc3aGEQlMdrE6dZe2U234J6yuET9mtWfLkg6nW5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5739.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Thu, 5 Mar
 2026 12:34:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 12:34:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 12:34:16 +0000
Message-Id: <DGUUOQV5IT6D.3KTG8Y66S5XP5@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Jesung Yang" <y.j3ms.n@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Carlos Llamas"
 <cmllamas@google.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/2] Change Rust Binder crate name to rust_binder
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
 <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
 <aZ3A_KBWFJES0d_t@google.com> <aalf03M58WisOEZ-@google.com>
 <DGUUC74P2D10.30VWI1W6CR6Z2@garyguo.net> <aal2toHN877W0Sf3@google.com>
In-Reply-To: <aal2toHN877W0Sf3@google.com>
X-ClientProxiedBy: LO4P265CA0104.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9feeb6-abce-4f0a-aee7-08de7ab38419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	PuwJNIheoqHMQinA9hxj1CNtvKmYfIt1NCbouuYlhrOLzqyFNp2Rn1FtDkGeuDxkp07rlhZV1RFSlId1N/86ehniH3/27+6KG3HZPJw8p27ruMluG8R/SnUS+aV6pFXSnVN2gS74XliMJb0+4zU8T7rTKF7M6Cdj6Y/ZzKePPRHcBm9kymX/7hBhEB/vOSCBz5w7+LJPGCAboqhkSdpAau/zF+a8JkqCDIj35sK9QPBeub8f/B05mZX/7JP/NP93SJh/I2dzyYvir9VLc9AdiGVOPrbF2ZlXLGvtme/WWAVImRg/6Vnk9xcbJKDfYMZHEKmKr/tlpDE7bHtUyWHTt0DSANaF+jRLK1n+7imeL1qlmzTztCy4ccRKNuE8ft62riqjWEVmVou/09IfABAUmaVfZQ3hlIH9kpxG5Xo6R2SxvxXDeHqu6i5mmk5xeFTotYtfH9f0bEHnhT4ifvgNGL2Zp8JFf5pAQdoS/4xuq4bJuTjLlMQrqmUOqo8R7lPLuJ/LdtIq37vCznLQNMiTzLdY4vJ9G0xS6QZ8fYB0oghj41TLJx9p/Cx1SPe35T8noECUDh8kFV9AgO0WFm0Xp18V/X8OzuI5gr/E+TuYCCSjMtmaWwJZpKbESPUq3bE+phMCEBYtdSwVzQ22MN+NvRDoVZfq8a5LRPdrMRjo6NkBxrn80HmoCxxxC+VEw78Qqxc+loXljdNy+PE7mDiUQ6SGN6n3pY9EkLmxVr2UxJI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXZDRTVVWVBvcXlqMUFSaTFLLzhQbWFnSGMxWVYvU2IwemtSUXBtdjYrVzhK?=
 =?utf-8?B?bkZzTGpiWVIvQ2ZwbHdYL3E5REpzWGtiMXhxODFZdDlFbHF2TGQzVnhtVzBw?=
 =?utf-8?B?OFBSeFFLK3NHaTBxNmdEVWdsdzN5SlF1OHhhbTRJamlVZHdGaS9NYkl2TEdw?=
 =?utf-8?B?eFQ3K09wSmQyOXM2bldPVVNQeXVacndOUFJQYkc4WHo0azVQQkZVVHFEVEo0?=
 =?utf-8?B?cHFVWko3ZDRGZ09FajBSbnBQVlNmWVRaWk9xZDMzdlZOZW9QbTU0SXVJSjR5?=
 =?utf-8?B?bkdtaEwvQnkycHFFOHJSdkM5Unl2czdPbjVVcHprLzBkWUNrQnB1cmtyVnlZ?=
 =?utf-8?B?SkJJTjhGRU53d0FMaXVPQmVkQTQ4NG42YkZ2UEVyTlp3eS9XbUFVS2hZMk9s?=
 =?utf-8?B?NG9sZGt0S2R0V3NnTUJzRWs2MlRzWVBmOWdua2pnZEcyRHJhZi9MbzhIMTE2?=
 =?utf-8?B?TWc3bFE5b2lyWDhEVkV5QmxxNHROME05SzAwOGJHVm92Q2NzaUpXSnhQK0pq?=
 =?utf-8?B?TUVNYU1Belhxc0xCbVFDWThubkdZQmNvV2kxQlU1dko0d2JhS002c2htTUVS?=
 =?utf-8?B?cHczSVBOL3RMZUJxZnM1cEJ3bjE5dEVMLzVkb2NYaUFDS09JRDY3ZTlGUkJ3?=
 =?utf-8?B?K0gwRS9ZVFd5ekVkaEtnSnMwcC9wNmhEVUlnUlpvY25KOXYxaEVNR3M3enZ5?=
 =?utf-8?B?MGJaZ1BTYkpvV2tXOWdiSWxNUEhWY0QwYXRDOENqODY5YTIvcVY1S2RwNFVr?=
 =?utf-8?B?THFiNTRQejczMHpqcnlZOFJaa0VEcHM4cVQvMGJaWHo5Sm9zWE9DVzVpTG9n?=
 =?utf-8?B?cWk0RERaYStndDV2b3pSek9VdGhJbUZ5OEpzMStKalZxZE45RzRuSGxnUWpS?=
 =?utf-8?B?dW5JMU55MENhMVVDTFNDZXZpU243SGh3Uk9ONWxmMGVSZURmV00vTTk0SnAz?=
 =?utf-8?B?Qi9mcFhUOUVEMjRnZEtOTWx6bGptM094T3NBVWx1d0dhSldwalZ5bE1MYS81?=
 =?utf-8?B?WjliS1ZkRXNKZmM1a09ZQUhwUVVtS2dhWTJVeFlLUk1IVjd3NjNiMjIzaGpB?=
 =?utf-8?B?MjFoYlp2TDllRXlLY2RFNWhDTnA3U0NmK1ZJRzI1MklNOEhQeGJUSHI3c1hs?=
 =?utf-8?B?SU5WWGZrMk1NSHFUdWQ4c2xxNzJKVk5XVEZkU3hVb0E3UllhZHYvZlJXWlRC?=
 =?utf-8?B?QmdoWjlnYmJwQWJPdWJ5TUp1T1VnWi8yRUhqd3lBVTBQa1dvYXp3bERLTEtm?=
 =?utf-8?B?NkFjN1IvTlMyOHBkOStGc29vSDg5UWpnNm1UOFVlZEJrZEVZdGZHUnkrZGY5?=
 =?utf-8?B?aGttYWNjOUl3Um95VTRFY3lQUktEbGdKU2p1SWRLcmpmT0ovK01JNWlDamU2?=
 =?utf-8?B?NlJJbWhIdlhWckJYLy9xMXNqODZBNGNWUjVnVi9TTFg4eitQN2Y3Sit4Z3hS?=
 =?utf-8?B?a3k4OHVSQ3lTYmFOelU2R0JsK3VyR0ZrQ1ZleGI0Z0R2VzgzdWQ4ZXJiUExY?=
 =?utf-8?B?QzhuRW1Wa0IvWlBjaURUYTJrd29Vc1paQU5LQkxRR0FRYXNYNk9uYk8xMGhQ?=
 =?utf-8?B?bmwweDdLWlQ2b0ZjbkVwNk1JQnF0NEhFb2U3eEU2T1lSR0UyRFFKWnZNWCtv?=
 =?utf-8?B?T0xReGJYaGMvRWJmYkVNUC9jN2dZWE5tTVg4UWVuQSsxN3drc0tvRVREUVdn?=
 =?utf-8?B?a3E3bldOS2ozUTJxVmRNTHpicVh6YldQeVpqbU9ySGprNE9NTzdkcmYzYTdS?=
 =?utf-8?B?Q3Q3UEU4R08raTAxSnUwWHJwb2dOaVUwQ1hxYllQMDlRUzBEK3NiOE5LaXJ2?=
 =?utf-8?B?bWVDdGdpeUttY25pS0ppSHpQWTZWNDB6ZlZVUVpoQmN6VHJwYTJ3c0duRGc5?=
 =?utf-8?B?Z0VEWlI0bGU5enlsbEZTK2xPZDJxZ1JvVThjaE52VVpZRnRWQnFaVUJLQ3p1?=
 =?utf-8?B?a3NCT2lNQklMaWVwL0N1Qjk3a0NBSjZST2tJZ1AzTVNGQ3Z1WFU5aGRYODF5?=
 =?utf-8?B?T0RWaXRJMU8zNThITEJRdk5WaG1aVGk0NjhQdkJKSUpFRit3cmxoaitLVEFF?=
 =?utf-8?B?ZU8yRzNoRVN5NzF5cEw1VzFpL2w0d2ZOVkFKNW5uUm9tS1ZDY3BnQlRBU0VW?=
 =?utf-8?B?U3NPQU1UUk1mU09BMG1oM055Y1VsRHIxTk92MUVZNU5adzJwWGtNQW5ja1hk?=
 =?utf-8?B?ODFvWjNUM2owZDVhZkp5YjBzUVhrcUMyYllFUW5OMlpCL0FjcGdUYzhBd0Mr?=
 =?utf-8?B?VVZHcThpRU41K3YzS3g0dW1SY0lycGZ5UzlXbE9uQXlOUzNhZHZkai9mbmdl?=
 =?utf-8?B?SCtpdnJ6bDRxMWlTQU5MbENzcHFCRVoxVDE1NFZEcTVVaHRkQzNrQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9feeb6-abce-4f0a-aee7-08de7ab38419
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:34:16.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWn0BUeoYMbkLktfyzr9Gnd+lNncMdqJSxH5K6DmPLJ0ezd9RXTNtm/36QmImo26kaL8XpzKk3lXJSkMZvRpBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5739
X-Rspamd-Queue-Id: BC15E211CBB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11584-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,protonmail.com,umich.edu,linuxfoundation.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[binder.rs:url,rust_binder_main.rs:url,garyguo.net:dkim,garyguo.net:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu Mar 5, 2026 at 12:27 PM GMT, Alice Ryhl wrote:
> On Thu, Mar 05, 2026 at 12:17:52PM +0000, Gary Guo wrote:
>> On Thu Mar 5, 2026 at 10:49 AM GMT, Alice Ryhl wrote:
>> > On Tue, Feb 24, 2026 at 03:17:16PM +0000, Alice Ryhl wrote:
>> >> On Tue, Feb 24, 2026 at 02:24:59PM +0100, Miguel Ojeda wrote:
>> >> > On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Alice Ryhl <aliceryhl@goog=
le.com> wrote:
>> >> > >
>> >> > > Currently the crate name of the Rust Binder driver is rust_binder=
_main,
>> >> > > but I'd like it to be called rust_binder instead. This affects e.=
g.
>> >> > > symbol names in stack traces.
>> >> >=20
>> >> > We discussed allowing to customize crate names years ago, at least =
for
>> >> > dashes vs. underscores, for matching C names more closely and perha=
ps
>> >> > other needs.
>> >> >=20
>> >> > Back then, we decided to keep things simple to avoid confusion (i.e=
. a
>> >> > single identifier used everywhere the same way is simpler, at least
>> >> > for humans) and to avoid having to deal with those dual names
>> >> > everywhere (e.g. adding workarounds for rust-analyzer here).
>> >> >=20
>> >> > I talked with Alice about what she needed here -- could we rename t=
hat
>> >> > source file to just something like `binder`? That would avoid the n=
eed
>> >> > to have a custom name, so everything would still match (symbols,
>> >> > source file, object file...), and it would give you even shorter
>> >> > names.
>> >>=20
>> >> Sure just renaming rust_binder_main.rs to binder.rs would work too.
>> >
>> > I realized that there's a much simpler way to allow crates to rename
>> > themselves: do not pass the --crate-name argument at all.
>> >
>> > Because if you do not pass this argument, then rustc will use the
>> > name of the .rs file as the crate name by default, *but* if the crate
>> > contains #![crate_name =3D "..."], then that will be used instead.
>> >
>> > Do you still want to enforce that the crate name always matches the
>> > file name? It seems unfortunate that it's currently impossible to crea=
te
>> > a Rust module where the .ko file and crate name is the same, unless no
>> > extra object files are linked into the module.
>>=20
>> I think previously a fixed crate name is load-bearing because we need ru=
stc to
>> emit outputs to a fixed location.
>>=20
>> This shouldn't be needed after commit 295d8398c67e ("kbuild: specify out=
put
>> names separately for each emission type from rustc"), so if nothing brea=
ks with
>> `--crate-name` removed, then I think it makes sense to drop it to allow =
custom
>> rustflags to override them.
>
> Are you sure? I know this commit shows up in blame, but it just adds a
> backslash to the --crate-name argument.
>
> I do not believe that omitting --crate-name changes anything in cases
> where the crate name already matches the file name.

Before this change we rely on the crate name to match the file name, otherw=
ise
the .d file and .o file will be placed at wrong location and Kbuild cannot =
find
the output files.

With this change we specify everything explicitly, so even if you pass
`--crate-name=3Dfoo`, the object file is still `rust_binder.o` so the build=
 can
continue.

My point is that you *cannot* reasonably override crate names before this
change.

Best,
Gary

