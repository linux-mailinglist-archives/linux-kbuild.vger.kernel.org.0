Return-Path: <linux-kbuild+bounces-13409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKcFC4a1GWoRyggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13409-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:49:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF6605092
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BD07309CEB6
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 15:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0563FFACF;
	Fri, 29 May 2026 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nLjz2dj2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFB03FF890;
	Fri, 29 May 2026 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068510; cv=fail; b=R425EYhNsq2s9ACFYwoj5Xb0VUtHvNFz6ChO4Y9aC8c0J+lQTEoP6KF4ov2m5w7yDXQDE33RmKp51mWTSWSA/ODONUh/d+55wOifPlstJEG3x0kpVQ78SWXutykAIrBg8THY42QF7BECUaJIkyKApsigScW7U5TMvc676oCvrFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068510; c=relaxed/simple;
	bh=0d8Fwg0j2Qu2n6x4OdcXBl6KwQodnvn87YipER9aLn8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eTCB+5cPr/2gs2UJiefne6x1+A0WlHxlIPf2Svb9ac87hZJBnHw/5z2px2cORtJ7Ya1IdqQCKvfyTtyU+L2Go0q5NWNU0Gs1zF4kCL644lYFu0GS3RcbG7JSfrzBi5PTgguZfwl2+ihWrjCBK4KfUUXm8gegYPIehbZuGipvvsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nLjz2dj2; arc=fail smtp.client-ip=40.107.209.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2Er+hkCj10L2WCA9Ga5ufqrT+oRr4uCFzd31UAs5EWBJOGfVQk+zcfGa4UUCA6wIr7ck6luANvgW1UdHP8xP6yaUupscOCSGJOdmIKhLGOxmsvzmY8splpV7RcJ2MAlCJIDXCUyc+XvjvAXGq8AH0MhTkVLJp2NsRYNVCH47k3NDwXZfPUegkzY3OwSs761abX0QS6MM3oS6HdFuUWmUd9/K044e9j5VJMw1uFHB/hhSBlzBdDJBUfpaKvzfiS9zt/pJl8lmUyfFIFSENCusE53SQdJXkF/wc5KaN6aSCpP09SOxtXgqtfGNw1KSSsY1tXXVyfrrksSvn7UGJjIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L56oQJIn5ZiiBi0M154+UAtXQy+z8psf15QLM/9UwbE=;
 b=OrKxqPxHJQmMTnjO2jiNMFbvw0TTXWWTl2l7Mz3saxFQ8aEY8TBb4IBT5rEu6Jt57LfGbQ7RXFVZ1OTO/bia3gfUmCP1cksjnFbgfvWTHrqxejHTMoOedEGrWLY8gQSKjKC4+5lStq+xmlOLB2X5jYFuTsGfn3nmR7+spzuKtTKnKsDOFIgw6dKhNyuPkeIzDj+hWLZNPqZ0OnDXgNC4YAD6GaPJ3Tb7iot0ktE8CNpTIItVyCJTkHlQviMqnNpxaR35KMls8339qehUarFeQ3e0PJZO0K3qUfhB/Y7hyNanWtFixro3Jv1v/lKf5uTSJwe+drW7MhPfdnL1vf0UCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L56oQJIn5ZiiBi0M154+UAtXQy+z8psf15QLM/9UwbE=;
 b=nLjz2dj23UCLsK8HjU/0+O1EympsI+6gfceNTvZj35dMwkA0ouVvo8b20t7VeozZpsrdu7pe0mIM1IiZZzcnz9Kf5ydREmhZy1XmoYON9z4ObsDHSaJ0zyC/Fn4HwEJfpK3C4ElXzAu3DlcaMN7KMdcUl8rHwFew9POwvYi/wjF8by2Xcv7YLRXFxNlN7bQ4Vw0rzgxd95O2qRImhHBgfMJDbwqJSSZ8CGPyymOkYG8rQb1hY0f5SYUM1BJM8NUk+purYOcMNVWm7+MJhCmunhGxzLJTuGUWqFtlKNKdJo9aafy3eyZKG/fsUkbLKaW7O1vcpsBPuc2pW/HampSlwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 15:28:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:28:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 30 May 2026 00:27:45 +0900
