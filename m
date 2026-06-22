Return-Path: <linux-kbuild+bounces-13848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UovsHyI5OWpiowcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13848-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:31:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FEC6AFE07
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:31:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=LP0Uwo0P;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13848-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13848-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E87D3016676
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 13:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEBA3B6BE3;
	Mon, 22 Jun 2026 13:30:47 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3C3B47CA;
	Mon, 22 Jun 2026 13:30:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135046; cv=fail; b=pgWb6OjkCckC6XmRDifKB4/7uqyl4x73JcU2B+aWXQjaR3VbZatAnNLZAURZQ3B1l389KOTgf4NPeQUjQY0nmR70hsWzg6WEygFrAWMTrT7UkChG+IM7YHItF69B+9iAh8s1sdZ50aVrXTS8QEY/jDbXTRDXbRIMkXX1ppaNhEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135046; c=relaxed/simple;
	bh=vSMj09+NloeYiHJdlCwGkHAXUCZaXweedrTYrGK/Zpw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=guNqE97u8Jk5guZJrGkapQ1zoJ0yJ/Ie1x+N+mYPUD47S66PgWwR8Yl3j61ebhbqmHuBiGDRT8+X7VpVzQT6L2S4q8u1UIK5w60OT77/+nnCgOLBf8Bmp593O1UslN8CuplDu2uy6s9rvZkJlJ52w+2o160q7NbFhe4KL0GqH68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LP0Uwo0P; arc=fail smtp.client-ip=52.101.61.69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuS2YIw71IHAjCOJ3V70NO/DMajMM2UEXXwoxxWUbSZDhlrnWAQ/xGlM9ngWM832awibNMR2xUM6Zbu0/L7i/5JJ5x5qUCzLd/cs/c4C9ttQvkOcPukWRxEIyxr9Ot3wYanrI305YxexP0t34B+Alt5xvffP5lUZ+7+p1fOLQh3A0JhvcaOOwmVGFOiUxfv1Z6RdS9P61zIIhOEx5keI6hWsUGu2baY1x8fl9QF0xoppjn2f3WVHFzjXZs6ciqZ5Csq4nO/VIUzzj7XCCFxH3gQrrPOdwV35NTICvThAhIuczEsFA0hzBm4gb0y0nOfLrqjqPjsU/OVVp5tQXDXwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mm5NwQxrnE+1yp+RyGIC/SW5X6KbCtJzUfenahQYqlA=;
 b=Gn0jN5TR7Cm0C12RC+o8TpDjG/3AqozI2ZxV6PKNDMVXen+7w3PnDQhgcLM/SJBbR3kCZWq0J71PknajNHtVGJFdhgwe2XPUxCj+Nk5wGLrcCb3RmHqoHPFQk57QGpOqjRotW/oxVVrHPhMmCy7NjQsa1ZOLY75MmMzVkgFv2X2vfaZVfBL03oCOXRDGR5vJoAggk7YW7am1CskSwEiaIbNmUeaXMrqXvOrBcLLp1BOWoRIHfeqYY0mB42zJlDHrSFOp1IIdVrqVs2t552iYbFQIJcZDyDb5ozHBfBJQEGzshGRQN3RXRZ/bpJPNZuiHSVUkV+3zUk/PelFRU9vv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm5NwQxrnE+1yp+RyGIC/SW5X6KbCtJzUfenahQYqlA=;
 b=LP0Uwo0PCo4axIc+LHZc18ynP+GL7UW/LJr0iNbp58wmCqnRtbZKaWejcehk9H36QZ68tGx8qqUCSAxxwVBbLbWaxlrSdmGAiOZv9C/LKJQhkA635yrd0s0a1kh0gVFbLQ6bZA7MO45GEBgNaYL1iUInQKcdefjX5TB3EnoDNu1IImA9O/7cRGtGDX76FfxP7ZYiWUT6u8o0YrhpfMw24SOras7AVrr+sSit4J3GgGbwL8nvzKwFh7iygKmgT9xzXmxbsle0Bm0cjSb6Szznnen1LqjR1UdKyTllLtvvKc8zYAcS8N88V+JKoiEP75HrQBoAhWFwg11FZSXUFtoPgw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9774.namprd12.prod.outlook.com (2603:10b6:8:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 13:30:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:30:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 0/5] gpu: drm: nova: enable calling into nova-core
