Return-Path: <linux-kbuild+bounces-13406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNQoGN22GWpByggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13406-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:55:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1F6051EB
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DC1D31D5754
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 15:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6EF63FD973;
	Fri, 29 May 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZ2PPjaI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975173FCB2B;
	Fri, 29 May 2026 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068500; cv=fail; b=pV/tiNpx524MN/akAXejSA3zCkPLOmfOwqbvhHW09UC6pSpY37kd78IjJX0vTTGt7HM2RUKSDi+FA/s/A93bcX4rjn5erULFuV25LlOKiXZxUVDHMBLgBv1YKq8DunWeAvl4yOyMYKUB2Jw5e9ofi5kzXELo4+zIFj82tDdPZo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068500; c=relaxed/simple;
	bh=v6AOG5YpatAQL5xDbdTTiORfRw2bh4CwRPai69lKCHs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Be4ZfLvbIyazn3Vkcx1AI/BDgv5xclzoW930NuD12AsoIMz1/MnyIHorl/6+so6yHdKDzPhtOiwo3+JRMYEaDgENOPzlVhDA2luNrwuzXnNctiyjU0lfj4X+qyK9aakdXGOQ69En3gb+z3a1NgY+2ha73HmdcM40QW28juRPX1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cZ2PPjaI; arc=fail smtp.client-ip=52.101.62.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCciQlcKRCqBFD/i3XJAiYCBe3ktl+rnh7CMm0iwfqjb3NkgG5gK/GCbt33/55KHTJk1YkHX+P+2dRF8XHFuSKGxl6GEzZCnRdp+qXq008BQ+OKNYLVxirQxXC9eKssWwtOqvNAKPQb1SMgquADCWZLnuqZoABReRg7VXkAJKMpGnt7SibZI2YH8ugNBaF0dCSwjdPR3KbWXs8Rlshnhhs+6yd8jxdy9ZUyqKzVAiDVIf236kzXMhSl0oYa+EoxzrDGl6njR2oqnUE3+TiLwpkgz8s0556f7wz+Roc27VEmItmSaRF6Fb2StUG7uuEfMJtqHszKXguWMpPwcJR1KBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkS7Dg3fNAoW3HPqT+AgP4wB/6C9jrFm9m4I74+knu4=;
 b=KbrbLdOiMsBT3Ge4MHr8TCv7EL4wXzOHbsmzMB9zK6GB44asat4oYlYfgu9Fl2A0FMN/wlk6D7VCWNTdxDpPvi7bFyrgHqQEsSPNVk1IXV4JEv7frhAg1d/pBMcSozbrkgLOjrqnyCop0k8x3Py4VKO8yvNF0z3invZfAFmk/cAIQhyBI2EdHdJkrTz3MHj7mKZIawh8SYlPiWuggixroYgNvEeK7QCoKX6cEg+RN25TfrRFhmCz+CDb/WFq0optRBaQw03F50xMsvTArsH6c5Wh8sme1WUH/yHUqEREDLGCwvuUqRZ4SKzrclBK1zQpseW6Hibomi1WQH4VtOZk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkS7Dg3fNAoW3HPqT+AgP4wB/6C9jrFm9m4I74+knu4=;
 b=cZ2PPjaIl3Hlxl+GWKPWyypHS7gyz7C50l6soWlGNpvyIp9Dzm2ipm5QiL/vjDMiUxBkx88ztiRn0sh6GLtzLzCARzC8LSCRkVWmmhPUlNElnU2c6baI9U6g7O4QhSk1EEei8kmPfmyErdU09zprCSJ/rxZk91s+EUvIopuYFCHRZL0eQJoa+gAdSbrTv/nAFgIu/VzTt4s9197AHII86UUqioLRqehbTJ6gIMRzFQ5AJu9PqYxQQjHw2Q7b6wBpQTYZwooIa5xDrYOIy86HkjBQREiGBXQUCwhUTrzNYNF8zwNkSYQWQwk6olEj/d5f5mjOJZ4U+f0MhMbMU3Q1Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Fri, 29 May
 2026 15:28:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:28:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 30 May 2026 00:27:41 +0900
