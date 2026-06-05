Return-Path: <linux-kbuild+bounces-13578-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nicPIKmJImp9ZwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13578-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:32:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2496466B2
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:32:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b="IcyPl7i/";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13578-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13578-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 332F8300CDB8
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 08:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0814E3CDBD8;
	Fri,  5 Jun 2026 08:32:19 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B6C3CD8A3;
	Fri,  5 Jun 2026 08:32:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648338; cv=fail; b=WDpIX8ue05M9UWndEG9fVvjMAT6OfToUlhmN2+r37Y++z89RLyYvJPeFgkq91XyFsooUg9YpxSedNxKiNl0r/S3HsWppmqMWuEhLmEwkMeuiEY9+zlcqachXZ19/LUM5sh4uDYHCYKcelbHlDaryWO3zZWAy9hOp5xbeWX2rC5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648338; c=relaxed/simple;
	bh=74eIh/9AVLRO4ZlqLdhIuxoheOHODQArWnDxD3DXuaE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=UdRUZAPA/eLKbTKfugJap+NEMx56dgBItIBOr5XRrjJgkefS+FvWwzFc5APPosYPgQ+mhg4k1OuJ76pmQi0XTfaL7alxxtAwXW35Sn+8WK+4WS9gLb59Kd2PIdibpJ1xEc5yiS/prrbwNlRPpa4pmW9uCOh+B7CBsSnCyRwSYXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IcyPl7i/; arc=fail smtp.client-ip=40.93.198.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfOs3aEAl6GY1VGDhaHZ3lhL2PZK1v5IcWo1xtZx9CFUTCbsMz+JUWi3+XYkZWLebJ7cBd2xTjHqRFsBABjvMjZd0nS9khzR2HseDS6J09nnnTcoKsESeVL2eftRejQjSQ9DXQXAOlNMe2jomOMzs9lkZvxO3z4zUgppwqKEn/bElZhzFHijl6Mz5Fs8+54iD6Say6NTY5spZ4szf1ATXrHlriHkYsOH/p2opgGZ+1N/e4eD2DRGzdGQe3/3A72VZDTcqExgofm6791KsactsYzGG8rinKiMJqWFtG7qSP+ehvwJIru6JObgOGCbP4WzSiT/8k3P7vh8dCxZSBj7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sib5y7ARytgmOSP0ifrVcWMHSsZFNRsgajXf/CzPfzQ=;
 b=R64hF6hJkgdqbloCmguRISW2xclG/IU1Xi8fphbzsDLZaF/RvajfS+mnghbt3xkUjVm6hilHqD8gI8mwUB0wcE4ok+szuUdAOcOqfY9zpPu0gOYea55PyaJGKWg6lBmYgcPMbX58f8r/Yo807qSTKYq720u7egO38vV0nL/Hb0r9SxIrFnLFF9Kdhqomds+o4msrB7cYBysRz49lyKoWz9sBJW9lMUDs2Q1M24V9OeWDOXTMQUnCYsat0HSo7J8CSTraIezfJFdrCZxMtN+hYUaJnhwq6ENMVa2Kz618EzNT6QKycyw5d6LPlzHRNA2uT8lP9GiUz4brhofIzWAyRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sib5y7ARytgmOSP0ifrVcWMHSsZFNRsgajXf/CzPfzQ=;
 b=IcyPl7i/OL7NkzfGBkxBOj1vtxZbf5u1ZIlnzEkZSoE406h78lbC5me1IChHjzKeKzryVYxDkMERr7wSPgVkNUxR19aF16lwD7fB/5BDKFgKvZML5B+9MOnk0YsZG0lFKsiK6d2T87+wFaG6UAc8MAdxTp932tSRf7ntvHRqZQN4MsPNG1Kimq00j2j42HjbtofvDWBy7z6TP4ZH3q0ig8Gb9Ht/dgvpjjJqSiuhoLeX3UKaqkcxxLd7UBKoOhbCYgq1wlS5W6fbSA57JjcYBqVblyHuJLoKgjWS6Xb6N1mAipoz5tSxF0hiC9fm1zz+k1PE2m4GjuqM9QM+j9/F9w==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:32:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:32:07 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 0/6] gpu: drm: nova: enable calling into nova-core
Date: Fri, 05 Jun 2026 17:31:50 +0900
Message-Id: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ7CIBAF4KsY1mIoFCquvIdxQenUYiI0UElN0
 7sLdeFP4/Jl3vdmQgG8gYAOmwl5iCYYZ1MotxukO2UvgE2TMqKEClIygq2LCsPYOz8EzAltpRS
 aK1WjRHoPrRmXudP5lcO9voIe8kZudCYMzj+Wf7HIvT/TscAEV1qxQogS5J4dbTSNUTvtbihvR
 /rWnFY/miZNRAOl5lw0nK80+9Cr3yzpIt2UYkxCW33peZ6f5TZaezcBAAA=
