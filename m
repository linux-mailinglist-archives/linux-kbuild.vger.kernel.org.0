Return-Path: <linux-kbuild+bounces-12084-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGPsL/JJvGknwgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12084-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 20:09:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E542D18C8
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 20:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07157300186A
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 19:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE0835C1BF;
	Thu, 19 Mar 2026 19:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="b/BKnRbn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020083.outbound.protection.outlook.com [52.101.196.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B2345CC0;
	Thu, 19 Mar 2026 19:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773947368; cv=fail; b=CbvsULSViME+3TZFDZMTWbUmV4GdHT9mGUcElT2x7ztASLgwxyLdJkP+9iUVwUWOqJOdsdO5oVDOiTl8S66wXAIMq4N6edxF7zGg3LSnmPbN3NU6wsPkTLIs2QWNzWzxwHHdmphnKClYrJLECZAYGW1xShtcnSWfffHSNBWFylA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773947368; c=relaxed/simple;
	bh=w40pFCk8DK6WCm34RnkHl1DeqQSmSeD+6g+Is+OjcVI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=s4+2A4mD+4zkVC5qBIbVFUloWBOf856mqrpizXx+1jgZt2Q/R5wGkqwuM4+kVC2Rk/Nzvw/I0phme4Ixi560z4rgOuoSBDnv7rb0KL48sz7HyufcxZLhNuR0LGeuaHLtC6G69lus8TL1cbIMYR3TfrQNX5HXG3OYh+LydMLALFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=b/BKnRbn; arc=fail smtp.client-ip=52.101.196.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LX917pFDt/7r3UYGfl/KDqEFiH27Ev4qju4w8J3FS/3oJ9wfzhqyCU6GVRj0mogLIXRXUAjVrV9nUkVp0OIZ33QwxPLX1r/p/aOqvs8hzGsc+SKsjrwQm0NUb+Tb/uK5Rpman2bYGDiadcwbAUdtqfEPYo6Dw2gZq7tiaKceMU+qjBiACFRBwadhVXpMaiNKPsS/ClgmMyunLm+d7UhqNgU475c7eQ31QY5BTVeNKlc7763RdkHMZdZ/QbLf5sidE9fHu76PMhKM4jUuf/on01n8tFU8OkmEY0yb8iCWRrO947A3T6v4PikjZD/+W5ggU+6fs/khViKi7fKBQ8ZcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUq5se4j1I2tg7+6arxFzKgLjJ9oy/uyP8K+K9gXfcA=;
 b=IVopjaFQ/R5CrTGhomTJCIv5uOSh9/MfiqAKLk7/sGXGw64c9xSaY3JMp4DGpEdmwl/wKbnBDXL+zvJUYgsGM5rj9CPbIyPrqiUEfoq6Ar+Nuc5EiZg0fA91XgQFFJz/so3KeJ0AXJksB4GwGuNKTHCPTAw6cuCsD/gBcDgseYQIP53jR+3/qIbiuFLH92j4iaU2lREyojb/EL3mv77RD8cRYXIUUQVspdmAisD5XkPWqI5nT6aUaABUdnAJWe1DVTekhV/Q2J5jpO7m4CWiOfHT6ev1/BD6/FoV6a9MwAd25ds4bzT2FZ0FINjLb+nfs3InC0qIMX2IUiaJKGYKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUq5se4j1I2tg7+6arxFzKgLjJ9oy/uyP8K+K9gXfcA=;
 b=b/BKnRbnIuLOAcECWJmzYfx275KJhsvWq5DuUWOWb2Qqd9K0mvtpx/HvDm5V7FUb9kj9nq2c1B4dD8kCDfFGfsY8cEV7y87q0UBw6w7jTOd8ZQXvQ/vjgU/Wr+kbIEpZ+7vitB3qprZJECNNVWcu3Hu94CKgC4/7+jORVrv38lM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7835.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:39d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Thu, 19 Mar
 2026 19:09:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 19:09:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 19:09:22 +0000
