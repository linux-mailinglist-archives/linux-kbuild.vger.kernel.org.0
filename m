Return-Path: <linux-kbuild+bounces-10099-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D208BCBD7BE
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Dec 2025 12:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 854D030109AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Dec 2025 11:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFA1314D2B;
	Mon, 15 Dec 2025 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="yx61EduW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021123.outbound.protection.outlook.com [52.101.95.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4421DED63;
	Mon, 15 Dec 2025 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797590; cv=fail; b=uSAPqSSKX/dFCWshPEMX/ZpuEgeg1ZyYO3bNsjgCzWHoyhVkmlVAibmckLwoOi8tX8KJE75DxM27Manoc5tMXo6s2Ec2OEWpMEis2RweDg/Hr7JwsmFPdF6WdkWXXPemRj5+mvXXM7FS6mU2Q/aB70Wz2OUjklt+iQ0J7GQ/qfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797590; c=relaxed/simple;
	bh=KougABnrxC8UuhUNqQL5l7GtP0b0oi1vlaTWPB6GzpY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MHMYZh94VqFIRRqVeJjlyHOExtARKS7cHEZhpdCZPNGF5yAmAeNAFjCuUxlI+sTbG0JUzqd2hm/kdxS97AmrkNJcnm30hiGHJkwYN0E+2gyQEhxHULn1x0w/SxmkxyVYc+wllXRgvfNe2resz65TGoMnLTra/Oht7D51Kjy0DY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=yx61EduW; arc=fail smtp.client-ip=52.101.95.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvJWlZcEaAREFC1vC4v6H+6QHjoYJ9IK3UhnJ8aIh1wPiRmAgmFeYlx+eBOEANcTkwEbIeqPqwM20rwHc6VcmMtQtKc+QQ9s04aOtNqW0jXp0VAt3Kam1NklEUl2+H2RJYQCZLoEeRwbXwcivFt8HhC/2TttlccP0gZkUPMKi1GhMaKaCVxW65KuZvkOGWTJqWsXUFc60p4xJqkkKnbCL6Qy30rS2E2CTAFzEGVG8p74nfdvSEteJ6yaVhctFarBkmGKcA8fhZ54hyrz1Cl18RRNGK53noZ1TvyyymVJUkXLKv7c6PBGRWeTv30wNqHJ4Y+pjRPIv9UNjBV+9Irt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KougABnrxC8UuhUNqQL5l7GtP0b0oi1vlaTWPB6GzpY=;
 b=VYT7n8R7nBaj5peA9ZztHkXZTRUWdkG0TbyBvTd9vuOJs6Zram1mnGxJBrTzU4b4NSaetzg27UjRJwVeXY8CwspoDP65tN6xqQhNJc6oRcdFC4tn+xALvFYqOORIGSbnhloWO6UXp6Bke33/82KnK6cUx0c5wLDf6JaH8zax1P8vjrhtkabQHIldel5442Zt5Yi8z+puv2Iw6F4RpFTSl4y4QG6ouzycg8Ab7KUpgQthldH6grnUfHTrLNkwt2nlj+2qs4EfqxHT2QHWoi4mID24tQD0TwxOYQ9PZA6oouEQUkDd3tX8n68q2KLKMka3oxjYQFTxuusfEmfeP6YFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KougABnrxC8UuhUNqQL5l7GtP0b0oi1vlaTWPB6GzpY=;
 b=yx61EduWDId4JGbyqA6KJwnRjDAUxH+AOUPvGaVvPqMZcGHf6DsJpdujAccOI4fCxhwLQ4Ax6QXSpsPoHsQ+0HvT/KbkZckKVtYbMKpzLHJM6c87M5iOWUB3Ff3bz3GeLw82c6hM6M0hYCYR3uI1RrgLiI1GqwOh0vsF/kdZCjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO3P265MB2010.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:19:43 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:19:43 +0000
Date: Mon, 15 Dec 2025 11:19:41 +0000
From: Gary Guo <gary@garyguo.net>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Danilo
 Krummrich <dakr@kernel.org>, Trevor Gross <tmgross@umich.edu>, Benno Lossin
 <lossin@kernel.org>, Linux Kbuild mailing list
 <linux-kbuild@vger.kernel.org>
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
Message-ID: <20251215111941.6c7817cf.gary@garyguo.net>
In-Reply-To: <66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
	<CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
	<66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0605.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::7) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO3P265MB2010:EE_
