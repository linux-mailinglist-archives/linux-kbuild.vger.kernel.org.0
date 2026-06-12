Return-Path: <linux-kbuild+bounces-13730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5uQyBn+7K2pXDgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13730-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:55:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2046777F3
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=gPA5pFSY;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13730-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13730-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2960B30CFDC8
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 07:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAA638E8BC;
	Fri, 12 Jun 2026 07:52:29 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162BA2BEFEB;
	Fri, 12 Jun 2026 07:52:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250749; cv=fail; b=i5PXU2rBDuoRYES6bKvtEH5Ba8WBwBmA+AHDwYAh+/1NBCCxD3g+GwOrZET10UTmiq4uTEhIta7G5Q7GsfGn2tLBtH8deu8+9+WC+DZWAoqXroP9UqQAVV3f7Nj0iNrOyZdmaRkBY5/oTcg1hENgWVPfkozkjt78Vd92kaXhfHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250749; c=relaxed/simple;
	bh=tptnx023gWYcyfykmZagUk1nRRd++TwQg01mtuFAeIA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o0x01LhpFuwjxLapxqxbX4WcZ7MSS6NnNWZJ7/+MJJsVGkVm26qAbNZagBTyeXVolTRlkAmXUIUBZ8f+mwHC9Oo6/YOVZxWFnnjQ7i/ivp3DcjHKcyXgUVQ+g6oJC5s7RzMqiL5R3Rf/k7Sq1pOEiYFvPvmIYYHhzXd8xqICf4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=gPA5pFSY; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iezzx8do/a6MW66yPr9b0ZSiuS23hNoOrdEV0U7GVsaG80enWTcrPFgkD8c73xYEDZizJ4h2VpwZPkzcZFBkBYIGPfUwzyd7aIKs7oI/FuPiNuFo/thsH4ur3e/Boaw0vwne6Ap5Ic811mmifRTFgJ1hBEnxjNOuoQ7ciizTEqPFb7L9gfnDJSigMs72+xY9evv/1BGN5iu1Eg4eT3QR2I9AfrVbgZIEGqUwyiEd+iNLTWl2W7vQRc01SUYKGhEVm9HIhE7XcclnHtuVWeZpdjnbi6CSzIzJ9nJGH++NF6WPr7jKB37TGsodenU+knKGh+UNfzmsnWR+mxe82xLBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=by+in0PnD/XXW+ePvHgc7T/EhpEgDfg5CvnjVvdq5JA=;
 b=U1QUpQKvvs/Vbi2SfPS7XYgsqRk+1w0HUUyvdSqvV5N24PvHESyjEoUA/3cB0k7/QW1qGX40Wqlc/H8zf0aFAxVVgHXonhFVuxusH0PleqNiWMdrjZVkmMJazi3mxnOBp+teuOSX5IqQNt1P+sRaU0g+Bba+vy7MD22fw4eYUPbv36HRe1CA9wez3RP8RYAlAfTXrwssIAS9twiXhJfH8+W+ijouTSXEANjVW+nkg7qRcChzZeWXrQqYCKv+ZXUFZnHCpWOgLyqERot4ca+7A+klNJSmxE0vLWQ+j8zvtTPJmppczuJ7Lt6fYJO+LXhyxtN8TrybvUXPMTC/btwMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=by+in0PnD/XXW+ePvHgc7T/EhpEgDfg5CvnjVvdq5JA=;
 b=gPA5pFSY4J1MBEiQfA7MWqqKLMiFCAWaKSF9JM5/VtUPiHjk8gZe/psxe5q1le7nSZAtaTKgA0OjQ8mSg7oJDYrCU7MOP5pRVW+ybBn3IS2wtM2KX9khqqYhgENzaPB8o6DzcsryOYhYsewAsftlSxdiFq5oJxDoiGtx6ZTdAh3hm3o1rdAxh8uEyQaP8egrAqWOE3/xhILs9qbswjjTgKPEjvPmQtE5pIgWRIsqbLAKULTtphuoV+fx9svgUjCRxmeA296+asid5Svb1PCeqWCcbZp3Sua8UIR4LDlGSVGSxU+Pwz6HC52zUPf9i6Jze1rkukLNay8nfshBp1rEZw==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AS4P189MB2256.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:584::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 07:52:22 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 07:52:22 +0000
