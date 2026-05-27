Return-Path: <linux-kbuild+bounces-13371-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKolOnQwF2rd7wcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13371-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 19:57:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B05E8972
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 19:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0C8230A4001
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 17:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DD4421F05;
	Wed, 27 May 2026 17:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="BAgx6/IP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022105.outbound.protection.outlook.com [52.101.101.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545B3A8741;
	Wed, 27 May 2026 17:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779904489; cv=fail; b=Tkj0RhPWiW35DKaGDIonlgjt9OCidfmmNx4WVsdM11KvgZbED5A5N8f8jLdJJA34gxj2EP3z5hkGiLAYL9eg62iWn2jP0FXFzb7vrZcnCRkxuih4OFYWpvucUjBu08XZnxctWrVhc1VaCImzq28IrJkg2T/j+q11KGutmtskJjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779904489; c=relaxed/simple;
	bh=9nYWtG/sEVFlbMc8ji2WflB8QYSnEso0Q8QXJHLXh9s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=E4Iuc3tkwZEar8S9mL2Aj29ndUVkGuTp5Xxy04k3QZbgB+e/6ZvwxHluVt8C5sgWaztI4K0S9ES3uIllRPi84up4dRRZvQS7Tp7SlSA92P6I0QStd0kfYTfpuFqJWGWzFzp2sZYOlWCgNTh3Ul+GfqBhK8Ohjrnk7oDZMZslt0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=BAgx6/IP; arc=fail smtp.client-ip=52.101.101.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnL//f413MO1iXRWbXhyd1AB+lkeKQD5GGnvEi+vfPuq3zT4hTAEseYGpTEtQwstyUO7cD1nPhb2BaGvnRgw7Gb0pIHOrgVt50AidOIQsNqHT93yLEo5Ic+424wfGc219f2k5Bn5D7x3R4S1DlCC5fxkpQJkryziwqDbDhs0gebyOA5QEu/GDiPyM/Dot3IuosMfpjnDcCjTve34qX6lKKXEDMlESy2Dk60fwgwacVhhqbvac5fTUwf/H7u+qyZeXFifCHNHzs7ineTa2rt26H9C4hcWVauwOvQ8N6/S3AQiJ03Timw0JIzsowDldxWUiDzA3/YmbjrKhQEX5CD3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/O7kBL6rBxHSOnr8Ci00ZkCGmAtyVrJ+yrtYSbOUVf4=;
 b=sVSA9ncneS+Jr+TV6QzoVvXoNK3QF2GIjfjzkp7UqAqfcXZY3yUBAOawCdsUTttUuO0o58zWi5hx8MbO4UPNSF+BYQD0TQlgJxgxHqC1qmD3F8+JJGLWu0/hCsQZ4J//zOELGOfo7EMKOKWQTthw1ZuxaxZaj2hmjnAw0WwwngiRRIvWz/q1ssQdNb1TkCZyg3LW2/HD5QiwZRyDYW/C+fN5aKPdGTJRmbFT9I6WLY5V+5QptRFzwXP/z0wPW9ObMisjZZ+XF7yJ7dKoEjOkiikqM1dEl5iJdSVI+5MG7JueFDP6cxs8HWYpHvauVOifua5y9iH2nJ7LgsD3qJW8hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/O7kBL6rBxHSOnr8Ci00ZkCGmAtyVrJ+yrtYSbOUVf4=;
 b=BAgx6/IPVcQgoDO1lH+NbrpPlKNy87z2246kdQH0Wopu7dknxmhYvxJFF+IGu8pThBKD6w4gS8vMF/8uTqt9Vj44uvrJqrG32o5r9DZMZBMfHzzTHiDjlSV6e/GOXmZifSqvBFcpbEqu1HmnzfVGJGwuhZ4yTa0nztWAlx3O5aA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7671.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:54:44 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:54:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 18:54:43 +0100
Message-Id: <DITNHBFUULNG.2X57K1ATS5AUO@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/7] rust: always inline some init methods
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
 <20260527-nova-exports-v2-3-06de4c556d55@nvidia.com>
