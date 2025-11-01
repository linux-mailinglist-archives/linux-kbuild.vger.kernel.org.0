Return-Path: <linux-kbuild+bounces-9350-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A891C27F79
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 14:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C67A3A6579
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 13:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8ABF1D63C7;
	Sat,  1 Nov 2025 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DyL/BCvI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86369460;
	Sat,  1 Nov 2025 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003923; cv=fail; b=pdJ55K1TP4KdnW6byXkCptLzWxg0VhPB8CeR5tv2Q0wBWf5eVmPd1zhK7Q+p3OqCFPS/0rDQ7PCawXIISTs6Dj2MX8m/P13zA/9fsc33Hsg0vRb9VewGjPeODULcf65BW1PPmbe3bmxUMeaAjeHOImeLqrGU25xf5K47/c1bbsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003923; c=relaxed/simple;
	bh=PDZ4AFc4NSCPfHZ8HcnOZxZZ1+FfHQ7cLNkVXoCj1DY=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=cN8wkccSleG2Q+SJlLQYe0AT3e6XhZQV/HeFU2VFczDuoM8IoX+WX5RGwwpWDpQPhpSJukY19hQ9MAVKCUkxGInVc/QHKeXzC4+8HUnpz8iUy3qBPtBTi+ZeiZeuld6u1oS8Y7iJVUzjo9Pib1DYX7WTw/0+DRzikI8Yc3hoEhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DyL/BCvI; arc=fail smtp.client-ip=52.101.62.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyPuhdinhbsOj/+SfBBQiBCtcKc7cUBqWIZutyNz+q8Ja99BRJNZFoRFHl1bveIZx6B8wcAZY5MCE5MZAjqeJdis4qZ9iUinPKc0fySM4sgB5MWXRxs1nIQuOXgGTZppsZCWQICx5XoJmIZMB4cp55DC59X8rg7j9IjS3kS3aF9h2LYiFIapDvL6PnOJCpQrmLfNjc90IjfsPBfEH19cu48xSh7e4pEhSS0BXQ5bpwZWjCdWPdOK+q3lVktD6npCpegynNoNPkGSJhI5H4mDZMR188WpsAr5Spbum6ucmeFnL5Kz1pA/CWuR4t9dqMMVxfynngBf/X6qaCpC/4zsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mEgAv5Bn4mvCrAdKgB+xlDEcdXG1kDwyq6afph8h0E=;
 b=RaM4WhHQqjXYzjEp+fPmTvaCRGjQbwdMjtY8ZKZzY0DBv8X8P46VUwr5XRK1YL4xPdOlOAAZrN9Jh7fFv0AnZYAWs7qliJKIUgNVail+jytEZkWJf0aiYcnw4u9kjAwtKqjZJY0ib0ZmagcN2Q62yI0Jm6YD5scBoZchYMnm/fxaIOXGXS2NzzQjN4Z5BZx0dhS78sNYcdkh3xzwD7zIGsLma3kD+5EqUmN4L4lXxraA3b2iya1UJ9XfvpOeyrKkr0R2UG3ovp1c7g18+5Cd267hrxHA+TvvcosSuu2TdVitZZfoGfJHTBxiyOrP243aRl738CrW/zZBPa8Ni7AVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mEgAv5Bn4mvCrAdKgB+xlDEcdXG1kDwyq6afph8h0E=;
 b=DyL/BCvIgy709ceJrkD6LI0p0ZtEycPCR3zpJjnNGbA3hi4rjtpg/Qi1tdvUW3KG0fX7Eso1P1c6joYQVCDCQPTyfVYyxt0qoz3vmRhR8VE1eBuuoJoeGFfEEi8xliyKUnlw3VJuM6wY3UzvclwQlilelJvVd3rQKuyULDNINcAqBuMwIWnx6XYiq7ApFvZLR6vOdoiERCwypufLRhP9IcjX8v9oE7MbthOErRH7l8Is3gFH7tPVyTj9LFXhdQQ3jBckfaKB3ChZwnZ8kO8vm8+utMeloYG4d9J3/PWcosZ6Dp7KDNbcvLEHIpdsIqPvuisaUmFrX5brRl4UB/oEvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 13:31:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 13:31:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 01 Nov 2025 22:31:38 +0900
Subject: [PATCH RESEND] rust: enable slice_flatten feature and abstract it
 through an extension trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
