Return-Path: <linux-kbuild+bounces-4059-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D1799A35F
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 14:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3EA285BC7
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 12:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F779216A3E;
	Fri, 11 Oct 2024 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZMLWP0HQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022127.outbound.protection.outlook.com [52.101.96.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901C2218584;
	Fri, 11 Oct 2024 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648409; cv=fail; b=D2UWsn8u/XRpxlUQC8kUCwPrmSZGTK8nb7yb44uNGAf3K/4mj9xKsBINAN751RyfW4FasJaN98nIIqSUhktxGFFBs9UuyCGXcyS5UxV9EwOQ2h/gHAMspo1DgzqzqjUq+TS4t1UdOqZnGfUEfq0JnBwyRhVInSUrG7usO35NHR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648409; c=relaxed/simple;
	bh=gSj6+3Jq8OLy39eV5aDlIC+02J6ntP9XEsJwsQeetpg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RBQW3ABQX1LCQRdNnN44NehjJJ5EQzoBjqapOivHdTFgQTBoY6YmU6G20t/7Puz/ElYYRsOpjXR2LrEa2OQa5kXHwVPP45QM6yn1SddS6GUvm+psEp5gIfyVtexq4B/3irHoeGpYTy+aFSNMiD3DzPF6WMKZF73IYoNwYOjxsEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZMLWP0HQ; arc=fail smtp.client-ip=52.101.96.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYbKRI9XWO6BQ9FXbDN/GskJgISJIV+RNsdSRGGm5Mtnw69/gRhnRwS3GODpc+Kvl8Zlw0gqQBdp7REOFY7+X5eCswqh5O42CP/YCkErOLFdsDip4BD+H6VDs7eWn6N4x9wkD3dG7oMBXEiU48u0InC6p/tW4g9Vq2bqo2/Sajo7T2WxqRAQoagIrTNvu2wUm+j/Fig4P8X/m1qi3xh9vaKhdPJMTJMosRu+u8rpbALfwtVo/3Cv8WF3fVGGvKmC3XPYmbpqsbOtfT+JjF5qoPEU1t2FBmJG6zPuvKohv5A3bQqwoaFhZM5NSFTOYPml98F84pQp/116gUfseTaVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSj6+3Jq8OLy39eV5aDlIC+02J6ntP9XEsJwsQeetpg=;
 b=DZ+PrYE1ihRHrSwfnhepmpoRi9KXUZ2DTG5GODynvxtkiqZ3yvRBr1oW5QzAmPRVZFbbreNgO4QmKGS9Ef2f6XGC5YpCWY6DXdUnKedtqZ42WRYBitdLUL2l1yW36i3WF1QIEOBm+Kt58Zn4Vzt1FFMsWwPdtkLuOUjyz5nib9vHDs43J2XRNKsTD9qSBgJ0TJ0xjCvqM2b/RMKILSm+yfGnH+wHia+9ncwta1tINknYLxUjQzQx19x5xrotT/qPVQlPCoFtID7OhhweTWCgoDlsfjf8Gns0pA5DDb1OjfCXdVJ+tQqFmw6ljfpwpwepmrXlHcKgG6YP8hecAOT4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSj6+3Jq8OLy39eV5aDlIC+02J6ntP9XEsJwsQeetpg=;
 b=ZMLWP0HQSijN+tSShsZJIBqY1sUPDUm3CUWLlu7w4Jt0W0Un2uZ5E1V3oT6jEq51EKVt720HgeAJCB5p1nGZ6YOdXfDbCM0JmyUSreONxlFOiFoZE+wR+xiIclt08NxMhatbc0l/KaptFmiZIW2qc+BQq+6OQxNaQWfG/OGfwDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO8P265MB7672.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 12:06:44 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 12:06:44 +0000
Date: Fri, 11 Oct 2024 13:06:41 +0100
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 Tejun Heo <tj@kernel.org>, Yoann Congal <yoann.congal@smile.fr>, Randy
 Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Jens Axboe <axboe@kernel.dk>, Jann Horn <jannh@google.com>, Mark Rutland
 <mark.rutland@arm.com>, kees@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 rust-for-linux@vger.kernel.org, samitolvanen@google.com
Subject: Re: [PATCH] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
Message-ID: <20241011130641.4a8419c1@eugeo>
In-Reply-To: <CANiq72ne6F1HpoA5gLYu9K0CcNB13JUFK5QgF_Cf4tAyvOm4qQ@mail.gmail.com>
References: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
	<20241011114040.3900487-1-gary@garyguo.net>
	<CANiq72ne6F1HpoA5gLYu9K0CcNB13JUFK5QgF_Cf4tAyvOm4qQ@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0533.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::18) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO8P265MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 5189f2e8-d91b-45b9-83b9-08dce9ed2c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWZ6YjRHVXhZZzRqQ3lvekxhUnl2WXZMNHVhd2FnUzEzOGoxaVZYb2hkKzNZ?=
 =?utf-8?B?TUszQ0xvczM0OHgrb2R4WmdvR3pqRjBjQmtYYStYMXhUZnp5ZTBMWDBVQXlD?=
 =?utf-8?B?SUlLaG5hU0lKdHhNaHVRYkV6eG1rakxxdGNDZ1FuejF0U2Q1RUJCVDhBVjZa?=
 =?utf-8?B?UDIyRTQycDYzQVA3R1AvK2lVWUtpL3luY2dYdUtqMUZmS0M5K25pRnRNZHIx?=
 =?utf-8?B?OVRVcEhDbmVRQi9iWHVhdjZkMm9Zc1ZKSStSM2tpUUtVaGJ5clUxaEVvTTZ5?=
 =?utf-8?B?Qm9kUmZqWEZKRmd2QnErbnJEOUh2eGRFM3FMSW00TjNZejcyaU9JTnF3NVJJ?=
 =?utf-8?B?aU54dHp1RUFFdDdoUHhjRVo3Rm1MNVp6SituSTdkcmF4RElMODFxd2puL25u?=
 =?utf-8?B?RVFQa29sQTM1ekkzTGRvWURjQWdaSDVDNll6dXFGOHBOWG1WVkdrMjczckt6?=
 =?utf-8?B?N092YXFoSmMwRXcwZ2UyRkRTcFBqdWJvaFk3TnpZZHM3SW94SEJRc0pXRDJz?=
 =?utf-8?B?QlYzSWxxaEFwOEJpMkFwbFZxNlZIc2JlTnBjZXBVODRvdVZoUUhRU2ltQVYz?=
 =?utf-8?B?VzloUHhBWjl2Y21rblRnTXJtaGRWN2R3aGkxSDVrSlVhQVJSNlI3dE0xVk53?=
 =?utf-8?B?S0l6OGY5dU5abElQWW1ialIvaFRBZW4zNXhrQmJJN0hnTks4THpFblAzNFBw?=
 =?utf-8?B?Q2tIUTdjeHR4OWI3ZWIyWUtkZm0ySENYUXhzRDF6Y2I3OUtsbVliamZERy8v?=
 =?utf-8?B?U1Y0UkVYRnQ4V1d4Y0dwK3FDQVpNeVo1U1kraGpmNGk3QW40QTJsRHNXRTdi?=
 =?utf-8?B?eS91MWM5S3l2YkNJRTBOQkR4Mm9FR3k3VlNwQ3ZhdnFRREJBVjV4OWhueXpl?=
 =?utf-8?B?S3JUZVhZb3hLUWcwTko0ckdpOGlGT3hCbjFTVWtOa2dhcERsaHY2Sk5FZzZM?=
 =?utf-8?B?dWJkUEJLQy9hd1ZTa0pMNWZSbzVqRVBNdTBzNzhNYlU5UXRkWDVKbmo2UENt?=
 =?utf-8?B?Z2l4MGo2Tk53bDQzby9RcFZQenI4YkVRSDNIb1JTenRxNDEyNjkrTWhqNHB4?=
 =?utf-8?B?VlBSbk52YXA2QXpadXdHSWVYdXI5aWV4QjhOdko3TmoxbDBOZWNzT29Jams2?=
 =?utf-8?B?WmZYaVgrQmt5alVxMGVWb1NjRkRFRmp0YTMwdTExcjlPM1BmbVBFbmJLTzRW?=
 =?utf-8?B?VXlxL09Kdkk5amVqbWZwRTdkSFgvdmMxRnR6T0ZvZU1KWEx4TUYraWJ1T2FM?=
 =?utf-8?B?Z0ExcG5vVldybDY1empZeitGL0U1cFhkV3Ntei9ISm4vNFZJeEQ0Z1d5d3A3?=
 =?utf-8?B?QkhvYVVPQ0lYaXhVNTR6L243OHVsOTdIejVqclcvZTZRL1V0SnBvSjRwYngx?=
 =?utf-8?B?UmNXNWlUQWFtTHVVc2lDZm5TVTBNa3B3T0Qyc3Zid2tTamRrV0l5bWZPeExS?=
 =?utf-8?B?elU1UXptNWJuQVZzbm13bldNQmFwNjhQZ0RBTDJPTS9qRlduYXN2TTZiZHhQ?=
 =?utf-8?B?UmxJblZXYmljQmZkTUZSeU9tM05xZVZEQmRnRzdaclZlM2htVUdqMW5WdVdZ?=
 =?utf-8?B?V3dDbUc3K2JLaFpNdjYrbTZzS2xpTVlkb0hONk5UY0ttR3hDYTJtMjBTdGZB?=
 =?utf-8?B?NVo4cE45TSs1bUQ3aG5yc0NIejB2QURCWVJJc1BzQ1VxNVNOYzN1MGZTTWhz?=
 =?utf-8?B?NS8zWXBJdG9DYjR5UWlRU3M3SEp6bEJOVkx3RFBVS3BIR21EZkk5cWV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUZPQjcyUDloaTYzV0tmZXM4ZjhXeWJRREVhK0w1cjFRMW82T3dQalVjQVd2?=
 =?utf-8?B?NlJqNEdvZW0vNWJsYXdOV0h4em5nRTZwMEY5NDYyYW96UUR1WDNwNmRNTDVV?=
 =?utf-8?B?NmNXNml5OWhEd0JHM3pVUGhtUTlIcDJpSUd5bUowL2R3NHVXL3VtSlJkY0Vl?=
 =?utf-8?B?dHFoMWYyVktZRDF1bm05UVJyeTI2OEpWWXNrM3hLcnBKdnZWZHdLYU9pQjNO?=
 =?utf-8?B?ZVl0QmN1TndFb05wbWQ2MEt1Y2NIcWVYVS82c0FxZEdianQvTm1CZnJDUnFK?=
 =?utf-8?B?dkFvZnpJODBySGtDb1NDNWNaR0FnZFJYckVvQVE2UTZkbHdQdHpYWG5Wbm1K?=
 =?utf-8?B?aTZBdkJ4U2NUZy9PRGFtejlXVlUrZ1RKNTV3anhBZ1ZDNTRkWVRCaUpjZ1Vz?=
 =?utf-8?B?WXdqNk91WFhHTG12dXFQRjVxSXY3bUhVVm5FQmVTcnV3azd3MVZVMCtUYUJw?=
 =?utf-8?B?M1FRY1l1dWRlYmJmc01PdWJVeTQ4SE91MjNnZ3JhRXlva3orM3JHN3BTOVlB?=
 =?utf-8?B?cGFPVi9XWmVFVmhZUGNjVngvOHRJUGE0VEVTTmUvRFdrQURBak1kVTJPdHB6?=
 =?utf-8?B?dlQ3UmRiZmg0S21kLzFaUmhsZ1I0V0dxQUFGK0NwUmpQNDYrbGVPN3VEMDZN?=
 =?utf-8?B?ZWFBcUFzYkYweFFjTFlkOFBMRk8xNS9PekVyL1hxdHVUL2EzSGNTa0cwcGlN?=
 =?utf-8?B?V1FwaEpmQjZjZHFhelp3N0NyYnZlMG9DakljRG5IY1VSdkZ3R1VJV1BVbFBO?=
 =?utf-8?B?OUJsVWtGdmdlVnowSGVBMjJGclNCMEY0ZEJoODlkOURKUjZnR2tXaFQ0ZmxR?=
 =?utf-8?B?VkpxS05ZTWphcTVBRnZJczBrWkZYRTBhRlJaYmpjMU9WZDZ4c20zZlJ2ckxx?=
 =?utf-8?B?NmRxUHdOOGxSb1BPSTNINEJSQy84Tk1TcUd4eVJnaVl2S1A0c2w1RS8zQ0dB?=
 =?utf-8?B?NzZRY3FwZ0g0SDl5SHJvbTlrcUJBZUZVVkNTcEVJVmphVVVjQk5zZEpDVlVj?=
 =?utf-8?B?OUV2UTRXakF4RGtlb0o2bS9BSjExUlEzUHVOZHRZeVJtdjFJdzZGS1R1QmhQ?=
 =?utf-8?B?UFhKRDZQUmIvckx4a2tZSHhmUXBNdC9ad25lalViYUM0OFh4Ynh0YmRpamZT?=
 =?utf-8?B?Z21PVXNoMU5vaUtkTWZSc0JzcHpIOEJvSzhDRTFUYTR2bVpDRUVVaUhjbnFo?=
 =?utf-8?B?aDBZUThkTWhWVjJwaGFMNE9kY2JiV1NTeWoyOWJaZ3lFN0RWdmZDVkFXaGNN?=
 =?utf-8?B?SzhKc21qOFFjVkpud0tWdWE5VTJwSGJDeUovWHlaSlNtSkU0N25RcENGNnpO?=
 =?utf-8?B?QXMvcis4T1djYmc3enZYWVVwalhXMWczR2l1azhUVkZUY2xSRVF1NEk4SmRG?=
 =?utf-8?B?ejkwNWYrZHVSRm8zeDhZczl6Mms2WHJJNGlBZm55cnlQNkRSM01BNHRZS1JV?=
 =?utf-8?B?dmZGeXNtZkMrWDBZN1VpNGJzTDFhNUxpSG5rbkl1bENzMm9oSE9aWTZsa1lv?=
 =?utf-8?B?OU1pOVJraUNxVVdSWG1DR0NwdDdCeVhMdWxSaFBMcVJrZjltOCtWSFFFU1Ez?=
 =?utf-8?B?bU5GVlRFWFNPYnZFMGlVWVNqY2ZXTm1YalVsamRkcjk2NEszYkxkSTNWUUg1?=
 =?utf-8?B?eGZjdmhKQnIvbmxZcnlVeGJyUmpKMVZvdGZzOVRQQUZuZ0hGbC91dThLQXMr?=
 =?utf-8?B?N3o3OEJwaVZ4czZzSDh0ekRSVnlkWTBhTXdTSWlxVlVPNUJVWTN6N3Uyd0dr?=
 =?utf-8?B?VEx0SWwxa0pna0VvazZPdEFCS1BCVURSNUNLQnpZRWNDODA4Sk1VdEQzekFh?=
 =?utf-8?B?MG5yOW9GVll4YTVwMmFScEdEUzlCMlc2ZWpPNlB5N0JFWVA1S3VDempIZVM3?=
 =?utf-8?B?dllaS091NEp2TWhwNjRpc0kzNk16UCtTMkwxM3V1WEcxemVpcmJsNXpkUGtG?=
 =?utf-8?B?dE9nSFZTOW1mR2hPTXgyb2RBTHU0Q3krT3p2QmUzc3hnS0hYUzlUY2x3Wk53?=
 =?utf-8?B?MS9qWjR0eEdueWIwZHV0UjNQY0VUanhGeWtkaWxSTVBMR2h3bE5ZRGEzQmJU?=
 =?utf-8?B?eTVpNS9JVFpvT05DUEh6d1VUV0tHNXFlaHVmWGNMVXhONk5wcDNZVGtCNWFM?=
 =?utf-8?B?c3NReFhpUTd2KzByZjdvMFZnZmVkUHhHdU9IVUhMd0cvQ2NwWGVDZnhuUVJM?=
 =?utf-8?Q?bdqF1l7hH5JNSzZvRdzlP1mr3Ix0FzPf13pu0HMf7fRr?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5189f2e8-d91b-45b9-83b9-08dce9ed2c74
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:06:44.3866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tr5c7SDRn7R7q7DDm/yMyTjMlJNG0nAT56zn0pudSWqvKcBMw7k8MP8roouS9CCZA9il3UWPK9qTWd8czk6LVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7672

On Fri, 11 Oct 2024 13:53:47 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Fri, Oct 11, 2024 at 1:41=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
> >
> > The invocation of rustc-version is being moved from init/Kconfig to
> > scripts/Kconfig.include for consistency with cc-version. =20
>=20
> Yeah, I am ambivalent. Dropping them would minimize changes and avoid
> introducing something only used once, which would be nice too. Happy
> either way.
>=20

Another motivation is that in my helper inline series, I need to do
arithmetic on LLVM version (divide it by 10000 to get major verison),
which isn't possible for config options, but will work for variables
defiend in Kconfig.include.

I didn't mention it in the commit message for this patch because this
is not my patch series :)

Best,
Gary

> > +if output=3D$("$@" --version --verbose 2>/dev/null | grep LLVM); then =
=20
>=20
> Similarly, I wonder if we should use '^LLVM version: ' here or similar
> to minimize the chances the "LLVM" string appears elsewhere in the
> future (perhaps in a custom string a vendor adds, though I would
> expect them to add it lowercase). We are relying on having a $3 when
> splitting anyway.
>=20
> Depending on what Masahiro prefers, I will take this one or the
> one-invocation-only one.
>=20
> Thanks Gary!
>=20
> Cheers,
> Miguel


