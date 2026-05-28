Return-Path: <linux-kbuild+bounces-13386-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHnrHBJDGGoEiAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13386-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 15:28:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0E5F2B73
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 15:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C69333021E5C
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 13:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522293F39CC;
	Thu, 28 May 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qzw+ZxBI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29363F210B;
	Thu, 28 May 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974608; cv=fail; b=egrqky73PccrshZC8bZzBA/ACwtyvpWoqRFF1/sh9OlHcBVJXBAPKohuRxlDdPmLORjiB+YsTOBjfkhGAbIyRpWR1wUeVL9odRWXhld6OpwcSdXopyLL0b2B2SwNFsfsdgPyMatwiK1jRzlcocpVMskqov/FkXnr8b8XIIcBGyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974608; c=relaxed/simple;
	bh=C0ie+dUaCvHoiDKRbEvFEDb6NhZCvls/PQKq4MFbduk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kdtuJGqyRpuK/MByMJzVDsBdI3ANMjBHimYdxOv65KvWGvChg+vwaVnOCqfcBJ0UuRharve0nPNuQQJuYA+08jKmkilFEfhj+NdTaNv7oqru1pnIJsa8jbEgmJNoyv22q6+nZBj+x8/sRqpp7fyP1s18IcqdKRgxSSFIJ8HVCWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qzw+ZxBI; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZX33xOv71pPRWVqJpb8W+Rlz4+NPJqvD2NO3hi/0YAhp+Cuc6NhEhPPurvqjl6738qMnetfqqC9flLzVUlkOYrkmeHiXx//IR07txLb183dsHcJW1wcXwVvIkejYy1VWO0/1m0YfkphifKDiphLvfyKJ+SdL1NhmOF8WdYHp224MVqiYYdSuZ/thTDUH1UpPHgwZW2Ynp3xUN8ioR4FkjUASW8rLo72gsgAEV5sMgfrOVaIFqSddr9RPKycHeMhgtDgB2+Ej2Q4ogJHruWewSGNyq8lEbZUMZ7SuuUq+YopV7tHY+aiy1IJIWu26qcF1a+R7hvi3mUTmKKoPa5LMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0ie+dUaCvHoiDKRbEvFEDb6NhZCvls/PQKq4MFbduk=;
 b=IPLBtCZPVrdOK0tYGkGx1NPTv5BoqqoYTJHZAoOaUEdp82cLt2mOUTlqrOry93dmjJDZaqQsAjmLecfRioMlRkzv5YTqGxudRTHcjaDD0rQfDOjvAg85yDQCVgKK3oPmr6nXWA/qd7P9iu6XZDGyaver9CMPHRLHExVI50Kz9soHioX5j3br1jdF2dWkrqBHPO2mGsPRRjGgz1g411DvXpEXwuVdriJ0zMaHyY0fHuptHJtA0uCkgww//wKnI9RCSbjbmqz6C95GwEHtTh9YGCz5/nC4BvlGP5yEQueLdXAVXRCEwvdjZsSr+rm8Gh9GdkLairjS13QTfc+odCHXGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0ie+dUaCvHoiDKRbEvFEDb6NhZCvls/PQKq4MFbduk=;
 b=qzw+ZxBImts2yUtTUGGUfX2+Y7oQyBWqKoVQ8Dzk2NZAkqCIJJ6KCya2IjvqURSXpKClM4s8N4nfpoI9+NP/RajTKRcm4iaGTF4/R62eWvoAeUSdt+9D/A2zNDvxLD0HUUGRt4aCNa7QfTVfDeqvV5k1fUoq2oBEiDfRHA6ams+OEuDF6WvuZ+eOH2kTqmnxw3FLaDM0tkkKjoPCst+gAGAGSe8r7fhm07Bh5cfp2NSFN6o7EZfPvqOx0Pn9127t+VepGkRiE4HXetPcDAV9eGW0bzFfGRErYELb/LyB9xM+h4DBlwH+9vomEG2eqYR5i68EwSl/O6W5InxFhC/f+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB999203.namprd12.prod.outlook.com (2603:10b6:610:35a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 28 May
 2026 13:23:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Thu, 28 May 2026
 13:23:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 22:23:18 +0900
Message-Id: <DIUCC1RFFE10.1LJ15YI8ZHPOH@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/7] scripts: modpost: detect and report truncated
 buf_printf() output
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Nathan Chancellor" <nathan@kernel.org>
References: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
 <20260527-nova-exports-v2-1-06de4c556d55@nvidia.com>
 <20260527171823.GA1893026@ax162>