Subject: [PATCH POC v3 5/5] drm: nova: demonstrate interaction with
 nova-core
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-nova-exports-v3-5-1202aa339ef7@nvidia.com>
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
In-Reply-To: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: 3488fdf2-ae02-4239-03a7-08debd96ec3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|11062099010|7136999003|22082099003|18002099003|921020|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	hFvw/Hck/Ec25jw2sOYtbPmdxbvS9TOL/cGXEqiRznmeu0OoRSbJyQ071jUIbG+wR0Wmo7yav70Vay2dOgV0jgsZwtnhUDZpOh3hdLwBvKBSdoovhPFb5EdC6g5qB4hj4kvLtY9s8mVxmLSNIPJFRRqVFPrU+QV7amYxxgap6mSqJMB70I/1dWWMI/gx3ml3R4v1AbSKCMK89bdfYVFaB2BHKw620CPmb69ke1J/sWGqW3POgR/Aepuozs2I/PyAKHmmBNtGnNb/wq73AEMsits7A2kksqBoR9RTglNgMRoj3ZVEcBvxnGKXaUpUZYC6CGDvXFV8YwGfOA62yorrxcgXwHZP152tO4uTj9nc3F8+G0TaEknqIUbVFnyDvF3v3jQcwSsuG36qsCEHl5Xy6zxjBMwRonstwbLE8O8ZiXCcq5O32JRJ4uN4W9qL9Mwev7wnjxsLgQNVHKw1z/0dzVcrweEFm7RqQVfGHiAvCLUZx1gu8xz4Jqqry32XP1XF47wlIDZcBj6DjTDQr8jkMzCGXZk2LiegMooErWoIOU9iXgbSUYDoMp7JJyQxLQbbT0KA6H4tm7a5HBZXup1gwXIlACMCql7oWOMV1RcbW8eih1bJB1NtTL32FpAbImmjkKmbRMQakEBLN6K8dWJT8Z2TlcgRhrSQSSjzprYawInY9DzDBFORFoDAdTLHyo332VzwQTI2Lzy1LFqEygl3LguPpY5XiQHS404TyOz0xNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(11062099010)(7136999003)(22082099003)(18002099003)(921020)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnllcWtZcTNrVkhvbWt6QVdGSXFXK2E2RXMydnRHcVl6SUV5ZVd1UjhyWi9U?=
 =?utf-8?B?RllHTnpRTU1FT0V1YU0yVCszYjluWGowN0U0NGxiNEQzVFFmSlpDN2s1VUFy?=
 =?utf-8?B?eXRmYW9Uenc4L3FBVTIwVE81cFdqdjlJMHloNWZSNXhPbmVtZnRQK0RXbS81?=
 =?utf-8?B?K3ZYQS92dUE0Nlh0bVdUY0VURVJXajBvRDNBTU1DeDBldnV4UlYxWGJYQlRS?=
 =?utf-8?B?ZFpiUkdPVDBTbkdsWnR3U1dYb1ZBWVQzWkhoUmJXVDZ1NE9TOGZoNTFCcm5R?=
 =?utf-8?B?NEZGVDN6ZWpKUEdJMjMxZ2QzU1ZCS3VpY2F3SDBqblV1L0xDeWhuVGdsWDho?=
 =?utf-8?B?VTl3UE5EeE9HRjNDKzlmZ29JVCt3ZStsaXliaFhZR1lQZmJVbm9LM3BOSVdK?=
 =?utf-8?B?VTZTdU9PVkJvbDBzUVQxY1RqZ3d3SEhSMXUxSXduSjc5MTJ3VmtHOVZCc1Vl?=
 =?utf-8?B?bGVNMm5ldUtQeW40dXFZR2RaSmRtYWRXVm1DZnlMdEpIU2tvVm9yRDhrOUNp?=
 =?utf-8?B?aHBSRmdubFpuYm1EdmQyVkViYms5NEtvL1RFV3dONHZlUFpOVVE4SGtDOXRU?=
 =?utf-8?B?SktFYWc2dUhnN1B0aEdkamRGMVd3NHNOMGs4WTlIUktpL0VPT1A0cXNsOTU2?=
 =?utf-8?B?SThZbU5TZldxcFpqRjFtZ25DSi9yZUZBdGVWT3hyQXZHeWM4T1RRaW8vZWpH?=
 =?utf-8?B?NDR1Snd5eTd0VERXOC9RQXFtVlhpNDRsTHBkRWVKOVE1UjNtdnBLbE5sOG85?=
 =?utf-8?B?SkErQ2tJTWV6bFNiSzJTaFpGbm5LWjNPcE45L0Z1QlVQZ05OYzVaOUNJU2Z4?=
 =?utf-8?B?aDE5M2ErYVhON0xKSXdEdmprUWdqc3BjeUpNTWJEcXN2ZytkN1VqMEhzWFVs?=
 =?utf-8?B?QXowSWVCeGZkT29saGc2RzQ1Q2dKL2xXS3dtSGhncHo0T3FnbVRCTTRrTzdD?=
 =?utf-8?B?b0RFMVRQaUxlVXZqM2RLeGFob0M3enEyQlZnZkY3MXVTZE5JVEwyL2ZGR3Vq?=
 =?utf-8?B?NEZnbk1Zc0FEUXE3T1ZJdzc5QlF1WWp6MzFWYUpWOFpRODJTVnRCM3hYUWgv?=
 =?utf-8?B?ZW96cVAvVlduRWd1RWhDeGl3a2Vhd1FVRlBENzU2WklYV0l4b0RHRGg2blJS?=
 =?utf-8?B?VHhaSkorMmQ2MUcxOVFxYktwN3E3Nml0WFJraVVsZzdXOTJvME5tZTBKOUNY?=
 =?utf-8?B?T05mSHBTQ0NTcnUvTUM1T2pEMTN4VVo2eENSMzBUQTF2WWMza0pGY3R1aVQz?=
 =?utf-8?B?eExmMGxEazQ2UWgydVpvbUJkWFlndUlVQTUvWlpLWHlVVzJLdmRKTkRkenE1?=
 =?utf-8?B?aWxjY2VkbFl0cG11VWpQdnFKaFduT1dnQzkxa0w3VlY4VVpTZ2JUT3B3VXlO?=
 =?utf-8?B?MzVucE1rMnZzdGNrbXdnVW5GcjhEeUhLcWVkTGpvb1lySG13TVU0QzhwczRU?=
 =?utf-8?B?RFRlY1FvUWIybWY5SU5IdnlMRWZWS0E4eVJCU0NQbHZpZkE1b2hrUWJBYjJs?=
 =?utf-8?B?aGU4YWJBejREVFZ2ZGFESXM4dmZ1T1JKVnh0Rnc4eVlncG56QzdIeitERTJB?=
 =?utf-8?B?KzBTS2Q2K25tTFh5U0RBemlUQUFWNlQzM0FOc2tjTXB4RkxGMVErcitjcURC?=
 =?utf-8?B?aEZEZGhmN1pZMWdmVVZ0UXQzTU5CUHhYek9YRmlnMFNWeHB4ZGNzMm00UHRJ?=
 =?utf-8?B?aGtDVEJiNjZIMFZHaVZFV295MHBVRURVYW5GUlNPNlArcXE4eGNib3BhZlVQ?=
 =?utf-8?B?NVJmZzlVQzdYM21uZVFJN0JnM2FPc0Z1M2RRdUYzWURyMzVUVzVwalJyeVJQ?=
 =?utf-8?B?Z1B0b0JjLzZtN1F2cU53dDl2eUJCY0E2QzY1bllzOW5VVDRRM0hOL3lkT1NI?=
 =?utf-8?B?SlRlSkhMTzQwZjFGTEQxcGZMSjdBeWdpKzFUdXc2OEFUdTlnMGFoVEwxTTNw?=
 =?utf-8?B?aXBrcjZpeWt4L0NXOHV6czlDTG5ValpGRWVsVk5TSUZ2amIyRDJsSUhqY1I0?=
 =?utf-8?B?L0hDQkIxUmNpa3FIcUFLY2VCL05KMFZkUElhZ3hyZTJDbVpaa0M0TkZpREk1?=
 =?utf-8?B?UzZKU2RFeTB2M0R1bHI0UlFBekltV09xbEZXSkdWek1iL3lCdkdNZlRTUldW?=
 =?utf-8?B?SzJ5ZGxyMjc1cG1iQmt6QkROK1lTbUdZeG0rV3kvN1FmYk5VNE9GUFE0TGFS?=
 =?utf-8?B?bGE0Q25IT2xoRVZhRTdnczRNd0xwREhHWHVRSXFCL0lxTDk2RERNWnFnbGdQ?=
 =?utf-8?B?b1FhUGtIYUg4UThGNUFtMFU4QktNT1lBcHZRR2hWeHFIY3AwUFdHSnhDSXNW?=
 =?utf-8?B?UW1tMTlkNW1UVUNzY0V3NlhuZThLb0oxTGZKMk5XMWU3UCtrdnZMVmpORmNj?=
 =?utf-8?Q?hup1vFf5c1u57rDhM8NySMz6urqXFqrjyBawiqeVze9vQ?=
