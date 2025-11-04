Return-Path: <linux-kbuild+bounces-9394-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03428C309F2
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 11:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443251894091
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 10:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59712D9499;
	Tue,  4 Nov 2025 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o9VKszZZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010065.outbound.protection.outlook.com [40.93.198.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8562D6E57;
	Tue,  4 Nov 2025 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253832; cv=fail; b=H9f7E77zmK+C329crfZrlh9g4WI4y85coHcr/CHUztNYNdcnTVtnchgNsnK2ZLu7oo4Yicfg6tP/BqaDM9irj+eZMrMjaCKQFMc0e+jfvlZ+/FRh+X8eDK11p5JpntTO7EebrOZ5f8/K4gSJiPqYa0baeVKyzyT3NFokCvc8E+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253832; c=relaxed/simple;
	bh=U7/7ibwgzWlgAX9FtIXs1KvA5YoJnHi1R3yeBX+2XX0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=H/F+Qsul5ZSzt/4PVW3nd9tGC9BzsaqyFECR3BEUBJdYNlGmTQh71xtClrOB1pPIv9g1Yw9NQ+nD52SqwkUv7xyQzlO8fvUtgR+7W9kdZWhL0Bi9sp70UDv4boEstgUPOu9Jrb8y86ww9r1GQrL+T+aslZglS7Um1hp2KbCMAno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o9VKszZZ; arc=fail smtp.client-ip=40.93.198.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKI3YMpZYPoptZo1LtSUCaMT+s82/TXgjWrGjgDL+2ZycdRUqOY0xWE9ZnEaPOdnI68aAop/m2zQm4yWyZpWdPs/wIQK6+68egqhPlZSB7oS4WkjPcOlav99ykfszUg1f+O0ppZIiTrxrJ1rWfhiAvoK8EcpTt+aEXNvL4sOFFBC+IaaiJiUCrB3GvGXaC6XZ7cS9288SbryilyCrZfuEzOrwNlJMOS8xzgk14pOvXmBt6mL3lg9osXHTHFMue0XR0y7Ow9XgN255CedBon0Xf5ATMTS9hGKOospsCgrd9Nkjh58JSmMZ/Q7KR6MOpIo5PB5L/YDMf647GTAeu7s1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4kKo91n83bbGohQdDsejEH3S4K89Wd3AjiY5SXpc0o=;
 b=EGmr/ERYi4ytkIQXmX2EKu6lzlZW9AoRlstQwrdCoFO5cbvwzPbLoYeNTFZsb6nP7/tc4ebJ+q1d3iAJ0B20udkUXHCRt6JcVpxT9KFlt721xRmkrkduZGNR1Ya6dXUqOwF4ePj/GB2Z+fsPvh0XMP8/VnuKxFyLLyxvIPdTvnZpV2FZSVJT2skRrcQGVPXZ3WZ4BCXuZtHoQyIXLe0OF52zuR7q0LO3jtIhcnBYyFn7KtrmD3LyKPNHWSOUZc8bBL237wCrZTNAw+127jxD7/6lhFmitkqqc9s3hKzQhchTznFmzGJcnyWllYp1BxJ5Og1BBicyWAXw7wiScIoNDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4kKo91n83bbGohQdDsejEH3S4K89Wd3AjiY5SXpc0o=;
 b=o9VKszZZ/6jfuJzHUslSHYy7MAAOCP95nJAtHaIQYiSzlV0GP3BmpCFrM/d93KjYBMXGBi3aONtBPRrS8KyqYZ9z3u7eGgzY9EslZNKplNeGm6v9mYBcMji4/ZAKBsAxEN+PczQHNxDfxhdaRtcG+zRWrlpUyZEti8+ZJAeUxQBYZYIeLRlF454CsYGIduBB82bwArDwtqMG1s1IYk5bOnePcA50zIgqfvQErgdLOBG4F70Ong8v+lezMRC+h64qEpJQbJvWp7LeCQSQqfM+uGri75pMMJJdbpifv1HTukQUiPu4uxteUIMbn4FqBDyD9nhgVBhl+6Y/QLDPZ652Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 10:57:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 10:57:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 19:57:02 +0900
Message-Id: <DDZUUDRMJNC9.36PS0YTZCSFO6@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH RESEND] rust: enable slice_flatten feature and abstract
 it through an extension trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
 <aQiCeZE7eN_KVdZ5@google.com> <DDZ5J5OC26UH.1B8CGNEJGRTS5@nvidia.com>
 <aQm7LNwPwxm8HZ_I@google.com>
