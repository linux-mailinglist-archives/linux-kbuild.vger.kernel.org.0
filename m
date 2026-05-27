Return-Path: <linux-kbuild+bounces-13353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEnxE5zbFmofuAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13353-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:55:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD25E3B6B
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8591E305CB99
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 11:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CFC403E93;
	Wed, 27 May 2026 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f8VELkZQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AEB402B8A;
	Wed, 27 May 2026 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882774; cv=fail; b=sbBA9dU8uTCzv3bZ2WZMuSOi+B7p5aG8UBe+5s0hDZJkKi086Lq0Fvw3DpuV7Rr2tvK8CCN7WAzfMy3nxyULbmLrKFuN9jsLmg9l0oG22joloKwLwOf1a/T3kfj+DSAVPst15BQZTOfRT9aTomhx/91S7+nnLyDZY1QJsOwk5uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882774; c=relaxed/simple;
	bh=WFarSOnSR+JqTEO0IIx60MENZRcbxPUe04wOB2Ykji8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uRE82aCVLFxFaZULdoDN2aCwmHX7jamheyyP9CrzY7zNucwa588kg4MUZjitF+2E6XJGwltgjud86Dsclthr0gKS7hcM7OSW2zdWSSJRAoQ3CmT5BKM3hYLX87dGbOY8ZkY+h3hg+DBTH8OrkcSggXVf9pAHtBWxSYId6oMViNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f8VELkZQ; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/eIhY7gOVwmemRlTLxOPnucLJf9Mrs3GKjMv9lv8V5cBykwQ6X+8NM7HzoRYqyfPuam+HlUCzG06Pp3dbUHbH5hEtPyzdQFAwMfibiX83CWhfPaprP9UVtiag+dQNVAOHJsfqG7uj5VSNFP5zVfUbs+Uc68C1zJ/CCz29qBcZD0+7fBL259iZcifhXkNLfQUYHT/6COzkouUW0BkoPtFy6x71Ti/fB+qW4AjveFZjwa47ggLH7pDZc8X+9v6I9lG0fYL7qNiUKsXjkrz4rrcpG9tBMch/b5XJRr2TJzNJWLM4OKgMl0uHfTYsQk87FvnJj/N1fegW0oAGuU2+c0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJ2CWCThHpPxL7WeDLbxSHNCLtB0bJLxs0RRSob60po=;
 b=Y9XWYafPcq/c2XPRNZQXHeqM7w80puRbGCh65oe4B25vuFPhFC0pKZG199OxOP8/TdZKDnEZWmUpZSix7xBZGplqdp9AUccPluqHxqYUAnnsb3KdRCmAMTFSVomyqu0rJ3gqLY9IxYNBQTz6ELegc+7ca9GpHF7XctA8hSat3soRNRHu4xPA0Qxz1iHQ4oJzGCSuLPfL4LQHHeFhqaQav03x8pLGpXSuS5mdXVnkX5kP8GWPdSicFa2VT1HY3gRWKiRr38Iv0uDgLTMMlaSQReTdLY/hq15cH10o1aGSBSO7ECQCaY+DPYMkRQnIwQDUhMRVbmDvSv2eFrFU30a+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ2CWCThHpPxL7WeDLbxSHNCLtB0bJLxs0RRSob60po=;
 b=f8VELkZQ2fKslt9p8hh9+6Au9fXJ1tWOEupeUswiPWsGSbMDG3QzdSLzai7Sb8ryBEuNLeELToHSX6yj2DLwZNNfjT0sLK6UDPldG0ZoqsXQiLqO8sdOFsfwz1DcOfdvlgAVKbVgEyumRTUn2aqs9za279Vw5+ScyBddFAEQ0BSPwSZ7S0fv8u58fA6sK42rLrPw9sQzr7KsbOMOTgFyIFpsRphx4WtiriTv/MlbnhQH5B4IEbTmBx/DZ2dUkFxujcly4c9jEUzqU+evjATPSRHt9kTZrWsIZfbkG04U1v/IxPtxjKXj8sN2Vjdv4hN/y5hF0PPtGRmbY4GXzm2h4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 11:52:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 11:52:44 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 20:52:20 +0900