X-MS-Exchange-AntiSpam-MessageData-1: ZFCt8a+Ld+SqVw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3488fdf2-ae02-4239-03a7-08debd96ec3a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:28:24.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL2U0mjmSnR++tAw0Hky9umRp4BK/c+2UAzTWsOJYOzjxrTcIOFPpG17QMFWuK7aYe/J1XvnR9c4x9giGm0ZvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-13409-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 25FF6605092
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Export a few items from nova-core and use them from nova-drm in order to
print the chipset of the GPU being probed.

Some documentation items are added to make Clippy happy.

This is only meant for demonstration purposes, and won't be merged.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nova/driver.rs     |  9 +++++-
 drivers/gpu/nova-core/driver.rs    | 59 +++++++++++++++++++++++++++++---------
 drivers/gpu/nova-core/gpu.rs       |  9 ++++--
 drivers/gpu/nova-core/nova_core.rs |  4 +--
 4 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 4289df7de01c..2a3f47974079 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -9,12 +9,15 @@
         ioctl, //
     },
     prelude::*,
-    sync::aref::ARef, //
+    sync::aref::ARef,
+    types::ForLt, //
 };
 
 use crate::file::File;
 use crate::gem::NovaObject;
 
+use nova_core::driver::AuxData;
+
 pub(crate) struct NovaDriver;
 
 pub(crate) struct Nova {
@@ -60,6 +63,10 @@ fn probe<'bound>(
         adev: &'bound auxiliary::Device<Core<'_>>,
         _info: &'bound Self::IdInfo,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+        let aux_data = adev.registration_data::<ForLt!(AuxData<'_>)>()?;