X-Change-ID: 20260430-nova-exports-502f996c5aab
To: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
X-ClientProxiedBy: TYCP286CA0191.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b4334f-0445-4317-80d4-08dec2dcedf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|366016|1800799024|376014|6133799003|921020|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xbrfDS7KfI5sb4DWXia29+G+0BSPVqD0rO33tkKGVMa8eUG6dnzKFtMN4XsngjqlxzXywbOYi7cz1Dq/yBeuP2zINASYzwT09RjLzP+v5NlGAGMrocm91idYgspoAaTZgpbEUJas6RxrXiYWbYsEZHrzC34UFO879z84f9tBgzFGlR2kwN85ka60J0c7rDLu2Svi60QJdgQzO/lyOnB7atvl9mvJZTP1pQnoygaYQwPg8183kAb3FBM7psiAHvviJgdmzmpAr1T5jEvpF7UmOZ/1XjKM2QdK+zQo4euTIAjo097dgRZ7WATwuxNWKbHy/5YzdXjo9tKvmb5Kz9CjbkTgazudXWSsP7EMHwDR0096aJhq9FAv6nOkpBSLeEpCS2P1ONal3s1H7FXMM/OODp7bpQB3aGDhWZS7ZE8FzHJRw0kAsPnjZuZ0czbqRoSl4POaYulMRyK4ngOB3YEC1vftxz3dADbLS8/zIG4HHg+o1bf2dTPmUyzzHZFzgZZOApAeflJWYKaXCCHWbXpXbLIpQ3rW1DyPm5W/IJWwkOqWckPuK1jUv8mxrvsRDwdwidmkFTtk5ygApOUGJJrXwzlqCh/3fd3appnehbFnveRf9dTmk7DOEWaSEjqUzg7pzvrbjP5cuSpr7hZKvtnYXcSpsP1C3XnkHg2frLSx5Aa9a9RU55r8SgX7sGfFL6jqsAecBcKBsT/e8GzA7wGI9KmyWa+ExNmCLpROph3t09bmy2e9Nt82d9qbHNFGKi/l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(1800799024)(376014)(6133799003)(921020)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTBIMUt1NTVPajRrbWxpeVRyS0JHOFZIZHJiWE8rREFhSWM4VTg4T3g0dDV1?=
 =?utf-8?B?djNSSDhNdUprZHNpRExwWjM5SUZvZ3RsQjBBemQ2aWl0QzdvTEFZQVZZakxO?=
 =?utf-8?B?blNrMU5sR0s5WjVlbVV3L3ZBZzZuSHl6cGRYdjVudFRLbWF3Y2VGbm9QZzdK?=
 =?utf-8?B?VFNCMFZqWFdLYmt3akpZYnA3bkhIL05VL3d1bFlycC92M0NFRytxWjY5dEFG?=
 =?utf-8?B?QTJwUXN2Q2lDSTVheGVrWEtPUjV1ZzNPLzI4V3Q2ZmZHeTZlZTVZNmJuQjNz?=
 =?utf-8?B?MG1BQVdSakIzSmxjdzRhSldsYUMyM2RHNGRjTWx1NlhqdDlWQTZRWFJILzZy?=
 =?utf-8?B?TmI4RVJyY1h3d1hLaXVST1lGWFJrY1pVTERnZ2JGb3hHRUZwYTlKU2VnK3Jy?=
 =?utf-8?B?cE9Kc1h0UGV2c0xRV016S2tQM2FUdkx2cEtKOXpYVW1ZRldkS2w2T3kzY0xa?=
 =?utf-8?B?d0hxVDFKenljTGZGUDJTMENmV0Q2SDBtQTcydmZmUHVNdGJUc3c5YUNkK2Rk?=
 =?utf-8?B?UDFTb1UxLy9icVZmNXhiVWpOVzZmTDBaY0pFUWwwdlZEbVRJQzRFbmFVbVo2?=
 =?utf-8?B?NVgvWEVIMEFvK0R5ZjlqU2g3dFYxSGQ4ZmFRbEhUMmVZMWVFQzdodGVxQUdq?=
 =?utf-8?B?ZmYwZVJDL0Erbk1TdWZOTkwwOWEvUXNuMWp2QzlYQUhvNlJjOFdPNGVlR01o?=
 =?utf-8?B?Q09LbFBJNkZkWTl4ZXhJY2NUWGtRYWVveFRWcHZPR0hHNHZXYktLaUtwK3la?=
 =?utf-8?B?ZGFkTDc4am42djFJMTBQdUwxT3ZTd1l4NFhsUXlPa2FZT28zMjhncGcxL1E2?=
 =?utf-8?B?Z2NPT1NWNnZZeWVnd1VWb2ZaaTdSTlVhbmNrWTdSS0h3TDRZZFVtemZFUDhJ?=
 =?utf-8?B?NkJzN2Y1bCtIODRBSGNIMEp0aE9HRHd3TmtuZ1g1dG5zeFNnbEdQZEdCS0Q2?=
 =?utf-8?B?QWlBd3FoMDkzR2YyUUFlRVl5UFhjVXUrUXdUa2swMXJGdWJ2RnZ0cUNiMDZu?=
 =?utf-8?B?OEd0Q043NDlYNDl6MHYzelg3bHJWU280WW0zREF4cWxLV0d2SSswVU16aEhv?=
 =?utf-8?B?cFpUdmVnWkx0eFphQjVCMjNCSy9uY0JXcDVLOG5lbFNINThkZHhzdFArT0w4?=
 =?utf-8?B?ekdLcUREWkVtbWVFYTdVSkMrZHdWUlFJVHhYa3A0T3NCMlllN1EydkQ3Rzh6?=
 =?utf-8?B?SGQ4RkJndmJRMncyR1d2aXRiOUc2ZDgrMnJ1T2Z0eFVHOFBaSzYyMmhTdmI3?=
 =?utf-8?B?UjMxZWJia09xd3lWa0JQQTllN3NxTDM3TDJMaG5JbUNLUmJzWGNwWE5lNERq?=
 =?utf-8?B?SWl1TWo1ZndIbDVFQmFqbjl4ejB1NUJxQ2pvWGk3SFBGcXlNNk1JeFVpbTdr?=
 =?utf-8?B?YWVKTlhrOGNqcTJOWUZQc3RVbmRmVjE1UU9xNnJVUE4zMzltcXNTdk1ORUxO?=
 =?utf-8?B?TnN6eDQ1VDhHZy83Z294MkVieC9xUVV0NUwvdU5oRnl2Q1ZuL0lsVWhKREl6?=
 =?utf-8?B?dStMREdESUZIVFRzbURTM1lYM1pWcHlOTnFTTFg3bG5HcTFJeDhISmliRDF5?=
 =?utf-8?B?a0ZIVFNERXNpaFpKVkhkTGMrUVl3Qmd5bWJ6TXQ4d0VuRS9VRk10VjgxdWtN?=
 =?utf-8?B?bFh6VFBRL0Jqamw2RlpnZUtLcWt1SnVkekk4MHJxS1paUXdMUHlHZXQweVV5?=
 =?utf-8?B?Y1pQUkhtUEtHNitLaGxEODYxaVdXbFo2UUJObjZzZ2V2WSt3SGxWbjlrN2FQ?=
 =?utf-8?B?R3B6RVVOekIwTExxeEtDeTZXY3NvNy9kVDAwZTFuUklwRU5mWE54TmdvNUNT?=
 =?utf-8?B?anRlL3RuMG9GMUQ5K01nUHFBSlRnOE5EWWxFbHMyemttUkRJcURjS1M4VVNn?=
 =?utf-8?B?eTZ1b1hCK3pvdnBLTWZoOUt4UUQxUHRid1l4Z3JObXhuNUJieVo1VGY1dExE?=
 =?utf-8?B?RzFsZFkxNVdialRURWlVcVQ1aUJkNVViSmFROVZBUEtkMnA3a2pNSEpTVTBU?=
 =?utf-8?B?eXlhbk14eWFBYzVyRXpvZ3BFcE1HQUxBck5qU0tWTmp1Zk5ZNDNzZDduMEJq?=
 =?utf-8?B?VWJKVE5aQUpncnp0YVN3cGdzekxZYmRvaERIZGZmK0E0N0tkajhsbEVGUGdu?=
 =?utf-8?B?eXgyNWRiTUQ0aXpwaGY0bHcvUXhhV1BsZk5XcDRTa3o4Syt5b2N2QXFrMzh5?=
 =?utf-8?B?aHpsSEZ4QkR6eGZIUEdSWjdYNjVoYUtqaDZEMVpOSHd0Z2N4NmlZeGpVcjJu?=
 =?utf-8?B?ZFFIbzJVWEQ4dGVQMG9zcXlkSVpCKzdhdXZjdGJaT3RXK3h2Wlo0WFBySTdY?=
 =?utf-8?B?NDdmTGJnZXRGT2hVOTZVTnJhbHV6RHJoTEVMT25IN2ZxSVhKR1g2NHNWNXpR?=
 =?utf-8?Q?2G6QLeCHoHY29kJFkX/3t50FMlr7Wa6RMdLTXUX8mYEhq?=