In-Reply-To: <20260527171823.GA1893026@ax162>
X-ClientProxiedBy: TY4PR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:405:379::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB999203:EE_
X-MS-Office365-Filtering-Correlation-Id: 093f8d0c-e65b-4708-af4d-08debcbc4a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|10070799003|3023799007|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	u1EY+NBDHOm/4tsNvDCP9e6ArrLQZrtXgGuC6+aba9xqa5Uz2iyAzcOIAFZ3LJWJSd2rTg4jOVX5o67oNGvdfXutWzTjkb6zUv/h/D2h6KyE7yONx1pqvXiPrwzjK6PswhCqMzCtboP18Ef2JrRFEBgnb1ODpFMNpWjAuuJsjZCM1f+fQrjKOnUNoEXCLxNYAbKvaIfeTDrbyqM7NdN7KJfhFEFrOpI/cU6uDP/ehvzcn/4Vwt0tAvv4IHJ+uMEQSQ8mUssAVrw2QKPf3jCO7lF8KSuh0JFhli6s2fxnt+vBzqLuBv7VmOEMUkCwpyNLv3OrP9XqjVBt/YWlgvNp0JCMvKUn3zBv7wn/HbzT1+mvOI/LSSD/g1FQm6tqUYKNs4SqY20Tw9xhITY1/dpZiN+hG22fbGz5kLisILyuhm+qJMEXwhNHQWVXt0wf+pSeOsP/Xth73mb/hRFxwpxUyhWjasX6VSv2aTM0o8bU/wdDxpTzwESvlMTGJQBb/oVd5gNVZT2+WwjMVNwMH7SH9ARCTYgVCMBNEqn5qXzgNmt2ysAjjo8sAMtO6g0Tu1vYdAVsxaAgx3Z3pA7UUT9zxp/6WDWlahvtOw8DUblpsRkiOjQxA3PIkbFspi8fLlV2dSp1l+KfkqpezMqezlqiH45SBohVrCtJWjFO1MYulQsMdRE75Ae+s/I6SVSzBe2b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkJ3QUtreFlvdVliN3RWN2U3WEZUdVpRTVM2NkFLZ2ZIQUZQZitBN0IvTU5T?=
 =?utf-8?B?MkR4L3NpeEl3NE9jbmsvaHRuR0ZaQUp4eldWVXBiTDRxMUJpc0xpQ2o2MW1k?=
 =?utf-8?B?UmtvMVMxQWpGbldRcndqUTRWOXc3QnRyME1CMktvUUJpdnFlRzdvV0tJU0Ft?=
 =?utf-8?B?bUlSbC80bkVqMDV4V0ExZXdEYklVQzI3YXZ2ZUlrZjBia0cyc1lzek9QWSt1?=
 =?utf-8?B?UnplZit2MGxmV0hWejB5d0RzLzJwMXJ1SmtCdk81b1VrOXlYOEN5OUJydXBV?=
 =?utf-8?B?RVFmQzJScHpvUXFpb21KRXUwSklaeGxsUVNWbVV0YjFEZFl2RTN4WC9abkh3?=
 =?utf-8?B?Z3ZVbnBiRytoMTB6N0pXbTl2dVpsVkd2eW1XRUlieUNoL0RsUzJtMDVEdDNY?=
 =?utf-8?B?ODRscnRZdFBlWHdDdFAxOFpuVnJEVHhRZjJoRHRQRlUzdFArZ1RnUko5UTk5?=
 =?utf-8?B?NVRDeFYvV29HSVNYME9nVnBBcm9WQTFCY3pkVG1SeHhzMWF2ckJ5a2ovNzZY?=
 =?utf-8?B?eDRYNGlZN0RpQUZIVklGY0lGc3ltMEJXWG43cmFvRURnUU5EOWJ0aTVBYUdV?=
 =?utf-8?B?Z21vNi9BU2s4c0kvakd3c3gzRFR0eUp4LzRQS1Zxa3dLSmkyNWRVVWg1UnJm?=
 =?utf-8?B?Q0RUZmVrbzRQRDR1Z2VPU2dSSDg4NXZXWFU3Yy9aZHFoSk1uWE5lYldCTTBv?=
 =?utf-8?B?MkNrbW1LVzJjNzVhV1BqVDBlWit4VDdmOXZEdTdNSStMcW5NT1hPQXNGL3pL?=
 =?utf-8?B?cDlrME5TM0pLMWFGK1huNlVQT09QQy9kZG1wYjJJTVFNMThPcnN4WXQ5QWZT?=
 =?utf-8?B?OGRDd2gyQ3J0Wk8ydlRVVnEzMWR3K1kzZFN3RkVFMFFVZU9kYnh1QWR3WVNM?=
 =?utf-8?B?WDM1b2lJYmFldm1GTGw5cHBYRU83V2wyaWJ0TGllWjdCKzZDUHhRWUVrUU1T?=
 =?utf-8?B?S0FHV0FYVmpWZmxYRXY5c3dPU0lLdDhuZWY3dk1OVFA2cFpuZVFzZ0pDblpM?=
 =?utf-8?B?UHZJaU8vQnBKV2J6a1pDcW4vVUU3VU9IbXNKZHJTMWdrM1BsNStXSitONWhM?=
 =?utf-8?B?Slh4ZzdMeUFweEI2WnpOaTROU0I2RjJaQTVNTU5RWDdjTEJ4NEV3dVJ4dFZu?=
 =?utf-8?B?OVBJZGxuVEVETFZ5bTd2ZDdiME80NW5NOTFjb05NS084R3l4bEdJb2FNQ0RS?=
 =?utf-8?B?NmZETnBpaFlhWitwazZHKzRoWlJMeGlsdWJTSWM2b3c2dVhzaERBdTlJUmFN?=
 =?utf-8?B?ZUlRM1VwOGlYTkwyeTc3Q2ZMaFpUa25kMWdCYnl2WjVIY2tFc0g3cE5MSXcr?=
 =?utf-8?B?VDFab3c5bk9xUjF3QlJaNldJZHdjZjB2TkNyVUw4eWRYUU53WTAzb09ZVlp3?=
 =?utf-8?B?MjgxRjRHNnNJaG4xYTNqU0FPdHIxMDczSnAxOVRxckFST3RFR3hTYnE0Zjhr?=
 =?utf-8?B?Wm9aakNxb2RRZHpZemN4RWZ5Q1JpSnIwc1Q1WFZvdENkZXdMS2dTWmtxejFE?=
 =?utf-8?B?bWFwZE5GTVN2eHJ1QjdBbzdMZGlma0hmU0kxWVJIL2hRYXQ2NVJGaWROZlVj?=
 =?utf-8?B?SU5MK2FMa3lzMnY3WWVEaUlwWjJIV2plMEcvd29wdFlXYldIVVNHc0V4L0hO?=
 =?utf-8?B?WnZhcC9oMXFxMVZnQVdjdzl5Vm84YmpMekttZkJ6YjJnM1JwWjJ5a2hMcGx3?=
 =?utf-8?B?cWI2R2ZIMjV3ajQ3V2JmcTF0R3F2cS9EbUhYMlBNeUE5Q0F5T3RwaHMrR1dy?=
 =?utf-8?B?S0xrYm9qTkFUcWNrUmg4dnB5eXlTTm1heVUvUFBBV1dOeHRVcEdzWWE0T2R1?=
 =?utf-8?B?blRxejRNRUVyNFNOcWlVOUVyRGw1S0tEaXQ0bU1qRUhQWjRQWjNtQjNVdzZM?=
 =?utf-8?B?WmlSUW5JTHhsMHdnSW9vcm0yRTZJd2dHTUI4UXd2YWJCQW54S2JPbGlVM0tV?=
 =?utf-8?B?U2VNbThDdlVvejZzU1NZVU5UaEJnVDJTb2NKQmZ4TmdqczhtcUJYV1hwVjJ5?=
 =?utf-8?B?MnlBMTA1U251TTNoSlE2ek5qTHpKMW1hWktmK1I1TVA1Z2Zyc0doZ3BTdFFW?=
 =?utf-8?B?d1N1NlE5ZEVMOFBEcnhBTU5XanlMd1lXYXVsSkRZVHc0TXNHdnVmQzZ1UC9V?=
 =?utf-8?B?cFpLbHRvUGxsQ3ZYVWxHTWpBd0Z0RUJFZGZzQmg4MWU2SGIyd0ZlVzQ1VE9m?=
 =?utf-8?B?MFlMMGlDakV3U21id2RzWEV0cDlyYkZ2OXRicjBvOVI5MEdCdjF2MjU1TkJJ?=
 =?utf-8?B?ZC9qRGREZHQ2cU54TWVTVjBFZGU3QVpIYWNnMkp2eG1FVVcyTy80RWRxaWpp?=
 =?utf-8?B?MDhoSlRSOWhiSTVMR3pRaFpCOHBYSFoxUXYzOVBxK2x6NWFBWmJXTzEzazZE?=
 =?utf-8?Q?SRkcIifMtbE7XkUHq9KIvT3D/+TGVWK4WE9w26xEqH6Re?=