Message-Id: <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Rong Xu" <xur@google.com>, "Han Shen" <shenhan@google.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Matthew
 Maurer" <mmaurer@google.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net>
 <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net>
 <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
In-Reply-To: <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0289.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c61242-737c-4143-f359-08de85eb0817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	v5ykQWg8IQ7PFl2SGn50Toy5v9tw+BKMNQrbyDxXe/PpjkAFZ0aAyNL9ZFCi1ppXktxtvXZeibnRxtEazhFKMmxEeAPUeybjRl68HuND1MMUGbL+K5PrFA/yH95ebt06CdiWaevAsWublpsOs3F1XrPZHc4hii9KDaQ/cjE9YX4a593i1vwe+xIlnqJ60Lyvj7ZdEFdyP74R/kmCYJ51CQBRlSC+Y+VEV1aojDvLiNFg33B5nr7pSNqSlthuSENA8POReIe7imipaZqqbScg65TV/fm+yjqWePHzeXgPPt/q+99+gGqdcuU/PXj4ixceqvFmUrQ410JGEyMKYREDjieeIQL8+vh/C5cMI8W4vhx2h73KnmHAr+2qQFAWbg0mkyGZJLlDz98Dz6DCaxJAlLa1VIvTcPIqdAPtSt6oy6EngsVQBr7EUaWjb2qU0D6dwz8wFui6RtQv2GYQeNFYVJwSeYt2X5znboAnmz1z97hX/BWWjbcopmyh3wPcQ/6xnmZ/25L4I3b366rr8ROw21ILdjI+wHSC1lpTyKXScaDKi+k07u/yAvbe62UJXidJLnz1C9dQtJM8yH6xBw5YpAWgvs86Sr0/MgLNqUHc+rU/gPnhsXhuMdwGqDMqL0NqEYaAD5dgGg/oNmlS5YsS330ba8rGhZdT8ydDC/mFKbeOqbAeN212s03RaBswsWwHf+OCDCWBYgHtmkhqhET41Tjm+5Xf+0Mag/+AUuAWdIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEJteHNqc1BweUZqWW1MUUdpNlhEb3lNMXU4UnA3clhPUldDR2x6LzE4OFlS?=
 =?utf-8?B?MHk1bm96Ymd5cmp4WEZ4OUM0QWFxWkVMcVVpRWFCNW1jRHVnY2JBQ3gzTE1I?=
 =?utf-8?B?RzBHTGFmUWpra3YyL2JZNUpGMjI5NXpDUElSZWljdGwwU0kraTFPWW5RMkZ2?=
 =?utf-8?B?eUpjVE9CWU5yQ0JpS3dnakF1UnhIS256WGNqcVVlT3BtU0VCU1hzc3pHZkM2?=
 =?utf-8?B?YWMxcTFPeG5qRFJqNUI4UHAybGxqMzVsL2d5cWtJazNSVzUvdThnZm43OTB2?=
 =?utf-8?B?aUdXaXl3TGJZRnVLUTNtYnU0Rm5RcTF2VENEbFhmb2V0aUc3VFplVmU1cklh?=
 =?utf-8?B?MVFFTURVY2VkSW1rREtlNi9rQ2hUcEdaUHRpWTRUM0pmZVlpTmJmTEFCWldS?=
 =?utf-8?B?SldNbjJ4ZzlJWGdvTURKL2hqVSswcnlScnROa2wzM2lZdWtFVi9qTUQvQUZ4?=
 =?utf-8?B?T3dEdzlZVE8vR0ZqRFpEN0Ywc0s1MlpXaytidnhuL0xIV2FNYzg1RHIySGxL?=
 =?utf-8?B?Q0c4MWRoNS9GUFB0UGVMdDdsN09YaW9aRWZRaXBlc0xlOXhpYy9ZYzRxVnVE?=
 =?utf-8?B?S3o5SDloN1hqSFVkekdkTHFXa3BTeGNwUDM2bnRORWsxbU4zOTB1akFLMjR5?=
 =?utf-8?B?elVBWkZvbUYyeFRPWGNyMmlvcHB5RktTVVpCQk8rd2MzOG9iOXNsUzZBUXFT?=
 =?utf-8?B?VXpoWkZvSDJwTHp3aDRsZUJmNjdGb1hyTFNLdDFHRGZqd21lZlB4dEJWUTEz?=
 =?utf-8?B?clJSMk14YU0ydHhQV2h6MnFxTHhmdEVPa3ZQeW9ZZEpPM21TWUFxWE1kUGpk?=
 =?utf-8?B?b0lEdTdmUXNXMTBncDJHWW5xWi9QOHdub1NRNVdUckVtN21jckNuVGdoNCtr?=
 =?utf-8?B?dEluWTUrYjFQWTNiUldRSkJ0TnFTTXNNV1JWZ2JSQXR5NzJVTlFFeGxlY2wy?=
 =?utf-8?B?V2lnNXVtQ21LWjMxR20yN3FTdkc0T1M4MytETS9LQ3c1NmVJdGZHSVByMVhV?=
 =?utf-8?B?dEpHalUxRXI3c2ZxQTcwU1UyOEpBcWZOMk96OE05a0hVQStvb1lTZFk4eUdP?=
 =?utf-8?B?cmNwb0xZS0syQnFLUWNSaWxwQWlKTHRNVFhFcWJObTdXRzBWL1o0S3lKRWhZ?=
 =?utf-8?B?L2QwTFBlSnJOM3RCaTVCTFBQRmNKKzZ1QkxSZ09LNW1FZFVGamlGM0Fpb0xp?=
 =?utf-8?B?bUhBVEEvU004aENjcndFb0hVWmlXaEpPbFFKbXZFWDloUTEwMkZ0L0k4RUg4?=
 =?utf-8?B?Z2p2VC9hbDEvOTQwWjZGSWhLenVYb3JGcXMzeTRTVmJZZjdtY0Z5cDhjcS9R?=
 =?utf-8?B?NHZqL1gvSm1wUkw2Z3RJcldtRURYRHdlUnlOVEdJdDdMS3RPTFFFN0loS21l?=
 =?utf-8?B?YjgxRWFmdXRWU2t1L1Q3UXkyM2VHSVNXbExSZXEvNjU4V0hFTHZDVXlYMktJ?=
 =?utf-8?B?ckNCbFVGdDl6VFFyMkF1bmhLVlVZR3BDL3o2NGVoNkFadWFpN2lpSXM3cUxL?=
 =?utf-8?B?SzdIbWtpMEN0ZStoeFg0RXgwTDhBVXdqOWhlR2x5dGJiZ1haMS9XbDB6UVNY?=
 =?utf-8?B?djMrblRIdTFoYmpnazNjOUwxdVN5Z0YyUHFwSVNMT0VDb1BDOWNBMmV0aHBS?=
 =?utf-8?B?SURHVlVnTEFLcVUwVjNseExIOEh6Q0gwM2x0dkwzU082TUdVSEpXTHlMaVQ0?=
 =?utf-8?B?amR2MTJXclZTUS9tOVV4d3N0bVI2dzFaTW9VRzlRUVhJdGREVC9lSGdoV0Ju?=
 =?utf-8?B?WmhGYWd5WnJEekZlMUZIbFdjakxjaWxSRFBJcU1aMmcxU0ZMWURtbEdSSW1m?=
 =?utf-8?B?OW5obXdwWXR1NFNLNTFGR25PczhKNFNWc1kxZXBVdVR1NXZLeGIrZmwvVmEv?=
 =?utf-8?B?bDNUajRmdG0wc1FzWGluRFBJRDk5eGZqbER3Q3JvK1VuUlV3ODNjZy83dXZm?=
 =?utf-8?B?TytPWUR4eWFFdlJScFQ0Z3JDcSt1M2VVYTdhbk5iSnpYMUFSOHorUTQ3VlBZ?=
 =?utf-8?B?dVRkaEFmQSswb2U3VUNGVm9MWm5hbXVOeUtmaUVObHppalBpMzV1MHlrc3la?=
 =?utf-8?B?a0VDMU9iNjY1TnEzc0o5TEVGbVM3Wm5HeGgxTXU0Z1prTlFsMW5ieVBtd1Zl?=
 =?utf-8?B?bnRBamt3QndSSWE0aVFvTmFlMkEwZUdLZlJrVXJDMzdNc0kvdGZmSHN0Q2Zo?=
 =?utf-8?B?Nzg1WGpVWDJKWjVOMFEzaEpUbmx0bHdRZUNIWmRxeVNMdFhHc1BmcXZjODNx?=
 =?utf-8?B?dFV6NDVtNDAvV3hqR3hiOHAzdmxiZU5USmFTRUdpbHdvSDRJZkFEVW5FT29x?=
 =?utf-8?B?alVkR1dONkw2QzNudnpuU0xHS1R0VGlxMk5XM212eXNHTXRybFZhZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c61242-737c-4143-f359-08de85eb0817
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 19:09:23.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRFMZRQl7huOSvLJ1s4L7hzd29XPr5CgcW0VCsenW8kDExAnb5hP+MDwIMMEWxqK0L02CC5ZgwlhnaihDBDNRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7835
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-12084-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,protonmail.com,umich.edu,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5E542D18C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 19, 2026 at 4:33 PM GMT, Alice Ryhl wrote:
> On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
>>
>> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
>> > On Thu, Mar 19, 2026 at 12:31=E2=80=AFPM Gary Guo <gary@garyguo.net> w=
rote:
>> >>
>> >> On Thu Mar 19, 2026 at 11:22 AM GMT, Alice Ryhl wrote:
>> >> > This patch enables AutoFDO build support for Rust code within the L=
inux
>> >> > kernel. This allows Rust code to be profiled and optimized based on=
 the
