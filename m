Return-Path: <linux-kbuild+bounces-5085-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4E9EDF25
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 07:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84BEF28116D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 06:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0FD17D366;
	Thu, 12 Dec 2024 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d+cDzaPe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3690F186607;
	Thu, 12 Dec 2024 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733983210; cv=fail; b=nFhPdqk+kxMd1SsxHAguIX6rJH4IZxfqpz7d81ZT2t3SNrQ+Am7aLI/m6yKQHHrjM5PQU3m1MzdnVaqHvwknElwYHf/GCQwKjslk1+Hq/PLMZdxJ8MCkhyM9Md4wvrXKfUPHhKCm1BKM0rXBQ0KRsLw4HuIJ3DF7fqoHCkM7giI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733983210; c=relaxed/simple;
	bh=49fYrv+4udf1nm3tAZpbOzC5ixAT4bXPxb7A6jOUp7Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JjihiLxeSnMB8cEvJkfAOI8Q/Ih7xfcUWXa4rsYA4TXO+J91vgby0rKaxFL9WRcEWGe8NfJf2gEZGhD58XEuYNT26XZ0+VHjgkLeMEdw1y3VyeboD3jMFfVq0/360b1emTs6y8QaDkL+hkl5i/JRFEeF5YeYXZ3Q9FZMibE1EIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d+cDzaPe; arc=fail smtp.client-ip=40.107.223.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCrd2Ys+6Uejd4go6C5exj0rSWdLTQufYyzkOYhoV0VVmnjsFoc4Q/vrKGfMZzuDgjnF2v8WqrVn62YBqcIiPePX9Q2gMQEmdXr6ujS6/4qStRgWRCN5531f24IkzHDZWtSvgEQOwgrBKSTCPH1rLteSVPSYzJmcVUmnZLGi5UBNSZa/1qgcRQcw9BMmewHvpG7Q2r/8zydfAckxMN2ZGhtHvCVwMvPWpIHlTdU4Li0tO/mCewQlAyAmyqCh+B303ZCmghlX7/JRhW6KhKSHpUl8+kN3cnWfr69ecJy+x81BXWZ35xqVnuipGQbzLwj47kLHTar9PtlZxm1YZcn+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMRaVKqJFfN/DO9MDrjpG/YIBaH32BjYOEdHmZKp+e8=;
 b=mqQlnLpPRcfBm7JlxHZ3PUPd52uaDx0wqWVkyzQ6DqE/5z51kz/n+oyvf4PyE4w5zdF6SLm9T5sSeDwcsbI/AAvfnwWQRFtq8lUEtmnv7mDNV1iFcRc0KFVLTROU00Q1Mqpka1qOeUGfTdHb4lFAAZfGHOIt1pYF0WZog3RHhIgrVdjdTnwr/vwI2mBWRfpA+pZrQgJMX7vlGCGZML/Kc3/94UO/cwG8HsNnNAkYTJuaiBXTNeZBsPeuW6BQjnWfaK7NHE1pp+SnLtXQNPVX7yyvALZ7Pzs3gR1KQVgBFkpSnRrSAt7BGt8FC0nb/G3LTTsFlpzpbSlzRxsCa3NCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMRaVKqJFfN/DO9MDrjpG/YIBaH32BjYOEdHmZKp+e8=;
 b=d+cDzaPe+m7N3TQXe8BTp7dmDGmXSenL8JWADtTpyKx3Hw3RmjgS76yVSP3RkraSk2ILGjhEiwKN++dbuN0UKo2AInlIKkHb+sVZkmS8BP8G92ExkvoHz4TKm/zK3oJDjeG0QiFvxiiloB5T48kqenza/9sDyDbvPN+mcLCByVErmD5hcH+uIRT68lBEHkAff3NsIJbBWaP8zGTSrjj3WZaaYUQiZnsNgAjjkBVxDQvbOLN9w3yXKTXZr70RDCrz8aoyK7yU30sbX2yNZgAzE35SIW9CtUlj0P6/4WoxMGXkw7KFtVFFRtCwQin9jQv750+DVTT5N3q0mxH0DkVsig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 06:00:05 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 06:00:04 +0000
