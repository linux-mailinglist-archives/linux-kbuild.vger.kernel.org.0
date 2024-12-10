Return-Path: <linux-kbuild+bounces-5066-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0E9EB51F
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 16:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F38C16AF45
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 15:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AD21B423F;
	Tue, 10 Dec 2024 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J38sp8Pu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDAB1AAE30;
	Tue, 10 Dec 2024 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844888; cv=fail; b=kQjfVy4hV5EUbfIKkRzOkoFah9b+y28dQbDCOCNdnPytzZmD7yUwA7umtOCTAdL5RUUQK9MXNznJaKri/M5LE5La/gtPCf7VGS5mDe/HJgoF/pT0sIW2yPwg109ax+pGPoZ5B+gTaj3d+pT5swdcflAiogBuMIwJsssWjqyL6mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844888; c=relaxed/simple;
	bh=eUxl1b2GAlGT7abwwgCsheESNSkmrPM8ZB5f9GlNKY8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nOc6+fcxQVHuFuB+vDuZ0AxKq9WgbnroSoLZjCvTEb/QQeh5OrIXyaRSnoywuzqx8bewGmafhVSYGxl5pNC/kGrgIz+Ag7+5252adCo6GKxg/IkWR5Y/3RAB27j05QDVVInfShYpLX8u4bH4zQaZ/cDe5mYANCyAyiUByAqvmt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J38sp8Pu; arc=fail smtp.client-ip=40.107.244.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZytGeQjDz4WXCwKyKNjeBRpQaTBBlxp87PGb/PFJIFL7oBlY72r+eTjbW2upzcZg1a2n0cIgHJfho+gkV3eV60oLDDVpczlEZekmsn6gJM9aMHWCuIdczuEo0WofgwHYfdK/oY+asLsWtYnrbHEPEprdrS4neoEk+ZXfttaluaSsro1neJ2GvCYEvlvbLsbuwuL3O0nL6DmUysjxWoB5XcRA8V6xkFAREEUtjuH4pTClvpC2ZLSYgQTQ6/w9ZCRZ00juUsWWsIa/5eN2r1Ea/1O3HjbB7pw9zaM3zCnwBw2qxE99gYegnJedkeU79NtLL+fF61kPpJ2xX0TpBP9XtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsXycm/gHpvYSrzliJkr6OOx416XemxzljsklgXY6Lo=;
 b=XNKbNBdst3sDO5kH7/G99SqN4EKd1n8Hf95p2s3yV2aTX1PzMZOCreCIZ3GmHngNyD5ZkZJrWgaT9+eJFWo8L+mZ58vL5ksVrlzjw2n2RhnFpt4UGfmMdYxq5LY55MUXiw7X9DxOq48+zVp+X6g+kmsLAMZF/Nf6QwaBHgvLhk4P6Nc1el2mh8yAQ6rXYtt6nMCOeioqzZBAdBSMAmVgrymzhian3hIeyth9Ws7kLZXTmQamnF8gGgcFIrQsLCSdrTW+Stke7Za6DJpnA5H8Y+AnzxN0V/nAjGlZ+hpHZxD3rDuewIRFfkTlmJ5Kg+UQ9ubL7FX+EZB2wnJo5eLyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsXycm/gHpvYSrzliJkr6OOx416XemxzljsklgXY6Lo=;
 b=J38sp8PuVG+2D7D1ofaLDhpOSkeQbL3UmFDk5LEXSYwnDay9/EOTL0zNNwqY/Lq5WM9e/+xVo3VCqNcnUt1RBA/o9xnTwwbk744KHSxbyrKOIXMAtaoC3ktGNiKV2C16YOC9W0AELjaY4hw8dYoEmzG6EDEMaAw27nf98oSS7+yqh9+qEx2++0wmXlDUOWCCI65PYgD2Es0+1b9Q0DXZeA4VqrpbwcSphLXdx2nY65cSVWL9qAAfx3HCNDaa6Ct4pGLD5jpWkxoCt9ur3uzjN/Fdf3gnbfm58UGPyo2jFfPTc9XJvYWRZ+HCjw5ikK35rrniym0XpjAYhDdwAxYU+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 15:34:41 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 15:34:41 +0000
