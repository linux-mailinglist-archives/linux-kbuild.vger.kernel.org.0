Return-Path: <linux-kbuild+bounces-12959-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAgQGIJu82m42gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12959-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 17:00:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B8D4A45AE
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 17:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5986A30ABD68
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 14:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32BB42EEDD;
	Thu, 30 Apr 2026 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="enLyhtUI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012045.outbound.protection.outlook.com [40.107.200.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728B3436342;
	Thu, 30 Apr 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560956; cv=fail; b=AV8yRuHTiGGGw89qmdvjSRWDPk68YHDr8bRbQ/pXEt4rRqYl1vFD71huj4nON+natz0mU2XxdoCu9sHxHlqfBvsYWU5bEPC5vEs6RTL+8XwKhl8/ohDXViMkIxpRHXwRV62Z9uFW4aifxJNioxO4U2rpEG/UAg4u14lLR0DHLho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560956; c=relaxed/simple;
	bh=Uxt+GqIcSKDVw+RQvwOqPZPnegqTe8V00QBulpNtPT0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ln9H0vN/WLDsCJJpyS8USPPwuA3w4pjzqsiwCwuwLRfcBYVNVk/VyMsViqf7cP/RrBuIz3Pktfm62EVuHiWvpHo232EhwGQO4mdDdXC4RhFalOV3FTR8jylLfLbjEKoA6Z2ZRDDtmjUugFcIROtkxy5kKWc5U7+H0bMO+NOGp74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=enLyhtUI; arc=fail smtp.client-ip=40.107.200.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=La57+S9sfHYKAag5IhnLbDPi0xzh3PRk+ev2cB2XMIYVAhSJp98INswsc4WBvv7kq+Ra78BRoP+fBLLACbQQ68xQ6D65rWclC7/x9SvDc0jYkdPsAA+WXmaaam0/9HUZxuyQBOtJ7hRpllbfGBIdwrNoHgqpqeSwjgjl0IWZsr5AjKuhDsPsDgQPQaSZBVSDvn5WveOGIznDxl7mfN8znw7BwilFNLsr1ceYygv5d4rV5Gs2FuPew5X11W2nM5mGRy1V5yrGfHVZDshUzPKgqYRTKqnId2OzV8jUSGpEVSzkJwylSjoInANfZb7sVyCOM+kAnqHdOl6SSbt6jGtsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2Ahv6EeVc7eCe+FjzpKvJwgAKFzOnlKqRYqT0NUQiw=;
 b=iltzRWcQLEGZjW9XZ6x/m/uQbt8nRamMNfqvCux6l4NqAeurvtACEhAgju1QZGnPDjxCeX9TXjE/9GFdfsLXQGg5xQUbIyOfHJZHsTZEoZ4BLvRL4uD4fefREtEq5S2aXi9hYwNCU5woyhCIsWr382Qnh4GPVlj5vNCxsj343EshP0wpv/VvWTu0OaTPEuxcphq+UnOafpEDcZh8MSftJfFm1xeLY/KxWvd98LYZFBaLGi3v25GVT/QBgcDOR3ClhXPMT8qjdJSlFodXPEd9w7+icvDrLpummGBRmoxOeweV8bMxCCQh2VKSWHLp24kh+YLvIPlF0own/3yAft70Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2Ahv6EeVc7eCe+FjzpKvJwgAKFzOnlKqRYqT0NUQiw=;
 b=enLyhtUIxMbYu8CjEtvsba/IB7anwH5Vae3EQDKj+mJfcIKvp3Y3t9Lu1+T7Tw17r2KXK5f97x6D1OR3b/K2EQBUCq72V7FLQq+ia6DHbitwIq555iCJen5Bb77YLPIjgb3Z3U6LKv/x/vBXn3jOv6UiqOWD2gSD5ioVyZEDUD8B+g3MxssGjCIlLwJF1UngeGZiDlp5T+uf3161fxilH8ZINSEkg4XobxO3afCjzuXgrPnQomQwCYIah3scyy/fe/j74qyKUkqPmP6G/PmzLUkRlwnwz31CVFn96Ugh4kJhSt/g94RCILsjsXfq7/Roc2/IGcjmK4ornvjA3UmGOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 14:55:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 14:55:44 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 30 Apr 2026 23:55:08 +0900