In-Reply-To: <20260527-nova-exports-v2-3-06de4c556d55@nvidia.com>
X-ClientProxiedBy: LO4P123CA0569.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::9) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO8P265MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b4476e-caa2-4e9f-4761-08debc19089e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|4143699003|56012099006|6133799003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	Rs4LkjpU5jLadaHY7JdF+0tGPO5895jdYXZXKWNxjNQJS/+npqNnvi20WrtQ+U8asYF9poLoZ85X0Hce1xVaIfU9hOIEPZvC56ZBIEXMnBIl3KmNX1Ru49FfxphoCSWce46BjvQHp17REM9JV9ZamKItDyUkhHB5MAfw8lKZ1clI+akaNCe24tm/Ms3MP9y5sP5QMYv7IOJHnq9B6r+l5XZ4xVg8ZvL3hMNkXUNRtTOV4mhiBsXkF8G3LMlt90b8FEAcvDEyM0TRGVzE/Be4tf/APty18HCdM/tOn+0MmKsqwsq+fGKQsVGmgWFy7Fi15K6lg5kPQn/y7uh3Ln8SqGECwGwn2Zu3IzHZ7+7XRuNvFUgluhwZKRbWOUTTOlYCDx7SePswa92FR4D36k+/wRD6RHMszR3rPZeAZE1wIXYwyWUcWGP5D87l9/QHIG0gxdhBtVmf00onMmaAHVSOJEIrSRnbMXctAWse4fcsXaNz+OZSUCyKEgzOySs4IvbX/++yxv9O2vS0Yuef5H3jUZ2q/mm4bPlXN8AH/6m+Sjsl+mflVsg/KreXoOsS1CB7MkWKxYCAnW4+dL8Zvrrg9YVR9VyQTQr+vVCGWASLCNWCLHBNn9HKON2nrVqnEs9yxk5nT6WhdQFviNdCZSIs29N6kBG2eKfUPOYr/aAtxmGx+itIlXV8cI7CAWGs07tle5uP0LGwtIDUbVTXeqb7TvXDJXn7lXLBNqzv3M9nAsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NStxdlZXNUtXbmlCNDVwaXI5eUZsWU5ZTVd5NkVRa2lFbzh1Ykc3WVF4aWpx?=
 =?utf-8?B?NFlTZUM3M2lOdnh6TVJEY2xMenFHL3duM05peGFpVnhqNmZjMktMQnM5TnlT?=
 =?utf-8?B?b1lsK2ZjL1pSMXNURGlyS3MwOXkrYWkzM0k4dXFNNStXOGRuMDE4QnJsY0tO?=
 =?utf-8?B?NGJYZmRJS25rNVJxd0diL1JWa2NJZ0lHZ2l2VERhTW1qdHR6dDdpZnltUDBh?=
 =?utf-8?B?anVIbXNxbU00Zjl3UW5hbGxkVkFLb0tQbC9qOWljZFJWWUlLQ1VwdHNhWVhJ?=
 =?utf-8?B?QUpxclVNQ1BrYzJhSlFWdXFPL3lBeGUvdjZmanFtZ0d1WWVOSElxZzlyRUNy?=
 =?utf-8?B?NTc4ME04NkQwajdrOUZ3NU5Lc3JVcTgrRnRHem52VmFiaFN0VnFIcGpMT0do?=
 =?utf-8?B?NFlNNklDeEZkdEJJZVIxYU5PZ3NDaTEwdTRJSGQ2VW00MGlaQURsTW5Rb0FD?=
 =?utf-8?B?MHRxdzZpVTFzK0ZUUUg4Q0FvdDJWZkRPSVRhbXRkUEo1VTlhMTk2S0VzcUZn?=
 =?utf-8?B?VlRlcFEzMlNxbmZUODFHTVBFcllneVZqRmVDSGY3UlRRdlVtS2hZcnI2TTZm?=
 =?utf-8?B?K1ZLdGhhZ2lMWkFXdUdwdE43T080Rlp4NEVSNGJtZ2tzMzB2cmUwaXg2UXJ5?=
 =?utf-8?B?di9wekdWUzN2S3ZaN2ZsZEduRmtFbktlQmJaNTRIRGVYUkdUMis2aE9IVU0z?=
 =?utf-8?B?bjFJWnIzQUtZK2I2SnJyN0FWSlhiWnhGcWtFV1dvNmZUYW80cVdQWDlBZXcy?=
 =?utf-8?B?S1RTL1p4MDQ2cmZUSmdscHR1VzVkVzlMU283b1c4TWN2L1BkR0I3SjN5Yk9Z?=
 =?utf-8?B?TFhSM0FVMFdFNXJSei81VTRMNkNSdzFJUllXNE5tQmVhLzVBdnRNejUzUUxD?=
 =?utf-8?B?Z0c1MW1BbU9pUVNiQUFWWlVULzVTYkRQQzE3dVU0b2VCYnFoZXZ1S2hKSlQ2?=
 =?utf-8?B?RFNKeXlyZXNjV1l6QjBzSU9UR3JJRFZvSXBCdjYwOTNWSjNoV053c3JHU0Qr?=
 =?utf-8?B?ZS9vVmdmWTBqUWNkT0lQNVROV3BwNHpwV2hRZEhpdTIwTkZGdHc2NzJCc2Mx?=
 =?utf-8?B?T2tOcE1YQUJFVkRQUVFEeWZhZDVzUHQ5TUdkekJyZU1LUDlGQmMwek5zNUQ1?=
 =?utf-8?B?ak4xWkJtNGVZanUxb3M2YmtDcXB3YjNCMFFWUUh6STVRd2xlK1J5SkI4ZHJt?=
 =?utf-8?B?STQyNkN5Zk55MXdudXM2NGRXSVJFOEhxQWpCeXFlTnBVNzQ1M1JTN0RNRlJL?=
 =?utf-8?B?VUc3cEkvOXRiT1gxR1Bvb284aG5xbUdVRVFYckpyWkF3bTVkRXhMdDNxYUR5?=
 =?utf-8?B?QU44WXhZdmVpd3AwcTkwUkxyNm52Ulo1NlVuN0gxSEsvZkUxWDl5WGQxc3dn?=
 =?utf-8?B?QUsxSXVNcXV4ejY5TWFpcGNWMEVDWUZvUkpRK3k4Um90WW1GWEVCejZYVWR2?=
 =?utf-8?B?YU9jdjhPYXBYU2VQaCtObUt3RGJKTFdobnpPbFM1WGtKTENnMFlucWJ5NExq?=
 =?utf-8?B?NUkwTko4QndlVXgxbS9Gb0NwbnNvZzZRY1pab3pOWkVPOTN4YUhtZnlEQktV?=
 =?utf-8?B?WXY1N3UxTUYrMlJRYjErZ05rcGhkeDdRVWJncnVUSjJHR3ZueHp4L2tlc1lO?=
 =?utf-8?B?RUU5eDZNeTRJMVVkbzJpSFJwTGZLeGRxTi9WMkZPL0JkUnYwL2wyVEc2MnRa?=
 =?utf-8?B?dnRBenZ0cTdhUklkbVA3T2FtSUptVVRtQmo0Z3hUMVA2WUtsTVdxNWdBODEz?=
 =?utf-8?B?cko3OTM4clBsUWowdWd4MmZNTXZneUdEclVqdzZ5aEEvV051L3BWR1orcWN0?=
 =?utf-8?B?eFZycndRVTg2QUZzTlBkb2RuMXlWUHd1UGt4aEdOM3lmZUJPbEhLc2RDWFls?=
 =?utf-8?B?WUhUZXJoZkNRNDdub3Q1eTcxUFRFcEE1cEx2a1ZqMWR2Y3g5L1o5LzBJNVZB?=
 =?utf-8?B?NndncEdJVjY5N1VXL3laek9NYmRQOWlaZjNPMzZOTkdUaUVKVmFHazJ3U2c4?=
 =?utf-8?B?ekx0QzJseHBldG1qUVpnYXdydzg2ZWs0b1dRU0U4Z1dSa2NSVDVBWlJHWFpQ?=
 =?utf-8?B?RmFHRWZWcDJENjZUWXVRTnBoc2lnMlhLN01FSTRzOEdBd0dOVzlMc0M1RDc2?=
 =?utf-8?B?aGxYeFZDSmxSaWJHa09SSEpCMHRWbVliZ0sxL3hBaGxMakJOdU1GRmtYMlRv?=
 =?utf-8?B?cHZ1WXE1ZVBZN2NpR3NQeVlLbkU4TWd3SGFuS0pwOGo0QWJhbDdqajVCOGRG?=
 =?utf-8?B?TE43T0FoRFUva0xpNGhpUWxKZC9WaFp0bUtLdEtZV3dWeVpMV1BQdG5XN0V0?=
 =?utf-8?B?emF1Z3pXcEcvOE1vK3hjSFlBUFc5WEJzWHpjZXdWeVhZRWJVOGlIUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b4476e-caa2-4e9f-4761-08debc19089e
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:54:43.8873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wm1AQ3lYUfP5olVO6hWEawTfnIgjR8UuGYLyweapeUVmVKv3rYbC0CM0NPDeCCXv74rUFoOJay65jXpS28gSJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7671
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-13371-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 402B05E8972
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed May 27, 2026 at 12:52 PM BST, Alexandre Courbot wrote:
> These methods should always be inlined for optimization reasons. Failure
> to do so can also produce symbol names larger than what `modpost`
> supports.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/alloc/kbox.rs | 2 ++
>  rust/kernel/init.rs       | 1 +
>  rust/kernel/sync/arc.rs   | 2 ++
>  rust/kernel/types.rs      | 3 +++
>  4 files changed, 8 insertions(+)
>
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index 2f8c16473c2c..592fffc72e52 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -433,6 +433,7 @@ impl<T, A> InPlaceWrite<T> for Box<MaybeUninit<T>, A>
>  {
>      type Initialized =3D Box<T, A>;
> =20
> +    #[inline(always)]
>      fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::In=
itialized, E> {
>          let slot =3D self.as_mut_ptr();
>          // SAFETY: When init errors/panics, slot will get deallocated bu=
t not dropped,
> @@ -442,6 +443,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) -> =
Result<Self::Initialized, E
>          Ok(unsafe { Box::assume_init(self) })
>      }
> =20
> +    #[inline(always)]
>      fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<P=
in<Self::Initialized>, E> {
>          let slot =3D self.as_mut_ptr();
>          // SAFETY: When init errors/panics, slot will get deallocated bu=
t not dropped,
> diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
> index 7a0d4559d7b5..36d4bf1959fb 100644
> --- a/rust/kernel/init.rs
> +++ b/rust/kernel/init.rs
> @@ -151,6 +151,7 @@ fn try_pin_init<E>(init: impl PinInit<T, E>, flags: F=
lags) -> Result<Self::Pinne
>      /// type.
>      ///
>      /// If `T: !Unpin` it will not be able to move afterwards.
> +    #[inline(always)]
>      fn pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> error::Res=
ult<Self::PinnedSelf>
>      where
>          Error: From<E>,
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 18d6c0d62ce0..973f15165606 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -712,6 +712,7 @@ fn try_init<E>(init: impl Init<T, E>, flags: Flags) -=
> Result<Self, E>
>  impl<T> InPlaceWrite<T> for UniqueArc<MaybeUninit<T>> {
>      type Initialized =3D UniqueArc<T>;
> =20
> +    #[inline(always)]
>      fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::In=
itialized, E> {
>          let slot =3D self.as_mut_ptr();
>          // SAFETY: When init errors/panics, slot will get deallocated bu=
t not dropped,
> @@ -721,6 +722,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) -> =
Result<Self::Initialized, E
>          Ok(unsafe { self.assume_init() })
>      }
> =20
> +    #[inline(always)]
>      fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<P=
in<Self::Initialized>, E> {
>          let slot =3D self.as_mut_ptr();
>          // SAFETY: When init errors/panics, slot will get deallocated bu=
t not dropped,
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index ac316fd7b538..381a06ee0d59 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -367,6 +367,7 @@ pub const fn zeroed() -> Self {
>      /// This function is safe, because the `T` inside of an `Opaque` is =
allowed to be
>      /// uninitialized. Additionally, access to the inner `T` requires `u=
nsafe`, so the caller needs
>      /// to verify at that point that the inner value is valid.
> +    #[inline(always)]
>      pub fn ffi_init(init_func: impl FnOnce(*mut T)) -> impl PinInit<Self=
> {
>          // SAFETY: We contain a `MaybeUninit`, so it is OK for the `init=
_func` to not fully
>          // initialize the `T`.

Are you sure this (and other `impl PinInit`-returning functions) are actual=
ly
causing issue? They just return an initializer and the actual init code is =
not
marked as `#[inline]`.

Best,
Gary

> @@ -386,6 +387,7 @@ pub fn ffi_init(init_func: impl FnOnce(*mut T)) -> im=
pl PinInit<Self> {
>      /// This function is safe, because the `T` inside of an `Opaque` is =
allowed to be
>      /// uninitialized. Additionally, access to the inner `T` requires `u=
nsafe`, so the caller needs
>      /// to verify at that point that the inner value is valid.
> +    #[inline(always)]
>      pub fn try_ffi_init<E>(
>          init_func: impl FnOnce(*mut T) -> Result<(), E>,
>      ) -> impl PinInit<Self, E> {
> @@ -417,6 +419,7 @@ pub const fn cast_from(this: *const T) -> *const Self=
 {
> =20
>  impl<T> Wrapper<T> for Opaque<T> {
>      /// Create an opaque pin-initializer from the given pin-initializer.
> +    #[inline(always)]
>      fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>          Self::try_ffi_init(|ptr: *mut T| {
>              // SAFETY:



