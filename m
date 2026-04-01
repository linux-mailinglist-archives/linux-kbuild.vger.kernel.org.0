Return-Path: <linux-kbuild+bounces-12524-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOOlCyIqzWnyaQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12524-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:22:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D9D37C12E
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8157B306BABD
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 14:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4323BE638;
	Wed,  1 Apr 2026 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="D4SdYS5y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022138.outbound.protection.outlook.com [52.101.96.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A3225413;
	Wed,  1 Apr 2026 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775053089; cv=fail; b=eY7h1JRuNpTlBj5PNQczuHT6MqVTPjJnPW6HxrRTKV1t7qPzYu+J2ONoQVNMOSh2/mOuBeeNJkzS/q5UuxrHAP6hwVDNMFBLT0HodDcaJp8n/szN5IpNa+AaiSkOE+IW/L7s5n1Q0fngSKxbIMhM5KTS9/xG9EXVOpXMJW6oono=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775053089; c=relaxed/simple;
	bh=EUddWmGQHDCIRw/RXPqxqe1wx3JiF4wR/j0wwL6o0eY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=GtnFqVASWOjHArBJqGBWPFQ4q7EMBTWcNxn0QnzNUAqRznz7MkilEcoppDxGnjxsW333/1eG7oYIjVPRsqGQeI6s1rqZcBqHxKaQPllNAnZtAEnyZ2wTwqlDflIDTLcQP/whZASsG/jdNUFLZDAhWjUIezciXnjAtJbtBZhg1UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=D4SdYS5y; arc=fail smtp.client-ip=52.101.96.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDCW/jzcMAHQdPWLXT5Jl1nK3P0fFTJ1MYVkLmpl0rZAHZj3CE5MRR+CZkIsnjhLVwd3XaXWNKHTy5YO/QSKpM2LKriWtSdXhQSDwWjsj2ykojjgfhMNB//P1rHUg80wHbRdOWIbaU+zPpgAyzqQT0N8iK2zIfkUwRobXmv5FQLIavfG6f9lVo8zSXtRQCUYtFrrpj+6O9CsPLLuB7uugdG+fvwVws+mHsExE3vUJUolZT2xzAzYqAz4G9jKCs5phKGWuA+qlbx7MrL30g6vTTr3a92bORQ9v1CdW9NKmwOl3tyw7lEtO9x628D25GdwH5XIWoyokPoaWTd37Wi/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAMvE2QoED5iAgDx/VxI4LBZlWbNprhR8PoRpJ/45pI=;
 b=Jr5+dK1fTYCKkfQGxmhwv/Pb8vwu9AZuqL1JPXGhQcUUi78D4nwvojAD8vOtvn3zzhRRRM32YyYflka48/nUMJ4f9oIvG00VzIDjHvzcmDFpeoLxYniaornmLG0jBmMZOx/Wsri1C6udzx5dbw/bRnYuUrBOHUMKtN0uKP9RpMXUOgQrl89yh6sTxljlWRCj56m41lsGMmHTbA4zhduotL4WyLtEbpvj+WBnySTuXyevKtqDtwG6n5x78HihYifg6Lp0kzK6gYch5wR57mF2Mw9qJdNVmzqELk0WmO3IhfScuZRd7e9JvPZQatytOenv2jGq+/hfbSIO/LGvltNc8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAMvE2QoED5iAgDx/VxI4LBZlWbNprhR8PoRpJ/45pI=;
 b=D4SdYS5yvZc+HuWglM1ponIKoZ+M2RHkVjBP1MHlx/sKyoKRgmplflLzbJi58sJ5houct8vhIJG0AKp81ek3xbXAwFlWQ7lNfW5FqvDbpWYcwQIlneQ9FhqElrD62xVt4Zipb2MgS/fMlv51XWYwwvcBdN7BZQY39qnFrmQ/RSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7843.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 14:18:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 14:18:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 15:18:03 +0100
