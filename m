Return-Path: <linux-kbuild+bounces-13403-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJeCKGKxGWqtyQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13403-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:31:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0847B604C21
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADC8E33CF245
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 14:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829DE3E928F;
	Fri, 29 May 2026 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eeN75O+B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6303E8C64;
	Fri, 29 May 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066130; cv=fail; b=cIe9jncRXkBbQ1/vOztt12JJrfashcCtD6tHkAlBb56du/HxCUmEOFw0XtjeRRu7uaoCf7TlGxLrJn8LvdZkAcDOf9Y1PysIZMsedjYXHXhzPvtHuJcyOfxxN6utU7BDVpczlx2H19t1eCt1mPWnvE0i7FsO/sr+3B9udeLDSWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066130; c=relaxed/simple;
	bh=TzyhOBHDTlu6K9IS+FFqL5AHQM1naYb1/UWGTQfAdBU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FdMeR3+S/ZVMlCj9ELAvfbdPqabnX3e6751iVflYfs/Y1NcaAyq3vUSYlziHDuiIWMT4Zp34HHRiBQhbO2oqsgGRzhMUjERRNoUMFUmV7EZzmRnJTRW63A4I3L5ClLX6Eu1n5mz+ru/mIya2IevXxjFgLqqTK4IAyodljEl0mfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eeN75O+B; arc=fail smtp.client-ip=40.107.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPIzd9PyLxvUPK8ED/ZG3vgxzqi1HS1YQUciqTHusJ2kzGoSuyTZxLzekUshCsuxcnb1uj5Jd2FoZeaubWcty2Tk2+YVoK4ttxbj8Goc0QIPq8xjto3AYKzDMzLEQuun6H7J64LszNtHbHoiIoErcWokw465BTxOSHjBR0rsWHqOzaTwZlgulesanbca3jRHCf8kVF7QJL3mrIu+zm/Rl6+TD3BFhM6ZOvVFlvVHFX0kMx0WWV3s+MDEcc2Hl+RWWwHFXKWD/D/BsA726Ynwl7fN2o9A938FMjsIWhNCfLNQf+2cx91t/mOjXPQi/016wUWGXcrvGDUiybOhIzx3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bILUNr01h6ZHF5nafo0poSFLh9j205y62QIo5ZCt1E=;
 b=hTG+1GgeQ9p6iJjxmf+sDGLFN1NHPMR5fuexu1qa2dwGFX2Ov0ANehageVzGJGw0Gcu6jpPLr+ylnv60UiKo3bGJD0vjn4fBlfntLBr4ueS3TLzptcZhoC79ly2yCTwc35XtO5H+BAGLZqbWBZ4rh5wHNYciq3CKyZFxsUSltDSeotgA8uPub/T3fsibsJTU44ui5MlnGoYA7aVvnhcTfCnEeML2osAPBro4SGr9d/QHdki0QwGtTUnRBKUUrQIJU9FmpEk1UJC7gTMt+IfLcm+ePP0EmdAKvrXDvQHvts9l3oL7LQQAT8qVyAYyZI2PC065SvbprniiKYX7i7Vb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bILUNr01h6ZHF5nafo0poSFLh9j205y62QIo5ZCt1E=;
 b=eeN75O+B3lPJjY76VIshQd3vF5CmjoBI28/Yuuf26+KpF/goaEdwQDmoxFCKAFOvVGtFd1+ATdmw0NQNlruDBay2xwrnA4f51OShudm/2RCQgVQicqPMfDl/h3dxkE7Ym9qUTKFq4T+wED6bC6ePHlLcQ8EIDSCXXRnTT63I+bkdfd42+6Db5aQebbsAlfevF/wXGprFR2sEk2KQyiLkXKmiKld+rLe7C1wZ+4ZlTGKP/2MHHhh3Likm5ttzLnamlKjZTVbS6Vq76SABUhdVXLIcyNtOsRoFa1RS/04KXw6BNAwgUGEUeqbSq21miqVOZ+Xlczplsg92ER5/im5MPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DSSPR12MB999214.namprd12.prod.outlook.com (2603:10b6:8:378::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 14:48:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 14:48:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 23:48:37 +0900
Message-Id: <DIV8RXBV2NX9.2UZ5RKR6STYH8@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/7] rust: always inline some init methods
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
 <20260527-nova-exports-v2-3-06de4c556d55@nvidia.com>
 <DITNHBFUULNG.2X57K1ATS5AUO@garyguo.net>
