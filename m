Return-Path: <linux-kbuild+bounces-13853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bXTfFjU6OWqWowcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13853-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:35:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA70C6AFE82
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:35:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=f9W+FLDq;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13853-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13853-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69D573061942
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 13:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63D13B8BCB;
	Mon, 22 Jun 2026 13:31:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B63B5837;
	Mon, 22 Jun 2026 13:31:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135091; cv=fail; b=QPSmZWQnWoCL/jEozZ0CVb6WkRJhD42EDUr7fThU4yuNJJApgHPz06pHoTtRuSP6l8A+TRhoLTmKHWKjAL3T82p9HUy7ElthmmSteOLxVajL4GATjLwCt7sR91yfywj67+6gy4K3HBDFLY9wd6STRrRWPjtALpUEtbKIx3qGWTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135091; c=relaxed/simple;
	bh=hn2uG/yUNGo7cQbYAFcDQpTaWTTLYiSlz2Px2cSihG8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=k29+AsEsYPmo/tkPZRZ24+I97F2a1Bfk8+q5kUZXfck1PY+4MlHH0DP6AgkWhAcfyuEryoWEFDYhCyo7LWpBNUTg3/XZKYPwnhHpoOy6Vi+8u2OnCaekYuZr4vbvaUujkGLHVhOR63DP+DM3o3d7QntqZ9lz9SPsoa4lOe71KOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f9W+FLDq; arc=fail smtp.client-ip=52.101.61.69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkfMOkL9wA9GOxO22K3XXpzAnw7q6oSWdWMDPzEa9/QJFUdSDR32aJBkEyZc89XGvhfT7qAw2g1gx6PLsd8DCfNK8B/2ln3dyxySD9UzR/peEHFrnsIHkAUifZDd9EpQus1UQ1AWOJcDVb1ZzMlKx+lDItZMdjrbxd5cF8QtOHFAM/ZLaeUg7Lt+w4GTcJGE9G7JqIpR3Cf6+97N8xJ71bKLkIanKkyfhukMWx9EwW1HxJVQyn65MDuSUAm9y39K+vIV5mI9BeUwk1IJ5IYtAX3+VUwVBbLRuKxKsScc61tke5h9nJfn2YnQfHsWP+h05EuAK3ffUDvW4xB8wdsMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUexRHiCA4nsNmSiG0gPz111RnpIKIxPZqFUfnnbhkg=;
 b=Pgkl3+Cy2LO45ID9ca9QrZZ1/kBzhIWxxGH4oqV0gy+eHoPdZ2wAzVSzWDPwIy+QKCEufHibW9jOZzwymvo4oNnLDxLLfWztX+I7DevFog2WDGVpn9t8NE1hVg2F0ccOg5o9qh5HQo/mTLpWQuKJUARuFESv3zdxUBSLfBVB2f/qrOZSUQp7t29AdvpmYBBRlGO7iIJeWf7XRRgbvBpHa9f0mbE+xU8jN14AC083uf9U6hsnjD1l2sXPsvNqfN9LjVqbzGpys+Ud6TSfRNLEqV+QhIpViPWZ7vFwv9P5G43l8+TAKvYFyIKxVp3HU4wBwYpfRowcG24Iad1sZoY1qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUexRHiCA4nsNmSiG0gPz111RnpIKIxPZqFUfnnbhkg=;
 b=f9W+FLDqaziFFkKu7aPJN3i/VYKMt6fHLv/7/S4DAEgGBKBQXGXCBzJ6uQjvbbw33blb/Umwe1UZTWdDkthf43Uwt9Ocy3i9V+HSmaYseDWdQv8Eojgb/iBmBgJFKFw8bg151oNhM4Jetk3pIKoc2V8G9jT8yxHFIV7Y2Ps8jC2Vv6Z9ll2Y9f1M3shJq/ifcpfGKbmvJdEs04Ru5IvTyqk9THOsj0WoalvC4C4EYglbC9cHHncr1vguWYygU8BWCYwgxqxF4rmpcDRTS2ilUYu0h1eupZ420kvS0/fpRha+r5mRk3YgRXAxSfWDwTgDWz1qP6IDX6DfTwPeMiHeRQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9774.namprd12.prod.outlook.com (2603:10b6:8:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 13:30:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:30:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 22 Jun 2026 22:30:11 +0900
Subject: [PATCH POC v5 5/5] gpu: drm: nova: demonstrate interaction with
 nova-core
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-nova-exports-v5-5-6191773fc977@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0106.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6da6e8-9a69-42a7-5390-08ded0627bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|10070799003|376014|366016|1800799024|921020|7136999003|56012099006|6133799003|11063799006|22082099003|18002099003|11062099010;
X-Microsoft-Antispam-Message-Info:
	A03SRXAWoQMRszBgrdv+Hr4Sv/Xx2J+gX4rMF4imn5mZC8XR9Y8d+5C5wxeZe0JXgzh4hMm3i3vxtLP8ja55Kjr48n83y0I5W6oVUWE7CN+Wt9q8XNtp9bhyndPDQuUyNWiA8ONDVg7Mt3AFKC4Xn99ArTG6ndXdA6Wm0Patb2AUdMVPBLkD5pgQxpE3KMgQeI/0DTDm1QdwDQOrO7fg1plVFu9ki81xwe7bWpuVeoYszLZMyVgdrZgO9IuXvz63XOMH39gthWF0R+9pV3AwG0qdoaOc9rqekJnxcGUGB2mnf/5H0aj/SK3Y3nFsI4Bjqujk4ffqnFoUpz190x/tGvW4h0chP9EqTlRjXcD7Cu+fEvsvQcJcWRQXkZWkZATqrfbsAQsz5wi8fM5+hpSG+Midj7si+CAR8Ozy0kWT8qvcXemj3g9EuOxVISbB87l3O4YFH1ESUfL8GWXauXHSglux7kh+Q4pzlCeliBPPo+xPtx8XD1M2lH8Cd9lkC8w/nKXlz85S5URaPU2HJVCzxhzOTzFjuF0dVQoiarLIE3V5kYj2MV+hK9itrZFhpAHg/U2Eq4dhWYZlEPavy1lcF9GRFfvIvDYy6yKolk0gJJ7V0GCTBbszA6K7BBWG4y5pCCpItb3H6ULakIiHvfaJoKdNpT7/KGFT/tY23IsP1E13XJEV55pDOoyo/g3Gaq13oK2R+TtA0VUk+etLmf6FmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(10070799003)(376014)(366016)(1800799024)(921020)(7136999003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003)(11062099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUpFV0JNV2t5NmJoSmNhZ3ZaUzVubWpjNmx6YTRHRXRzU3c0ZHFWNG0zaVp0?=
 =?utf-8?B?UHdGcEs5QndIY2h3LzNnZENXWEJoU3QveFNzRXlZOFpYUWRFVWpFOUg3N2ZM?=
 =?utf-8?B?eXFiTjlDMXpPVnVDT0JobDlOZnFuNDZ1T2t5SENiOGZoSm51YUJUam9SckR5?=
 =?utf-8?B?R3hjM05ZZE9yVTJiZ0tuazMvZ2JHa0wydU9rZWtMdzlZTjFZYzlBMjB6MUxF?=
 =?utf-8?B?QWM4enBtRXZRUXBZNDg3enBvYzVRNHVFQ2dBUVdlc2d6UEdqbS94ZDRSNFBJ?=
 =?utf-8?B?d216R2dDczUvbm5rQkpEbzRpUU16SnR5LzZ2MFQzLzQ4R3RZREpFVCtSU29i?=
 =?utf-8?B?U0tyMVdWOE1kbUt0Z0ZieDFIRDd3VWFZcjNOcXg2VjBrcU0veEp5RXpFRzJp?=
 =?utf-8?B?YXhzYlZKOGpLSnh5NUFqSWxVaEFpNG1WT24yNGxjT0pxY3lOYjNpSmM3Rlhl?=
 =?utf-8?B?d080QzQ2aFlqMjlBcS9BcGxhN3oxVWlWS0ZjRXFUMlRzS3VRYWpsSXI5NzJ1?=
 =?utf-8?B?L1pCS3RoeWN3QXlhWjNPSWNMRkNGR3NkWmh3RmxXYUs1WTU1Q0htVml0MUZB?=
 =?utf-8?B?K3d1SXdmNVY0dWZsWHMxYitpczFML3FXVy9KdHZvTUdkdmhYS3prRi9yZUxO?=
 =?utf-8?B?a3puY25IanQyUHJKaUltRFFJblE1Uk1iVUdUeEkvVHRDMyt1MDMxalBha2xI?=
 =?utf-8?B?WU5pVDhQeldSQ2V3WFkvRkYyL0VQRUZSRk5id092QnlXWkNuR01ydmhQWFdI?=
 =?utf-8?B?VzN0ZHRjL3ZSc1lad2pMdndySUYyRVdWWGJjbWFpRXh0SmlzSmw3U05ocXIx?=
 =?utf-8?B?UkIreUVPSUJQMXEyVzlPMEhVMW02MWUrbFlzSk5PbGkrM2t2RWxEK0pTa2hl?=
 =?utf-8?B?QjdmRHZ1OCszd2pEK2RHZEgyYUxpWG5WNzBYYjZ2Q1h3YjBsSUM0blg0Y1p0?=
 =?utf-8?B?b1NaRlg4TWt2S2JXVkIvc2QzMVVWOEp3L2xSMHVSbDB0UEhBWEhQTENEQnM4?=
 =?utf-8?B?S2JkM1Y5aFJvMlI4aW9RaWtXKy8zaEZYVXR0T2NxSGlaQ0dKaEhJYzVFUkZD?=
 =?utf-8?B?ZUpuRWk0LzFiQ1ZhbzI5bDZjejVzaHd2U0k0VmxZQ2RhT1pjOEJHOVlYdytq?=
 =?utf-8?B?Q0EzMk5PMmswZktGUFUzM29QOFUrUHJEd053UUU5dkViaFZIcnp5WitJbjFv?=
 =?utf-8?B?c0NETlVoK0FFdkcrWnc2SlBGZmd2a1p4K0Q5SHdRcis3aWJ2UE5BZStzZkhP?=
 =?utf-8?B?U041NldaVDQ4S1NuMFhldEpsanBUYlhGb3E4dVB3NFBDbjJidElBUnNQZzc0?=
 =?utf-8?B?cG5RZHBIVGRXS3VlUU5sUXEzR0pieGNGbDlyY0tJdHV4c3JVVDRZbVpNOVdn?=
 =?utf-8?B?QjNzdWU4Y0IrUEl0bzMwNTBlckdRZWNncWtuRlZQakUzdnJxSVo1MlREK1Za?=
 =?utf-8?B?VjBFd1Jub3NjS2ZmMGQ0TmZBZkg2N3dpaHNwRFkvSUlscFRsSEx2TEZYM0xT?=
 =?utf-8?B?WjVnWXhoZ1FXdUtoVXNUWUJDMFN3eWM2aUdENFY2aDFaNXEyS29mWkdwNURL?=
 =?utf-8?B?a0JQdTBhRXgvUXI0ckNBNmt2am9Jc0I3VFhBN2UvVlN5QTIyaWVPeHJKd3NC?=
 =?utf-8?B?VHlNZnBmWU0xY3pHVzR2T3Y5KzRYcEU3SVF3V0phZm1lanV5RU9qMEx5RVBz?=
 =?utf-8?B?ZUtnRkpzQ2lZUXNmTFl3ZU5hT1MrbmVZTFZvSS8ybU12M1o1NjBYcjlpUUtL?=
 =?utf-8?B?TUE5dUhLSWRQbHdiSUFmU3hTandiR2ZMU0ZySjZVWlpXMDNXdGJtdmFvZUZY?=
 =?utf-8?B?ci9hUkxQRjZobld1KytZMHNJcTJObE45dk1Tb1cwUkdpSENUUVIzc1dFR2Fq?=
 =?utf-8?B?N3NYZ21QNHFuenZSNUx0Z0lvRFNDOHJvWU5GODhGUGFNS3lHczBXcUl6QkNo?=
 =?utf-8?B?M1FxWnYvOTBUQ0o1NzhaNlIzeEdEaGZIM0pObW1KRkMyZWpmNWJKZDlMUVNX?=
 =?utf-8?B?clQyS2NJWDhBUnd6amVrN0E3YjNROXM5NlpEVFFjWGgzS2pWVU9hS0hnWFhp?=
 =?utf-8?B?TVhQd0RMcTVrREt1S2VobFBFMnFTVVI4WFBDc3FXRFc0c3hySnAxR3FDRTVW?=
 =?utf-8?B?UCtmMlVoTzJBMHo3TWlwa2YwSDMxTlZXeDkvcFl3NUpGUHRUTTZ5SlFGNnNa?=
 =?utf-8?B?cDRSN1hsZy9JM3lubEluektQdUMxTWtwMVRDUDAxcG1xRDB1MW4xaHZOTGts?=
 =?utf-8?B?RC95TnZnU3lwd2MyeHZDY1NDZENWSHdKRGs1TUp6bXNhNTJwaWdoWk5OWkhy?=
 =?utf-8?B?eWd0dFpzZmE4d0poYmxyL0VBWHhNaTdpY0xxOG1SUGFOZ3c5cXQ4M2o4TFAv?=
 =?utf-8?Q?2JX+49nM4Fe+BOy/2garBDskTTAU13PrhIdXdmFYgZT6e?=
X-MS-Exchange-AntiSpam-MessageData-1: 5ApR2erJ0tHdJg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6da6e8-9a69-42a7-5390-08ded0627bf0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:30:53.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHtwz/hI+FHDxUpTacXPj5tYpZ/Q9JwyaJxBryRZeU87papDlBUU0xjZ6qyVzC54rDYSJdKvvACPsaTeyJfNrw==
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
	TAGGED_FROM(0.00)[bounces-13853-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: AA70C6AFE82

Export a few items from nova-core and use them from nova-drm in order to
print the chipset of the GPU being probed.

Some documentation items are added to make Clippy happy.

This is only meant for demonstration purposes, and won't be merged.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nova/driver.rs     |  9 +++++-
 drivers/gpu/nova-core/driver.rs    | 59 +++++++++++++++++++++++++++++---------
 drivers/gpu/nova-core/gpu.rs       |  9 ++++--
 drivers/gpu/nova-core/gsp/hal.rs   |  2 +-
 drivers/gpu/nova-core/nova_core.rs |  4 +--
 5 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 48933d86ddda..6b01ecefab43 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -9,9 +9,12 @@
         ioctl, //
     },
     prelude::*,
-    sync::aref::ARef, //
+    sync::aref::ARef,
+    types::ForLt, //
 };
 
+use nova_core::driver::AuxData;
+
 use crate::file::File;
 use crate::gem::NovaObject;
 
@@ -60,6 +63,10 @@ fn probe<'bound>(
         adev: &'bound auxiliary::Device<Core<'_>>,
         _info: &'bound Self::IdInfo,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+        let aux_data = adev.registration_data::<ForLt!(AuxData<'_>)>()?;