Message-ID: <bdd5ff13-ec66-4ab6-985a-1fe433e85f91@nvidia.com>
Date: Tue, 10 Dec 2024 15:34:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 cocci@inria.fr, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
 <20241110013649.34903-6-masahiroy@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20241110013649.34903-6-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0213.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM4PR12MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b822ad-c2c3-42d9-4d94-08dd19302a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REVmdjk5TGV1dnJIWUNwMlRNa016MG5HbEhZYWFlL2VUOUlQTVhIeEhKQkFE?=
 =?utf-8?B?eXVnb2dZWktiWDBDY3R3dU5JZHdZMmtKYTYyejAxaFdJRDN5WGszQUJZTGs1?=
 =?utf-8?B?bkN6UEtKSE9PUktSL1VsQmg2eXFDNXpVdGZRZ05wNU5hcDlCNXVzR2VxY2RW?=
 =?utf-8?B?R3NuL085SlFxT3daKzJZZzNUZndEQW50VkFkQ05ncjZxakhCMkVXc0F6eVEy?=
 =?utf-8?B?Yk5Bc3RuanFOSmJSdDZXTzAxa21YdUFXYkFySnVqU2Q1QXVObnJFT1crWDlX?=
 =?utf-8?B?VjI0M2FVckY2VUhTVWR6YVZQb0lsQkVkMVdhbXZtQzhDdkY0cndheFgxOS8v?=
 =?utf-8?B?a1FaRFBTUnJENkhsejlCa00vSThWUk16bTEvSURzVHhkQncyYWhZVk1jZmhB?=
 =?utf-8?B?SWFmTkhSNm1XcWNBUVFDVVJ1YzRjeU5XRmw2YjJkU3dWdS90dXgwK05za09Q?=
 =?utf-8?B?cXV1RmdHRlU1N0RKTnlnMTkySGFqRzk5SXZyYkRicER3UGVPWFFISzZneUxC?=
 =?utf-8?B?RlQwY2FNY3F1Y0M4K3luaGF2WWpoOWZTL2IyRnBubTNiakwxK3dibVI3Nktz?=
 =?utf-8?B?NXdqSWVpQmhDSUlVY1RCSHNSMEpxMHJBb1hheVZKWWdqckM2cnpHV1I2aXE1?=
 =?utf-8?B?eHpzc1gvOTRreFl6OS95aEdqV2Izd2N6MUwrTWhIYmR0UWdMcy9GK3RHSmxM?=
 =?utf-8?B?TnZadVhTWVhNem82a1U0cC9rNDhuV1hQRTEwUWxKeTRGN29FaGt1bDR0YkhN?=
 =?utf-8?B?QTBJS2Y1K093eGR1OW95aTZDZmpudXFvbm5maUZML2hUVnlmTVBGOVVEOTZm?=
 =?utf-8?B?a2hJNXZhZWRxUGE1YlJrcGZXODhtbktMSytTVUNPT0VXcE81OE5QNHhXazNT?=
 =?utf-8?B?WEI1TUc0M1FQUFJsY045a3hOd01Wc1o0eWdtZnhsU1M3Ri9Dem9nK0t6Y2c4?=
 =?utf-8?B?c0JoN0RSM1ltSWVQNTh6TWEzVllwV1dNQThjc1RRbUIxT0dUUC9lWlp5NXZn?=
 =?utf-8?B?WXNVN1BiSE82MlFZRVQrcHNCaXVjcVlRa3V5anA5cGVXcWVMc0x4dHl5cXVK?=
 =?utf-8?B?OXYvSGZYVEl6djhWTEIyNWxwYWF4Z1FGTHNFMWxTNzQxS3FWTUtoMVVSTlB1?=
 =?utf-8?B?K0pVU0loTWI4am1HZ1dyRDFlSFQyYm41OWQ0dTJEV0NIWGlkb1QzUUJwdVMy?=
 =?utf-8?B?WUdaZ0Uya0NwdGtiWnhPNWxWRXY3VjJoY2EvQjVHVTQrNXVGTGRnSjY2Ui9Y?=
 =?utf-8?B?UUs4bWdkREJYQjNWaDdTYVVkQ3VCSjZKNkNoUkJyVWNITW9WQ3RFbEtJU3o2?=
 =?utf-8?B?d1RySTlYVE1EbU9td2hGOHd6OW1PUGpVMi9SeWswdFh3bEZsWXNwWkY3TUNh?=
 =?utf-8?B?dlNaOWR1RVRmbThMV1hucDE4bkhXVFVUSHdmOTdPMmxKcFVSQnZYbEZXWUZ0?=
 =?utf-8?B?QVRDbmV4QjFmOW5SSnJPTS9NRTFYZzdGcTJHOXc4cGljM0JIY3pKT0FlaVMw?=
 =?utf-8?B?YjV6aEtxNERjZWxXNjJKV3lQeWsyalZQRzdjZGplT21BdHloY0c4WE5reUVv?=
 =?utf-8?B?ZE9RZnhiMkhPMVRpRzJJRFRGQnNmb1FmNlpsbForTjIwUDRpdnRCTmtVbDBm?=
 =?utf-8?B?ZC9tLzQzSjlPMTdHM245cnJsaTJjK0E2WXpmMktUUUJVVXBYMjVoeUc4Tytz?=
 =?utf-8?B?V3FpZU5BSS8yVmc5YzFoc1VZd3JGKys4b1NrOFBRN0NuNFdHamdZS0VhS21R?=
 =?utf-8?B?ZWg1aDlHVnQ1bmFzamhKVWMzeDVNQ09IbE9KbWhPT09NcVNudFo2UFlNcW82?=
 =?utf-8?B?VlNzZnFMWCtoTG1mb1BWZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXBjWnpLL0dDMzBlOUl0RnRleVJqTldMNG44eTdUazR4WXd3c3pXR1ZOYkNX?=
 =?utf-8?B?ZEk2L0duWUZvY3AxUUlEOWRweHMvZVJSN3dxK2UwWEUzRUE5RmVjTG9NNmhm?=
 =?utf-8?B?T0ZtRWtjWXdUanFTRUZyS2g4NFM4dEtOMS84elkvMUc1eStvNXNhMFNncXpK?=
 =?utf-8?B?WCtRMGh4OTdNbFE1ODREbnVyVmRBRU5XMEp1NHBFVFloempheVBDc3FScGRa?=
 =?utf-8?B?VFVxdzZOcTc5aVhvVzgxZWdKV0tGQko5YkE1ZkRSdlhlbmRFTEJ0eVp4d09r?=
 =?utf-8?B?V3RaNC9YbGtCa0diV0FlSGdXci9hSkVLb3VTM0xhZVZOeTFCNzdrQXV1TUNh?=
 =?utf-8?B?aU1FV1YwMWZBUTk3b2ZHSVRwU1ZWakFlM281WlQvcjZsV1hMZ1llU0tIYnFE?=
 =?utf-8?B?OU9leEVBOXlUdFI0dXowQXVpRS9pNEg5R1FpeW1KWXdoVzBlTWJXemlaYUpE?=
 =?utf-8?B?c2Yxa2NJRkNlVFlRek1sU3lCLy9Pc3piL1JTYVBSSW1DK0dUeDNrbndYdXYz?=
 =?utf-8?B?eXFabkFjRGtjUWU3MU5ndXVpMllacTBuZks3TTNLZ3kvVWZ1R1RaUVZWMGZC?=
 =?utf-8?B?a0dzU3hPY0ZkQ1JOVS9UdXJQY3UzakllNUlSNE8vUXJHZ0d1Rkg1VmJOVERo?=
 =?utf-8?B?TkFyUnBnMUZnTERpL2ZXK0FlQTNKc2dNeEN2Zm9udDJhQVZIS0xhYS9Fd3ky?=
 =?utf-8?B?aHNyVGlkQ1RWdVpCd2N0MGxPMWY2S2FqMjlYd0g3b1E1Z0hzSXJjS0RWV2dm?=
 =?utf-8?B?WFduem1pRjBScHovVVpqQWhVOENHakFoNXZnL21BaEFZcHpXcFZudjVLSWRa?=
 =?utf-8?B?czFMQnBEWGhRK1N1dm5HZ0J3ZkMzWVE3Sno5QWRiR3ZtUnUvek84b1Z5Uy9W?=
 =?utf-8?B?ellUN1hHcjVkZyt2RUFFQ1RGcDJ1aHBGdlRkT0ZIN1g4ZHJINkJoQkhpeFIr?=
 =?utf-8?B?aTIyY2oyTXcwc1JOMVJOY01MZE1Yd2FmdGtPUW15czVLYzZNSU1kZHB5Z3lG?=
 =?utf-8?B?NEIzWmFjQmVCM0JiVkpCOGhpVEdsek1lQVN3b0tkV2plY1UrLzlDNFFqQlhU?=
 =?utf-8?B?ZVVnU0JpRjEzM1BVbitjdEV4UTc4bXJDUXhuN2ZaRlcrVVlnTnFTUyszanlV?=
 =?utf-8?B?d1gvZlVLd0VaME1QMkgzUGk2NzBLL0NmNGJxSnZtRDlTUDZIYlF0ZVc2bjVB?=
 =?utf-8?B?WUpzczdUZzRVR0RBZ3FWRFR5Qm9BUkdWNGtueVpxeTlDZlVDRmh5YWtvaW83?=
 =?utf-8?B?ekFTbkZTMTVtOEVEUFdxRzJXcmdJNzN0clRkZjl1Y2RPWjY2RzRkVlVSV2Fh?=
 =?utf-8?B?U1RCbzB2WEFUL0pJSktJdHFJUG8yRi9lenJjT0x1bG8yWGJDNzdzcGVOL3Bp?=
 =?utf-8?B?Q1p4QlpidlFZeXlHOFU1cmtlOXNCN2JrYXdFS3hQaGN3ZzZQa2RvVC9PUkNS?=
 =?utf-8?B?TmJCZjE1UndZWGJVQTJJZTBwMkhHSUxBWFRnQnNNcEF3MmF0UWJCczRZRDJp?=
 =?utf-8?B?RGJCMzFTSFl0dG5jZktlUEJnTjdna2lkWGJieXc4M3I2alhTUXphR3R2YXps?=
 =?utf-8?B?QUJrRkF2VDBUVUppb3cwTzhvVUpjRjdEcC9YOW1pNmNEYVhMZFNnRkZ6RmEy?=
 =?utf-8?B?Qmc2bWFPVFlSaUtPT0Q2WWFJdWlPWEhBV0dGcHllVlhrY01BS3lNcTdpMUE1?=
 =?utf-8?B?UkNGL01VSnFWemNMS011b1hQSC9uak1jN1BXRjZwNHdYSmpnM29EU0s5SDNv?=
 =?utf-8?B?NUF6d1F5STRlMkhwNXl3UWJyZUZNOGVUTEI4TVdtZlhwQ3M1d2RwWjY0MUdM?=
 =?utf-8?B?MHVFbmQrUlZSVnpaRW9YR1ZaZ2QxcjlSMEtITkp0cEtXWjY5aDhKODVXaDAr?=
 =?utf-8?B?dGZxbUZONGNtbHozTmh4UHFHWVdabzUrZWtseVpWMVVHTWREMDNjaUxKbk9h?=
 =?utf-8?B?MjVUY2FPSW45cUE1a0ZFUEo5dGdNSk5ZQVVEQXZ6TDRXbXYzQ3lrZFhreDY3?=
 =?utf-8?B?MEJCSTFXSnNYT2dRSHFoYXRPbDRhM084dnNtemZWcDZFenNPMFNjYTIreVE1?=
 =?utf-8?B?Qkw3Rm1yZ0hIZlFuSDVHRTkzMFRaSTJ3T2U0NldFQk1FU0RGdFh3WWlmVjQ2?=
 =?utf-8?Q?uqxERSPl+jnYYtc8jQ9lpHjTH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b822ad-c2c3-42d9-4d94-08dd19302a00
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 15:34:41.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zu5x5UnbN2e6K2ixRldJ+qEuXl4lvXA4jtw7G6IOttGwy7pt501Lf/aQaPn99M5flvvZy/e9oFaXoI5fm2xCpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589

