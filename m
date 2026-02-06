Return-Path: <linux-kbuild+bounces-11069-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEqJHiprhmnwMwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11069-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 23:28:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D214C103C9E
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 23:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39E2930498D7
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 22:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B613112D5;
	Fri,  6 Feb 2026 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dlrCncrE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020099.outbound.protection.outlook.com [52.101.196.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477EA2FE044;
	Fri,  6 Feb 2026 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416924; cv=fail; b=DUKjDhruV4v6V7NGxnoCoE0ECKBjtJdh96PvX9r5Yd+6tTVPUwHG/WNg00FUicZ+G01m5fGlqltfcxDlUfjwKES5Ht0fVyXHEDbrPj5H5dRXvgFtwXtECAs47ha471VOLRep1opupI+WvVCWjijoQENChL//3eksDg+6S2d5GBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416924; c=relaxed/simple;
	bh=pLJLz8f2MSI/EUiz3qpqPX4W/bf9/HuV4+VHKO3yTuI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WfMF+HwY8I0ttSgUMBUIDgF1TpMZl7T7lAetCGPhQxAEURFOIVH6FgqtfZ9O0lrjQKZrU4yI4R+mp/4lKUtrIDHAzpBH7F/HiHcU1MM6zenH/PS7nZ8rJ3XvyQyVxd02L8V568N9XtsceertBAUJgkI5KsxNNIBCOb3mYv3Xp0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dlrCncrE; arc=fail smtp.client-ip=52.101.196.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6bPmQzqPRaUMCTc5X10plzPFYnsZuuS4cFGJfYfTTPB/ulvqh2pNGwixKmSz2nslS5a+N3AFKjghifPrIxrESvCnuAXH2lwJbDKzJv+MQ7QvJ/UUlEapAI7uyEN0bR0il9x7aW7hoDbAEhhcz/MrYix93z8KdJ8Zna7oslEEElPq74YVNx/0o0lYAmt5P13Qlm43zBmwQS9Vv7X8EWhY2A3nFrvta14Tejchk5olTuZHAQQGKdoDJXnnA7MqtX0H3co6vfC8kyA1P2Kb0Li1k0PwAfzeaq5VvO2ri+HDvq7fEvLdfZA/NOSULZHPyGzJ0QEJEcQB2kKyJCQZbpiHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5kAFHK6/i2k+im+lCp+PL+bdkj+bLYLS7slrnUx0GA=;
 b=cg9qeOP1OFF+SY6wmdq7bFkorFuaKE74RXiLfn78/wsU/OzLcUfuT2PoJP6PZV2wzQWDkN7BrGQ8aNop8NJiNjzp/D/squTOFRONREMMQebFlUqmZAVAAidPD2Ppj/60sS2nFTkuk5S9j0WkyJZriSfRTGURwVYDey7j6WWXKTrVbuQAMiLVFD9yZD6DXhjsx704B9GZIBpXlg+ctVlP7gzaIMhkIwpJqS3mNWfVXCovNAKDX6tRHkuWjjhGAz3DdFywV8WfFoymbv4dh1guo3BwMkFqIwgR8AGbY0f1YcfAKdCOFAAVdfDPtN9v7Hr7CkpPH/xai9AaNjGYXpxomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5kAFHK6/i2k+im+lCp+PL+bdkj+bLYLS7slrnUx0GA=;
 b=dlrCncrEEhln1gsCRUDc+luUVcqO1smc28qt11DgDnQVMBdAd7HuDVNz3aO8hNg0EvTq1pAmu5To1xh4rhpyZkJ0bq7b9OsT/iYTDR2cGe041hnqDd1cUMpTNBJPkPUY/JZd24N1sNYqiroIWqYwhtyAwx3X1zmAbvcmjWsrp1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2879.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 22:28:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 22:28:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 22:28:40 +0000
Message-Id: <DG88F5B5IAA2.1XXMBH517NDBW@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Yury Norov" <yury.norov@gmail.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org>
 <e137e948-e44a-455e-b3a1-717865ed15aa@nvidia.com>
In-Reply-To: <e137e948-e44a-455e-b3a1-717865ed15aa@nvidia.com>
X-ClientProxiedBy: LO2P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2879:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f6e98b-c937-4146-c949-08de65cf1475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzZUa3RhM0JsRTVOcWw5ak1RcStWUW56d3lwSHMzU0RKeGc5NU1TZjdxNXNt?=
 =?utf-8?B?SlpzVEVLbThsVU4vakdnc1RUN2tUZzdUcnVkWFZaQVFYQ0JSYTRGRHVaYkFV?=
 =?utf-8?B?YWZydUJJMHM2enFZT1E0Z1dBYVpabW8raUMvcXQzaUdIb3Bhbzh6QjVzemoz?=
 =?utf-8?B?ckk2SDRiRWhWOThJNkFsbm5XQmtoQlFyRzgyS2JsOFFLUkpBeEtvRXlZbzB2?=
 =?utf-8?B?U0FQNW9pUWwvMnNFaS80QkYxOWZEbjQyRHAybW5UMS8veENYVDJWdnd5WFRX?=
 =?utf-8?B?VzF5VHRGa3FvKzJzb1daVWU2VGV0ZkRPb3dmTitUVE9OTDd1M0YwSEJJT0xx?=
 =?utf-8?B?ZlV3dEp5d0ZNYnBDZDJwTHFSWHVxUmVrSUl1Ky8yT0RVT0FpSS81MWJGU2tN?=
 =?utf-8?B?NkNQQUUrdnkyOStkd09YbENKYXlLL0oxbURWWlpYMzdCcnlqZ3hNb1M1c2F4?=
 =?utf-8?B?TGt2ekJmV3BsY0k4a1hybmNYTmJORDNpc2ZxMVRjaFo3ZDVobWJ2OHlCcUZL?=
 =?utf-8?B?czRRQ0ZsNEJaa0NtOERSdit5NUlZVENvS0JlT1JJcnVGbWdYclQyZlJoMlJG?=
 =?utf-8?B?eHhOWDlTR1pTVlQzRFhaSGU5YkVYc3pyTFQwVkZucHNsaGlVMS91aXJoTXMx?=
 =?utf-8?B?WE1JYmxEZlNLbjN5OEwxamZKU0VJOEVoVjQxYlZwNE1RS0lTaUVWWnZuTUkz?=
 =?utf-8?B?cXUycWcyZUlOL251RWFqeWV0Q1p0dmFaRGdzSFhGVERLK2xMQXl2dnpyOHNu?=
 =?utf-8?B?amY0a3dSa1c5aGc1Zk9KZlJBeGYvc1oxczFRSVBtKzk1bkZRYXNoZGNhNHJ6?=
 =?utf-8?B?Z1dUVFpnM1lPREtHKytsVEp2NDZQbTJycktmdjhiblpsZC94Mi9KVmViYmo5?=
 =?utf-8?B?UVBsc2JUYjhXRVZFalJrV0paT0FMQkV1c3BZS1A0N29xL2FBTlhvWlpHKytU?=
 =?utf-8?B?UUpIN2FyR3dwdG1TMjUyQy9pTkhuV1E1SjllRFF3elByVkxZdmpNclkraXpT?=
 =?utf-8?B?UG9KOU1WWHdyMTJkSlNqOFlscmVXSm05cml2VUN3RjQ3blE1WVFiN2NrcnFw?=
 =?utf-8?B?NkxGVzI4YUt2VUdLejk2aGc4NjQwSmZIUGEvaWN6VDQyeXdYOVM5Uld6bUN1?=
 =?utf-8?B?ZVpCNlI0c0NZNkY5SGx4QUsyejhJNzFRNENYNGFTZHR0eWYzdERuSFpmU1RJ?=
 =?utf-8?B?dG1GSjV2akRwMVhtcVJsU0ZWaWNzT2VQV3NKQldTcmc3OCt4NTByd3dsY2x1?=
 =?utf-8?B?ZlBWRFVBWERELzNwL2VTeWE4eXhqQ2R2VFBCTXFrRGNjNGxJdlk5bXdJblZY?=
 =?utf-8?B?NEw3RzF5d3RXdTQ5SlA0cmh6bjRnbE9JWi8wdlBnVWxnNkdYUVhvQUZNenA1?=
 =?utf-8?B?dVd3KzFSZzR1YTYwKzJONy9UT0tXK2xMR2hWRUhTYVBzTnI0Wk9aR0xzS3Fr?=
 =?utf-8?B?R2VkNnFJdnJ0TWRZcUxvVUNJQ1pQYlVTWGJmSEZkNlNVS1pTUHJaS0VRblph?=
 =?utf-8?B?dUdTYktMSUtST2IyZWk4N2UwdW13emdKVzg2R24yc1M4cFczVWt6ZTdUVkdK?=
 =?utf-8?B?MmhUeUdraVF3ZUtnSVVnenllYjdRYTBzVlJIZGhnZEw1UWl5WXpNN0ZWMnpJ?=
 =?utf-8?B?NENyZWozUnE2WHlvMUI4Y2hNQU52alI2RFU3RlNPdmsydUxpR1h0emlWbWl4?=
 =?utf-8?B?RmxnaXRBU0FaUXE2dGN2eWxqQjEwOS8wRW9Bb1ltZTdKTGdySDJaTGNMY0JI?=
 =?utf-8?B?TE94Y3NYMFZYcnFONHBBT2x1QjhRc1pFNGJZdU9taCs3cmZtQVA2ci84aFZt?=
 =?utf-8?B?SjR3MEVHelJObE1rY0xCdXNHOHJnQUpleFdoZ2d2WVNaOWQwZzM1REtvYm4v?=
 =?utf-8?B?STdWOGllbCtpVnZmOFRuSWpMQmRoYTUyR2VRcGNKNDAwdnJvSnhyY05mTzVI?=
 =?utf-8?B?QnJIczJreE90bVZiMUc0Z2k0NC9sUzE3aEM4clZUN1J5QUtPRDdaMThONVJ2?=
 =?utf-8?B?U2NiZlVPSEd4SnVVdlo3d0JWbWhWQ2xtazF1YjJWdWRXWWdacUMvVHd5VnNs?=
 =?utf-8?B?MmFDOG91V0VVTFkxV2swbEpkM3Q0NXdWa3RvTElsNDF3eEFBK3FRaDJPaXI2?=
 =?utf-8?B?NmFZODRQTTR1NXQzNU4vd3N5bmVRY1R0YTVwaXpQeWZCYSs3UnRKNGczR3Fm?=
 =?utf-8?B?S0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHozN1NhTUZmMlhJc25LNk5LWmYvamI4R2paN2swbzlkVHVlQXpWS1RkSU1s?=
 =?utf-8?B?NzVlUTVPN3JuZ05XTkZrYkkwWnBKS1BEaVFlOVRsZ2ZiL0JCaVVYbXRENnlP?=
 =?utf-8?B?V1R3NFhPTlhMWEJQa2pzbmJPaUFIcWtyWmhOK3lmTkZ1eXIzci92cTRGcUhk?=
 =?utf-8?B?bjd1TU9USTQwS2U2elphNzRrV3JYZW9tOVFYMFltTk9PbDBPdjZWNDI0R3A5?=
 =?utf-8?B?VHRnbkpJR2FHZDVGR2RmOGZJYmN5WG9RRldmYWh4NU5KdS9HYVZNa3FkSjdr?=
 =?utf-8?B?R0hoN1dTMlI2cWJva1ZXZkhZWTRIWFFUdHEvR2RKNVRZUHAyM0VQb0xDWUtL?=
 =?utf-8?B?ays0eEttQVU2YWFsc1liRUVicGptaXY0TlBRSUNNRUVERUErS3JkYStPOGp1?=
 =?utf-8?B?czIrTmx0QkhsM29zMzdZcDRnZ0ZCc3F5SmFUOXlVcXVMRFNYcnhlL3k4Q0Js?=
 =?utf-8?B?WlUxMmx2NW1wUkdwaEdEMVRic003K0xCMHdHd1Nvb0FqcUEzZjRrVFppOTZk?=
 =?utf-8?B?dEd6TVBkeWhCVGtRZ0N2bVB3S0pud2picUc2WUc3VDdYRjc4QVBITmw4OGk2?=
 =?utf-8?B?eFcwcFNIZmphR1IweXkvN2pZTmVSNTlaTlM2VEVjV2VzODJPYU9Hb1o2b3hn?=
 =?utf-8?B?M0ZsT2tlV0tYT2h4NE83Qng1ellVcDZ3MFFtY1NYeks5NmtMUHZVTml4ZkJn?=
 =?utf-8?B?ZHlHQStUeGN5RndxUG16a0lIZG1pSzlRTkJJYWFqcThXMkF0MHJOY0F1L0J1?=
 =?utf-8?B?cmY3N0tBb0hlYkdXOW12ZHFDSlMyTnBQS1c0UCtRZ2VzTTErY1hwcExCNEIw?=
 =?utf-8?B?Q01MYjJRNlNlbysxRGxZME1GVEZLYzB3VEN6RHlDTzUrdTRsc28vTE1BbWwy?=
 =?utf-8?B?UjZQaWJYYmo3WjZqVVVDL3RNMjV2YjZJMTljdVZpai94VWxJKytobWg4LzBr?=
 =?utf-8?B?TFA5NVJuaXYrYUZCR09NcUErOTVmR0FzR3I3dldWdEx6ZGk3cXd1RmMrOW40?=
 =?utf-8?B?WndNUkp3MzBhUVd6aFphNDJWc2F2ZFdEUEsxRzVIN1hKRlJRejhWWnUrUGtT?=
 =?utf-8?B?WFQwV3V4Sm1kSGtFN0NkUkJlSllxVi9CTDcyTXVWbVlBcHhhaktNOHB0VWNr?=
 =?utf-8?B?d1ZWSE9zbUlsbUF3aHFIR2FUS0h6aENzcGJvdjBmcGVrM21ickkyczFDL1Vq?=
 =?utf-8?B?UWFjOWZyalpyd21LelVaTWNBUXNodUJqTWhLRWIyUXJaZnR6aGcxa0ZLSHR3?=
 =?utf-8?B?aUxCa29wZlJZMkY3RFNrclFjMDVPekVvdjNIcGh3eGI1RmhEMmFBcml2Q21R?=
 =?utf-8?B?UEZpREFCZHVPK1o1QTBSL08rZEpMUXFqallBRStES0F2RzJkSVZoczNLNm1S?=
 =?utf-8?B?NzNPOHlJWnRsUnZWeXhCZ3l5ck5QeVFub01KOWNHQ3ViSWtLdDlBVGZqS2xS?=
 =?utf-8?B?ajkyUVY2OTEvL2REN3ZDVGtkMG1wQzdGcFd5a3NzOCtER0ZHY3ZyZ0czS1dQ?=
 =?utf-8?B?WVFYL3U4QXgzZ3o1aTBFa2Z4MWlTejNkUTN3a3c3QUU5YkpsTEpZMUFySzhJ?=
 =?utf-8?B?VkJhS2lnRkZnblVpN1FLOHZrQ3BRMDJWMkozU3dHQk5ycDEyeC9EMXJnVEpk?=
 =?utf-8?B?WkhCbmorbDFGZW5nUHJpR1NhSW15K1FRY1V0b2Y4T1JkaHlCRmNKVkxhVVdM?=
 =?utf-8?B?N0NkRG5OZTZZLzFaKzc5aGt2YnQweEJoMWY2ejhJcEU5b005WElWSkxDVnpz?=
 =?utf-8?B?b0JWK21VOWtheDQ3SXVEUmlHSDR4SmlUd3RZTGdvbW9aNWlMSytBZFY0YTdH?=
 =?utf-8?B?VCtXdDZ0dy9vTG1xdzJwNjdLRlR0dlhCdUtjYy9BcFVJQUtjanZ6WFJhRkMr?=
 =?utf-8?B?Q2FRelhGWXBWemFVbDIrTFYvWjBaYzdkRDF5OGVkRUU5YjRBc3gwSWVpZ1F4?=
 =?utf-8?B?QTRET3hXdE1LcmJpVnpXY1ZmcXk0SW5IWm5aV0lFWGVhc05KeE1hb3ZJa3NT?=
 =?utf-8?B?cTgxNUdRV2J3czZSZHZKT0xOZStWYzhDZkZ5b2hmb1RKL0FtVlJMMWRDdWlS?=
 =?utf-8?B?ZHhuWC83ZkE1RlpBaXYrQytHNzRtaFVma2ZUVEJVS1FqYmtLWFNOMzhZM0N5?=
 =?utf-8?B?SXZBMnFOTEJXL1ZJQ2kyUmMvU05yL2JMWFJZTXR1bjRUTHBkcWJYQlRROXZZ?=
 =?utf-8?B?QUc5REMycnlvV1VhQ2VkeVJjQ285cXRIejY3aE5zdEdyeG9iS0hDWjArakV0?=
 =?utf-8?B?SUZ2UnovbnRwWU1hMzV4TTJ5WUZ0YkxHMzlLRXNQMnFwbkxyYTVCMGFCTUt4?=
 =?utf-8?B?bmJpOXgwQ0o3K0UxWk1WUGtFWXRyaE9kcmc1ZGhWaEJiZ1pFQXNHZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f6e98b-c937-4146-c949-08de65cf1475
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 22:28:41.0125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kao6Ds8hTpdf3ZOQrNRx7EVbRYTaUj8zjvTvl1DicdroYV5DyR4TkkgX4XHrYzcTC2n88jNVTR9hHSy9qEsdVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2879
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11069-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[nvidia.com,garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:email,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: D214C103C9E
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 10:21 PM GMT, John Hubbard wrote:
> On 2/6/26 9:12 AM, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>=20
>> The macro is a more powerful version of `static_assert!` for use inside
>> function contexts. This is powered by inline consts, so enable the featu=
re
>> for old compiler versions that does not have it stably.
>
> This is nice. A nit below about documentation.
>
>>=20
>> The `build_assert!` doc is refined to recommend it where possible.
>
> Another piece of the puzzle...see below to continue the treasure
> hunt.
>
>>=20
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
>> +/// where statements can appear; for example, you cannot use it as an i=
tem in the module.
>> +///
>> +/// [`static_assert!`] should be preferred where possible.
>
> Over what? There are 3 different assertion types. If it is actually
> possible to list a clear order of preference, then let's list all
> 3 in order, rather than having a scattering around of "A is=20
> better than B", "C is sometimes worse than A", and then the
> reader has to play treasure hunt to work it out. haha :)

I am trying to avoid listing all assertion macros in all assertions macros,
that's just going to be duplications.

How about remove `#[doc(hidden)]` on `mod build_assert` and enumerate all
assertions in the module documentation and give them rankings there?

Best,
Gary

