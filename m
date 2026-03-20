Return-Path: <linux-kbuild+bounces-12110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DnBMAMLAvWmEBQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12110-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 22:48:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB852E17BB
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 22:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90F7F3055FB6
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 21:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437B13E2763;
	Fri, 20 Mar 2026 21:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CwDLsNIA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020097.outbound.protection.outlook.com [52.101.195.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81136C9E5;
	Fri, 20 Mar 2026 21:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774043324; cv=fail; b=UXCgnrdZJB+jQ+KnPo4OOG1n0AQ/xx2jR83/PFmfSCA3kicrC6KEgokERnjSYZCucQrUVb0m6QNBDX+HYlTAylD/Mqg353PAe4stQJqyD6jo+0arzYyARUajWYpqgaFMTchhyBe1rXle7dfTD3Exb+Onb/8ggAhA65Q5zr5/A3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774043324; c=relaxed/simple;
	bh=9YpBxk5gjPLticHmzQP4EptKX0QOIj2RnDOmPzBWCmQ=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Cz1wo/gXO3lvZYB5zsEWHQ5EkDR5dlXLNQnGIXTrbxBTN6WjrGi2cI7HuNxPsVDtLC+xxMetOuXHEVhdS1vJILyy9tuEdvFRKNgkpMWkPMfuqu6tPDlvCJBIdmjrdv7adKy1JaQOMsKEZxHWhS9eDUGHVEAYt2TpPAXIBeUuMx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CwDLsNIA; arc=fail smtp.client-ip=52.101.195.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfKStyj+Y1kqaRvWyzck0Tv8TSqi7RZ2Rh1vB4RWTLYmMIr82hMxREya7OsVe7i7FGBfi9hBhNpwJKI0KR2D6LYxQagPNJC7BAcdC5icqIpuU/1G+PA69Tu5Qlwg9nRheaP1AcKckkzMj98bLBemCaBsUNliWEXzGq2QCBJAPA0jeBdymUjoARCIGouxmFB0GZNHSMU4IeJnFp71ioFJYiSC8GV2w0T2v/SlZ3GWa6mZv5NBT4ItNoP1JbbnrmQ7Qjn4e+v22GiYtbnmEfRqUHKeNuipoVjFB+w0/Vv+KWibfE/JhAsWr5sBUr8NGDkJ07wWcskKma9h8LU6zLc0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YpBxk5gjPLticHmzQP4EptKX0QOIj2RnDOmPzBWCmQ=;
 b=y9cIaPifz+ErAc5nrRSpAfi+ICQ2vNxqYtta6oMbfOitE5nBNvOMxWYT3+yO24CBGekHjgeKC9mzWqDXfaysYhciPPVNXfSEmthYz3U7iHOKkdYNYY/FWCn+0G96vUR4LD1pbqe0Wf7Ai7GUpQhUvuDKxiIjSRgFHmgIsc3+HSbc519MLGpT6aaSRRVj4c3J8/YQ89FiBrQDiH6iSXE/IhVjdNdo93MBIvq/VVMRi9pkyYU0EEIVfyq0Tkmnt/9ET4wivoVALYUi6MQ3c9/qlowSoA7CPgYCM1FP9x8Ceb+7nToxY1elENUouwD6MEMyWtkTmA+/P2LryPzBgWD0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YpBxk5gjPLticHmzQP4EptKX0QOIj2RnDOmPzBWCmQ=;
 b=CwDLsNIA24mXyEIjYYbZF03w30/fKmiyQNHAlfVJqPSfRnebMj87W7/U9vAc1B2nUrphpCUeo2Nz2gljnAf9D90GxLzg5+M0I7yrNcLcn2NdAAgeLjTTpO4N0gtHVZS6uzwI/tPPW88PoYSK3Dnv8CwPH++HES1IJMJlhKKbCVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB9009.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:481::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 21:48:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 21:48:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 21:48:37 +0000
Message-Id: <DH7XVDAUF5JT.2U3SPHXDFH8PS@garyguo.net>
To: "Nathan Chancellor" <nathan@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Rong Xu" <xur@google.com>, "Han
 Shen" <shenhan@google.com>, "Nicolas Schier" <nsc@kernel.org>, "Miguel
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
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net> <20260319235443.GB769346@ax162>
In-Reply-To: <20260319235443.GB769346@ax162>
X-ClientProxiedBy: AM0PR05CA0077.eurprd05.prod.outlook.com
 (2603:10a6:208:136::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de8d1e9-3c5f-4da2-3872-08de86ca721c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ttmGv57OVLU+c2o/2FmguReHAxfqu2GETMlQxAR05WmCeGyAf2EdThizJOLRN6dRBmQCHXJiylKu5D0oio1jo2XmWq35Ma9M3RPKRJGKY/VsTo9shqVSFYG8QAr8EfPjJLbnmUA12sIkxlyzJOoMSimHhJ5zmspSA4pSE+PS7HNe6W3uKZlTjquroWhC3WNL+LF2ufTQ8aD5ju3YLlMWdmJHx+5RdFb07O7UH2jCRBgYnKBkuEtBaGmTnftKN5/G9J+rCYpIgrm/NVy/ro3pcQI5KfDfJ9qfsr1//iDJfsOaOudeG00z4S5+5ddGGcP6J0GYIYbx+pwXIJL6VdkE2+A2B2mnjGcIPseVoRSrUpzat8A9b6kM6eMmA361Dk9L7hib1pMqi9nzLDPTnR55dCMhNhiNvbm3L8MPUQweTE/hu2/6EMtcI4/H70og0JVsXVRURcbglN9cIcSkZJg14otMOR4byi1L2BW6pDmfzjhlcD5zCbd1CoFeFY0HASDCBN/l7eHsXJeXP/qV8gv7wEm+ezKuIsC2sZk8+AAwti9MbJUF6ccbcDlCAYQlFRNGwfZGOCtWkKG0emHfPMQwOBosbeKmRpynuRfeA4UsNah/zXMJkNmzrBSslcixEtn/D69Mbfz4RX+3AZ1XIUtGc0ZIjDcMO+rf7CbyySgnCZWD8d6zPrZMuibQMk1zOgMqTTONVtjryU2tYBmp12NpVCL4Y/vk7b5r+DOxsbeUt2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1hZS0VHTjlXWW9iOW90dUg2MitabVZMVjI0dGR2eEdVblc1NmZ0Nk1MZnJm?=
 =?utf-8?B?eUZUYXVYUW44a0dSVGN3dDBKSy96T01HNjF2NkwrOHNka24vTWZRSFNaTFho?=
 =?utf-8?B?VGF6RFdBQURUaEFDTzI1cXBOeXc2Rzd3elcvTnhETlhmZGNQNnFhV3RuL2Zl?=
 =?utf-8?B?bUtRU0VtMk5oQjNxRGhaK0RLQjhDUGNyMnc1Zmt1OG11dlVDLy9Uek9INlhm?=
 =?utf-8?B?VzVMMFh4aGMrOWQ4eG16NW1mRGlOSFR3eTI4NTFJeHI2ZHpSUmZaZElUZmF5?=
 =?utf-8?B?QWNLcTlJVmcwUkFRT1J5Q2loUkQ1VEREWWhBTU1iQjJLb09nRENJK1F6city?=
 =?utf-8?B?eW5LZzNmRDJLL2JFTFQ2dk1JWERSTklOMUJSWG54dmtLNFg2KzRxbG9aWTdZ?=
 =?utf-8?B?di9XUzNScUlwamFBMllLVFJGTytjY1VQTmpuQVpHbkRlVGh5RGxaWlkyRktM?=
 =?utf-8?B?MllUd3BsVzR1Wi9XcE1XNmJaRXc1SHAzOWo0a1gveU5BdXpNenRVWWRjOEhy?=
 =?utf-8?B?Vm1zeHBycXB2a2JZZ1p4MzhIOHFHeEZIdmdEVmJDNloreGFkZzMra3I5ZThk?=
 =?utf-8?B?RmN3TFptYmdlakRva1ZiaHBwQ2ZTRW0zVEp0SEVKTlh2eDlnd25HcmI0QnBK?=
 =?utf-8?B?NEMyek9KckxEWUhHclNtM1hqRUVkL2UvbFlvYW1ab0tMYVZxTXo4b3ZxV3NI?=
 =?utf-8?B?WG95RVBPcG10STZiKzVXVmVnMUJXeUx3eGVQUWtCOVQ2RnFtallWRjRzb0lR?=
 =?utf-8?B?Mk42TW91Vy9VbFNwVXlSb0l6ajZNMGdLS2hGaWlrK2RuQWQ1cjNhY1ROY0dx?=
 =?utf-8?B?eFVGQy9JUWlFY3hoSVFlUnk0Ly9vM1MvMExJTDAyMTVqdVBVWUE5dFlYUWZF?=
 =?utf-8?B?elRxVklvVlR6RXFyOWltUHVERHE2NXpzTW9FN0NWcmI0NVNXSmtUOWppN0Zr?=
 =?utf-8?B?VVhmZTlnQU9OZ0psSDM1dDIxcURJVTA1eEd1VkJZYnNXODVIRTkwVFRRWE03?=
 =?utf-8?B?WGt0a3l1ZmRNdHZjNGk2S0tGdko3dVIrNzNQdnJUWW5hNnBXZGgzaFdTajNa?=
 =?utf-8?B?MFFRSStSQkdmb2NWeUU4UHJ0YnE3cWM3VHdTcnRXRStmOWlWRVZSS1ZXSTZE?=
 =?utf-8?B?dmdYQUV2K0ZSZEZXQ0k1ci9tQUVSdkd4eDg1TE83bmlyUkVYaFl2ZDFmc2R4?=
 =?utf-8?B?UWhObm4wZWpOa1Q4eUlPK3grR2FSaDZ3WEp1V2dqeElZZTBybytSN2x5RDhr?=
 =?utf-8?B?UFpHQVF2aGFCRk5GdG5ZSnhJRnk1M1VlcUd2Z0kyR0dtRTd2RXhjSm15Wmp5?=
 =?utf-8?B?eHZaLzBKWjlrUXYrNzloU05NeXY3YVFYeG91VzBSUTBjRHV1R3dDMkZFQ1lx?=
 =?utf-8?B?bExSa3dEYnBHd1hEUTRqbWhuZkx2YmFnRkxNb01Zek5kS0RoYjNxWjIwT2tJ?=
 =?utf-8?B?VEF1cWJiM3JwbmwxUUtvaTh2MzNUK0o2OHl2Sy9qTEdzQk9TU2JrWVFDWERU?=
 =?utf-8?B?TVNZOTNUbjVmV01VbzNROXJLRDVzbTBGaUxpSHdKZXFVWjRrMXNEc1V4SnFh?=
 =?utf-8?B?R0Ztb2dUWEdkelI0anV4anMrTTFiZjMxZjVjVElaaVZTYTJMZXIxbkc0Z045?=
 =?utf-8?B?RTBpc0FNT3VCa0tKZGJlQXdxQmtkbnJSYUpuc2JTZzByNEdjY3hsUldpdEJu?=
 =?utf-8?B?Q3hPUXI5KzkvcVRPMHFjVUlaTTlhQktMSmtpUFdQQ1ZYYWdjTGFJcEFFcWJK?=
 =?utf-8?B?aERSWlcyOFN0bFhWWW5za0o3S1lyWTNtNkRqRVZ2b24reW90Qk5INW8vaXdx?=
 =?utf-8?B?eHY0SFdGY3JWRFJPQ3ZrRmNLUUpZalh2bzZKRTR6aE84TkZpK0ZYMG9tSEcy?=
 =?utf-8?B?N1pNUHcyZS9hVFkvamk5TzZRclVQSmVJVnNWZmVjWVNSdUpoOFQyZGNJeGZz?=
 =?utf-8?B?OGp6dVc1ckNKWnNrdkNTT2x5R3M3V1J3WHBHREc3YkJnOUpzZzdlVEQzNHlV?=
 =?utf-8?B?ZjNsSkxYYmo5V3UrYXhnYXZlRUNNeisxejRsWjRmSEl2alNhdEZiMHIyTlNs?=
 =?utf-8?B?K2EwSWZHOU9RRDhsWE11V1FRU2tIdE4wQnJjcW5XdksxYW92Umc5STFFUXRO?=
 =?utf-8?B?V2J3WlhrUlZXMSthR2pMNFU5dnJrMjlEZkpWNkJmcitDdks1Q3o4UHl1a1pa?=
 =?utf-8?B?Mm4wZ0ZwYmJ4Mzhsb0N0SldPY1hEQnBQa29LZTNpWUoyOWllQTJVMFNZYW9I?=
 =?utf-8?B?SGJyYU51amxRY0tLTUtlMkRkY1JTcmNuQy9jdDQxclhSTjFrMkNHTHZRc1o2?=
 =?utf-8?B?YWZHZG9xcFZCV1FSMjJaZTFlWmdJazF4UG5pOXAybFhCRG9JeElpZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de8d1e9-3c5f-4da2-3872-08de86ca721c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 21:48:38.9825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOvBO8GNuo47/f5J71it8fh60nym8pNv2Odsdb+KU60RKFmxpDS7AlqRAesIRLl3f0J/knmwmaxYvkbHp78E/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9009
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-12110-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: 4EB852E17BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 19, 2026 at 11:54 PM GMT, Nathan Chancellor wrote:
> On Thu, Mar 19, 2026 at 07:09:22PM +0000, Gary Guo wrote:
>> On Thu Mar 19, 2026 at 4:33 PM GMT, Alice Ryhl wrote:
>> > On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net> w=
rote:
>> >> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
>> >> > Do you think it's worth having Rust not match the CFLAGS here?
>> >> >
>> >>
>> >> I think the C flags should probably be renamed AUTOFDO_LLVM too. Afte=
r call, all
>> >> the perf tools involved here are called llvm-foobar as well.
>> >
>> > But isn't it just called this because the config option is
>> > CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to that
>> > particular config option. It may make sense to rename
>> > CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
>> > this change, in my opinion.
>>=20
>> I get that it's an existing config name, but previously it is a correct
>> description, while after this change it is no longer accurate.
>>=20
>> I don't know if there's an established practice on renaming CONFIG optio=
ns when
>> this sort thing happens though. Perhaps one way is to have add
>> CONFIG_AUTOFDO_CLANG that selects CONFIG_AUTOFDO.
>
> As Miguel mentioned, there is the transitional keyword for Kconfig to
> handle renames now but I would really like there to be a compelling
> reason for the rename other than LLVM is a little more accurate than
> CLANG. The kernel has never really done a great job of referring to
> Clang when it means the C compiler vs. the whole LLVM toolchain (like
> LTO_CLANG and all its derivatives should be LTO_LLVM since it requires
> ld.lld, llvm-nm, and llvm-ar in addition to clang). Additionally, aside
> from the configuration, there is the user facing Make variable
> CLANG_AUTOFDO_PROFILE that would presumably need to be changed for
> consistency.

If you think the config name should be kept as CONFIG_AUTOFDO_CLANG, then I
think there is no real benefit in changing the variable name.

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

