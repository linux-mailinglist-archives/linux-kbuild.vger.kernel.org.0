Return-Path: <linux-kbuild+bounces-12536-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAQTOxo4zWmxawYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12536-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:22:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD22637CF11
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 952A730904BC
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 15:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1DE44A72C;
	Wed,  1 Apr 2026 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qO+zbJl2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021087.outbound.protection.outlook.com [52.101.95.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733335F164;
	Wed,  1 Apr 2026 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056605; cv=fail; b=NTCUfoFC26gtyCBDtJ1v0PktPuW0JFXiUDqnDC3cTcLwikquYirAwVgbIKg3tSnmBDn9djpEbD+2+SDXHUEMnXjxpZoZiUV451+eYZ3g9GS74gJr7QsrF4kh3WEremRTuLRQP0rtaA7KtGbFljLq8QUrAESuDFzqirCZR8GDWmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056605; c=relaxed/simple;
	bh=xwIA90vqQrDu0CjgseD/gFkaXJZknF5FiX2fFYFkWGU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hw6/WbfEzHW6f1fXHJ7vA7uGxqxfhtKEzhFOqBAu4NSYNkmkwM+Z41MO2ADDp6vyqsk9AbQ1BBLmRNameki/rCzx1qW5WC1+8i+2IgZtruEAscy5/3EXHWPErLIgk/PK1PlDFVaF7ZqdMf9++ipneEvFwTcXUHnuGWh5SK/E3xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qO+zbJl2; arc=fail smtp.client-ip=52.101.95.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnbqNgsvLT1kMQaePop1z4kse+RXYUK/xQASAlcU9TritwF4PthEaFurHJDohYSC1yCQFU+4c/DhHZTqJKDbL2wA/4Z0YLvJbRuE2xRBqZCqxAwkW5IFm+5TShEIrZNp1bCaNVIsfjV58P84yVPZvu+804IlmqW7CrKWE8h3QfsjJnmbT5wclSCsTpuwGSl+NvPh/zKnGG3/aQuyuVlsztjLArvcXQJfPvzkkayIBboggiIvk9lOjlmJ6AxqzoUzAHbYpAPX7YscCpMJf8FDryE7qwPqS/NBDYWlMVBzxS3PIoNTItBhkeOUjRWCr+Kzm17+jpHgm+oKS4V7xBubZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5jMeERY8ZwwZgmh6+3y+7stuyUsKJVKUf9eIsOCICw=;
 b=Q5aaFkOIZBJBSE1kJ4oi8xt228RfB3Pi6qBxdlQYqhEWkLRlDrRqcK3p6LMjJNRwjG4uWykghk2CCT6PlDwdwLSxHjEepOhxRFdvmc91s+BUTXerHgsZDCAmoSrffCJog3Sc2ZjafbrCOm1uTsqSPwTiukAQQzLNx7lAMAa0LpvfRe5UWPmzOHSyTNDhTwHW6MqdlEIcWnEX/wTjoyT0HGkd1DocSCAuZI/SF9XTb8IexxfpEtAQYzM11hb+15TOYbcEk7vuHhpY4/kJ/F/UfVJrUUCtrk9zT44vCj93HlIbMcfGcTdLAKyez2GfsrDy10uHMmSnpLWaUzfdFo91HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5jMeERY8ZwwZgmh6+3y+7stuyUsKJVKUf9eIsOCICw=;
 b=qO+zbJl2sW5cCwDaB2GPpLtITAgvA0QcxhxJZ+9Sd+0G8AGEiRzSWpbNK+2dy15B8V+ufktLOs+RjZkakmG6H/v7eaP2uVlwmCEJIljHH4r1GXgCUcDoXI78cKt7KCFCU86/jrxHxtCFwmjzd/PL/bP9GdYCKkatgOTtyZvDFyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3172.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:16:37 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:16:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:16:36 +0100
Message-Id: <DHHX1R64ZL3Y.2RYDDWANCFZDQ@garyguo.net>
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
Subject: Re: [PATCH 29/33] docs: rust: general-information: simplify Kconfig
 example
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
 <20260401114540.30108-30-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-30-ojeda@kernel.org>
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f883268-31f8-4bce-0f65-08de9001ab59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Am4qzz049m5pEZrDV8dbmMnaKhMAEnIFUxCKHgAPZj4qkT41sh13krnMuY4zmVM7O8qDIFbRg7xY1uJjckFsBmbFu+lL9vjDkGZRoz3a9FVkCa4pNTO41uUmIMcc/N2VugbNZDblebr+HXDI1B5JfMUx4uB9fav7sb6ml9BjvU223fioWkeTrTwq5HsDolMbBcJcMSoqPuL6hgHjFgvf0NtG6TZp3beuUZqJuSXjbz4FWdZYC7Xc4DS+LDUwEbioPUzIp4FxH+9SqrmzV/Go2MytLdEE9y2JPZRcMxHG9uTtkX8WyKFzXQVTRokSjVfOOyfGfRytfvsjSr6uWHczGzPL0ua+fl+EdNq/HVVpvPwOw14Q4zLjTflImAsOFygARfwvNp0fUemPZLG6XeE67g1UDgD4H4pJckNbAGVdBa5NceYXOlQIWEQe2APWHTlzIsyH3xC2+YxQDCOcImf1qzGmliR2t+RtEXl0JJ1//vk1h3P5FKBEc00IMMVcuHTdBIPtE60XlEXrY4YTn06nZ//T/lkHONdx36TRyo9PqlV050UaB39TFl344HzkrSg1biq5a4zcqN7Ji3o1vKVWmAIeAsVyAcH+qZrdJuAV85ndAHv/JiUZAGANyqDSmSBdCUdUoRv2kyIQ5zDjHWQmcQcoi/nvG904hsP1bUhBKI7IPHIc2m2KZGYNLVKmzmo0CjYg7uwYmHJMAerGtta0UeUSwvGJFTE3GtlHGnyjfUKpKzCDxXv/i4zbvh5gPBDwDiFdFaxuYehOBz2W4mRN5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnl4eHZIU0E2dkgrN0hRTVc3VUFjWGg3YXg0TTlvTUUyU08rZnRMUjVyUUhz?=
 =?utf-8?B?Z2U3WEVQVWd3YnpHakFkZ3luOExBMnd4NHB3LzJoS285RXNYN0s0SDRicUN1?=
 =?utf-8?B?cmtReWQ2MUlGVUhTbXI2NEtXN08xdTRHQkkyd0RMTWFNem00RnRQMnoxZzhm?=
 =?utf-8?B?djZMQzg4bG9wTzRjTzlOMlY2TWoxQVZLV3pGL3BsZXhpUVhKaExsR3VkSk03?=
 =?utf-8?B?aG96NCs3N0F6MWM5OVJTVS91SW8wOTI0OHlKeWZaVkFINmM4ZEs1VzQ5Wloy?=
 =?utf-8?B?bWpJOFJJNXBYM1FWcGtwcUs0bTdtb2NmQ28rdFFsTUt1WkZpZHBBU2RjTUdV?=
 =?utf-8?B?b1JPVVp6TjgvM1Jhd0dFaVBVcUEwNXRPT2pOUkQ4d1g3dWwvSFlDMmpWa3Vt?=
 =?utf-8?B?dDI5ZnJsZ1BSZW9pODlmaHVrcDJwQUp5aTVKVUpTY2R4TmM4NXl4RjVVZGpz?=
 =?utf-8?B?aVoybDdEOUl0dlRBd3dhSklDVWsyR0dsbDJGNkwvMU5KcmczR1c2a3FwS2FB?=
 =?utf-8?B?YlpYYVpTVkp0RzRTazNEN28wVnZPanhWdDhpZDNXaTE5NGduZlRjK01GdU5J?=
 =?utf-8?B?SVZTRU8rR09MQk5yVkNCZ1pxTTI4bU4wbm56dWltVHVWNEQvQi9lUTczZ2dC?=
 =?utf-8?B?aDR3aStNc3Z6NURLeEhDR3lZY3ZVSVZneGxwM3JVQzF4QUdhMElnczhLMGs4?=
 =?utf-8?B?L0JCak1qTXhmUXpiUTd2dE5MZWloajh0REFIN04zaUFEUWloTVFDZHcyMno4?=
 =?utf-8?B?aFhPUG8wcitjdDlqY1FHNnpEZ1NZY1NMOWRLVXNRWDBoMHpQMFJwKzlIUktt?=
 =?utf-8?B?b3laQmp0ODFIVmhhVjFzSDJLWUVGUWpRRDE3c2xSdHRmMGE1c3B2MmZZenBT?=
 =?utf-8?B?SnllcUpRQWNYVVJtdVYrOVd4cUhCNmlHSXJPVXpPTnQyczVjOUZZbXlkMEZx?=
 =?utf-8?B?WU5ScWEyQ0lFR0pxZWJ0cTVYWmZKb1VDd1ArdFE3ZWYrd3RCTHNuUjVzQjdi?=
 =?utf-8?B?QmZ3b2dMbE83YzF1bFlsTHVVOGdmRjY2UnQwOHNsWE1UK3F5MG5VMGdKQ0x1?=
 =?utf-8?B?Tjg3aW5qaWlldm1iRlJlVFVuNERKbnRCRWNoWkFZZm9TU3VLWFBzemNPTVRj?=
 =?utf-8?B?OHcwei91N09WbkhreTAwTUZTNUdtMGtnZUFZZ3RpbWp5QzcrU0c3Y01QRnJq?=
 =?utf-8?B?ek9RaHNCWFJ1SXV4R2lNcW9FR1VoUHhGaWk3MHpFS0NqUExWeTdWblZNNnhj?=
 =?utf-8?B?V0xGelZ5REt6bExTcmJXZTJzOTNsTjYxVS9FMGl1NTdNU1lsL0NNeW5HakM4?=
 =?utf-8?B?cnF1QnVkN0JQTTNRTm5KRWdWMjFhR205T1ZqaGlHZ2NHQVVsRHNXMlNJVk5x?=
 =?utf-8?B?NDV6cTIrV3EwWU8rbzl0ckpGdW5lSlM5MVhreWV5M05lTTYrRkUrYlVTNHRE?=
 =?utf-8?B?VmNzR0ZJUUZKanhJS2tldVBaa3lzazU4ZEh4K3E3V3RCZzRoaXgzR09QRXhK?=
 =?utf-8?B?aE0vSUJLQnZSSTJ2RjNNUEhZSkVaRzk3ZTRxSWszWHRBQVYyYmkzbmNQNG5w?=
 =?utf-8?B?bjJSSTIvQ1IwVVMvM2diMVk1dlA2WjJNUG5RS0hUak4vT3NuZWhZYmVuS29w?=
 =?utf-8?B?NnNEOTdvcFd1UmxJZEFlTkxaQnI1bStnYmFZbnhGK0xOdDVBS2Q3YXlpRUlu?=
 =?utf-8?B?QVJJTjRRMDQ3aVQ4Q0xUU2V5ZXRPN1BpT2MxQkttcWRsdS9DU1Z5cXdvVXVW?=
 =?utf-8?B?V0NvK0g3bUFCaS9rM09LMFRqZ2lrM05EV2R4UXJoM1d3Vi9va1MwQlUyS0ha?=
 =?utf-8?B?dUg5cUdnVnNXRGRIMHg2OWgveVhhSFREdWJBSDhIRWpzREhhWmtSRGMwWXlV?=
 =?utf-8?B?enJVM0tRdkIxSVZoUElZVnZkNEs5L2V3R1ZjYmZuSFZRcFk2Ly9UcnVKOE45?=
 =?utf-8?B?SlN3ZEx1WnN3dlI4N2NPa1hjZHlSSHExTEFJbXA5NzNuRjNhUjhoV3JCazRk?=
 =?utf-8?B?MGMvOSswQVJ5c25raGh5K3J3VnVpbnBpM3RlVnVzQlJIY2JpM3dZR1pNdjFQ?=
 =?utf-8?B?eTIyQ3JmalVRbjRoaFJET1IyRGxUd1UvSjk3RFV3RWVWUVRHY2VuRXgwZklx?=
 =?utf-8?B?VThaeGFvbTBqczVQMEZXUkdFb256UytYRVRDUHNGclVucWlrMVZZMndBK3d1?=
 =?utf-8?B?SEZRbTVsK2hxTkZicTRyZTIxb2ZVSFk2Wko4M2prS3I4K2RQOWtmMjZtbWRX?=
 =?utf-8?B?RHVnWUFrTSs3c1VkR2VFWG5iRUVZQWo5dDFud0J0UTErZFkvMXhWWlQxN1VQ?=
 =?utf-8?B?TnNwWE5leHpKQzBaM0RlY0x4Z0dtSFNCbWhyZE9ja25KK1dKMDRFdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f883268-31f8-4bce-0f65-08de9001ab59
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:16:37.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKODaDa2xRGOLrfYw2M6Sly1SROffk99Zdea8El2zj9j7B8WCRFV/4C77QvGlzJHGw1NpZTV1Er1h3SgGLviLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3172
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12536-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: CD22637CF11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> There is no need to use `def_bool y if <expr>` -- one can simply write
> `def_bool <expr>`.
>=20
> In fact, the simpler form is how we actually use them in practice in
> `init/Kconfig`.
>=20
> Thus simplify the example.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Documentation/rust/general-information.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


