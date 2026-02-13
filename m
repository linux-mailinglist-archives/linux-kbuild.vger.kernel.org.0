Return-Path: <linux-kbuild+bounces-11298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGKQOsTpjmlqFwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11298-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 10:07:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C91344E0
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 10:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 887A2301112C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 09:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004302FE595;
	Fri, 13 Feb 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mZVTj6K3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021106.outbound.protection.outlook.com [52.101.100.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBAC74BE1;
	Fri, 13 Feb 2026 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770973633; cv=fail; b=NPKUdr+8HZekeoT8O2OPRxJHtG6ecHJycJSSLY44VhjZs+xHMjvSUCFLk7UZAEu5Zq2Kqv6E2LE6l4p4FaGCNPcMVqVrrbubHsDi7hHgwMduRYNcwKxwNKqE5nLnfBmmhuyGD2Nj8xMIEOEubRc/xUzbS2IEnUvtKGNFDeAs/hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770973633; c=relaxed/simple;
	bh=HPWMfoj/hiNc+bub6YF+Gh6xecPOumiaOAMiSus9FgI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XC8vZsE+msce0Q6VoURkcNYT6QhCDbdUfrZNhOUd4hw7S+lD98BLdeuyApxwDIGZn45m5aXWvjpXoC43dpIKFgovCs0rFxo+9w7yPwtBrTvVaA1ZtrGVBfYNHYVluTEbbwl+TATJZbkVorS1kFuKqPtZWEHxKtZelOTvseFz/B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mZVTj6K3; arc=fail smtp.client-ip=52.101.100.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxSh+nmF3SH6jnSIzg1TmrNvMJHSiPckBy12+4YCRSRiD/azwGSckrqDS2MUoNowGbwfMHLqCxHYT2yNtWgz/3oo8TKFw4088BZIXxatdMe6igJ2r/+ZJCzbqVmnRLjpi8tYm12xJhd6lbmayrrmGM+3wGOrQxsRMB55XEZ8jlPEK3qMBKk6tB29YZam/Uhj2JPkUSqOaCeIsNKimFu1Q+cRmc1FDKpd+RKKsJ34CQ9NfkXbuS8nMx4ukbjofA6mt/CtXkcdat8krPl/bXa4Y4GhDKtfvv7eZZlvjHk32RKVkyBtebP/z6Pvs+KB8KTlT1AUdiMEw00bJFl5NnaeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o45D2x4i/v8duUnjW8mGDGIxrdo6QtuH0l29BTXcjCY=;
 b=JK68QRIj3fNWGjx6IxycCmcGMdYq98OWZ9BZHA4+Cp5bq6UqbjEqvgvjGw7Dp0mgX8/m1FdP+7xgxquEdXsnCx/ofcL645MBNBge2ajacRNvcbBpDkiLKlYMQvLOwvkUzWRk25TeN1WxGYfnZJ3KBJBxHYVKi3t5Smo75idldOa5kMRQ6q61QHypcxVQLIQICqff3TkxxcmXWLInod1jIXG82BSXSBp+i4Q8exvFJayQgbngpkCm2lBk2NRwPDbBy5NLbzROmQAYai2H4q8nsrnE335pmT1LyApzWFyl31q4vRGGONmWDq/uDjeu+ansW0mWKxZi7OvK7PV2GGSgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o45D2x4i/v8duUnjW8mGDGIxrdo6QtuH0l29BTXcjCY=;
 b=mZVTj6K3ewLFdzoUlKRo0mGK+RCDYMO7OvKzYNmxj/AA6udopGbJxP+aC1geFH1/RqikFpO3c/gZgI5XOhuQTW19qHHLb80VR2C8OC8kcN1/UlKZJjx6OiHctPdxOcyxUaxXSUmU5QBZOCMDYGsZwK/Vww9Ss2XCcjs0lF7hXQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8438.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:46d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 09:07:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 09:07:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 17:06:54 +0800
Message-Id: <DGDPR33UQJVR.2HABXQ4SFAGVA@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Yury Norov" <yury.norov@gmail.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Yury Norov" <ynorov@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org> <aY57Y9WorBLiJR8E@yury>
In-Reply-To: <aY57Y9WorBLiJR8E@yury>
X-ClientProxiedBy: TYCP286CA0297.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: ae5a46fe-39be-4123-f301-08de6adf442d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk9ETHp6WEIvenBGWGlGNEV1RXVXbktZb1FVa3daMzF0SEwrRklyNm5UOFk1?=
 =?utf-8?B?QVlwaHZhN2pZcW5welVGanRlc2ZrbEZIbkVIWnk0U1BpL2VvZnVtOFVadlI1?=
 =?utf-8?B?aHhVRGpOdjRCcjlqaVd6VjNuL2RqSWhpN1czeUUzYnJDWVVBYmpZaEN2UzhN?=
 =?utf-8?B?N2tEeGc3cUM2Wlk2Mm4wOXJjU1RuYmJHRlRqdTNLUWlQN21sdGpWNko0VVdR?=
 =?utf-8?B?QVEvdndUWTMvelZENTVKZVR2YVpYcUVqcFZPcGJqaXVKSEhweUMyem1yUE5R?=
 =?utf-8?B?TFJIMHhNMTg4eU5NSnk4anV4MUY0T1NJd1VYMEMzZ2NFTEMyR3ArV1kxcHBX?=
 =?utf-8?B?dEpWYUZZWUxIWWRZWHQ3bUFQWlV6UjI1SGpPUjUxY2luWXRLcjVidnVBTi8w?=
 =?utf-8?B?ejZUYVVLUEZyQ2VQVVhIYWgwN0t0Z1hYdGZLenhUUkxiYWltV3QzNSs1Sk1r?=
 =?utf-8?B?NlhLYmR4K0VncUdiamhSeWJlNWhqMFNjWjdQWjAyZHdUdlF4NEJYelpwVmZh?=
 =?utf-8?B?V1VnOUEvOXBTWHNQQkM1Y3pYSGlPbVpQbXpxQURYNjBxS1VGNThiSjZvNGNq?=
 =?utf-8?B?bWlraUpPUWhONllveng0ajMxWng0SWoxRWNFczJCdHFUS2FCYnBncWpMKzRr?=
 =?utf-8?B?M3NvTWhXbWRzUnRYVXozaDhJeFBkTU82MS9xa3hMeGdKUjdSWHF2eU52SXlW?=
 =?utf-8?B?Sm9yNXNhRW1LOFVBaWxnMXRyNDVoc0s2TVliVWgxVVBQR2JDM1JpaCtFWWhl?=
 =?utf-8?B?Y1RxbnYxSmRWQnVaTlQvODUvNHJTT1NCOTd3bHFVM1czNnEwd1liZEFMRGl0?=
 =?utf-8?B?RE01bW95QlRURkNQYnBBSVMyRHNyazZMSm5QaVp1d1BiL05IMnU5MzEvVERX?=
 =?utf-8?B?b0tJTUpaNVkxa0R4TEtxSlVoVUxxZGFUUDY0Uk51L0p1OW5pOUtkRDFKWDlP?=
 =?utf-8?B?QXFUZTBvSzlSam5yb1ROd1pLQnlxYzY4Z09MOHJPa0RIMUNPQUNQSVQ2cngx?=
 =?utf-8?B?T0laMElzRTlyWXk3N2dBUXhLcjdIc0RZa3BxVStHKzg3cyszK0hYeGVOQnhk?=
 =?utf-8?B?Q0RBMlJtYmtObUVjZU1PR1pLOEFldVlSN1lwTjkzT1lEMjM5YWxPaFE5RTNI?=
 =?utf-8?B?SzJpM3RNZWFRWjRLU2VQZ0Job2ZiVG1FZERNeW1TcXYyZHJ2anJuK1UweDJn?=
 =?utf-8?B?YTE2Tk1jV2FESmF5TC9relN1NHk0aVR1MzlMSGRWMkg5YmFjMlNOMkZDRUpv?=
 =?utf-8?B?NnowdFpyZDMvVmY5dy80b21RNm4yb0MzcVRxNWRXNUdjNXc0UEtOVWE2NG1m?=
 =?utf-8?B?TlgvT2ZHTmQ1eDd0aCszRnRMQjhhS21iOFN0MGJMaVR4RFo1MkNUdkpYdFdj?=
 =?utf-8?B?cDU4RW5mL0gwbzFQODU2S1dacmhhdG8rYVcrRjk4eVJwaG43RlNFZTVaUlFa?=
 =?utf-8?B?RnVDeCttOUdteGs2eXlVNEZIN2FZQ05sMkpwT09EdXg2UFcraE1TK0srT2hB?=
 =?utf-8?B?M0dZSk5PVGRMbkFnckFXWUpGVDhPWTNMQkNDNUlGQ0NFUmtxMGlxQ2gwSG8v?=
 =?utf-8?B?cklXVmNWcW1xbEJTekJXaTFPNjRqTHFHc1lCL1VZQ2o5MGYrejJDKzhWNFN1?=
 =?utf-8?B?L0dvdTRCWFRaMkN4ZElUemkxanltaTExRGx6K1ErVlQrYVo1NEZDeHI4VXBP?=
 =?utf-8?B?Umh6VnVXQlVkUkk4S0YrdXZycDBRVHJUbys3UlhVYWE1U3NFMXZEdlNxVXFV?=
 =?utf-8?B?d0tLZk9scm9wMnZtWll6MytJemxGb1VsTUxBZkJLdVpWRmpERG9NdWZ3dmpU?=
 =?utf-8?B?Z3VocjFzaW9DTENJWlZORWNwWDk2Y0gzb1ZIRmg0WTZReEhUK1hYdTBrMnhV?=
 =?utf-8?B?M1FzRFlSa2F5TC9ZQ2pUK1l3aEd4NHNyQm8xb0RaLy9pa1N2SW5pdEpqYXpI?=
 =?utf-8?B?Vm9DSTVCR3llNDV5ejdEOXJrUnRrZ0dxSDJVMjNna3VIUE0xZzVFT1QvNUYr?=
 =?utf-8?B?NUloKzMzTUx2UnpWd21QT0xZQXNaTzBkenk1NmxhbWNya2NaKzNiNEZveTcx?=
 =?utf-8?Q?lPc1Ct?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm1YMWhLSTdicVVvMkF3VE1xQVFaeG9GZlZJd0pHbDErL2VWRnBBb2ZTN2xQ?=
 =?utf-8?B?S1BnamhPTnNzVVkwK043c1RsL2cvQzMrNEZ3cnE4bzhHMWxSTngyQTVTZjRJ?=
 =?utf-8?B?K0YwdytMcnR4K1RLOVpaTGJSVWE4RjQwNUhhYVJtVFBmL3RMK0RxdHJjTVVR?=
 =?utf-8?B?dG5hT2p4QU02aGdyY2hTUXRTamwyVTlZOVBMb2xXOCt1Qjg1eXQvVTFKeTdY?=
 =?utf-8?B?RW1GRm02S09iak5ycWpmeHpqVm5yUndDdmJxRnR2dGp0TUJENkZBL3pvSExS?=
 =?utf-8?B?c044anFCaXVxYVYrYlN4Skw3emFtK2QvZWlvMmxxc3JNWjJUanpQQTlTVFlR?=
 =?utf-8?B?YzBzWHg5TEpRQ0ZjdnBuOE9mZ0gySFVza0xDWElrMVdLMHdNNEF5OC9lSUVQ?=
 =?utf-8?B?NlhTSzVRcmhwamd4d09RcUQyYVptdnhycjFOWDNxWUJ3OWNxQW8rbmc1TE1O?=
 =?utf-8?B?QUN0dll6Vmo3TjZjK1ZYYjRDeExKUVBvMkhRK29TR3IxRitkdUxwM0RJemdV?=
 =?utf-8?B?R0pMbkEwcmZadkxZMUk2ajhTSS9vUDNxYkNwdDZGR0JWNktUWXo5NEN5aUJk?=
 =?utf-8?B?SUJ3NGE0TnJiQXhXanBmL210VDBBTVlvMkxnSDgvemxraWxVZG0rcE1BWWlx?=
 =?utf-8?B?UmFxSjgrWTBCSldOOEdEc3ZzMzk3MWtKb3pxeXI2YktpYlkweHdQa3dTQzBw?=
 =?utf-8?B?aEtKNHpwdDdBQmMrcjE2bWp3bmFpZnFaSzFYY1hmeU1UWHhWQnVTc0EwYVdO?=
 =?utf-8?B?N3o1bTNqOHdIUDlPeURGdmg3RUpSWTBJa3NNSDc2TDZmbDlXWnhKRmtoZ2lh?=
 =?utf-8?B?amQza29QakF4MFhFaHdaSG4xK3FIUVBwc2dlYk1vMzJUeUVlc1U0WTZublVN?=
 =?utf-8?B?dnV3TXJtRU1LbG1adGdZcm1ZRGVLVXllQzJyV2QrOGNVR0tEbWxINmkvSlZR?=
 =?utf-8?B?dzNUbHpmdzZtSUJ5L2lRS1ZLSUp3ajVrN25JUS9WUXRLMWF6aTRYbjlhb2hU?=
 =?utf-8?B?RGxRaEVWZjhDem5tcUNOOVdhUml0dmJFUkRoTklEakxvNThXSDJrbHVCTU5t?=
 =?utf-8?B?ci9EQ3c1eEo0czRZTXdSVnBOeVZURzl2bnFnUS9CTDVlZklQYnlnUVJqVGd6?=
 =?utf-8?B?dklRN0VRZzdPSHFDb1N0bkZkM254M0tIMXVDUnhpOHkwQ2tHSnRGLzRLbTZn?=
 =?utf-8?B?cExzVHRScFQvQ3lSbmpPREk2UktzRjlLYXhHUnd4NXJzQmRBN2dDdEcwV1Iy?=
 =?utf-8?B?bVJEVFRVM1ZRd2ZSVXBnKzlBZEJUWWNjWklSbmR2dDlLdUZFK3REc2dzenRJ?=
 =?utf-8?B?VGh1NlZyZmdsT2N3WldwbUFTcm53WVIzL0pmUmJaZmt6RUtoN0lDRlNvOXBy?=
 =?utf-8?B?WGtibjVteG5hYmx4OGJrb0YveXVodkFFVHVnS3V4amtsaEpNR2lsWGhrbEt0?=
 =?utf-8?B?bDJ1My8xSFZrcm5yY3dkcStNTGZDaitVN291OG83MFhWZGdWbmFWNzViNStT?=
 =?utf-8?B?eFJOUTVmeVFBMEFvNEwzT0NnZm0zeDVmcTF0UUlJd2k2WTV3MUZhYTRuanpQ?=
 =?utf-8?B?eWJCVThtSnZuYXJ6TGQ5YW04UTR4S0xiSUZ5TzFlM1hNZjdYOGQ0MXBxSitE?=
 =?utf-8?B?VzRud2Nmcm9BVk9vTFU3Y0VZeWgwSEJ5MUhockFiMU5DU0dYMnJrVDZ5OVNp?=
 =?utf-8?B?bUFKTE5nNjlISjg0Qk1VN21OZjJnKzBHWjZQQmxVUkJxdWJnWVQrSFYrRHdL?=
 =?utf-8?B?S3NLOGRVRk5RRTE1SjJpNHJPTE5qR3NCNTFKaEppNmhVTUUxS0xsb2NlWFA2?=
 =?utf-8?B?amYxUHdxazFTWmtJU1M4YWxYYUw1bkhGaVBNRXhNa2FyTnRQdE5Fd1FseEhW?=
 =?utf-8?B?S0kzVjh3WTh3Q1ZZeFVsb2lpWjVKd0NNaEl0cWt6QVI0WCtGUS96NHVTNHpP?=
 =?utf-8?B?Mm9jZU1GNithTmdMMy9WcnMyajU5UW5kallqYjZ5THRlSk5UL25ycGVHSE5J?=
 =?utf-8?B?UWFDdWtTbVBDdnFWU2JkWmZwbHhnZkFzUnd6MHVZTDNsSDQxd1NWeUx2VzI4?=
 =?utf-8?B?K1U3bHFndmFjOHorcWdCRWkxd1pCZStLR0JBQnAyMUdKY3NMVmJVUHBkN05p?=
 =?utf-8?B?TFBYSjVDTjB3UGNQZnJVNHhyY280ZUgrMUMwRG92VWlIVHZKS1E4ZUxldGIz?=
 =?utf-8?B?UU50S3lSdStkR2xIT20zbCtEaEN3Y2d4UHRqUDdHczlWYyszdGRZR1V2MUcv?=
 =?utf-8?B?T0d3a3ZTeDFIQlRqcU5QdlplODlUaW1zMmIyTHNLZE4wTGlFdXFlY1NwemV6?=
 =?utf-8?B?MkhyeTJJNW5uWklhZnFLOUw4RGk3Uk5XWGQ0OXAzWGFVT3JtWGQvdSs4KzBQ?=
 =?utf-8?Q?WLjcKMpe2H31EHrjG1Nb7XTDoHysoJfVyFfBz?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5a46fe-39be-4123-f301-08de6adf442d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:07:08.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26z+DFdH1c7xIidF7JElLteHMFV5NrpSTPeqh3McPPWUZBxT3MBb7wheEYsLiKxNdTNh4CtPV8tLNZdqQGZFpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8438
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11298-lists,linux-kbuild=lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,rust-lang.org:url]
X-Rspamd-Queue-Id: 4B3C91344E0
X-Rspamd-Action: no action

