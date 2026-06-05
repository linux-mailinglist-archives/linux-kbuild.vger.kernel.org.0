Return-Path: <linux-kbuild+bounces-13579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O8x1Bc6JImqHZwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13579-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:33:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D25E96466C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=bWIYes8q;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13579-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13579-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC778301093C
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 08:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831523CFF5C;
	Fri,  5 Jun 2026 08:32:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A11C3CE483;
	Fri,  5 Jun 2026 08:32:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648340; cv=fail; b=pj0mMJVfhUyU4QCya8+7MbYfAZ5fGeDQNBcUYip8zs0M40hIZBgbIoBIuBBhKA5+eiWMywhuG3m2Be31M40og53+wn1+n4lYe6nEYpRP8+QPtjxPnJ7Lref32d7EMcpAsE8qx7sgB15kNbyg7xX3UUvUGiKb8j608HmzfqX5Y1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648340; c=relaxed/simple;
	bh=nF7nrByj3qTAPVZUS05j9hKMvom3cuVj91I2BItOOKA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=awxxTYaqMkWDv8WLp4Sveslws7wmQpEWEl5mpF/Jgxw++oRFzydt9HcfoLV/bKLqvBga3a0DMtNo1f/JTLonkGzcac587TLCy0KuP5z3MEuCdVBqr/bYro5c9KZWWL5/elNlipqnvVtzkESD9rENdjmN2IwE5cxywr2FijGL9ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bWIYes8q; arc=fail smtp.client-ip=40.93.198.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txci0+sTh3uMZErEAUEX/bORxew9zuTH7+xlnELJHzDCpSnsYIi9m8ooZ72TkIPtToEkMj3ZEwj5pXg5NR3u+jG92avwir2p48ICbr2ZrlEHIMilYu3Y89E+zUISbkrFllsLZp4p4HjMo7bLRHQqoOVC4/PvJ1gyEjPmU7tWUJuLw4QJdf0jyiei5jLDtZMhh0vexnVqK9sScAhUjjaxsU4a4g+o02qEB7ALjvWZtbGce9rJv/hQuxtYRGADnIBEZYL2EUjM91845rInPykCYrNJ1sJOR0s/qOo/+7rUt0oalqukAGbgtEdWRQxOwG/LeiPukPMxkaW4Bl0XKtPstg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIn5VwGxGy09L/Xx3FjIGfKAe5WTC8u+uQT1rg5JEaQ=;
 b=VqmjMagIcDv58HyKlT0VG80XKNKBkXSgx6TX3/04X+QYIVadDVKbZC6wxIKeHuOrqimW7t/9QZ7zc6VC+rjzBefhHoUEs7jvSfEmRRxLPXU3kTRNgLAZd12/1teptpg/DJ3Ws+D07I49379ahKwSvs6UFWXqnw+A/Uqkc3r6yuAApyyQrMSJtF8S+IcEi6xyc5+VtKhNx9acS4D77E4lnBGMUxRE2pavJ8kHN2uwPK+KIZydkk5bSFvSXuwiVdfYF9Ow9x1Se5szzpWiUbR6sJzU558Wqp94W2jCRQU7v5s+pbHTNFYmHqT25kEPr887SbOi6RAsDoKGuLBnUnq/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIn5VwGxGy09L/Xx3FjIGfKAe5WTC8u+uQT1rg5JEaQ=;
 b=bWIYes8qWbCsX6SOqDn/EkKsIck0eZGWh0WAoMEPtS6Nu2xOkYgBAlY7fdfi8v4WL5vipinHCfI663ASp6NPaZkQ4nbwruXitXB42Enpq//aR4XC13k1Ut2hCglJZlK8vckQGuFEj0n6Fo/wuGljsmQl0ctxFgSGstzAZjB2fh0RPK1osbvymHfW/QLZJ/H8Dqq759kbFwMshAfibOI2sbpnoRurYlRWVi5a9jrrQhynkp8ZOVxVvImHjiTdEdA58WiJMLhBRUsHdxMmc0iyDJSJAcODxSVM/lIAVmhfdrIRV41g0fZYqmgve8zSrAEimvYWUXO8wQIBmjquUThuWQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:32:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:32:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 05 Jun 2026 17:31:51 +0900