+
+        pr_info!("Chipset from nova-core: {}\n", aux_data.chipset());
+
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
         let drm = drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5738d4ac521b..a214860f20de 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Main driver module.
+
 use kernel::{
     auxiliary,
     device::Core,
@@ -18,18 +20,36 @@
     types::ForLt,
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    Chipset,
+    Gpu, //
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
 
+/// Data passed to the auxiliary device registration, for the sibling driver to use.
+pub struct AuxData<'bound> {
+    gpu: &'bound Gpu<'bound>,
+}
+
+impl AuxData<'_> {
+    /// Returns the chipset of this GPU.
+    pub fn chipset(&self) -> Chipset {
+        self.gpu.spec.chipset
+    }
+}
+
+/// Driver-associated data.
 #[pin_data]
-pub(crate) struct NovaCore<'bound> {
+pub struct NovaCore<'bound> {
+    // Fields are dropped in declaration order: unregister the auxiliary device before dropping
+    // `gpu`, and drop `gpu` before `bar` because `AuxData` borrows `gpu` and `Gpu` borrows `bar`.
+    #[allow(clippy::type_complexity)]
+    _reg: auxiliary::Registration<'bound, ForLt!(AuxData<'_>)>,
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
-    #[allow(clippy::type_complexity)]
-    _reg: auxiliary::Registration<'bound, ForLt!(())>,
 }
 
 pub(crate) struct NovaCoreDriver;
