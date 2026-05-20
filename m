Return-Path: <linux-kbuild+bounces-13286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOTwF5YgDWpptgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13286-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 04:46:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D601A586F0A
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 04:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9037730067BB
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 02:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B0C30C61B;
	Wed, 20 May 2026 02:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t5EvMnDP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010026.outbound.protection.outlook.com [40.93.198.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5081A9F97;
	Wed, 20 May 2026 02:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245100; cv=fail; b=acdqRctKdgU3IC2hmkabVbafofJYbXAM53UWHgOTVTq7pHHygs6ft4G9ncaHTCl3/kzTavkI3GwVH6DePZDdPqioiuGVnoCnfTpI70fPfzokvGRUOFAU0VxaSIYU2f5ETFtWyqMqWPo1xgcRbbe6MYdR78d1kLdl5Xfm4C0IkfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245100; c=relaxed/simple;
	bh=bXDBC+ehTpCfOL/2sUXsj+HY3Cjy9mMAOyoOWG5ArqQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=u4R8BojcUWzlj0eIE3deOrJXhJImeR7fzkJdGooINKAO53C2M5F1FvBDRSPu6GOu1qc8pkiRBG7KqTc1Lh+n9xzG1PtuvC7g1Vb5m3tdAcwi/V6hPc0QXmA9xUMgEVUmQXYUc4epuQ88iamR3QAB9FD8qlP5bpGbYCk//X4kLA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t5EvMnDP; arc=fail smtp.client-ip=40.93.198.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gc1iYyrx0iTns8AcL4ZjbwCpHfL6+hAqUOieseqPWCzJVWLVYO4zA0PyuYrqAV/IR8IuMq1+fEqf2zwwDNRO4E651ix95M/o8rQdoCxwC+pW3tC9B18ue7xhaW5uUfb5fs50Ncg0qSYHzz/3ib5+Au/m5uG1d2MuGxVgDszIIwycgVNZQ0faIMJ2gseKldQz7uiDMtXwzDCBaNjt/8OsH2pVmMMaMYL5/OXeYwoJSQpPyYnxqGL90D/m9x7c1pLFwDqZOG9+5bDVy9Prgj4hZ5z3yIKUj79pvlZnvDGMp5x0IkTm5AhoZKPz9YqB3sHeMW57BZRVVlO61bvsC2PFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXDBC+ehTpCfOL/2sUXsj+HY3Cjy9mMAOyoOWG5ArqQ=;
 b=joYKMPvef1T9BAX1526yF6oif5ChtQLkMV3W/0oHG35U3dBbO1OPbbdSoIHHHYWQ7eSk8K80k+Sk92UQCJllRxsFsl0VH5Xx6sKv6eZgSw1GR/8CrPRioGWKEgmKljiYYQmqqfn4pPOHLzIWoIKd6A0etfXvQq486g99C3OkeBffZz2Cmcpbl1EbSyBzoz22TI+3MGEp0Z3g78B+Uq+TlBi/NQzLn4y0Dz+puYgi4LY/9kqhWuveW2KeBichoVxaIhcYDuS+QMyoySPeMRHwxupv7zPDfCvo2sCVeuh1016xzfCfaSONeYbiU0c0NfXqUvhy3yfkf/J6KX7VI+QEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXDBC+ehTpCfOL/2sUXsj+HY3Cjy9mMAOyoOWG5ArqQ=;
 b=t5EvMnDPoi4d9QZaIZLvytWFf8tso8aeWyUC/4xcFKCDwu76J4G7cfR9uWwIp9RP0jx2DZKZX9pJ9Pw530eWayQcnaRJ8ratC2CtfkP4qUi4yamgYAlaxIZilD38LjP9OaAhZBMKVB+B0Izej4BlubCYGqU5bUvjTKnVNyBnhMwPYe5cSWihVs4uZGKaal/G2d4L9yls9wcGocX+23wBnoVXQO0ZRgXsgdh47/6byjGcyM1fbpiwyIcsHTUZlJz5ZLPnlI4OOa1nb2HZYfXgsyl/BCfsdhA0SFUonKqQ+ELeESeObTvGtGWnqIozFI4Y/pKfwPuOwqEWMDDKxQLkww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7578.namprd12.prod.outlook.com (2603:10b6:208:43d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 02:44:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 02:44:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 11:44:48 +0900
Message-Id: <DIN5QTIGKQ80.11TOOMMQOBGI@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/7] scripts: modpost: increase buf_printf's buffer size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-2-7ca31664e983@nvidia.com>
 <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
In-Reply-To: <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: 657e028a-520d-46de-ff19-08deb619c471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|3023799007|4143699003|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	De4anoZAJzOpMEkCSYEyPN7nLw+F6pSguFeua77AXIVL/mgzNPZcJmwSLpfMaO29uq9NgYjuTbpuM6A5c5zfwCo8k85Gxvca8yqql6ioSFg97MPcgFO3hAVyRL66UI2WiDXF+SCQPTSVVPUfZRPhAtGpqP9GM9FTTmfiU7npcduVZgYEyzp5bz6EbpgxAGZQvcRxFoMXfmYDJ8jza1ImYXd5K8p7e0nomy1TxGHTl/B3Gw9JRJg238kN6BW1/rDA8qYMgjpnxmbXrvHYKwtLWxTmrxo/7SrBHcrjnHeirgrOt2ud6txD2xrqOpLL13Pl5GKrG9plvqkev2EtBvagrrSBzY77OsQGJfn5XYb23qwsLnkMKA+xtN5YC+yhGJqzoj+5G7ioAiFl9o7oDXmJ87CZL6XInHVhYWNhRFliBFgH93kMtmiFuyit6EwHKmtZ4bAwoPodpYrVIdjzo94BIJxWqkzldja5FKSkcN+m9axqHYzhFj1dssMoQ3I5t9hcfM1qqyfQFl/16GtT+7QEgloI66KTZwTawFhxVt/C8wu7c5+rYjxN3++Ku4n1lGZxRDG22mA6i8LVxuiSevUTSuGsgDZwR7P/misne2DkW5MQldb4KHwUz8QT58Kmt4pbVBFmpCsxK/koJ8FiUdsbGlZ+eYU4dDx7lVFQmLFmALIGhsTqVMjJWCjzZaoazQTK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(3023799007)(4143699003)(56012099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGFTQytwVkU5aTF0Snc4MzFxazdUL05UWDEyNUY3b1dkWWpMZ0k5b29LOXBw?=
 =?utf-8?B?bGRFWCtZRXBrWFRUSlBIZTN4djc0ZVJod2VxMm5HYUcybXBpYTBneTh2dDJJ?=
 =?utf-8?B?dkdKS1F1bEpXSXBQczN3WTdiYitheGtodkI3VVZKa0E5UWZvZHhNVGFiaUQz?=
 =?utf-8?B?NndWOCt5ZTFsNktQUDVQZkdnWnIrZE0wSEVRNW1DTTQrZm02RnlHanRkNjNo?=
 =?utf-8?B?eGxNemx3aVR1VlhvTGRQNUtyNGpaU1FOS01sTGtPTEIydTM3bENzTVcrU0x2?=
 =?utf-8?B?NHVkeG16NDRtWjRsdytRMjZSbFpxWFFDNVJ0SnU0NGRIYTBpNWx2T2ZoOUx3?=
 =?utf-8?B?UzBTUjZzdHcvL1AxSU14M3BkSUhteGRML29OR1R5SlpXUjRvTDFQMU8wUklF?=
 =?utf-8?B?Mk8vZUNSVXcrVnRUNldWeFlyaXcydHhSeHh6dmlFTDM3NzZoSS80b2Mzd0Uw?=
 =?utf-8?B?NmdaaVVPa1BOU1RDcm05SzJ1Q2w0VklCTVFtbEtwNEEyQkhRNDIxUzRpQU1O?=
 =?utf-8?B?YUFnalA3K3hadi9zeTRTZjUrSGE4NTdNeWxhZURpS09NODJ6SFZGNFNyOG1l?=
 =?utf-8?B?WDNoajNUYWNBYVg0Zm1hcmhqTEYvNmpuTU15Sy9qK1RUdXp2MG1aZzVRWnhI?=
 =?utf-8?B?YmtSZGtqOFZmb2RWLzhMSGpySGRLbm1sN3NLL3VoOE1FcklnVzhqZGg4LzhE?=
 =?utf-8?B?Q0FjOVFaYVRGNGFkT2R2dDI2cEpFbTdSdVVnczJjQmhSUXIxVHRneEVDekRn?=
 =?utf-8?B?Zk5ocURmUUdTUXQzbWRhOHpMVHpmOGJnZTVPdmphaVVXeTA4V25XYXlCRjEy?=
 =?utf-8?B?ZWdsaWlSQmxaYzJqampZR01LanNESjlFKzU1SWphUW9saGRSZFlvSzBNTm9S?=
 =?utf-8?B?b3BiRXNpN0VTUU4zTUFwN1ROYTg2Y3BBR1M3NGlGbUhCZk9oYjIwWUk4VGRK?=
 =?utf-8?B?bzJRdXJWdDNFdDhlWDhKaU81dUJkNGFSYk5wVm0zSHJidDhkV2VMelNkWVM0?=
 =?utf-8?B?N0dhZUowUThvbThuZ1owbHVpUG1SNHBOY2J0THFtbEU5L0ZMRDRWS1FGWXhZ?=
 =?utf-8?B?dmsxUDdaVWhCNVN0bmI2VVdiN3AxNEZEWDErNk1rNzRMd242ZXVRSkNrODNJ?=
 =?utf-8?B?Y3JLd0FHR2ZXWTVnc1hBYXJhTUFsUHVKQmkxTnNyYUZJTnJPbG56cSszRVFj?=
 =?utf-8?B?b1VkdmxQSUNnVFJvMVQ3ODNxMXFYTXF1T0czTzdlRnQra3dSYmZTcXdqTUFy?=
 =?utf-8?B?TnRhUWpIemhOZ2ZvaVRVa25tQUFMMUZBaEE3WGFQU2JSY0FlelZSSHZHcnMx?=
 =?utf-8?B?NktxM2l3OEFCYmt0T0tjU0huZFlPbnY5ZHhmNDV3MlordVI4RENtUU1ZbVZJ?=
 =?utf-8?B?ZEszSGpScndUYnRseitxTEdtcHZ3T1RBTHFwVU1VKzRYQjRRVmQ3Qkh5cTA1?=
 =?utf-8?B?d2VjZ2ZQeFN4VUl6N3ZRc25jOXkzTUVyL0M3VXd1ZTFhcjNYRFp2Z284SENr?=
 =?utf-8?B?UXdGWUxQZjNuV0hySnNOelora3lxV05xb01zSVZ1a0kzMXMyTEttbkJyaG5N?=
 =?utf-8?B?ZGplS1lhbUhsR3FaSzdmVnBUcGFvOE1DcGNmdTlDK2FmODBNY0tqbUIrOHBH?=
 =?utf-8?B?RHowUmZWRmpNbjNFNTlxMGtwOHpKQVBZQVpldEduelRjUjVySFVqczVETExm?=
 =?utf-8?B?eUpjRldoVmdDYTRjL0IrUUMzcGI1eTJ4V1E0RFNiaTBlWkt6RHY0RnRsdzZ6?=
 =?utf-8?B?OGsvTkovL0pzb1UvNHJ5QU5PZEpLcHB5c09LWnljcDlCWTdDdTF5UzJJZHpi?=
 =?utf-8?B?blFTa2o5bk41QzVKS3Z5QjlMYkJQMkFPR0JTUkZBQVBVRHBKMEQvc0lvL3dO?=
 =?utf-8?B?SnRCSUljb3l2aUNHVm5adzhPWHRqc3BSeGdweWEvMWx5TFVUVHByRHk5K2lw?=
 =?utf-8?B?cmhlUnBtejQxa2xVdE1NZVZEY2RDdkM0VHdGbGZCTGpQeU1ub0xSeUFVRTQ5?=
 =?utf-8?B?TFJJQ1dNdXRWV1hkSDBMQ1lIUXkycndWSGxqZHhWZXFSSDJzQXBUZ09QazNM?=
 =?utf-8?B?MHZocFp1bzYzM2VhZVV2RnBUblJpWENpVzE5WEZMZWorRk54aXkwMTcwZVgr?=
 =?utf-8?B?U0pSaXZKQkpNUmIwTy9EVk12d0NxYWhFV2dwR05WK0IyV1VqZW45TE9sMjVO?=
 =?utf-8?B?eXRBbHRGUERyV2NsOXE4N2wrMmhyZFNTWkw3TnI3bkh6VFJiNEsxUWpwUmNr?=
 =?utf-8?B?eUxsdXFOc0ZiUnBDV0l4SG1pQy9yaVM3SzFQY1pUbFlNRWhtR0l2U2FLSk1R?=
 =?utf-8?B?WFZUemxwcFpnbFdTdDNsTmJpRTNMRUlUWFZrVWpTenVmREdOUFZaMUtvbmRH?=
 =?utf-8?Q?JCVXLcNOTIYL4IY3N2zYYg6bYua/ERFRXn+xUun6Q8Y+w?=
X-MS-Exchange-AntiSpam-MessageData-1: +5yGHqd9vFuj5g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657e028a-520d-46de-ff19-08deb619c471
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 02:44:52.2845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/bI4FXbGUVIc5TobFFVhnJslIHAlVNoHlerYthAbUoNpJWVmRBpfRWZoIs9R/vSm0jfyAl8fdRY9EiL+GYI6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7578
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-13286-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:mid]
X-Rspamd-Queue-Id: D601A586F0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Gary,

On Fri May 1, 2026 at 10:02 PM JST, Gary Guo wrote:
> On Thu Apr 30, 2026 at 3:55 PM BST, Alexandre Courbot wrote:
>> Rust tends to produce long symbol names; when trying to export symbols
>> from nova-core for nova-drm to link to, the 500 bytes of the internal
>> buffer used for symbol name formatting are not enough, making modpost
>> fail.
>>
>> Fix this by increasing the size of the buffer used to format the symbols
>> to 1024 bytes. It is a stack buffer, but modpost is a user-space program
>> so that shouldn't be a problem.
>
> I think we should make sure all constants related to symbol names match.
> KSYM_NAME_LEN is 512 so this should just be that.

Do you mean we should use `KSYM_NAME_LEN` for the size of `tmp`? The
formatted strings can be longer than the symbol name alone (see the
example below which wraps it into `KSYMTAB_FUNC()`), so this should
probably be `KSYM_NAME_LEN + something` if we align to it.

>
> The only case that I've been hit with very long symbol names so far is do=
c tests.
> Can you provide an example of the case where you're hit with very long sy=
mbol
> names in Nova? In many cases they're just functions that are supposed to =
be
> inlined but isn't.

Here is an example string that doesn't make it, it doesn't seem related
to doctests but also doesn't occur on all configs:

ERROR: modpost: buf_printf output was truncated for string
KSYMTAB_FUNC(_RINvXs5_NtNtCs1EKtwoKEMO2_6kernel5alloc4kboxINtB6_3BoxINtNtNt=
Cs1peUGmbrgHn_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16Regis=
trationDataNtNtCs6wA3Ay79aUn_9nova_core6driver7AuxDataEENtNtB8_9allocator7K=
mallocEINtCsfxcgfq7FLKi_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_=
5error5ErrorINtNtB3x_10___internal11InitClosureNCINvYIBH_B1L_B34_EINtNtBa_4=
init11InPlaceInitB1L_E8pin_initB4t_IB4N_NCINvMsd_B1O_INtB1O_12RegistrationI=
NtNtNtBa_5types6for_lt15UnsafeForLtImplDG_INtB72_:
608 bytes needed, 500 available


