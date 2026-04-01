Return-Path: <linux-kbuild+bounces-12517-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKC3IHkkzWlkaQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12517-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:58:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8437BB32
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9896D304E6E2
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CCA43D51B;
	Wed,  1 Apr 2026 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FoFDH+k3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021103.outbound.protection.outlook.com [52.101.100.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4829AB05;
	Wed,  1 Apr 2026 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051053; cv=fail; b=qEL2v7oywxx+eiy2O85Gc1cjzx2+021ye0UkPnBa/TYKEojXea9Fxe84g7rXR0idsOvOSmyZZlpxHIWMCQuki9Ss0t4Oa/UeZTKQvqdZi95oD+4N4602XnSa3c3zPWxHI0xjIjv2JvoUCrQuSWi7aI3x1Wh5+1adJ/Nw/kt3FVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051053; c=relaxed/simple;
	bh=bPSvE614CTPRZR9nlVO2vddS96nks3xmrBWGJAPuzt0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=S35XqD2i3OWtzCle1P3garLS4q5rd/vu5AR1d3gN/4lHK67JpxA7rzRCy3FxiSq/8k2d0HB2+DFj7ZTVMJGT5nRoFGiw+L+/vIhIx7qixx4yLPkYuVvI0SbzqidCZ3zo/X0MCUBSZRnVnF73JLgls4b2aXR/Tx/RJ7g4GnyfbAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FoFDH+k3; arc=fail smtp.client-ip=52.101.100.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nmm2x4HpWC8bXMReExX6oLjACA+Ntwkmzfw3uI3z4+txNe9s27Ph6vlMqKpAk3IgBh51eWjtrYd9GU22DX5bBxgiNjb8YqCtmKUaQ6XdVpaXI1LdInXzEAHXmTEMMJq0M0Wp77LnhBzokCHe8zEVNfK7R0yI4fQ7mxRKqrdR8IedUVMawrooEciTbAh2pFS1YtkAKYaHzSVftLOgRC3pOyRvG1OwpaGYq5mK5OLaFah/2wKZ41q5I7WGiPH+o6d+7hBDD6jLD19wphYsRnCfGcfypd9wd6FQ1vKMB8dufMY70/PPAWz43UqNcsV7XCOIkvf56HDxM5M9a9XzC1/RKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjRn4EzOh7HkP7tfYe2eSZejWt9ikfWqt3074xu5+kc=;
 b=phvsLXqkDiYRpB0j9AcIZ0eWZo8zY+X3P+vNiOz19COmEvoyiK9HFa1XsYE+fCiv9SQDiNIxjieEceDyQesn9wVESlwSPXyPTF00je+SDeZxpxFm7QZxvG/Mey+Tt7quOeoVbajBTKG2nhIBbj5V91zk9MmjBwiIPZ4ysUBb5kmzUbieH6Cp1zwPp/XxE22ZAEdWtCPG2ifRRN6vmeF1n0poWe8CbH4Kn7437xTBoe5mdjUeihF2qyEFxBWpsEj/n5q6eFSWMglLxBkipkHfJYJYb+X7N9DZmK8XaJbkpbr132pHemSYfF8C0oFZnCPyZkNgrYmRZnXwJBoCu4iruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjRn4EzOh7HkP7tfYe2eSZejWt9ikfWqt3074xu5+kc=;
 b=FoFDH+k356z7LfNUDRMDzJYA9rZWq0PnRcZpIAHiDLUXomGrvYvoFTviVhhW//ycOqqNGzSzQT2ZHTyUJqcrZAyy1dg6QkhQjcQeOpf340cYGaVKTOcSXGEioDpEqX7xGstKZYCrGz4oI9/sRe0aZSpdi/Ea5mRQ8SNCZzPXHEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO8P265MB7687.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:44:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 13:44:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:44:04 +0100
Message-Id: <DHHV2WHMUS8E.2UVRYJW75PXUG@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 05/33] rust: remove `RUSTC_HAS_COERCE_POINTEE` and
 simplify code
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-6-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-6-ojeda@kernel.org>
X-ClientProxiedBy: LO4P302CA0044.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO8P265MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 5643830c-c5d4-44af-47a2-08de8ff4bdec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v21NZrSrfvtq2tcr7x4HQBrB6EAbPyv5yNXUMUUXLUimWS/+upcNjwGfL5Dsxd0vvD71wkTdSXl6/ezI4FdKUlfmBDS5eTViQTrbEwYEIVA01pc9wN+u2Aisgufy295DR3N4ICbA13AUGTCDn3GB1gm8HkNrgxVe9pF6b3Tj9q7cN87BHpH7z4zuTPFjdLCyFxvMRzYHr5qDGNvKMQ2A9ik2guoNs39R4PoOXpdeuQ+atOOQHvuLO+ZjPR9QM8KPBymDUbaPi/ZEwm2sj/BQv16U/0gsPkUsIMC686pB7+zzArCzFXNzZLeEaR75EEN/2DUYlyVZBXtAHGhSIxPeo49BHAicparsLOAmJKGLCagU98NZMLwvBeCMmXsvVrLHns/bKF0HRmBUVMT3mzipbShPPK/ZK6Hj4qXeTT5PS7qXupv7UYbDDEb/sMwa/CNYXMntG9RgDjpURLQG3qLJat8XOOT2P2XKfFivv7OxKUCjQIwvlAGAe38zV6+UTrzfpxjuhLGHN7x2tKBd316D4UhkN2a/mUMcwO6fmU9ubVbaq3t/B+qfAG9PPuTbZysL/rqF9ZZs1l7N/mCRYJE+ZVolfhzNiL1byb+z0djreKW6BXQfzYEwJZ9xn4fHjfFgb9uW9w3rCRAPiY8UGSgBrHNu48elAu0fqyXJgbmEB71sltBCkskckRzZm29rygtfa9Zc0CruWJY8nYNuOV4xNciFN+EilmTTITtDcCd9Wv/RtoH2vfN9ij4+1Zi0qGTAkq7YH6scWeggr9p3IOeWKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnV0MTZRSTdPVll0VGJKMW9EMUlPSW9WK0hrWmorTEVxTGJHOG5UZkZGdGI1?=
 =?utf-8?B?cUhDeUF6NzNkSXZQYWp5VHAyUUJveTlUWTB5SXMxS3RURUFNK255YWhuTXZ3?=
 =?utf-8?B?ajU2emFYS1JXZWlpT056dGtoUm81ZmthRFdVODhlQVJCZEZKVnR4QlJ4cVJU?=
 =?utf-8?B?bURmWDRFblZXYjJMai9wVE05MUdGQnB2ckxrNWt1QmgvVUlkYlVGNnpWZDU2?=
 =?utf-8?B?dFdGSURWRUM3bkdudE5jT2Q0UGtFYjYrNURTSXhnUmxqSGRkSXFJREdTdmFI?=
 =?utf-8?B?T0FEZnJGZEdGR3pFcGhYQU40ZUVBVlJRK2tZZ05sdTRRaHl3NFpYNkIyMTM1?=
 =?utf-8?B?SG9GeTJrak5RWU1SZ3VqQitSVlc2WUl2ckp3UFh3WURjSmkyaFRzd01TcWsr?=
 =?utf-8?B?aTZpM1l5SWdLY1RVRWczaUo3OWhkRGRxdWhXSjk0OTB4VWU4OEFjaWx0Zmls?=
 =?utf-8?B?d1ZUei9OUHVNNktXVHIwY0RXdEVzTm0rSUZXWExhQ3pUQTdiWGpVNUZhT0tJ?=
 =?utf-8?B?NHl2Q0U0dG9RYjVueC9vVTdJVkF0NFk1clF4anRYK2RmbzR2WXhEUjZlT01J?=
 =?utf-8?B?TzFDcm1lZnpiUy9xY1Q2Zkg2UGJ1a21xWTlDbzRrVjgvSjd6VVBkM3BtcDVy?=
 =?utf-8?B?Z1BmUHQyWitkb0J1eHY3VkV1Vm9XV3hVMStiZ0FFWEZHTUxsMmpMeXNvd2pv?=
 =?utf-8?B?cnVLalVCVk5vYnQzOXM3N2JmRURuUis1MjU1aDB3OTdxVzRLalhhaDRCQlVk?=
 =?utf-8?B?MCtGZVRkaG5wSjlPcVowdE1KVGUxR1U2RHc2WUMvNFNWRjBzekNlckM3ZWY5?=
 =?utf-8?B?R2xJWHB0UStWOGlhbHV2WnpWSjlsUEN6azBNUk1LZnR4Z29GUEY5emJMQSti?=
 =?utf-8?B?aWlTMkU4R3V5bU82WVlQQXJrd1o3VEc4a1h2cUVab0VDeXJNTmxBcVFUamh5?=
 =?utf-8?B?SmJNRnYzTmtOdkI1ZjdTZHNpazNIVmVCTC8zdXNPL1dRMjBZU2I1TzM1YTVm?=
 =?utf-8?B?WWlVZXpTZ0NLQWZYUnFmN0twZmZiU1U2ZExUODBaUHcxU0swMXFCV1I2OE5k?=
 =?utf-8?B?a3JPL2xnTDMvbWZsc21jbjEzQld1aHFrUG14U1ZCUmhCNzN1ZDJIL2VtN2Z5?=
 =?utf-8?B?OHk4dDBwZWtVN0o3eFhoVWdPZ2E1ZVFPbG1HMm5sSmRsOGttc3p4Q2t3a0lD?=
 =?utf-8?B?cys2MTl6eDRmWUMrYS9jdjdIK0NUTytWemkxMW44bk1PSjNMdXRnVWtaLzJV?=
 =?utf-8?B?dE5pWnZIUXNZUTk5bnBrYWpGdDhaM3o0SmxUdEM2bkZIenk5dmZyYm5zOElB?=
 =?utf-8?B?TWVlNTgrT01DaVNEYzlTbk9Ba1lDWVcrbE5uNFgzRDBkclJqQjhJZ2J0Z0ha?=
 =?utf-8?B?YkpmazN3bnpoUEtUQk5kNjdkZ2hScldwb2JzVEE2TEh6ckkzcE1zamR5MlZP?=
 =?utf-8?B?TTdwMjBPbEZzMDcyOSttcnNyVXNrSUpKaFplUGpjMm9QdnBoMXJQS2RSYUdV?=
 =?utf-8?B?b1V1NXcxRWEwcWwxZE43SDlzZ1hSNnpsWk9rdDVaVk9MWlFsbzlGMU9JeG56?=
 =?utf-8?B?WlJwbjdnTzNkdklwRFlIcmMrb2JkdFo4QlRhYk1qYWVVdEg4WkdzUUZqZlJQ?=
 =?utf-8?B?elNISWlLYVlMYVZMWXZmK2ZsVGFsOVVjNG43Z091Z2hZbS9VM2t0QjYzZHBZ?=
 =?utf-8?B?dkNERlVBdGtjRmlRQld6Qy9ScmZ5NEc3RHUvMitNYmdTYWhrclJqTUxxcG51?=
 =?utf-8?B?NDhsUlcxZmlDQTA4eE5YOVBCSnpDRUF2UlJraGVhUDV6S3VKUkpaUVJBcUZ4?=
 =?utf-8?B?VVFOdmI3bk5SeGh3VkRtSTRXTm9kRkplZmxUTFBMMU5uV1IzTDcvV2NLRmJM?=
 =?utf-8?B?aDdUaEYvNVlRNGtWdXZlS3B0NHhMZEpOUGVNaEpjUTFRdVdLVm10d29jdlc3?=
 =?utf-8?B?YmMyd0cxdmNwNkpEWFFJOE1IekZuSERLZ2FWTmdrS3dVWnpNblByWmsyTE8w?=
 =?utf-8?B?b2kyaWl1YkxFZ1J3ZkMyTzBraDVucW80aWUrQk5Uak1rcGRrMVpFeG5lM0ZY?=
 =?utf-8?B?SjVYd2VtejI1aStxNkdLa1ZyWGxVY2svTzczNXVVcHRMVzBkMDFiZ0Z0ZEZH?=
 =?utf-8?B?ekxsT245NHB0S3cwYVBJSE9iMUVmeEJ3QmtNQjBTS2lRbFB2Ymk4RXZ2SnNw?=
 =?utf-8?B?VUNCV3ZtaDV3UGIxZWJWZWQvZ2J1cFhPRVpWNTNidDdHY1VQYnR2SDl1VitZ?=
 =?utf-8?B?VDBDa2NvaFZnL2JaTno0aHZLYjllWFU2N1lyQW1KQUVLYWp3eDhrcHo1Zkxk?=
 =?utf-8?B?VDhkcUg2Z0JiK3FaVHBIWDR4Zlp2Z2YxcnFaUTcxZ3paM0UvVWRyUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5643830c-c5d4-44af-47a2-08de8ff4bdec
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:44:05.5207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHZ+Vq/Cl/Fxa6b8zJlMLN3OgAh/JS8pZmmbSQR2sR78k0mEQUKKVBZEQe1WqJJU0YN3LgywGGbT6UTM6yBNAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7687
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	TAGGED_FROM(0.00)[bounces-12517-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 80A8437BB32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> With the Rust version bump in place, the `RUSTC_HAS_COERCE_POINTEE`
> Kconfig (automatic) option is always true.
>=20
> Thus remove the option and simplify the code.
>=20
> In particular, this includes removing our use of the predecessor unstable
> features we used with Rust < 1.84.0 (`coerce_unsized`, `dispatch_from_dyn=
`
> and `unsize`).
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  init/Kconfig              |  3 ---
>  rust/kernel/alloc/kbox.rs | 29 ++---------------------------
>  rust/kernel/lib.rs        |  8 +-------
>  rust/kernel/list/arc.rs   | 22 +---------------------
>  rust/kernel/sync/arc.rs   | 21 ++-------------------
>  5 files changed, 6 insertions(+), 77 deletions(-)


