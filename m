Return-Path: <linux-kbuild+bounces-10834-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKghJg4Lc2mWrwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10834-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 06:45:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FFD70897
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 06:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A191E3004F40
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 05:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FA3362133;
	Fri, 23 Jan 2026 05:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cllXDI8P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9582ECEAC;
	Fri, 23 Jan 2026 05:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769147146; cv=fail; b=YgTgxScXso5knPtgEBZlV85gai1O3TQTB7TSkF44CR0oP0UcyMpGzWxzfpqkMfXTC4XKAwuH+cNT399HmK/lmx4aWTKX/8bdDdcr8vhoDnuu1SmY37looui4DfQz8juAeqnOU3kAjDmAPuDCbxWGr7mSteTeKEVrb94e6UQ5qrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769147146; c=relaxed/simple;
	bh=rUjEc4vHVbaikTzzbLT+59/hJl7aTKuQqjU573IQocg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Phqf7P4Z0RYMRzBf3bIykhc0jdSV0s5EQK88s8e9sAOuVj3e/kzSL0Ocqan+f73Fps723KOa2hGRJqGiKGcFAPYLLy9XiaC4W0A9X6SjNa2hlw4IA9AU5HyOdmE1ZxOYEp8WZQkcKSUL8TjBlRg1Fnfi+uz+lD2i+w5tIDCE4DI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cllXDI8P; arc=fail smtp.client-ip=40.107.200.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quoMyTX2FotrdoIE1s3HKyS94JxEgMkzCJMoMrJp59AAz60NAy0VVcQ6qZWP+5zy9wMtYammck3+O+oR6UslBPFYr7+R+FrkCgDFAZ6j2zwxU1fiJd1/UnslYp726rFoiQeJrB18dm1YPe/0IErFlO20Py+GQNVUYFwUC/dmJbBs/QM3BvVUhoacWQRIoy5zhs6pcv1Ay2tgSXFz5VqIgjFud4T7J2S5/NNQmlX6/Aa07bUzgUsr/MHo1hX3gY1nHlpCS2WWNYhpRlcZ3SVbBRvSkgw5QHQlwVjJSB2WkcY9VdGii0kSc0RBrjizXlIg4mnapPQxk3kVKNpbWVmENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUjEc4vHVbaikTzzbLT+59/hJl7aTKuQqjU573IQocg=;
 b=KjEUZKSY92Hze3/F3eEmHOCjrhY4dT4/NBGtJeD/goed8QYHttfOEazQ2Np5iW3Kr6ct+yTrdc0SkRXdvr8Rh1GjyAf7mX3YGxj96XZqojV/wG/SGqJkiHMlFgqFCDVOPaF0QDCaltIAiEcyOkCsQQ+JqPBSeXjlJcSJTD0L4zoAOlsIFz+KUskpYQloXNuppu+OUCxjFTLKBxTbizNjRUzNqifV0Ee+opYeNELjNX0+0ZL7xBQLb21UijG34qqG+IShQjwhevSeuUaW7jIQCFJL/uuWD6p9vTLflLvcb/lj9vB1jWbBlxjlC37ZFXSzRyCJ76nOunHRfpQUMsOb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUjEc4vHVbaikTzzbLT+59/hJl7aTKuQqjU573IQocg=;
 b=cllXDI8PfyW5748c3+CK0flNW3CGDCHPxBgw0jxlSOCxknlpzkb2Y5RB//ghfsZ2VbW/iR4Ur5AaNJyh1CO3cxvr0K2xbPrY9pdIXADgRR4M75LKojvs7T2OMRilKfHf5hhFo5YXBg+qmccbyKRJpweO0l43LVK6bQENpPQJo7QLzj+8cJGSaiNiV1EDf6mnegs6zIfFWSQncfMB4Ko9j7s/9t0c7dlFPiD8LfSfhEtruoAIcs3hbprpvgJCsol+4UMQdzvDEUxs8DA3BauRZx7iPCuF/IlSVbdJmkI0QHU7xN/aMbEXGyEsjZ5244tRTjHM4NqYE27LdDYuneXh5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Fri, 23 Jan 2026 05:45:33 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 05:45:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 14:45:29 +0900
Message-Id: <DFVQBFD54CJO.2D3VQ091URH2B@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot
 crates to sysroot_project
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Tamir Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
 <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
 <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com>
 <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
 <DFV2IL7N8X9O.2DLY12HALP8AA@gmail.com>
