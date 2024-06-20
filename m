Return-Path: <linux-kbuild+bounces-2223-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EE590FC90
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 08:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B367A1F21292
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 06:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306C02033E;
	Thu, 20 Jun 2024 06:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="estt4j6W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9762737E;
	Thu, 20 Jun 2024 06:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718864015; cv=fail; b=dm/O1eNWogzspLi2MC7SBLdWlB2hhumwfFvWdkGX+VT7ldPMH2MHHAE1hL7PUHm6zyQoL3KSTF4aXpdRV2c3DFQGZ0KRYH/u+Jq5RNGrCYrjMImiUxAQrcmABy5Z46glr0pIx7RikhGYClGIZqte2gy5jG6LMDKhoYwzM+pUbSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718864015; c=relaxed/simple;
	bh=wTy5vlgG6r5MC1wWZH3MYE/GQUNQyq9cc2TomGRyMA4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Yqmz4tfKB06o6GL5LWsPWKw5dmsq0nL1zquCFH6eaLxZ9tCnVNnk50PKj3+3yxpBPCyt5gd6meFRV/O6P2FnIRjHXu8NW6i2RJG/jNV6agt5fFmLp3y4edXovdk5YYvRcr6VwU4fS8RQKqxk3a7HYdQxVtJ0Kcf1hQFSB/ZQ5+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=estt4j6W; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhJIoeafjP+mtH9wOMoTPwHUNoblY/xEScyWWJlpeWumNEhHEDDQr03yjreZc+55RAKhDLFagYsbhATRcAod6MN7iRiVuhIY1LhOrfYm8z+FHZO8kslb8T0kbwBdluTDg2aFRFQbXLX/4uz7wJPcVUvZbPLZKmIINeu0Qej5U7QpMgbqJpOhbTCNQNvmTE5X4rZukyHOee3KD8fxhl/6XuOL9mbs3DVVsS/ksxTdqQGpykjE3aoEXurEmDK2AOZWIPEIBHzDU7rrVLy60aAOrJWjtJXYuNC6zWZ8BQF7VvOMEeWFeXLxsuhxPQTBAG2m0Moubu5WCb+KaP/a6IZ4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwK4uZZoAxRSD/8kQhy48oSV/Br0mlutjayah58ax7A=;
 b=MjifyGJEdbdZh2BPP5k8TMrdKCLcIB6YCadF+ROoTJYAy1Aa59ESS+ODodyNm3018c+yEfSc+Q0xhAajZFVxJHDpPKVnQFyXe9PQT2q9m6Qe4yA13cWPJ8BtG6IWchRMpWITATmdSZWDr6JXcALorKUI49G/WnYZ5dx1XFAQhL6Iou/yhk9M+hJ9nDjUR7gwGTWfByIkVwfqNKlvePdFwVwUsc6lZXGQnE5ZoXhJtf4ubEI6TyHFqewrPksXnscFoSl5u9WOPBW4xKPaDePF/MASfDfcl1RbyaCgGNqPfUwXz/ZVHEQfBw5xXIevJEE+IL5KJcFhUdTBFWBJaYiNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwK4uZZoAxRSD/8kQhy48oSV/Br0mlutjayah58ax7A=;
 b=estt4j6WqLn+HplI4EuD60iVH1Aow65VU9jsHDaGP9XNt7TKGjhxxi5gTNgAAjQwyD6fPkYE5q+PCPe6HIS7Cj/uA55ZqAp1MQGsfMSLWbS8RV31jTX/Q2bxImdbWt9vWuJFhLn6B/VmlZhP7R2VZkYhh7WNDSbxj1D3AmckNR3uLnsQZ7o9rXSaLQxOI+aTiQIVmf0SUTvyyxphl57nIdUGa6I1bN8/8VWkEr8/vf/t5/vnfR0mvzuAdfb6TJ1Dy9XIideZv81lkL6xXNAWkb9t/Wr8Xu/CYpzAm3AH0cyEIFWYb3Anv4yXfC4lVeo806ozbKFtHBNRfcFvk1FREA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by SA1PR12MB6750.namprd12.prod.outlook.com (2603:10b6:806:257::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 06:13:30 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 06:13:29 +0000
Message-ID: <4262dee7-b6fb-449c-9de8-7d6404912338@nvidia.com>
Date: Wed, 19 Jun 2024 23:12:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: rust-analyzer target: better error handling and
 comments
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20240601004856.206682-1-jhubbard@nvidia.com>
 <CANiq72m46gN4GkfeXgykEar6OVa56ck9FmWQComd+iuf61FVSw@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72m46gN4GkfeXgykEar6OVa56ck9FmWQComd+iuf61FVSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0050.namprd17.prod.outlook.com
 (2603:10b6:a03:167::27) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|SA1PR12MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 205b3398-7d49-4365-87ae-08dc90f01aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|7416011|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVB4Uit1YWptc0gyNkJZODNsRnlsWUNRV0lOeDByUENCeXRNTmJqN05Ddy9o?=
 =?utf-8?B?aGJsM01OV1gybmZnUzhqWmVOQzdXQldFa0JXdWkxYm5GTm82WGJpdWVhaEpv?=
 =?utf-8?B?M1lUdW45NE93bkF1RjJnQ0NvVWVoU3JSWktNTEpnQ0lSZWp3eU5NQS81U1BC?=
 =?utf-8?B?d2JHYnpJaVlueTVjaUkvN2MyTWN6OEVXMXRubUphdjFiRWdxNVB4L0tGdmRz?=
 =?utf-8?B?YjZ2NnhJVnV5YUpXZzRtOTYxWlBKU2VFeGlRcFBOWUUzd3RuUE0wRExwb0Z5?=
 =?utf-8?B?Njltak9yZ3VLaDZaK0dqdWpYcExQY0Q4NVVQTmcvSGx4ZkNsVUpYL1hpMGpS?=
 =?utf-8?B?T3crb05wTThPcGNMcXpoZ1A5NnF2RkdpbjZHcnA0R2IrMC81WjZEOWJTSEMy?=
 =?utf-8?B?UFJ5VlZpMDEyRmlNNmk0bzZYb0ZxVlhoOFY2NTdoZWVtWlFCTmQxQVE5Nm9q?=
 =?utf-8?B?eEI3WVJ0MUI4UDdZUitpaXhqR3J1ZHhLYWpzWFFCb0ZiK0xlVjZPK0J1WHY5?=
 =?utf-8?B?WkphNERxci9PK2I3NXhKdVhHT20vR0V5OG9zWVhXTVpwaE1vSTg4d1dDdnpF?=
 =?utf-8?B?dXo4aERaYVFGL05yYjl1aGsvL2tXZXM5Uld5MmxUTnd2Q0x6MExKZ2R0ZWNK?=
 =?utf-8?B?Q25DTjBvcEUvMkxndm9PV1VjdTdqUHBHc0EyVWxJcHNFdlcrQ0IwN2lKbk1Z?=
 =?utf-8?B?eVJhYy94bWhtUElxWjU3b3k4QVVBZFI4dXFWVXBKWWFvN3BBSWo0TWQ3Zldl?=
 =?utf-8?B?cm5VR0NSeVFCY1VsZGFLZHpUTS9hbUtuZ05KM21WMU9CakhQclhrMUFUM1U4?=
 =?utf-8?B?bFRwb1ZlNFhjd2NlOEIrRHZwOVZQK095RXptL3RVK1BiV1plZHJDRUo1RGJr?=
 =?utf-8?B?aEpqa2pjczFSN3hSZ3RMbDRoTXV1cHVrTHYyUXkwbDIrMzRNREJ6N1NPODJV?=
 =?utf-8?B?R3BBOE4vS0hqTDYvNzB3d0ppZXpHM2RqTkJ0QXhrR1pvdU9mQ0FWcWR3L01j?=
 =?utf-8?B?UFdPeVQwMmtSR1pCTWZpalZsR25MVGU0MzZvNkZIODJsV25nUmxLcUVhc25h?=
 =?utf-8?B?NnFDSGNXWk4ycldFM0NaRkFnaUFQdFFWVjAvOGtETzBybDI3L1RJN3ZpV0Qy?=
 =?utf-8?B?aTRBd0dhK3ZVYms0VXIwMTVxUWFRMkl1d0pLN0F2bEdNZWRvQ094M1pib1RC?=
 =?utf-8?B?dVlka3U4VU5WV25YM1MwZXI5ZkExWXRNMm0zSzVJSkhseEJtdW9YM3RqUGti?=
 =?utf-8?B?cFFGa0VrVDRLUC9JY1FuMWhEWEw2RlBQVUtFOU93TTBJUHllNGlUTWcxTkJw?=
 =?utf-8?B?K1N2bzdqS1VLYXZmRTYxbWxMZTc3TUNDa0orMm16MzJwamtRTEdJNjBtRk1h?=
 =?utf-8?B?QzROWTBvKzBoZGMwWTdmQXI0cGtIODhDbm9kZXhSWEZpNVd5ZXV5RGRwZFY1?=
 =?utf-8?B?bmRnanl3S3F6NDRzYjc4Nk90V1NVU2hrRmNjd1JNVGJnbnNPbjdvbEU2MXU4?=
 =?utf-8?B?ZVAyQjF6MmtraC9RSlZjYnd3N0NsWEttYnNkaHhSaWpZWktCOWhua2Ztc0px?=
 =?utf-8?B?Ump6Qk15TEtFeUhlWk5MWEcrc0dETFFuK0Q3cHcyTUdMWFJ6NDVweFpDcFZN?=
 =?utf-8?B?T1NnV29xWThmU1RHd29hbXlYZ2l6RjNRc0hNNnpZYnd6dEZ0dTBhNnl1cEU4?=
 =?utf-8?B?UUpLMnlMcXlyRmdXT3lBc1FOWmQ4WXhXa2dxZ3FTdlVPaWY2c0ZCTUVKdkxO?=
 =?utf-8?Q?JbJGGLDhrjl0VyEgXLrlWG5athwinqs3496NQ91?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWg2czV4ZEhVcmp1ZGFySFVMQ1hYYlNCTlRjT0VxbVM2MzJxRHdkT3ZocnFi?=
 =?utf-8?B?MFY3Z2dLYW85K2FCOEwxZDhaQUpjNEUyTkVqeHBVbFpXUWcyNXpMTVdXYmdn?=
 =?utf-8?B?ZGtjOVU3QXJtMGlDaVIzVmVHaGhvRk5hL3BDeStVVFhEZHBhNzdJQis4c0lz?=
 =?utf-8?B?aWNGdUhQdlV6cExOS2NYMjNnSFVZV3NzTUpjR2R2eGZhbTlxcDVRaEFCSHhm?=
 =?utf-8?B?K09Kck5nTmNZK3ZIazhseFBMdXk2NVBNTGJKcEF3TWhneiswM0RDMnpVSDFv?=
 =?utf-8?B?Nnl5SFp1YTdvQlJuaElYRUR4TXdmY0hhRDdXRlpNTndCU1kyWnZNM3VicHRV?=
 =?utf-8?B?dXZxK2Zya3JBdkVNMWt4WWRKMzArUEJIYlViOW1lckowcXVJMDJqdHhCaDNm?=
 =?utf-8?B?eklBZlEwT2FRR1lyb0Yya0duSHV4Q1RDbndDbnRCQnBmWGpTRWxCbTk3MWFR?=
 =?utf-8?B?a095RUVTelBhdVVhcFZGSk4wYXB0R2x1MG9XMUpSdzFUNDNTNWwwRUQrWFlD?=
 =?utf-8?B?OUFWYUhwbmJ6MjIvVHVrcnV5OCtYeWg0UVJNd3VJcU5zYW5LcEZOVHlia0F6?=
 =?utf-8?B?ajE4VG1WSE90ZWZXaWkwcUNabDdzdmYzckk0ZUJJSVNPTEhlSHVHME8zeWtq?=
 =?utf-8?B?bEJoQ3JjY3lERXlDNjFkV0FNRElGWGttL1hlaEZTZzlPRFMvNys0Q2FITnFB?=
 =?utf-8?B?Rk0vRzdsNkI3cTFjVVFhOWE3clM0ZGpVTnVQaVJyd1M2Q1FZbDZLUGJETHI3?=
 =?utf-8?B?cFRjbTd5My92TTVOSXFyQ2xrLzBab2QreG9ucS9JRXROSDNsVkJOekgvZ0hM?=
 =?utf-8?B?b0EzNjkzT3AzYy9hRGpKMFJKd1hhV0FRT3UvRWNzNXIzNTV5U3RLNWk0K3Mw?=
 =?utf-8?B?dzFIdjJPQmVFVW5pbUxzM0xSZ2tzM0RIU1VTeXZSYmVEZ0Q1UnVncWNDd0JN?=
 =?utf-8?B?WGFscHl2QzZIYW9JTDZhcVphYUo1VENmNXRJemhTUW81MGxXWXN6aktUdDNT?=
 =?utf-8?B?cTRaOWRQL0tHZHlUZHUrZUROaUgxUEU4eGxDbXRBamtCTmRJNUQybDZsNm5T?=
 =?utf-8?B?a3U5N0JtNHRhK0VVS1B0WW5ObFJSbGVhdGNldTNmcEJOa2VFOWo1dGRJRlBm?=
 =?utf-8?B?U3ZDVnk4dWIxM2Q5aWx1bDQvV04xaHc1ME11ZkRqRXJqeFBWdHE4ZGdBa2Z3?=
 =?utf-8?B?Mnpxb2p6VTJqbllMY0lVRmR0bTh1bmppTGpLTEx4LzRaQXo3Z0N6bXA1d1VQ?=
 =?utf-8?B?NkZuOVBGTHFBNUJ5VGdQd3NzTkdrQlByaHRYbEQrT0JGZUZJZlpjZ3l3WWVV?=
 =?utf-8?B?bnk1eGJiSjU0eFdMUXlSb3NIQmtSQklEd1JYUmdJWEVxZ1NlSER0cE56b0pj?=
 =?utf-8?B?dzQyQXVwSkhOeTgwYVd1amtxRE9EYTFjSExYc3RDdDBvMjNNY0hsUTVHNjZa?=
 =?utf-8?B?eFU0Vi91L1VQelYraGg2OFZOSllJM1dIZVQ0TU9MM3JHTFB3UFhjWmp6TWRQ?=
 =?utf-8?B?cVRxaTN3alZURU14NFMvbWcyOGtaYkpRS3RJMzU5K1puZTVDelJJS1FjQlgz?=
 =?utf-8?B?NWRyZTZBOXcrVW1MdW9nUHl0QTgvbFBkeldxUm55Mlg0bVcza1p3UXJ3REFu?=
 =?utf-8?B?WE5yOVRNZHdMam9idVFKTzlzVC9vZzh3aGtPVU5wWWZOUHR3S3ZLdEE1S0Zu?=
 =?utf-8?B?WmJTTi9xSXF6SUVQVEl2K00xazdiRERZeWU5eEVESnd3WkQ4M0RpbWdVQ2hp?=
 =?utf-8?B?MVh5Z3dJWDBqUGN5RFEwKzlsb1phNS9IQTJqNDhNVWZtVVgrKzFDOUo5QUdK?=
 =?utf-8?B?R3lPMEFZNEs1ZVFKbndEalQvSzVmTkQrTDRkS0x0Y1N1cCtGY2pNMDUzdnRz?=
 =?utf-8?B?a1BOLzFmdDE0K2VMaDVqNkZoVWdGbUQ0SjVkSm5pdnhuNVNEMWlLdUZTcUU0?=
 =?utf-8?B?ZFpnRFVBaExiTEpOV2o2SldGekRKQWU3QmZlLy9kK0FBRlM1OTBFRzZsb0py?=
 =?utf-8?B?SDFFcWlkNTEySlZHUE9jMmZMMXYvU3JGOXFScVpRTWhteklXYUxWWCtZOGJQ?=
 =?utf-8?B?aTJBMlNnWTRCSU5WS3N3OXBLZWowak93QTdtVWdJdUtZMUd6WFM1WS9CUWJs?=
 =?utf-8?B?L2tXanhkNnpHOUVkRDN0c3pOa2l2SDl5TTFLLy9HdVdXR2I4RjE4Wmx3aFV5?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205b3398-7d49-4365-87ae-08dc90f01aea
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 06:13:29.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iD7M5T9KQr8D/CqIFbV7POn92nu56/pt591GTY8xB6/5nsTOqlM3YMcOJeGQRWqw5Yx6exvW0DPLCb6KK3WJlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6750

On 6/19/24 5:25 AM, Miguel Ojeda wrote:
> On Sat, Jun 1, 2024 at 2:49 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>>      Rust is not available
> 
> Maybe we should use the `***` notation that is used elsewhere?

What exactly did you have in mind for how that should look? The
"make rustavailable" target has some leading *** and some bare
statements, so I'm not quite sure exactly how to lay it out:

$ make rustavailable
***
*** Rust bindings generator 'bindgen' is too new. This may or may not work.
***   Your version:     0.69.4
***   Expected version: 0.65.1
***
***
*** Please see Documentation/rust/quick-start.rst for details
*** on how to set up the Rust support.
***
Rust is available!



> 
>> 2) As long as I'm there, also add some documentation about what
>> rust-analyzer provides.
> 
> Perhaps this could go in a separate patch.

Sure, I'll split it out if you all prefer.

> 
> But those are nits -- if Masahiro is OK with this approach:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Happy to take it too.
> 
> Cheers,
> Miguel

thanks,
-- 
John Hubbard
NVIDIA