Hi Masahiro,

On 10/11/2024 01:34, Masahiro Yamada wrote:
> Currently, Kbuild always operates in the output directory of the kernel,
> even when building external modules. This increases the risk of external
> module Makefiles attempting to write to the kernel directory.
> 
> This commit switches the working directory to the external module
> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> some build artifacts.
> 
> The command for building external modules maintains backward
> compatibility, but Makefiles that rely on working in the kernel
> directory may break. In such cases, $(objtree) and $(srctree) should
> be used to refer to the output and source directories of the kernel.
> 
> The appearance of the build log will change as follows:
> 
> [Before]
> 
>    $ make -C /path/to/my/linux M=/path/to/my/externel/module
>    make: Entering directory '/path/to/my/linux'
>      CC [M]  /path/to/my/externel/module/helloworld.o
>      MODPOST /path/to/my/externel/module/Module.symvers
>      CC [M]  /path/to/my/externel/module/helloworld.mod.o
>      CC [M]  /path/to/my/externel/module/.module-common.o
>      LD [M]  /path/to/my/externel/module/helloworld.ko
>    make: Leaving directory '/path/to/my/linux'
> 
> [After]
> 
>    $ make -C /path/to/my/linux M=/path/to/my/externel/module
>    make: Entering directory '/path/to/my/linux'
>    make[1]: Entering directory '/path/to/my/externel/module'
>      CC [M]  helloworld.o
>      MODPOST Module.symvers
>      CC [M]  helloworld.mod.o
>      CC [M]  .module-common.o
>      LD [M]  helloworld.ko
>    make[1]: Leaving directory '/path/to/my/externel/module'
>    make: Leaving directory '/path/to/my/linux'
> 
> Printing "Entering directory" twice is cumbersome. This will be
> addressed later.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Since this change I have been observing the following build error when 
building an external module ...

  MODPOST Module.symvers
ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_init' exported
     twice. Previous export was in drivers/gpu/host1x/host1x.ko
ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_exit' exported
     twice. Previous export was in drivers/gpu/host1x/host1x.ko

Now host1x is an upstream driver, but I have a local copy that using to 
stage development changes (and avoid polluting the upstream driver). 
Plus I can swap between which version I am using on a live system.

What I noticed is that previously the Modules.symvers for the external 
module had the full path of the external module for the name. However, 
now the name is just the relative path and in this case 
'drivers/gpu/host1x/host1x'. Hence, this clashes with the in-kernel 
driver and we get the 'exported twice' error.

I have been looking to see if there is a way to fix this because it has 
been a useful feature to override an upstream driver with a locally 
modified version.

Thanks
Jon

-- 
nvpublic