Date: Mon, 22 Jun 2026 22:30:06 +0900
Message-Id: <20260622-nova-exports-v5-0-6191773fc977@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBAF4KuQrq0p/aWuvIdxUcsgNZGSFhuN4
 e4WXaAQly/zvjdPFCE4iGhXPFGA5KLzXQ5iUyDbmu4M2NU5I0qoJJwR3PlkMNx7H4aIBaGN1tI
 KY04okz5A4+7vucPxk+PtdAE7TBtTo3Vx8OHx/pfKqfdnOpWYYGUNK6XkoCu275Krndlaf0XTd
 qKzFlQtNM2ayBq4FULWQqw0+9Kr3yzrMt+MYUxDo1aazzr7heZZg+aVpZXiRNkfPY7jC9PX0JR
 1AQAA
X-Change-ID: 20260430-nova-exports-502f996c5aab
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
X-ClientProxiedBy: TY4PR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:405:370::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: 573c363b-93ac-448b-fa36-08ded0626ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|10070799003|376014|366016|1800799024|921020|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ljBmVLzH5t43+Qtm6kS8OUJm03U2eY4XH9znYRaWTv6uV9gpecUAt7FZ7DtzUNrQjgyGMt1uCp9K4CwhjQiuc+a+BtB2z4vhI6RkZ4+oLQJ2O78+6CAA33Sbhi52JjOPhXwNP0PSbz77NQmfnglpbVjm+z4/VFyf23IFNPH5kD4dpidtPMk+15hNfz6KvubkWzHNTuUa1qmXvCJdmmtCjZI7r/VZDKUhRhl9VtInkQUo/CPenNELXoLOBokPRO4dt5fnuYX+Im0Ol79431tY5dyvlMxuWyaunR42RqE/4dvMN+W+zdAP1k20uSXDzdc7ES56bP09qjX9OBgW4lA9jSzP0qlX+RHntoxV8Qd4ILlr6RT9REHeqOK082Jt5EKYldLRNXNWQ/yqjmfVnQRP61a7WIw7I48CcjK0zfH4cZWYuFr7OlzFZgHbrLVqgHAChlRpzxBF18BAfyaqmQAGiEsB8+BSh845moZuYJXqE0ky3GTGM4dpPHOiCvJHo6aKT9k9qvTJ/41j7ZN4VMb0YovEn/HpH+MPS7pj/AU8AvF6EPL43WqqjsMmwEu+IG2XuWJBV+2bWeF8OogzbO0e5+awYnos0qbMCnGMKduRZ0xh3MF6TH1ySyWWE9+B0fYpT4Dh4X73nb49SzTWtuGZdbV74E3qbQm2uC0qPWR3KwRjsEDBZ/36067aif2ZmzZ4ZuRHGzWn4p1XhSexdX9AHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(10070799003)(376014)(366016)(1800799024)(921020)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW84dlBVMjFxTzZPbDhZSVFSQVJjeWdWTVR1T21KakZ2SS9PZjRHa2JpTXlH?=
 =?utf-8?B?VjFqOFZ0dWJVQ2NXS0VsYnJlOVkrN0Q5SlNEVTI4aHdLcVZ3c1RxWjVxcUpl?=
 =?utf-8?B?MTdjZEN6S3U2bVdSRVMvRStvNFlGS0NFVU1oS042bXJpWWVqQnNaUGRoVGNa?=
 =?utf-8?B?dENKb3BoQStJd3g4dTh5ZWd4eExOeDA3WUI5NmtPVC9TUllPTVRzMzdySTZ1?=
 =?utf-8?B?SVk3S3RMZ011OTd2akphYW4xdW41c201MTFjU1BVVmtxb2Q0eVo1eitRZWdS?=
 =?utf-8?B?ZHh3Tndzb3cyc08xaDRQYjdCMXpVeHB3bHQweE9keUdWRTB1UEtYaldwOUZY?=
 =?utf-8?B?L3d5M1dFNTdDa2tqZ3hxRU9VQk5EQ3VrOTk3USt4dllRSGthV3QwWHcrM21D?=
 =?utf-8?B?L1JHTlNUMDlBNHZSN1Z3Uk9mdm1pMnhJaTRuZ0VuMVFLcGxGTG04ZzcrYTVV?=
 =?utf-8?B?Y3l5M2NmZDlkK1NmTWRFUXZOZG5LNEJpRlhyWGxIMUE2WVRaWUhaV2hNMkpC?=
 =?utf-8?B?dUljQk9CM2w0eG1haVRHQkt1U2M0dUZCN2ZMK09GWW1UMnZxRlM4UG1vemRq?=
 =?utf-8?B?cXljTlo4T29BeUlwQy9WYXNiSUU4MUFCSE5iOGlaejFOQjJ2K1pVMFpHSm1I?=
 =?utf-8?B?NEVmN3QzeWZ5M0U3dWlSTExLZjIvc2VOMnZhV0VCSGErWTQ5SGRURnBsTlEw?=
 =?utf-8?B?bmNUZUFURWt3S3IyRWVyZHhWSFdOcGxEaTlQUThDUFlaNDN4WWJwczlRakdC?=
 =?utf-8?B?VTNLNWxIUkRsbnhBTEw5T3lqb0Ruc0prM1JINnNwRExIY1dYQVhkczhoN1JO?=
 =?utf-8?B?N3dHdHZ4SGRzTkI0MVJZNURwNEErdncydW9hamt2ZVdWS2ZZRlpNeWhzeVF3?=
 =?utf-8?B?Zm56bDl0aUVGQ0VlV1VMM3ZpYjB2dkhUY3pSS2xjK29CWmRtQjljaU5OU2Vo?=
 =?utf-8?B?WVNLNmxPZVVCVWxEejBLNm1OMFlRaVFaWnpuc2E2Zzc3YU9oL2I5QzQwS0Q5?=
 =?utf-8?B?ZnhWNlMxaEoxN2IrUlNqVjA4eUZjR1hHNEtyZE40c3J3VnRGOWpHOXpPbFBQ?=
 =?utf-8?B?MEJ1Z01kcHdQWDMxZW0zTW9laDltQWhmeXJPRDJaWWNGZXZaTjlvTHpZSUNq?=
 =?utf-8?B?THRQQXhDcUdrQVNWaElXeWh4ZzJjR0FuM1pzUVlUNEdRWlpNOWtCdXFHbEIz?=
 =?utf-8?B?bWh4bzFwbmxhWENHQ0R1NmdtclkzcEhhc2ZZN2Y0Q0V2cys0RmlsWWY3MHAz?=
 =?utf-8?B?VDlyNGl1dm1PdnZWemdTbzBpZ245dmUrOVR6WGNoUUdMd1FrbU1pYXdZZGFj?=
 =?utf-8?B?Sm9ibzJhdHgxeFpGLzk5dWFmUHZFMmJWSGNobFBSblpaMk9EVk9XdHV6SlZB?=
 =?utf-8?B?cDYybG9hdFNWT3JTVGxwc2lpbzR0VTFta3BFdTc0bHJwTEFIZXRoaUtwZ3pQ?=
 =?utf-8?B?WFJPcE5ZNzFrODVsV3BOdGtTSC9hdXVyWXVpM3kxU2hTbFhzNWpNL1dHbVJI?=
 =?utf-8?B?Sy9jRFIwbXRqMWRCd0dIeCtjODdRRllNRUNpa2t0b0JMcTAyNGZyT2cvTCt5?=
 =?utf-8?B?ck4rT2h6bzBDQjA4eW1QRjVVSmhna2xaU0ZrNE1LZTVDK3hubkxGUy8rM0V6?=
 =?utf-8?B?YktKNUxtWU9hUjBOMXpVcFplZW04aWZvRGZhRmFxbmZOS2tEcmJLellVUVV5?=
 =?utf-8?B?aW8yYUFtZEcrU2dmUlNLTDFtam9FVWdWeEVuNVk5OGNaaEtmSHJoYmc2NWR4?=
 =?utf-8?B?Z1ZPaXhMdy92dVlLNkZzYzRIWDB5TUNuaEdSR1JhTklUL1VYYVpNNXg1TlRM?=
 =?utf-8?B?THBadHNUb1NZT2pqVHpnazhCcGtpZjNuTGdpaDhtbW1UdHU0QndSU3ZXUC9x?=
 =?utf-8?B?SU55NGF6YVl1QTFSVGV1R3U4R2ErQyt4RkYzQytRNE8rMVpENXUwazg5K2Y3?=
 =?utf-8?B?dUJRbzhmOGQxSEZXaGw3LzdkdHI3SkFSTjlrQjlHWDVDOGRZbzdQZVk0NXAw?=
 =?utf-8?B?a0lwRUppRERZbVBtalpPSkx6OU44MHg0OFBjYit4VitacUd3RU41Vm9hRnN5?=
 =?utf-8?B?cllCNHNxNWRUQXlSeDlnSFdPUGwyK3VFeXVxd1p6YjZhQjZnZVJBRVp2MUJN?=
 =?utf-8?B?eHdleWxSUDd1bVRIYnQrMFN5dDBrTHQ5THF0blk4RzNGcjIvZ3EwbGd6N1V2?=
 =?utf-8?B?VXBlQzlZOEJCZU50M3R5bnFrL3RjM0hmNjcrRU8rM1lEczZrSm1Ody9rdW9a?=
 =?utf-8?B?MTZyTEEwVnVsNmNMZ2cvNXRyV2Y0TnZGT0ZhbWpzQjREUTdIeVlRTlJpaDNv?=
 =?utf-8?B?N0xlaWI2MVo2REtqOUswWHlTZmdTV3dvMWlmU2F4c1BobXBma2lBMm50eUpG?=
 =?utf-8?Q?ZXyBqaiY85UOXM9u6VY7GVmlSNc/KfsiarK1cZiaC7iTF?=