X-MS-Exchange-AntiSpam-MessageData-1: YJMx+nDZpDki6A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093f8d0c-e65b-4708-af4d-08debcbc4a14
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 13:23:21.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeZLwdAYcBnEk87ra7L3omL/4nrxtBAv1uBSleWwVLVEEoLVicHKY5gsda4IvE5jIkV3SzTXC+6dlvDVzH1hnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB999203
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-13386-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 11D0E5F2B73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nathan,

On Thu May 28, 2026 at 2:18 AM JST, Nathan Chancellor wrote:
> On Wed, May 27, 2026 at 08:52:17PM +0900, Alexandre Courbot wrote:
>> buf_printf() uses a fixed-size stack buffer. vsnprintf() returns the
>> number of bytes that *would* have been written to that buffer, which can
>> be larger than the size of said buffer if the formatted string is too
>> long.
>>=20
>> The problem is that whenever this happens buf_printf() currently passes
>> this length, unchecked, to buf_write(), which silently reads past the
>> stack buffer and copies invalid data into the output buffer.
>>=20
>> Fix this by detecting vsnprintf() failures and truncations before
>> appending to the output buffer, and report a fatal error instead of
>> producing corrupt symbol names.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>

If that works for you, can you take this patch through the build tree?
I've included it in this series because it detects the issue that the
series fixes, but it is not a dependency for the next patches. I just
wanted to include it for context.