In-Reply-To: <aQm7LNwPwxm8HZ_I@google.com>
X-ClientProxiedBy: TY4PR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:405:378::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 983f3063-53b7-4207-04d4-08de1b90e43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEJLVHhjZTN3SHY5ckdtR3dTYWJEUG95WUxEVFpILzArYWliVmJZcUtFcGhO?=
 =?utf-8?B?ajI0OGpOV1Q2MDliNGkyNCtHQUJZTzdyNFdSOXNVMkl3ai9JemdEaTdmT1pS?=
 =?utf-8?B?MnBlNWFWRWM4c0dkNnF3MUFzelZQNnRrV3RiNGZXdERwUzlyTW9JUjl1YWFn?=
 =?utf-8?B?OXl0K0g1NE85L2R2akNmUFRMMmZMYjM1aWZ0emw3dWNOKzA2SFRqczVSNjhH?=
 =?utf-8?B?Q29kaWI2VXJHcnoxTzNHaVFlOFpVZ2huTFBNaFpzUTY1OHVMNWZSeDBFOEV5?=
 =?utf-8?B?TE1idHBPSjZtdGlDTTdRSG1FSUNjd0YzNDZZL0Z6djNtRzc5RDFsWUcycDJL?=
 =?utf-8?B?ZkR2Qk1lVWFhR1dqcklRUUdpaXFrUDRKeHVJZW03MnRGbFUyLy8xMzlOSGJR?=
 =?utf-8?B?d3FpcGJXc1hiMHZBNjFSM01SM1VkQnhKS1dxR3l5TVVrVStONjNISFhLclIx?=
 =?utf-8?B?T0g1YThwTEcvb0JzN0hNREZPdE1adDU4Ni9qNVc2OWNpSFQ3UDNlbVNteGRC?=
 =?utf-8?B?NG90MkxxcVE2MzgyL3BLbkFDZnZweFFBdGpPM0FoQWg0VWJVOEV5NFI5aFQ4?=
 =?utf-8?B?SER3ZGdlSzA5MktIYzdHdFpRdWhaZWRyUjhEUlpnck5KcGsxWWJtb3RydmRY?=
 =?utf-8?B?K2c5aUVaeitxRzhPRksvby8rLzliZlkrUm1zcmlXYU9FRE5LOXhPWDI2aHhV?=
 =?utf-8?B?NzlKYUg5bmVBeFJpWnUydGM4am9xaENDcnFld2JnSTVXSlJjZm9aaWZRT2RL?=
 =?utf-8?B?aG11UkVVam5XTEhXR1lEZ0xaSEdhcUE2NEVXYWpkdDI2SWJjYkFjMXBMcHdW?=
 =?utf-8?B?NjAxeGI5R1pPM05ZdDB1NWlUWFRoMkw0Tk82cGkwdW56cTYzb055Y1ZLVGxt?=
 =?utf-8?B?aEs5WHNuamZ2S0RxcDF5WUI5c2taRzJwQWNlU3A0UEJFSGdLNVV2VmxGS0p2?=
 =?utf-8?B?OEhFM3JGcHhuNmEyS0hwSTFBUE5EY2JudHJmUFoxYXJKc1puaDIvSEFWallJ?=
 =?utf-8?B?Wi9Bckx4d0dEUkFEWjNnaEtzMlNTQUEwL1pTWHF2MU9zY0lJZXZFMkVicVVx?=
 =?utf-8?B?cDhjY284dnVwcHpidjVnSDQ5SDhaSVhJbk5nYThhejMvNUU4V2RtZzBFSHNI?=
 =?utf-8?B?QkNBbkVsUjc4U0JBcUsyeTc5OGxFcFZibVZMeWZTT2RPRlF2dThMNU5HQXZJ?=
 =?utf-8?B?eVNzL2F4TlZKYUx0dmpPeFJTSUh2QVQwZlVjOGZ0WEczMGFZc1dXb0lUYzlk?=
 =?utf-8?B?V3VMdVc1WWNCVTZ4YUMvaTB5Y1FlUE5oVHFBODV1R3RYanJwd2x5YmIxVTMw?=
 =?utf-8?B?bkJObWNWMlRNWktzVFpxclV1WDJQbjJYa3c0TERBdmYwRUpselFBWnRwSTZw?=
 =?utf-8?B?MmNuOTRZdGZPNHI0eUR4YjRiOGxVWlRFU2tzZ2Jhdm9jejdGMHNXOE1NVXVZ?=
 =?utf-8?B?aGlackJoMTlhWE1MN3UxM05OOVNsZVM3dklNSjR3R051Vm44cGJwcEhIb3BU?=
 =?utf-8?B?Zi9TdEd0Q1JENVRNSXorNTB2RGVkTDRkYmk4NURPQWZmdUMyQ3dOWXVYMXNE?=
 =?utf-8?B?eEY3aWlQbmVIMG1qTWRiOExYa01NUnAvS0FwRU9lUE83Z3VrN3hQbEQydUFr?=
 =?utf-8?B?YU5RKy9hL2lxYmIzOGsvTDc1amovbUJxS3NPQktTS0F1L284SVdFTFVQNUor?=
 =?utf-8?B?MWthSnVuS0Y5QUJUVGxtQ24rTURuUU9rN0dCTm01VXVwS1RVbjNnSmxqSnNw?=
 =?utf-8?B?dE9vN0Q0ZU1KckExcllzcWltNkhia24wK1JqYURhSjNxOVkxb0NSMlU5MVR6?=
 =?utf-8?B?dDVNanZDMnN0aDUyaHV5dnRjVG8xa2lqYTUrczVQZXZKanZDVEhGb1dhYXov?=
 =?utf-8?B?Vy83RGZsMHVabldFK0JtMlBNOTk4dmhSKzUwTURkZ0wvdVdFZkRDcWN4WVIy?=
 =?utf-8?B?c2J4MjJ1bGEwdWxPZkx5YXFxYVpJdDQ4TnZGNVltWXdsS3diWDhRS3JQUTZv?=
 =?utf-8?B?VFJMK21kNWlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2sxZjc3ZHJGM1RsamljZWxVOHVlVGJpN2M0WXNCUXVtZndFdDlwT0YyN253?=
 =?utf-8?B?c0g1RzZhUmh4ZVpHYzhmTVZGRU5BSVNPaDVSMy9mLzBSMWQ3SjR0eFpTdnJ0?=
 =?utf-8?B?KzdpMUtrN29ZTWlkbjVGQ3V2dFRDV1VvaVp3Wno0MVhMblRUaEhsQi9ZRWxm?=
 =?utf-8?B?SFhIaUNBQU5zOENDek0vMzNlNThsQ0FoaXlDalNMeW5ITjJUNnNQUjZMeVQw?=
 =?utf-8?B?amNLcDFRSDBkVlNZWUxuR0ZQdjROMnJDbGw3azAwNE1XNHhvQ1VJZHFEQ3JF?=
 =?utf-8?B?NkxFSmRwN1p1RkVsUXg4ZXc4N0VOSzZuL25mZm12bUR4MElyTHZFcmd2WTh0?=
 =?utf-8?B?c1FubHhZZGZlWTJhL01HTS91ZnR5bzNDcjlETE9wT1BjYkFXdG5ZbnFYcjRi?=
 =?utf-8?B?RE5ST0FSN2wrU2lDL0dkS1NYc1RxcGJFUERROGsydW1pZWR2Ynl1U0g2Q0lE?=
 =?utf-8?B?aFFKajFjTEcrTXo1OTdJUk1kNW1xOHY2L3pESG1VRjAvSU1sRmpMMUdMMUdN?=
 =?utf-8?B?OUpRbUpBNTEzOWVRazZ4c0hWQlFBN2RFYmdkd1lUTDV1NzFCeWNoeklRUnVq?=
 =?utf-8?B?OVY1L1l3RklqQkZQeC9DVHBaSTU1VmJibmR4VlR1eHFDTHVnQUJ3TlhyT2lN?=
 =?utf-8?B?YmorRVpkdU9qcTJXeitSSzEvc3o5ditKbVhHelkwc1J5R0FHTCs1cWJaWEtE?=
 =?utf-8?B?YzhhRVQ3bTIyM0lpcmVHeXNqYjRoVFVBMlUzMDg3RGtOVGZTcFNSeFpBcW4w?=
 =?utf-8?B?eStrNlZ4RHpyRXUrL21kdGExNWtOYnFzRmM1TElGbTMyMVhnOUVxNUNhSHJY?=
 =?utf-8?B?czA1ZmNVMC91NmZrTWRpc3FCaGZ2STNNQysxYmRNTFplMXkwNkFwaEN3b1Y1?=
 =?utf-8?B?MU9YclFXSXpLaUtzNWNvZGs1M2QrcWsvUjhacnBSaHNZa2hHaHVCcWNaUkpG?=
 =?utf-8?B?eHdpTHZQZmhyS2hGcmVTdGJVMnlYcllWdE5SQzUxNFpNR1pjd0xHZ1BxR1du?=
 =?utf-8?B?MytCZTFSem9GZ2NFODJSbmdqNTNhbkczdGkzcDlPTzVTNyt1OS9SUXo4YkJj?=
 =?utf-8?B?bGZlMTd3TU8vYVRpS3A4VWZYZ0lvVy92Z1MrcUVwUWtMQ3QySEFPNDZQbmd6?=
 =?utf-8?B?R1kweGp5OVUwVTJKOHgrL04yV3dvLytWK3pVd25wRWc2UDBWYXd3VE1GVGRw?=
 =?utf-8?B?YXZ6akltdllqRjJwSzhaOUN3YzJrOVBOdHZrbmdSSmhZU3RZd0tTU0FPN3Zw?=
 =?utf-8?B?VVd2N2liQlNCa2M1Tm9hQzVSYmtSby9NWG5sRmZuSGpHTWlGeTYzMVUyWHpZ?=
 =?utf-8?B?Wk1NQ2haRDZ5OCtRRnd2OUNRN1VDQWdSUzFUb0ZUZkJtdlZyN0I5KzdkcEp4?=
 =?utf-8?B?SDNnMjY5S3lncXVuQTd4U3oyallkVER4Zlhna3BrMktVVkJRQU0ySHp1NXlh?=
 =?utf-8?B?RHhNcTZzUUpvZGpIZnJ2VDBQWCtJb2hkMEljckM3dVJSRWE1cXNSWUlKN244?=
 =?utf-8?B?L1BVdjFRV2pOMWZxMDZUWVhpMjNrRVFuWjk3bFg0Ujl2dStMcjVmdVdTUlli?=
 =?utf-8?B?ZlZaclk3eUlUbG5iRDQrRnpJTUpkTTVZZWFhTVgvVDJJa0RnQ05hS3c2Ny9L?=
 =?utf-8?B?UVp5MlFVZ1NudG43Y1BqNjN3TTh2OUdmZVRGbkRvOWI2NC85U2lEVmxlak56?=
 =?utf-8?B?K2ppZXBTMjRydmFVdUVsS2VpL3o1WWJ3NkZMengwK3A0eTBlNEhsTmI1dC8y?=
 =?utf-8?B?TG1hU2UyZjgyZXVtOC84KzRZMWJVajZ0SkdyR0thL3FyQzhHS1JjZmtISGhH?=
 =?utf-8?B?OEh4OVR6QzZsamtZMUFEbXVpcGhCRUZyK2t2WWJmYWVwdnIxZWxBT25zdjhl?=
 =?utf-8?B?SGU4M1FXR3hUei9FWWM5eDR1cU8yQzVEN2FScDdvQkJzT3NCNGNNVFEvcVNB?=
 =?utf-8?B?TmVib2l1Skk1ZkNvVE5aQTZKWENTMUFkbnpXU0F3dkNacnZFczh0UDQvSXdP?=
 =?utf-8?B?aENVRGZhMFFSOTJSM2gyVm9XVzR1OXYzVnVwS3ZQYVpzY0tweFUwZksyWlJV?=
 =?utf-8?B?Z2ZEVUROelEzbmkySWNzQWE2OURDbGtCeGF5YW9EWDg2VEdyNHNUcU9BbjZ5?=
 =?utf-8?B?OUcwY1Q2a1pOM0JVM043N3FyU1VCa2xmVDYyYzRlOGV4KzRFTGhpeHRJUzcw?=
 =?utf-8?Q?QnMxhfz5KS+cwrJbGqAJVBhwLRNjBG6M2tvrocqBNIKF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983f3063-53b7-4207-04d4-08de1b90e43e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:57:05.9027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCKwxag/Vt7tRBBwwT12pXUR/ko8caP9NPE35zGzd6fNpON/zwjNSoAwbgHL/k0Z67fo65b7VIDLHjId8lhZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890

