Return-Path: <linux-kbuild+bounces-12882-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIF5OCBm72kIBAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12882-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 15:35:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4ED473864
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 15:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0613C303DD1D
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 13:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1F53B8BD1;
	Mon, 27 Apr 2026 13:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cv6mGtx5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazhn15012032.outbound.protection.outlook.com [52.102.166.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78BF3C3441;
	Mon, 27 Apr 2026 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.166.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296067; cv=fail; b=grvth+vJVftfSI14H+z0AwD2+x1av0MdTLqADj5r4C/C+GcgESaIqBnh5Uktip31HZNydaCw1MrOkD/E0OEy/IuuXjuNhSNPfI0DwPSLRr7BhxEI3qO6ws+wG1MZdBbgZv/1Fu/D481DnNF4Lczf0LCtSDLpLuhmR9PDBp9pTmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296067; c=relaxed/simple;
	bh=cyIltoV7zy7Ok/kWbYcvHuOjwnjeuDVAc99sM+5L+4A=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CnlsQEB/dY7A4OtpZeTVQgvtIWFiyqgrQ82IHmrIGM8sWbLIQ8Wh3YKv3dPOHETGc4qwBQ7Fk8FeBtK6QM6KPquQIfOYsUhHSUxejLc4slLrNB57spE6LHzTKtqIFEccHniET/EctyjOZ4Hz42vh/Qv1rflZ2Ae8VAXWDoYmkwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cv6mGtx5; arc=fail smtp.client-ip=52.102.166.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvMT4uXB1cXNxxYOSUx3ODjpHln0WVXoibk4i3gVfUXiFCtP4O/v8SrTHrt27Dog5BWPVfF9gS6MF1RwYXK8WSWn2I8yVf9E1PCnzzXkwMibMLe1bF4cktuT6a7BAp3yekyveFj7FyUjZQOQTQgDvHQcGLk+Itg6RjXYgyTwQYuY9ya1MVzP+8zjsay47b4wTRr5b1SjgMzENeZvXjfgSftL821Ss8WXpo6QqhW2bKQvsnF8sUP7HqcoT1/hoDkC8NzL1ZmsdQCisGSgI6nJMBhmtZRuf83JFHW+JA6bQhleK9N1TVe4C5qUHNjJLRbo7IjypaV0WXsdYSdEmHsneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oi+ptCiqeCY1VeL9mQbrzgMB/kW3SUnljTBcw1RQOFI=;
 b=lG65Jmvn4NVcvuMhM4tgZVh0RbJH4VKmdVm5974q0Pce048eNrcA3DnlKxWsFVCeGX23hNBKepAbg87dTfdA0/NPNekXikW1h3shZBAWYOcznygxjOcbxIRi/CoAazV4A6e8rH61oTEoK/r73LJUZ8OsoeO1tEYfxJ9LucVzQSG4DxqKAggjZ+P9tembDgsN34i3BYbyjZ+0qzgDnZf06lWkoTyCM7C0CaDUHArVH3eMb/mk97jOddAPGdGXob3747oERlcKOm2CIiC/p3eqyn+i/i9wMpWUzs5eSP6PTc4N3kab5XKuBc9S6y1s2UHGg5IqNlTKLDuxY5wrfeGjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi+ptCiqeCY1VeL9mQbrzgMB/kW3SUnljTBcw1RQOFI=;
 b=cv6mGtx5NQ6JXDgvvCC9ztO8/rXphtdxQ6rCnG0MuGnlMI3vXypJ0ohP2vV1R+dNBcSdBzF24I7TmnsQfesL5Zrnbuagz1pPygK/8iPSYvX/zzfGJEVg1hOQb5kkbIdePiubwpXIJJRCZ5/N+9OHBNyCxuB1G77R6GvyXOYf8l4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1963.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 13:21:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 13:21:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 14:21:02 +0100
Message-Id: <DI3YVFB9HUY5.23HNLX1TMES4S@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: allow `clippy::collapsible_if` globally
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <christian@brauner.io>, "Carlos Llamas" <cmllamas@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260426144201.227108-1-ojeda@kernel.org>
 <20260426144201.227108-2-ojeda@kernel.org>
In-Reply-To: <20260426144201.227108-2-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1963:EE_
X-MS-Office365-Filtering-Correlation-Id: f9bd5474-2e4b-4507-ecef-08dea45fd474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|10070799003|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUFwcUFZQ1ZkVHltMVExY1N5bmxYWk5xMzhZVnByRDV3SzFkUGE5S2tNWW9t?=
 =?utf-8?B?Y2R3eXN2ZEdxV2kvNFhON3hYeDJQTFMzTFhjL1lmU0R1Z2RVSGNscnd2K1BO?=
 =?utf-8?B?aTdIUklTOXhwSmpiUFlQQ3hUSjUvcnpzYnVjQjBrNDdyV3hQWEk1OWlQU3ZM?=
 =?utf-8?B?R1hER2NwL3ZOV0ZRS2lrTXVxOUNkbzcyTmVrRktJRWc2ZisveUZiVnRUWEtZ?=
 =?utf-8?B?V0YrWWFqejg3TkhzRlp1Y1laZVB5eE1LNjc1UGU1VDE0bEVXci9JejZOdCtB?=
 =?utf-8?B?RUdyYlhOdmpGOGNyREJUUVFWNGZQZ3RBTXhyVkp3dENWNnZaaDl4eWdYbGcx?=
 =?utf-8?B?V2pYU2dkR2ljckhGbmVOVDQ3TXB1Z3J5akw0cVVSR1F1eUwrLzQ4eXB3bWpv?=
 =?utf-8?B?Y0c3citoait2SzQxZW1DWTB1SDFSKzZVTWw4dFFueTRYRlhKVXlUbXJTaVZ4?=
 =?utf-8?B?OW85cTFJRFdkazlnbEdndnFBU2l0SUZ0UUdjZ3N5bVdoczYwUnIxRTVxcEhY?=
 =?utf-8?B?L0x2M0hKaTY5WmRsNFJYOUlFTFo5UUluaGtmUFNjV2V3MWJ0Q3daS2h4TGFs?=
 =?utf-8?B?ZWZMcDdOeTZ3OEg0NDQreWtxYjV6dCtkRHVaOHFIb1RNMDlabE9BZEN6aW9S?=
 =?utf-8?B?VXEreCs3aFVkbXlTRXZaV3MwOHZyTTVrYzhEUVN2RFV5RTNqUU1lTHBKNTlw?=
 =?utf-8?B?QjJzM215bzZIS3BkWVlxSUlOT3NTaUo3NjdQRmJDYmpWSkNTWkxtQjFKdndk?=
 =?utf-8?B?dzdvdTFmNjBFUGxLSkk4WXBLUTJtSXRXVUVPVkd6SktRa2tqVnk3M2hZV2dC?=
 =?utf-8?B?L0tCWU1GRy9aOW9ub0hlQ2hjMElMeEZ3d2hzZkQ4cXptckYxRERpZHFDUE1Z?=
 =?utf-8?B?VFR1ZzZNUklpSW9xMWdDaVhNWUQvcUVZOEF4TEpzd2FHTk51cTRsWG1xMy83?=
 =?utf-8?B?U0lrckNwR1dxdG9qZlFzWkZjay9maFU2WkJIeVVFUkt4RG40emYzMURCTXIy?=
 =?utf-8?B?c05mKyt3ZEVCclRkeCtoMXRCUDhrQWlkNlYyWWxlN3pOSjU4ZUg1dktscm1B?=
 =?utf-8?B?MGNyalFNdDNFbCtqSUJNUFdsUHR4YUw0ek10U0RWZlZQRTRYWjhYL3ZHaTV2?=
 =?utf-8?B?V0cyU0FSZDVUdEo3dCtxWkIxS2FmNitkdnNFbW43eXowdlo0K1VwV0V4dkFJ?=
 =?utf-8?B?TmtyMWwvWGF3dGVyZitnM0NsMmcrNkZKOXRiRTRNOTN0REEyajlPUHN2UE5I?=
 =?utf-8?B?U1Z2cmVVdEdEN0FBN2lMdnJsMVlmNVBZUEpwSU45aWtnTmJDRnJQbEdUcTNY?=
 =?utf-8?B?R2dyaFp6QnVQQ0VVQmR4aDhmSmE4WTgyeEV2SnZoZkx4d0I5NU5nOHVEekhU?=
 =?utf-8?B?Qk8zS2FneVlqYmJva2xkRktFWlNROFpybUlzck5ZT0JsV3F2bVhaUndEblRX?=
 =?utf-8?B?aUQ2aXZjR2xvMGtqVExJOWJwVVhwTFlKckFnd0tNa0JmTFhzVEQ5L1dWQlJv?=
 =?utf-8?B?eUJWcGdiQVc1UUFWTWp1SmFFUWt3d0M5YnVuRWt6OEhUa2hDZ0REUERRMWpU?=
 =?utf-8?B?ZVNjNWZBQ0tEQjJUeXZxeFhRd0RjTnkrQlpLMkd6L1N4MDVZVEpnS2RwMWE3?=
 =?utf-8?B?Tm4yeldGQ3hJOTVCT3AyUVMvdnNVN0w5eUVVT2JKREpHMFBLWXh1TlBTYnl1?=
 =?utf-8?B?YkZiU0ZIaTBaSzJBL0tWQ1NyY1gvTi8zOTBJdU9aaHBXa0dXZG1wM2dmNm53?=
 =?utf-8?Q?J0VsWJ4RJh92L88zT7/PplCKiNlYuu6a+blZLac?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXpWU0hIODVtWVlxbUhjWHRBbjcrRHB4aFJhbks0Y3V1M1RHSndMZVBYL3Rl?=
 =?utf-8?B?ZW5SZlpaZE9TaklIdG9Qa1oreDcyeTRTNHJrdlA2bkw2VlhIMXVUYUE3Nkpo?=
 =?utf-8?B?MDNHN2ZzdUtKMTUwWkZIeWNPWHBnd1pBL1Fvd2RYVWNKSmt1UjFrbTR2a3BC?=
 =?utf-8?B?REgxTzVVcWUxZHZlWm5nTEVHTEVrWU5Ka01TOUJlczFjOUUydUptWUxJOU4v?=
 =?utf-8?B?TVpmYzRaNmprWjEwbzUrZTFuamVvb2taV0tHTGVTTU1jS0FwUy9RTkQ5Yk5Z?=
 =?utf-8?B?TTBQNEM1SGZQYTRaVlZ4ZE5YUmlyVXFQa2tPRnBJUWgwcXJ5T3RiMHVsS3Ni?=
 =?utf-8?B?aitkMVN2M21OSW9LSlArVzU3NlBtV2UvdUpoTVhDMWdQS0xBbXR6dHg2TlFt?=
 =?utf-8?B?Rk5SYWUxQlM2cVorbS9QemJPSWZMbDk0K0NPZ0hpU1JKSGVjaWtoL2taZmIz?=
 =?utf-8?B?Y0VrRkQxd1YzSGhLeXBYc2M0cWFYaXRwdXFITUFMc1FOQ05lVjd3QzhaQk43?=
 =?utf-8?B?cFg2UEtIQ0I5a0wxSHROdnJZSEduU3JTcTYzeFRnZ0I0OVNSbXVNZnRKSlZt?=
 =?utf-8?B?OXRZY2twR04wbng4c08wLzR3VHVoem45cUdXek9SaHhSZUlpbjFJeTM2emRn?=
 =?utf-8?B?Nk1jYXRWb0lQTE5wVVJHaU0xdmVPdHFqejh2ekxjVEtLbjdLUVkzQXVBVU9j?=
 =?utf-8?B?TkwwcEtCMGtZU1p0OUxhZzhPRWY4MG0xWk9NQ25sU3NoL2VSaVN3MjhIK2RH?=
 =?utf-8?B?aTh2bWswbStWdVJNN3F5UVZZck1KWkJiQ0F3aE9MQXFhek5mQUZ2WnNLeEwv?=
 =?utf-8?B?SUpPcXdDd0dha0hheWl1SVVZYTR2aVhiZ2JoT0ZXek56ZFdIWlRkYWRQa214?=
 =?utf-8?B?OGlIRzZVMC9tdmJVSmlIalBoVkVOejZITVViU3VKS3NVZUpGeG90RzlhUVR5?=
 =?utf-8?B?ZXJ3RDZEd083QTJoUGhJQVlQd3lIdjR0cEd3MlM1VkI2U3lsTDhTRldGYUNj?=
 =?utf-8?B?SlBiQ282ZWJPSDB0bVJnOW85b3ZsZDRQK3B6bjVOaWVxeVBubTRLaXJwTmho?=
 =?utf-8?B?Q3FrRTRNaVQzV2FGWnBuUVpDUjJrUGpJTE9OdHphZ0h0VFhZRG1MdVg4RC9k?=
 =?utf-8?B?REFCUTE2dnFDcnR2Y1pjWFU5a0RNaFVGV2w4RXB6VlJsN3F5QUh4aVExc29k?=
 =?utf-8?B?MHk5b21DNm5qTkRHRGM3MWpPTUFaRFpPNi9VOHVsVHpNdmx4OHFhWmY3eTM5?=
 =?utf-8?B?NStaS0NXN3dwK3VPVTdWMUFsNGVCN2h1QS9jVG9TUDVXTk5pQ3VvQUM0N2RW?=
 =?utf-8?B?Mm9XdHBKbkNtVFM3MTNUUnRsZUNkelN5eDM3a2lFRzJCendSb3ZYa2R1OE1F?=
 =?utf-8?B?aXJiZ1FKM0lsMDdBR2txQnhOdnJsZzljNnIvcXZUYkRVYnhkWllnNVlsMWhx?=
 =?utf-8?B?eWhjR2Z3NERVaTIvRTJLN3VlS0hZazRsZG1ROTZ4Z0c5ZW9YWTZzQ3JORGlR?=
 =?utf-8?B?dHZrdVVCbzZiK2s3dU9TcHJ5TWJFUXpIQXBFMW14S1RzRGIzRW1iem1UUlla?=
 =?utf-8?B?Q2tzNjFLWlNnK0tMWGxqOVBjY0lmZ2t0NVVZbCttb3dBdWdCbGhobU9VQ2V2?=
 =?utf-8?B?ODZ0K3JpTmNuNFJlZG1CaFlJNEplRDh4Zzl3T0R5elY1WTNTNDJxUUQwcThv?=
 =?utf-8?B?MG9xK2ZiN0N5ZGY0blhITVhMRHFONy9GR1VrSkIvcUhQMGV5cDIzbENnUkRU?=
 =?utf-8?B?QjNUbTNqRlF1QmlSdS9EdnNteWtLUHFmdmVkbklhbzUwS21wS0tzQTUweVFm?=
 =?utf-8?B?aFBJblRybENLczhnVndyWTBoTURqVjJ4cklOdFhYWis4VGlFOGluMkUwOExS?=
 =?utf-8?B?cmE0b1NPNzlDd0N3Z2xiakFLbllZMTJUazBQdGZVUDd2aFFkZ0ZoNDZRU3Z5?=
 =?utf-8?B?dTRmTnREcjBZSGV2MEFZMUFNUnhJTFpCci9ya0lQMmR3SjZtNS9ZWVBQMk4z?=
 =?utf-8?B?eS8xMW5Ca0VtK002THNqZTZUdkhrTFVuWVNTcDVQcC9RRzRjWWxQbGl5RENF?=
 =?utf-8?B?RmdiczNOY2dpKzNTM3lGRFAwcmljbnRKY0h1c2pnZUg0RlBqcVFabU83V09I?=
 =?utf-8?B?UWtvUE50MkxMcWFrcndmMk1uWDQrc1JUaTlVOXo5cUNYSnlvc1JsZHlwcmNB?=
 =?utf-8?B?UjFBTi8vSlN3cms4WnhheUpoSEFOWlBuZ3dZTnRpaGlRV1NWTnNSbllXeXMw?=
 =?utf-8?B?b2pndVNMVXNCZ1JkRkhJUzRENHhIbWdYa0NVSnk1QUJKaU1PUDZxaVRyUGc5?=
 =?utf-8?B?Ry9EaksxMEZiVTJsZkVnZER2TURXNE84YVB3V2M0clNxOS9Rdis0TTdpakRt?=
 =?utf-8?Q?3fykTxrDLHvlN5XIT1Vq1VHM0ds+JsCkCvhq7WdV8Pfx6?=
X-MS-Exchange-AntiSpam-MessageData-1:
	62E+9UV4kK4Ra4zzX2XNPLqQSTc8crU6fcYer8XuHLJmBFECo1+e4eEhiQsPAZ2c9yjy2F8VaCcG125qRXecvu9gJSXt9iEZksw=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bd5474-2e4b-4507-ecef-08dea45fd474
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 13:21:02.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4jpYfwi0cJI10ZlUdQ9UqOHjqC6LUliXqpDqHXHrxTje2nJM6dgd8gNX6rvjXp8zho8nZX2TcNIZahmuEjG4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1963
X-Rspamd-Queue-Id: 2B4ED473864
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [12.34 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	MICROSOFT_SPAM(4.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[garyguo.net:s=selector1];
	TAGGED_FROM(0.00)[bounces-12882-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[garyguo.net,none];
	DKIM_TRACE(0.00)[garyguo.net:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.566];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rust-lang.github.io:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email,garyguo.net:dkim,garyguo.net:mid]
X-Spam: Yes

On Sun Apr 26, 2026 at 3:42 PM BST, Miguel Ojeda wrote:
> Similar to `clippy::collapsible_match` (globally allowed in the previous
> commit), the `clippy::collapsible_if` lint [1] can make code harder to
> read in certain cases.
>=20
> Thus just let developers decide on their own.
>=20
> In addition, remove the existing `expect` we had.
>=20
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/rust-for-linux/DGROP5CHU1QZ.1OKJRAUZXE9WC@g=
aryguo.net/
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#collapsib=
le_if [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Makefile                                    | 1 +
>  drivers/android/binder/range_alloc/array.rs | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)