Message-Id: <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
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
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO
 comment
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-13-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-13-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0647.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f272f27-5956-45fe-68b4-08de8ff97d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qajhMNOwurwD6X7vL+RZ5MwuHioIwBNF7Us/MzXI1oTT8jgwt1nU0EorWNwlb1ZWYwyBW15Zivv4l8Q/GqUJ2uQNr3yp2oFevp5Hftik8lg8/Bkv57ocvFj+hM7amep2RG5XwUaUWtZKuz7E9IrvC1pyR9hkAueSDv5JQmrjSEsYcCI6UCJnG0HGSztWTLC6Eb3XAz2iyXf6Gc+k67B3Dt8/U/ERhvW+m01NI+FarEVEw/gKNCz6uk5b0DZVWaZdbJCaod3V8aC468FgJQi+KbBuyZt1bNlherUnaDeSi0F1iqqs1q2WL1h192KZ0wNENEuRDz876NTpDdtqeUiuXNf+rBtolKcxV7uNBWwfK/Lbs3GQXlsxvhWhU68o2P0jWbrpqIZ2Lh5p7jper7LIL+KCBrsW5fgiDWfD7ovHd2FwPXySMXeuyjkEiC10/k8hZKrKrL22MrfKNUV3rCy1ln77ngtVsWoYE5bK4aqhNlJ1MQZuTuf37K15Ste5sRaZOgFUz3skSBUuAnw5RzjhY+SNP8JRThIlphd7sRk8Kjdv/CWHQkduN44Pdd6gjNgTcjetcekUuIOMWupNU5XEiCyXWUKvadG5PzwSGz1aglPhhpKQN72/y6SVEO/KWwDAEKIKKQFU7oraQzMbmgoDaXGiVKa5cKPc5c+OzwahrYfXkF4Cnrm/bppXtwSWEJbMp4TTy1ZZWHfHGy0mc9zwAa1xTE5f3HSWlwzxMGlixNVaT9eM1V6EpdwndXqBHnOYEmMWYdMeHNAgto4eYPzevw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2xSRHZYeS9JbTRVMEhFK0pZT0ZPRm1sQ3E4emZQOVcvZmFsOHJQdG9hSENB?=
 =?utf-8?B?V2ZnY2I3ampRU29ETzA0bHlnaEh5R2xhZHRlODNjcWE4RlVpZXI5WDNQVFlk?=
 =?utf-8?B?aC9VWGtVLzN3M3dBcmJKb2xKSkxKSm8yQzB1UW1jeVNRUTNCOHZtTk90WTBh?=
 =?utf-8?B?cjhaYldIaGw1YSsxT1RNRnZGUjV6aXlZQlNrTWZrQ0IzZlFwalBOOS81Qy9r?=
 =?utf-8?B?R1pDNGJwZlR0dEVZSUJ3bm5Ma2JTRCtjajFNOWRQdGtBS1Vqd3NnNE81RCtD?=
 =?utf-8?B?cUNpSzJETC9IVGxTUjk0OHRPcDg2eWtBWVUvVTZKOVFzMFV1d0RZV0p0RFB2?=
 =?utf-8?B?RENydHhiamQ2ajhJRzJOM2QyRjhPU21FRnhic2NwTnFyNHJEU3pQalptd2R4?=
 =?utf-8?B?S0wvY3liZHp0ZXluRWdYUUpwNys2cTdGV241bmNndGRFY0hiYU4vSlFtVnB0?=
 =?utf-8?B?ZmZiS3NZd29oTEZ0d2dBeXFZd1Y4dzIxVFM0TG9sZ2UxdzZ1WnZOS3c0ZktZ?=
 =?utf-8?B?UWRBUDhReEp3UzBoWjkzSHJsdU1tZ3dXNDFQcnZRMHNqS3NUMVJUcnZROWU3?=
 =?utf-8?B?OGhPQmVlbTJlZ2VpaDlRemU2NHZJMUtualFabnRiTFZYN1VUckFkVlkrcmto?=
 =?utf-8?B?Qnl2Vi8wanpmWUwrb0wxYm9qbHROQng2R29sVmtIOXMvbjF2R1doalZaNTh1?=
 =?utf-8?B?bFVFU3NvYW5zUjVoZE92S0RMZ3R6RTlsQ2J4QmlqTzYwYWg1bXdjZG1YU2hI?=
 =?utf-8?B?ZGJUcUdHYXl1MDlPUExSMy9LczJuZHZ0Q3JNTEpsMDFTSER4ckpod09tMjlp?=
 =?utf-8?B?cDQwS2pSMW0zbWk4V3loSzlrc2xabjNOZXlYTm4wWG5nTXAxTTJPRUIvYlhB?=
 =?utf-8?B?NVpFeTdXQ0hpdHhxK1dkL0FkeHlOMEVJN0pjamhUQTZHdXg1VUZtOXA1NjNa?=
 =?utf-8?B?SXg3TStUVWM0OFVHT3B2Zjh4Y3UyejFldWJqMEJsblhWTTBva2FNTG1haWUy?=
 =?utf-8?B?UnFsdmJxL0lEb3VDZVNWMjNGTEVvRVNOOStBMWN4anFZUXRKWGZRVjkreFZ4?=
 =?utf-8?B?NHpwN1hEdE9lcEpoN0ZtdmdmbXRHdnJndlJiWitXeldlbUNLY2MxZmRWT2ZJ?=
 =?utf-8?B?Q2E1ZTZoT2txYW1Xa1BUT1FDNDFvYUFHWTY0MGZJRXhVRWFNNzJSL281M0Jh?=
 =?utf-8?B?MHlkMU1yR3hQUFRJQy8zR1hRVlRBZ0t4QkUxemZ2dzhwdWJhKzlZM0VtdWpl?=
 =?utf-8?B?S3RLZWJBLzU1ZnBCZGV4WDg2aXA3aHViSGVhSnhvaWh1R3p5UDVnVTBhVVhw?=
 =?utf-8?B?Y1dwSjhUZ283V3g0cnRySTFoUzQyRnBIWWtqeEQxclR1NWVqTHF5Q3IvQ2pj?=
 =?utf-8?B?SW9sZzVmaFR6Nk5oYUZRY2tKQ09oTXRZTzhJc0w4YVJYd2htNWlSM0VrSzl4?=
 =?utf-8?B?dG4rZGpaU2pNNmtwQ1BHVml6WFhTcWZiUHNFNVRuUk9mNnJJaDFXZGIwV01q?=
 =?utf-8?B?eldNRGIrTC9XOHdHSzc1bXQya2VseHczVkNqRi9KclowWEMyUmNZNGdmRHlI?=
 =?utf-8?B?MnBScEd2eUpTUU42WWgxMkxzcmsxQmtiek5wZ1Jnc2xSdXpkaEM5YnczejdO?=
 =?utf-8?B?UitZQjhJWGRRUmJ1cktCeTlsOGhMdTZEQm0wSTExbllqTngrVmxNVnA5TXJB?=
 =?utf-8?B?cGpabi9jVDMxWUNWSno3ZmI2TVRoMTZrcFgxdTBYa0pLVTlaL0RJSmJDRUkw?=
 =?utf-8?B?NnpiQklKdXZRRk9xVy9NTEoySWpKN2ZXMWNmWGZBcVZXNmFXc28rT3UzTzF6?=
 =?utf-8?B?UzVWd1BkNS9uRTFTVFlIcFRyVlpVOEFRMkZieVhtd3EyYUlrNW5lTTRmNk1l?=
 =?utf-8?B?OVIxUU5jN0w0UUx6d1czNkJrd3duY3l3RGdTMUJWSFpMRTRyNFF4ampRWFRQ?=
 =?utf-8?B?QnhEY000TExpOFZEZ3FLb0VUcmttQUl0bzROWDUxVENhb3RqdEtRajVpcm5k?=
 =?utf-8?B?WkZBUDVEMjZzcWUwY25HQStPaURyRlJ6d09QRjcrcWZoSFN2c1dXb2N4UWpi?=
 =?utf-8?B?NTdmN0pFVnlFcEUvMlNsRHovbkpCbEx1MUNQam5NTHhZWU1lM0MvL2RsNkUr?=
 =?utf-8?B?dGlVaklQL2lwRXFnYTNhekIzVFA4SzZpNGN6L3dqOGl2clltaHptZ1NnN1ZS?=
 =?utf-8?B?YS9SZGJOV2diSzhJcVRjbE1pVWNEdDhqQngvK3RWbTgrVC9iZlB5SFdicE9x?=
 =?utf-8?B?bUo3YVlhMTVEWmFMS29WWEtnaGZ4Y1JUMGU0NDVyRFhXM3ZTRFNkN2hCaGI0?=
 =?utf-8?B?OHVsU01wbnUzYW0xdGovNjNuNTRRa0wrTzVnN2tjK1NXWFBDaUhpUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f272f27-5956-45fe-68b4-08de8ff97d49
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:18:04.5551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/9ttGVpoxDGKgU6NRg2HY0gGDlRZsjtjgKPwUac6j8HpTBErW+2HMoG57Vz/LXTvb3ynXN/OuiTsGahuduMRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7843
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12524-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.895];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: E2D9D37C12E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> `feature(extract_if)` was stabilized in Rust 1.87.0 [1].
>
> Thus update the comment to reflect that.
>
> Alternatively, we could use it unstably already.
>
> Link: https://github.com/rust-lang/rust/pull/137109 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/macros/kunit.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index 6be880d634e2..6f6d746b8dbb 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -87,7 +87,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module=
: ItemMod) -> Result<Toke
>              continue;
>          };
> =20
> -        // TODO: Replace below with `extract_if` when MSRV is bumped abo=
ve 1.85.
> +        // TODO: Replace with `extract_if` when MSRV is >=3D 1.87.0.
>          let before_len =3D f.attrs.len();
>          f.attrs.retain(|attr| !attr.path().is_ident("test"));
>          if f.attrs.len() =3D=3D before_len {

When I write the comment the intention is to enable the unstable feature an=
d
switch.

Best,
Gary

diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 6be880d634e2..ae20ed6768f1 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -87,10 +87,11 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module=
: ItemMod) -> Result<Toke
             continue;
         };
=20
-        // TODO: Replace below with `extract_if` when MSRV is bumped above=
 1.85.
-        let before_len =3D f.attrs.len();
-        f.attrs.retain(|attr| !attr.path().is_ident("test"));
-        if f.attrs.len() =3D=3D before_len {
+        if f.attrs
+            .extract_if(.., |attr| attr.path().is_ident("test"))
+            .count()
+            =3D=3D 0
+        {
             processed_items.push(Item::Fn(f));
             continue;
         }
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 0c36194d9971..2cfd59e0f9e7 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -6,6 +6,9 @@
 // and thus add a dependency on `include/config/RUSTC_VERSION_TEXT`, which=
 is
 // touched by Kconfig when the version string from the compiler changes.
=20
+// Stable since Rust 1.87.0.
+#![feature(extract_if)]
+//
 // Stable since Rust 1.88.0 under a different name, `proc_macro_span_file`=
,
 // which was added in Rust 1.88.0. This is why `cfg_attr` is used here, i.=
e.
 // to avoid depending on the full `proc_macro_span` on Rust >=3D 1.88.0.

