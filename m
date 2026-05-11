Return-Path: <linux-kbuild+bounces-13109-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIfhNrmkAWq+hAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13109-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 11:43:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC850B2C7
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 11:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDA71300615D
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 09:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818923BED37;
	Mon, 11 May 2026 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="DfFhhC2n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020128.outbound.protection.outlook.com [52.101.69.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C504C175A7C;
	Mon, 11 May 2026 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492598; cv=fail; b=PGVzcOjDHxtfyEgTqp9oOgxbiPVLaB+DvPnitBCguk1dVqoQV3wGPiS8rB8F2RCUvVbs3EZPOl4KMX0oXOpexb9kb719GveYDBM7v0MxgUVAor/PbAhfcwqRqXQkZS5vNiochDjfxDeXAo6Yahmk8FW2kly66bLoPlReXNOQ7g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492598; c=relaxed/simple;
	bh=rZxUD5hpc/5R7bywoe03pyNGA7rMdo0165SG2DVvb/c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JwwgcE2gty9bhfDgvZDwpazc0hnBML0wY/Bv9BlTUlg0qfbZgBHfiIJVZLkkitfLVnz997V0piZJ0OrLXUSINTk9SwKIc690Rpfp9FeMTWmia6qkjjpHS6dCmIPQ/Ro69gbLsZreABC5MlNwui/E1Aw5RJDWAch2ZUeVyBnKf2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=DfFhhC2n; arc=fail smtp.client-ip=52.101.69.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFaAvo3ggSo/keMKz8ke17SIRKX2hzeJdovZrKFPhQzhEzgZSq783VyReFIYpwdaHp12LC045+qYECp7rfKhE1OICHJDy4j2VpVX0Mi/v+gWaJd+FVFUZ5llodavHPZ4t74Nq/pNAfWVM/1b/bupuBkU4gXRcC72YdWdx+vzN80vi5dhcHT+7ZcTbfJL4aGUZzM7zie277qUT1SDIBuJdaTGGKKQcWcdH6AothhZz6N9JvXHcY+nu23virH7lnct1MlkCcs0NWCJyU86oBQSSMf0EV1gCEE5t2N6bZn8EXRuSAOfF3ZMVESltDN+4flpxjLOZKuNvQWTluzLufES5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8rjLoZzJRIXx4Z0lFrtMVCegxLrvwqUhj0uqbGI0t0=;
 b=Oap083y+PBVt1tAfZRdBKdKF1vtm1iwkoEi6cpQytSzrJLYOA/UC/NlzoNSQzB152quGNiHAlwEPp345SgRN9cxeBiK9jQdLs7k6tqHBrtkiKVC6/kdGaBpily2ElBrg6IvCtBYGwE1H0qD7XSwFBLa9F9mIrvEzooqE0nDalOgyFZKFFfEx/0LjBn0joy7r1YiKR37fO/sTLpAAWmqroZiHuNdwqTib8yJFisQB4s7/mQThMBbAsdIjwwdH3IS3EOuirsziCYcEgpM8wavFQpA2c8CbEcxWTor9F7jlrQ21sZNJngcxjZfxVZQcxjuVZ62ZE1oM6IXjzQFdgZVuhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8rjLoZzJRIXx4Z0lFrtMVCegxLrvwqUhj0uqbGI0t0=;
 b=DfFhhC2nGe8tRuJGTxM+ehdEafQy4RjAgYgOcNFfvBva4YAAn5D1aHfVBI7nh3NMNuCSpDpBNkaXt90mClfv3R2X7LIFYOiUaf1NWGwlli82yaIX0UoQmbbIbdnhT43mldIASP5ZOuUkM8U0V1IXwKolRrJ/e6bJ55lUg/IKS5uxwMMnNu2xX4MM5G8WvooNtSsMTv1hF0zkKr48U6VoeIt0hDLtXXrvAW9OPy9QpIbnFikB6iAT1pMMo6bJaofx/VgDtuM4X2W7PLcvY6ntcekd0nlKhcINXMork7+DFgpDEyJTvsO6w6y890CmKZh1BwjhRPt5YJ3YM12Q3Y6L2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PA6PR08MB10708.eurprd08.prod.outlook.com
 (2603:10a6:102:3c7::20) by AS8PR08MB8393.eurprd08.prod.outlook.com
 (2603:10a6:20b:569::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 09:43:08 +0000
Received: from PA6PR08MB10708.eurprd08.prod.outlook.com
 ([fe80::1999:c6db:dc55:494a]) by PA6PR08MB10708.eurprd08.prod.outlook.com
 ([fe80::1999:c6db:dc55:494a%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:43:08 +0000
Message-ID: <b8c07567-78dc-49dc-9e7c-bf0fd07304d2@virtuozzo.com>
Date: Mon, 11 May 2026 11:43:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gcov: use atomic counter updates to fix concurrent
 access crashes
To: Arnd Bergmann <arnd@arndb.de>, Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
References: <20260422125112.3583649-1-khorenko@virtuozzo.com>
 <20260422125112.3583649-2-khorenko@virtuozzo.com>
 <3786062b-ce93-47e0-8eb1-125bac5dbb2a@app.fastmail.com>
 <ff2a4c49-463d-4d8a-9519-bb51308f7ba1@linux.ibm.com>
 <dca5a1ce-feb3-420a-b452-52707373dd61@virtuozzo.com>
 <14dc05f0-40fd-413d-8082-8c474e25d238@app.fastmail.com>
Content-Language: en-US, ru, sr
From: Konstantin Khorenko <khorenko@virtuozzo.com>
In-Reply-To: <14dc05f0-40fd-413d-8082-8c474e25d238@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0158.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::25) To PA6PR08MB10708.eurprd08.prod.outlook.com
 (2603:10a6:102:3c7::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR08MB10708:EE_|AS8PR08MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 52669301-1aa3-4dcb-00af-08deaf41b54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sMJGvqrIwIa2hp3r/rALEC/s26CCJiVhz1n4FAbmqqnnt9n26sqn7eHsteIdCdvLGiPxsVJRBze0TPM9yuaO9H/5EKy8NX+sHVLwr3zfnrx7PcQCVJ07sIAaiwa3tsxMCaJMzmzcAP1EfFXdx/0z11L7e+avoUMY9WhM1qMHXRmtk9Ia619IDe2sx6U/q9ULsXxuJCrSDBp0Lh1zyvREPZoRJ/ZghbVlToXP7d8GKvRrJVDandsjbE646Ykx/b9pUkAEm/VSwP8iOK9QXTUxP6Rs7Opr7jDjdaUbz2U8zpYIoP+9ZOvnOWOA7BDJeoiRGy5YL85ivvfHp+z8sWMfTXmOJw6PLVnx5fX1xPajfXB5V4v5i0/Rq8SH3iBAHGlTwFNQfBuUyYj9zP5O6TdKyw5g1VJyprKsd+8dG56Zl73qcgWXkOs2w/dlaKBNh40V/PlM8mxIlBc8miMdd0FXxjj0taFeTYQHTbTW3LG2mVd+JwHCE84zBO6QSMUtI9gm1RUtDOJwxXWbJoqXEwWcKPhODQnBfPDGuMQuwBUT33Kiv5ieYR3SPyUCy+v5P5A7zwOguTrl9dqgyJ0QHUR7xjNmuMLV1UmQ77vQLlnpihZXTB7PIhoPcUZe92KVeTszP9iFYKsuMwTBJACvFtrvLN7oQFwXR9jM61t82jv/BtOeNvp9qRjFqLFQ6qi4kY1h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR08MB10708.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXBMdm5Lcmk5YWc5aHBHUzYxRXZHVUxhQkRCbW8rTVM5ZU1mUmtZYTBPcUps?=
 =?utf-8?B?NE05WWcwelc5Q2ZGYytQRENLSWdobE9tY1ZmVjRvNERhTTJyUVBwYlo3MUZT?=
 =?utf-8?B?ZjhmbGVjeFoybXl1cU9GTDhjVURYa2tKM3ZjSTFaZDBOeVYyWDBGNUN2bTNT?=
 =?utf-8?B?WmdFdDA0RWk0clk3dVhIeno2MlVvK3RmU2xpdk04a3V0NXQ3WEhINHhMUFVa?=
 =?utf-8?B?YS95d05ENTJoVE4rUUdUQUk2TVZvM2hQcWZOQkdCUFZtQnQvZzh4d3FENUdv?=
 =?utf-8?B?WEpYRU94eVZHd0ZZOERwR283YUhGek44anN6ZkU5OWFCOFRzU3REUFh1V3BF?=
 =?utf-8?B?Vk5iVEcrOTZYMkhXaUdJanhsWUxzdGtPemRKR0VaUldRalNqZEVmR01TVWhm?=
 =?utf-8?B?Zk1sN1FsTUEzMlpFUWsvWUpkQXhHd01SZ3JDNXBuMVpBRCtkd2ZhSWUySEI3?=
 =?utf-8?B?RmM0TXZZdXNaUUduakFreXJ4S3duSFVnUUF4MGtoMi93YllmSmJQR3FGamUr?=
 =?utf-8?B?dkliS3BTM0ZUZ1BqZ1BPV0RseFJUV2xab2M3K1QrU2J3VWRNZmp0WmdNZGlD?=
 =?utf-8?B?dFVTTm5IWWxOc1lkOGxDNG5FdTZYS2I1YlpVbUFURGxsamQvcThhOU5uR2hn?=
 =?utf-8?B?QTV0dDFZbXpPOElBRzU4QU85S3BEU3NoZHJQbms1c21lV3NnVnJtbDUxVHQ0?=
 =?utf-8?B?M0t3WG1ZcnA5SzZMdzFvRkdacU5IR0svZGVCdEFYdFdCTGZQRTkyNURKRGUw?=
 =?utf-8?B?MklwZVpUUUZ5WEQ4WHpaNHg5Tkt1SFJPVW5hOWtsUjEraVI5MFByQUpIVjla?=
 =?utf-8?B?V2pOSER2V2ptVVMvc2I3c0xPcXIyUC9UMnAyUE9tTEUycE9WK1J5T1J1TGIx?=
 =?utf-8?B?dVNnUlk2ZUh6NXgrYlIzZmhuVVNCY2xZSStDdVI0ejlyOC9pZEJQekFQOS9i?=
 =?utf-8?B?ZTIxNGRTTDd4dHlLUnZwbEUvc0owMEVVcVlWV0o3M0pibVRNMzFGK2dQaWc1?=
 =?utf-8?B?N1JHaDJhU3RXdEhmbVoxVmFlUXhaeElrTWk4bEdVTHNJZG54bTBST2gvcGVE?=
 =?utf-8?B?YUNNbElhM1lhQVhPbFZmcU4xS2hibVZ1d1N5TnNwVnh2VWRPTGF5c052djB1?=
 =?utf-8?B?QUoyZW9YbjhDaEs1WkJRcVg2MGJ1bWtjQU5qQ21SUkdvUytGOVZLTEcrQVlJ?=
 =?utf-8?B?YzVxVkF3WnNwRWQreUU2UEVmWUEwU3pWNlh4OEwxa0p4dkpJK3VVTDdKR0dW?=
 =?utf-8?B?azNrUUtYZmFLa0VsTHV2eUd1RXVSRnQvSEZobE42Rk5xYzRuRWsxakVoL0Fm?=
 =?utf-8?B?dVRaRmg4Um5CNnBhc2R4R1g4T0VHQVRYOEp5WGRVZW1uWXFPYy9NMGZROHdB?=
 =?utf-8?B?UFE3VXVEMUR3a3FSRFRXenBsSUJDVXhLbTdJWXVuNDJDdlkyL3JhTTBoL3pB?=
 =?utf-8?B?bm9nd3NMVFFiT0RKdkdGUEZDYTV5L1orUE45UE9CSEdubkJ6M2IvVW5KQmN1?=
 =?utf-8?B?YW9hN0RSRW5PRENSSStaZWhOVi8vb1Y1OHVvb1FkM1NQT0pUWHJpd1h5Qmcx?=
 =?utf-8?B?UjVuMHZDK0hOdm5DQ1FkMk5rYVpZWkJYR1UzTEFaaVo0anV1T0tLa3hqSTc3?=
 =?utf-8?B?TGsxNDdxN3Z0NElXais3TGFQREhMQk5OUDY2ak1GR3dvblBQZU80K2tRYWND?=
 =?utf-8?B?N0NMbDM5eVhyem8wbGZ1V1N1eXJFajBRV256RGNxZkU2SjF3Y2xDWHFXUS94?=
 =?utf-8?B?TlVqWVRGbXNFQ0FmQnUzNzAra0NjM2h5RUNMNzhPcUk3Yk1XMDl1Vm9sTUhQ?=
 =?utf-8?B?dW1HTEdPZ3pkREsvcGMxRlltNS9rUWlMK2F0Qk1rd2NnVEJxdHRPQnFLeU1K?=
 =?utf-8?B?YWJCM1p3S0xTSG9aQ3R4TndFTlI2U3hvUVVieEI1VEhEc2xFQjk4ZDh3ZmVP?=
 =?utf-8?B?dFFKYUxLOUgrMGdYUmhLWEJSUkg3UWN6Q2czL2JVVkxnNTUyVm1UaVFqdjdq?=
 =?utf-8?B?V0R4OXhKVkNJTFdFaUNORURCcFN4SWpheVFmRnRqNGdrbFQvb2NGVXZ4M3pp?=
 =?utf-8?B?N3BYLzdBWVkzaGZXZGlMSTJBams0WDZRZkI4eFVVWlEwUFRzeEFjL0t6YStq?=
 =?utf-8?B?eHV0NGliTEdCNFpwYkg3aUxyVmNVM1lJVlBQOHczY0MvM3pySWNBckc4RDFU?=
 =?utf-8?B?MkxoRVZpcVhxUUZkVmIxMHcrMXU4VnQ3R0NWc2tSRkJ3bDVjM0ZPUXVFbmEx?=
 =?utf-8?B?eldqWXJvRkFKTVJlMXpuMTJCb2J2NERXOXFnRi9pVGtXUjVmTk5NOTV4YjdQ?=
 =?utf-8?B?dVo1OGpRUFZmT0pRTElCN3lacktyYytRUENEZkY2T3FkQkk1eFdIQT09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52669301-1aa3-4dcb-00af-08deaf41b54d
X-MS-Exchange-CrossTenant-AuthSource: PA6PR08MB10708.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:43:08.5198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfkMIFIayjFepONEdZ+hrS1qeIdc9RykygNLvA00BC0b9Jaq2EgtQoucZtCqpwBu6oTLPT9VNNguF8fCiIBalg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8393
X-Rspamd-Queue-Id: 61DC850B2C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[virtuozzo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13109-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[virtuozzo.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khorenko@virtuozzo.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/9/26 17:14, Arnd Bergmann wrote:
> On Sat, May 9, 2026, at 13:50, Konstantin Khorenko wrote:
>> On 5/7/26 15:31, Peter Oberparleiter wrote:
>>> On 28.04.2026 22:56, Arnd Bergmann wrote:
>>
>> So this might actually be a GCC-16 regression in codegen rather than
>> an inherent architecture limitation.
> ....
>> could you please share the two .config files that triggered the link
>> failures (the x86_64 one with __atomic_fetch_add_8 and the aarch64 one
>> with __aarch64_ldadd8_relax)?
>> That could make my life a bit easier. :)
> 
> I've attached two configs each now, see what you find.
> 
> I just realized that these tests were still using a prerelease
> compiler, so it's even possible that the gcc-16.1 release is
> clean. I should build the next set of cross-compilers soon,
> and will be able to retest then.

Hi Arnd,

thank you for sending those configs.

All 4 previously failing configs were successfully built with the new patch applied
(on top of 5d6919055dec (tag: v7.1-rc3, origin/master, origin/HEAD) Linux 7.1-rc3):

   * 0x5AB716A4 - arm64, UP (no SMP), GCOV_PROFILE_URING + GCOV_PROFILE_RDS: build OK
     (make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-)
   * 0xD01A6C73 - x86_32 (i386), SMP, GCOV_PROFILE_URING + GCOV_PROFILE_RDS: build OK
     (make ARCH=i386)
   * 0xD21DABF - arm64, UP (no SMP), GCOV_PROFILE_URING: build OK
   * 0xFE5738DD - x86_32 (i386), UP (no SMP), GCOV_PROFILE_URING + GCOV_PROFILE_FTRACE: build OK

Previously these configs failed at link stage with undefined references to __aarch64_ldadd8_relax 
(arm64) and __atomic_fetch_add_8 (x86_32), caused by 64-bit atomic operations inserted by GCOV 
instrumentation. The new patch resolves all of these.

Note: the original failures were reported with gcc-16.0.1.2-nolibc cross toolchain;
my test builds used gcc-12.1.1 (aarch64-linux-gnu) and gcc-11.4.1 (x86),
but i really think this does not matter here:
i've checked in all 4 cases -fprofile-update=prefer-atomic was not used - try-run fence worked fine.

And when i've built the 0xD01A6C73-config switched to x86_64 (# CONFIG_X86_32 is not set, 
CONFIG_X86_64=y and CONFIG_64BIT=y), the build passed and -fprofile-update=prefer-atomic was used.

--
Thank you,
Konstantin