Subject: [PATCH v4 1/6] rust: inline some init methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-nova-exports-v4-1-e948c287407c@nvidia.com>
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0193.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: a3785ff6-30ff-4eed-5f23-08dec2dcf04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|366016|1800799024|376014|6133799003|921020|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	VnJ22tDSwfUI15poIcmv2GDMGa9QaJFwhngGSzgzQt2juZ4rQW3NSV7qV7jeoLy0jgQqJWWuxSV08PISD+XxYIG00y1IRDs0a4D82ax52MXssYKY1fO4TXV5rZl3N2OT1TIXkZHbNyuHTqTg6CXRunhKu54gc+KMb5QgNG1zNOm2l5KTtL/6XEdmJzK5K0R35qhdRhCnqRBVu0LLCB2r3EVsPPirFLFZDYZgFOLaVTyHUnolk/oAUtKRYtKQ3+LcvFgKK1/hy7225k3ID/2Dg/oWgjoBVAsqupr4lPU1tbJVZiOV0XFriG7dpzXuzn+jYMkyG5sZ2rOs2q4SYMnxlO6anPvQzeRzdfM4ekJLehM4FFMYTfHwHmmGOYZGEV2/9eWeN1Si2daVZNB4N9KASjfZ3TFKjmRciatvn49CyEVULTLqjR6luAss9QLS4DBvyxCMf5xoU1IsknuD5OPWhZ4ewz4Ezw4H0Qo+fK21x4Z5iQUO5Y8o+3YrJKDkfz6RMSQ94NKGd9kxIhrZocsOT44tERwbdYAJjeHA6cX1e9J2drel3YTFmhtMAsFNw/t0I9a5mSDiZl4Hu982qhFDCd8+wA3NffR+44aXH1ZM8qwnR5V2IMOJyywx8f0NNXuseJP61NF29Wtkzhij4z5ZnwQI77Tk/Uw+hzACyQufTlShrhvK1p4gMWuvC+RWQQ/VqvjGOLiV/WjZuyHV64BJ2oj+wJP0L3D7ll44sXhhCZg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(1800799024)(376014)(6133799003)(921020)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU5MUEROUGhCc2g0b3QyVGtvN1ZoL3NLclgrMzJGaktZc24wbjJ2Z1ZhY0Mv?=
 =?utf-8?B?ZmJmeWV4R3ppOGtYR1h6TTBTYjRnMDZtRFcwNGFMQXVkN1NKZy9IV1pXYkpK?=
 =?utf-8?B?RXdaenlKUVB5RFZxUXZHVFJHaVVNUktpekk2dTJoanY1dkhyZTFaSHBJclR3?=
 =?utf-8?B?aGhmbTc2VERzbkVxMGNib2liV0ZHOTdkbmZBb3FuZWFzeWsrTkFkazRQTURK?=
 =?utf-8?B?ZmsvYnM3OXhmcU1TVTZGRWJuZjdjR3dDbXNlRXpFYWhuUEdDUXpRRVFBMHAx?=
 =?utf-8?B?ZnUzSm91T05yU2RsUXdzZzFUenRwMWw5RitWSXYzb2NOcVpvQ2dFV3ZObnht?=
 =?utf-8?B?elhpWWVnakJoMFJSci8yL1ZBd2dMMnJvdE92QmxKeCthVm8zVGlHMy9vaEpC?=
 =?utf-8?B?ME02V0FuOXdOcnVaZllmczNKalEwV2sxc1NaL0FVWTNLaW1XS2hEcTBLN1Fr?=
 =?utf-8?B?b01BRC8zSlcwUDlnOHZWZnlVVGJXSEFQWVdTei9FanM5MWpNRUxxZzc2TXgy?=
 =?utf-8?B?YWlhNDgrOEpkcnNrdDBTY3BESFVpY2Z3WTVKWlNMU3RGenA0UGFMS0poUEhL?=
 =?utf-8?B?MFMzUHZyVkg3SzV1SVpidVlhUzU3R3ozcjduWWZlck52VTEwT1BFNDVwVHFi?=
 =?utf-8?B?aG1jQTBNSEU3dWxad1hkSlptL3B2VkhJdGYrTisxSG9yMDREcHdaRUZWYWEz?=
 =?utf-8?B?bmY2L2hZSVJUWkxWL0ozNjh4Y2VTSlBSVFRZc2d1WXlVSHV2OXhmZ0FaZXJ0?=
 =?utf-8?B?em5KZlZDc2hleWRabDIzd1p2U3lXc1JpR1kvVzRlMG5KcFI2QzZjZkJLREhN?=
 =?utf-8?B?djlGQmg2bHgrb3pGeHlwcUhkanluM3l2am9vazdxQ0JWaUROaWloa0x4VUtx?=
 =?utf-8?B?UXF1RkIzS0dNNWhjY2NBQm9pOUV3ZmRRdGRlTEo4ZVZRTW04cWQzTXdwamQ1?=
 =?utf-8?B?UDJDQVcxSjlDMHBpVm1Rek1WcWU2UlRLendUMWRaeVNwOXVPeC94Z01wZnhF?=
 =?utf-8?B?Qm9sU2djYysrcnBFRThtNUJ6VlhNSVZ1SnZXajhraFJEN0k0SkUrVlZJQzlY?=
 =?utf-8?B?anNBWGM3aXp3TnN4Mk5xVTQ2MUcwZkN1VDhlb0wyWTc0TVVCY3JkU1F5dmFm?=
 =?utf-8?B?ZVpVTUJ6TzdRblg5TEc4YTdwdmlJUmtIWW5uaXZka2tVR2hHYUdwWWYrcUVn?=
 =?utf-8?B?TUVzZ3AvNzZIMGc3clNjaEd1TGZKQ21CSThkMm5UeFRjL003dVpQdXdManF2?=
 =?utf-8?B?OVVPSjA4MVJqTjdHQU4zNWlWZXlxeXAwaEcxeS9BR2ZnMzhFcURLWVorZmJz?=
 =?utf-8?B?SlBRbXcvQzd0NFBrK2R3Yi9OR3hMakVQdVJaOXZNK1E4TE85a0JobHRJQVcx?=
 =?utf-8?B?SXh2UGEveFhQSDlQRlhlN25hZ3B1aE04MzNOa3Q4WHAvZExORGExOUdJRHBE?=
 =?utf-8?B?VkQ5b3JDb1hSb2xOZ3ZXdkk4dlA2ZVpCYnlQRFpGZ0xRSDRCMFhEMENHK01N?=
 =?utf-8?B?REF0d3N2RHpnSVZCcFpzZUJjRXp6eTZKQVZLYUI0UGZpajlIRkVnV0xTTGJn?=
 =?utf-8?B?NlZXUVpvRVJNY0xVaEtlOERCTFdJQ0ZOZHFFWGRzSkRPZUF3blB0SzZWSElJ?=
 =?utf-8?B?SGkyRXJYQmRqRVlWejNOUmJvcXpRTVpBWW8vSXBSUFROZXVBOFNFZE0zMkhC?=
 =?utf-8?B?WGE3MTVYRUVjblhFNXhQWWFwSGhQN3I3YVBjcFlqdGh6aitZTXVMT29UOHdq?=
 =?utf-8?B?QTFwRTBoeEF2ZkpVeWlpRW5hRksvbU1LYmxlV21CcW9pUlliOG1jRHBOR0k4?=
 =?utf-8?B?Y256TVpLU201Y3czNjdKVnlMVzVkZmZheUV2ZzQ0T1FMOGdTak5vdHpEemZS?=
 =?utf-8?B?V0N3YmNiT2sweEJ3elZBNXJKMzFrZFgzV3UrRDBIWEtEdVVoMCtXOWNsV1lv?=
 =?utf-8?B?bTNPUGJ4YUdCeFFwWWpEQ3R0TUdUd1lzKzZoL09RZStjWGErU1RzRCtOUHFs?=
 =?utf-8?B?S0UzTzFRa0dkeStna2lveThXU2ZTSzYvOXMxVFh0bmJZMDFBTk10OEFqUzBV?=
 =?utf-8?B?WHVJOUtXYlN6d1ltYmtzc1IzWUkvVkVNcXhyR0V4bXV0ODRJTGVhUjdNQTZi?=
 =?utf-8?B?MVBzUlpVem5JbURTT2VFN0VnU0tlcmI3NnhmbUE1RTh0TXEvSU1CTDhrWFAw?=
 =?utf-8?B?OGtJdzVyWEFEU3ZRVXhNaHI4dEROaVE4MzNCVWVDVmRiYmpyZHcwaW85Kzcy?=
 =?utf-8?B?U1RuZmpLWmZ2NmZ3NDV3NURIQWcydmlHZytQdVcvNDNKYTJVM1UvVDJzTk9Y?=
 =?utf-8?B?Z2ErbXdVL2dmV2p4R2FzOG91OFZsRDUvdTRFQmZrTFUxU3hjWElUZEpoZnM2?=
 =?utf-8?Q?VItgaGc4gMh5KH+iljfK5ZivdBJMPqK0vL2sGjc89coEH?=