Message-ID: <dfdcaf30-5cb9-43ff-956f-99292d8cdcff@est.tech>
Date: Fri, 12 Jun 2026 09:52:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/6] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Alexander Potapenko <glider@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Dmitry Vyukov
 <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Yunseong Kim <ysk@kzalloc.com>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
 <CAG_fn=UMJJz+3zipowaC4uTvcbC0gvXbBRaF0UUJ_1AW+oWNGA@mail.gmail.com>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <CAG_fn=UMJJz+3zipowaC4uTvcbC0gvXbBRaF0UUJ_1AW+oWNGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3PEPF0001DDA0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6c7) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AS4P189MB2256:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3030ff-e79f-4e64-a478-08dec857894e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|56012099006|6133799003|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7nxTbyNbrSGAPkpNLLb/BU2ctrZ0w6ekjyc8GKeiPalm3j4PknP2BMgK1gPBA/dVSgEYDr4YJ8+P+iLyrThBmk5nEbejROEAOt5WYZxb51eNq37yN1DfdPfZj11JG1b3Fy9Kr4ZFpaY9bgzXOLnhOYfmKFl4zB+kL7A6RkZN+PQRtjnOgepXWIL0iWtfMcEpN7VrXgXQ1UESVWssMemdIX4OsNAUjrC43Mag8MeH05koCZtP6eMzQcGHtrfXj65fAwbui7tSgTvu/dpZ7/dN4//9/nH4Uctd3hx3UbBZ7Gc+IwX0rKht3r+g7IcNAQmUPOTA1H0mIvgqCc+DjBt/vi0hwCLaOlNQYGWwA7Ozx+vIuwjlcCM7ni3o9/+8gW9j+COHs1v3jdX2fwuVs8GJZWbZ2YgNrtTeFMDvVWFst/e7oghRr6KWZpjgvE8Lg+zZkQYG7z2Y9VS5Kkdkte9IUMbUt57FOfq92wTUx1gDjcYoV38nbR5RPwAD43Df4LL9S/HSTBxWboLEZZx5S7gseKe9oG73AwOZTB43a9d93LWIY7/qyM+HBqcs81kiBp/KGoGjeb92UP44gvIzDcnueedMqSLxYcNLHl/kOWJq5OehuSDB+SaFCwZTzNa8wwvvdNEoMXf8Wj2Y90hLAgxOEi5jnQlPkyXCb8TgayNJMopkx58LobBu9Fl3mWyh1GAnTiF2XriHRJ3omvcXKuGjRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(56012099006)(6133799003)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWVyWkM0UnF1OTJxSVl3YmVRRFhHdUhkd0FaMHl5NDE4Smhsd1lYYXJNSGtk?=
 =?utf-8?B?bFF4Znl0aEdnMnNFZlFWWS8xNGtENmErZXhmVysyOWQ3bzZ4NVd1OFFpd3Jm?=
 =?utf-8?B?TWRzZ1krbjR0SFF6SVVFNU53YThBWEFQSkpmckxWN1hrSWkzZlpQdHQybWhK?=
 =?utf-8?B?T1RMY0RnRWRBcCszNlZySFRwdHVFNkVzRFlSTUFtRzlPRHg0MXQzc0tjUDEz?=
 =?utf-8?B?SGgvTFJCNW52Uml6TWpjTFhjQS9pNko5MHdUNitGWElRTlJQRTBDdnpaNHZi?=
 =?utf-8?B?UFNTS2xGelVhaHJySHBJVVBUY09MUnBCR2hsVG9ZeWhxTy9mUHNTdzBTdUlG?=
 =?utf-8?B?ZzBwVTd0MkFuK01ieUJGQVFxMUVWTlpna3J6WGhoYndtMVRrNEprQ2RsZVJr?=
 =?utf-8?B?K2JPVzlyQUcxWFpHZ2M1TFl5ZjRsKzViNVJLeXFtdWZiZnVNVEJnWDdsZnJQ?=
 =?utf-8?B?enM5bjhCazdZUlpvdkc5WWFWRGE4LzlpYmJZcWFRbVNjK1pMVm9NemtRRmN2?=
 =?utf-8?B?cHVCYWFlMzdTOG5BU1pVSDFzY0Z3a1BPWm5xMzBuMzUwdDN6RFV4L3hUcGdH?=
 =?utf-8?B?ZXdmRUZPZkFvRENyYU1XdWJJK0didHVvQzlVWXZXdFM3U082dGtnRnhlZlRH?=
 =?utf-8?B?cXExazdrVDJzb2F6aU5MSnlkRm9sNTJXWnFZbms5ZzhHaE1yWE9SUjRqS0Y4?=
 =?utf-8?B?TXNLblVhaFVzTHRqeEpSblh2eUhpbUNORlJMWlA4Yk1iTEUxelN4d0xzUCtM?=
 =?utf-8?B?eGhsZ2ZoeWo0WlFBYVlDQTFrbzJtRUtQODI4KzI4ckViYlNBdXNyTkFpUE9M?=
 =?utf-8?B?QlRTWHRQQTVnK2kwcGdCeUtEU2hLSTQwcTh0YU1acjNQM3VqMlFURHQ4VENx?=
 =?utf-8?B?cDFRSnAyVnBrUTlDSWhqeHpkKy84Y1luY0R3ZytmT1dCY1pveVVVZ3ltcU1v?=
 =?utf-8?B?bUdob0M1eTJjRDFhZXBWSzFoTlRQblZkWEwyK3BvSUZoS2NocTdHMDBEcnFu?=
 =?utf-8?B?SHZydFYyRlNMYnA5cFM2S1ltdk91a0VGYnE5TEpHclJCVmtXMEI1OHVnOHQr?=
 =?utf-8?B?THp4ekcwSFpQaGdSbmJ5SFBTYXJsZytkdm5RUTdEZzBCMzFUUkFIRkZ2UzFl?=
 =?utf-8?B?aktzYmpSSzFVUEtXdnlPNUF5bWdXTnNWR251VHN4OTVYZERiQ2c1MjdsU1J1?=
 =?utf-8?B?S1VQeit2MDJqeldVZ2liVVl0ZTlZbUdEYXR1UmdlT1ppWmNmN1gwM2pSc1pu?=
 =?utf-8?B?YnYyV0JlSnhsVkxNQmVvSDhtcWRKS25ZUGtLQUNPSjVaOFNBTzlObjFGWHNG?=
 =?utf-8?B?Y2pnT0NqWURGbzJpK3JIUHdLTWJpczlyQVM5a3hIZXNQQUV3ZmdUcTZwZVVq?=
 =?utf-8?B?L2VLdlJqeGJQK21HM1hiUDZoc1ZkYVY3U2VmWUNBU1hZQjgzYWl3SWhFcVVG?=
 =?utf-8?B?TmMzU3owRTdSdzVvOE9iVEY5UjZtdUgrQzJ2amNnMGdkakZxZjRRV0NibU1W?=
 =?utf-8?B?S0hTSnYwS3ZuOENYWVhYakNEQjBWQmFwRXVrNW45WllMcmpyNHE4VStjM0Vw?=
 =?utf-8?B?OVJXTmNDcmwzUExaZFBiRld2NmNIeUtSYnY4TGk3eVBCRS9HVStNU0w3bHNu?=
 =?utf-8?B?bkRjRkVsWjA5Y1VjMEtWR2lVSXZUdkFjZE9aekFRUndNL200N09wWmNteDBn?=
 =?utf-8?B?cXByOEk5dkNHQ1hBdXNVY2tqbVFRa1dDcFRnYUhmRVJ1NFhJOHRqRFIrS3Vo?=
 =?utf-8?B?VFBzcHpCNlcxZytaKzB2cHdPY1lVL0psaXAyMllmRkdOWlpSK0dqUUhsd1Bh?=
 =?utf-8?B?cm02aTR6M3RlZWoyeWRadXpEQ01NQ2p6VGdPb2l5U3p0OFVDZXJnbzRkbVFz?=
 =?utf-8?B?NldWVVNmcVpSSVNHd0prd0crRzhNNnJEczg1WDgyWUp2aXRvS1RHK05IYlhD?=
 =?utf-8?B?N2J5QjRNYzhYd1FCZVNqYTd6Z0VaZnlVY0RNQ21TWE51M3ZtcWtsNkl0U2wr?=
 =?utf-8?B?ZDRWbC96SXlwQU85bHlIOGc3MlhWd0l2YjF5MngxL0hUYjB1QW92c3RGQmJn?=
 =?utf-8?B?dE5zQXk1S3NpUGNUSEE5ODE2YW93aVNZbDdFeWxxZXI3Z0hZWmkvSWw3L2di?=
 =?utf-8?B?T2FJZ2pQZ2xJRGZRTTBRRC9IRU8rQ2RwTXRDNUUvTTlVaHFDcURvYm9pSU83?=
 =?utf-8?B?WjB6OUpHbzcwRGtaQklIWm9vZUU3bGtIaktRUXB0UnM4aER2a3NCb0lreGFS?=
 =?utf-8?B?UmxBbnE1anlzVU9JVGpIQnRxYzVJdkZNWFpDY0IyQTRDTUZrcFpRMm9wS0ZX?=
 =?utf-8?B?czhmNXpxdUdMekJsQWc5cEI4YW11a2trVm9YMCtUTmtuUDRFZEQwZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3030ff-e79f-4e64-a478-08dec857894e
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 07:52:22.6729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MS3LvAccxqBSTxAtsrIgMy+0fThrMWzpYXYtPjAzJFSuWvdq7jfXN4ZkXJ8csivjqEkb1acpV0nJ3hTGbe9QOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2256
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13730-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:glider@google.com,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[est.tech];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[est.tech:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kzalloc.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,googleblog.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D2046777F3

Hi Alexander,

>> - Per-task buffer: task->kcov_df_area with atomic xadd reservation
> 
> I don't understand this line...
> 
>> - Recursion-safe: notrace __no_sanitize_coverage noinline
>> - ERR_PTR aware: skips struct expansion for error pointers
> 
> ... and this.

I updated this text at v2 patch.

>>
>> The callbacks (__sanitizer_cov_trace_args/ret) are inserted by the
>> compiler when -fsanitize-coverage=dataflow-args,dataflow-ret is used.
>> The Kconfig options depend on cc-option to verify compiler support.
>>
>> Buffer format (TLV records, all u64):
>>   area[0]: atomic word count
>>   [pos+0]: type_and_seq (0xE=entry, 0xF=return in upper 4 bits)
>>   [pos+1]: PC
>>   [pos+2]: meta (arg_idx | arg_size | ptr)
>>   [pos+3..N]: field values read via copy_from_kernel_nofault()
>>
>> This is completely independent from legacy /sys/kernel/debug/kcov.
>> Existing users (syzkaller, oss-fuzz) are unaffected.
> 
> Does oss-fuzz even use kcov?

Also, I removed this text at v2 patch. I mistakenly confused it with another
usage of KCOV with a other fuzzer.

  https://security.googleblog.com/2024/06/hacking-for-defenders-approaches-to.html

>>
>> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
>> ---
>>  include/linux/sched.h |   8 ++
>>  kernel/kcov.c         | 291 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>  lib/Kconfig.debug     |  22 ++++
>>  3 files changed, 321 insertions(+)
>>
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index c4433c185ad8..03be4b495f70 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -1533,6 +1533,14 @@ struct task_struct {
>>         /* KCOV sequence number: */
>>         int                             kcov_sequence;
>>
>> +       /* KCOV dataflow per-task sequence counter for TLV records: */
>> +       u32                             kcov_dataflow_seq;
>> +
>> +       /* KCOV dataflow: separate buffer for trace-args/trace-ret */
>> +       unsigned int                    kcov_df_size;
>> +       void                            *kcov_df_area;
>> +       bool                            kcov_df_enabled;
>> +
>>         /* Collect coverage from softirq context: */
>>         unsigned int                    kcov_softirq;
>>  #endif
>> diff --git a/kernel/kcov.c b/kernel/kcov.c
>> index 1df373fb562b..d3c9c0efe961 100644
>> --- a/kernel/kcov.c
>> +++ b/kernel/kcov.c
>> @@ -353,6 +353,288 @@ void notrace __sanitizer_cov_trace_switch(kcov_u64 val, void *arg)
>>  EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
>>  #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
>>
>> +#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_RET)
>> +/*
>> + * KCOV Dataflow: /sys/kernel/debug/kcov_dataflow
>> + *
>> + * Completely separate from legacy /sys/kernel/debug/kcov.
> 
> Since this code is completely separate, could it be put into a separate file?
> I think kcov.c is too big already.

Thank you again for your guide, I updated it at v2.

>> + * Own buffer, own ioctl, own mmap. No printk — buffer only.
> 
> Can you please not use these long dashes in C code?

I removed all a the v2.

>> +/*
>> + * Core write function — no printk, no locks, just atomic buffer write.
> 
> I think it's okay to omit what this function is not doing.
> 
> 
>> +
>> +       /* Atomic reservation */
>> +       pos = 1 + xadd((unsigned long *)&area[0], record_len);
>> +       if (unlikely(pos + record_len > max_pos)) {
>> +               xadd((unsigned long *)&area[0], -(long)record_len);
>> +               return;
>> +       }
> 
> Have you tried compiling this code on ARM64?
> I am pretty sure they don't have xadd(), so it won't work.
> But why do we need an atomic increment here at all? write_comp_data()
> performs the same job, and does not need it.
> Or am I missing something?

Thank you again for pointing out. After updating to the READ_ONCE/WRITE_ONCE
atomic pattern, Testing results based on v2 on arm64 for the Rust for Linux
kernel module(eight_struct_args_rust) are as follows:

 do_el0_svc({0xffffffffffffff9c, 0xffffffffffffff9c, 0xffffffff, 0x0, 0x0, 0x0})
   invoke_syscall({0xffffffffffffff9c, 0xffffffffffffff9c, 0x38, 0x0, 0x0, 0x0}, 0x38)
     __arm64_sys_openat({0xffffffffffffff9c, 0xffffffffffffff9c, 0x38, 0x0, 0x0, 0x0})
       ksys_write(0xffff9a031231, 0x1)
         fdget_pos(0x4)
         0xffff000004421cc0 = fdget_pos()
       0x0 = vfs_write()
       vfs_write(0xffff9a031231, 0x1, 0x0)
       0x0 = _RNvCsdfZGIOKgjaD_22eight_struct_args_rust13write_handler [eight_struct_args_rust]()
       _RNvCsdfZGIOKgjaD_22eight_struct_args_rust13write_handler [eight_struct_args_rust](0xffff9a031231, 0x1, 0x0)
         rsf_1 [eight_struct_args_rust](0x11)
         0x11 = rsf_1 [eight_struct_args_rust]()
         rsf_2 [eight_struct_args_rust](0x11, {0x11, 0x22})
         0x33 = rsf_2 [eight_struct_args_rust]()
         rsf_4 [eight_struct_args_rust](0x11, {0x11, 0x22}, {0x11, 0x22, 0x33}, {0x11, 0x22, 0x33, 0x44})
         0xaa = rsf_4 [eight_struct_args_rust]()

 ...

Latest test results from Github CI:

  https://github.com/yskzalloc/kcov-dataflow/actions/runs/27397351811/job/80967927283

Best regards,
Yunseong


