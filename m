Return-Path: <linux-kbuild+bounces-13355-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFFpMs3bFmofuAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13355-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:55:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 813FD5E3BB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55FD8300B9B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 11:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B1D405877;
	Wed, 27 May 2026 11:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ez08rZP9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D51403150;
	Wed, 27 May 2026 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882781; cv=fail; b=r+VZo5B88MOp18T/C1jUEgpTpT58TsW+TlnWHuZeg9w+FRlr4BRpb1KBXq1uB0g+o6uvfqgyUX5x4HrQ2MiMBNqhurWnt8Y8JdowYotutTK/afHutCtBP1HnsMYnIDpVcu7BGnIEctmfVA/6RBmwir66JlPbwGeB7OYhGW4zztg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882781; c=relaxed/simple;
	bh=9bTL7TE5BShLw5YFA0rwfrxVUg5tykv2UiLShcpcF+U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tHT142KCpHqc3SQai1AShcTxEiQgvsWG04n0hxjOjRimLfwZM7MUeF6qPcfHNvelr9DANcfFJTltyy5+QF4PJLjuJus0cNvF2UXXndy553YejvxREhUk1PhVkmnmM88abr2osS5E3c4ttgN3NF53RmXQL+DKQB1J4cjrFBRJGbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ez08rZP9; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wM5Sca73uEkPSeIgUX/6wzKIRG5WwyKV3m4BNGSxiAUOHPpa5aqS+DL28Ni0FXF5VCXgzxiYjq3ckY8PJfRMe2LY+lTsn6gcVyBiIytHsrDcSPYbmWhqeVE+9EhoiC9vnqxPqRGUUpuzjYAqxK7v8Pp4JPNwbyN1yVZZYnyaxdaZ8uqYWYf2XXh7lk1JMsIjaXKX/7xgHPVqHSpf1G/9S0S/wYICZ0GAf0SXKxa5hUtCw0E4XYYM86UMUJmMgVOKfxpGFmruMUVBmwOo4C1LcpcxNfI5Hh73NVqueq888r57oQMe3JS/vVucUJzh4iqIk1aR/tQ2QyzUoqmRVz7aNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aY1zNp8/qtaVZSIz1acsvdNw6cmp12DF2znjTV866m0=;
 b=UW880dmQ9GkCBiS3V31lcp1tZ0c12SegS1QJYwfhWG/w+Yre7fN8OcphXpQSMrvr8lsu+pLsuAgnE0/59lDuG9rTxA7Dpb+lt5qQq0V7r3K56RrSI2R0sibokI8pzgJuViuSgaBiKJ0MvvbyPh1njb5jLCuMlyz5n0xNlE6Q3mx54XGntJFss/ta0v06z+hUy5Yd7NjopWFBP1IPY+lJLbD7uDgQVJ3FhF9PDP3f/q+iw8QUnBNa+C0nuNLTJ7M+QmFE7kJBTNPJb8oLNC5EeCZbPtvB6984+RqiGZ84nCl3HgDPvRQcI9meIdmXXO+6whpe4KGOAFDWDq8sla3mIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY1zNp8/qtaVZSIz1acsvdNw6cmp12DF2znjTV866m0=;
 b=ez08rZP9l/oAqsUXiILkHDWQqEYf6FKPKpvMemuzJQP5qQfGwANmJj9Qq+2/uW11Trdnfx0Fyvll/rsS3zru4g77FbfeMIFnlH81oqHvMMEvgJlZuzZeitWgdCngMvI4he42K1yJC16RvighSiyrVdPz527OV5GR5r6GROTfV/kNPiWr/rzi55R+vcl0YSRzNAwhzPf+Xu2NBGEl+7e6ohhnop9XzjJ60C1/iDXsJisZjGRjLWDmZ7uX4PMq/0dueRxtxj50ETqpuQ08v4abHBp8ijBeG3+gL5nB86OKOcpQD6HboIdyIbdz6Sia4cPff07vb48FgVeb4zwCTiu0Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 11:52:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 11:52:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 20:52:22 +0900