Message-ID: <eb21a546-a19c-40df-b821-bbba80f19a3d@nvidia.com>
Date: Thu, 12 Dec 2024 06:00:00 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, cocci@inria.fr,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
 <20241110013649.34903-6-masahiroy@kernel.org>
 <bdd5ff13-ec66-4ab6-985a-1fe433e85f91@nvidia.com>
 <CAK7LNATgL=vOr37+XfF7du+_ak5yKgXYyNNNTEQdVvy5J2MMyA@mail.gmail.com>
 <b20db4db-afb4-4f58-bc01-ae1250abc8b0@nvidia.com>
 <CAK7LNATzdVrvmqm2wYHojVhNEiBNTaz6+4xgGBJwFixDvL=TMA@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAK7LNATzdVrvmqm2wYHojVhNEiBNTaz6+4xgGBJwFixDvL=TMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0449.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::22) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: d08d1a36-2dea-4417-e72f-08dd1a72392b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVZFWmh2YVNlYlM0ZTNiSWZEWlJ2MXZuTFFtUXF3NWdkRkpFYzEzUE84RE4z?=
 =?utf-8?B?dnZuRjEyZ2Z5bGd2aDBoWENqdmROekczdWh2d3dnOTBvZnJVaTdCQjhWM1hX?=
 =?utf-8?B?b3dTaFhjdEVDcTFpaTR5d3AxOHdKc2lTWUs0M3BRK0tqQVd6UCtSZHBscUcx?=
 =?utf-8?B?NlF6RzZOVWxHYlZ1bU45V0NiOUVoODNaNEJuU0c5M2tsREVQWWIyb2tYZURI?=
 =?utf-8?B?QkFFTXdZTEp5d0N6RW1nWlBXcEF2NldmOExnM2VCcEJpRGt4ZWJvbFM3ck1R?=
 =?utf-8?B?WTFnU3d5Y1VWYktqalNIbDA0eEV3akdmSS9OQVZFMnE0ZThvQTNMelBNekZl?=
 =?utf-8?B?b0o4cDN0bmdGSGFnZUNEWlZITTRvd1l5VDhQZ2hUdE1GaUJQVEhRSCtSTDFG?=
 =?utf-8?B?TENXajRRRDFNeSswbTI1NzVIeHp5aGhCWThYekJQODRxWFdjY0JKbnNhai9v?=
 =?utf-8?B?bGdMOFcxWFIwU1BROXRpZm4xRzA1WkZJMXVQbDBKM0F2WjF5L2JQSVRQSWVZ?=
 =?utf-8?B?QSttaENVc1g5Z041RGxFanhCbmRwaWNiaDR3TlBHNjVjVnYwekJNeDFJRmQ0?=
 =?utf-8?B?N1U5empnY0oxUTdVZ09FTE4rYnRoUUo0d0JDOVExVkdKSE5yVlk2allmaDNx?=
 =?utf-8?B?VHNETld0cmZ6b2JkY0ZoUkNaYjNBY3J6aGVmaG1aZ2RSK083dHdvS3ZLYis5?=
 =?utf-8?B?blNwOFJTaTNkTkhMdjhnSmFXME50SUQvQnAxTGdqZmtVVUpya0lGMVk4S2FM?=
 =?utf-8?B?UjBmZjRYNHk1UnlqQzl0VkE2c0lQd0YxV1NPMXA2RE5pdUl3Rk9TdEVUck8w?=
 =?utf-8?B?ZGk5MjlTYkZ6VUkrWjlKSGwyekJkYkUwSjVQbEpHRk1Cc2hXdnM0dG9HeEda?=
 =?utf-8?B?eUJHUE1OOExlVGk1NVJXYWtwNy94anFTS1EvOHgwditneDgzWWxreFphT1Rt?=
 =?utf-8?B?S2swZmlOMTFycHlFK2I0MWpGay9GSDZiTytZUFhCTm14bGtsTUZyT2pXeEgy?=
 =?utf-8?B?dEFQcGNST0NFZEdqMnRHNE1iT0VCMys1V1pPNXlyMmovVUdqZ2xoRlB4TkE3?=
 =?utf-8?B?T1RnV3NqSG80R0taTmdEMVYvYWY0TmZqR2tVc0kzUnlnaHhnV3QyUHhobHdJ?=
 =?utf-8?B?MDAram9pc01kdmxLWFBFRDBkN0thcFdyamgxMTdla0wySWFTZWpPdUZwcVJC?=
 =?utf-8?B?dFN4RlozOGFlVGdKTjdmL0RjeXA4bjJjeitaUWZnMWJySFpWSE56Z1habWhJ?=
 =?utf-8?B?Z3VGVG5SWHY0N3BhNDFLc1BpQVBmcDVZeGh6SjBvSTAvWjJGVGhISXkyRTdp?=
 =?utf-8?B?UTN0VmVCMjVJZ000ZFNpMUFUWms5cmVDSHVEMmMxYjB4WXBsYWozL0dNKzNU?=
 =?utf-8?B?ZExOcm1TQk1mOFRPY2RkcHBLK2hrZEdhTmZ0S1BQT1FSQ1RDbmhJdkM0SnJX?=
 =?utf-8?B?QUhUdGczdC9FTU5BNGtNWVBadXR6MXNKcDRhTXA3cWhRQytzTGk5NGN6YVVT?=
 =?utf-8?B?d1B2WVRqMzBUajRHTDE4TE1lRVY0S20rclN6R0lKQnRmSVpJcy9EakhNcHIv?=
 =?utf-8?B?Y05LTGI3T0NUcERiRmRHQ1J1U3VCN0ZnMklSOHVFaCtnRk44S0RubS8xemJp?=
 =?utf-8?B?dVdMbjFYUUZYMGRBaDE4WXNNdHB4Zk00czNwQmoyeDlRSktuc1Y2V2t6N1BB?=
 =?utf-8?B?bUhDSGdaYnVybmdvK0RPYXF4NGZqcTVhUk8vU2hPbS9sdmt0R25vdUkrVUx1?=
 =?utf-8?B?K0VEOG9hcmdGT0h6c0dnWGZGUm1SdWhkRUNsY2lOblR5WlYwemtKRDhRNGVK?=
 =?utf-8?B?WlpqMmNIclJQMFcrdUh6QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGFjYnNwemJ6S0RROUdsV1ZpYUt5b1BmekQyTVBUaGx2QVgrN1FWVUtrR0cr?=
 =?utf-8?B?VFZNSUZIcTU3b1BXWWFINEdmY2RKTHlIRHphMFdnSlZLRTdjd1U5SGFOSytB?=
 =?utf-8?B?S052Z29RTHpzNktMNXNmc1Q5WjVaUVp5TzhpTkVPcjRTcVJ1RW42aG5MRThl?=
 =?utf-8?B?MFlrZ0pBN1E0Z0l6VFFYY0tUU1drRS9vdzJYb2pmbUkxZWkyRGNFa0JRMHVu?=
 =?utf-8?B?dkVYanJSeU5JRy9DdzNTSkZ5UjNlSHlKbmFYSmNmM3lXTWlobWFTMlFZSWZH?=
 =?utf-8?B?a2x0NGxGN1ZCdjB3d1V4VFg5a2REZ0NyNHR5UzI1cDdmYXF6ZVEzU2FxQnpD?=
 =?utf-8?B?SXh0WnZVL2trbEczZ0FFOWJVWFFHT1F4ZUtQUlhLeEM4b3Q5V1RsTFNaYzdt?=
 =?utf-8?B?eGxoTDVJdGdZMkorYnQvanBJRVplZkhtcEs2VDVHb0t0b1hBSWJKN2YzRVU2?=
 =?utf-8?B?NEJZK3YxSEk3alg4QmhNaXVkKytTbXJRckQwSnZCMDl5bDNyMmhwbERVMUJY?=
 =?utf-8?B?THdETDJLMlFCUitOS2ZXcGpBOTZkVjdjK2NtQVJsRHE1R0xjZDZiNUsydDNV?=
 =?utf-8?B?ZktneVozRU5VWFA4UTdGVStFQmRNWEN1YzMreGhuVTNqaVVZajRWWW8rS0Ny?=
 =?utf-8?B?OHorY09JNlEyRStlVE1YMVR2WFFTbGlnSnNHMEljNFM3TTZSWHVmY3NqVkRI?=
 =?utf-8?B?Uy9mZDZaRjJnVW81emRJZmMxVW56WWJsWDVBY05keisySVd2YTJwYm80azFL?=
 =?utf-8?B?R0o0djRBeWpaR2ZkaW0rWGF5TVErQlpyQWJhUTNJakg1M3dmRU0rQ1c3UlJ0?=
 =?utf-8?B?OW50cURmNjZzZjNtVlRramVJbU81bzlRTzhWR0lkeTdJc05Zd24zM0hWVFMy?=
 =?utf-8?B?bHRvTlhrOXFtVnY1Z0RqVFBRWS9HMCtWcmV1T2xhV3lkQys4THh4ZFBFYzQ3?=
 =?utf-8?B?cjBFMmJHbktnR2FtMEZ0OTYyYTNqbVJlV2NIcXd2d1pLQ1JNSHY4bTAzaDU5?=
 =?utf-8?B?K2VzMDBZelJtRGtCcTZXSWcrc0JRSzh1d2RlSkRwYkFaQzRKMko4My9hZnhE?=
 =?utf-8?B?am9EVlNGcnRhWk1hR01mUzNvNUlsWXNJS0ZISm92L2NVL1E1T043N2g5ZlFj?=
 =?utf-8?B?OHQwaS9QVGM3TlpkVDdNMlBLQjlZSDBYOWI3V1dDUkR3djJZWUZXNStaaUNs?=
 =?utf-8?B?TnZFQk1TUDM4aGlmejRyR3VRb3ZxaGl4eUJsZUh0TkpWOERTTXRzaFFxcEtW?=
 =?utf-8?B?WndEaGNGMTdaN0dBSmZKdVpNcTVPN3VCS2E5NjVndHVZdWJRcENjamg0Rjdx?=
 =?utf-8?B?NUlWbUoxRmx5YklvUDVIUG5HaC8zTS9QVUo0MjZSWDF2YjFlNGxrRUlWbjk4?=
 =?utf-8?B?S0FZU3UzNCswY24vMWtnMFNsbHRWcnlHWitJTUEwRGRtakx2SzBVdmorMXJl?=
 =?utf-8?B?c2ZQY25qZTNDR3FoOURJemgyZ2hBcUtMYm9VRXh0b2gycDNJc2NjM3c2STdB?=
 =?utf-8?B?dFVxajdlK2F5S0hMZ29Gd2FXRmN1cTJhWWRQdTllKy9jZUxNT01LR0dsdEpo?=
 =?utf-8?B?cmdlbFVNS1Q4d1QvQ2dJblo3Zk91N21ya2VtVUNNaDBiYklMZWZGRXlYbkF0?=
 =?utf-8?B?eVhGeDIwSTZDQ0hnMzVWRlZhZHJ1cC9xNjlkUEE5bHZCVkJ5bWkwWVcyZnZP?=
 =?utf-8?B?dUlYRTN1R20zUEdFTEIxbFZ4ZE9nMTAvZDFNWVVJeWtGNk1oVDMvandydEJv?=
 =?utf-8?B?MzBRc0ZwVEVlSnpDYURsWmFFUmhEWXNZbk02b0N3UjhqRDI3SVhxNGcwWkVs?=
 =?utf-8?B?NGg2Y0xtcmlLV3FOQ3Yrb1lvQ3kwaFlQa2Q1ZUM4aXpqNDRmMTRkYWdPdFpH?=
 =?utf-8?B?aVdqNnR0YVpjT2hBM3M0TU9yemtjSGY1NU1jK0gwNklseHIvYUVLeTFDSko5?=
 =?utf-8?B?ZUVobHA3cXRkSEZXZ09JYWp1OEFVcFhyb1ZnOVIvRVFrMm1RaG02L0lMbGVC?=
 =?utf-8?B?VEJOa2hnVWZ3Z3U1RnpGTmZBaTN5eHlWVlcrNjM2VjNhWVQzUkNsNGx0dEUv?=
 =?utf-8?B?eFEzU1U2cG9rbnZKTmFEQ3MwYUIzc2tETEM1WTI1ZDhZNExvR3dlVmFoSkhM?=
 =?utf-8?Q?CKI34aFxkx8yQaunvSQmnqiUE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08d1a36-2dea-4417-e72f-08dd1a72392b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 06:00:04.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FgMosZZOab5V49Hv0mWPHhTMEx9D/bvH7kW06TQNbkSCmVQb29W6lOrvm9SpoOFrELSsBfPB5zIxcnHoNmiGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312


