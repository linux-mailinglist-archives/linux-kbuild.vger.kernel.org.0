Return-Path: <linux-kbuild+bounces-3331-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B3969531
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 09:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD0B1F23C1E
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 07:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7E61D6C46;
	Tue,  3 Sep 2024 07:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jS1RhOGk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NBZAp1m3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3387B1D54F2;
	Tue,  3 Sep 2024 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348083; cv=fail; b=CcGlsIAL4Xw7lgHh+r40ygxJ1mj+nM7YWpljPnahuLw2TNCTRN0ebJ4bPy8BAxSNFh377I7HQlcosVNOYEL3x8qNEMGFzt0spOGEmDpZf8eTjjlkB2UcovG5KkpWoggrH97aslUkA/to5Bwevq+IgAVA6AUXLU4027uqbfvICKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348083; c=relaxed/simple;
	bh=5WjBnrBf8SCufFKan4h6G3bEMDUKkus+Z+9ePWoiEyk=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=cBRFL4fiElOQIusbJ+ILLS6fgH9POBgVnMM+cUxXfK/gDfzNxjS5+bZaOJsKyrn1TVqnKbu85HHgWXjSDmeafaYH4ki93cpGHe+33EpjAQBgEHfQVtE31kUpGr38gRNJLrzBRsU7wJhyLf3ImFUctl38ROG5mJEkT54pvpm9OqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jS1RhOGk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NBZAp1m3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4835fgCm015878;
	Tue, 3 Sep 2024 07:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=lLyn840cneOXzmp
	L9wwu1bKTlCgzdx2PIA3hdnS5tZg=; b=jS1RhOGkdx4mNEoa4BMKCYXICoppjEh
	YpkTYczb9ODT1ScCw0boWOy0VnuLywIUZNpsIVkiulH7pC2Klgp+AkXGguL1ft5h
	qLacD3IOFjgsalmtRMl0V5eUHJdD4WIBNRFAuwZz1Nhyqn5XYcHe84TxFmJZ0FO7
	mETXRDFEBBfdb9thsDSDZJr0md2LuZtN1c/5eZNSOC1GuN+lyNofnBJYov1cmTIs
	L6ls3Gecn1OZlBnMCM+OVwkcRxGGTdbSNaWEEDMa2/xeq9oKx7OPFSlMt70va/t7
	NhDwbiGHNGpdmRjavVnnO+c6oumxY6iI4q1DkMXk/4PWhaVAabDRQiQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41duyj06bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 07:21:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4835HljZ018334;
	Tue, 3 Sep 2024 07:21:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41bsmec9x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 07:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8FotaU0OwM6tfeGqhyTORGm4ebQeHHXLA2YcSe14Jo3FbqERDJUXV0IwQh7rw2kIJUGUc43iDXT7kojHPtz8vYeZ2E06+84M1GSeunK/NK63WibmSu2QrVRIPdPLfU55v7nyv7B0mWFxoYw31w8mZ2Fu7bdYuhyuM1VQ59y6zFV1xQEj6k7WGj7vR6DsXly3vEkVIHDu7B2bL03B5dX9cxfyTPh7CVt7hWbZIL/zBH1QL8MGu+9zzjSQ5V2wHdMoZqR7ri6/FRriNbgm5QlND7D7+2X/8llT+kVk1Qxzjia9fdcsnuClOALup5zOKqA8xHt3IO5YWotmhwsv9NmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLyn840cneOXzmpL9wwu1bKTlCgzdx2PIA3hdnS5tZg=;
 b=WRg4+I5a4EtZgXaP3yaYsKL7YF7iXyFiDbUwc+3h+0pkoy86J5NUiMvKa2dcaWGhfU7EnJZOGQ/vBNlYk2U2F+q/oVfvsVPh6TsN3CZDm6Pxtrefua4BFZkbg+mdzg8eCK+8oU7zoUOqYZceLToiSwIokiUA4MHKDNwYcXEubTHxbGgJIjAVwZijy7x5rFGwbcALdTi3VKGA0ZTnLnIf88gcBfQLlgX0jdr5etpZ0AVVya+MnLGk5GXDs+JuIyVHMM7UkRqWk4oSsEa/2GUoQPR+aENgO9f6bfCv2WOhNmXCJaPPAXHhEJCoX4dlptf5RKhRq0vQbJgyirTFaTe+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLyn840cneOXzmpL9wwu1bKTlCgzdx2PIA3hdnS5tZg=;
 b=NBZAp1m35wtPEPj3EiTfJMGCQxVbhOI/ePds9iwoodM/ZmaNEfCdpPOiyB7Zc3HKEfHHM8LUFW6pnmXNZmdJQA7+E465MDg6GvopWAnKkPESsk2qUuRrBrCPqSISE6lRjlPGWl1O8RNO4nWfhHDW6Z1uLZWkk2IRbk1g2/BqCw0=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by PH0PR10MB5660.namprd10.prod.outlook.com (2603:10b6:510:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 07:21:03 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:21:03 +0000
Content-Type: multipart/mixed; boundary="------------8eAlgcNTk3s0TP4A5M1jDSqW"
Message-ID: <d1bb2638-2e0e-44ef-b8da-9746ed532ed1@oracle.com>
Date: Tue, 3 Sep 2024 09:20:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: use objcopy to generate asm-offsets
To: Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        kvmarm@lists.linux.dev, kvm@vger.kernel.org,
        linux-um@lists.infradead.org, bpf@vger.kernel.org,
        llvm@lists.linux.dev
References: <20240828083605.3093701-1-vegard.nossum@oracle.com>
 <875xrd7h88.fsf@mail.lhotse>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <875xrd7h88.fsf@mail.lhotse>
X-ClientProxiedBy: PA7P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::20) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|PH0PR10MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c29fb5e-df6b-4d06-c468-08dccbe8f7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3BUQjM1bkFza3dKV2RabkFGQW9Nb1hpUmlXb0xwdEd3YVcxRXltbFdGMjho?=
 =?utf-8?B?aWcxRDZBVCtvTFN3cElYUldjanhKVkJ3ZHUvRU9uR1lXZnFVSm9LYWs2Y1Bm?=
 =?utf-8?B?Vmk2RlllZytPUndDc29oblg5OEFFa0ViTG80ZkMxNFk2bFpLOWg1YnZKVGxh?=
 =?utf-8?B?cmoxd29VYUo5S2labVVvZmJiVS9mNjREa0VGMFBwVmQyM3R1T0tXQmNpbDJZ?=
 =?utf-8?B?ZVNQaXhBa1U1R3AwOXgxWlJ0SUdWVzViTnlleHJJcU5SeFBKVHIzOEVTR2ti?=
 =?utf-8?B?bnVuQ3M0STIrUThVQW5zNHdhQ3FYeWpWbHlRWng3dXlvWnlobllVVllXTmRY?=
 =?utf-8?B?UEtIMlZFRW1zMi9BUUhRQ1lUYjFYektJdUJ6ajZPZFhJaEFHSkpqajBRbEJN?=
 =?utf-8?B?UWdDTno1NkViZGNmdm9sTDhtTUEwV1d6OGhWR0dGWGdBT29VdmRjZDNIY1Ru?=
 =?utf-8?B?anU1Zjc3aXdiU3dvdXlsUVIzSHViZWoxWWhaRUxNdGdKa0dJT2I3YkJ0Snpq?=
 =?utf-8?B?L3ZwWmVJTXB5RllmUFRocW1sM2lxNVRiM2ZWdFRBRytIVVVER0ZkNVM2NzFX?=
 =?utf-8?B?WVd6SzVac3BXbkdPM1gydFFqUWt3aXlOY1ZnZTlwckc0NDdNZUhtR05wMUU5?=
 =?utf-8?B?S1ZMdXUyVFBLd015VUxuZFZxNEFyVHprQmE1OTNKRVZIekVHM2NwTW9sT2FH?=
 =?utf-8?B?THN2NWsxcWUzWTIxQms0NjE5R3hhalBSakJJWkZ1WFFvNU50WUdDWFVKbXJ3?=
 =?utf-8?B?aFBCVjBZR0J4SnpXL29naVFod25ENmpZbHBxZko1ajkzTjg5NHJ0WWprNERy?=
 =?utf-8?B?TlZNa3Y0MVZCOW5rSnE1TGcyeXVYU2o5eW1ZTDVzRVlwVkdqbFh6Wkk4Wkho?=
 =?utf-8?B?U1lQb1NKZzR3SUp0VWxldG1oTTJxaVlvVXcycmNLQ1hRcWJwSWVHeWh4czhP?=
 =?utf-8?B?Q2lYZXRvVkh1U1gzd203enZYNjJISHhJcmtxMWoxalZtT2hWa0J4RHQxUWlG?=
 =?utf-8?B?ei9aRXNCZGVncHVtcWZXdzk0SmhsbExGU1RkUFRDcG1oUFE4cWhGUWlZQk5y?=
 =?utf-8?B?MUF0SlZiSXlJZFdhcUZFTmtiVlVRWVR0cXpwYlZZeVl2RDdLQW1WRlIySHBX?=
 =?utf-8?B?TExqdS92NVBQcC95TkNBcEJaQzhsbWwrS2kzQXZ3UUVLUUhPRlVmcWkwb1dB?=
 =?utf-8?B?dDIwK1NBWGNpcWZ6REptSXNuT2hjVWswTUNaWDhjS3ByQ1RqNTgvOGhEb3Rv?=
 =?utf-8?B?bWlDV1hCSi9uSTV4Z09yUUg1bUpqaFFZQUdBVzAxaDhzRmFHUnVvVnlrTkc5?=
 =?utf-8?B?Q1lBcm5XTDlqOXVXRE9iT2xWUUtJWmdYa1FoU285U2tMdzcyN1VOWmtRREtm?=
 =?utf-8?B?cWdKL1hUa1U0L2Z1QXEyc3ZBaGF6UCtSOFBtdmUxSTFKcFY2ak4wWXFraVZ6?=
 =?utf-8?B?NCtOelJyejFITms4bnpqR2JPYkY4STFHY254ZHM2SVk2dndmeWFlUmQ3TDho?=
 =?utf-8?B?ZXdRenVHN1EwTUc3MXV6V1lIZXNKMDVFczQwVUhTMUdpYWo5SzQ4dWUrNnlL?=
 =?utf-8?B?YkJrbUVsMWluRXJ6eEZmWUNuMFpBODBIYm1mYXFLRnM5Q0MvQUZIanN3SCtx?=
 =?utf-8?B?ZWRVaVJjeFgwVytrbGFOL1ovL01zald1YXYyTXMxYVFVWUNGWjZvalFQb2hq?=
 =?utf-8?B?K09yek1MUkltMUJIUTBBNVkvVGd0RlNySkc4NWhLSUovSWZwRmYrSGY0c0xK?=
 =?utf-8?Q?bBKr3U6piodlddBk4w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk5MelhlOVorSnN1TzVOZjNBOHpDRzhoSitSYW1CS3VuOEhIdXVBdldyT1Jx?=
 =?utf-8?B?Qys1UHhzeTM3bmU5dU1oUU5hemJnZjNJSTJZd0k2c2ptQktRR3hZWjBEUnpI?=
 =?utf-8?B?WURiZVQvOGxWaVRYem1od2lES2Q4U2xIaFJ0bHN4cUMyS2d0VVN0bVV1QU9U?=
 =?utf-8?B?ZStVRGhnT1ZEQmJaam44K0xnaGZTNFVPdEI3d2hhOWxXaXAweExMaFdmaWlt?=
 =?utf-8?B?aXdWd0dRNHpPZHc0eFNnTXdjelpJM2U0d0Y0T2M0SVZ1WHlvZGdXeGhEZHJq?=
 =?utf-8?B?UjZ0bXJHSU9HajM1aUhtclQxcWtrbS9pYzkvb043QzVHTEx4bWR3VThqTUZL?=
 =?utf-8?B?RVkxR1lMdVRYeDQ2bCtzS0wxNTErY3NmMmptTzRKQk1oN3ZNOHdJZFd1SEh6?=
 =?utf-8?B?dzlKTjZJQ01wUktBNUlzbW1OZXB4WXpZWTdJZjNDOWtQUEtiTnplblFMQWgv?=
 =?utf-8?B?cVF5NmRzaDR0cThJM1BkMk41Z3FvZzE4S2pQSUdyS25OSjd0ejBSRThpd2ls?=
 =?utf-8?B?RHJ4SDBKL3FBNm44RmQ4eG9iTlNOYnJqYkVKNDZaeUo0Ung2SGl4L2xwN1A4?=
 =?utf-8?B?c3ZxZnFuT0JDeHkxRThlK0hJUEJNeDlxUldtN24rMEhKblh6RXJ4WHZUbis3?=
 =?utf-8?B?Um56Mm1KTmU3NDAza2NpMG9NSU5WaWdVSzVrNWIyNENUcFR2eUhHR1lxclNh?=
 =?utf-8?B?V2FoRmFQdFNVK0I1OEw1N3Q3REdSWUhQejJKVWVnaXg0cHFOZjlSNzVsWHZX?=
 =?utf-8?B?TmozS1JYbjNnMko3WTR1SjR4N3FGRnE5NU1wVG1DL25KZXNTWmxiSDZ1YTVi?=
 =?utf-8?B?NGR4VlltdFBSajREaVpxMnMveXlON1g3NzNEcUFOQ2tMR3huZmxvaFdYRVp6?=
 =?utf-8?B?ZkwyWmtQWGNrd1JnMEJYMlg5NEQ2WkNKQTRxR3ZqcjNtcm4zNlpNcGw5T09n?=
 =?utf-8?B?NFJORWM0bmtPdmsyeGdFVlpGdG9USWhvdXlURGtlTHNxbGJZYjd1UVViZG5M?=
 =?utf-8?B?bGlRUTlFb1cyMTk0WHhraEhrMzV1bkl6NkxFVTF0RzJ1L0kzMlpVK3pxUFpW?=
 =?utf-8?B?ekw0RGZIVjVIOXZDM21hSTlxU2dwSC9FMDJjNExQWkhFaUN5akNwV1R3NWZ2?=
 =?utf-8?B?QmlwRWZpRnk1Nzh1UTlHUHo0cUJYd3VKNTRkTldKZXdGVWNKSlUyWno2VEJK?=
 =?utf-8?B?MG5OekN4Y0FHSmtDVStwT005NEVGUFN2U1ZPZTI2MG96QVUrN245V3Fhampi?=
 =?utf-8?B?TnBkRW83eUFMU3pscGtGRmp0V1J0TGMzOFFUSVZnZ0RLdXdXb1c2bG1QemxY?=
 =?utf-8?B?RzljaFh4SnV1RnhNUGZIb1luaENZZ3F2S0loVGwvUjl0alJHWFg4MjhWdDhq?=
 =?utf-8?B?aUw4aTBPaXk0dG5nelp2SGNmVlFuKzQvamJ5eWwwd1c4V2xOOHpIOUxZaGly?=
 =?utf-8?B?L2N3aFBFZW8vZXlPMVBEZmthcjVWL0I4Q1B0WVJDZndFSFNwS3pOZ04wdzRz?=
 =?utf-8?B?bzJDRUc0UmZ4enNhRDVxaDh5bkNSN0dkaS9wT0VsYTBRa0dCa0lZc0lnUzFH?=
 =?utf-8?B?am9JZmZLU1p1NmtCaFJpd1prOXRjSWJ5cUdxdHNkTUV5SDJIditEQzd6RkVj?=
 =?utf-8?B?QjdKR0ZLOWNMTXh2SGcyUGhmTldpVDNTRFV4VWFwRGRzcGlmMXg1bTN5Vmpy?=
 =?utf-8?B?RENiR0taS3VmNnBhM3dtZjFjZVFWMk9GUkRySmN0QVZIcWtzUmNFTlo3eXR4?=
 =?utf-8?B?ZVQrMzdGMWZtbWRLQVptaWluT1N0bjRFQXQ4YVB6encwb2h3VStwU3ovYWpx?=
 =?utf-8?B?dXNyZmxMdlY4USt0Yy9pbmdEakt6T1RRTUVBUmVBdjMxcCtCcFVZMWQvQy8z?=
 =?utf-8?B?TzNWcDllUmQ3V1NIc1BGQzdzQXlBbGdnZWJyS1N6NHYwZmc0dDh5L203eHpi?=
 =?utf-8?B?ZVh4azZxZDB1SFkzcThiSmR6UnF5MDJvbE40SENkMGtlOGJMalRWL0t1TVNq?=
 =?utf-8?B?cEpQdGtpRy81K2FrUzFpNXo3QnFUdUZyS2xYK3JKYU5ZZHRMcUtPa29EM1ky?=
 =?utf-8?B?QmJFRytNbzJIZU12Q2xwYmJ4eHdmbVBpL2pnay91S041Znd0azVIOEVFRUlJ?=
 =?utf-8?B?R1g2Y0U2YklhYkNqWUluMG83bXFkMnl2TFRZOVRiNDZJSG5FRU5oOWo3SEY2?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y4XFJG+4YHo+TSFureK0BE2r42cF4sykXho0OrLgI5uFMRdybtd7+SgA6E0SuTE+IBxwLogZZx2Z3r6tWaE8c0U6kbKZep5xVn9X2Dl/fqZZ14YWbdMguq25N/k4tws4wUlSo73OUZHxWHJFAK55MyR8/+qPHXRxmTo+Ol3NuPRmINat+R4mAf1R6rhQqxKoYMWATOcHkieoCmjChfF4JqPTnWJTh05mFZirzlXgUQ9mFwl7L+wmi2wvxAFGWcDiwKsBrq+mTS4yzQPswt1otvus18e4FMEmTzxKFf+NPmthjRg/n+jYo8h9s18VBQO03+Xxb+SlzzEcbOJ8XS6fA64JIFKS8bgVRJ4idCmo5uDx+TUko33oiQ2gj8Dy/okFvlQxxXcKAfK6kHDqoF3eQ6owDcyYXp8xhtkrjJGJKQKV5t5CKd7B/oZr6z+jL9Yvw5Yc4m9/i2aaXdcUXy0V2m4/GjDATFh0z/sSAWOetvvxj3xh4Gw64Yi19Hs3cKWiYim1mA8CT9BYfvRb+yhhrge2dquFF2b5xazsxTjyK/fAxEskmgq5EAfcXpioGXe5IdGVH/s3kAiNNhReR1nLSYV6CxB3SMyCp0sCbaBzvVY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c29fb5e-df6b-4d06-c468-08dccbe8f7ae
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:21:02.9936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrafYVsx0MELWnNP3TgCGB8Hx0GqAV5a3Ag5//3c93Jfb2MxVbytSz0J7sQ9uMBfbc3UXXMvZlPySNH1+Wh1OltWou3kDqe4+WAfL4leUK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5660
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2409030057
X-Proofpoint-GUID: JSXK6jG_fGQrMMFKH04waBejQFGMP7Mc
X-Proofpoint-ORIG-GUID: JSXK6jG_fGQrMMFKH04waBejQFGMP7Mc