Subject: [PATCH v2 6/7] gpu: drm: nova: build after nova-core metadata
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-nova-exports-v2-6-06de4c556d55@nvidia.com>
References: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
In-Reply-To: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 6760b0b4-3e68-4dfc-9409-08debbe67ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|22082099003|921020|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	d8tiX25yFKKKMjbJaQAotCsc2CemVPYAdZ7kMI96cwTbFhQYh+dED6JFBlE+Li0ncytk2+RsXQoy9nSus5pONgxsAiBPovGmU+WMn3+dhHL7L76ayF+XirFaIWRWCJ7dK6YMiweCj8+nG14ZEUUld0G2uqiQQKOA/qSm1IqTbmxAxkqHlZFqhDYuNTyREk6pHfbuLwag9Y3z0pQotYc6sE/sx5iFxTsVITHShqYTmGe/wSqYFWO3HZOTuUiVm3XuTvbGtOsf+b6eVsgHu/dpevuE75WlKWisGK695I0qDisAAlLW8e6hf2+BmJ0Py2XrTe2K9GJ1xWEYdaPuSDJJU444vSR7avWGCDfJ5H5Q8fQqww9gLmBnXqX6fHrVOiyB3Q5DwC7kg6iWlzrUyhK6qROU5JKx52YkRAqa81Hpe+36UvWUihJoRWuEQP6/tgd+IsX4kf6Euk92Ra4MCnu5GmS0I1tZE3jxL8CRi/JICl1vNhrHY2yFVTRzoK3UvRB/ldxmofE+4knHCmi0SsbXPu/ApRSwCgJuiRPtSX4Pq71A8BljYV94ePqOg2R1Y7CnP70GytynDh3soDhpSEqPwsF4HMB0MLki1keYiGZDid6YjMPPSOUmWLwjMarE/uL1MeCBUlJ4m0p1Rkb7sU6uupyf+bNHr6cutWXfxD1GJiiWT5MCEizdD+w4FY4obH8lBT6H8NJByPuLnXc8k23kLXjdAFzUvNgczuTcP4Gois4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(921020)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUgzZDRhaFVGdFhxcTU0SHAzU1Y3THZzUFIyb0V1OGg1Y3FLVXZvQitmVjNk?=
 =?utf-8?B?MVAxemRvNFVaUFc0M2Q1STAzU1BrZ3Q2ajdGQlBvTUVlZVZwR3VYUUhJbVda?=
 =?utf-8?B?TFNISkdnalBhOEFteitQdWFOdit1ZDlRaDh0bVV2Smg3T0xjbTZjMG55SEdY?=
 =?utf-8?B?dGFzRWxxZVd0cHl4Nkt4L0kyeVpIa0pLb0NueHFXNFJPRUFuSm16VVpYN09v?=
 =?utf-8?B?c01FWEJIUlo4RHc5bE1ER0dvRU5wMjQ5MS96MlRUWkZqa3R2NnN0NVdvUEpL?=
 =?utf-8?B?K0VFQXAzSUdMcmVhLzZodGlEL1cvRXJGcmFPR2Z1RTZla09PMWx4THZXSnRw?=
 =?utf-8?B?SVZ2djZEek9Ka0lmaVBwSERWblJqRnVPU0dGRlo4UE0wRWl6UmtEM1c3bncz?=
 =?utf-8?B?cTRnSC8yVGFROHdReWdkWCtHN1ZFWU0waDFRK29pUFQ5QkhWd3E0bEVVMEpV?=
 =?utf-8?B?MW83dkhpKy9nZ1FzN2gzS3JXcVRPQW9KQTJLVndqWW84K1NoUEZzM1gzS2xI?=
 =?utf-8?B?NTFKT1hQakthUXdpYUhQaVkrNG5PY2pqeDVyaVhvRGV4Q0MwMzVKc1BwbTBW?=
 =?utf-8?B?TjJCM3VKcHB5c1pnMjRQVlZDV0ZPeXc5bk8xb3d5RWlEOVdlRFczYUNjVm5C?=
 =?utf-8?B?ZHd0ekhlT0pkaVo5ZVhRSXlKeXVYaW92ZjFKcTc4YmhwbldnL0pyaGR4c0M0?=
 =?utf-8?B?VnpNQWZ4NmNNQVltTHNyYmY0S2M1N1NoMTVVMnVIT1ZHMmlTbzZLZHRpTmdX?=
 =?utf-8?B?SjNMWnNUOFgwSjAwQnFvQm1rNVRpRnpSakRtQ3M4Zy9FUmxSazhPNHJxYlV1?=
 =?utf-8?B?Mnl6d1NoamJqYXA2MHlpcTRRaWZiNWtUYkZ1SlZxM3pyN2oyZjJ2YjJYWDJJ?=
 =?utf-8?B?RlJoNWFVOVpzWFIyNXhnMExBZVdpd0QzQUNUMCsrV08rd0NSaGRDSmpoTWNX?=
 =?utf-8?B?bCtoWmJKbU1ZSmpCYUZNeVhNVG52cTZRUDNNSWRXbVU4WVl6d1B4SFUyekt5?=
 =?utf-8?B?M1RPOHU5NGdNNWoyeUVMZVpHNmdUYXNRUWVkUnhFTmgzais2K2RwSUxuV1VQ?=
 =?utf-8?B?aWtwZ0hJb3dvR3NCNlhybmdzTEkra0UyWGJHL2lhOHJYVmZ2c09TZVF4aDNL?=
 =?utf-8?B?dDV6TkZyT3JpaDRkc3Q3cmpiRDVla2FyMDI5S3cwYWxJZmUzOFg3TWJEMVNs?=
 =?utf-8?B?ZldvcDZPZGFhYVBabUtQYk85WS9TM2hTYXJhbS9NeFhlQnZDNTNCamwreTJY?=
 =?utf-8?B?WXpCVkNGM21MbWVQTkZBWnpvUThzY2hWSEd2Q2ZIOE9UWU0wc2QvNFJFZzZn?=
 =?utf-8?B?bFVMa3dQcmI2Qm1lL2VURFRPc0YyclpPbmJCbVcxQXhVVEYrUlNScWtOWkQ1?=
 =?utf-8?B?bk5NYUFyd1VUY25BU2NPUTd4M3FDZjNzR2ZpbTlPOCtneXFXdkpua3doQm9h?=
 =?utf-8?B?eUFuamVML2N5N2JVcXI5ckJScWd5TDZXQlFXUWdMYm41UzhoOTdtWFZFWHJv?=
 =?utf-8?B?RzF5Q2thV3lOQk1RT1I0c0NZY3Q0MVJMcUlYUFIwcnQyZThhWjh1SnBScEZi?=
 =?utf-8?B?Qm8xcStIdHl4aTkvU25DTFVnWDlKVGxJWnliVzBXVGdUTDI2VVRuVzVOdEdK?=
 =?utf-8?B?Tk1YT1JoZURHQ082WDJBczBnV3NWc3ByclA2UTVpMjVMbE1yM1dCWk00TnNy?=
 =?utf-8?B?NDBNd3k1WHhuRXJPRlErYWJ0QmhUM0hWUkNlQ0ZJNnlIZlpFN1N6ODY1bHpL?=
 =?utf-8?B?c053SHNsendWWkhmaUpNc25UMDJPUzVOT3lVaG5vYmM5QWtTWXkxRXNYTzlP?=
 =?utf-8?B?b0kzVUthTXhEYUMwVVNFcWs3U09pS09LY3FPd1NuNUJPS0FJVWF5Zkcza3I5?=
 =?utf-8?B?NEFBejFBcWZrcUN2WXdnRVNpQXdrK21kSHYrV1I1cm5KS3RSYXBacVN1ZWJL?=
 =?utf-8?B?WHhXNlhBM3dqZmxxd05YSjZ3RUttd1pId3JEeUVKYmkvS3BNS2lCc2JGMXBx?=
 =?utf-8?B?WjlGeEJsYW1JNGVYUzZoNEhYb2daUWpta3lnZFhOZHFsWEZ4dWJjL0lhQ3gz?=
 =?utf-8?B?WmgvcEMwd2NhdkZPUHZINERGR0E1ZWFUVlNPK2NLakdUZWxrK2U0UXhwY2Vr?=
 =?utf-8?B?ZU1PT1lQQk5qY011V3ZIYmg2TGIxQ3AvYXlQUU1lbXVGRlROa002bk54L2d6?=
 =?utf-8?B?NnVIU3RONjVFeEdBcjBvb2NzK29ON0RDYzNzU2QzWWNQQnpjSGNwUjNCeXh1?=
 =?utf-8?B?VUtneFNzc1Zva21rNlB2THJra1RTTkNpY2xxcks0MnQybXh5U1lsV3RBVEMx?=
 =?utf-8?B?cWp1Vm5Cd3BlNCtvVFJ6OG9SZVFyRjlGbm1PSWhoZldxaDZJQ3lBelZuWTNm?=
 =?utf-8?Q?C8FTBcp0jLSRwqwbRlRevR0qseqw1qe5ut2t5WTZl8N6H?=