In-Reply-To: <DITNHBFUULNG.2X57K1ATS5AUO@garyguo.net>
X-ClientProxiedBy: TY6P286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DSSPR12MB999214:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1d5046-90a5-495a-54d3-08debd915fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|18002099003|22082099003|4143699003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hSLp/f85r+TFdzMqEflaPRsN9zfiG9h0X4fg/gj5rADi5UNuOuD9QouoywoxNqUjS2mlSJbRCDZaxJvBopKi/K1kLEdQnXzFzAXCuAPOUkLh99pLClrPz6S266/kgztVyruuUGRNFkHdiS23tk99atvFrXKajz3c65xA4yAJrqC2Fen8WSEZck2NgZdP73UAExMN4Ul8vlBz1/1GexNUItX97J7ld5CvMg/dOD7G7SM87XBVl/40onk9VXMZ5h6J1bxNrXgbmeQ+5I4tcKbfKuQD1JrifWKnwEQzxy0EP0n4PItoiSsfgnOk8H+qOk0Od41+NYMHBTFvd2wPz7275JOdO7gCx9eLesFzXykJ3yE3V7qRAo792jp7Hcu8ABnDOGmIRqAzpg6lzWASZfv/ITmhcR2ORAJS7lW6SS4LcYCM7uVgejiHefkVRbXfAvoNAgxzKjJ+k3CtoN5tcrY4i3sRnc+9WBz/xFnlFYwxTDeuPwL3ufA+iWhT83rEQEpMpWdr22TIcprTht8yk96Pzu4lWITjb967k2Xe0BNY+Qye4sJwzfSN7GTqKg66ulgdzxdgR1ZbhAU7ymKdcE0NoT+jp1p+HtVePM68ETMj+vLKamvUp+14191pnSsiZ9t/mZVOJFeuOloQf63JdpfQbM46InxA67It3hWDjvedVSmDpFqSytF8bFp6ic97A0Dq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUFGMXhqT0xEQlR5WmJCRUUvcHNxQWxjalE0WEwrTkRlRHFoVkdyNkNnUHpm?=
 =?utf-8?B?MitkczZUbUZQcllhaCsxRWNXWmppTTNEVnViOGFKVTFlTkNDVHp2RHo0K3I4?=
 =?utf-8?B?M2ZEY3kvMnJkUTBpOUtCZHRaWUxUenYrUFlla0taK0tuNjllbEV4ejcyNXZs?=
 =?utf-8?B?QjM1czNFU1hVZnlJZzZ3VDNjVWZaRWlFZHVoTkl0blk2OEIzOCtLTm5HNHQz?=
 =?utf-8?B?TEwzSERValNYd3hVUUFPSnR5ajFGc01lYW5UOG52MEhmOGVMdCs5bjU4VWRu?=
 =?utf-8?B?MDhBVHJ4d285eXFjOG43LzFVWTZ1RTlLa2QyaWtNNngvYkpqOHVkTzRmeTFF?=
 =?utf-8?B?aG1xTGhFVDZ0cDR2cFh5ZkJndkJSVWtUWjFmckFHMENOSjUrcDdzUTFrUHBX?=
 =?utf-8?B?STI5QThWS0ZOdzhqMWt5WWkxMTVWb0FzQmlwN0hWdFBKVndBaVFGWHZYTGsw?=
 =?utf-8?B?K1BydnJOQmFGN1g2WGNqajQ4VldtNEY2VkdwTVJCdVRCWFZCQW1ZNWlBWFFX?=
 =?utf-8?B?dGUxQzBrZG5TcVhqV29kalZERUtaL0x3UUJsMjRONWxlb3FsVWFyK1pXRlBF?=
 =?utf-8?B?dzNyb1ROdTNBNjNOOHpqdzVOUE0vTEIyS2t3REZjU0d0K0NsRTBRa01KQVpT?=
 =?utf-8?B?UU1TbmxxQm8rZTJJWjNNc1ozaE9qUFNjeFZQVnRqRGNlTDd4QmJvUGQ5alo4?=
 =?utf-8?B?TDVBZEhYcXRUKzBUdERRc2pJaVFBM3ZsWVMxNHVZQ3hkOWVZeTZuRlAySlU5?=
 =?utf-8?B?WGNrWEl2d1p3MC9mRnBEK2V0ZWNRNi94QWtqK012bXZUODZLNWZ3R3o0VE5G?=
 =?utf-8?B?VFVlVm1lSnd5bk5zejFDd3hXTkpWZHhLS1dVL0pTZlBqZTlLTkN1ZElFK0J1?=
 =?utf-8?B?bUF5cUJLVEllaU54bEdnS2JDRzlkbFkrVmFCYUdMYTVSV0xtZnNWVFhEZGRn?=
 =?utf-8?B?UHRyMkdWWktVenRtMmJlNjZiZzNmSWJXbFlBR0ZIc3AvalRXdzNiUzByRDNy?=
 =?utf-8?B?MnI4MEIyd0FiNXUvYitDd2p0dVQ2R0xWSFBvekp4MGRwZEQyWDZIUnRsSFVh?=
 =?utf-8?B?MlR0TktlVEROZGhBa1N5MlVvUEkyREgyRVZsOHoxZG0yclN5Wi9LbmR6czFT?=
 =?utf-8?B?Vis4dlZkbVFybFJlQjVtWTQ1YVhrQytqVzVDQVJ2Tk5wOURlU0dwR09nKzRw?=
 =?utf-8?B?MGt3NjVOeXNXLzZXaUovSFNoTTgzTDg0TzZWTkExRER3Tnk1aDFFZjRENmRE?=
 =?utf-8?B?a2gzeDFOQlUyT3Bub1NjV09Lb1MrZ2ZBOUt0c3lrdE56Z09OaG5MVFVwVndz?=
 =?utf-8?B?aE5yaG9ObFZDREovT0F1QWpydDMvNUZtR2N4SVFRTmZEdDRuS0xNb1ZXMVRG?=
 =?utf-8?B?WittQzFjVXlKWitkRTRZWElEWXhUdUFsWFhoMDhKdU1lbkFHaGhWOU8vbVNP?=
 =?utf-8?B?Vmx4VzNUUjBBZVJuTzcwWFUrVEZCYVRSYkl1T3c2T2E1M2ZWWlc1cXFTeVhu?=
 =?utf-8?B?QkxoTUVMTjF3NXpmU2xpNFgwV2QvcjFvVzdqRzE1Y2lVZDFjc3JkeHkzVUJ2?=
 =?utf-8?B?eElGSHFjNWcrVGhoZnVsTm9qRmd6eGIweDNxaFhpdndhT2F3RkxBTTI1ekNz?=
 =?utf-8?B?M2NNQWNiWm1COElkVEFUZnlhSm93WEczUEZ6RlF0TEZrZS9sb1JJNXVtdThB?=
 =?utf-8?B?ZlZXNlowK2hsQmtoSmtnajZFTFQ1WTFGU00vc2hGcGR4c01GRFRIb2FZNnNC?=
 =?utf-8?B?dWdlVGVwZThRWno1QjVPSW9mcU1UdmY1VlZvTkVPVlVMWFNlVVNob2lxdSs4?=
 =?utf-8?B?K0U1MnozR0RiQUpCbWRTVjdlRzFKUTZvSkFQcnhrdGRNdExPa0RHQ3FEMlg3?=
 =?utf-8?B?d084cUtiRlVHUWdrU0tNY2RDTVI4YXlPSklqd1ZYelRNQVZCNng0d2tuVTJH?=
 =?utf-8?B?MXFkUnB5UW91eWVCZ2ZpYy9XbGd1bnZ0NkN0UG5tYU1UL1hPUjNGeUt0bEtk?=
 =?utf-8?B?aHBsS0NSZ3YrM29udEV4YS92OHFNUmxZUHNYaUxWSWc0a3kvbDlnODFYM082?=
 =?utf-8?B?REpZUGtmbDl3b1BXME1rWmU3SDVLL3dSYWF4dlFrYkhVajM3dFVidXAxSm41?=
 =?utf-8?B?OFZOV3lOd0MxdXZhWnJ4NHdMZkd2U3pqNUZycExVT3dYYWk5QVZEZGpJRnBp?=
 =?utf-8?B?VXFnd3Nkem5nVkhuYzd5aEY1QnZSMDZJeGtoM2NZL1Axd3hBbkJ1NFdhZmdr?=
 =?utf-8?B?Yy80WkU1TTF4ZzkyUk1KRHk3NEhIZkVJUmF6SkcrcTRSQ2dkTE1heG9Jc1kz?=
 =?utf-8?B?ZUxqSHpFbW5TS0NUeldqVGtYMStocTV0QzZSTGI5d0F2ZVlDUUk4ZThrVXFy?=
 =?utf-8?Q?ntUyrupV9riwQTSWUdQlTH2Hizb3s4iIwEcJDq5PNCPBD?=