X-B4-Tracking: v=1; b=H4sIALkLBmkC/x3MQQqAIBBA0avIrBvQTImuEi2sxhoIC40IxLsnL
 d/i/wyJIlOCQWSI9HDiM1SoRsCyu7AR8loNrWyNUlLh3KFL6A933xRoRTlrkt5Y22sLtboieX7
 /4ziV8gE6KqpuYQAAAA==
X-Change-ID: 20251101-b4-as-flattened-0b3e0f566836
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS3P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21f::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: e810c50f-7af8-4102-597a-08de194b0747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|10070799003|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmpRNExHUHJXYS96UkxhMmkzTEJ1NGlHZENXZCtTa1M0TXhwTWVvQm5lYVJi?=
 =?utf-8?B?b3RmMitzWWc5ZWxUQlcwN2kxdVZVU3h4cktHMkNMSXpqUzZVWVpMRzNMcHZ6?=
 =?utf-8?B?amd1Wk9OMzJHT1AreHNWVDJWbFJJb0VKc0lwRnM3NXFaN05SaTEyQVZybmhy?=
 =?utf-8?B?VHZMWlFQWi9La3J4Q21oS291TVdDRW1uSVkvQkVjdWN4YzdhYUViK1dtV0xp?=
 =?utf-8?B?elZsOFlsWFdSVVBIcDdVQ1loOEdEYm5MdUlid1dWTE03RlFuTFRucklyeEdK?=
 =?utf-8?B?YldoY2JUYnJ4emJOK0tpN1lRaFBtQ3hQb2FubWF0L0F6UHcwMzlHZXpsaFlN?=
 =?utf-8?B?amh3NTBFK3ZaVGdxZDZ4ZUNWMkxMMFhKdCs2clVzQTg2Q1JIMEo2SVp2dFZx?=
 =?utf-8?B?MGJQS29jL1pzYzFiYXBhMU55MzZCUnE0ODdNSnE5NmYzejlpR2RnVzJKWUJN?=
 =?utf-8?B?MHp3TmZSWWhmTkJUbVFPZS8wdDd5Z3ZpcDluUExXZkw0MElzNG90ZGJDLzlB?=
 =?utf-8?B?QnFRNk4zTGRvemdHR0Y2bk1OL0tBYU1XdXQzTm85TlFPSEdqRzR3VjNOUUtM?=
 =?utf-8?B?SXFXMVdSd2JHcUR4VUpmR1h2R3pUK1N2YVYrc1lzYTE4dlNSTThyLzJ2VmFS?=
 =?utf-8?B?UWp5R3Q2bHZQaHVEdksrWjF4eXVsY09oQjRqYkQ1by8xakNhKzFIbm5lK1JU?=
 =?utf-8?B?U1FvWFJvRkxKRVRJVGhXVW1kRzZyRFVBdlRmV2s5ZmJobTVRSGtoWkpZR3Zl?=
 =?utf-8?B?cjQzandYNlpqS2xtUUUvYzlrTXFLWDlMeWp6cEwyS25BQU5FdDZxMC9kKzlW?=
 =?utf-8?B?ajJmcTFYcDJOMDltV3FYN1Jiam5NcjZIeXV3cTlGaU1GWkUwZURFNTRXdmhx?=
 =?utf-8?B?ZlBOTzJQVWt4Q3lPMHlaaE1VVENjS21helpwUG9JWkhMS0R0Y1Q5OGFUbFRo?=
 =?utf-8?B?NUxKWER5YktJcTJrR2tuS3JDcXFxRzIwaHpYNFQydFhrNlBaUGhxZnQ1OE8z?=
 =?utf-8?B?dThhN2xxbkd5enpvZGU0MGhqSGlmeUtKRGlncitPdjZ0dW9WYjFhazgxNkJV?=
 =?utf-8?B?ajBqb20xUFhqbTdXMk1oaUo5L29zSkwxMlphYy9IbEV3YVA4bldoT1pnVWo3?=
 =?utf-8?B?QjR0QTJrZTFZZGpkZ1JuTUUyTjRTQ3lGNU5kT05wQzZyeHg2cE9LQ2RRamcy?=
 =?utf-8?B?eEtXTGRaSXlwM3kyUmRQM3NKSzE2TjUrRlU5UE55VWx3bmFzQ3hVelRMR3o2?=
 =?utf-8?B?ZjJpN0lIeTErMkdKNDB4WjVEUzFNazhldHBiSHBDQ0hkbXdXdHp1ak9pUkJm?=
 =?utf-8?B?WjBNd1ZITjNqTG5RTVBHekFDcHV2eHltemRON0ZsSHJZbTBOQlNubWpDcVlm?=
 =?utf-8?B?MStYZUJtendOZUJnVmdzRnZTSVh1amVZWDhDazA2Y1FhSzM2RVVBK09udXZj?=
 =?utf-8?B?UDM3eGU0N2FRYWxXREVFc3Jtclg2alVvUFdRVHFMbElNWnBKeS9wd2hlZWhJ?=
 =?utf-8?B?WXpiNDlxOWVLWUxCT2FWU0VmVElqRThLV3FmZDN4cktqOWNQaVM2QTdyQlhW?=
 =?utf-8?B?b1BBZG56dFR5SGtROXBGVEJ1TERQQ0dKNlFrcUxEbnZJelV6dDVFS0FDV21L?=
 =?utf-8?B?WTBoSVFhQVR6azV6Skc5UlV6TGlSeDgyREhST3hzSnIxQ1FVYU0wNXdIcFlD?=
 =?utf-8?B?ZjQvd28yQ0Q1NzlwaFBTUEY3OXlRQ0EyTEowVFh1UWZRYWRCalBLRkhvWVha?=
 =?utf-8?B?ditRanNLUG5LTGxuY0Q2bi9VRlkwTVVEU2JMUkRja1Z5OGRZS0laZUdrc05p?=
 =?utf-8?B?S3Bhc2JPZStjM3NsR1dWcitmYkRJYWwrSVBqZmkzRVNTeXNiODZtR2o1ZDNr?=
 =?utf-8?B?R3BoUkFtT3lkajZPYld2MXlqbkRiUHRPSmF0NE1RR0N6WUVBRmFkSU9yVzhL?=
 =?utf-8?B?OFZOWkVWNHhRSUt2UlViMEhzUE1YNEhoYm4rcFR0bnpoQ1NFYjhMdXZaR2Rw?=
 =?utf-8?B?NEVxcW81emRUc2lkaCt2TGNCTG4wbGxhZHUrSlpBT3F5RmJPMEduUGFkcEZw?=
 =?utf-8?Q?aFf8A+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(10070799003)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTVtbXdPRnBjUTdlMVZoVWV2N3RsS3BiWkEzQ2EwbFdUMmFvODBhT2c0QnFn?=
 =?utf-8?B?NmtYWHMvWW8xVTloNERTZ0lzNWlEbkdVVzl0UmxiOWkyVUtXVUVBcEFPeXps?=
 =?utf-8?B?TVNYbFlOQjk0U2FmV2Z1cU9UTElVc0cvdTFZT3VLSEVOVmdxQ3ZlNEFiZldT?=
 =?utf-8?B?VklyRm9RRjBZMzl4Qkl4S2I4S0tiQm1EWmVSTVNqZmdqRjQyNnJYZTlxSm9T?=
 =?utf-8?B?YXBpVXZkVlFtazhNNDkyNzdyc3NXejdKbWRndi9IeWRRd2FLQWh1UTJ2a0Jt?=
 =?utf-8?B?MXlrdnFVRzZBZis5ejF1amhwd3BUN3lPMDlVdi80cWwwQVM5SXczZ1VHQUJG?=
 =?utf-8?B?K0FqYzQ1a0cvc0UzVGFtYm5tN1hZRXZTYVM2RTgxTXZOS01aSkJkWnFmZGFu?=
 =?utf-8?B?cXM0L2w1OHZCK2xGdlhYS2l6SWMvRjNQTVFBc0lXZXd5QXFqMDV6UFF0d1hy?=
 =?utf-8?B?VzdMdHRJVTFlMG5nVUU2cTBYbXVUbnZWWkJxT2JEd3lHbU45SFQvdHAzUkxs?=
 =?utf-8?B?cFU1cGV6aEpUazRoRTYxUzNYQ0cvcFlxczhEYUk0UmQwYytlM0RnVmFHZ1RU?=
 =?utf-8?B?a2xQZEJBRnlIN1FWeG16Z0hJdDh5UHpVSVpOY1gxYlN0a0VvZDBQaGRrMng1?=
 =?utf-8?B?NFFERGd0Vnh4eFNRNmpza05VcUp3N0JqaEJtN2xyV1RmdkdBeXNSUjVraE93?=
 =?utf-8?B?cHJDc0pKT2NEMTR1ZUZaYzB3V0NwejVXMWt3ZWJpNWhTQ2czaEhuMlE4QUM4?=
 =?utf-8?B?WExMNnFZaEV1dzhRQTU3eVBJam5rT2Zpc2dWYzNjTFllOXB2aTFGSnNoeWFS?=
 =?utf-8?B?WUpRNCtUc0pLUXBvYXFIeEtJS1E3VXI3YXBTTGRvUE40U3ZyQXhaWE5QNzNx?=
 =?utf-8?B?cURWNHVUbG9ILzdXZklwWWxrYVBteEorSTRQOXdTc0kxYWdjNWZiSEZzU0ZB?=
 =?utf-8?B?Q3VtRUlha3NJbStSUHhRemkycENjVUhITnFOMkhXb2JnSlhsT1FBNFBGTXBk?=
 =?utf-8?B?bW1pSjBudllod1pHeVhaWnV2bytvZWxtTG5HZDFCa2ZZYk1RQ2EzUkdNSytl?=
 =?utf-8?B?R3N0WkpicEtkM1VUVmcwYXFwSGF3cTdBRk9SZUhRczVSNm9lUmtqemhsdmZZ?=
 =?utf-8?B?di9yajU1ZmlOUEd5aCtDTC9HTld5QStzbDgvdTc1Z25ES1FDV2I4bHlFRHdF?=
 =?utf-8?B?cm5rMW9FWGJpZmR1Z3BuS3JYVmY5T204LzYzQVMxeFpLUm9UMXM5ZHZBbUg0?=
 =?utf-8?B?NFhTZWpDc1RyZzdoQTdvbUs3L1cvZFJvN09aTC9kQ2dmNGJPSFRSSE4vRXNn?=
 =?utf-8?B?NHQxMkRCMFhIajZneEJIZUNqekRINno2Q3IwdVV2eXRiL3NyNlFsVFpwRWxq?=
 =?utf-8?B?MHpuaWF1TzdqV3FSWHNuRlRtNG1sc0NnVUNka0NXbHhTbFBxZDhzbWZwMGZO?=
 =?utf-8?B?Y2tGN3F0MmRjc3FVZHcySk5BRzlNM3dxVDF3QWlJdkpwM1htV05PUFo4VXpa?=
 =?utf-8?B?K2tKZldJVkVxb1JPcVl0VWh6UDV4R2dERnBTM1B2V2ZLeTBnb1czMm14YzRS?=
 =?utf-8?B?NGsxZzRRbVVXZkxMTGMwSGZPSEppSGVNRzNmc2k0M2dLRmk5bzBlNzV0Nk1z?=
 =?utf-8?B?MVVlZmJXYXlLL1MrcHUydUg0M3FjUW1TQVlnLzVDbzluOEd2clFIRkFhWVh4?=
 =?utf-8?B?dEFUeXdBVXBUd1RFRFg0V3ZlM2d6d0hBMEhGbm84WlRXQ3BjU1Q2YVh5MVdO?=
 =?utf-8?B?bE1OUWJ0ek5DcXpleGdWbWRrRGk2U205dkRJMDdCaWg3OXZkakVkeFJVaVJK?=
 =?utf-8?B?Z202blZyNVNSU0JhazFod3MvV2d5ZGgxbTFGV3U4UTIxUWRDWS9DZlNYVm8z?=
 =?utf-8?B?RmVXL2Y1NmVMRUNwa3R2WnY4Z0llc2xFUytiOUc1MmVUbXZNNng0QWw3Uncx?=
 =?utf-8?B?dGRqRGtTTHRDSXdjb01LdVAyWnlZS0l2cWVLcjZvSENpSXpzZWFLSzhtcGh3?=
 =?utf-8?B?VU04ajhpOURONjlGVHdjcDN5eUJsaUFlb0QzSVJZbHN6MUdRSzhwZ2syYjBa?=
 =?utf-8?B?TE5KaS9TTU1tRUFPa21pdFIyUS8wa3dFVlV1SHFSSEpFZlVxb1Rwam8zemlP?=
 =?utf-8?B?akk0V1dpTzBPOVgwMXpoaXQyaDUrZCtQM3c2VVFHREZUb1NraEZuK1ZCbUNW?=
 =?utf-8?Q?kKhg0RZ2/PYwNAp7H4ua70UoJwQHcz2frhR+Z1IjCKJa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e810c50f-7af8-4102-597a-08de194b0747
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 13:31:57.0816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioW2fSCqoYQqbsQE2ktw/XOPMnr6ikAys/lJjuuUMI/pZXp0cubeHRc+bZb+POKS76r/43EJ2tXUx+NHSfW+pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223