X-MS-Exchange-AntiSpam-MessageData-1: ctrQCp3smYxcgQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6760b0b4-3e68-4dfc-9409-08debbe67ba2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:52:52.5457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARQDKLGvXqxneo3QjtUS6cgSFPAd6TIw+adKIDUNiJXODba4TABLuWtFULVh6O2tmh8HpC5T0bllEcIyx95rHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13355-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 813FD5E3BB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point rustc to `nova-core`'s `.rmeta` file so `nova-drm` can use
`nova_core`'s types and functions at compile time.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nova/Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefile
index f8527b2b7b4a..6ed4ccbfbcdc 100644
--- a/drivers/gpu/drm/nova/Makefile
+++ b/drivers/gpu/drm/nova/Makefile
@@ -2,3 +2,18 @@
 
 obj-$(CONFIG_DRM_NOVA) += nova-drm.o
 nova-drm-y := nova.o
+
+nova_core_rmeta := drivers/gpu/nova-core/libnova_core.rmeta
+
+rustflags-y += --extern nova_core=$(objtree)/$(nova_core_rmeta)
+
+# `nova-drm` imports `nova-core` at compile time, so request `nova-core`'s
+# explicit metadata target before compiling nova.o.
+$(obj)/nova.o: | $(objtree)/$(nova_core_rmeta)
+
+# Build `nova-core`'s metadata by invoking make.
+#
+# This is ugly but only temporary until the build system natively supports
+# cross-crate dependencies.
+$(objtree)/$(nova_core_rmeta): FORCE
+	$(Q)$(MAKE) $(build)=drivers/gpu/nova-core $(nova_core_rmeta)

-- 
2.54.0