Subject: [PATCH 5/7] gpu: nova-core: emit Rust metadata for dependent
 modules
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nova-exports-v1-5-7ca31664e983@nvidia.com>
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
In-Reply-To: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d4d9a7-2b14-4d00-0dba-08dea6c88e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	q0+zKKJHzH/YXGz9D8ONckjZ1nJcSoTeO1Bo4q0xnPKcSPFEueBJI3uNZIKZ3pADLfS5ukZmnxdGd9oC7twFPked3gQd9PxBznVQJnqWtjH81Df/5YddJ27sFcr+DF1G34Jcm4wGWu+QzDP0xBrKzW+4ct+AUoKFkl65TJKhfDHaTTxtNaKaLn6oz0L5UR1Vz/iE3L15qY79EsUMEcBny4MQYpZQRuQjLpiFWyBXW3noyfKefs+AzUkX8qzPruS6LsbLwSBKUyybmpshqMEjnBW+dVGYb2XNX8y4b5FwJ9t9zbE+to1DHdxynV/2BN1/Wm7KQAdP2Dre+uPCCbcu47zpnv6mOkVOm+M8ZcQlOxO8V4tKC2926cfBP/nTC6rgfXKdfDwQZJ2ey/CpVnIUpwcf/2hdDOzr+UfvYEKRlp7MX0I3Z4u/vTbQZ0yti2CX51tjVdCtOMMKusmC0+xgyivZTV7nvRRUZxe9FgSMRoVYTgRtCyQh6QkDRgVwzCzLeSN+kc1FtKYq8zWsHEkZX0wYy7zu4mvX3Vji2EQs9JQQM2Pzfg6/pDvLxOXzeKnT9YLQIzee4HPdoGIOr+bdxqQiBoMR+3JppWbiZsNx35pPLZGaYUAWKoA9CvlS0Zven8AlMmF5z+asvwJt3nu0Nl5cVKg4b3CLKfFHWMZnj3XGKRjBYYjsloil11+gbfEOKKa7P7M/tdafY02YKabgTNzTwfiGlzEelkbQ8U7THu+zAns+5l/XsBL9jqa7o3H2v1jQiBPz7IRG2SDzGsZiIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUdQNUZEZXVzMkdRc1AvVTN2TG9YNStGNUZOd2didG1qREJ5alNDeTRzQUJr?=
 =?utf-8?B?ZnhZREFhZTdGamNIek4yZTRzK0FOaTJvRzFqNzlaUlYvM1lBYTN0ekRRTDE0?=
 =?utf-8?B?YzlEYW94STBMNzFtL3NIcEMrajlUYnZsT3ZkU2UwdUcrdFR0dFBCRjZWc21O?=
 =?utf-8?B?cXkrNDQzVUxsaG0yNGlxSmlCQzhuUmhmbDlmQ1R3SDEvalhUaGR5N0lmYmdS?=
 =?utf-8?B?VGt2eXNNenh2aU5sRzJWakZlYy9HTGNBYk1NOG0rN05hOVMxN0swaGFaNjVZ?=
 =?utf-8?B?K09uOGZNR0xjcUx3UnJnNzVRNlE3dHpZa0d4QmNXdkZDOVJYVTMwR2s4eXFr?=
 =?utf-8?B?M0djMjAwYU56QUJza2RGSCtPZEtJVExjd2xyaTNBMVhhRzhVRFRTSC9yemJa?=
 =?utf-8?B?Zy9XSE1oRHBlVnAraFVydE0rN0ppdVhVV1VKUTQ2THFpVVBwOTZQU2pUeXd3?=
 =?utf-8?B?QkRjbUptVHlxaDlNV3JsejZUZ24yN0E2NzMvV28xNVFvR0xtSUQ0MmxuTmdN?=
 =?utf-8?B?WGk3L2tLYmVuTGZsa3JsWTA3bk1xQUdza3ljbW40blhmQUVQNGVMbEZIOEwy?=
 =?utf-8?B?ZndocUtML2JNejVtOStpZk9YcnZoZXhVWjc2T3RodjBmKy8wd2I3NXBEOCt0?=
 =?utf-8?B?U3crOXY3RjQ1Z3Ixbm1uVzc0aGJGYlgybk9iZ0hINEE0dWE1Y3NRT0dzb2hm?=
 =?utf-8?B?U21KV2N1QVpnK2xySThVRTYyWDFucVlETC9VZXdpUGhEejJPQkIrdkJiUThM?=
 =?utf-8?B?SHNhdmd0MmREU09TOEpNQjFpWGlZc0pDZThJQUhsbnpEN2JCUGpKTC9PZjJS?=
 =?utf-8?B?Q1dFODFYZVBBV1FOK0hKTDZLWENEV2lEVTBhQmV2WFltVU8rTFJORmgrUkJV?=
 =?utf-8?B?ZXpMNHIvd3NBalpHbkJZYnBFb3FUcTRQOS9UQ21uY2dqOFZuc0t6L1BnblJa?=
 =?utf-8?B?ekxIK1dqLzRJZzc0ZWtCMXdIREk5endlSTF2cFJwYVlQU203Wk1MbFcyREMz?=
 =?utf-8?B?dTJuSWd4VUoxdC8yb0Z4a2ZWenBuamovd2dDcUxQR3c1VFhnL2ErYUxpbStq?=
 =?utf-8?B?Tm9HeVRxSzk0eFV0SW9xTTkrR2ZiUnNuL0g4TWxOTVQ1NXV2QlBVNEtUaDZ5?=
 =?utf-8?B?M1M3Mm9TdklqUTZqNEI5bmNRU3RSTFE1cWhxS3ZldHdNWER1aU9LUFVWSkln?=
 =?utf-8?B?Q25jNTlWSTdtSElsbnRKZnJodEpzbllZc0VzcUpza0c4aHY3ek5VRG5pR0t2?=
 =?utf-8?B?VlNyL3A1TDFPcWptdWx5Nmdpa0lDYVN0YjN6REd6MlVwNWZyaStlQU5PbDY2?=
 =?utf-8?B?VFZsNk4zSnZRZVZlVkVZclNYTU93OExNV2tuRVBsUVVTYSthZGcwTTc0aDlV?=
 =?utf-8?B?c3ZCMXlHNHFGMXc5Q0k3U0xoZTVaOUhNVW1LNy9teFFBc1BNYWVBK3RoMVA3?=
 =?utf-8?B?WHliSExOMXRPbWVVMmpaaHl3emp6M0RTRjlvQStBeTUyeDZXRUtuK3FRQ3RG?=
 =?utf-8?B?YllwTG02cVF0NlFkMWJJSkM1OFI3OTEwc003ajFZR3RvYUlhd2RYKzhaNGNZ?=
 =?utf-8?B?amdiaXdqa0NMN1VQN2FYWk9OcG02K1pKQ2ZvTUJvSlVJS0NUeGYrdkFrWVVn?=
 =?utf-8?B?Q3VFLy9aeWxUYUpqekJGcGVxUWtZNk5TQVhFbnBKdGZqcTB3U1NYcUkxY0dm?=
 =?utf-8?B?eFM1bDZuQ0dadlpXTUZOdUxDZ2RCSXh0SSs4MWp0SVorM3BOY01yajJzbjBL?=
 =?utf-8?B?NHh6RHNWSmxyS0tnUGMxYzcrZWtNazdsdEF2VWttZ0o0cjMxNEl0dzFDdEk1?=
 =?utf-8?B?WkFuY0hncFJWZW11YkdWWGNaT1hWNTZhSFVIZnVEVk4zWXBoTnhJQ1FYYWQ0?=
 =?utf-8?B?VDMxb2Zrek9rdzMyWmdGRlVhQm9RYXpDZXU5azRmb2hoVUtEUkd0V2VMbkpI?=
 =?utf-8?B?N013N29IY1RlN1A5SFFoQWprNlJ2aDZYL0crT1hNd0I2cWVDK29kTlNja3R2?=
 =?utf-8?B?RS93WjgwMURKaU5LTkd3TFpIdktrWUlLODdEZDFrWDdveWRNditDZEFQSy9R?=
 =?utf-8?B?cHNaUTlaRFdxTUxKOEhXL3JjSE1kR3RrNG1nR1VISVplUlNCSG5MTllvRGxP?=
 =?utf-8?B?NWRWYXc1aEpVOGxMWTVCL2I0dTJ4U3EyRXRUZHE0cHBIaTdsUzRuOGlKbVNW?=
 =?utf-8?B?VS9vbFZwNXd3cUZURG5YN0pzY3ZGWmNJalFCTVBhTXROYUVBdTFrNCsrbkhN?=
 =?utf-8?B?QkNxVDlYaG1HUVVDN2RLZkQ0eHIzQ1hGWERML2Zoak9HVjZZYSsvYU1PK3Zp?=
 =?utf-8?B?Q1R6VTJGYmN1ZjNiYVFNWWhndFo3ZGp3WHJjcC9WazI3UFNUeXJ1NUkyUkFS?=
 =?utf-8?Q?b2O3PLWndslHdBeI1LzSoll+Eshax0H9orzTNeJMa5ERQ?=