X-MS-Exchange-AntiSpam-MessageData-1: da6EXQ3lZ4OBxw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b4334f-0445-4317-80d4-08dec2dcedf0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:32:07.6508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dneoB64Snb6Zkhzom0gPQyVrxECOm4gHXv5+zWqpfDYJ+Uay6o1xjgkQ4mtuXRTXLqtIwHc2CmeQNWC/0TViog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8911
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13578-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:acourbot@nvidia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:from_mime,nvidia.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F2496466B2

`nova-drm` is scheduled to expose a user-space API to receive IOCTLs
from user-mode drivers, and to call into `nova-core` to perform the
actual work. We are about to reach the state where we need the ability
to call into `nova-core`, but the current Rust build system does not
support this, and the solution will likely take at least a couple of
cycles to be merged.

In the meantime, this series introduces a Nova-local workaround for
`nova-drm` to call into `nova-core`. It generates the `nova-core`
metadata that `nova-drm` can use to resolve references at build-time,
and also builds a list of exported symbols for symbol resolution when
modules are loaded.

Since Rust symbols are long, this work ran into the limits on symbol
sizes `modpost` can handle. Thus, the first patch instructs the compiler
to inline initializers for some Rust basic types to avoid those long
symbol names when symbols from `nova-core` are exported. Interestingly,
this also results in a smaller nova-core binary size [1].

