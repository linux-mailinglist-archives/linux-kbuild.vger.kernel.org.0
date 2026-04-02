Return-Path: <linux-kbuild+bounces-12599-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NBAJo5RzmmjmgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12599-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 13:22:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB538841D
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 13:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 911173025135
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 11:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C9F3CE499;
	Thu,  2 Apr 2026 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LO6bZwqm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020116.outbound.protection.outlook.com [52.101.196.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EF83C3C0B;
	Thu,  2 Apr 2026 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128503; cv=fail; b=nPeC1u4u48WUrgQXXkBb3HpxO2kMY5pyLiWKzkyKJ6qCtJDw9aajoAAzNRYY7OMbAPtAq0g3InbhibRc+Anq+GUcwnfadQNXZucnjXw1gwsuLbXsk2Mm+9hoMTZMJluq43OVvxTvszaSe52a7/nGb2UafR7XpiVFA6/K+TLXpII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128503; c=relaxed/simple;
	bh=/ULz8p8O0YziZ1fcALuQVkkkXo4F61kNePBietqbqew=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=JWxHzDdFTg+WTrXqQZq50Mro3x0cXsBFAMC1lC+zhhN6N9hOX9WNkojGH5CW+Cb9Z4rWj+ZqjtuCumBxnBiliy3YSIleu/ADpG+F7hZ8cW7uADTYtbwYJ0LEGgsTwvG9RbS9jaTkI29NOvX8+dI/oUEQglrI47XTXeQ+nhAeS5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LO6bZwqm; arc=fail smtp.client-ip=52.101.196.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlA6GGeQpBYsuOCK0tZCRqqghAIg2TNmaf/kToINURNQRfVEIQ44pFGULsmwaEAlLnCfvndpVHJI6l04RWeHdpFetVqySgQqPaMYDd/SDUHps26TA0oauxEvm1v9NdlWlcjseW21Fy/hbu9JFIqEovqM7XeV2vsmSrHJGhXGYaZcaleF0vafzUGxHI6Hbca/2KRvB0pCtvbkD3eQPxZlsHw7BivOTNvn+2CPWMmgjsL8TnO/QwJFHy44R1b5oqggQsoLfDI1tShUzFy1s2rCo7c5EWYafvSjGHp/AEpLQfMoPjQtiQ5NAg5JNzXC2qYLxL+deKzTB0C5/NPaFFcnIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6xThi8T24XU44xV+k4Po7jxtaXt4VFB5sHGpCCRo/o=;
 b=m+GASrT6mFc4enKw61iyfhZybs4qxrfmXL5rYxCyuA4r0ZjnfLznFxm/8nfNHmajfHN9s116OKesm1flSjQ3JQocZHbIUixBdADmV1opODf/kp5lwovIVGYUCWsT0d9ZTPkw4MoYtFO79ua2EvFJTUA3J9vdNdGpFDXK+ARZdDof7OaI2Plenuz1cbJYYbYmRkZ6vcAB44h0C8ilPGxhw+NdFiDa72L1/gfjiPId4iEoUbzOzYpD2UtvjW56f0S+/vppRE6fOXVomBqnVaVlvyTMSKLaPlTk+wOjJnrZxIR67O2w8IujlfmOrpW9BsSlVhWQ+Lz6Ct2XuahUPeswyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6xThi8T24XU44xV+k4Po7jxtaXt4VFB5sHGpCCRo/o=;
 b=LO6bZwqmhxUNsLnJt5FDN2X4VFooyaUFgW4akT43p81eFHgL0PXTVr3MQ4DXCPhr4cUh3eNOofB2jtmkTG2Lpez8vLz3sXKuTyPcbkjMDTA7q6kKu56PN4E/GqwIHqgVF6OTqkGTSosj1qlGKA/uXu0IlYtJujgs6L1eXxr/rYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8888.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 2 Apr
 2026 11:14:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 11:14:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 12:14:47 +0100
Message-Id: <DHIMJ527R9YL.35QW1YZZ3TOUS@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Jesung
 Yang" <y.j3ms.n@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] rust_binder: override crate name to rust_binder
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
 <20260402-binder-crate-name-v4-2-ec3919b87909@google.com>
In-Reply-To: <20260402-binder-crate-name-v4-2-ec3919b87909@google.com>
X-ClientProxiedBy: LO4P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 23399f5c-bfcd-427f-dd9e-08de90a90d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PhO3m5OoRqDx+Pe14GQOwzsollfxpdf9qo6ybsv125KVSTibpyrHihwKtES78TxBgkN5W5/egxHvHBCfWNmN94DVHEGtRpdkoWYC/Cxi7W802/ELeT+3RBdFBC3reqrury8wV+4FmUjvGzsPdrUOekXK/sQ0dC4rdNtQNghhPaAAUo3/KYkE7EZ8ULSAkSVGxomTzBWVkQeqTQveaqNDCFj8HCfTAMHjHOkG1Z/0yKLkVQBSzy0iNXEt5+sUHZNtgLb12embVBr55Z3ca45BXfHIrh/z8qRjPjiIdX88JqjaPXlfsRyr2G/aHUtMCGM7rMcig3Gu+QLm14FKgBGzLNImwpBJci87onNE2aQ5LK8xnD3aLN3GRaHoQeQiGnHwW5xEVeyTUThCYbx+kFRXCU1rEKNTI5hI4czZvZQn+/C8JD+y7zoKYrnhr5SURyEfjXcgChUgPPW3cWSdmUIsBoGshS4LOP67R3tYf9bf2JttQolLWTjLaRo9/6pFnk24d7NYBLwXvnUZY1S8p3tvwc9NFRgOCC5+MgwePh+pZwdcLVy3X7fGqHD9GU37swTCgOb6qthoZ74Io+500XEs7hqHwerLNYceW9st9OG5T1P2uC9cig3wzdJBVcKlk8A//3VIS/ChKGNsrOHL0Cw60I/9lPpkJ44EB+TGtcPcOvMfWY/EUDZkquBCV5dkFqWqEVrlNSp8c8aDb65pRz9DtZ3pJBJwJ7toqKsZ1UfVibM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDR3SkFteEZqaDkraHhRdVNlQzVvMHEvcVo2d0pKUHhOWGQzUHBXMXhMQk5m?=
 =?utf-8?B?d3plVHRDNFU1b3kzdytqa01RK2h5cDFpYmtudE1xUzByU2Rja2JTNFJhV3h4?=
 =?utf-8?B?TGh4NHNVbkUzUXM2WithUFZqZzB6VHhBdVR2cmZLRDM5Qk13TWdvb09MSEx0?=
 =?utf-8?B?MnpreXBnSk94UDZmcjdaaHBnaE9STFdtVWtIWUx5d21aeXRiVHNuVHIvZWxz?=
 =?utf-8?B?cXQyMnVpSDUyWWxhNUhWOW11dHZuT2lER1RubXZIcHFoemNKYXhwL012SHJt?=
 =?utf-8?B?cVYxRExiUmVFaGQ1UjVRYkpIR1lDcVhtbXNlU2sxSFY1eTM5K2tuYi9zN2lB?=
 =?utf-8?B?cXljMTN4dm5NSldyRHZBRzM3MXpvaCsrMm81U2pleEhXQWdheXQxNHlWYXlF?=
 =?utf-8?B?bnpSUXBZdVFZUDVpK3piUlFXT1pWYmtCdFMyVEVlcGh6YTZ5cGpqdGpiNFBi?=
 =?utf-8?B?bVVVSUlTOTV1QThUajRNSE16MHlNSXlOUEpTUDRRaS85T0xGRUlWNk5iY2Nq?=
 =?utf-8?B?V0lvR2p3eFVRMTQyR3c2d3RjdVVaeUtoR3lYVkR2OFN6QWZFNEI2TjRRTHh4?=
 =?utf-8?B?aWZWTXlCaFFtMzdZelZ0OTVzMEtSZHRnN1VNOWF3dXJxeGhnQzZ1UUxlNWZ6?=
 =?utf-8?B?ZFI5cHNGYXhmdWZRcDhyeEFFbkdkTjNZdk5kQk41R0JhcVZTSUVQMTFTNzda?=
 =?utf-8?B?aEZWdjJ3Skgzbng0cnBQK0hKWFdiWk1EVDZnL2VzQWhEN3BiK3lRSHhvN3pv?=
 =?utf-8?B?b09pVWtnTXJ1Q3VxZVYzRHYvMmt4MHZUK2NoY3pWN1NrdFF0UE9FdUxjL014?=
 =?utf-8?B?Wm56VkZ5dXpodEF1dE5VbVVhNktVZCtON1JRQVVSUjFFb2Zvbm9hbmVEQzR6?=
 =?utf-8?B?Mm5LMnBFVDFONmd4OEd1UlNLZUhWYnFCM0x2c0I4MVJMQmhnTWJiREVFUUdR?=
 =?utf-8?B?WG9vd0hQOU16aWE5emZ2SEdoTW1zaVVzbWprYUUxZVJ6QU51TXdYd2ticzZt?=
 =?utf-8?B?MUV4d3dBajBkMkVqYmFRWTdjY1laVFYzZTEwcDA1RERvVDkwL2EyWjdZZEJy?=
 =?utf-8?B?LytnRkRnQXNEZUVwaE1WekRaR3dHQmV3eVNzMEZ5c3l1Q2Z0QXR4RE5OYlBy?=
 =?utf-8?B?RE4vc2Zjak5RV0NsdXhWSm01eExFMnBOTjRMR01waUlidjdtWXRuY1R3Z2Zl?=
 =?utf-8?B?L1FTWWUrQ2xpeW9mK0NxaW5aSzkyZThDSmcvTGcrVzNKNGtQaDBnZWZjanh1?=
 =?utf-8?B?QzVGOE9oZHFYa0NtNHhVNkErUlZCYXh6SW0ycUhBeVdKZDVFZURkWmpiODJa?=
 =?utf-8?B?SnhQWkplODJ1WDlVSWdwM3VlUGN3ZzRVZ0VwdFBlbG91YnNLcCtOckVoa2R4?=
 =?utf-8?B?d3ByaHUxOGtiekpySXpXMThHMk95Q05Yd3FPWm9WWERjQk1VemhvODFsaVIx?=
 =?utf-8?B?SkhqRTA4aXpSR05BYXM1MytFTmphU3Q1aGZjWEJ0OVB2NFBhaDd3SXk4OHdZ?=
 =?utf-8?B?YjFZdVlaM3lyYW1GRFptYzRQd0RWa2VaVHhaSlJqWmxoOVhiZTJHb1BGZzFY?=
 =?utf-8?B?M2p1Q00weitYZTlBUmtpM2FZRDB4aWlSSDBacVdyMlQrOTl1T2M2UVRFTmd4?=
 =?utf-8?B?OGNHOFlXWG9DV1lYT1ZsRnlkdVBFbGdBQ0VWVDFIVGFSSytuclRVNi8vRE9u?=
 =?utf-8?B?Um5kRXJ3VWUxcC9kaUlUbUxJRUFDUmxpbUVDTGlSd2VBendYY1JWYlMvaHZL?=
 =?utf-8?B?b08wbjgwd3FqbWRqYmlhRU55dG9wQ09qbUwyeUphTG1SNHdrd1RPWDBtNVpO?=
 =?utf-8?B?Skl0b09IYVIxSERqcnJDMUE2Q1BxdllSVzlRZ1FGMW84MTVqRUloVVduUDRW?=
 =?utf-8?B?Sm5ncDFVQjNLd01rT1QxQXkrWHlJS25OVXl3cEszeW1NdzZBaGVXT0RINml0?=
 =?utf-8?B?TFZIMEZ0bzhhK0ZQaWVReXhxcU5nQXJ6TEt1cEpuRStBL0dEUUkvaHo1L29t?=
 =?utf-8?B?QkkwU0J6bTdjY2tWNTVRcmlsRUZnTEFYR1VoV3ljbnRNSnAySEgzNkl1NlV5?=
 =?utf-8?B?eS9zOUxDRXdQc0ZaL0NHVm5XQmFlZDZTM0NrQWFpdlQ1M2kzYlRnSGkxM01K?=
 =?utf-8?B?NXIxVVRBbjhLYjhMK0Z1UDZIVm1zSCtOU2o4UGtYU3kzOTJGTVFqU1d0cC9X?=
 =?utf-8?B?YitubG56RFVLY0p4bTlER2lWTTEyMFl2TXJQZ3pnOS9BRXRDUFdINVFPY0k3?=
 =?utf-8?B?bnk2c0FhVklBWFhsZ3FicjZqQ0YrS1FMa0d3c3kzSmlTeTJoR3djTlRiSC9k?=
 =?utf-8?B?V2pud2RvL0VPNlVKS2tVK1hsWWMzaDVsbmFCa0FGRTFpaU5rbXI5UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 23399f5c-bfcd-427f-dd9e-08de90a90d00
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 11:14:47.6211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihn1Jycuwonyj+6MiOV3d+hF1pGadKgRQ2kaDhbrdqAh/uqADXoT5WnHrwOXfxATIyPFt++Dk2IcKqmaFByHHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8888
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12599-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 91CB538841D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 2, 2026 at 11:55 AM BST, Alice Ryhl wrote:
> The Rust Binder object file is called rust_binder_main.o because the
> name rust_binder.o is used for the result of linking together
> rust_binder_main.o with rust_binderfs.o and a few others.
>=20
> However, the crate name is supposed to be rust_binder without a _main
> suffix. Thus, override the crate name accordingly.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/android/binder/rust_binder_main.rs | 2 ++
>  1 file changed, 2 insertions(+)