Subject: [PATCH v2 4/7] gpu: nova-core: export Rust symbols for dependent
 modules
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-nova-exports-v2-4-06de4c556d55@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: be1aacaf-6e1e-4c04-bce2-08debbe676f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|22082099003|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	65974KuIp+28qNW/efu/en19Ng9aFb9qLXMiemLW7JmaRu9XS5vL0xkyh5gPJh/fgIdWxkxLun3RMJUZbkfDLzkBCgL8KE5QYKZJ22YpaHKRvgqvmrngugSqBZfURZqQ1m7B7Lvxx6kKu+Pz8or0XN5l4aE+gj0+HOL3yJAyZFqjE7xqOyWqU5d46AjWkBLYjMD4cYSbgeovJ8IvEFeN3lnUEhHJWxPrP8GGb2vkzsja2Ac6LHT0omVG0yAwFyGoKFrFRVuJGSKEf8qNi6czv06B7dTbsMSbKzbTmvnuGR3GoyXMKuzaFaW65QIaUD4joqdDaBBulXvfFdC/u+yYkI6GCM9vN3+ewpsB4Rs2G3IbEPLXc9fZ2rbWK+d6mTP3r/Kn4LAjVEWSHzfWp5tjAtYP971edBEz1tvNJJTAJtG8ZA3JLK+Ucbb6UbD3b/N2one7saGYSNquPz+3Bm1c1wPbrFogYQG+FRXzOXN4y6IisEr6jcZ3hyCltWH6g7t862CzpR+KJg2pKOZkaDjCO9nynW4WYhJ+4gmu5ADDAuE6fDkWmFgyO9JBuIuf+GL09fg5NVbQgucyEvXd8gs4JDXHVkIHc2ORJ8BzHJ4xDkVIzJwW7uPSRySQlceW34AWrKftWKiSucWwbJWeBblTZ0h5BSTqLx9ZuSZ09QnoMwMacIUa8xY0OaQ7IPEECAcbC/pi5tln4+h8dGxRo+v7vc0ywMNVoloAr12MlLaWgj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azAvQWl1NGlCd1NDZjJDTFp5K0R5Nnd6MHBQenJuaThCVEZJVm5pa0xFU1E1?=
 =?utf-8?B?UkNkQlpHWEY0WWpOeWRYUk9VQXEwZi9LbGw2Uzd1ZFNjU2dJdmFma3lMU1BJ?=
 =?utf-8?B?dVY3STZ4Nm16QndNTkw1QWJQWVVHVGR5dnVCQXZ4dWpYdS9UOU1RelZsQnFM?=
 =?utf-8?B?SmJxbmVlZnVVcWp1dXh4TXhvanBqVnp2L2pOUkZiQXJCZFRmTHNkSlBkSjY5?=
 =?utf-8?B?Zkl5VlJ4RnVkbmlZZ3Y2S0VXUFBVaHhPeG5qM0daNlJORG40bitlTUJPalRK?=
 =?utf-8?B?Y3lsY2k3OHE3cG9RZitLeXF0ejE0TGhGSGZKVE1UVGZoSVhkclpWYnRBYkg4?=
 =?utf-8?B?aGJQOXZOSi9TRlpTVEVhYXgxK3RyV00vbWVjR1pqaGhXNm5PVVlQOFhhZWw0?=
 =?utf-8?B?andvM3lXcnVrUTRXNDY1cVMzNE9teVAwT3AyOHpaUkFPdEw3SkgreFh1SEhr?=
 =?utf-8?B?RDYvM0d3WllCaUFJSVF6dkZIWTVwS3Ayd09OV1pIZ1pBY1ViTG54NG5ocE1E?=
 =?utf-8?B?K2dobURlSk9MS3VLTHBrR1lNLzdsMktGbUF3TlNoSHl1WmZpZ1hnMllrRWNI?=
 =?utf-8?B?ZmdEU05NSXlLV21HZEtFWmhQYi9PU2M0WWlXY0lmUisxNzVlUkpGdEJXN0pY?=
 =?utf-8?B?OEs2UFhJRk1sZ1NpK2xvak5XY1hXRGx1dklLb0lyY3ZiYnVxZEprSzBLckFD?=
 =?utf-8?B?N3dROFlnOE9POFB1ZVJlTTJ0dE4yY0VHS3p6YXNydWhsYXk3dDJ5TFhiOUtI?=
 =?utf-8?B?Z3JsQk1vYURBZnNEbzIvU3NEU1E3MGREMDh5dkM5QXkwdnBMWlRVR295aTQr?=
 =?utf-8?B?ckMvcnFMbGlJb3E0cjNSR0ZJOG01K3hFUUw4RTQwZU5MWGxzQzN5V1orVG1m?=
 =?utf-8?B?eS9XejZVVDlBeCs0NE5XM2t1NitaZ0dYdDl5ZDdkVjEvS1NzSmVWL2hxWmhj?=
 =?utf-8?B?bmhpWE1xTEE5Rkx6TElFSmhCaDYwZ0tLNk1ka3ZKTnVSVE13YVpNKzNLSE9M?=
 =?utf-8?B?VzZZcXpRZUtZZXRVUC9qVTVURFZrYk0xMHlDZE5SU3YxZXV3OUtyWXlaVGtt?=
 =?utf-8?B?cytpdTlVT2RqQ2JCT2NLTVBsL1lma0UwNDFIUHRsS3laa3o3WVhONGl6WEFI?=
 =?utf-8?B?dWtEbmNqMHdNMnNHTlcvOVdGekVXOUJkVjV2SThrQVUxbCtOcmpPdGFxUUlM?=
 =?utf-8?B?b2YvTDhyZjZpS3NvMTVwZ2hPN2R1Y1FxMFREMzI0bDJ6dGFZY253VVowZTdT?=
 =?utf-8?B?dkVHQ2JNcE9XdUgxcStJOVpPVXBsaUtrZzJXSExqZzVUU1NlcUp5SVJBQmln?=
 =?utf-8?B?N1VuaU1QNEhuRzdoR09VbVZNeTlxbTBFa2E4N3VwUmN5aXUvRkpEandlT09l?=
 =?utf-8?B?T0psK3ZzSHg3U2c1UjZFSkZSNkxnaFJkcjBRMDlBVUhRa2duMS9KeCtTY3Jk?=
 =?utf-8?B?SnA5S1Zpdi84TGxldEt1azJRdnI4aWVJRG4xLzdGVXM3VzJMRkx3MEJMbjZH?=
 =?utf-8?B?elRYWjhjbS96bVZoWStZLy95T1M0OEV2TzIrR2hNYVFHM3duR1FuS1hxZmVz?=
 =?utf-8?B?YXh1WGN4aGYxR3B4UUN0WHNzK09yTDRRdkxzTlA4eXByeHJNUUpLTnFBUWxv?=
 =?utf-8?B?Nzh6K1gybUE3eS9tbDB5RnYvRGNuYUhsdThFT01xd3ZUT3pZN3ZRWnQreU5V?=
 =?utf-8?B?QSthSXQ4VzBjcmlqcVh2QjcvbHZaQ0xrbGV6TDdjdk10TmMvczc1MGZka2xO?=
 =?utf-8?B?NVpieGZtUnFJV1RuY1pDZVM4WjIyQkl1WUhsVGRXWWFza2JCRWRsc2xMWWEr?=
 =?utf-8?B?c3NFbXBsd0hSQ1ZSc2t5dGNKQ1FoWFI1cVJjYzZpQ0drQVBlYyttaFVpTzlY?=
 =?utf-8?B?M254eHlOakRvdjI2aFp1Q1MxTXRUTS9pR3NJaDV6dzlOVVZVZEJROEJZVjBD?=
 =?utf-8?B?UXJuK1NNZ0RTZ1MrSzY1TE1La1hqNVJXMFJxeGJuNXA5M051c3dCQ2pEcmZG?=
 =?utf-8?B?S0xhcWFyYzJWMW5wUWF0cnZjUk5mOUx5MlVMcmltQTJVWElsR0RPbVdKWW1K?=
 =?utf-8?B?Z3Y1ejU0OE14Y2dFZHRKdnN2VGNHV0hydFFiYU9NQ0pQVy83THlFUTBXQ3lo?=
 =?utf-8?B?TmZQRlEyU3IxY1lROEJVRHFaQzdoSzQwK1pHNitEZFJhNTlSYkFoZ1I3aUR6?=
 =?utf-8?B?UDJQa3Q2aVpLc0EwYVBrM1UxL3ZiVmtXMCszYng2OVBrWC96UFNBdlBtaHo4?=
 =?utf-8?B?S0cwVE1OYXlIbU10VmtDTFo5THBMbnVjQmNWa1lHTFREcDVDbVhuMUYyV2ZN?=
 =?utf-8?B?Z3VzQTZiTjFvVHovOTF4RG5kSlpDM3dvWWlkYVJNQ2Z4RDErNjBKdlRlRFpI?=
 =?utf-8?Q?dkmNyKNDHZr8hl1VEs/T+KGDvGatERsJ2DFcINtifGC2z?=