X-MS-Office365-Filtering-Correlation-Id: 031e6b62-ed50-4dad-bbac-08de3bcbd8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzFFMzBQNS9HWGU1VXlOOHdxN1FMcHpmWVRrY1NYbDc0QVhuK3BNN2R5REg1?=
 =?utf-8?B?VHl5VWdPZUxUYURTQ2ZqeTdlMFdyOGFVc1JqVjlkZ3ZwallpOGE1bjRXK2U0?=
 =?utf-8?B?U2tPVHVIczY5WWUxTFF3U1NhS1JvakdNYUVCUWhycXRyZCtJRmR2L0YxcjVD?=
 =?utf-8?B?ckc2bnNhellBRG1mY0tva2MrV1pMQUZCT1pYa1IybndrSXNNbzBZSE5lNUsv?=
 =?utf-8?B?UDkwcGVqTnlTTTlZS1dOUUhUYXJ6U3R0ZHprUk9kdnhJSkZOMHNoT3o2c2dO?=
 =?utf-8?B?RDZRYXZNdGVka1dpbWZEWW9PamllRGdMUmhQT2tpZjZqOEZiYkVkYXZHWVls?=
 =?utf-8?B?RXVFbWp2V2RiRzBqekovTlgvMldCeHBERXZTQ0FEWHpJMjRuU21YaXhCTks3?=
 =?utf-8?B?UUxnMnd1U0NpQWpnZDBvandNY1MvemxBTEVibFZndTlWV0JSayswc3ZBVnZn?=
 =?utf-8?B?amEzSmVra0RkaHVwZVdsY2ZtOEl6QVhUZ0RxUUNjZlduVlF6d0dIc2gzNVZp?=
 =?utf-8?B?Y1FaYzZ4MzhQS3Q5OGprWGg5LzE5NzNNQ1UrR1ZwMG9TZlRSTHlmVXNoeFNo?=
 =?utf-8?B?cmpDampEWmJmOFBaVTJQaEFmdG5BVWx1cngvZE9XWkRJRlZKVnp1OUg2ZzZG?=
 =?utf-8?B?ajIyb0V3Zm55WjV6WFRkZUZpM0xuZ2xyUXJ5MWxjNjJCNXMyWEphRXV6c3B1?=
 =?utf-8?B?TFlnd0NmN2hvYWQ3Q096K05uL2RLNG94c1hTd0t1bVhCcE9ERDFQd2ZmNGNa?=
 =?utf-8?B?UVEwWmNENE1wcUhtdnM2VFBIKzdXOC9NckhpclU3MUg1MTdJSk9DaUhSSHlH?=
 =?utf-8?B?cWNpRDJqbldMRjdVZUMxc3ZkWGV6WFhUWUlOUitEODZhWnNBYThJdkszVGJL?=
 =?utf-8?B?T1YwWFZQb280UEtnTDRqK1NKZUFvL0h6WS9FSk5QL1ovRmZvUmRWWmJoM0Jy?=
 =?utf-8?B?NjZQSDlZRTErRlBZTXhZa0xTeXdHK01ac095b2ZoREI3NG5oNDRlWlRYbTVW?=
 =?utf-8?B?RDY3SVAzV1NyMm9WRlRzT2VyeGdhNE1KNUhqMmRHVDBKRXpQd1hqMTcwT1Z5?=
 =?utf-8?B?d0lJb1d0bE1aSU4vMVFtbVBlNGZzQnpyRnZLNHBPdlhaVmVFZ0Q0Q1VjSjhL?=
 =?utf-8?B?UVQ4bDNpTGNUS0djMHluNXZjZ1lxY213L0VqZTVRaFNkVC9MSnZnVEk5emZx?=
 =?utf-8?B?WHc2aDFhSEh4VTJzWnloc3FjV3JFcWdGRTJKWnNGME40N3BNKzBNc2lsWXZx?=
 =?utf-8?B?MTdkME9ubTh1OUpHdktqbXRNeW1INCtuOFFMdGZ1R2UrSXRnYytuREUvbnVP?=
 =?utf-8?B?cDlycG8zSFVuZGpORDROZ1B6eXpoMVdGUlNSVXc3K3YxQlRGZ1NnS0pRYkJm?=
 =?utf-8?B?VGVMbEVDQkNiWmFwT0ZhS1d2R3BrdnVCUTg3bjhDU3ZwR21qc1JXNGVram5Z?=
 =?utf-8?B?OHhtUGJTV1V6c2RqMUZHaXFVZDRvZkhtL2c1TU4yYkZoNFBEQmEwYVBIdWNV?=
 =?utf-8?B?RzZmdzVSeVk2Sktnb1RHVDJadXpVK1czYURXdXZtZ1ZzeE1yWGJqaG5odDZL?=
 =?utf-8?B?RUJraDNsdjFNMlZUbDRFRnlDek0xVnNRRnA5SHF4ai93MWt3NU95S2E1WGVx?=
 =?utf-8?B?U0gvOXlQSjV3RU9WdlJaSGc1TElPcGswTmZsSko2a1gzVTNEeTJYNjhZMjgy?=
 =?utf-8?B?ZlhVSjhPU3ZINC9GQ2cydThRNGFlMVBPTEM5bm5CTUNzcTVqZlRRNXJhVDRK?=
 =?utf-8?B?eGR5cW1qamE5ZnA5ZENjYjI1N1VjOWtMOGlyUkZsTzAyRXM0RHk4S2RxNDYz?=
 =?utf-8?B?MWphMmd5dEZYTmZGY0RCaElMR00rSWtIVW53TFFkNHhianpJRHgvUWxjT2Fp?=
 =?utf-8?B?UmJCL3J2YUh2Y21RZ2YvVTY3TkJPcG9vazREZUpnOVFLUzd5SGM1cW93TjFv?=
 =?utf-8?Q?Fqqa0/nO62GWH+38T2XJGpJjQFNV+cgx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXJoK2RWSXRhZVA1Sjczd3FubUZoQmlLYjVpMlBxNnB5UEFWeGNRSUpzY1N3?=
 =?utf-8?B?QzZ6U01ncWRwODFnQ1N2NHgvb2hRbnkwYkVEbGtpMnF1UFMzdUZ2bG5vbVpq?=
 =?utf-8?B?V0lCSEFLZ3JKd3Z2YzVrS1U4S3dObFNSVHFzcjBCbWovQmRWcmdXbmZtVi9N?=
 =?utf-8?B?dmZkM0ExR2ZvODJ5ZG9tdENESTdCcDRTWlh5VzQ0ME8wYUhJajNuQ2d6VWZq?=
 =?utf-8?B?NG9rOHp3c3VjM013Y2tNWXFxeXkwZTVDOTdLZ3c1dUxMWkd6MXdKcXFxQmwx?=
 =?utf-8?B?Q2twNVZYMVU3MGtQOVZGRkxuSWVhTStMdkcwNzhFd1JTZXQzVHVDZk1qZHVz?=
 =?utf-8?B?Yjk2SFcxV01yTVRrdnZibTgwSXU3QWx0NUxKSEVvK2s0K2FtZ09ybXp1aU11?=
 =?utf-8?B?TjlDYW4xbUNWZGNMTGNUN1VTaHBLU2FlenBVcnZUUjhrNEJwRUxkNDBidU9P?=
 =?utf-8?B?KzM2YTJhYkE5UTV2QUNScTVFa0NNSG9JSUxtR2RpUkd1amZyamlCQVB4ajdX?=
 =?utf-8?B?WGZZWUZNdnFFbU8yTnVvZHR6aGlRc0xEa1BBYzJ4cHNGblBMT0dYbU9iWEpF?=
 =?utf-8?B?SElqcTNDS0lsRFFMOW9nTUYxL3h2aWNwVjJBSUJaODUvbDNTdmRybHB0TU8z?=
 =?utf-8?B?aDFRZEhWYzZJdG1vSG5Dd0M5ZGNibkRKTVhjK09veStBazVCOUNLaDA4L2NG?=
 =?utf-8?B?VGloSm1BU2xSNU1ZZ29jL0psK2pjeGF1dXVHT2JWT1NNSmFNbXlDbTg4ZlhT?=
 =?utf-8?B?M3VrdklGK2dXTlJzMUtmVkRBeG4xL3ZNN2NGcTFLc3EvSi9wclp2UmNBWjZ1?=
 =?utf-8?B?QVAzbDRFR1NLT3Zqc0RzZUZqQ3RUeGhmOEJyNTQ2VmNLZUVtVitVNEZ0Z2lj?=
 =?utf-8?B?WlBMM25oejFqSm55NWxnNFhYOWsyUE0xS0dXdmVnQktXazE0Mi94ZVVIVDdz?=
 =?utf-8?B?T2ZGZkFoMWg0blhGeHJMc3pTN3p2bDYxb0g2bCt0M2JHaEpuUnhqcGdCM3Bh?=
 =?utf-8?B?RUsvY055aXdHTE56UVp0Z2lnL0VEWFptellFVzkrYW9oSHJ1NXFpQjhQNzdG?=
 =?utf-8?B?dXY1aTBKNGxOOGF3VkFNVzh0RHNiblZidyttQmQ0NzQ5cXFkSHdlb29waGl4?=
 =?utf-8?B?cit4cm15QUtIMVRSWmVuNGFmR3NNcm1XS2VEZ0VDZjh4UkxNSVRETnZIaHY5?=
 =?utf-8?B?TGJodk1EbzBiOTR3V1o5ZXc0dFRKd2hrTG4vVEF6TUQ3VVo1YnV5Y1l3OGRP?=
 =?utf-8?B?bmxPVmNERjZPNVdMZUpsQS9HWWZxSUdJc0hLUVQwWStWVFdyVzRPbUdOOXpw?=
 =?utf-8?B?em1CQ0hTYkZHS1dNUDVBalhnTytpb3hFemV5enMvM21McEtwanFadGNNMlNE?=
 =?utf-8?B?dGFmRU1oQ1hMN2NJUzFXZ2srWEh6TVEyVjB0cFpDSHd0RUlIaURIUjJ3elpL?=
 =?utf-8?B?KzMzLzRDdWlNanVVV2FFR3RCZDVCVU0rTVpsKy9WVDRJQXhLL3FyelpiSmI5?=
 =?utf-8?B?S0ZLWGgzOHNxNjlDRGk5V2N1dkQ4cFFKS1puNVY5V2pWMXhZcW5FQVIxSWgy?=
 =?utf-8?B?Nm1IdDdRKzZFaVVaTjB0dnVpVXBON3lGbERGdHFOSERraW51clFVQ2xIUmg0?=
 =?utf-8?B?WkViK0xFeXJPSkNVVnpubk1XN25qV3hlUXROcEpQR1lRSTRENWYvS083MkVj?=
 =?utf-8?B?OTd0a3JCdlNoYStncWxYTEVsTjFCVndvQUdsd1lNdGEzY3lGNCtQbG1RbkdO?=
 =?utf-8?B?eW1aVzA4K0R5N2Zqc29Kc3Q1QWFER0UzSHZCRWtSRlowSlc4am9jZE85S2tE?=
 =?utf-8?B?ZGZnRDVYS3h2M2RZc0FSMlg1Z0Faekl2N3A5dHN4VWlyYWpyNmpTa2ZsbzE2?=
 =?utf-8?B?WmlnNUg0d292NWtMU29rUzRnZTVCTFBOcWw5V1NOSXl4aUdvRllubTJRUUp0?=
 =?utf-8?B?VmpzL3ZDbzBwUUNkVktWemgxMmF6ME5GbTZqUncrSUZQSjQ1U3lEK0VZR3gr?=
 =?utf-8?B?bm9Pb1M5WE5qTmYvYXNkNWR5WXJaVVg2MzJjQnV3dUVrOVgyZmw2NzBJcDdC?=
 =?utf-8?B?SkZtcnlMbi85cTFZbnVmdTZpRWQ0QXpDNm8wd2NUKzNKRVB4ZHNQbHpVT0t4?=
 =?utf-8?B?YjFwSXVsa1F2NW1xL0ROWVc1ejhSQU9vVCtsMmhaejdPTmlnbEcvY1VBQTdV?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 031e6b62-ed50-4dad-bbac-08de3bcbd8d7
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:19:43.6779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+jIDpkDd9AI1EKuoYqiC/PsJL6fSjlAjnenZHyF0tYNtiFb78b9zoJKpqNwuS5zE/XJqnAZYwQClNZn8ScuDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2010