X-MS-Exchange-AntiSpam-MessageData-1: SUj8FZT238+YCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d4d9a7-2b14-4d00-0dba-08dea6c88e35
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:55:44.4069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reipCKgPfL4tsJzFzzZlWk8qpO0YbU1LJ3ZM6ILi635jRhCX6/hO/EzODKfwMT7m5QVa6kOP3aRSsRe+z/bSFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-Rspamd-Queue-Id: E9B8D4A45AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-12959-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Emit nova-core's `.rmeta` crate metadata so dependent Rust modules can
resolve nova-core's types and functions via `--extern`.

The metadata is exposed as an explicit Kbuild target instead of relying
on an untracked side effect of the object build. This lets dependent
modules ask for the metadata directly, including single-target builds
where `nova-core`'s object may already be up to date.

This is a workaround until the build system supports Rust cross-crate
dependencies natively.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/Makefile | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
index f9aaf19f2477..fea6d5c68cd6 100644
--- a/drivers/gpu/nova-core/Makefile
+++ b/drivers/gpu/nova-core/Makefile
@@ -23,3 +23,27 @@ $(obj)/exports_nova_core_generated.h: $(obj)/nova_core.o FORCE
 	$(call filechk,nova_core_exports)
 
 $(obj)/nova_core_exports.o: $(obj)/exports_nova_core_generated.h