On Fri Feb 13, 2026 at 9:16 AM CST, Yury Norov wrote:
> On Fri, Feb 06, 2026 at 05:12:50PM +0000, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>=20
>> The macro is a more powerful version of `static_assert!` for use inside
>> function contexts. This is powered by inline consts, so enable the featu=
re
>> for old compiler versions that does not have it stably.
>>=20
>> The `build_assert!` doc is refined to recommend it where possible.
>
> This is a good place to actually explain where this thing is possible.
> =20
>> While it is possible already to write `const { assert!(...) }`, this
>> provides a short hand that is more uniform with other assertions. It als=
o
>> formats nicer with rustfmt where it will not be formatted into multiple
>> lines.
>>=20
>> Two users that would route via the Rust tree are converted.
>>=20
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  rust/kernel/build_assert.rs | 55 +++++++++++++++++++++++++++++++++----
>>  rust/kernel/num/bounded.rs  | 24 ++++++----------
>>  rust/kernel/prelude.rs      |  2 +-
>>  rust/kernel/ptr.rs          | 18 ++++++------
>>  scripts/Makefile.build      |  3 +-
>>  5 files changed, 71 insertions(+), 31 deletions(-)
>>=20
>> diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
>> index d464494d430a..e40f0227e1ef 100644
>> --- a/rust/kernel/build_assert.rs
>> +++ b/rust/kernel/build_assert.rs
>> @@ -41,6 +41,45 @@ macro_rules! static_assert {
>>      };
>>  }
>> =20
>> +/// Assertion during constant evaluation.
>> +///
>> +/// This is a more powerful version of `static_assert` that can refer t=
o generics inside functions
>> +/// or implementation blocks. However, it also have a limitation where =
it can only appear in places
>
> "However, it also has a limitation", I guess?
>
>> +/// where statements can appear; for example, you cannot use it as an i=
tem in the module.
>> +///
>> +/// [`static_assert!`] should be preferred where possible.
>> +///
>> +/// # Examples
>> +///
>> +/// When the condition refers to generic parameters [`static_assert!`] =
cannot be used.
>> +/// Use `const_assert!` in this scenario.
>> +/// ```
>> +/// fn foo<const N: usize>() {
>> +///     // `static_assert!(N > 1);` is not allowed
>> +///     const_assert!(N > 1); // Compile-time check
>> +///     build_assert!(N > 1); // Build-time check
>
> In the other email you say: the assertion failure mechanism is undefined
> symbol and linker error.
>
> So, maybe:
>
>      const_assert!(N > 1); // Build-time check at compilation
>      build_assert!(N > 1); // Build-time check at linkage
>
> Because compilation is a part of build process, and referring them one
> vs another may confuse.
>
>> +///     assert!(N > 1); // Run-time check
>> +/// }
>> +///=20
>> +///
>> +/// Note that `const_assert!` cannot be used when referring to function=
 parameter, then