On Tue Nov 4, 2025 at 5:37 PM JST, Alice Ryhl wrote:
> On Tue, Nov 04, 2025 at 12:06:54AM +0900, Alexandre Courbot wrote:
>> On Mon Nov 3, 2025 at 7:22 PM JST, Alice Ryhl wrote:
>> > On Sat, Nov 01, 2025 at 10:31:38PM +0900, Alexandre Courbot wrote:
>> >> In Rust 1.80, the previously unstable `slice::flatten` family of meth=
ods
>> >> have been stabilized and renamed to `as_flattened`.
>> >>=20
>> >> This creates an issue as we want to use `as_flattened`, but need to
>> >> support the MSRV (which at the moment is Rust 1.78) where it is named
>> >> `flatten`.
>> >>=20
>> >> Solve this by enabling the `slice_flatten` feature, and abstracting
>> >> `as_flatten` behind an extension trait that calls the right method
>> >> depending on the Rust version.
>> >>=20
>> >> This extension trait can be removed once the MSRV passes 1.80.
>> >>=20
>> >> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> >> Link: https://lore.kernel.org/all/CANiq72kK4pG=3DO35NwxPNoTO17oRcg1yf=
Gcvr3=3D=3DFi4edr+sfmw@mail.gmail.com/
>> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> >> ---
>> >> This patch was part of the Nova GSP boot series [1], but since it
>> >> requires attention from the core Rust team (and possibly the build
>> >> maintainers?) and is otherwise buried under Nova patches, I am taking
>> >> the freedom to send it separately for visibility.
>> >>=20
>> >> Hopefully it captures Miguel's suggestion [2] accurately, but please =
let
>> >> me know if I missed something.
>> >>=20
>> >> Since the Nova GSP boot series makes use of this, I hope to eventuall=
y
>> >> merge it alongside the series, through the DRM tree.
>> >>=20
>> >> Thanks!
>> >>=20
>> >> [1] https://lore.kernel.org/all/20251029-gsp_boot-v7-0-34227afad347@n=
vidia.com/
>> >> [2] https://lore.kernel.org/all/CANiq72kK4pG=3DO35NwxPNoTO17oRcg1yfGc=
vr3=3D=3DFi4edr+sfmw@mail.gmail.com/
>> >> ---
>> >>  init/Kconfig           |  3 +++
>> >>  rust/kernel/lib.rs     |  4 ++++
>> >>  rust/kernel/slice.rs   | 63 ++++++++++++++++++++++++++++++++++++++++=
++++++++++
>> >>  scripts/Makefile.build |  3 ++-
>> >>  4 files changed, 72 insertions(+), 1 deletion(-)
>> >>=20
>> >> diff --git a/init/Kconfig b/init/Kconfig
>> >> index cab3ad28ca49..7da93c9cccc3 100644
>> >> --- a/init/Kconfig
>> >> +++ b/init/Kconfig
>> >> @@ -147,6 +147,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
>> >>  	# https://github.com/llvm/llvm-project/pull/130661
>> >>  	def_bool LD_IS_BFD || LLD_VERSION >=3D 210000
>> >> =20
>> >> +config RUSTC_HAS_SLICE_AS_FLATTENED
>> >> +	def_bool RUSTC_VERSION >=3D 108000
>> >> +
>> >>  config RUSTC_HAS_COERCE_POINTEE
>> >>  	def_bool RUSTC_VERSION >=3D 108400
>> >> =20
>> >> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> >> index 3dd7bebe7888..2581a356d114 100644
>> >> --- a/rust/kernel/lib.rs
>> >> +++ b/rust/kernel/lib.rs
>> >> @@ -21,6 +21,9 @@
>> >>  #![feature(inline_const)]
>> >>  #![feature(pointer_is_aligned)]
>> >>  //
>> >> +// Stable since Rust 1.80.0.
>> >> +#![feature(slice_flatten)]
>> >> +//
>> >>  // Stable since Rust 1.81.0.
>> >>  #![feature(lint_reasons)]
>> >>  //
>> >> @@ -128,6 +131,7 @@
>> >>  pub mod security;
>> >>  pub mod seq_file;
>> >>  pub mod sizes;
>> >> +pub mod slice;
>> >>  mod static_assert;
>> >>  #[doc(hidden)]
>> >>  pub mod std_vendor;
>> >> diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
>> >> new file mode 100644
>> >> index 000000000000..7e837bec4bed
>> >> --- /dev/null
>> >> +++ b/rust/kernel/slice.rs
>> >> @@ -0,0 +1,63 @@
>> >> +// SPDX-License-Identifier: GPL-2.0
>> >> +
>> >> +//! Additional (and temporary) slice helpers.
>> >> +
>> >> +/// Extension trait providing a portable version of [`as_flattened`]=
 and
