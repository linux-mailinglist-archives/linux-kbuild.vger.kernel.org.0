Return-Path: <linux-kbuild+bounces-12971-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH3wNLiC9GkCCAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12971-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 12:38:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9FE4ABB07
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 12:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6558F301877A
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2026 10:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7D9387588;
	Fri,  1 May 2026 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l/5bbYhu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9C157A5A;
	Fri,  1 May 2026 10:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631924; cv=fail; b=bRmpqitL9m8I2L/ozvOkJ6xg6OVceqIqrjmWxcdjnwNShZ26LwovjjqsN2OGxt1buxG1aD6y/vgfpvW35uHvskRzTH2saAE2lc2GFz6XBVkOsiGd2WstTnTb71UiWYpC2SkYJoacGRollgn9aa/O3sDbLi4/xsDRlXpZXGukKFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631924; c=relaxed/simple;
	bh=2m54jfYI153uBAfnUYmXIBUZHWqP4V4bF7I1xBkJLZI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JLPo0a8Atwz/oSgpTMWQHk6lJGjOwujMkunPrEcBCwj6KSJHcHYLgXu7hllxYgOl1Nr+5wYveZbYkMpmg858Z41VzfOmwhSxhuEWvKBLGB5ujzNtn7a24GFCZUJhe17UGYSTzGnC3vgIA0gbO2FCpGAczGkgYaFioCPCT+NoepA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l/5bbYhu; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2J6fIl17BdP05lW57Q/4XPU8X+QFgpL9cQ0KW4tS89vEy4+CYomUu+j4iOqqOMvQ2a/zZKScPMR1S540pczIOer/GpWGkTWGLFA7PcgllYXHnXLhInZwHK+mGYq+nAt/KT2tYYvUbXXWi0LVMbEiNl0PxSMDP94o7kYJLH1TbOLD81SRujrpUEXzhjZdsVSfz6mvKf41aUVN4T3yS2RD3D55XgjeFPllIh7RBVjQv/37zlTY0oSO7wLeE52dWJScURigunprkI2H/T37KU/gfOKDtpU4mR6sLA7MS4i4nmgHuBEfwENReN09NbhcBum3hjdNYz1u5y+I4X6u+W0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEJb9QBg4NMLvRezfv7huaac5i/2dEver/tJ8xFaJ78=;
 b=F0Za7YBvkR8WxqdHqXqAGBgbEplSPj+yHmiATuV7h8Tlwg1UXektGC1cBZm2D5XPfoCxA9Ke202a16Aj1b6gZ9XPcdZe0tjA9wGriyPltQHMHkv0r7+H6OXwpGhuhsgFAvMRsLuRaxnIF5Xl1dB4NrR46MEOWcSt4ey7Dl7bZ3RYpYhVZi6NGi07Hq78jFEDp9RmHTJ7IcdE5k2frdsTAAKf5VqrkLvPdW0wKhfa/X4GRNn69lerPN55MqYoWvFD/tX8rC1W0J1isvXBgE0KHC2IZRb6guy/O/yxaccAE9UWLFPvrXYa8qwGSNNsapdxTaAMFp4+aaOGz2Q/AWKD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEJb9QBg4NMLvRezfv7huaac5i/2dEver/tJ8xFaJ78=;
 b=l/5bbYhuHNM79SBBZ1BmlAPLH56DQYUkLecvqbmuiwQjQ28dmQ7mq1CswKBCG24PAO9XkeaCjg/kTwXbaEVME1anKnLlfOL9unQaG59EKbz51msz1Ckxo7vjwoFpAUKszMzB/mU/JBBOSO5rhNAWLUbKF1W7e8vJzcfbEPHa+mx5dguzShAIFSy7b6OHTBMkUfn5sTVPdRl9gGpDP6TPXYvsQUOg21JxQMxWt7vvOJAicY6Ufv/+n6zY8gikpfthB0tv5VhTGwk/5palFS8texrCZ1KSXogr62VOtI3n/DKQIcScCBRxYLuIPWASCO43+xQdcJ/Pbts86d8cnrrpZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by SA1PR12MB7246.namprd12.prod.outlook.com (2603:10b6:806:2bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 10:38:35 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9870.020; Fri, 1 May 2026
 10:38:34 +0000
Message-ID: <8ba399db-791f-43b0-9895-56eb414cc7e9@nvidia.com>
Date: Fri, 1 May 2026 12:38:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] gpu: nova-core: rename module from nova_core to
 nova-core