X-MS-Exchange-AntiSpam-MessageData-1: cXXxW4PfCYgXLw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573c363b-93ac-448b-fa36-08ded0626ff9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:30:33.9928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mbvdS3sQGtWt3N95rDgG9/nbNA2I3ToWH0I9OFXEEIa0hO2QMws2Pl9X4WbilpfbUuVR+Oj6rcgs5XN5yVAHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9774
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13848-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:acourbot@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33FEC6AFE07

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

The biggest difference since the previous revision is a fix for an issue
raised by Sashiko: with `CONFIG_MODVERSIONS`/`CONFIG_GENDWARFKSYMS`,
Kbuild would compute symbol CRCs from the generated
`nova_core_exports.o` C shim, whose declarations type every exported
Rust symbol as `extern int`. This makes the CRCs describe the shim
declarations rather than the actual Rust definitions, defeating
modversion checks for these exports.

The fix is to run `gendwarfksyms` on `nova_core.o`, so symbol versions
are derived from the Rust DWARF.

Also, the list of exported `nova-core` symbols is now limited to the
symbols actually referenced by `nova-drm`.

This series is based on `master`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v5:
- Drop patch inlining core Rust methods as it was picked up by rust-next.
- Drop `.gitignore` items already covered by parent directory. (thanks Miguel!)
- Reorder imports in last patch.
- Limit the list of exported symbols to those actually used by
  `nova-drm`.