--------------8eAlgcNTk3s0TP4A5M1jDSqW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 03/09/2024 01:45, Michael Ellerman wrote:
> Vegard Nossum <vegard.nossum@oracle.com> writes:
>> Remove the sed script and compile the C source listing structs and
>> offsets to an object file (instead of assembly code) that embeds C source
>> directly. Then extract the C source using objcopy.
>>
> 
> I threw some builders at this and hit a few errors:

Thanks, I also got the ones from kernel test robot and figured something
was going a bit wrong.

There are several issues: clang wants - instead of /dev/stdout as an
argument to objcopy, and then gcc has some bugs that prevent the numbers
from appearing correctly on some architectures, also I had an extra # in
the COMMENT() macro which only resulted in an error on some
architectures. I've attached a tentative v2 that fixes these issues, but
I'm still trying to figure out why m68k is giving me slightly different
output for include/generated/asm-offsets.h and why the arc assembler
fails.

In the end I'm wondering if this patch is really worth it, given all the
failures and little workarounds :-| If I can sort out the last few
failures I'll submit it as an RFC.

> Full list here, but note there are some unrelated pre-existing failures:
>    http://kisskb.ellerman.id.au/kisskb/head/259bba3447faaf5e5b12ae41a26a62978d4c1965/

Thanks again,