In Rust 1.80, the previously unstable `slice::flatten` family of methods
have been stabilized and renamed to `as_flattened`.

This creates an issue as we want to use `as_flattened`, but need to
support the MSRV (which at the moment is Rust 1.78) where it is named
`flatten`.

Solve this by enabling the `slice_flatten` feature, and abstracting
`as_flatten` behind an extension trait that calls the right method
depending on the Rust version.

This extension trait can be removed once the MSRV passes 1.80.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
This patch was part of the Nova GSP boot series [1], but since it
requires attention from the core Rust team (and possibly the build
maintainers?) and is otherwise buried under Nova patches, I am taking
the freedom to send it separately for visibility.

Hopefully it captures Miguel's suggestion [2] accurately, but please let
me know if I missed something.

Since the Nova GSP boot series makes use of this, I hope to eventually
merge it alongside the series, through the DRM tree.

Thanks!

[1] https://lore.kernel.org/all/20251029-gsp_boot-v7-0-34227afad347@nvidia.com/
[2] https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
---
 init/Kconfig           |  3 +++
 rust/kernel/lib.rs     |  4 ++++
 rust/kernel/slice.rs   | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.build |  3 ++-
 4 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49..7da93c9cccc3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -147,6 +147,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
+config RUSTC_HAS_SLICE_AS_FLATTENED
+	def_bool RUSTC_VERSION >= 108000
+
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe7888..2581a356d114 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -21,6 +21,9 @@
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
 //