X-MS-Exchange-AntiSpam-MessageData-1: 61N6+c5gEyi7wQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1d5046-90a5-495a-54d3-08debd915fe0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:48:41.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgJnSux8j/JfbAZl2ToIwVWoDY5UvTvygMTjDUsMUmOST69sOVYPFDiWzjVXaro1sfUebC+suqvgh2TaTP80FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999214
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-13403-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 0847B604C21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu May 28, 2026 at 2:54 AM JST, Gary Guo wrote:
> On Wed May 27, 2026 at 12:52 PM BST, Alexandre Courbot wrote:
>> These methods should always be inlined for optimization reasons. Failure
>> to do so can also produce symbol names larger than what `modpost`
>> supports.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/alloc/kbox.rs | 2 ++
>>  rust/kernel/init.rs       | 1 +
>>  rust/kernel/sync/arc.rs   | 2 ++
>>  rust/kernel/types.rs      | 3 +++
>>  4 files changed, 8 insertions(+)
>>
>> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
>> index 2f8c16473c2c..592fffc72e52 100644
>> --- a/rust/kernel/alloc/kbox.rs
>> +++ b/rust/kernel/alloc/kbox.rs
>> @@ -433,6 +433,7 @@ impl<T, A> InPlaceWrite<T> for Box<MaybeUninit<T>, A=
>
>>  {
>>      type Initialized =3D Box<T, A>;
>> =20
>> +    #[inline(always)]
>>      fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::I=
nitialized, E> {
>>          let slot =3D self.as_mut_ptr();
>>          // SAFETY: When init errors/panics, slot will get deallocated b=
ut not dropped,
>> @@ -442,6 +443,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) ->=
 Result<Self::Initialized, E
>>          Ok(unsafe { Box::assume_init(self) })
>>      }
>> =20
>> +    #[inline(always)]
>>      fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<=
Pin<Self::Initialized>, E> {
>>          let slot =3D self.as_mut_ptr();
>>          // SAFETY: When init errors/panics, slot will get deallocated b=
ut not dropped,
>> diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
>> index 7a0d4559d7b5..36d4bf1959fb 100644
>> --- a/rust/kernel/init.rs
>> +++ b/rust/kernel/init.rs
>> @@ -151,6 +151,7 @@ fn try_pin_init<E>(init: impl PinInit<T, E>, flags: =
Flags) -> Result<Self::Pinne
>>      /// type.
>>      ///
>>      /// If `T: !Unpin` it will not be able to move afterwards.
>> +    #[inline(always)]
>>      fn pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> error::Re=
sult<Self::PinnedSelf>
>>      where
>>          Error: From<E>,
>> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
>> index 18d6c0d62ce0..973f15165606 100644
>> --- a/rust/kernel/sync/arc.rs
>> +++ b/rust/kernel/sync/arc.rs
>> @@ -712,6 +712,7 @@ fn try_init<E>(init: impl Init<T, E>, flags: Flags) =
-> Result<Self, E>
>>  impl<T> InPlaceWrite<T> for UniqueArc<MaybeUninit<T>> {
>>      type Initialized =3D UniqueArc<T>;
>> =20
>> +    #[inline(always)]
>>      fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::I=
nitialized, E> {
>>          let slot =3D self.as_mut_ptr();
>>          // SAFETY: When init errors/panics, slot will get deallocated b=
ut not dropped,
>> @@ -721,6 +722,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) ->=
 Result<Self::Initialized, E
>>          Ok(unsafe { self.assume_init() })
>>      }
>> =20
>> +    #[inline(always)]
>>      fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<=
Pin<Self::Initialized>, E> {
>>          let slot =3D self.as_mut_ptr();
>>          // SAFETY: When init errors/panics, slot will get deallocated b=
ut not dropped,
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index ac316fd7b538..381a06ee0d59 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -367,6 +367,7 @@ pub const fn zeroed() -> Self {
>>      /// This function is safe, because the `T` inside of an `Opaque` is=
 allowed to be
>>      /// uninitialized. Additionally, access to the inner `T` requires `=
unsafe`, so the caller needs
>>      /// to verify at that point that the inner value is valid.
>> +    #[inline(always)]
>>      pub fn ffi_init(init_func: impl FnOnce(*mut T)) -> impl PinInit<Sel=
f> {
>>          // SAFETY: We contain a `MaybeUninit`, so it is OK for the `ini=
t_func` to not fully
>>          // initialize the `T`.
>
> Are you sure this (and other `impl PinInit`-returning functions) are actu=
ally
> causing issue? They just return an initializer and the actual init code i=
s not
> marked as `#[inline]`.

Indeed, this works fine without marking them. I have been a bit
heavy-handed, thanks for catching this.