>> >> > profile.
>> >> >
>> >> > This was verified by inspecting the object files and confirming tha=
t
>> >> > they look correct. It was also verified in conjuction with my helpe=
rs
>> >> > inlining series, and it also appears to have worked correctly when
>> >> > combined with that series once one missing thing [1] was fixed in t=
he
>> >> > helpers inlining series.
>> >> >
>> >> > Link: https://lore.kernel.org/all/aasPsbMEsX6iGUl8@google.com/ [1]
>> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> >> > ---
>> >> >  scripts/Makefile.autofdo | 6 +++++-
>> >> >  scripts/Makefile.lib     | 3 +++
>> >> >  2 files changed, 8 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
>> >> > index 1caf2457e585..3f08acab4549 100644
>> >> > --- a/scripts/Makefile.autofdo
>> >> > +++ b/scripts/Makefile.autofdo
>> >> > @@ -3,14 +3,18 @@
>> >> >  # Enable available and selected Clang AutoFDO features.
>> >> >
>> >> >  CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enabl=
e-fs-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
>> >> > +RUSTFLAGS_AUTOFDO_CLANG :=3D -Zdebug-info-for-profiling -Cllvm-arg=
s=3D-enable-fs-discriminator=3Dtrue -Cllvm-args=3D-improved-fs-discriminato=
r=3Dtrue
>> >>
>> >> I get that it's currently named as AUTOFDO_CLANG, but this really oug=
ht to be
>> >> AUTOFDO_LLVM...
>> >>
>> >> The flag translations look correct to me.
>> >
>> > Do you think it's worth having Rust not match the CFLAGS here?
>> >
>>
>> I think the C flags should probably be renamed AUTOFDO_LLVM too. After c=
all, all
>> the perf tools involved here are called llvm-foobar as well.
>
> But isn't it just called this because the config option is
> CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to that
> particular config option. It may make sense to rename
> CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
> this change, in my opinion.

I get that it's an existing config name, but previously it is a correct
description, while after this change it is no longer accurate.

I don't know if there's an established practice on renaming CONFIG options =
when
this sort thing happens though. Perhaps one way is to have add
CONFIG_AUTOFDO_CLANG that selects CONFIG_AUTOFDO.

Best,
Gary