Subject: [PATCH v3 1/5] rust: inline some init methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-nova-exports-v3-1-1202aa339ef7@nvidia.com>
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
In-Reply-To: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY6P286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b14f1f9-a66d-4a58-72af-08debd96e2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|18002099003|22082099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	FAnWoEg967h//k9crJc7YJ3UFnSY8kEjhSSIpj354vskC+4YvTeXxAwvktuc0gxETNoDQUQeCpEURJJtmwXvl23wGhZnoiphmq11utDRoURg3SNOb5Pm6kizT/tskfCWb9Q0l+6xb5Hh02SGNex5pf2t4so9u33GYO9BGj5eMWiG2vFVt9gPYCRhkp2uDHneRzopoRsQLpmS03tOhreAbGncnNgOZPM6WZs1FUAXDWI+pD81ps+AGeckhY+4AWjhzHl4ASD0liV7XCIVNjtQ7i66a3M8ADCwAFEQxLs9Vr1zLalwp0GkFtGxHgfjA9x1w/FYkCezY0YobRjjLDEHKxvkBsIGLQ2lwK2WNANA/RYhSP0ooGdeOmEFaf0HRSqMeSEwGgxJAnel3Dm4q0DTvcL373b2d3UqF15CiOXmNvEMvnOxEy9CbqnzTjiy8XM715A6ILTQHRirs850MCLdD3xtlKCWj9yRQJd58LBn4g7w3N/Pb58HleVsdloFPzMS64qUD1qBpmiQgb3TePLAI4G096kBFrZEa6i+J4j3ZsseTo294iQLfCaiNAChDlvZ6hVrYWU6WXLTKziBCTHgxoULWfDUjTr4IIKjg7u2euLa8lWgHzlMagSQN0EP8W/1AihejQ9TM+RRbX5mR9euUK1TXSU2kf3cYinAmVnqITaijUFd3wLZZRl7CglwbcOndxIDsNN9uPW6sNGeJJqU1qRrm7kFPhvTkYXb/hJzN1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnJpOElrd0kyMkFMYWtoVHhnKzFmSzA5MkVjeHhyWjRtMVd6ck9nd2RpNzIr?=
 =?utf-8?B?Sk9YZ2tSdW5IOElTdldubTZMcUFhVUlxMjAwaDBmRzB5N3ZFZWo3SVpJMFdk?=
 =?utf-8?B?WDJhTS9ZQkF6TWx5TzdBMjg1T2ZQK2tacnkveDNuOEgzYkZleGdFQ2xXYlVZ?=
 =?utf-8?B?RmxvcDkwS2lnVHh0c3hiNlFwNEQwRStZVmhKZHovN1VlSGd2MWt3bVRlZlFI?=
 =?utf-8?B?QWlTQ1NkblcycVJwcDR2UnJObTk0OFo2c1VMTnREck1DeEcrY0QvKzJ4UWpR?=
 =?utf-8?B?V3NrNlRzZlN6MGNRMnkrTTVuUHM0clczQ0pVMlplZEgvNXBuVEUrUCt2Tjgr?=
 =?utf-8?B?bW9kY2E5Y0VRWUtOU1o4cnFjeFloWmo4U3k5Tk9kMWVhcFFLeWtVVDJLTC9D?=
 =?utf-8?B?WjE4REh5c2JZYzVqdVd4KzVRRzE0QlpBMkFqVDlXdUlEQzcxdE1rYjBnRnlx?=
 =?utf-8?B?NU50RTQvbmZoalltVHJIQXVYMFB0NXIxMnNsSTVBcDdZWUsvL3E4V3hvVDJW?=
 =?utf-8?B?djVuUjYybDdtK3B0UGxoNmkxUjJuZFVUc0tRZk1MMWQwQUJHaFhyRE1BTnRL?=
 =?utf-8?B?OTd1eDV5bUpTMkc0L1BTVlRRQlQwbzdmalJ2SzYrVFlrN0hLd3FsL2VyeVRZ?=
 =?utf-8?B?VzltL2RZMzdNZHpTWS9OKzVTUUxreGllbFp1T0tKTlhGNzQ5MVpJZ3pybm5D?=
 =?utf-8?B?K210QWJDbGUrTnRBOEhybkpmT0FaclhXUldRVmcwZG1wOUFLbTlUdmw0UGE5?=
 =?utf-8?B?eTdmTjBaWFJqdU12UHdRc1lWckd0WDFUd3pGSVZqdTNyeUttMVpNakhiZUFX?=
 =?utf-8?B?VC9BbzQ0VHdQUjZYRjYvOFZXWU1Pem1VQ20zWWRUcXMxVEhUVGZrUXRlOENF?=
 =?utf-8?B?bEtxU2dsTjB0WU5LVG9TeENzb1E3aHVYVHN4TUdWMXgzcmQ5d3IxdEhkY0V2?=
 =?utf-8?B?RHZFbUlPdTlNbkJqTEpZaU1hZlNGQkZSMVlwb1crME1BeFEvZGNpaGIvWXFs?=
 =?utf-8?B?RlRTYU9PcjNOYXNDSXkzdDZBUENkVDZhZlJXcGJqL2lXQ09WU0ZjeEViZHo3?=
 =?utf-8?B?ZVM1eDROWmpYUFF0Vk52MzdoUUx1c0NrQ1ZqTG1TZFdxMmdUbFY3NFV3WXpP?=
 =?utf-8?B?Vmdkdm16TUtqaDE3YmlZNTJIWDZrdDZrS3RiV3BvZG5yN2Q2eCtmbnJ3dklW?=
 =?utf-8?B?RUR2ZC9kQTRyY0FtRkZPMUIxSlBqN2ovSURvaUZpaHJ3TlJ1TWFBOENUcEJN?=
 =?utf-8?B?ZWVZZG0rS2h1MWJ0ZmYwSGhYRnFXaTAyRGRjK2NqVTZkY0hkRE5FKzlEczdP?=
 =?utf-8?B?QWwrODFYUlFKd0pTeUdOdTZ3eGt4VEtUWG43dEY2c3NmTnhHTEIrSkhOZms4?=
 =?utf-8?B?blNPUmRScHhsQldvZHNaaXFrSzlYTlNuNUVXa1NROUdIZFZkSnp3Zmljcnl6?=
 =?utf-8?B?Q0JUMVlQWkhmZWJnSGMwUGhOMWxGdXQrdnZxWlh0aHBiMkZTb0g4aGRzY1dz?=
 =?utf-8?B?UklENlRZVGV6MkJZb2VxVWNwVVVSZGphc2M0T0V4cFgzSDVDeElsSUVLcTNN?=
 =?utf-8?B?bUFTbDVRMjNSNnBiQk93bVA0ZUFZdzMyamkrUzVtYU5uY2RkL0NCcEtnYjc3?=
 =?utf-8?B?WFdyUXFET1ZJMGMzWWhyQjhCbHNHdTk1cWpvUzF6T3VvK2VINE0rVFN0SXdC?=
 =?utf-8?B?UTBadVMzODNjRm4rcFA3ZDVnbHM3ajhqUW9lNE1WU0UzczdxZFl2MjFoZXY5?=
 =?utf-8?B?aXoxS1dXajEvSkRsTWg2RThvc2hhaFdnSlBJUG5MQW1IVW92MFpxcU1tcHZQ?=
 =?utf-8?B?TVVFanlOL1diRmYrdkJOSUx2c2lZSmx5djhnR2JocnExVGc3aGdLYXZyVUtM?=
 =?utf-8?B?RnFvVU9waDZEcHVLRDNYNWRjdlNrMy95eTJxSlpnWEtINGRGckxtMmxjZFZR?=
 =?utf-8?B?c3RTTjhrQVJUVU5ZTWxUOWlkcTFVeU1Fam05MEVZbTZaYnp2eGIzY1gyQjFq?=
 =?utf-8?B?aVNOV0FzRWxZbFh2bzNObDZyUXlod0FPam1zRVYxK1drZnlrcEpjd2QyV2Z0?=
 =?utf-8?B?U0d3T294MXExSUl5RzQ1WG13dFYybFE3aTFlRXBwb2k0SU51aFJuNHRzVXhQ?=
 =?utf-8?B?RkZvN2x1VEV0R0wraUJpeVo1eUhQMjRJMmhYeC9PRFZ5cDZPUmpIaVFDZnc4?=
 =?utf-8?B?c0paczNoU3FudEVIM3BqdkFlblF1enRqbEpHNlVISjIxN1dGNzN6SlNoTFkr?=
 =?utf-8?B?T2owLyswdnBVQzE0d2M5ZkR4VHYxSmpraFg0MDhuOXhCb25PS1M5MGZxSTc0?=
 =?utf-8?B?WnN6TWk0NzRoSkU3UXd6czZHcDJzWEs5MWtVZkI0S0hiK0VIOUFPeXp0dHM1?=
 =?utf-8?Q?CglM32OoQ4bnnjKyUvmEaJl/vrZwqV7QLtsZYL3b9UtXF?=
X-MS-Exchange-AntiSpam-MessageData-1: Bto6NV3HJVKMDw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b14f1f9-a66d-4a58-72af-08debd96e2d0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:28:08.2497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/EAj2L4JRKQeK+ePjTaQRZr6o5aV6ynFhVey2WbtzyQzlINkOMlXw81Cax1PpUNNOFzHhmMqh/qrC5jkVfLCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-13406-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 71B1F6051EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These methods should be inlined for optimization reasons. Failure to do
so can also produce symbol names larger than what `modpost` or `objtool`
can handle.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kbox.rs | 2 ++
 rust/kernel/init.rs       | 1 +
 rust/kernel/sync/arc.rs   | 2 ++
 3 files changed, 5 insertions(+)

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
index 7a0d4559d7b5..b2f330d42221 100644
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
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 18d6c0d62ce0..b9f480040c55 100644
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

-- 
2.54.0


