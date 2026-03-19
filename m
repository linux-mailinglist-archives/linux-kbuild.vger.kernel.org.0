Return-Path: <linux-kbuild+bounces-12075-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAWeIK7fu2lXpQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12075-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 12:36:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E4F2CA64F
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 12:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33CB931B85C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 11:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F46370D4C;
	Thu, 19 Mar 2026 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="bfDnAGdT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871B735BDC4;
	Thu, 19 Mar 2026 11:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773919884; cv=fail; b=LXaZbH5d5s4YLb7+d84bPEbz3GXw9qN7HOt0olMKvbEf2nqhFHSBOShA5HcEdpHeAGjRDK+VjPiEvQ1bEbS+WxGBE3G+X79CWblxyd/b8FV9alBBxLalHUAF8XHVm88qXvlkP+1sxyU8xaNDeSdmIvCrLKhOXkhMOuwuW1FO8K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773919884; c=relaxed/simple;
	bh=6csTG5RxKo0Vi0w1kYzd85I3NNzeNJcf/iMZPnaxTlM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ZP1APUSefeObkoSYPxyj4l/Y5np+18AqSf86yiAytS1QuJidcr5habxDc6bPNW0ZlFqcoc9zFhZkwNuwXTgNCjkxG2I74G80+1gLt/GXX+K6BIAmCNrhY2u2RqWLaLFRcdWRYvxc1xIZEbBDwdnHOdYm8B0ncLtjvZ/a0J75iyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=bfDnAGdT; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gjnc1U8WhhmMfA17scraJz9yAuCeAe86vjw/l+wcxkWBYnep+ZwVwHzKh3GZ8sRmsUxYqp0K+zAaFJIOQRPyTnlBOv4+YnxlaVIdxyjT7skPkdnZM/tw+ic6F4fPFB40b+hf2Fp/yntmzvZYTRE4/EEvB7D0ebhx9ZyzUn6P09Rx/Q7mUmA1JxJtebA3ZCVblRjedDz2CRwtUlyb1m1RtZBSmiwtfscYfB/rwcL5TouIfw/HL4/PPhxpcELAHZ5t0bY16yAbiFaZ1PSK0h6YUvk9Epu3//ZKNUNw2kxzgOhD7qvYhKlRjhq+zh59VQ/icxmXzwA5P3Wa1eqmWlTlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDdsTxFH6jhSfs1jJwiFP/bF1ZqKckpcfv5WuSuLANk=;
 b=skuIz0lQQs2Tt9/D6HC1MzzoFJ+xUSoc2Lh7m/HP/fHrTCFW80eRbGKzi44f18EChQebUjKCuCgR62uVY5t4if7kGUvMEhaeBD4+G0jHYSaM1qDj68ilalJzQLtQDknmz2UEZh1bPxGL9B2jAeG+fKJI9R/NtcAEwER2YxfjATg/b/vO569MN+NxpHNNL8zvweSpZT+Aei/E9Y53bMDVvaQusAJmz7M4FNoNuMM37WEQ/ADBMUEvOmKSjmU7lMC7ea0cc274SvncO2dbkYoOY0EM4u3z8QQ0FAl/gLNs7h9NIeX5UodLZHQ3icH+ouwhffmOgNkM24Ek8mChu070VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDdsTxFH6jhSfs1jJwiFP/bF1ZqKckpcfv5WuSuLANk=;
 b=bfDnAGdTXwsa2YoVBMApIabb5MxAzZZwxvaICrkHT+1ox24+My+rQpeVjRwh5q/8+aWdQlUnI85qHP9XUDPgUsORoRFDjivWeNoi/ovvNa/yDgVegLlMCiB1oEQQDLy9F895UKRqcdGUbUPTZqzzE5sdRSTrnhzHMclD/s30zcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2541.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:124::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:31:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 11:31:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 11:31:13 +0000