In-Reply-To: <DFV2IL7N8X9O.2DLY12HALP8AA@gmail.com>
X-ClientProxiedBy: TYCP286CA0132.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DM4PR12MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: cead9432-3033-49ff-06a8-08de5a42a019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW5ya2kzZUFDMUJWMSsvLzk0YUlQcWp1L3BDRSttTCtNK2x6djh3VUh4ZGpZ?=
 =?utf-8?B?cXB0Tm9VTUROT2l2ZTRNTmpvUU93UVZDYzVWbmRDNERjVTgwdXdrRngvTWlQ?=
 =?utf-8?B?RUZ3NEluVmVmWUtEWUoxaXcvcUJqd1d0ZFNjS3ZTWGRsZjYrMUFrNU1VS2xB?=
 =?utf-8?B?cjNmbmlFVUVRYUh6cnpyYTRaaTlXL2JPWnJhaTVwREFUV0h6NzZDYjRDYUVY?=
 =?utf-8?B?Y1ZONHN5cTZqRElNNVdSS3luWHRsM29iT1VUUGVIeDJiRXBLVnQrQTFBT2xH?=
 =?utf-8?B?SjdJNEVxVytYSkJKT3ZSRHBOdG9rN1N6MzJPYVhZQkV4SjhZUW1UT0U1Tmg2?=
 =?utf-8?B?UUFsemxNeGgyRWJUSEtVSXFqaTM5cnhsRDdycWRKaHdwRkJtZDlzTllkeGRk?=
 =?utf-8?B?WFlmczVkTzFNVVhmdHZQL3AvazhzSk15a0tyRzR4TzZ2RG1xRDRwTm5ob2Jr?=
 =?utf-8?B?SkFVSWVlWkhmd0p2Zy9tNjJtQVJXclBONDc2TUg1VWNFeGV5NG04aGw2YlFn?=
 =?utf-8?B?Zk54V2tlZDBMSWRlb2FuWVJWVklTZ012M0lCcjN3dlJOOWErSG95U1MrSXBZ?=
 =?utf-8?B?YTEvZnhpUVA2ZmpIRjNhcGxnUzVtYURKR0NNQW9QUlR4aFpEZWkzVmNzNEwv?=
 =?utf-8?B?b0dBQnFrUzFFa2t3ZmtXS1E1MFM5VTRGZzhZWjBNeHNEMW1rbmVzZjZYTGxV?=
 =?utf-8?B?WkZJQm5BVE5LRmc1UE8zZmd5bW9rNG1WVW5GS2dHc05USitNUXBRZWZSMm5J?=
 =?utf-8?B?c3VNZDgxeE1PTmtSOHlKaEJlZ0N6dXJ4eGtUOStXZlJpQVFlMmsxRUFNS0Zh?=
 =?utf-8?B?SzUyZ2pteitmQ1R0QSt1bmF3dEtxRWdkd1p4T0ozRFk2bzhjT2ZneENvN1BV?=
 =?utf-8?B?Zjg0Qk5YbHpqMmtGNnBJdjA1eHZ2eHpreXJPSDFmcGx2ZnFidUp4SHljSjJM?=
 =?utf-8?B?aEFXNkE1amNTdk12MGFsNitHOGM3MHp5ZkErem1BNlF5YlFpRDZmS1NOb2xW?=
 =?utf-8?B?bkFrNGtKNmlqOUluN3Nrb09qamlBelZLd0piUXZVNnR4VjZBMkRhb3Nxc3Nj?=
 =?utf-8?B?UThMN3Zwd2taSWxjSTBKL2xrQWx0TEhEMHBXYUM1emNYYWtNN2tLTCtkNzht?=
 =?utf-8?B?aFF2TC8xNmkweE9yWnloa1BJT0lDUWVpZk5ibnFZWW1VbnI4S1NuQThSNUlB?=
 =?utf-8?B?S3d1ZVFKcElzK0RWTlpuOWpEcmE4TzdlYVIyNC9ycjgweVo1dFZ0SlpLcnk1?=
 =?utf-8?B?VVNIYkpqVERHWFpZMjNUTW1nZ1dvck0rMytIbXV0eWVsY2VlR3NNYkdtb1ln?=
 =?utf-8?B?bkpvNmVqYzJvcGF6dkZEd3FqWlY1Y3paWm52OUVEWGkxTmtGcVA0b2NLUXJT?=
 =?utf-8?B?UEFGZGpwSXRueHNIV1BlZjhoeDh3aTJSN20yK0lOb2JPQ25VR09qYW9Rdmg4?=
 =?utf-8?B?NFN1ZitoMXdZZngyamUvbjZDNzJUT014aUZUVzQxaVBzTEZWeC9DQTVkTjRO?=
 =?utf-8?B?bFdNOEsxM3pvTEZEcmFpRFFZc1IxbnFBN1d5TDBDb0Fpd21ES2xxa0w1TkJ3?=
 =?utf-8?B?SS81WXZSb29GSTNsNUd6eVZGbnNFQU1JMTh1b2N5YXFiT3R2UFhzZ2RBKy9r?=
 =?utf-8?B?Y0lOSUhFZDh5TldDSzRXL3RlRzdsWGFXU3FmT1pXek1rUVNPeHpnR21acFdP?=
 =?utf-8?B?ZHBTN0tDc1JRVVlaVDUzZmdVMXBteU8vY3VWUGpaZjdzREsydHZZTlhVNmRQ?=
 =?utf-8?B?QzBUSkJ0SWg2TmJRZlVlSDE5ZXVsZlc4OS9uc0FLVk9wcmMyc2w4OWdielFj?=
 =?utf-8?B?L252UFBTTXFHQmRqb1o5Mlo0ekVSc2srcjU0M1NoWjJ3K0pkWXlpMjZsYXJm?=
 =?utf-8?B?WXhaRGdkN3dxZXQ5YU9wc0wyK2FLQzZoU29ITlNtSVh4L1ZveWJ5RUFnUm50?=
 =?utf-8?B?UEhkeVBGZkJ6VDJvYU5DSzN0YWk2OGdTK2RWcndBcmE2eXBPNm9DSDlvYlJx?=
 =?utf-8?B?aSthekxiUnV0b0x1dkh4aFZNZ201RExzaFFMSFFLTGp0THpqelBGU1lEN000?=
 =?utf-8?B?enQ1YTdxbkxIWWhULytnWFBVUHBkUUs5U21hZE92TmdOTHIwa0RFeGZpR0pN?=
 =?utf-8?Q?xVqM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkZoL08yQzlxaXRFTW9Udm9BMjNyOE5QVHQ2b3VkdXlVSDRSUU9SUVp2WHND?=
 =?utf-8?B?UFNhTW0vVVFBWXFLUjAvVnZmNitRbXRRUlIyR3o2Vml4MlBIQXhhTWsvU1Y1?=
 =?utf-8?B?VlFtV21BUTNvRmgxOXk3MXZaQU5zV1ArVDYxV2crSStUTGovUUhET3JMRTE0?=
 =?utf-8?B?VW0wY1ZVRVNtbWlWWDhTaGNsdGVra2UzSTZhMnBiek9QaE1wamRrVk9zYlJx?=
 =?utf-8?B?UHI2Wjh5aEFnL0VFcWI2Q3lmRzh6cXRmUnM2WTlCeHkzdHNMbXNUc2ZrTlZ4?=
 =?utf-8?B?ZkMvRFBqZFZnWDdqaUdKRitOVXNrdFNtRFlOaGFDUldzRFE4TkZidmFPVTBQ?=
 =?utf-8?B?YTFwODB1cThjVVZRQkhxemdOdm5nNFoySngxUEI3VEtIQUxLUkJrS3pQQTdp?=
 =?utf-8?B?SG9RWmN5Qi9GQjUwTS9Md2pLdnJCSldHRDRBMTdEeUkvOTcwc3QvQlM3TlVM?=
 =?utf-8?B?SW96YlVQYXJKdlp2SFNrZWRQcUpKaWdhazllZ2JwU0RFWW9nVTB6Mkx5ZEpt?=
 =?utf-8?B?UVVNMnE1cW9FWjQxZVVSNTNMblJ0WjlzZG9GYjJJQ3dEdGl0clVtWlRSZGw3?=
 =?utf-8?B?MWY4SVd0OUc0UUxBOWpCdmdwV1NIVmN6SkVxL3gwcFpyM0pFanlJejBuMW1a?=
 =?utf-8?B?SGFkRkViS1pEeFpHLys1SGwzRlJtcmRhREdoQUw4RUVXOGFjVVlWSW9IZTZS?=
 =?utf-8?B?Wi95TFA5S3NCUnQrOVpuN0V1WjlxM29RSWxzdVRsWnRLNGdTQ1BwTXVaVWxr?=
 =?utf-8?B?MzVPQXFWUWZ5ejlGckZpZTIyL0Vzc0FER2VvZENRR2hSS1ZJd3Mzc004c1pv?=
 =?utf-8?B?b3FuWnlRRzZlQXZOYVpDS05wbnFLb1NkZUlDSFJyYlVDN09YL2ZrRnU1Qitp?=
 =?utf-8?B?YW84V2RXNWh5WDhmVzFZQ0VCY25HM2dBNWNlT0ZNdklxUmtzUWdYZE9NNkQy?=
 =?utf-8?B?THdORkFvRGh3V0IycHJtMnpnSzdZbkxnNjQ3Z2dkSHU4NEtkTE5kRGdkNlp3?=
 =?utf-8?B?M3hyZmx2WUNnTVJnYXp5alU5S01nclJJTFc4enBwWXVXWERKZjRwNW42NFJa?=
 =?utf-8?B?NXNkQkFwejBiM0pjOVhvS3VPcUduelVkZFRVbzNMMTFROUR5UUxLR3Y4NnA5?=
 =?utf-8?B?SFV0Q1oyRS8wOFZoUWJwRUNQNlFESDU4MzJSN1dEVzRraEZraUFsSDhGWTFB?=
 =?utf-8?B?b2J0SDVhYmxOK1ErbHNsS0lpQm5zL0Q2QmxkZitmMW03Y2M2em54SDhmV1A3?=
 =?utf-8?B?UzdQSjl3cm5rRzUxL0ZTNmdIZEI0dXEzL1V2UU5pTEtscTdZQ2xpR0xQcU92?=
 =?utf-8?B?UkZNLzYwV3hNTExpYVo3WHN3NXg2MkJyZ1dmUnhURzBRQ1dOR29zNUs0UmNE?=
 =?utf-8?B?SlNkZ3U3WHdBME13WDk2RGNRWDdMZmpXdWp4c2pTM093NDhrelg3amdPSjVF?=
 =?utf-8?B?cEFPc0p6dElubmhkOHYvNWJFeXc4Q3hOaU5aRDI2UGRlZDNzTGtGa0RyRE1I?=
 =?utf-8?B?VzNCcExsMVd6WDVVd2VLTTlvUGJpOHFNcDBpMi95VVlLZVZMNkY3MVBDTXht?=
 =?utf-8?B?UWtvakN6ZHdKdkNZREtiS3UvaHhDSXU3SjZBK0hNc25kaG5qOGx1Y3hDTE9H?=
 =?utf-8?B?R2ZxQWJ6blU4bWQwdzdhQzRFWlNBczNsVUQ4djhlZ0F5MlBRR3hXNkpLb1Vk?=
 =?utf-8?B?cmdYOHVIeVFDcGZlei8wenVKbmhQVlJ0dUJrbTFTbEY0WnZ3UVozVnVSOWdO?=
 =?utf-8?B?anpTSVdEYVFrZWpkOHFjd0c1bEhIc2N2NmdIY004YmlYMTlpZEhjRXJlMDZP?=
 =?utf-8?B?UFZBRFlqK3lKeWZQd1VOMElIMy9SeGFxQ3FTek83S2dnWkFJM3A5TWRHVHBF?=
 =?utf-8?B?ZnNDWVV1QlR5MjVrLzhaUm9YbTcyL05IRTFOL2lmUXRIdnd4LzhIWVk3OTh0?=
 =?utf-8?B?ZEpoWUZ6WDFNeFBHcFpHQXFKZmNWbmVCdEg3U0l6RXp3WUtCVm5xVS9TcDhn?=
 =?utf-8?B?TlNQeGN0RDNNOWNvZTFYcGpUci9XRk1lcDZWS2xPWkk5cWJva0hqOGFkNU1o?=
 =?utf-8?B?NDRLdW5jYnpnNTZDaW5aYVhHSWZLeEJRbW4vd0JFTkt3Q2swdEVZMGJYUEYw?=
 =?utf-8?B?UnlVd1M3dDJOV2cxcE1mbWxzODJKNjhLSUl2QUd6UnRkNHJSOGpQRXZ1OU5R?=
 =?utf-8?B?aGowMVdQWmJDRGxvZEVxS0d0bkxvKy8wWjVGL1VOaEtDQ1R5WFdvQ2RNam8v?=
 =?utf-8?B?dlRscEFlUFRaZW5nazYyZDNhRStUNU5RM0x6UllWd0FwWUF4VjJySm1CdnZh?=
 =?utf-8?B?N1lySTlzVnBTaFBVRlRUd3hDOWFBVWpsektDRjd1U0FPbTh2azFMNXh2ZnNS?=
 =?utf-8?Q?EEHdBp90qBTp6AOQOAiiwBact32jILCOaYRPCfDiCnNJR?=