On Sat, 13 Dec 2025 23:34:31 -0800
Rudraksha Gupta <guptarud@gmail.com> wrote:

> On 12/13/25 22:06, Miguel Ojeda wrote:
> > On Sun, Dec 14, 2025 at 12:54=E2=80=AFAM Rudraksha Gupta <guptarud@gmai=
l.com> wrote: =20
> >> - The kernel boots and outputs via UART when I build the kernel with t=
he
> >> following:
> >>
> >> make LLVM=3D1 ARCH=3D"$arm" CC=3D"${CC:-gcc}"
> >>
> >> - The kernel doesn't boot and there is no output via UART when I build
> >> the kernel with the following:
> >>
> >> make LLVM=3D1 ARCH=3D"$arm"
> >>
> >> The only difference being: CC=3D"${CC:-gcc}". Is this expected? =20
> > It depends on what that resolves to, i.e. your environment etc., i.e.
> > that is resolved before Kbuild is called. =20
>=20
> Sorry about that, I should've specified in the original email. The CC=20
> resolves to armv7-alpine-linux-musleabihf-gcc.
>=20
> When both LLVM=3D1 and the CC=3Dgcc are used, I can insmod the sample rus=
t=20
> modules just fine. However, if I only use LLVM=3D1, my phone doesn't=20
> output anything over UART, and I assume that it fails to boot.=20
> Interestingly enough, if I just specify LLVM=3D1 (with no CC=3Dgcc), and=
=20
> remove the rust related configs from the pmos.config fragment, then my=20
> phone boots and I can see logs over UART.

Which drivers have you enabled that use Rust? Just having core Rust
infrastructure enabled shouldn't cause issues on its own, apart from
slightly bigger kernel image.

If just enabling Rust but none of Rust drivers cause issue, I would start
looking at

1) if there're any symbols somehow being overwritten by the Rust object
files.

2) if the size of kernel is pushed above a certain threshold that your
bootloader/firmware is unhappy.

Best,
Gary