+
+# Dependent Rust drivers need `nova-core`'s crate metadata.
+# Expose it as an explicit target so they can request it directly.
+nova_core_rmeta := libnova_core.rmeta
+nova_core_rmeta_private := .nova_core_rmeta/$(nova_core_rmeta)
+targets += $(nova_core_rmeta) $(nova_core_rmeta_private)
+
+# Build in a private directory to avoid racing with `nova_core.o` on rustc's
+# intermediate object names during parallel builds.
+quiet_cmd_rustc_rmeta_rs = RUSTC RMETA $@
+      cmd_rustc_rmeta_rs = mkdir -p $(dir $@); \
+		$(rust_common_cmd) --emit=metadata=$@ \
+		--emit=obj=$(basename $@).o $<; \
+		rm -f $(basename $@).o
+
+$(obj)/$(nova_core_rmeta_private): private __modname := nova-core
+$(obj)/$(nova_core_rmeta_private): private part-of-builtin := $(if $(filter y,$(CONFIG_NOVA_CORE)),y)
+$(obj)/$(nova_core_rmeta_private): private part-of-module := $(if $(filter m,$(CONFIG_NOVA_CORE)),y)
+$(obj)/$(nova_core_rmeta_private): $(obj)/nova_core.rs FORCE
+	+$(call if_changed_dep,rustc_rmeta_rs)
+
+# Keep the metadata available at a stable path for consumers.
+$(obj)/$(nova_core_rmeta): $(obj)/$(nova_core_rmeta_private) FORCE
+	$(call if_changed,copy)

-- 
2.54.0