Message-Id: <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Matthew
 Maurer" <mmaurer@google.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Rong Xu" <xur@google.com>, "Han
 Shen" <shenhan@google.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
In-Reply-To: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2541:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e39a94c-13ee-48b3-7317-08de85ab0759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	9rRibbQhbjSbM4RT9aLflUe9Drt804C5fpfiIYUsIlcyptVTWG6FPjZfk9EatkHK7IpSUSuhmSi44x+6KREUuvJL2eR+PhOHik7SbgeHO9Crfi7BRZwX7XU4uyxFH/KBEBJbyk7HtrfcKjBslID/rOyuMsT47NFCZJ9osAAOZM+85geSynNU0H7G97X16vCsXqkntcg+zUXf+tznYVuVhpv8NnRHrW+XMDL0rb+7IHrBc7HHFdD/i7jdJCOrTwFiXLkuI5DlkYVYttWI9nYe9arx3ve+zCRMrB+KQp9GKbQPVAGg9S5C9WyoNNcFJRPnwPHXP/GdibfurKFiZr7M07AB7/3ys7UuuHGG0KwanE0lu2aXcIrd5OkCoMV69l77YSCl/OWctvJXuWBTjAK2cwoL7qypaDev2Qexn8pAhKRedEThcJpd6QIG001ihvuwEfTom3SKch7pWU8eZVhEbVx4OuMJBeH0uwaYrH99YGFbJPmslDPPY721QqjY/T3/w638WgPdHHl8GMJKFtXEpVFtPl5tMh5mLsJPOxsMlbd0HqGwE3rpeHkjliKxIAkMizqjMDm0tnn+pA+DBflwDCOMvDgQYIXIitULw/cE4XLTEvJxjmF0Jf0nSQJdzB4sQPf9pQkuf/0RXtkgQAsHXKSgc+pa4dobJKMccRTbxqyKz63Qwj1NhR/qx9sUW12e6Q8P6XJuvIZSHDKtCYGC1qFZZZFtR41u/tIc/okQLcw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFdXaGhnaVRTZHQwajlOelc3R1RpUFg0RVlhcDRmRXcvRGlLQWt6R3laUWJT?=
 =?utf-8?B?dUt5ZVZCSm8zbmJib3VSVXF3Y29UWFZ1NkpoMk1ITnBPSmNValNoK2lSNUty?=
 =?utf-8?B?dXlsMlhmbFdJRS9YVGttaFFLVE1sQkI4Y3VMRTV6c2JnUzdMZkhMY3VpVTNQ?=
 =?utf-8?B?bUEwc09vYkRqK2QzMDBTVEZQZ1Z1TFVuZFRLdEcvTlVQT0lZMG5sMjdSemk1?=
 =?utf-8?B?Sm43dHRnWjk1THdyMWUrMHlSNDdlRm9QMDJSNUpSNnFHbVlnMk9MQm9uWVV6?=
 =?utf-8?B?b05od3Ira0FVVlFUS0dhbGtqakxpWFV2ZkkwY3JRZjNDN1I2U2JualZiV2dY?=
 =?utf-8?B?NndXWFczSlcvY0lRQnpla2dsRWNDN3pybzdyV0xjQnl1ay9XNldFdDJkc2NL?=
 =?utf-8?B?eG15Tk82K2d6T1RpM29GK0N6ckNPM0IxVGUyOFhQWURFb2hLd2ZwNFQ2eVVw?=
 =?utf-8?B?ankxWmMwMyt1OVA1REFRMkFGNzFZbEQ3VmxxcHVIUEkzTzJ0Ymt3OU5MakIv?=
 =?utf-8?B?V3Z0UkRwS3JmQzVkc1dvcGFGV1BQdFRYVVRDZnM0WjNPRjh2R09ITElCL2dm?=
 =?utf-8?B?SzgyZ3VGN2szSkNqRHVKUi9oNEZ3em02M3NxSTNTaDluUmVqRkpZUjAyV290?=
 =?utf-8?B?bEQxbFY5V25NNFA4eGMyOElmazdadmwwZEp2YlZCajhxYXIxVHUrQ3NQSEhq?=
 =?utf-8?B?cmFQc0pYMTl4akFaL3FHemZmU2lKMHRad09CRUhGTmJJdG9INld4VHZ0K1dR?=
 =?utf-8?B?YTgwMXZoU0c5K29TVjd1VUJERWRnVVpmSkptYkxza1U0SmJad0dLeTB4Q0pi?=
 =?utf-8?B?dUNXOXRsQVpOR0xhNVVvbmR4dHJqSG0ycm01Y3AxdElXeUZvenVFcHhrbmxt?=
 =?utf-8?B?ZGplc1hEUTRTalVNWmFtMmxIL1QrZHJNcjRkZzdqUzh2RkJoZi9XM1Y4NUhR?=
 =?utf-8?B?ZlhJTmhBK3FPNkhtaXpKWFlxZXdmVVpyNWdrRG9OdUFCYnQ4U3FPRFhOai94?=
 =?utf-8?B?T2xOSXFIeUQxejhWVm5QbTVOU3JIVWhYSEhFTmlPRWpaOFF3blVCWFhQaW96?=
 =?utf-8?B?WjJSWCt5RFFrTnJKa25Od0IwWjJFTjJ4VDJjSEpwR1huWVhxckNlWXJSYmlz?=
 =?utf-8?B?cmlxRiswbTUzZXRidXBJRHNtcHhLeEZrMTVDVXl4dERhcHpPSkZLSUdhRHp1?=
 =?utf-8?B?eFpTZTBOTE1JSDlKaHpYT2gvZ0lOcTNaWGZrK2NtSGV5RFNRcjVLSXFXKzZJ?=
 =?utf-8?B?WGhEenVIMll3VXJHNkgweTRFVnhycGc2T1VJSFZNRUhaUStvRnhXUTRGMXpX?=
 =?utf-8?B?T1JBT0xyamtiQW1rdEgyK2hlUm1yMVdXVHBkUThjM09CK2t2ZFRoaUdpa1J0?=
 =?utf-8?B?dUNGclBMblZPYWVpVkRzR21zN0plUHV6RXFFeVpERWI1Qkc5ekU3M0paUkpH?=
 =?utf-8?B?NkhKSHRKTFlCM3d4Zk5mdC9ZaHFnOW0vRlRiWDVlVTVrR2h4N1pSYThreGtr?=
 =?utf-8?B?cEV0bFIvTDZUdmdDSEkxQVMwMHI1THZjclgvMWtTSmlOaFExaHp0QjlUbzRD?=
 =?utf-8?B?aG84bW51TmlmejVzME5nakU0dE03OXJvbWcxU2tNM1hlUHB1KzRibnMvUXNV?=
 =?utf-8?B?eHNieldtdjU1eHVYRWEzR2F6V2FrT2FMUVlSdFovREE3WUs2YXQ1N01UTkwy?=
 =?utf-8?B?T2IrZmkrMlVza2pUdTJJZi9mdmVCR01jckJsVmZTWTJaZENiSkk1ekdkU25j?=
 =?utf-8?B?bS9KWjgwQTNaK2UvS3o0QndCTWtJekl0azloOEZ3M2VKZlorRTdJZktRYTB2?=
 =?utf-8?B?cEJVZmlxQ1NUalFNOVlEcU9VSmNjOHVGSk53TXlYZ3JudXNaKzdQSTBrTHdt?=
 =?utf-8?B?UE94K1ZoRUJYbTVYNlZtSkNDVm81aW9uaVhFVVRzWW1RUTVJTzNsWUhtR1Vv?=
 =?utf-8?B?T1VTQjVBSjlSMGdsRzd4eExUZ0tMdTIrSzNuSlQyK2NwUCtaSUo3L2dzNkFx?=
 =?utf-8?B?a2lJclgremduUDMzelVmUFBKNW1ZdVNBN1UxK0tSV04vOVpBZUI1VmpXRW9C?=
 =?utf-8?B?eHhQVklOUEd5ZkYvQU90TVhaVGxWYWtXOVByczZXZVNqUExCOXdtTmR5cFVS?=
 =?utf-8?B?SkthSDlFVGM3Wk1VQUpXdVN6T05TWFdmc09sRGQyRW5NaWRCUjJzZzI4WkxY?=
 =?utf-8?B?bzR2YS9BVjRtQUUrUTNxc1QrZ2k1UG51NllWbEZUVk5qRGdUWldiNW9iRmpi?=
 =?utf-8?B?ZElOdU1zaERuV0FHbWkrVXNIUHlhOTlBUjlRaWdtMUgxeXBpeTY4S3V0bzFQ?=
 =?utf-8?B?cGJFK2VRSUhzamVhZ1VmN0pTeGZkRzRDc0MvdFlvVlhkR0ZyWnFuZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e39a94c-13ee-48b3-7317-08de85ab0759
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 11:31:14.3474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NyTC/TG4+7G1KSAhGddSLebfAlyr1B6yzKyFyhQ0GVUl/bLtZ7AU++LRnI2hQp4Oj8HpXXMWP4ck55B2ueAyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2541
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-12075-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,google.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: D0E4F2CA64F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 19, 2026 at 11:22 AM GMT, Alice Ryhl wrote:
> This patch enables AutoFDO build support for Rust code within the Linux
> kernel. This allows Rust code to be profiled and optimized based on the
> profile.
>
> This was verified by inspecting the object files and confirming that
> they look correct. It was also verified in conjuction with my helpers
> inlining series, and it also appears to have worked correctly when
> combined with that series once one missing thing [1] was fixed in the
> helpers inlining series.
>
> Link: https://lore.kernel.org/all/aasPsbMEsX6iGUl8@google.com/ [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  scripts/Makefile.autofdo | 6 +++++-
>  scripts/Makefile.lib     | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 1caf2457e585..3f08acab4549 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -3,14 +3,18 @@
>  # Enable available and selected Clang AutoFDO features.
> =20
>  CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enable-fs-d=
iscriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
> +RUSTFLAGS_AUTOFDO_CLANG :=3D -Zdebug-info-for-profiling -Cllvm-args=3D-e=
nable-fs-discriminator=3Dtrue -Cllvm-args=3D-improved-fs-discriminator=3Dtr=
ue