- Fix Rust export CRC generation under `CONFIG_MODVERSIONS` by deriving
  symbol versions from `nova_core.o`'s DWARF instead of the generated C
  export shim. (reported by Sashiko)
- Link to v4: https://patch.msgid.link/20260605-nova-exports-v4-0-e948c287407c@nvidia.com

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
Alexandre Courbot (5):
      gpu: build nova-core and nova-drm from drivers/gpu/Makefile
      gpu: nova-core: export Rust symbols for nova-drm
      gpu: nova-core: emit Rust metadata for nova-drm
      gpu: drm: nova: depend on nova-core and use its symbols
      [POC] gpu: drm: nova: demonstrate interaction with nova-core

 drivers/gpu/Makefile                      | 58 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/Makefile                  |  2 +-
 drivers/gpu/drm/nova/Makefile             |  4 +--
 drivers/gpu/drm/nova/driver.rs            |  9 ++++-
 drivers/gpu/nova-core/.gitignore          |  1 +
 drivers/gpu/nova-core/Makefile            |  4 +--
 drivers/gpu/nova-core/driver.rs           | 59 +++++++++++++++++++++++--------
 drivers/gpu/nova-core/gpu.rs              |  9 +++--
 drivers/gpu/nova-core/gsp/hal.rs          |  2 +-
 drivers/gpu/nova-core/nova_core.rs        |  4 +--
 drivers/gpu/nova-core/nova_core_exports.c | 15 ++++++++
 11 files changed, 138 insertions(+), 29 deletions(-)
---
base-commit: ef0c9f75a19532d7675384708fc8621e10850104
change-id: 20260430-nova-exports-502f996c5aab

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>