+
+        pr_info!("Chipset from nova-core: {}\n", aux_data.chipset());
+
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
         let drm = drm::Device::<Self>::new(adev.as_ref(), data)?;
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index cff5034c2dcd..95fb4d13e676 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Main driver module.
+
 use kernel::{
     auxiliary,
     device::Core,
@@ -20,18 +22,36 @@
     types::ForLt,
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    Chipset,
+    Gpu, //
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
 
+/// Data passed to the auxiliary device registration, for the sibling driver to use.
+pub struct AuxData<'bound> {
+    gpu: &'bound Gpu<'bound>,
+}
+
+impl AuxData<'_> {
+    /// Returns the chipset of this GPU.
+    pub fn chipset(&self) -> Chipset {
+        self.gpu.spec.chipset
+    }
+}
+
+/// Driver-associated data.
 #[pin_data]
-pub(crate) struct NovaCore<'bound> {
+pub struct NovaCore<'bound> {
+    // Fields are dropped in declaration order: unregister the auxiliary device before dropping
+    // `gpu`, and drop `gpu` before `bar` because `AuxData` borrows `gpu` and `Gpu` borrows `bar`.
+    #[allow(clippy::type_complexity)]
+    _reg: auxiliary::Registration<'bound, ForLt!(AuxData<'_>)>,
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
-    #[allow(clippy::type_complexity)]
-    _reg: auxiliary::Registration<'bound, ForLt!(())>,
 }
 
 pub(crate) struct NovaCoreDriver;