@@ -78,7 +98,7 @@ fn probe<'bound>(
             pdev.enable_device_mem()?;
             pdev.set_master();
 
-            Ok(try_pin_init!(NovaCore {
+            Ok(try_pin_init!(&this in NovaCore {
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once available.
                 //
@@ -86,15 +106,26 @@ fn probe<'bound>(
                 // (`try_pin_init!()` initializes fields in declaration order), lives at a pinned
                 // stable address, and is dropped after `gpu` (struct field drop order).
                 gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }),
-                _reg: auxiliary::Registration::new(
-                    pdev.as_ref(),
-                    c"nova-drm",
-                    // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling. For
-                    // now, use a simple atomic counter that never recycles IDs.
-                    AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
-                    crate::MODULE_NAME,
-                    (),
-                )?,
+                // SAFETY: `NovaCore` is dropped when the device is unbound; i.e. `mem::forget()` is
+                // never called on it.
+                _reg: unsafe {
+                    auxiliary::Registration::new_with_lt(
+                        pdev.as_ref(),
+                        c"nova-drm",
+                        // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling.
+                        // For now, use a simple atomic counter that never recycles IDs.
+                        AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
+                        crate::MODULE_NAME,
+                        AuxData {
+                            // TODO: Use `&gpu` self-referential pin-init syntax once available.
+                            //
+                            // SAFETY: `this.gpu` is initialized before this expression is
+                            // evaluated, lives at a pinned stable address, and is dropped after
+                            // `_reg` (struct field drop order).
+                            gpu: &(*this.as_ptr()).gpu,
+                        },
+                    )?
+                },
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b3c91731db45..bceed4652508 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Core types for the driver.
+
 use core::ops::Range;
 
 use kernel::{
@@ -35,7 +37,8 @@ macro_rules! define_chipset {
     {
         /// Enum representation of the GPU chipset.
         #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
-        pub(crate) enum Chipset {
+        #[allow(missing_docs)]
+        pub enum Chipset {
             $($variant = $value),*,
         }
 
@@ -203,7 +206,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
 #[derive(Clone, Copy)]
 pub(crate) struct Spec {
-    chipset: Chipset,
+    pub(crate) chipset: Chipset,
     revision: Revision,
 }
 
@@ -267,7 +270,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 pub(crate) struct Gpu<'gpu> {
     /// Device owning the GPU.
     device: &'gpu device::Device<device::Bound>,
-    spec: Spec,
+    pub(crate) spec: Spec,
     /// MMIO mapping of PCI BAR 0.
     bar: Bar0<'gpu>,
     /// System memory page required for flushing all pending GPU-side memory writes done through
diff --git a/drivers/gpu/nova-core/gsp/hal.rs b/drivers/gpu/nova-core/gsp/hal.rs
index 04f004856c60..5f2d4a0c25cc 100644
--- a/drivers/gpu/nova-core/gsp/hal.rs
+++ b/drivers/gpu/nova-core/gsp/hal.rs
@@ -36,7 +36,7 @@
 /// The GSP unload code might run in a situation where we cannot load firmware dynamically (e.g.
 /// because we are in shutdown and the file system is not accessible anymore). Thus, the firmware
 /// required for unloading is prepared at load time, and stored here until it needs to be run.
-pub(super) trait UnloadBundle: Send {
+pub(super) trait UnloadBundle: Send + Sync {
     /// Performs the steps required to properly reset the GSP after it has been stopped.
     fn run(
         &self,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 9f0199f7b38c..77f647b8862a 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,12 +13,12 @@
 #[macro_use]
 mod bitfield;
 
-mod driver;
+pub mod driver;
 mod falcon;
 mod fb;
 mod firmware;
 mod fsp;
-mod gpu;
+pub mod gpu;
 mod gsp;
 mod mctp;
 #[macro_use]

-- 
2.54.0