I get that it's currently named as AUTOFDO_CLANG, but this really ought to =
be
AUTOFDO_LLVM...

The flag translations look correct to me.

Best,
Gary

> =20
>  ifndef CONFIG_DEBUG_INFO
>    CFLAGS_AUTOFDO_CLANG +=3D -gmlt
> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cdebuginfo=3Dline-tables-only
>  endif
> =20
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_PR=
OFILE) -Zfunction-sections=3Dy
> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
>  endif
> =20
>  ifdef CONFIG_LTO_CLANG_THIN
> @@ -21,4 +25,4 @@ ifdef CONFIG_LTO_CLANG_THIN
>    KBUILD_LDFLAGS +=3D -plugin-opt=3D-split-machine-functions
>  endif
> =20
> -export CFLAGS_AUTOFDO_CLANG
> +export CFLAGS_AUTOFDO_CLANG RUSTFLAGS_AUTOFDO_CLANG
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0718e39cedda..eaddf6637669 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -123,6 +123,9 @@ ifeq ($(CONFIG_AUTOFDO_CLANG),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>  	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object=
)), \
>  	$(CFLAGS_AUTOFDO_CLANG))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object=
)), \
> +	$(RUSTFLAGS_AUTOFDO_CLANG))
>  endif
> =20
>  #
>
> ---
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> change-id: 20260309-autofdo-8d01e7977fed
>
> Best regards,