X-MS-Exchange-AntiSpam-MessageData-1: z4ZXyRI0DMlxUg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3785ff6-30ff-4eed-5f23-08dec2dcf04a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:32:11.4686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dZ5i0aOouJQx2XT/EuHpMB46ZTY231jY4iikxAiojDjwjAtTN0bRqA5n2dn2r1v9iwAj4uFXfNNGbeCE6U/zw==
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
	TAGGED_FROM(0.00)[bounces-13579-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,garyguo.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:from_mime,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D25E96466C4

These methods should be inlined for optimization reasons. Failure to do
so can also produce symbol names larger than what `modpost` or `objtool`
can handle.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/alloc/kbox.rs | 2 ++
 rust/kernel/init.rs       | 2 ++
 rust/kernel/sync/arc.rs   | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 2f8c16473c2c..1264a8118aca 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -433,6 +433,7 @@ impl<T, A> InPlaceWrite<T> for Box<MaybeUninit<T>, A>
 {
     type Initialized = Box<T, A>;
 
+    #[inline]
     fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
@@ -442,6 +443,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E
         Ok(unsafe { Box::assume_init(self) })
     }
 
+    #[inline]
     fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Initialized>, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 7a0d4559d7b5..05a12e869a57 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -151,6 +151,7 @@ fn try_pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> Result<Self::Pinne
     /// type.
     ///
     /// If `T: !Unpin` it will not be able to move afterwards.
+    #[inline]
     fn pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> error::Result<Self::PinnedSelf>
     where
         Error: From<E>,
@@ -168,6 +169,7 @@ fn try_init<E>(init: impl Init<T, E>, flags: Flags) -> Result<Self, E>
         E: From<AllocError>;
 
     /// Use the given initializer to in-place initialize a `T`.
+    #[inline]
     fn init<E>(init: impl Init<T, E>, flags: Flags) -> error::Result<Self>
     where
         Error: From<E>,
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 18d6c0d62ce0..feca07e8d13d 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -712,6 +712,7 @@ fn try_init<E>(init: impl Init<T, E>, flags: Flags) -> Result<Self, E>
 impl<T> InPlaceWrite<T> for UniqueArc<MaybeUninit<T>> {
     type Initialized = UniqueArc<T>;
 
+    #[inline]
     fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
@@ -721,6 +722,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E
         Ok(unsafe { self.assume_init() })
     }
 
+    #[inline]
     fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Initialized>, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
@@ -782,6 +784,7 @@ pub unsafe fn assume_init(self) -> UniqueArc<T> {
     }
 
     /// Initialize `self` using the given initializer.
+    #[inline]
     pub fn init_with<E>(mut self, init: impl Init<T, E>) -> core::result::Result<UniqueArc<T>, E> {
         // SAFETY: The supplied pointer is valid for initialization.
         match unsafe { init.__init(self.as_mut_ptr()) } {
@@ -792,6 +795,7 @@ pub fn init_with<E>(mut self, init: impl Init<T, E>) -> core::result::Result<Uni
     }
 
     /// Pin-initialize `self` using the given pin-initializer.
+    #[inline]
     pub fn pin_init_with<E>(
         mut self,
         init: impl PinInit<T, E>,

-- 
2.54.0