On 12/12/2024 02:08, Masahiro Yamada wrote:
> On Wed, Dec 11, 2024 at 9:21 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 11/12/2024 02:39, Masahiro Yamada wrote:
>>> On Wed, Dec 11, 2024 at 12:34 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>
>>>> Hi Masahiro,
>>>>
>>>> On 10/11/2024 01:34, Masahiro Yamada wrote:
>>>>> Currently, Kbuild always operates in the output directory of the kernel,
>>>>> even when building external modules. This increases the risk of external
>>>>> module Makefiles attempting to write to the kernel directory.
>>>>>
>>>>> This commit switches the working directory to the external module
>>>>> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
>>>>> some build artifacts.
>>>>>
>>>>> The command for building external modules maintains backward
>>>>> compatibility, but Makefiles that rely on working in the kernel
>>>>> directory may break. In such cases, $(objtree) and $(srctree) should
>>>>> be used to refer to the output and source directories of the kernel.
>>>>>
>>>>> The appearance of the build log will change as follows:
>>>>>
>>>>> [Before]
>>>>>
>>>>>      $ make -C /path/to/my/linux M=/path/to/my/externel/module
>>>>>      make: Entering directory '/path/to/my/linux'
>>>>>        CC [M]  /path/to/my/externel/module/helloworld.o
>>>>>        MODPOST /path/to/my/externel/module/Module.symvers
>>>>>        CC [M]  /path/to/my/externel/module/helloworld.mod.o
>>>>>        CC [M]  /path/to/my/externel/module/.module-common.o
>>>>>        LD [M]  /path/to/my/externel/module/helloworld.ko
>>>>>      make: Leaving directory '/path/to/my/linux'
>>>>>
>>>>> [After]
>>>>>
>>>>>      $ make -C /path/to/my/linux M=/path/to/my/externel/module
>>>>>      make: Entering directory '/path/to/my/linux'
>>>>>      make[1]: Entering directory '/path/to/my/externel/module'
>>>>>        CC [M]  helloworld.o
>>>>>        MODPOST Module.symvers
>>>>>        CC [M]  helloworld.mod.o
>>>>>        CC [M]  .module-common.o
>>>>>        LD [M]  helloworld.ko
>>>>>      make[1]: Leaving directory '/path/to/my/externel/module'
>>>>>      make: Leaving directory '/path/to/my/linux'
>>>>>
>>>>> Printing "Entering directory" twice is cumbersome. This will be
>>>>> addressed later.
>>>>>
>>>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>>>
>>>>
>>>> Since this change I have been observing the following build error when
>>>> building an external module ...
>>>>
>>>>     MODPOST Module.symvers
>>>> ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_init' exported
>>>>        twice. Previous export was in drivers/gpu/host1x/host1x.ko
>>>> ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_exit' exported
>>>>        twice. Previous export was in drivers/gpu/host1x/host1x.ko
>>>>
>>>> Now host1x is an upstream driver, but I have a local copy that using to
>>>> stage development changes (and avoid polluting the upstream driver).
>>>> Plus I can swap between which version I am using on a live system.
>>>>
>>>> What I noticed is that previously the Modules.symvers for the external
>>>> module had the full path of the external module for the name. However,
>>>> now the name is just the relative path and in this case
>>>> 'drivers/gpu/host1x/host1x'. Hence, this clashes with the in-kernel
>>>> driver and we get the 'exported twice' error.
>>>>
>>>> I have been looking to see if there is a way to fix this because it has
>>>> been a useful feature to override an upstream driver with a locally
>>>> modified version.
>>>
>>>
>>> I do not know how to reproduce it.
>>>
>>>     if (s && (!external_module || s->module->is_vmlinux || s->module == mod)) {
>>>
>>> is not checking the module path at all.
>>> I do not understand why it was affected.
>>
>>
>> So this is not explicitly checking the path, but comparing the contents
>> of the Module.symvers before and after this change for the external
>> module I see ...
>>
>> $ grep -r host1x_device_init Module.symvers
>> 0x00000000      host1x_device_init      /absolute/path/to/drivers/gpu/host1x/host1x        EXPORT_SYMBOL
>>
>> And now I see ...
>>
>> $ grep -r host1x_device_init Module.symvers
>> 0x00000000      host1x_device_init      drivers/gpu/host1x/host1x  EXPORT_SYMBOL
>>
>> So the problem is that now there is no longer an absolute path in the
>> external modules Module.symvers and so conflicts with the kernel's.
>>
>> Does that make sense?
> 
> 
> As I said, I do not know how to reproduce it.
> 
> Please provide the steps to reproduce it.

Got it! The steps would be ...

1. Create an external module by copying using an existing upstream
    driver (such as host1x).
2. Create a new external module that uses the external module from step
    1 and uses KBUILD_EXTRA_SYMBOLS to reference the Module.symvers for
    the driver in step 1.

Thanks!
Jon

-- 
nvpublic