To: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-3-7ca31664e983@nvidia.com>
 <e0301888-940a-49a4-8a3a-47960162819f@nvidia.com>
 <DI70PV5V3W38.ZVD5ZE6027SD@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DI70PV5V3W38.ZVD5ZE6027SD@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::13) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|SA1PR12MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fae9c60-be36-4c81-a5c0-08dea76dcbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9TlbNxGzQllrUhtVMLCT3cl3Xh5WTdayoduSmrex0n9yk1pSnkStLR5BaCIov43BtTP//tGECIgc6UP9zgY2bAzhLs4ObP/z/WrjxqpZhouepsSbM7unJEWF/4h8jd68p0Wq/HBqqdR9ew6lDMbzMUMu2oDz/f7BbF8+u87exkhJhYmBoiWlDrjDHOVvdrWIPCc4IJqf5j0xo9vgCf0OSG5QRsT9393sPGD5gsh373EX8ekjsF8QjnvpWb8pajBmmiwMPwi3HGY4gRXGi+L4PydPy0RmylcdD1ggt7L4kt3MBjrt1Q56l6cTcnzGoGFvdtt+esQbn+eoIjXxQQnw4lbXkGYyd0ad8C489VqOcdAM6T/Sd4oHeFnPYJDNPfZ3b5AfGBR8evCUO2NbHIhKoVIV/LtATi2Jam2xDxJi00u4QmcYjRVxJxZr0sJNwWkNO4hiCbrYt25YvCD4lrhs4WWW+J8NR9S6FK+rqy2vx1FOlfJ3rzctqGNSat6F2wOzKYv4ZOSr3+XXCMyoW3QAMDSQdNnTq+5wW+YDypavvm5+gIEvbB1wlHuBsZ4PO7au3zeuboQLNQPFR+I+qu3MY9RQUtNw5v+H4HuTfR+oVKnbi/BjvWhIaX5AS//iYtNht96TmYC6inNxwgOvyXEKs82SJXMjnLzDLkl4VKZI2vkZ6nJZoIHgBjYbJJ3H0xoC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NisveWxJMkNEVUVUNFgrN0xTdXk3VUNzY0dnRy9rS2V1U1RjQUEyRzZESmxK?=
 =?utf-8?B?SXdkdnhOTSt3cExLVmk4VXJNTFlkVWpaazNyRTc3NWNidDBwQWxLYVBXRjM5?=
 =?utf-8?B?K2cxelpWMWVWY1FwOEhZajRjd3lvNjZkNHl0ZVpNNVJ1WFBnZG5wdTFEdzFX?=
 =?utf-8?B?YWh4a3hnYXBPZ2Q2VkZLTWlCVEpPVlNJQlJtSlBzaFVXbTgwVzlWb1NwWTdi?=
 =?utf-8?B?NDIveVFoYy9NclFweldwTER5WHRXaXM4YVQ1K0J3ODN2c3czZlJKcmtkQlpv?=
 =?utf-8?B?WWNLVGd1SVVvOER2V3ZFYXNKR2p2RVRQb1ZLV3M1VzZFWmMydy9zU3Z1Vmgy?=
 =?utf-8?B?d1Y1L3N4UXlKVlp2Y0FyVUs5NFNuVHhobExxWjlnVWt0YUhuYjFQb1E4dC9t?=
 =?utf-8?B?NjVCQTFsWjZwYjd1YmNNNlRkL3JrdzdnUWdrdmFETnpCUHB6WHBWa2VndTZl?=
 =?utf-8?B?dnh3dVVhSkFIU1lBb2pIWE9LUXM0S1pTR0szQkFEci83bmlad1JaSlJCTGJw?=
 =?utf-8?B?ZHlFTHZpVEpocHYvZFl3WEMzNGc3Rko0YkRrSVNMTHpnN3pyNWZrRDh5M0hZ?=
 =?utf-8?B?aFhTY2p3TU1rRW1UUzFqdWNsSEQ2MGt0YWs4bGRacDBzY21XV3llYk83RnVr?=
 =?utf-8?B?OHljTmsveG1mNlRzb3I5T3JYejM3Yy9WVVJ1MHRmR2ozOEphRENBS1RjNTR2?=
 =?utf-8?B?MG52QlU0RG0xMUk4UUVDUDh2TmFZVDQ1dll6bnZNaDBLNEo2TE01V1drekg1?=
 =?utf-8?B?N0pwQ2lzMkpuUnkrMjk2emFtK2JZcHNBWG5CbG1SL0pJSjI4cSt3RGlPMjdW?=
 =?utf-8?B?NDlrV2xpZ2VBR2UwRlBnQjZXeFNZTU9WVWpuT29GZHhrMHdlZDY5TXNZWWM4?=
 =?utf-8?B?QnNWWCtSblBaUUVWVS8vRlRSRnFPd3lqblVKK01qK3J2RUlrRlF6WnFNenJn?=
 =?utf-8?B?RkloS1l4SGZ2d0pTWCt2OWZncnlMWlB6SlI4bkYzUG5iK3U5dDlVZWFlT0Nn?=
 =?utf-8?B?NkZoS2NKQW5HNUF3Q1Y4NWdzdkR0SUZDajF2b3Q1a2xiNkwveU0xNFEwQVV3?=
 =?utf-8?B?aEVueXB6bHR2d0RkdjRVWFFNZzduQmR0WTE0TEZqNitjNUlsd1lLTFp6SFph?=
 =?utf-8?B?ZTM3MTdjNXdFZndTdzFwL2NZRnYrS3dBclB3WURqK2FSQ3h5MW95dmUyRlIv?=
 =?utf-8?B?YlQxTksyZXhkWDBMMjFaVDdGai9jdUU0UmpzbW1vbjZZZk4zd0g5UVgxR25l?=
 =?utf-8?B?bS81amlvM1JKYm9pR3pKVUlNK0tCcFkzWXVkZ0E0M0E1R2Y2WThhaW9yTzdX?=
 =?utf-8?B?S0NBN281TnNGV2Rkd2ZrRHVCaVNpNWtvSE9lTW56cG5mSEdGMURoUGpLazVo?=
 =?utf-8?B?VWdMUGQxWkVVbERvMzVNdGpCUjR2bW9jQzYrQzRCaHlIamdrTGQrM0pyOER6?=
 =?utf-8?B?SkVNamorMldORzFXeG9MWC9WWjNYUVZKS2dzOEJzZ1NPT0FJZElVaTRpcUZ0?=
 =?utf-8?B?UEpuK2liYW5LamtwY3dkQjdBazNUWXZiaW5oSTF6anhHdHpkdXhqNDlPMnhX?=
 =?utf-8?B?Q0E4bmlOcG1oemlBUUo5NXRPdi9pZ0pHMlN0QXFTQUV1Q0gwa2ZaR3ZJMmpG?=
 =?utf-8?B?bHh3RDFDMUpoemg0NnFKL2M4SzdicDh4RGRoeVlOVFhkbkZITnZvcE8yaDhy?=
 =?utf-8?B?TEhZMEVucXJHaVE3N1V6N1ljd2FFeUoxamtGL0VsZTM1L25mUjJXZWx3NTk3?=
 =?utf-8?B?MHNHbEUxSGlMZHFFTUYzTmpOdG9xcVVYYmpkOEdldXN5QnpoTlFjRHFMaTMz?=
 =?utf-8?B?U1k0anlmcFZzWHdtNXVaMElvMFNRV2txT2t3c29yWWpPQW1ueW9GV0pCTjlM?=
 =?utf-8?B?akM4d3dlLzB6c0s2TlgzN2hDc05ud1d1UTRYVnFZM1BpQklJemZvWjZJTHBO?=
 =?utf-8?B?SGVJN3BsQitaWVRQUFhLbE1tUmdZV1JzZFBjNEFkNFhMT3Vld1IyMm4yS1FV?=
 =?utf-8?B?NE9NaG9uL0VJQU40T3BTUTBMak9yQXlnLytCV1pkdEVSclZ2aFhEdVlRODJV?=
 =?utf-8?B?bWVqbHdySERoNzdpSXpJR1IvVDBYZ05pK3UxWmc1N29xOU1vQkdvcHFYcGth?=
 =?utf-8?B?S0w2Nm41U1JIT0JJd1QzV29GSFpFL0l5Y3FBcWh1NWJwdzRtUUowV2hBTDE0?=
 =?utf-8?B?RGdCL09CaGxFT0h4dWFEK0FqSXJUVS83S216WGY0Ui9ydUNhOHhPUStvRFZG?=
 =?utf-8?B?b0RVcllRRVlnRTJSUzJHUDlXeCsrNFRaTUNnT28zWEg0V2FZWCtDVWM2emNk?=
 =?utf-8?B?WWhUZTk5Q21pSUorRldPZ1NuZE5wWDJYYndaRjZLT29BaUtaV3hUUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fae9c60-be36-4c81-a5c0-08dea76dcbcf
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 10:38:34.7599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47t2Rkk4PZJjdb1LeZfHNMon/x48lupjqGn8gf7WNiLNjaU1zGIeEv1mVSH3aqVhvbJ89BJJkd/daSu4Vy7V7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7246
X-Rspamd-Queue-Id: 6C9FE4ABB07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-12971-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 5/1/26 5:25 AM, Alexandre Courbot wrote:
> On Fri May 1, 2026 at 12:07 AM JST, Joel Fernandes wrote:
>> On 4/30/2026 10:55 AM, Alexandre Courbot wrote:
...
>> Lets make this: `nova-core-y := nova-core-mod.o`?
> 
> We would have to rename `nova_core.rs` to `nova_core_mod.rs` though.
> 
> But your argument has a point generally speaking - if there wasn't
> any underscore in the module's name, then we would have to pick a
> different name anyway.
> 
> Another option would be to use the Rust-idiomatic `lib.rs`. That's what
> the kernel crate and others do.

"lib" (or something like that) is better, because we will want to avoid 
"mod" in the name. There is plenty of "mod" naming floating around
already, due to how kbuild names its artifacts, so adding more "mod"
will not increase our happiness. :)

$ ls -a | grep mod | grep nova
nova_core.mod
nova_core.mod.c
.nova_core.mod.cmd
nova_core.mod.o
.nova_core.mod.o.cmd

thanks,
-- 
John Hubbard

