Return-Path: <linux-kbuild+bounces-12450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADqtJwk4zGn7RQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12450-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:09:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4291D371640
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A0AC3055C06
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A1F3F787B;
	Tue, 31 Mar 2026 21:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uChPHJWK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022090.outbound.protection.outlook.com [52.101.96.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173E3D6CBE;
	Tue, 31 Mar 2026 21:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991247; cv=fail; b=uLOmqbTn62oh1ODXiJrH+sYNkElVIloLsL9MDMYEF0r3/61kDeZIHbRiyeG8DIM734KiqdTrwWNrIicxy3ZqcVU/DVKgY74LVDPyzzaWhjziXqnDSiFMFiqpTIB5Sphe13DRM2oC5TiiGs3o3VZ+msu+pZHpzNGffJFt9aHw3G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991247; c=relaxed/simple;
	bh=1lgLWVwflkyNUhGkpR8atonESCL4oUa1kdXPm6ZVzEs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=apKypRt6Uxqh39sfI9cKoZFiK66h25Gyier/hkmpy6x21qW8Q3EWNYGV2rDH+1101DwUovTs6v6nQIZ+LaFHXn85J9Kylvv2aXlYCXJjLV/Blcf3fvoCgkC7TFfronJ/8Qg+0Cz9/2WOivrXiGd+Ctwa38oa8bOCIMVQxvLbCNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uChPHJWK; arc=fail smtp.client-ip=52.101.96.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNtpWrE2Jp5/nURel55JIS45pUHbH278z37tC7nbPQsNvTwp+gehyR9JWsHMGn1hCg0xo5foT9p5DrXX1bmgo1jeibx1J8W0QauI+hYtoYAv02Ip+Jl8zd1SfXwgxBJxbICwE9YigN+HoLE5/kexcc4e06Xtx9X8tBk69mx3+Y96/XvgQDBeZ8qRVBUDflKFH/hmMjceNxU+SgFwnZ6D1T3/xnw+XKf2xnfzBTO/fSC42An4QpY5RSsAtV+F/JD+SGfvmSIsESpgUOwRPW26Tr79F5WBh862X5hwzXC6JttGKGXmR+nuV2OiUOYZ4RbBL1peEej8O8Hp3tPotRIZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DokolR/ibShIit6LbJGIvre8QW66yAyZmVL3+hvZdAE=;
 b=i2hd6aQEIDMA6XDxPvGLdnHq36Reh/1KFzJ566yH9qB7cp7g75Zw1ZqXNV92bcYcmhfHrRzgIvI2PABXB9tApiFNxeGc2CYLqul/mDgwe36asnLkPe7/Hsw6w+I9eIwplpyDG1NRfWUT6JS2oGi70k3aKYPi6RE7MADm6Lb93yu0xjp4exHEpHgrCUnZuGjVt4c4d3bqW9OqBcssrwzyTVGEGLGIuNdC9+LNA2PAOT//YO2PH2X3lyhkvWIVe7Bu3ZhuSbUq1BS86m4UAphw9Rt6KuFzxUOv1OlWW9nSgK0TIXQt4afPytLU8o5rCvFFIi5WOTpK1IZDxFjNgrWAVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DokolR/ibShIit6LbJGIvre8QW66yAyZmVL3+hvZdAE=;
 b=uChPHJWKbh/Pwkn1h4HwmRy41ZKFxhjdPeF4Lix0gjhY14oxFB2+KeQfOtwSWnBq1qDS6QSIoyb0NIPy0aeNhSa+V/8AChrLrdVYRfyq1jWazJ/kLr2KSAj0edvHc2gn3TvguyprtAgbgkiEsKx0hEuwC1uHDD766FgrQ6XHF38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6523.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 31 Mar
 2026 21:07:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 21:07:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 22:07:21 +0100
Message-Id: <DHH9VRFULJST.383BKVSWUTZ3E@garyguo.net>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>, "Aaron
 Tomlin" <atomlin@atomlin.com>, <linux-modules@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260331205849.498295-1-ojeda@kernel.org>
In-Reply-To: <20260331205849.498295-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P302CA0028.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a31d52-e810-4f7a-0034-08de8f698073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K5XfsQjqhol89hoj2E6rgN4/2zLUxyDB9lXBtsfEV39XfbPxTJGS+1Far1jv13wf6Z9D9e9BnJKlsIIk1Z7Is0W9FlF4AupUU0yXU52EulhP4i2B9uxVhDuDDj3H/ER0n1KHXgFvXhUEJByTaKqKKoeeH6Be87udRspn6mHEtTYATNgK98BKwjqJr3xqs6xqE5F2hPMuxa28AAA4S+zSoxDrfkeB8hCoDKHqkt+DqB1LdagFLS4MDBbkbif0bG/20i7gYBNVELYxuN9Ddy7KjupLWFz1ezSc0pBS7MFm7oMstKVXRoVkxJuOW1aOAw14TnQOEfcJq0DAVm4hbkLq8me7LzylSWOyPIehSlLLGFenuq4A49Myh2p5BxXeL2eYHT2J/RhCpKJrSYBy44j7QaaaAXSiaHuJBeiZxMErp14T+zcGTDvEW0Tg7fN9upFSJBJhEAwi+aoIshGq7eSYEgkeYQdDPOmvDRYmYOwXVyn7rcCePE/4nrUjpP9qz6B6f3YtHF6PJfghdVWP7BKwEdB50Y+08MlKRcqZ2yRc257y/yU2Y+gGWyR9bnRjx2IYA9QJetkaEPPPSbcQpGYYjIkEi1ior/ap0tJgpk8OYNmYJdVWmKrgak51bplW4Z2qvLXf+RK7fVFfwdKJrE0C1xnlU0DLqpgPG1vaCYZnWDYH5+LrZj2mQ0cFT78CxbFw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clZWQXU1RTRiQmN6TjYvbEpaWmVDZGNQai9PZ2ZYOTBVQmE5SlErRUp3Z3hX?=
 =?utf-8?B?KzJLV1VwNGtHcTh2VE51YkpjWmsyZnR5cjgzSDNaZFFCd3VmRU4rOTZRYW13?=
 =?utf-8?B?MXlKM3pPTEV5T2ZZK3VyTXZ4OG9BUWV3czNTMEhTalYzamdyb3dpbGhQVHZk?=
 =?utf-8?B?N3p2aTRsMFFudFFqNTFpYVMrMFcxR0pVL1F3U285VHc2b1ZiMXMycm5HTWlt?=
 =?utf-8?B?NTltcjJvR25TUllHZ2xBbkUrWmRsanZ1VGorSk9DQmlNUWVTcm9lYTJ1QWYz?=
 =?utf-8?B?eGVmeTNKQWl6RHFtWGFjYmlreGhjWndNSWhsdWx0TlRVNGlxQjE2TlZKTUVp?=
 =?utf-8?B?OTNGTWJwTUlPQkVuZDNnWjlJbmwxZXNhY1p0TTI1ZlUrdXJlQlpnOEJTdGVT?=
 =?utf-8?B?eVdtRjdrejRSdkxYVWJMeU8xMU1hcERxMVR3UnhsSng0ZVdNSWNQVU1wc29x?=
 =?utf-8?B?ZndVNFpnUTNvUytZZWl6eUF0RnQ0NVR6VmordzdsTFNOcEpJSUFrOVlpejNn?=
 =?utf-8?B?b2lhMlFwKzFKNkpvQ2ROMGlFYnZIKzJrMzFlNDgxY0NITnAyNkxPVUQ1M0Zx?=
 =?utf-8?B?WU80a3lGZWFPWUlNa0pzSUR3Zmx2WHpTTEZ2TXpwK1ZKbjFOdGtPaTFnbDJX?=
 =?utf-8?B?RWZWRWRIY2xVenZVYktxZU9sTXJVQ3pwZlFkbUI2QUMxZjlQMjVibGpxbW42?=
 =?utf-8?B?QjdJbkJxQnM2UWpJUG43ZlVFVEVlR0VwUzBXUXd5NWRGc1ZPc21JSUt4R0Vh?=
 =?utf-8?B?bGtLSkg3SVRmcnZSdUN4bjhYb2ZEa0lZb0RzMk1Nc0JOZVdJUFhqbGxlRTY2?=
 =?utf-8?B?NS9kbVYxSXcrV3IyRWRSekZmK0lSUmovSGxrRzV3NHpqVksraWFJVmpHZUpE?=
 =?utf-8?B?RUxFQzZQWWlLS2ZSZlRRb2lXUmI4aVUvVklNbmxPL1lJYXE5bVZ1SzhLTTA4?=
 =?utf-8?B?U0QvVFlGT2hrdTR1R1VpTHF4THBVK1Y0akZBNGNTYjEzTVdOeldFRUZvd0cx?=
 =?utf-8?B?eHhsK1JUUjYzSVZVaDJmNG9LQWVGL2ZPc3QwQVp5V3BXL3JONkZBajhyWTd0?=
 =?utf-8?B?c0hwaUJQeDNnR1dIbTczNDBxN2J4MVFXWG53RU5UOFN0RlBTUkt2KzVOVTMw?=
 =?utf-8?B?cGhIdXNYOGEyL3ZENklPTnJ6MlRFS3FoYjVTQkdjNG5lUzZGamFPcmF2VHNs?=
 =?utf-8?B?NHR5WndDTnhXbkxjeGhTd3RkTE56Wmx6R0tBQVpacHg5M1VwODRncTN0TVZP?=
 =?utf-8?B?SS91K2hZU2dPUTkxRm0zVkV2dWp2eVZVQ2hlVUdtaXVjOXJOUmxvcXVZWjJP?=
 =?utf-8?B?NW03bkJtK3ZGSlF1cEszYnhiVVRTRGR2TnhNMVRNbmoraDhidDUyVUQxeUpy?=
 =?utf-8?B?V0Rydk5hR0MyL2ZzWEFWWURwc3lCV3JSM1NiSFdRNGUwTmVRbEJTZ3hGRUxi?=
 =?utf-8?B?ZjYybUpFYXAxcHpZekVKYkEwd0FtMDV1QVUxMVhIaDdQMFdhTHVSNDFOcmlL?=
 =?utf-8?B?bmxZYVpoNVhLN2lnMkhDa3c1ZGhTQzE5MklTYWorbW1TdVAyb3ErUlRkeW1z?=
 =?utf-8?B?ODZoRGhyRWVvdUlzUGR1ZVRwWWIyd1g0Y3lHL0Q2VHE3RUtkaTcvL0Q4NUc4?=
 =?utf-8?B?dWFSVDhtSkdpYzVDcUF1Z3RoN29CSnZpK0p0WGJMVlpkbVdDSEVxWENsSFhI?=
 =?utf-8?B?Umt1dFI0c25JdTNXck9lakV2eDl2SEJvQ1Q4a1ZYZ2pKcTJZS0V4YXMrald6?=
 =?utf-8?B?MTcvRUZvWDFWYUNwdjBnLzlaSEFLa0VqY0taNFlLR2RFVjJZOHd6MnRxRWxO?=
 =?utf-8?B?M1VnclRhQWxpSFpuRmhud042bWZGMDlFY0lVNWRGL2ZNanB4bEtqYy9qUUZO?=
 =?utf-8?B?eFAzK1JMczRZQklyZHFGK2MwZ2U3UXZXRnk3cC9ZQklRL0tiaFQ2U3kzQ00z?=
 =?utf-8?B?RXc3bkdjNmw2RVpTYzF5dHY5Sk9jUm9sZ0dxZ3MrOGw3QldrUFFGcXBGUkpm?=
 =?utf-8?B?WkJUOUFqbnVEaFQyeGlVNkRMcUNPeGVhbElBLytLVzlsRDNZeTlienRzcXUr?=
 =?utf-8?B?YXg2TUxxU1ZKZUxFemxjQXgyMmZ4aEVCcmV4WDRqTmxjTlFpTGIzMzA5N3NP?=
 =?utf-8?B?SHIybXdSZDlhYzMwYUZ3RVhJN2ptbHA0UThYS2pYaUE3V0djUG9sWFZHeFBa?=
 =?utf-8?B?eEc3c2tPeE92SDVwT3FLWmFMOFNta2FZTXlzcm1GZ09vVE13djhkQW80TGZn?=
 =?utf-8?B?WWhOdlkyTmJENW5NNWVMVnFQRTMvcGMrTE1vRFNrY0JweE9vWS9nd3pjdFQ1?=
 =?utf-8?B?WE5pNU56d3NRL0t3blpCSUd1WS9yeDNNeGNxZmovNUpWMGVSVmk2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a31d52-e810-4f7a-0034-08de8f698073
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 21:07:22.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Cmrp8+DabVTOQPULJCY12r8/jK7qyz7OxIYMx0Kp+A5FfVIt/9hZ9rlnJXsyaRM8Yy/ndGeBWG+dgcWavEqjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6523
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-12450-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,atomlin.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rust-lang.github.io:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: 4291D371640
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 31, 2026 at 9:58 PM BST, Miguel Ojeda wrote:
> Clippy in Rust 1.88.0 (only) reports [1]:
>
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:112:23
>         |
>     112 |         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>         |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     112 -         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>     112 +         let content =3D format!("{param}:{content}");
>
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:198:14
>         |
>     198 |         t =3D> panic!("Unsupported parameter type {}", t),
>         |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     198 -         t =3D> panic!("Unsupported parameter type {}", t),
>     198 +         t =3D> panic!("Unsupported parameter type {t}"),
>         |
>
> The reason it only triggers in that version is that the lint was moved
> from `pedantic` to `style` in Rust 1.88.0 and then back to `pedantic`
> in Rust 1.89.0 [2][3].
>
> In the first case, the suggestion is fair and a pure simplification, thus
> we will clean it up separately.
>
> To keep the behavior the same across all versions, and since the lint
> does not work for all macros (e.g. custom ones like `pr_info!`), disable
> it globally.

Does it produce a false positive, or it's a false negative? If it's the lat=
ter,
I think we don't need to disable the lint.

Best,
Gary

>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://lore.kernel.org/rust-for-linux/CANiq72=3DdrAtf3y_DZ-2o4jb6A=
z9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com/ [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/15287 [2]
> Link: https://github.com/rust-lang/rust-clippy/issues/15151 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 1a219bf1c771..a63684c36d60 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -494,6 +494,7 @@ export rust_common_flags :=3D --edition=3D2021 \
>  			    -Wclippy::ptr_cast_constness \
>  			    -Wclippy::ref_as_ptr \
>  			    -Wclippy::undocumented_unsafe_blocks \
> +			    -Aclippy::uninlined_format_args \
>  			    -Wclippy::unnecessary_safety_comment \
>  			    -Wclippy::unnecessary_safety_doc \
>  			    -Wrustdoc::missing_crate_level_docs \


