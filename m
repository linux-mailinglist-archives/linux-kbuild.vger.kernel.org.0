Return-Path: <linux-kbuild+bounces-13852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dL+CDhQ6OWqVowcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13852-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:35:16 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 844916AFE7D
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:35:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=FTbK0r1r;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13852-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13852-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2BA6304B11D
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 13:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B4D3B47C4;
	Mon, 22 Jun 2026 13:31:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B43B7772;
	Mon, 22 Jun 2026 13:31:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135080; cv=fail; b=qt21tCvNPgbm2VYddslDPER33q9FeBi6xLXxHG+BD1rgaSYfn3iyVCVcCRoge2Yx0cMaYU1hRq2z3hUIzl1EQkWbqlDiupocBn1o+dMniYZaWMXbOT7vVAYtF84FXrBwZgDer+BJ0Su+TM/QuFDc+BTjDo8JkoeYWs2wWOE5lNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135080; c=relaxed/simple;
	bh=KhBwjo+kFbsZj/XvuP6pzYiNuD83m9A4j5oe+hDKDjg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gav3r4gdvDLJubFS/8w9sqqQWn4GY5Pm+xIHyFCbmryibIgk7Rv1YZAEfdQFznmWcilRKQxM7ZhWu0u639ZvJUg1IS+QNAREJTipGz57QCPncIPeWrMSrdpxyjXILdfLutIJJvj1vUzrLp7MLgw8cEtIZZMBx0Q0fnCgaIG7tx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FTbK0r1r; arc=fail smtp.client-ip=52.101.61.69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQ3divRSbiEO7XYPXktdKrDvCcjCs1lsfJevj5t3mLCuhU2ywbIw/skmjzIQ3GxW7/1eBQn2i18+m+oQZ4mlIz2wVexvzd8msljhqE4at1fFxS2phEKfEmmD77OljojwGXd4tCB6ROsagYq5PEex+u+ATnd6CbUIktqNdVcBDu+7fmIjNRp8k10HH+IlzunQloZ7nrWBGos1dVjI6/TBXWwu9ECUbUqU1Yi0bOp2WCd6ACKIF9tx3K3Wwqd5hSpgpHJrTr/fqVCh3q5HFiVcDA0sM0zA9SiGidp9uqmIphcwiqgHB4OWAVO1Acqfcr+YQisnGHp0TA30sN2vKCFN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4Qup03F6j+LTsQkAxhMn8hQUrdyM4S2Nlat9rNKyZQ=;
 b=TnBYJrOStogbTdSlBWxdsv97JFLb7t08j5CWJCS44zQaL7TqR6BoYbUiAsChtDKGHuFz4gEseZEURpa2vYXviTDi4Sh9lDh3g+j4k697YfVmYdKnde0Kw8Zj/iR16orcTzNS2vP6v8VMs24OdStM43QtOLwrWZoMEw/oXpQbgUMsoP4xWWPAoCzvY6YhCtk2XAT9j2MiLmBnYusnTwAeCZ8oQ+zcH3Rz4VHTzO49yYaZitcaRa0cA67VQvGH5PuwU0BWBnipGkiJJdhyhowPSnnsWW0ANPwXLnjX5hp1bczog5XbF9nDuSYXTV6TcPeE1YiuOHU1DtO2VVTee4OH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4Qup03F6j+LTsQkAxhMn8hQUrdyM4S2Nlat9rNKyZQ=;
 b=FTbK0r1rXLeSLtX0DBBcwA8xfePjwbORbJMjD0a/g1B0YSeqOuhk9AsoiJQtpWWI1wkV2tcGIWdkM7sxEpL1FwJkk+lCJ9Z1e6Tg6clK9kBUCgE8LDdIZX5ULHv4vF/aRR2eGrcWOYWNVYxpdgG/RZTFx1VZ5PURU0KIoARJLbJ5Fu4YpEOk1gQWMwWECymaP/EHppgMPslwCm+PBRgNohX1GtxSGkRvTeI30Vd8skDCdrRtZJBF9YFj/e08aWLyqSDAm44a11RVJboawB5El4RQBXGdsPdjHPnYv9K+grmuctriGF3wDGcKLQXzfexFl7C5QOEOoIWOpEzY14BV4A==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9774.namprd12.prod.outlook.com (2603:10b6:8:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 13:30:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:30:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 22 Jun 2026 22:30:10 +0900
Subject: [PATCH v5 4/5] gpu: drm: nova: depend on nova-core and use its
 symbols
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-nova-exports-v5-4-6191773fc977@nvidia.com>
References: <20260622-nova-exports-v5-0-6191773fc977@nvidia.com>
In-Reply-To: <20260622-nova-exports-v5-0-6191773fc977@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbc8d0f-0a7c-4e73-7af0-08ded06279a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|10070799003|376014|366016|1800799024|3023799007|921020|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5Q3ADa0BWrTmTdJdtYa3hIktXASRISyIQr9zqpYXLdkO+NzCfNIVqv0mvagqccusEZBGOIDSPPkhnitxzCuONl3kZ2fhZ6M0soi4G+4VqN/j0sPGsEDRBGh3a95sicG3uwSx6oC1HEmxG/hNvLtZ1EVEXQkPd0ID39Bp5ObJlSRkjg/PArgg7KT5ob7i1met/9WKXxfY3g1U/UX8RtzivlLfo6Vt9GUNEBfy2ZRmhxLvm+OIMdpNoLHS+TN9mQSKdbHwckZhp9SUZoQ/7TCqEUC5MJoM5xAwTIFTqrDVql70aQ/p99e7cq5yoPAUyNitlj8rqRgptzlyvrHGeNuJUz9EGzulqDEPHIBsTVbuI7tW/rFQg9oae5oDYfe4OBWOWXuoVZZXkDLS1RWq6HZ11PZ3plpAj0IEHd5LxVudwEfSeuvE0JMO46EgCKLUdhWg6rg2u1qIqXHj+oxHH70dDiq/uSUQaIz/MpurgTRUbhNYxJwU1SlLEYOFg2eKC7oIf0ti9XMlXusf1QtFkwZEcVrQsosFZ9nzV48L3j+66G5carDlQB5IXfdcQoywQYNM/WY2ioPxN/KeXYfZ68JavwKmh7h8BayaNXL1cOcGeD0E5HtJcTtul6cMiWDmWTjUbF0skst8inArpSyGG4zW6CSfCf+aPNXh0lXmJQpfu928HoW1vq6Z+EBLXZhV83VNIfu2U4t1kqtVs3qqcXFhZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(10070799003)(376014)(366016)(1800799024)(3023799007)(921020)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1NYSzdYUlpaSUdzdGNyYnc0L0RrZ2lVRlBOM3d3SzV4blVBdkZsamJUclFz?=
 =?utf-8?B?dVF5dmRFSDNUakdhVHY1WG1UdUlOK3kvK0RLeFJwMW9Eemx3K09WbmhJQVpC?=
 =?utf-8?B?ZFoyait3c25zZkJsZEFvZ0RMMEtqWGMyTWNwa1YwNDZ2N0FiSW5mbFNJMEta?=
 =?utf-8?B?NDA2MHcwTUkvYlhpaFVtQ2ExdVpiWnlDb292UjVBdndwVUhGWSt1RWdMb1I1?=
 =?utf-8?B?TzA2RVFzQ0JOMjVyWXdiWGlMZ1hNbDYyak5CMG8ycWsvTWVaYjB5Ry9QTldW?=
 =?utf-8?B?aHFFL0xiWXhGOGtZeTVJL21Sc205NzF1TDhSUmhrcEtvbVBxNlNSSHI3a3JM?=
 =?utf-8?B?Mk0vOTE2SFZaSWt5MHFPelZpS1NpMWwzWVZsS0dUdWcwR3R4S3BhUDZYTEpl?=
 =?utf-8?B?aUhpMGEzZkl0ZUphNi9KcDhGdzhSd3l0WDFjcXVvNVU4VFk2Smswa1pRNHZp?=
 =?utf-8?B?b3BudVlrUkk4RnhMZE5LYWNoRFJFenFaL2lOeXZ3aE5ERDBuZUNuYVQrdmZk?=
 =?utf-8?B?WDNaWmxGd2xGcWdzVzliZ2FZRkNJN095R3cyTHArTHBIOHZlRXZmUlN4ZFl0?=
 =?utf-8?B?V244L3FFbHE4T2k3UmFXdWp3c2tPK01VRHJ2QTNRMld0SDZlWDVIdU96L2Jz?=
 =?utf-8?B?OGpEQjlEYUdKejdqNzYxcGdZRGZjaEFZQm5rZ1czNWoxV0lHdEQvQkNlNE9H?=
 =?utf-8?B?ejMvdHd1dlp4V0I1bjl5b2ZCUkVjakxHOUVNT1QxUDFQam5NY1hmUEx6bDVp?=
 =?utf-8?B?RHA5ckVkMlBiZGMyMk5UaDNQcUgxbWF2SHA5cnY3by9la2VYeHRiZFBJWjR4?=
 =?utf-8?B?ams1UjdkVUtXTnUxRVFSeTRmMU9LaS9XWmQ3dTJFTVpFMy9HQVBLNjNJNERP?=
 =?utf-8?B?TTg2TzFLRDdlVFVrR09VL3hGakQrNFdwSGM0Vy9BOWY0SExQQm5xSU9MSVJi?=
 =?utf-8?B?bWp6WTlYOEVJRHpxYVY2b01rMW5FUDBEOGNtK0R0ZkhoVnZQQmdpS3NmY21t?=
 =?utf-8?B?Vkwwb1lpMWh2RHB5RWJ3RXNqSG9NZzlMdnIyOWExWGlNTnh5YXY4WXcxcHUx?=
 =?utf-8?B?TUZLdjY1RnI5T01WUFVlS2Q1UnkwMlZPaFlLdXJaVlEwRkxQbmZIN3Q2SHc3?=
 =?utf-8?B?R1VmUWJDbXpjcEVqek1lcUFzaWUzZkthcU5pdHp0TVJNemdhL00zeEFYSUhG?=
 =?utf-8?B?TnY2WlVFc2oxbDNHSGtEZzBCcUlMaDBkMUhPRkVhWHhMVHhTa0h4dWUycmU4?=
 =?utf-8?B?bnBkaWdMUWJVNy9OMUlTRjRQa1k5UWwzalRybXBpV3g4cmJ3ZGpldG0wdk1I?=
 =?utf-8?B?TWhEdkJoNVV4NXpERlNZSHFoN1lZZ2EzQlVFcFBKb3Q1OWNXVmFHNVJLNXV6?=
 =?utf-8?B?TUN0bEU0L2M3RkhYYjFwbWdRelRMdGx0OHRDdHdmb0JvVktYTGVNdUdYM0VP?=
 =?utf-8?B?N0JRdFg3Ym5SQndjcWJKN2N5VjVKVHM0RitSSGVJY1ZDUllkZEdDSXhnK2Ri?=
 =?utf-8?B?MTlJV0lVL3puZkJ6UkhoRFpoMzkxUzRPRmswNzZ6cXg5b3FqVGFTNVh1TkIz?=
 =?utf-8?B?cVB2QVBLRnFKQ3E2SC84R29XQjEzc2htRUUxOWdkRWdqWFNQd0VLRmpIc3JE?=
 =?utf-8?B?K3Q4cll5MXRWTjZWMjhhS2FxR1BHdmR3QTVvcVlYUnYyZER5bGY3cUZ4WTh5?=
 =?utf-8?B?TUV3aHFIL2FPSUlpSXVnQkFKd2Z2Q29HYmw4S1k1RmRiTUxRWUpkWmIyZEtW?=
 =?utf-8?B?aTZ0eVVLRE5hbHlxdG8yNmYzWDhEWHhScWlUUmJJOUM0d1VEK0ZVb28yemFG?=
 =?utf-8?B?aGRHcURTNFRnY0pYTmw1TVVvTDdCdkYxOVI2TUpiZm01TmFramV2WEhscUg0?=
 =?utf-8?B?UExpdE1IMnZybWY2ZUhIa0pVYkg1QVUyeVg1WmxQSStrWXhWbjRnSjcyU3NX?=
 =?utf-8?B?d3MyeTF0bFFhL1M4YWhwWW1JY1ZIUFVpdVI4aTBXbmdHdmI2ZTVOWW5DUEJ3?=
 =?utf-8?B?VlZlQUNFSncrMCs1eG1Fb1pldUt1NFVYb3B1YnFSNVJqRlhrRWpTK3JWeHFH?=
 =?utf-8?B?TlNxZklEbzZSSE4vcVFKWjkrWTcwZUdHeEp6Sm85c3RBVkVGeXlzZnY5ZW1K?=
 =?utf-8?B?cE1Zdlh1QVp2Q05XZmticjJkU1o2SSsvNmpaSUhQdjJuMGMya0Q2QkppaEto?=
 =?utf-8?B?cEVZRGxBekNpM29ZN0UwTy9LRTVhK20wbFNyanJ0UWFUdGw0YVFuWmZmYjI2?=
 =?utf-8?B?UGJxajU1U096RXd5c0Z6NC90Z3FmZE5DSGpUWE9FMXRzNlhRWUM0dXc3dGlz?=
 =?utf-8?B?S1N4VFRZbHM4YmlTSmhGMXhqR2llSmNNZ3dyci9jZ0x1RmlGaGhqRlJlSG15?=
 =?utf-8?Q?hrVITeTicvnymyE/PQTtnWY2pxTDoV+798Lb+MkCffony?=
X-MS-Exchange-AntiSpam-MessageData-1: pRd9eCn82FMx1g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbc8d0f-0a7c-4e73-7af0-08ded06279a5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:30:50.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+UkkKqgncuKlNNv9FNyIsd1E+zyG/zWphferMehi4cyEiyYqFl9An/uXNxzJ1bG22nyoOTPxU+nefqB+ABx4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9774
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13852-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:acourbot@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 844916AFE7D

Make nova-core a build dependency of nova-drm, so its crate metadata is
available and up-to-date when the latter is built.

This is intended to be a workaround until the build system supports Rust
cross-crate dependencies natively.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 13c96aa57033..e372fc02139f 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -60,3 +60,7 @@ endif
 # Output nova-core's crate metadata for use by nova-drm at compile time.
 RUSTFLAGS_nova-core/nova_core.o += \
 	--emit=metadata=$(objtree)/$(obj)/nova-core/libnova_core.rmeta
+
+# Allow nova-drm to import nova-core's types.
+$(obj)/drm/nova/nova.o: $(obj)/nova-core/nova_core.o
+RUSTFLAGS_drm/nova/nova.o := -L $(objtree)/$(obj)/nova-core --extern nova_core

-- 
2.54.0


