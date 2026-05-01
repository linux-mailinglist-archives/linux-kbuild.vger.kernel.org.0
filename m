Return-Path: <linux-kbuild+bounces-12969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD1yIVIe9Gks+gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12969-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 05:30:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D924A9ED3
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 05:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8E6430078BC
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2026 03:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF462DA749;
	Fri,  1 May 2026 03:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QLO8l5cB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366914A4F0;
	Fri,  1 May 2026 03:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777606219; cv=fail; b=t1QAs2nRA79Nbn6jqmb8ugQCBTLRfi00cqQ6jUijx8Fjgd8GElRarMHNvDcvBCUlixCOeGIK/okOY3bX6l90CHUtt90Q+UW5UoY+aLr4s/mthhhR6JPIkNbwGRjXRA35z5nlYICCRyoY/zmZjMzng52IlX9AzRMqLbpfz2iVsEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777606219; c=relaxed/simple;
	bh=9EBoJ93D62R2Hm3oQpmdukfgRTNdYqoPDrfehi3Apa8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dc0mk2y7nU4ZOONIe1sr3G1afN/+719/YhAKOxqhpy8mlC2Hb9PVy6Z1YzRs4MaeaCZ8I9LRZfiqiEc1BdswhBY0pPH4tN08oJcpwXITeLmTXBLrEVMemyOEYULW6k/cL6HeKaHGpyShInGKMQINXHJH4RWRjKGm/PHOQb0Lg00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QLO8l5cB; arc=fail smtp.client-ip=52.101.61.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfTTn42OZhsej6dTSPRsdiqReg439jGpXSpk605mDC+oCnuz7KfJYI/PZ0/X7McH1xncwI1kvYA55Cpde5TY1NyxOSazKLO/s0z45ihzYhk+YAEXdTeDe69Huj6ncPZ6Kfj+GuVp44udDTnA+s3rZciobRQS1aGOYryOnC1v3TDbY7kQp/rV3cUbIoa8/cK/GtuCZhotDpx1j7kOk57cgFC54vnZjIY/az4xwliVh8JDXP3OmUV1WEouv8luZK73ioPp4luPnQYciJZvFoVfwRzOMJYypxGFbJeceSeh5Eyk753qxCV/38VeQ0eHt4K4KsJGzWeWCXBvLDdjFxmD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YM0aeALFrBcuFm4W4EFnTK7PA/sTQcswglGttkdeH8E=;
 b=exD4d3DuogwzP8YsKJUc/ZqbnnHEFmLYvfd75T+vRLqK0UWXbpBsQo4QJTfIqkzvlXoycIA2vD750hAO//e0cGuh8nOVfTAEUiAt5+Y1AqRxInTiVZ3c70WEXwFLRkDM1uRRGFRXJX02I0SfuPAksRbGKm2YastzeH8SoHJbclV5Q0+H/yBcR8ZvPdf5/dn0NdyuIvulcWuXGQUzCP//NhGGhNKWQIAXZG6nxAmh/GVmJ/lcswto266rVwkBKeGe4QNL99LyMdpIMv6f2rkndLMRR7xF3d+EDliliJ+f4jY5WkDgRDknHkqmqv+xEzO3yWGCdx4kUk3JNTE3oPgdIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM0aeALFrBcuFm4W4EFnTK7PA/sTQcswglGttkdeH8E=;
 b=QLO8l5cBTDUoF+RnudBgXRqIexycgO4WPfOzOa0ZX+rHQoFEbMweQ45nBL/nONSG8OFkCag1zmQGeTqSiBPMhPvD1W0gklOaq/u0mfZSHZNiU1qWYMHGPaeWVM1oohDRpblcc9Zecb7O4hzaQ6ECeRSeHUugjBNAhb9C9sCgfkV+4Y6j7kDPydMa05KVhz+ZU9b9j8FERivHlF9y9yqOciLQBo2GtnvdGBWNv5BcwQZjffDMT2E5406FVvBKkGGwWD6hY86Ved1xwXO9wQS/sUKeV5iYTlUYCT0GqFA0XAl+Vl4Nj9gmfc6vjjlUI8YreMrN2QDpe40KhUjZN990EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8689.namprd12.prod.outlook.com (2603:10b6:a03:53d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Fri, 1 May
 2026 03:30:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Fri, 1 May 2026
 03:30:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 12:30:09 +0900
Message-Id: <DI70T742B4GZ.1DQ9DK7AKDZRX@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
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
Subject: Re: [PATCH 4/7] gpu: nova-core: export Rust symbols for dependent
 modules
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-4-7ca31664e983@nvidia.com>
 <7a33e348-4a08-4f80-aa6e-c684b4d7f1c6@nvidia.com>
In-Reply-To: <7a33e348-4a08-4f80-aa6e-c684b4d7f1c6@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:604:254::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 87884bf4-7ade-49d8-5f59-08dea731f4a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bJUmhoWCLzMkXd3HAOoWedknI2DdIObMfZ9Z7Jmr8NPZPb2t5Cuegc7y4xnQwSru7gvtG9xyEPXwuxyYPa+tjtu4utj/qJES5f2ljCHO2t72Z0KZjcXnwCiQ7o9LRwSZEDQ8epORnCMhzo3PJ8mWIZjGVbZee0OSHB6q34X7QXajRrmYyyYFp+Esmu8OYov1s9vXlJuKVqEqm9BF6i+sCwyT9FY3o+/+6foG1PQMOjVAYxIHleLe14AbXRgckm4RBvbosc3YBRNdS1erLh0AW+X55F9fEtF8bo1XZN3kEoUaIlbbIBUKKSqW7ld4b5nwwNz6V5qhxM4csMaIXWDh1cuSv27OyUjvhdX8A1PQDm7o4xZQqEHfmAnRJYHIbd44286sy88cEsgmR8WCb+0vC8PVZ6JOp4QMjzANkRaJ4/6AUpAvlAA526LRvpcCkIGWtKB75/T9cPbr021V9YRmdxiRKDA6lpn3ueM8fgMsNABXImrOc6z4gVv0/A6pg8zCnVGMRleSaveFcdZrT1fB/bmaSk+x7ulB4CI8On0nNbktgd07/OITnECZjxlYQ+30mRRUCwINTTn9qT2DMIXQlGFzTwEV3zxTozIZdV67T7g1joPS5dDJh6fIil2zdGKX1abTuJg5SwNVSeSwZMDrpD2qvZPFdtfNUVke5MtXOKLHy8kZJi50vC+kSqnyhZyk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0RLZi8raVcvSVVFeVdVQTRTbUU0QjlRNlVBMTdyMEhNVWpvc0dUN2VncldT?=
 =?utf-8?B?YU1XWDJLR2pIeVBkRnJJV1Mvdjh0QVBpTU9DK3o3WUtucks2enF1cmdENlgv?=
 =?utf-8?B?WHZGN3ZwWjZTemd4a202K0ErekVDRnZEVTgwYkdqSFdHUVBPMm52M2FOOWsz?=
 =?utf-8?B?aG4zRDNaeXFtUUpJR2p2MWZwMmRuSmJjbFRTdGxrckNZKzZRV3hYRHlwTUo2?=
 =?utf-8?B?ZDRNTEY4Ni9rTVpiaHg2WnB1cXQ0WHhMem1EcndOejZLWEpTdjF6dGdLTEh0?=
 =?utf-8?B?VEVkQ0M4MXgyY3p5SnM1Y1RHTlQ5b0R0MEJVV1k5ZTV6Rk05aEE1TnJpajR0?=
 =?utf-8?B?V1kzeUs1WW1MQnhiTG1hSC9oSVlCSnplQVNxUFNnK2JpVXFLeEFOd3RzQzBS?=
 =?utf-8?B?NjF4TzBQODdZUEo2TXcvSUNoa24zeEhLZHVlUnJtdHFoYnNQejFmRnV3K2tj?=
 =?utf-8?B?K0MzTWI1Rk5rNWd5dzBTTjIvV1FmTXdwZklubGJQUTdSNUhkWkRFREQ2ZWlR?=
 =?utf-8?B?KzZNK0xXanFpOEhQV2h1N3pkeVQ4UlhIeGFzOFR2WE9LVXA0bzQvM040dGZX?=
 =?utf-8?B?R1cvNGhZcUh1NU43ajNDaVdRVURSSWRuSk5WZS9HcXVXUytOdWZQTkFocWtv?=
 =?utf-8?B?YlZoQTZ2ZE5XdnB1MU1BVG56M252OTF3QUFRMDgvOE1XVU5PZTMvQ1AxYWsz?=
 =?utf-8?B?SHIrQWV6emgyWkNITnNSbU1QeFpZc2lYWkpDUCtubC9hcElYN3c2dXRoVC84?=
 =?utf-8?B?TnhLYldsdmZlb1FxcEtkblRJQzJhL1dadGozM083T2VXL1dPdHBMRDR3emUy?=
 =?utf-8?B?V2J4Yjd5QXdWbU0vZTFucHdlcjc1RzdpNlA5czBrZ0ZRbzdqWFBEMWVhUHZ5?=
 =?utf-8?B?bXdYTjkzMTBPK2MxVXk2VU9rYW5aRUxiTXdCSm5pOHIxRkhWZmkwS1NNdFpK?=
 =?utf-8?B?RFV5Sm1VeTFvWFN4K3NhTy9hREdCMjd3dDRYUDJBVHV5eEhjT1V6b0dlODUw?=
 =?utf-8?B?NWVyQVBVS0k0bEtROUlPSVdqVlF4RHhtWDcvNFA5RmtVbVV2NUJmQmtIQXBT?=
 =?utf-8?B?bWwyRzlwOUN4MFhuMlVKb01VQ3MxUEtISmV5UVNmRG93R2pDMWZ1WGxNcEla?=
 =?utf-8?B?STd4S0YzcmtXdDZEQ0FEdUFINEZFNmlEcmlsckY4QXhTVHZXT2RwNWdyaXhi?=
 =?utf-8?B?clZ4UWpubHphaTZoSnN2L1FKOVV5TnA2Z0duTVZxYlJYV0plaHVBZ2N1OE1L?=
 =?utf-8?B?czE4SVgwd1VPWkphNnZVQUxqUldJb1N1U1FOSlM3VjRuQ25Ba2dTWjFHVUVK?=
 =?utf-8?B?d0d1RXFtRGlEaWhoMEM3U1lqYjc1Z0Eya0JJV3hhbWRDYis1M2VvNkNXa0M1?=
 =?utf-8?B?L2ZsNXlDTUE5bm12NFA2VXZNYk40NzdQMkV1dlBYdVNaMmZqb3g2N002VWFr?=
 =?utf-8?B?NzJtS0JWNy9hZ3pqOWNhYUtka2hFMjdCeE5YMlp1QWltZW8ydXIxclR6a0Mw?=
 =?utf-8?B?WTQ4RE8wK0gzamdSa2NPUmF6Q2YyUVJDUWF0TWU4NE9CV2szUkpkbW50NVhL?=
 =?utf-8?B?NDkybmI2RVM1alBUMUdGYTIzd0dRdmhwaVpIZ1gvY2dVdnRzNUJXdnA0OFFG?=
 =?utf-8?B?Slh0R3RlWng5UzJFUnlhTzMrbHBmcG5jUFJoeXBVSjk3ZWJzTTZMNUpOUjFR?=
 =?utf-8?B?YVJBaVA1RWpVUzgrMFJCdFdWU2FYcmJZRkg1aVFiMUxxZm9ld1A1Q0JKZk0w?=
 =?utf-8?B?N3RvSzIvaDE4YXFvbjFzb1hQT1ZTQ3RLdk1HY3JKek01VGViTFJuTkVEUi9Z?=
 =?utf-8?B?enZHZ3JFUnB0aHpvSG4zNlM2TWpJVDc0TElEYVFsZS8ycmRCZjgrWHpuSXBR?=
 =?utf-8?B?QjRoZkRweFhzeHhRY1J2NlZqa3BESHZIcWkwTVBnaThrQVhNOXAzV2J2d0dM?=
 =?utf-8?B?Z29Ma0JiREdYek1JQTBmZnNuYnBqRitzbzVGQUR2ekpBa0paRFJOeTVrbk0v?=
 =?utf-8?B?NElaN0tia2M1MnBLUXM3UEM5d1lYWElSWE1XVWNSNHl5bG4yQ3BjOTdmWGdm?=
 =?utf-8?B?b2VCMjhFU1RTRG9LbzJ3Ly9Pa2Nod0xGWVNXTmxnUnpDRUxheUU3RHdwYjlH?=
 =?utf-8?B?ekxBcVE2N2pFYzgwdS9YNlJIcmJtYkY1SisrUmVOb0Nzd2FISWQwOU84UnRL?=
 =?utf-8?B?NHQwVlBTK1RHSHBVNUMrVWY4T0piM2t4bUpraU1HejhhSDhndzVjYkVVTzBp?=
 =?utf-8?B?a0pVTkE4bk1RSFN2RmFJNi82Rk5zM0JmL3JsVTRpbkptd0t3OVQrcXpzWjh6?=
 =?utf-8?B?aWV5MkhOdmEyZDd2REpuQWJVUU4rUU00Y2Uxc0VjbmRSaWd0ZGc3UERMdDBt?=
 =?utf-8?Q?05ht1nYeBGpoTwTysq5mdx8xfD3P39Mr3OmHtlsAcmYEv?=
X-MS-Exchange-AntiSpam-MessageData-1: jMuRxzuZErD1hw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87884bf4-7ade-49d8-5f59-08dea731f4a6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 03:30:13.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDErghnXJbahvmjc/5rQieL0TVWyQlWINjS0Tu0KRH2hOrbjj7U5wmrUj8mfier4sPI6SqPhA/GFnvnpLucwmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8689
X-Rspamd-Queue-Id: 59D924A9ED3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-12969-lists,linux-kbuild=lfdr.de];
	SURBL_MULTI_FAIL(0.00)[Nvidia.com:query timed out,nvidia.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Fri May 1, 2026 at 12:22 AM JST, Joel Fernandes wrote:
>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> One comment below:
>
> On 4/30/2026 10:55 AM, Alexandre Courbot wrote:
>> Export `nova-core`'s Rust symbols so that other loadable modules,
>> particularly `nova-drm`, can resolve references to `nova-core` at
>> runtime.
>>=20
>> This is done by generating declarations and `EXPORT_SYMBOL_GPL()` calls
>> for Rust global text symbols using `nm` and compiling them into the
>> module as `nova_core_exports.o`.
>>=20
>> This is a workaround until the build system supports Rust cross-crate
>> dependencies natively.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/Makefile            | 22 +++++++++++++++++++++-
>>  drivers/gpu/nova-core/nova_core_exports.c | 11 +++++++++++
>>  2 files changed, 32 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Make=
file
>> index 1f794baadc86..f9aaf19f2477 100644
>> --- a/drivers/gpu/nova-core/Makefile
>> +++ b/drivers/gpu/nova-core/Makefile
>> @@ -2,4 +2,24 @@
>> =20
>>  obj-$(CONFIG_NOVA_CORE) +=3D nova-core.o
>> =20
>> -nova-core-y :=3D nova_core.o
>> +nova-core-y :=3D nova_core.o nova_core_exports.o
>> +
>> +# Export Rust symbols so dependent modules can use them at runtime.
>> +#
>> +# This is a workaround until the build system supports Rust cross-modul=
e
>> +# dependencies natively.
>> +# Kbuild uses Rust v0 mangling, whose symbols start with "_R".
>> +rust_exports =3D \
>> +	$(NM) -p --defined-only $(1) | \
>> +	awk '$$2 =3D=3D "T" && $$3 ~ /^_R/ { \
>> +		printf "extern void %s(void); EXPORT_SYMBOL_GPL(%s);\n", $$3, $$3 \
>> +	}'
>
> I am curious (in a fun way) how this (Or Miguel's later approach) will wo=
rk with
> generics. I don't think we have such use cases but suppose a module has a
> function foo<T> which is expected to be called externally outside the mod=
ule.
> Suppose the module itself does not call foo internally.
>
> How does the rust compiler know that this function can be called external=
ly if
> it resolves to no callers within the translation unit?
>
> Further, as a result, how does the above extern get emitted then if foo n=
ever
> ended up in the object?
>
> Probably Miguel's future infrastructure will address this? If so, probabl=
y the
> limitation of the above approach should be called out in the code comment=
s and
> commit message.

Short version: it should Just Work (c). The next patch of the series
generates the metadata of the `nova-core` crate, which contains the MIR
representation of all generic elements. If `nova-drm` needs to
monomorphize some generic code, it will do it from that representation -
thus an export of the symbol is not needed.

IIUC this is how inter-crate generics are handled in Rust, so this is
also the way the kernel is also expected to do.