Vegard
--------------8eAlgcNTk3s0TP4A5M1jDSqW
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-kbuild-use-objcopy-to-generate-asm-offsets.patch"
Content-Disposition: attachment;
 filename="0001-kbuild-use-objcopy-to-generate-asm-offsets.patch"
Content-Transfer-Encoding: base64

RnJvbSAyOTBmY2YwMWRkZTljODNkY2MyZGI4NzViM2U0YTAzMDUzY2QzYTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWZWdhcmQgTm9zc3VtIDx2ZWdhcmQubm9zc3VtQG9yYWNsZS5j
b20+CkRhdGU6IFR1ZSwgMjcgQXVnIDIwMjQgMTk6NDQ6NDQgKzAyMDAKU3ViamVjdDogW1BBVENI
IHYyXSBrYnVpbGQ6IHVzZSBvYmpjb3B5IHRvIGdlbmVyYXRlIGFzbS1vZmZzZXRzCgpJbiBvcmRl
ciB0byBnaXZlIGFzc2VtYmx5IGNvZGUgYWNjZXNzIHRvIEMgc3RydWN0cyB3aXRob3V0IGhhdmlu
ZyB0bwpoYXJkY29kZSBtZW1iZXIgb2Zmc2V0cywgdGhlIGtlcm5lbCBjb21waWxlcyBhIEMgc291
cmNlIGZpbGUgbGlzdGluZyBhbGwKdGhlIHN0cnVjdHMgYW5kIG9mZnNldHMgdGhhdCBhcmUgbmVl
ZGVkIGluIGFzc2VtYmx5IGNvZGUuIFVzaW5nIHNvbWUKQyBwcmVwcm9jZXNzb3IgdHJpY2tlcnkg
YW5kIGEgc2VkIHNjcmlwdCwgdGhlIGNvbXBpbGVkIGFzc2VtYmx5IGNvZGUgaXMKdHVybmVkIGJh
Y2sgaW50byBDIHByZXByb2Nlc3NvciBjb2RlIHRoYXQgaW4gdHVybiBjYW4gYmUgdXNlZCBieSB0
aGUKYXNzc2VtYmx5IGNvZGUuCgpUaGlzIHNlZCBzY3JpcHQgaXMgdmVyeSBoYXJkIHRvIHJlYWQg
YW5kIHVuZGVyc3RhbmQuCgpSZW1vdmUgdGhlIHNlZCBzY3JpcHQgYW5kIGNvbXBpbGUgdGhlIEMg
c291cmNlIGxpc3Rpbmcgc3RydWN0cyBhbmQKb2Zmc2V0cyB0byBhbiBvYmplY3QgZmlsZSAoaW5z
dGVhZCBvZiBhc3NlbWJseSBjb2RlKSB0aGF0IGVtYmVkcyBDIHNvdXJjZQpkaXJlY3RseS4gVGhl
biBleHRyYWN0IHRoZSBDIHNvdXJjZSB1c2luZyBvYmpjb3B5LgoKVGhlIHJlc3VsdGluZyBjb2Rl
IGlzIG1vcmUgcmVhZGFibGUgYW5kIGxlc3MgZnJhZ2lsZS4KCk5vdGUgdG8gcmV2aWV3ZXJzOiBU
aGUgJ29iamNvcHkgLi4uIC9kZXYvc3Rkb3V0IHwgY2F0JyBiaXQgaXMgbmVlZGVkIHRvCmZvcmNl
IHRoZSBjb3JyZWN0IG9yZGVyaW5nIG9mIHRoZSBvYmpjb3B5IGxpbmVzIHZzLiB0aGUgc3Vycm91
bmRpbmcgZWNobwpjb21tYW5kczsgd2l0aG91dCBpdCwgb2JqY29weSB3aWxsIG9wZW4gL2Rldi9z
dGRvdXQgKHdoaWNoIHJlZmVycyB0byBhCnRlbXBvcmFyeSBmaWxlIGNyZWF0ZWQgYnkga2J1aWxk
KSBhbmQgcmVzZXQgdGhlIGZpbGUgb2Zmc2V0IHRvIDAuIEluCm90aGVyIHdvcmRzLCB0aGUgcGlw
ZSBlbnN1cmVzIHRoYXQgb2JqY29weSBkb2Vzbid0IG92ZXJ3cml0ZSB0aGUgbGluZXMKdGhhdCBh
bHJlYWR5IGV4aXN0IGluIC9kZXYvc3Rkb3V0LgoKdjI6Ci0gZml4ZWQgY2hhbmdlbG9nIHR5cG9z
ICh0aGFua3MgdG8gSm9oYW5uZXMgQmVyZykKLSBzdXBwb3J0IExMVk0ncyBvYmpjb3B5IGJ5IHRl
c3RpbmcgZm9yICQoTExWTSkgYW5kIHVzaW5nIC0gZm9yIC9kZXYvc3Rkb3V0Ci0gYXR0ZW1wdCB0
byB3b3JrIGFyb3VuZCBidWlsZCBmYWlsdXJlcyBvbiBhcmMsIG1pcHM2NGVsLCBhbmQgc2g0IGJ5
CiAgdXNpbmcgJW4wIGluc3RlYWQgb2YgJWMwIGluIHRoZSBpbmxpbmUgYXNzZW1ibHkgZm9yIGdl
bmVyYXRpbmcgdGhlIGhlYWRlcgotIGZpeCBmaWxlY2hrX29mZnNldHMgaW5kZW50YXRpb24KLSBm
aXggZXh0cmFuZW91cyBkb3VibGUgcXVvdGVzIGluIENPTU1FTlQoKQoKVGhpcyB2ZXJzaW9uIG9m
IHRoZSBwYXRjaCBhZGRzIGFib3V0IDcgbGluZXMgb3ZlcmFsbCwgYnV0IHRoaXMgaXMgbW9zdGx5
CmR1ZSB0byB0aGUgZXh0cmEgZXhwbGFuYXRpb25zIGluc2VydGVkIGFzIGNvZGUgY29tbWVudHMu
CgpTaWduZWQtb2ZmLWJ5OiBWZWdhcmQgTm9zc3VtIDx2ZWdhcmQubm9zc3VtQG9yYWNsZS5jb20+
Ci0tLQogS2J1aWxkICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KIGFyY2gv
YXJtL21hY2gtYXQ5MS9NYWtlZmlsZSAgfCAgNCArKy0tCiBhcmNoL2FybS9tYWNoLW9tYXAyL01h
a2VmaWxlIHwgIDQgKystLQogYXJjaC9hcm02NC9rdm0vTWFrZWZpbGUgICAgICB8ICA5ICsrKysr
LS0tLQogYXJjaC94ODYva3ZtL01ha2VmaWxlICAgICAgICB8ICA0ICsrLS0KIGFyY2gveDg2L3Vt
L01ha2VmaWxlICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvbWVtb3J5L01ha2VmaWxlICAg
ICAgfCAgNCArKy0tCiBpbmNsdWRlL2xpbnV4L2tidWlsZC5oICAgICAgIHwgMjAgKysrKysrKysr
KysrKysrLS0tLQogc2FtcGxlcy9icGYvTWFrZWZpbGUgICAgICAgICB8ICA0ICsrLS0KIHNjcmlw
dHMvTWFrZWZpbGUubGliICAgICAgICAgfCAzOCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIHNjcmlwdHMvbW9kL01ha2VmaWxlICAgICAgICAgfCAgNCArKy0tCiAxMSBmaWxl
cyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9LYnVpbGQgYi9LYnVpbGQKaW5kZXggNDY0YjM0YTA4ZjUxZS4uNDEyYjc3MDA3ZGViMSAxMDA2
NDQKLS0tIGEvS2J1aWxkCisrKyBiL0tidWlsZApAQCAtOSw5ICs5LDkgQEAKIAogYm91bmRzLWZp
bGUgOj0gaW5jbHVkZS9nZW5lcmF0ZWQvYm91bmRzLmgKIAotdGFyZ2V0cyA6PSBrZXJuZWwvYm91
bmRzLnMKK3RhcmdldHMgOj0ga2VybmVsL2JvdW5kcy5vCiAKLSQoYm91bmRzLWZpbGUpOiBrZXJu
ZWwvYm91bmRzLnMgRk9SQ0UKKyQoYm91bmRzLWZpbGUpOiBrZXJuZWwvYm91bmRzLm8gRk9SQ0UK
IAkkKGNhbGwgZmlsZWNoayxvZmZzZXRzLF9fTElOVVhfQk9VTkRTX0hfXykKIAogIyBHZW5lcmF0
ZSB0aW1lY29uc3QuaApAQCAtMjcsMTEgKzI3LDExIEBAICQodGltZWNvbnN0LWZpbGUpOiBrZXJu
ZWwvdGltZS90aW1lY29uc3QuYmMgRk9SQ0UKIAogb2Zmc2V0cy1maWxlIDo9IGluY2x1ZGUvZ2Vu
ZXJhdGVkL2FzbS1vZmZzZXRzLmgKIAotdGFyZ2V0cyArPSBhcmNoLyQoU1JDQVJDSCkva2VybmVs
L2FzbS1vZmZzZXRzLnMKK3RhcmdldHMgKz0gYXJjaC8kKFNSQ0FSQ0gpL2tlcm5lbC9hc20tb2Zm
c2V0cy5vCiAKLWFyY2gvJChTUkNBUkNIKS9rZXJuZWwvYXNtLW9mZnNldHMuczogJCh0aW1lY29u
c3QtZmlsZSkgJChib3VuZHMtZmlsZSkKK2FyY2gvJChTUkNBUkNIKS9rZXJuZWwvYXNtLW9mZnNl
dHMubzogJCh0aW1lY29uc3QtZmlsZSkgJChib3VuZHMtZmlsZSkKIAotJChvZmZzZXRzLWZpbGUp
OiBhcmNoLyQoU1JDQVJDSCkva2VybmVsL2FzbS1vZmZzZXRzLnMgRk9SQ0UKKyQob2Zmc2V0cy1m
aWxlKTogYXJjaC8kKFNSQ0FSQ0gpL2tlcm5lbC9hc20tb2Zmc2V0cy5vIEZPUkNFCiAJJChjYWxs
IGZpbGVjaGssb2Zmc2V0cyxfX0FTTV9PRkZTRVRTX0hfXykKIAogIyBDaGVjayBmb3IgbWlzc2lu
ZyBzeXN0ZW0gY2FsbHMKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtYXQ5MS9NYWtlZmlsZSBi
L2FyY2gvYXJtL21hY2gtYXQ5MS9NYWtlZmlsZQppbmRleCA3OTRiZDEyYWIwYThlLi40ZDRiZTAw
MDBmZDk4IDEwMDY0NAotLS0gYS9hcmNoL2FybS9tYWNoLWF0OTEvTWFrZWZpbGUKKysrIGIvYXJj
aC9hcm0vbWFjaC1hdDkxL01ha2VmaWxlCkBAIC0xOCwxMCArMTgsMTAgQEAgaWZlcSAoJChDT05G
SUdfUE1fREVCVUcpLHkpCiBDRkxBR1NfcG0ubyArPSAtRERFQlVHCiBlbmRpZgogCi0kKG9iaikv
cG1fZGF0YS1vZmZzZXRzLmg6ICQob2JqKS9wbV9kYXRhLW9mZnNldHMucyBGT1JDRQorJChvYmop
L3BtX2RhdGEtb2Zmc2V0cy5oOiAkKG9iaikvcG1fZGF0YS1vZmZzZXRzLm8gRk9SQ0UKIAkkKGNh
bGwgZmlsZWNoayxvZmZzZXRzLF9fUE1fREFUQV9PRkZTRVRTX0hfXykKIAogJChvYmopL3BtX3N1
c3BlbmQubzogJChvYmopL3BtX2RhdGEtb2Zmc2V0cy5oCiAKLXRhcmdldHMgKz0gcG1fZGF0YS1v
ZmZzZXRzLnMKK3RhcmdldHMgKz0gcG1fZGF0YS1vZmZzZXRzLm8KIGNsZWFuLWZpbGVzICs9IHBt
X2RhdGEtb2Zmc2V0cy5oCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLW9tYXAyL01ha2VmaWxl
IGIvYXJjaC9hcm0vbWFjaC1vbWFwMi9NYWtlZmlsZQppbmRleCBkYWYyMTEyN2M4MmYxLi45OTFm
ZmU2ODcxZDFkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9tYWNoLW9tYXAyL01ha2VmaWxlCisrKyBi
L2FyY2gvYXJtL21hY2gtb21hcDIvTWFrZWZpbGUKQEAgLTIxNywxMiArMjE3LDEyIEBAIG9iai15
CQkJCQkrPSBvbWFwX3BoeV9pbnRlcm5hbC5vCiAKIG9iai0kKENPTkZJR19NQUNIX09NQVAyX1RV
U0I2MDEwKQkrPSB1c2ItdHVzYjYwMTAubwogCi0kKG9iaikvcG0tYXNtLW9mZnNldHMuaDogJChv
YmopL3BtLWFzbS1vZmZzZXRzLnMgRk9SQ0UKKyQob2JqKS9wbS1hc20tb2Zmc2V0cy5oOiAkKG9i
aikvcG0tYXNtLW9mZnNldHMubyBGT1JDRQogCSQoY2FsbCBmaWxlY2hrLG9mZnNldHMsX19USV9Q
TV9BU01fT0ZGU0VUU19IX18pCiAKICQob2JqKS9zbGVlcDMzeHgubyAkKG9iaikvc2xlZXA0M3h4
Lm86ICQob2JqKS9wbS1hc20tb2Zmc2V0cy5oCiAKLXRhcmdldHMgKz0gcG0tYXNtLW9mZnNldHMu
cwordGFyZ2V0cyArPSBwbS1hc20tb2Zmc2V0cy5vCiBjbGVhbi1maWxlcyArPSBwbS1hc20tb2Zm
c2V0cy5oCiAKIG9iai0kKENPTkZJR19PTUFQX0lPTU1VKQkJKz0gb21hcC1pb21tdS5vCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2t2bS9NYWtlZmlsZSBiL2FyY2gvYXJtNjQva3ZtL01ha2VmaWxl
CmluZGV4IDg2YTYyOWFhZjBhMTMuLmVlNjk5YTY4M2Q4MmMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQva3ZtL01ha2VmaWxlCisrKyBiL2FyY2gvYXJtNjQva3ZtL01ha2VmaWxlCkBAIC0yOCwxNyAr
MjgsMTggQEAga3ZtLXkgKz0gYXJtLm8gbW11Lm8gbW1pby5vIHBzY2kubyBoeXBlcmNhbGxzLm8g
cHZ0aW1lLm8gXAoga3ZtLSQoQ09ORklHX0hXX1BFUkZfRVZFTlRTKSAgKz0gcG11LWVtdWwubyBw
bXUubwoga3ZtLSQoQ09ORklHX0FSTTY0X1BUUl9BVVRIKSAgKz0gcGF1dGgubwogCi1hbHdheXMt
eSA6PSBoeXBfY29uc3RhbnRzLmggaHlwLWNvbnN0YW50cy5zCithbHdheXMteSA6PSBoeXBfY29u
c3RhbnRzLmggaHlwLWNvbnN0YW50cy5vCiAKIGRlZmluZSBydWxlX2dlbl9oeXBfY29uc3RhbnRz
CiAJJChjYWxsIGZpbGVjaGssb2Zmc2V0cyxfX0hZUF9DT05TVEFOVFNfSF9fKQogZW5kZWYKIAog
Q0ZMQUdTX2h5cC1jb25zdGFudHMubyA9IC1JICQoc3JjKS9oeXAvaW5jbHVkZQotJChvYmopL2h5
cC1jb25zdGFudHMuczogJChzcmMpL2h5cC9oeXAtY29uc3RhbnRzLmMgRk9SQ0UKLQkkKGNhbGwg
aWZfY2hhbmdlZF9kZXAsY2Nfc19jKQogCi0kKG9iaikvaHlwX2NvbnN0YW50cy5oOiAkKG9iaikv
aHlwLWNvbnN0YW50cy5zIEZPUkNFCiskKG9iaikvaHlwLWNvbnN0YW50cy5vOiAkKHNyYykvaHlw
L2h5cC1jb25zdGFudHMuYyBGT1JDRQorCSQoY2FsbCBpZl9jaGFuZ2VkX2RlcCxjY19vX2MpCisK
KyQob2JqKS9oeXBfY29uc3RhbnRzLmg6ICQob2JqKS9oeXAtY29uc3RhbnRzLm8gRk9SQ0UKIAkk
KGNhbGwgaWZfY2hhbmdlZF9ydWxlLGdlbl9oeXBfY29uc3RhbnRzKQogCiBvYmota3ZtIDo9ICQo
YWRkcHJlZml4ICQob2JqKS8sICQoa3ZtLXkpKQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL01h
a2VmaWxlIGIvYXJjaC94ODYva3ZtL01ha2VmaWxlCmluZGV4IDU0OTQ2NjlhMDU1YTYuLjNiNTYx
YzdlN2M0ZjkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9NYWtlZmlsZQorKysgYi9hcmNoL3g4
Ni9rdm0vTWFrZWZpbGUKQEAgLTQyLDggKzQyLDggQEAgJChvYmopL3N2bS92bWVudGVyLm86ICQo
b2JqKS9rdm0tYXNtLW9mZnNldHMuaAogQUZMQUdTX3ZteC92bWVudGVyLm8gICAgOj0gLWlxdW90
ZSAkKG9iaikKICQob2JqKS92bXgvdm1lbnRlci5vOiAkKG9iaikva3ZtLWFzbS1vZmZzZXRzLmgK
IAotJChvYmopL2t2bS1hc20tb2Zmc2V0cy5oOiAkKG9iaikva3ZtLWFzbS1vZmZzZXRzLnMgRk9S
Q0UKKyQob2JqKS9rdm0tYXNtLW9mZnNldHMuaDogJChvYmopL2t2bS1hc20tb2Zmc2V0cy5vIEZP
UkNFCiAJJChjYWxsIGZpbGVjaGssb2Zmc2V0cyxfX0tWTV9BU01fT0ZGU0VUU19IX18pCiAKLXRh
cmdldHMgKz0ga3ZtLWFzbS1vZmZzZXRzLnMKK3RhcmdldHMgKz0ga3ZtLWFzbS1vZmZzZXRzLm8K
IGNsZWFuLWZpbGVzICs9IGt2bS1hc20tb2Zmc2V0cy5oCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni91
bS9NYWtlZmlsZSBiL2FyY2gveDg2L3VtL01ha2VmaWxlCmluZGV4IDM2ZTY3ZmM5N2MyMmYuLjY1
NjM1MDNkNGIyNWQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3VtL01ha2VmaWxlCisrKyBiL2FyY2gv
eDg2L3VtL01ha2VmaWxlCkBAIC0zOCwxMSArMzgsMTEgQEAgc3ViYXJjaC0kKENPTkZJR19NT0RV
TEVTKSArPSAuLi9rZXJuZWwvbW9kdWxlLm8KIAogVVNFUl9PQkpTIDo9IGJ1Z3NfJChCSVRTKS5v
IHB0cmFjZV91c2VyLm8gZmF1bHQubwogCi0kKG9iaikvdXNlci1vZmZzZXRzLnM6IGNfZmxhZ3Mg
PSAtV3AsLU1ELCQoZGVwZmlsZSkgJChVU0VSX0NGTEFHUykgXAorJChvYmopL3VzZXItb2Zmc2V0
cy5vOiBjX2ZsYWdzID0gLVdwLC1NRCwkKGRlcGZpbGUpICQoVVNFUl9DRkxBR1MpIFwKIAktSWFy
Y2gveDg2L2luY2x1ZGUvZ2VuZXJhdGVkCi10YXJnZXRzICs9IHVzZXItb2Zmc2V0cy5zCit0YXJn
ZXRzICs9IHVzZXItb2Zmc2V0cy5vCiAKLWluY2x1ZGUvZ2VuZXJhdGVkL3VzZXJfY29uc3RhbnRz
Lmg6ICQob2JqKS91c2VyLW9mZnNldHMucyBGT1JDRQoraW5jbHVkZS9nZW5lcmF0ZWQvdXNlcl9j
b25zdGFudHMuaDogJChvYmopL3VzZXItb2Zmc2V0cy5vIEZPUkNFCiAJJChjYWxsIGZpbGVjaGss
b2Zmc2V0cyxfX1VTRVJfQ09OU1RBTlRfSF9fKQogCiBVTlBST0ZJTEVfT0JKUyA6PSBzdHViX3Nl
Z3YubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZW1vcnkvTWFrZWZpbGUgYi9kcml2ZXJzL21lbW9y
eS9NYWtlZmlsZQppbmRleCBkMmU2Y2E5YWJiZTAyLi5lZmFlOTVmMzE1YTEyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL21lbW9yeS9NYWtlZmlsZQorKysgYi9kcml2ZXJzL21lbW9yeS9NYWtlZmlsZQpA
QCAtMzQsOCArMzQsOCBAQCB0aS1lbWlmLXNyYW0tb2JqcwkJOj0gdGktZW1pZi1wbS5vIHRpLWVt
aWYtc3JhbS1wbS5vCiAKICQob2JqKS90aS1lbWlmLXNyYW0tcG0ubzogJChvYmopL3RpLWVtaWYt
YXNtLW9mZnNldHMuaAogCi0kKG9iaikvdGktZW1pZi1hc20tb2Zmc2V0cy5oOiAkKG9iaikvZW1p
Zi1hc20tb2Zmc2V0cy5zIEZPUkNFCiskKG9iaikvdGktZW1pZi1hc20tb2Zmc2V0cy5oOiAkKG9i
aikvZW1pZi1hc20tb2Zmc2V0cy5vIEZPUkNFCiAJJChjYWxsIGZpbGVjaGssb2Zmc2V0cyxfX1RJ
X0VNSUZfQVNNX09GRlNFVFNfSF9fKQogCi10YXJnZXRzICs9IGVtaWYtYXNtLW9mZnNldHMucwor
dGFyZ2V0cyArPSBlbWlmLWFzbS1vZmZzZXRzLm8KIGNsZWFuLWZpbGVzICs9IHRpLWVtaWYtYXNt
LW9mZnNldHMuaApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rYnVpbGQuaCBiL2luY2x1ZGUv
bGludXgva2J1aWxkLmgKaW5kZXggZTdiZTUxN2FhYWY2OC4uYmQ3ZTA5YTVlYmUxZiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9rYnVpbGQuaAorKysgYi9pbmNsdWRlL2xpbnV4L2tidWlsZC5o
CkBAIC0yLDE1ICsyLDI3IEBACiAjaWZuZGVmIF9fTElOVVhfS0JVSUxEX0gKICNkZWZpbmUgX19M
SU5VWF9LQlVJTERfSAogCi0jZGVmaW5lIERFRklORShzeW0sIHZhbCkgXAotCWFzbSB2b2xhdGls
ZSgiXG4uYXNjaWkgXCItPiIgI3N5bSAiICUwICIgI3ZhbCAiXCIiIDogOiAiaSIgKHZhbCkpCisj
ZGVmaW5lIF9MSU5FKHgsIC4uLikgXAorCWFzbSB2b2xhdGlsZSggXAorCQkiLnB1c2hzZWN0aW9u
IFwiLmRhdGEua2J1aWxkXCI7ICJcCisJCSIuYXNjaWkgXCIiIHggIlxcblwiOyAiXAorCQkiLnBv
cHNlY3Rpb24iIDogOiBfX1ZBX0FSR1NfXykKIAotI2RlZmluZSBCTEFOSygpIGFzbSB2b2xhdGls
ZSgiXG4uYXNjaWkgXCItPlwiIiA6IDogKQorLyoKKyAqIE5PVEU6IFdlIHVzZSAlbjAgYW5kIC0o
dmFsKSB0byB3b3JrIGFyb3VuZCBhIGJ1ZyBpbiBzb21lIGNvbXBpbGVycworICogdGhhdCBvdXRw
dXQgYSBsZWFkaW5nIHBvdW5kIHN5bWJvbCAoJyMnKSBldmVuIHdoZW4gdXNpbmcgdGhlICVjCisg
KiBtb2RpZmllci4KKyAqLworI2RlZmluZSBERUZJTkUoc3ltLCB2YWwpIFwKKwlfTElORSgiI2Rl
ZmluZSAiICNzeW0gIiAlbjAgLyogIiAjdmFsICIgKi8iLCAiaSIgKC0odW5zaWduZWQgbG9uZykg
KHZhbCkpKQogCiAjZGVmaW5lIE9GRlNFVChzeW0sIHN0ciwgbWVtKSBcCiAJREVGSU5FKHN5bSwg
b2Zmc2V0b2Yoc3RydWN0IHN0ciwgbWVtKSkKIAorI2RlZmluZSBCTEFOSygpIFwKKwlfTElORSgi
IikKKwogI2RlZmluZSBDT01NRU5UKHgpIFwKLQlhc20gdm9sYXRpbGUoIlxuLmFzY2lpIFwiLT4j
IiB4ICJcIiIpCisJX0xJTkUoIi8qICIgeCAiICovIikKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9z
YW1wbGVzL2JwZi9NYWtlZmlsZSBiL3NhbXBsZXMvYnBmL01ha2VmaWxlCmluZGV4IDNlMDAzZGQ2
YmVhMDkuLmE1ZDg2YWM4ZjVmNTcgMTAwNjQ0Ci0tLSBhL3NhbXBsZXMvYnBmL01ha2VmaWxlCisr
KyBiL3NhbXBsZXMvYnBmL01ha2VmaWxlCkBAIC0yNzAsMTAgKzI3MCwxMCBAQCAkKExJQkJQRl9P
VVRQVVQpICQoQlBGVE9PTF9PVVRQVVQpOgogCSQoY2FsbCBtc2csTUtESVIsJEApCiAJJChRKW1r
ZGlyIC1wICRACiAKLSQob2JqKS9zeXNjYWxsX25ycy5oOgkkKG9iaikvc3lzY2FsbF9ucnMucyBG
T1JDRQorJChvYmopL3N5c2NhbGxfbnJzLmg6CSQob2JqKS9zeXNjYWxsX25ycy5vIEZPUkNFCiAJ
JChjYWxsIGZpbGVjaGssb2Zmc2V0cyxfX1NZU0NBTExfTlJTX0hfXykKIAotdGFyZ2V0cyArPSBz
eXNjYWxsX25ycy5zCit0YXJnZXRzICs9IHN5c2NhbGxfbnJzLm8KIGNsZWFuLWZpbGVzICs9IHN5
c2NhbGxfbnJzLmgKIAogRk9SQ0U6CmRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLmxpYiBi
L3NjcmlwdHMvTWFrZWZpbGUubGliCmluZGV4IDIwNzMyNWVhZjFkMWMuLjFhZDA1OTkxNDdkMGEg
MTAwNjQ0Ci0tLSBhL3NjcmlwdHMvTWFrZWZpbGUubGliCisrKyBiL3NjcmlwdHMvTWFrZWZpbGUu
bGliCkBAIC01ODMsMjkgKzU4MywyMyBAQCBxdWlldF9jbWRfenN0ZDIyX3dpdGhfc2l6ZSA9IFpT
VEQyMiAgJEAKICMgQVNNIG9mZnNldHMKICMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAKLSMgRGVmYXVs
dCBzZWQgcmVnZXhwIC0gbXVsdGlsaW5lIGR1ZSB0byBzeW50YXggY29uc3RyYWludHMKLSMKLSMg
VXNlIFs6c3BhY2U6XSBiZWNhdXNlIExMVk0ncyBpbnRlZ3JhdGVkIGFzc2VtYmxlciBpbnNlcnRz
IDx0YWI+IGFyb3VuZAotIyB0aGUgLmFzY2lpIGRpcmVjdGl2ZSB3aGVyZWFzIEdDQyBrZWVwcyB0
aGUgPHNwYWNlPiBhcy1pcy4KLWRlZmluZSBzZWQtb2Zmc2V0cwotCSdzOl5bWzpzcGFjZTpdXSpc
LmFzY2lpW1s6c3BhY2U6XV0qIlwoLipcKSIuKjpcMTo7IFwKLQkvXi0+L3tzOi0+I1woLipcKTov
KiBcMSAqLzo7IFwKLQlzOl4tPlwoW14gXSpcKSBbXCQkI10qXChbXiBdKlwpIFwoLipcKTojZGVm
aW5lIFwxIFwyIC8qIFwzICovOjsgXAotCXM6LT46OjsgcDt9JwotZW5kZWYKLQogIyBVc2UgZmls
ZWNoayB0byBhdm9pZCByZWJ1aWxkcyB3aGVuIGEgaGVhZGVyIGNoYW5nZXMsIGJ1dCB0aGUgcmVz
dWx0aW5nIGZpbGUKICMgZG9lcyBub3QKKyMKKyMgYmludXRpbHMgb2JqY29weSBkb2Vzbid0IHN1
cHBvcnQgb3BlbmluZyAiLSIgYXMgc3Rkb3V0LCBzbyB3ZSB1c2UgL2Rldi9zdGRvdXQKKyMgaW5z
dGVhZC4gTExWTSdzIG9iamNvcHkgaXMgdGhlIG9wcG9zaXRlOyBpdCBzdXBwb3J0cyAiLSIgYnV0
IG5vdCAvZGV2L3N0ZG91dC4KKyMgT3BlbmluZyAvZGV2L3N0ZG91dCB3aWxsIHN0YXJ0IG92ZXJ3
cml0aW5nIGF0IGZpbGUgb2Zmc2V0IDA7IHBpcGUgdG8gY2F0IHRvCisjIGVuc3VyZSAvZGV2L3N0
ZG91dCByZWZlcnMgdG8gYSBwaXBlIGFuZCBub3QgdGhlIHRlbXBvcmFyeSBmaWxlLgogZGVmaW5l
IGZpbGVjaGtfb2Zmc2V0cwotCSBlY2hvICIjaWZuZGVmICQyIjsgXAotCSBlY2hvICIjZGVmaW5l
ICQyIjsgXAotCSBlY2hvICIvKiI7IFwKLQkgZWNobyAiICogRE8gTk9UIE1PRElGWS4iOyBcCi0J
IGVjaG8gIiAqIjsgXAotCSBlY2hvICIgKiBUaGlzIGZpbGUgd2FzIGdlbmVyYXRlZCBieSBLYnVp
bGQiOyBcCi0JIGVjaG8gIiAqLyI7IFwKLQkgZWNobyAiIjsgXAotCSBzZWQgLW5lICQoc2VkLW9m
ZnNldHMpIDwgJDw7IFwKLQkgZWNobyAiIjsgXAotCSBlY2hvICIjZW5kaWYiCisJZWNobyAiI2lm
bmRlZiAkMiI7IFwKKwllY2hvICIjZGVmaW5lICQyIjsgXAorCWVjaG8gIi8qIjsgXAorCWVjaG8g
IiAqIERPIE5PVCBNT0RJRlkuIjsgXAorCWVjaG8gIiAqIjsgXAorCWVjaG8gIiAqIFRoaXMgZmls
ZSB3YXMgZ2VuZXJhdGVkIGJ5IEtidWlsZCI7IFwKKwllY2hvICIgKi8iOyBcCisJZWNobyAiIjsg
XAorCSQoT0JKQ09QWSkgLWogLmRhdGEua2J1aWxkIC1PIGJpbmFyeSAkPCAkKGlmICQoTExWTSks
LSwvZGV2L3N0ZG91dCkgfCBjYXQ7IFwKKwllY2hvICIiOyBcCisJZWNobyAiI2VuZGlmIgogZW5k
ZWYKZGlmZiAtLWdpdCBhL3NjcmlwdHMvbW9kL01ha2VmaWxlIGIvc2NyaXB0cy9tb2QvTWFrZWZp
bGUKaW5kZXggYzcyOWJjOTM2YmFlMS4uM2MzZjVlMTZhMzBhMiAxMDA2NDQKLS0tIGEvc2NyaXB0
cy9tb2QvTWFrZWZpbGUKKysrIGIvc2NyaXB0cy9tb2QvTWFrZWZpbGUKQEAgLTgsMTAgKzgsMTAg
QEAgbW9kcG9zdC1vYmpzCTo9IG1vZHBvc3QubyBmaWxlMmFsaWFzLm8gc3VtdmVyc2lvbi5vIHN5
bXNlYXJjaC5vCiAKIGRldmljZXRhYmxlLW9mZnNldHMtZmlsZSA6PSBkZXZpY2V0YWJsZS1vZmZz
ZXRzLmgKIAotJChvYmopLyQoZGV2aWNldGFibGUtb2Zmc2V0cy1maWxlKTogJChvYmopL2Rldmlj
ZXRhYmxlLW9mZnNldHMucyBGT1JDRQorJChvYmopLyQoZGV2aWNldGFibGUtb2Zmc2V0cy1maWxl
KTogJChvYmopL2RldmljZXRhYmxlLW9mZnNldHMubyBGT1JDRQogCSQoY2FsbCBmaWxlY2hrLG9m
ZnNldHMsX19ERVZJQ0VUQUJMRV9PRkZTRVRTX0hfXykKIAotdGFyZ2V0cyArPSAkKGRldmljZXRh
YmxlLW9mZnNldHMtZmlsZSkgZGV2aWNldGFibGUtb2Zmc2V0cy5zCit0YXJnZXRzICs9ICQoZGV2
aWNldGFibGUtb2Zmc2V0cy1maWxlKSBkZXZpY2V0YWJsZS1vZmZzZXRzLm8KIAogIyBkZXBlbmRl
bmNpZXMgb24gZ2VuZXJhdGVkIGZpbGVzIG5lZWQgdG8gYmUgbGlzdGVkIGV4cGxpY2l0bHkKIAot
LSAKMi4zNC4xCgo=

--------------8eAlgcNTk3s0TP4A5M1jDSqW--