>> +/// `const_assert!` cannot be used even if the function is going to be =
called during const
>> +/// evaluation. Use `build_assert!` in this case.
>> +/// ```
>> +/// const fn foo(n: usize) {
>> +///     // `const_assert!(n > 1);` is not allowed
>> +///     build_assert!(n > 1);
>> +/// }
>> +///
>> +/// const _: () =3D foo(2); // Evaluate during const evaluation
>> +/// ```
>
> This part confused me the most. But after all, parameters in rust
> are never constants, and even if foo() is used with '2' only,  it
> appears to be a non-constant from the const_assert!() POV.

Yes. For example,

    const fn foo(x: u32) -> x {
        build_assert!(x > 1);
        x
    }

require use the `build_assert!()` because it act on value `x` which may not=
 be
constant, as `foo` can be invoked by runtime code.

Therefore, body of const functions are not const context. However, they're =
still
restricted to perform only operations that can be performed during const
evaluation.

For language lawyers, this is the reference:
https://doc.rust-lang.org/reference/const_eval.html

>
> Seemingly, there are only 3 objects in the language that can be
> specified with the 'const': functions, items and generics. And
> const_assert!() makes sense (doesn't break the build) only for
> them.

Very close. `const_assert!()` can act on invocation of const functions on c=
onst
values, but not values inside const functions. So in the above example,
`const_assert!(x > 1)` inside `foo` is not okay, but `const_assert!(foo(2) =
> 1)`
is okay.

>
> So, the difference between const vs build assertions is that const
> version is only applicable to a certain type of objects and is
> supported by language.

Correct.

> Contrary, build_assert!() is not a part
> of the language and in fact is based on a linkage trick, while
> allows broader set of build-time expressions.

The reason that I want to omit "link-time" is that our `build_assert!()` *c=
an*
still be checked before link-time. Again with example above, user can write

    static_assert!(foo(0) =3D=3D 0);

which means that now `foo` is evaluated by the compiler. When this happens,
`build_assert!()` also abort the build during compilation time, not link-ti=
me.

Best,
Gary


>
> And altogether they make sense and even nice.
>
> Can you please consider to add the above passage to your reply in
> the other email, and place them in the documentation?
>
> With that (or without),
>
> Reviewed-by: Yury Norov <ynorov@nvidia.com>