The rest of the patches enable inter-module calls from nova-drm to
nova-core.

This series is based on `drm-rust-next`. The current revision includes
the feedback received on v3. In particular, moving everything to
`drivers/gpu/Makefile` simplifies things considerably, and I have tried
to align more with what is done in `rust/Makefile`.

[1] https://lore.kernel.org/all/DIN76NTFEU1N.1RT6G4IFD62RG@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v4:
- Build nova-core and nova-drm from `drivers/gpu/Makefile`.
- Emit nova-core's crate metadata as a side-effect of its normal object
  build.
- Align more closely with the rules of `rust/Makefile`.
- Add `.gitignore` entries for generated files.
- Inline a few more Rust methods per Sashiko's recommendation.
- Drop a few `Reviewed-by`s as the implementation has changed
  significantly.
- Link to v3: https://patch.msgid.link/20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com

Changes in v3:
- Drop the modpost overflow detection patch as it is to be merged
  through the KBuild tree.
- Drop obsolete (and actually unnecessary) changes to `pin_init`.
- Do not inline methods returning `impl PinInit` as they cannot
  contribute to the long symbol names problem.
- Use `#[inline]` instead of `#[inline(always)]` for methods that could
  create excessively long symbols.
- Link to v2: https://patch.msgid.link/20260527-nova-exports-v2-0-06de4c556d55@nvidia.com

Changes in v2:
- Rebase on top of HRT v5.
- Inline some `pin_init` and Rust basic types methods to avoid long
  symbol names and optimize code.
- Print truncating modpost symbols and abort upon meeting them.
- Drop increase of `buf_printf`'s buffer.
- Drop obsolete nova-core renaming patch.
- Link to v1: https://patch.msgid.link/20260430-nova-exports-v1-0-7ca31664e983@nvidia.com

---
Alexandre Courbot (6):
      rust: inline some init methods
      gpu: build nova-core and nova-drm from drivers/gpu/Makefile
      gpu: nova-core: export Rust symbols for nova-drm
      gpu: nova-core: emit Rust metadata for nova-drm
      gpu: drm: nova: build after nova-core and use its symbols
      [POC] gpu: drm: nova: demonstrate interaction with nova-core

 drivers/gpu/Makefile                      | 36 ++++++++++++++++++-
 drivers/gpu/drm/Makefile                  |  2 +-
 drivers/gpu/drm/nova/Makefile             |  4 +--
 drivers/gpu/drm/nova/driver.rs            |  9 ++++-
 drivers/gpu/nova-core/.gitignore          |  2 ++
 drivers/gpu/nova-core/Makefile            |  4 +--
 drivers/gpu/nova-core/driver.rs           | 59 +++++++++++++++++++++++--------
 drivers/gpu/nova-core/gpu.rs              |  9 +++--
 drivers/gpu/nova-core/gsp/hal.rs          |  2 +-
 drivers/gpu/nova-core/nova_core.rs        |  4 +--
 drivers/gpu/nova-core/nova_core_exports.c | 15 ++++++++
 rust/kernel/alloc/kbox.rs                 |  2 ++
 rust/kernel/init.rs                       |  2 ++
 rust/kernel/sync/arc.rs                   |  4 +++
 14 files changed, 125 insertions(+), 29 deletions(-)
---
base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
change-id: 20260430-nova-exports-502f996c5aab

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>