X-MS-Exchange-AntiSpam-MessageData-1: ydJHEQPFkvJy8Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1aacaf-6e1e-4c04-bce2-08debbe676f5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:52:44.8926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XWwSHvS7dCc7xEmZTve5L/VqiXX4YYG5fcJoQehyq55Fd5GXyc4xbWyHQhpROaKNJmPIzX4pr27BQlT6C7+lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13353-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[26];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 03AD25E3B6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Export `nova-core`'s Rust symbols so that other loadable modules,
particularly `nova-drm`, can resolve references to `nova-core` at
runtime.

This is done by generating declarations and `EXPORT_SYMBOL_GPL()` calls
for Rust global text symbols using `nm` and compiling them into the
module as `nova_core_exports.o`.

This is a workaround until the build system supports Rust cross-crate
dependencies natively.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Makefile            | 22 +++++++++++++++++++++-
 drivers/gpu/nova-core/nova_core_exports.c | 13 +++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
index 4ae544f808f4..d31bfb04921f 100644
--- a/drivers/gpu/nova-core/Makefile
+++ b/drivers/gpu/nova-core/Makefile
@@ -1,4 +1,24 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_NOVA_CORE) += nova-core.o
-nova-core-y := nova_core.o
+nova-core-y := nova_core.o nova_core_exports.o
+
+# Export Rust symbols so dependent modules can use them at runtime.
+#
+# This is a workaround until the build system supports Rust cross-module
+# dependencies natively.
+# Kbuild uses Rust v0 mangling, whose symbols start with "_R".
+rust_exports = \
+	$(NM) -p --defined-only $(1) | \
+	awk '$$2 == "T" && $$3 ~ /^_R/ { \
+		printf "extern void %s(void); EXPORT_SYMBOL_GPL(%s);\n", $$3, $$3 \
+	}'
+
+define filechk_nova_core_exports
+	$(call rust_exports,$(obj)/nova_core.o)
+endef
+
+$(obj)/exports_nova_core_generated.h: $(obj)/nova_core.o FORCE
+	$(call filechk,nova_core_exports)
+
+$(obj)/nova_core_exports.o: $(obj)/exports_nova_core_generated.h
diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.c
new file mode 100644
index 000000000000..480472b039db
--- /dev/null
+++ b/drivers/gpu/nova-core/nova_core_exports.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+/*
+ * Exports Rust symbols from the `nova_core` crate for use by dependent modules.
+ *
+ * This is a workaround until the build system supports Rust cross-module
+ * dependencies natively.
+ */
+
+#include <linux/export.h>
+
+#include "exports_nova_core_generated.h"

-- 
2.54.0