X-MS-Exchange-AntiSpam-MessageData-1: J2SumlKH7p1hHw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cead9432-3033-49ff-06a8-08de5a42a019
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 05:45:33.5309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O72Zko7OKdHRt546q+xWXejw8N3ArTX9Sl/TF+q1wPaKBacMicjhCkiyKR1i2sjkBPLKmYgikRCJthjEmLt1eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5962
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10834-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zulipchat.com:url]
X-Rspamd-Queue-Id: E8FFD70897
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 8:06 PM JST, Jesung Yang wrote:
> On Thu Jan 22, 2026 at 6:23 PM KST, Eliot Courtney wrote:
>> On Wed Jan 21, 2026 at 9:01 AM JST, Jesung Yang wrote:
>>> I still think the versioning infrastructure is a prerequisite as we're
>>> using the `sysroot_src` field here.
>>>
>>> If we specify `sysroot_src` without `crate_attrs =3D ["no_std"]`,
>>> rust-analyzer treats `std` as a dependency for all local crates by
>>> default. Consequently, any rust-analyzer version lacking `crate_attrs`
>>> support (which silently ignores `crate_attrs =3D ["no_std"]`) would
>>> incorrectly assume an implicit `std` dependency for all kernel modules.
>>> Having the versioning infrastructure first allows us to handle this
>>> transition without breaking the user experience for those on older
>>> toolchains.
>> Yeah, I agree that specifying sysroot_src by itself includes std and tha=
t
>> is potentially an issue.
>>
>> But, currently due to issues like the relative #[path] include, the
>> sysroot crates aren't really processable very well by rust-analyzer
>> causing a lot of spurious errors and unresolved symbols, which make
>> using the LSP experience pretty bad IMO. OTOH, while the sysroot_src
>> approach does include std, it at least makes it usable. Personally I
>> find it more useful this way, but I can see the argument for both sides.
>
> So the problem here is that the versioning infrastructure effectively
> restricts the use of `sysroot_src` for older rust-analyzer versions
> that do not support `crate_attrs`, which leads to yet another bad
> experience. Hmm... I would like to hear others' thoughts on this
> trade-off, since I don't have a perfect solution at the moment.

I think it's possible to get it to work (at least better - not sure if
it fully fixes all issues) in RA 1.78.0 without specifying sysroot_src
if we add include_dirs to allow the relative #[path] references to be
resolved.

> On a separate note: I actually have a previous effort covering
> `sysroot_src` and `crate_attrs` [2] that I'd like to land first. It
> covers almost the same ground as your 6th patch (minus the
> `sysroot_project` use). Since I wrote the `crate-attrs` code in
> rust-analyzer itself specifically to improve its usability in the
> kernel, I'm hoping to finish the full story on the kernel side. Would
> you be open to that?

Yes, of course, please feel free to land whatever you want. I'm sorry I
didn't notice this, I think I only searched for rust[-_]analyzer in the
subject line when I was checking the existing state. I'm still working
out my workflow and how to avoid missing things like this, so I
appreciate your patience. If there's anything useful from my patch
series I can send a v2 if you would like, or I can rebase it on top of
some other patch series, or not.

Thanks~

>
> Thanks!
>
> [1] https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/5=
61668361
> [2] https://lore.kernel.org/rust-for-linux/20260101-ra-fix-primitive-v1-1=
-def809357b4e@gmail.com/
>
> Best regards,
> Jesung