@@ -93,7 +113,7 @@ fn probe<'bound>(
             // other threads of execution.
             unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
 
-            Ok(try_pin_init!(NovaCore {
+            Ok(try_pin_init!(&this in NovaCore {
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once available.
                 //
@@ -101,15 +121,26 @@ fn probe<'bound>(
                 // (`try_pin_init!()` initializes fields in declaration order), lives at a pinned
                 // stable address, and is dropped after `gpu` (struct field drop order).
                 gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }),
-                _reg: auxiliary::Registration::new(
-                    pdev.as_ref(),
-                    c"nova-drm",
-                    // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling. For
-                    // now, use a simple atomic counter that never recycles IDs.
-                    AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
-                    crate::MODULE_NAME,
-                    (),
-                )?,
+                // SAFETY: `NovaCore` is dropped when the device is unbound; i.e. `mem::forget()` is
+                // never called on it.
+                _reg: unsafe {
+                    auxiliary::Registration::new_with_lt(
+                        pdev.as_ref(),
+                        c"nova-drm",
+                        // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling.
+                        // For now, use a simple atomic counter that never recycles IDs.
+                        AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
+                        crate::MODULE_NAME,
+                        AuxData {
+                            // TODO: Use `&gpu` self-referential pin-init syntax once available.
+                            //
+                            // SAFETY: `this.gpu` is initialized before this expression is
+                            // evaluated, lives at a pinned stable address, and is dropped after
+                            // `_reg` (struct field drop order).
+                            gpu: &*core::ptr::from_ref(&this.as_ref().gpu),
+                        },
+                    )?
+                },
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index cf134cab49cd..5636659f24a8 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Core types for the driver.
+
 use kernel::{
     device,
     fmt,
@@ -29,7 +31,8 @@ macro_rules! define_chipset {
     {
         /// Enum representation of the GPU chipset.
         #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
-        pub(crate) enum Chipset {
+        #[allow(missing_docs)]
+        pub enum Chipset {
             $($variant = $value),*,
         }
 
@@ -183,7 +186,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
 #[derive(Clone, Copy)]
 pub(crate) struct Spec {
-    chipset: Chipset,
+    pub(crate) chipset: Chipset,
     revision: Revision,
 }
 
@@ -245,7 +248,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
-    spec: Spec,
+    pub(crate) spec: Spec,
     /// MMIO mapping of PCI BAR 0.
     bar: &'gpu Bar0,
     /// System memory page required for flushing all pending GPU-side memory writes done through
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 5a260062295f..5166e10ce8a0 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,11 +13,11 @@
 #[macro_use]
 mod bitfield;
 
-mod driver;
+pub mod driver;
 mod falcon;
 mod fb;
 mod firmware;
-mod gpu;
+pub mod gpu;
 mod gsp;
 #[macro_use]
 mod num;

-- 
2.54.0