>> >> +/// [`as_flattened_mut`].
>> >> +///
>> >> +/// In Rust 1.80, the previously unstable `slice::flatten` family of=
 methods
>> >> +/// have been stabilized and renamed from `flatten` to `as_flattened=
`.
>> >> +///
>> >> +/// This creates an issue for as long as the MSRV is < 1.80, as the =
same functionality is provided
>> >> +/// by different methods depending on the compiler version.
>> >> +///
>> >> +/// This extension trait solves this by abstracting `as_flatten` and=
 calling the correct  method
>> >> +/// depending on the Rust version.
>> >> +///
>> >> +/// This trait can be removed once the MSRV passes 1.80.
>> >> +///
>> >> +/// [`as_flattened`]: slice::as_flattened
>> >> +/// [`as_flattened_mut`]: slice::as_flattened_mut
>> >> +pub trait AsFlattened<T> {
>> >> +    /// Takes an `&[[T; N]]` and flattens it to a `&[T]`.
>> >> +    ///
>> >> +    /// This is an portable layer on top of [`as_flattened`]; see it=
s documentation for details.
>> >> +    ///
>> >> +    /// [`as_flattened`]: slice::as_flattened
>> >> +    fn as_flattened_slice(&self) -> &[T];
>> >> +
>> >> +    /// Takes an `&mut [[T; N]]` and flattens it to a `&mut [T]`.
>> >> +    ///
>> >> +    /// This is an portable layer on top of [`as_flattened_mut`]; se=
e its documentation for details.
>> >> +    ///
>> >> +    /// [`as_flattened_mut`]: slice::as_flattened_mut
>> >> +    fn as_flattened_slice_mut(&mut self) -> &mut [T];
>> >> +}
>> >> +
>> >> +impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
>> >> +    #[allow(clippy::incompatible_msrv)]
>> >> +    fn as_flattened_slice(&self) -> &[T] {
>> >> +        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
>> >> +        {
>> >> +            self.flatten()
>> >> +        }
>> >> +
>> >> +        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
>> >> +        {
>> >> +            self.as_flattened()
>> >> +        }
>> >> +    }
>> >> +
>> >> +    #[allow(clippy::incompatible_msrv)]
>> >> +    fn as_flattened_slice_mut(&mut self) -> &mut [T] {
>> >> +        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
>> >> +        {
>> >> +            self.flatten_mut()
>> >> +        }
>> >> +
>> >> +        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
>> >> +        {
>> >> +            self.as_flattened_mut()
>> >> +        }
>> >
>> > Hmm. Why not have this match the name that this was stabilized under?
>> > That way, when bumping the MSRV, we can just remove this trait without
>> > changing the callers.
>>=20
>> I expected that doing so would clash with the methods of the same name
>> in `slice` on Rust >=3D 1.80, but instead I just got a warning that my
>> `AsFlattened` import was ignored - it looks like Rust did the right
>> thing and picked the non-trait method by default.
>>=20
>> So all we need to do to make your proposal work is to make the import
>> conditional on Rust being < 1.80. And we can also make the whole trait
>> and its impl block that way.
>>=20
>> That would actually be much cleaner! Thanks a lot.
>
> One option is to put the trait in the prelude on relevant rustc
> versions. That way, users of the method don't need any conditional
> logic.

And with that last touch I think we have reached perfection! :) Thanks
again.