+// Stable since Rust 1.80.0.
+#![feature(slice_flatten)]
+//
 // Stable since Rust 1.81.0.
 #![feature(lint_reasons)]
 //
@@ -128,6 +131,7 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
+pub mod slice;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
new file mode 100644
index 000000000000..7e837bec4bed
--- /dev/null
+++ b/rust/kernel/slice.rs
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Additional (and temporary) slice helpers.
+
+/// Extension trait providing a portable version of [`as_flattened`] and
+/// [`as_flattened_mut`].
+///
+/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
+/// have been stabilized and renamed from `flatten` to `as_flattened`.
+///
+/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
+/// by different methods depending on the compiler version.
+///
+/// This extension trait solves this by abstracting `as_flatten` and calling the correct  method
+/// depending on the Rust version.
+///
+/// This trait can be removed once the MSRV passes 1.80.
+///
+/// [`as_flattened`]: slice::as_flattened
+/// [`as_flattened_mut`]: slice::as_flattened_mut
+pub trait AsFlattened<T> {
+    /// Takes an `&[[T; N]]` and flattens it to a `&[T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
+    ///
+    /// [`as_flattened`]: slice::as_flattened
+    fn as_flattened_slice(&self) -> &[T];
+
+    /// Takes an `&mut [[T; N]]` and flattens it to a `&mut [T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
+    ///
+    /// [`as_flattened_mut`]: slice::as_flattened_mut
+    fn as_flattened_slice_mut(&mut self) -> &mut [T];
+}
+
+impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened_slice(&self) -> &[T] {
+        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+        {
+            self.flatten()
+        }
+
+        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
+        {
+            self.as_flattened()
+        }
+    }
+
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened_slice_mut(&mut self) -> &mut [T] {
+        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+        {
+            self.flatten_mut()
+        }
+
+        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
+        {
+            self.as_flattened_mut()
+        }
+    }
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d0ee33a487be..a84b9e3171a3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
+#   - Stable since Rust 1.80.0: `feature(slice_flatten)`.
 #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
@@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_flatten,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

---
base-commit: 9a3c2f8a4f84960a48c056d0da88de3d09e6d622
change-id: 20251101-b4-as-flattened-0b3e0f566836

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


