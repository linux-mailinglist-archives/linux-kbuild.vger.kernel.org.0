Return-Path: <linux-kbuild+bounces-10798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OhvBJHucWlKZwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10798-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 10:32:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B602164946
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 10:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 81286607E91
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 09:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99B7378D64;
	Thu, 22 Jan 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NnYcPy3O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013046.outbound.protection.outlook.com [40.93.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FBC346760;
	Thu, 22 Jan 2026 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073881; cv=fail; b=Ump7DWp3gX21EGMhk1uvCFtl3GyZ6ZZ7WSbGGvRPxC3ZYw4HCdx1nPj9vDAJD4ufN6AYn8hd/bedxl70zPBTU6gy2zVWLPoyzZi0g5gCIzNeQpM07HjxLxwU8IukIXGz3Op4Z5OrueQIHiSrhMJVRQ16k7D96m67rtmjiYUPc0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073881; c=relaxed/simple;
	bh=Ei66llm6U8/+2o4OJx+6hPxCduoMx2XVHszyZkTh7Xw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NIlmMWOsPFs58cHM+JcO15+lv/CrinT2BpI7AXOpk8c4lFpNDyeNN5jjViYzC4Bwt7HWwARBW0TmdX8SVgLB4vjxZAudIwRT92oI4Tg74n6Y//BZc62bRnlPR+qr0nFLWUwjCZx5iJMtevAjIeY13ke0xLBBoovkoHBZy8uIeKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NnYcPy3O; arc=fail smtp.client-ip=40.93.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWtQUGz+NboM8+B3/YgLXO6g06jvykNCN1HsM6eRl2Vnf3CHJBNfRZ01RbLzrq+vIuktMZf9GxhCgySr6xk84mKMN7GoRPRw29T8LnEpzhI2nX2Zgw8+HJmBuzGQ/iL30jA+i/6Rdc1mHTSbChC5kHaYykfTnH+ajBzOAVqXLsd2RgGFZMA0wvjNeuI1+QM9QY1DLKrXKp9chABtnRWJDbPnyZTAJOYIZXZJfdy/mUMwnUpn94vAEQ68az4D3qrM4VKzHGheZWe/j/WQHnLmjZ/baDR6++0PCF2tq86zgQjpJGHjNUdR+NBGfeVm/OAixqFIBYDcQg/L4YGH0ng/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ei66llm6U8/+2o4OJx+6hPxCduoMx2XVHszyZkTh7Xw=;
 b=wVx2fmPw4nymsySasb9mB2wGobs5WwD+3j9XddVdU3c5OhWyp0TPqtDMbcWwFALbbH2NphADBf88sJMUv67IJZy/nbd7ilHFPOvHwijsTSEQdIsyGHv9tuf8JGeveyOBrV3Wv3N0nDnbJb+9NcqSufjCDw0Q+uRIVHzxJ9mzWd0ClS6eN33bVxdwIRLqeN2CGw+ygvOXgk5SYED5KgzdYZGApf77u8FhOWUrjdOUjNR3TO9FHOj4Bld3UNsNniJTDKcAEkqEfs5fWqqtEo/9O2lmkDbUy1gjGh1bN2reB1DOVa84DE6Pus/h2p8BL5EX0nyWrBbofOFVyjQQY3ipRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ei66llm6U8/+2o4OJx+6hPxCduoMx2XVHszyZkTh7Xw=;
 b=NnYcPy3OLUQY0+QJyZHRolR1VxkfPvMU8l5SPmmFmmVTTsCDq+kIb6MmkMhUp5lS/B41n0tZY51ox80vEIiC0UzSqis7Wf39pq+DhrrtPgscxQpR+K0BgRe8Mf1CuC91vZicdSY3CwIvFXPSVJsUVsdhOoR+G6DFrc6gD08doE2Ff3WwY6FDVBle754W8spoQ3jLQaWbN0tkT0Kxn+XAFoDbsBIkQmLfQU4CTZ6xtz9CIJ5ACurQ+ABjMeKG2m78CnCen2Ehv4zvqFV2DHY8QGFqA57C6b+mL0ilhrD8g8dSojcv/JZjyzdNcNPo5iwG5/B/XUl+gT8pXH6mtHzrng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN1PR12MB2368.namprd12.prod.outlook.com (2603:10b6:802:32::23)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 09:24:33 +0000
Received: from SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::44c1:60e2:21ff:46c]) by SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::44c1:60e2:21ff:46c%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 09:24:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 18:23:53 +0900
Message-Id: <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
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
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
 <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
 <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com>
In-Reply-To: <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com>
X-ClientProxiedBy: TY4P301CA0125.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2368:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 1461922e-1dd2-4a1f-6471-08de59980007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVJGTkhta0J5VTM5K2JTT3lzNnBmZkNvWVRlRkVLLzlaVFlvZUVrdGdEVkV0?=
 =?utf-8?B?ZC9rTjB0eFM3MzFrZXBxRGdjekkxMUZmWUNWUEZ2S0hZUlVxTlB5ZGxKNEdO?=
 =?utf-8?B?dVljR2ZvakpvclN1UUpEaHl3SmRwdmsydi9seGF6QWVsNFNLQldaRGlSWDBK?=
 =?utf-8?B?SVZCdDFQejhhYkgvUGh6SitjN05QR3RGZm4xd0RWV3FVRE44WVc3bGhjTUhI?=
 =?utf-8?B?enFORXV0c2laakk3bEtGei9hTytmc2hjb1VqQU4ydzFKb3NCTzloamlPUmpr?=
 =?utf-8?B?RTlnSFVsK0dQY3BkaDBhaWoxSFpLQnIwM24wQlFnWGwxZkwyejgrSVRoaG9l?=
 =?utf-8?B?Zis5RWE0Nm42WjZVMjRldFJyWW5VckQ2cjVsRkJFcUVkSFN4bzlGV0xDTmwv?=
 =?utf-8?B?bG5qU3IrYkNOK3p5UWF3aExTeUZJSWlVTEhGbjYrVzJKS0s0VFNKT3JWR2x2?=
 =?utf-8?B?VG16dXFkVEcrZXZKajhZYnp3ME9KWFR2K3hxSUVLOWVRT09aVS9DN3dMSGhB?=
 =?utf-8?B?R2ZMTWcyQ2pIR0c2VFUxU2crRHdHRUt1SkhhRElpdFZFeFhmc1B6bXk2Smx2?=
 =?utf-8?B?dGxwbzVHOGtUbHlQaU1LSzR2Ykp2WGphcXBocEZPVGs1SVB2dUtaQzNKeFE5?=
 =?utf-8?B?WU0vdVRnekdWQ0dLcHBUc3V4VCtnR0RYTmxLVXA3STFrblFEZjYwbVlZeGJO?=
 =?utf-8?B?T0c0ME9kVlVPeVNCK2lhVm40NGpzRVZmOXB3U1RiNldEbkxVQTNzVVNKSnBi?=
 =?utf-8?B?anBXbzA1T3dqSlFVVGcrZ0l6RkZPRHNESDJaL1QwL2Nid3RxdS9IQnBpVTNU?=
 =?utf-8?B?emRPSzlFbStSdGR3T2gvWURaVHFZNmRSSTY5SzVqOCs1cDVvYTVrUnAzRm53?=
 =?utf-8?B?d1Z1djlDUFZwS2pWNnpLdnB3Ukdvbyt2d1lKanhBYVdEK2g2bmppcmJjc3hZ?=
 =?utf-8?B?TGJ2c2JYek9hcXROd0dMMldhcDltcTBpNitycFVvbThqUUxsY2VSRlZOT0VU?=
 =?utf-8?B?R3NmQUk2RlM4M1B1ZnB6Rmh3ZWd3V3B4OUxxTWVsbDRRN2FJRHUyZHhZTXFR?=
 =?utf-8?B?ME1NaW5KRVNQTTBEQnl4SHdIMXhaZDF6M3BndnBiWEUvV05UODRZRXFBWWoz?=
 =?utf-8?B?akhFT016N1htWTBLdWdyU1NKZFJXRjJiQWpiYnB1QXlVTXBrUkhkUlFRdk41?=
 =?utf-8?B?ZkhQenZVMUt3bEFLRVAzYWJTYVB6emptZ2VONlFNRGtWNCtteGVWaVh2Ymd4?=
 =?utf-8?B?aGRwemI0ejRKS0laenA4V1k0K2w5NTBQVGF4LzNZSlpqY09iSXNNdERhNmVS?=
 =?utf-8?B?ZUFZODhPNWh5YjZxVDg3STdwRzgwekRQRiswL2FiVTlkRkQ4OW9zQ2NQWC9X?=
 =?utf-8?B?b2NOak5PR0hSN3VPc1BlNjk3cnh4YlNwM1BMdk1KMG1vRkRJalR0R0dzU1M4?=
 =?utf-8?B?MWZCaHk1eWdGZFdEVjJjczhKbS9BTFU2UXE2MCtTSEFGSzZmTzlSYmllS3hV?=
 =?utf-8?B?U01vMlQyNjlpeThYaGE5ajdsd2I1Z3JaZTBxNnhkc1dvLzIvUnZtcTRaN2lt?=
 =?utf-8?B?RndWN0JCNjJlYk9wenc0M3pocDFLLzBKcUFBVE5nYVB6MlRRRFB2bm9ENGlu?=
 =?utf-8?B?MWlVVmJaZ2hzT1FUU3NDSnZCSlhPRnVVTndXNnpRNDdIR2FtS2l3dGdhWk50?=
 =?utf-8?B?Nk5ZbktmVGxmcG9yYkJobHdsVDdvM0M1dTJmNEQxNURUNkJpRVJPNi96emJP?=
 =?utf-8?B?UitEa1ExY2lOR1ZOYk5pRFIxZ1lGK1pITjBHZ2RrRTlqdzFNM0VwbzFGbkVV?=
 =?utf-8?B?N05MRElLQlRTUTR4YVNSOFlWWmZSc204RDhoRWZPU3JDdGNXSHZjNHd0eWxp?=
 =?utf-8?B?NkNNYTFLVTJ1bmVqcnV4dUUvelhQOEo4ZXRVZXRoWFQyRjJvVjZsdGpacWVw?=
 =?utf-8?B?TjV3YzhGL1lqRzdTTk42THZNcDEzblFudFUra2x0MXI2NGZVRVVzelloaWxS?=
 =?utf-8?B?d3ZHTWhRODJyNVRHNTVUZWc4VDM5alY2MkFjaWMxcktwU0pndVJFRkpERmta?=
 =?utf-8?B?MEtrMTcweVk5dVEwbFZLWUhKYVYxS1JVZDBRYXozWFphMkRzVDVRdThGYkts?=
 =?utf-8?Q?lC7Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2368.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnVOODFMTmYvVnRwT2VvSXMvcWJlNWcwNEh2dldLZ2RGUys1S1REZjBVcWRM?=
 =?utf-8?B?cGJkVlBPK1UrVUtUbDNqRVdYd1ROTXM1b0ErNVk1bStBeFR5VmV0bUkyd1k1?=
 =?utf-8?B?aTFNOW83Zjhrd1Q2UG5idnlXalB3THA5OVNEblBlY0xKYzZ0R1lYd2xrSkhn?=
 =?utf-8?B?dUZSNmZTRTJjbWFaVnhqVk95SzBSVGVBeEg0Tk5lQWVJU1IvY1JBZW9DLzJP?=
 =?utf-8?B?YllBVE45ZDdmMzJjaTVjWUJLeUVPTnN0VWp4SHIvcnd5YlZZVURPSlZxU2pX?=
 =?utf-8?B?WjNHaVNmTWxHdDAwMGhMN3ZMMXZrVXhHZW9uR0NzMjdweUZkcHRjVnBEbGpm?=
 =?utf-8?B?Q05pTmpOVEdKTTZmYlg5dGpobWtlc1ZkbVhwYUtaVVpHZ1pDRGc3Q1VxSi94?=
 =?utf-8?B?enB5RW9sd0YwRkZ4ZlJpSDRsRFFhZUJkZ3A1ZFJ4S0pNMTZDUFRrdCtwRjdC?=
 =?utf-8?B?YTNITWVuckZoaTUyaDdId29VZjRxdGxLbXkzR21xK2dKWkNYRlJlVXZMSG5Y?=
 =?utf-8?B?dUtGZ1J0cHJha3hIajZkOVFGQTlyQmRPN01ZdkVHeHZBN2ZaaGJhT2FkTnZL?=
 =?utf-8?B?YTlTNS9sTW9pZUl2MURESnZFZCt0czFVMVgwamRJOXRPYlBVM3dQT2Rna2Jk?=
 =?utf-8?B?N1NwK3N2N2x3WXVVczVjRnFUdHNwNzBaUDJqTDVWT2Nia3gyL21UOS9PSnIv?=
 =?utf-8?B?bVBVbFNOaUYzQ0lNbDh3Y1BRZmdRL0UrbVNOWFJTUFRkMmhxUHJ5R0d3R1Fx?=
 =?utf-8?B?ZDEwTXEycXc2UXlUbjc3bjVvQkQvY2dEMW42cVRrQXM0dERLWE5GTVNBOVhj?=
 =?utf-8?B?UmZQNzRtN2lrekxvN3JyRFF4alhkUzExMnhCQXhESDdZZHFrNHdJWWFVUStD?=
 =?utf-8?B?K0RzYzB6WjE3SzVKT3F0Q1JibklLT2NEam9YN3ZRcDNRYnAvck5EUGVPbkIz?=
 =?utf-8?B?UlFJOHZ0RHc0R1dlNHR4MVR2VmdXRGQ0dzM3dmR5a0JHdy9iWmltUzQ2RUFy?=
 =?utf-8?B?dVdNeERwTHVXOVIxYi9CRTljTnFGcUFCTmhCYlhlb1l1dzRQV0FPNHFBeEJ2?=
 =?utf-8?B?VFpFaGtBYi9GK0tBL0Z6aXIvOGUwN3NBemkxd2dmYzdZUE5KTE1xSGhHaElm?=
 =?utf-8?B?TTBIYVJTcG44WkxvaTdEOTVZbUJrdVF6MFk0R3Q0dUN1a0llRmtHRk84eXM3?=
 =?utf-8?B?V20rV0xnZkNWaHVtZnRiQlErNktVMS9jeW1uS0IxN1BQb3BSRW5GNDFscGZm?=
 =?utf-8?B?Nm9ia0ZyME8yWThIODArdUxnekkraXFHd29hSzZWT3h3eFJ1d2MvVFZLUjN3?=
 =?utf-8?B?eWpxRWpJMVdXclpKbmhrRExpbUZHaXdEQ2x5Y0VUWVBuRUVNZDgxWjVvamRB?=
 =?utf-8?B?UThOY1N2R0VxZmp3T3VVdUNubzBqdCsrdXB4dFh5ZjZ5a3hwSzhWMGgyNjR6?=
 =?utf-8?B?T0ZBZmFWMGhqTUF6ZzN0WFkydFlXVDlQV005b0J2aHFHZExQVk9EWFBVVmFO?=
 =?utf-8?B?THkxNFJxQUwwWDBkR1h1VkFraVB4dXB1SEc0OTlEWVJsWmpKSnZNazUweWQ5?=
 =?utf-8?B?S0MxQ3kwRE9YQitqU3FHcDhWZENtTUVXN203TEJzZFVwc2VhMnFpaVRVV2NP?=
 =?utf-8?B?eFBtTWtOYnFVYmgyelZ1bHRpRFJCbzYxcXR0QUlMNEc1c0tRQTVSaXpRZHpR?=
 =?utf-8?B?ZjRIUDlXVENpM3ZqMVBSbW9aSGc1Z3diNlFOOEJpZDlieWN4aGtsYjh3Skg4?=
 =?utf-8?B?M0hIYTZhU1ZROENqNVQvblVJd3pZZnJxdVNpeWRVbXBJQVcxdlp6TXFZUG9j?=
 =?utf-8?B?Rk9rTzUrMGtUWEhFOXM1dWVJdnQxaVFpRysvYmtSemNGR1luWmxuMjR0cjBP?=
 =?utf-8?B?NktIVWFOckhTL3pHdTBzT2hhQXRpTWIrcFlQMCtzMjJWYmszajRZU3JFVkN3?=
 =?utf-8?B?Q0hWWXQxbGRFNTN5Q0EycmxkWW5TSWdRbWJqcnhaeHJTYjdXd0ovWEdsb3Zk?=
 =?utf-8?B?bWtvWU1FcWZnaTlFMVhERjhsTnVtTjQ4NUVWQ2pydWJLVUlQSW5mbnhibHdo?=
 =?utf-8?B?c21KMjEwc0VHOWZBaUZiOWhQQmEyUEpkZ3lBUEIvRXltT0U2RzFkMjBHa05K?=
 =?utf-8?B?dUhZcEx1VFBORkIvZWhDT2tCTFpvTUc5K2ovWllZTkIwM1I3cnFYeXFhYWE3?=
 =?utf-8?B?dUswNmw0VjBFN2ZjY0cyS01sM05XOUJhUFlnVEZJVjRuY2c5cXU3VVBTek9m?=
 =?utf-8?B?YmdCelEwcEI2MUZtTkpGMXErSW55bUExN3B4WHF2bU9PTWlkc2Q3dEFpUFFZ?=
 =?utf-8?B?dDRYQkQ3aWNCMzM3MEUyS3h6U3dIN2NXUmR2OHRIWUYzMXVMWTVDKzZ3MGlh?=
 =?utf-8?Q?iJQ2EQ7d8lXhNx3ID2Tdqok8g9AmUxo3Bl+WqC6eT2vzY?=
X-MS-Exchange-AntiSpam-MessageData-1: /eHlGmPQpC0N3A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1461922e-1dd2-4a1f-6471-08de59980007
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:24:32.7567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nC6/gR+sCU8yUGlaezBIINZ35e8lRaSl8qaE3WWwBSOpBVzZZeGUn4BVma2lITobj7iXt1JZu9mR0vqEKVwJPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10798-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[nvidia.com,reject];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: B602164946
X-Rspamd-Action: no action

On Wed Jan 21, 2026 at 9:01 AM JST, Jesung Yang wrote:
> I still think the versioning infrastructure is a prerequisite as we're
> using the `sysroot_src` field here.
>
> If we specify `sysroot_src` without `crate_attrs =3D ["no_std"]`,
> rust-analyzer treats `std` as a dependency for all local crates by
> default. Consequently, any rust-analyzer version lacking `crate_attrs`
> support (which silently ignores `crate_attrs =3D ["no_std"]`) would
> incorrectly assume an implicit `std` dependency for all kernel modules.
> Having the versioning infrastructure first allows us to handle this
> transition without breaking the user experience for those on older
> toolchains.
Yeah, I agree that specifying sysroot_src by itself includes std and that
is potentially an issue.

But, currently due to issues like the relative #[path] include, the
sysroot crates aren't really processable very well by rust-analyzer
causing a lot of spurious errors and unresolved symbols, which make
using the LSP experience pretty bad IMO. OTOH, while the sysroot_src
approach does include std, it at least makes it usable. Personally I
find it more useful this way, but I can see the argument for both sides.

Tangential, but I'm not sure why the drivers don't specify no_std
themselves - then we wouldn't have to worry about this IIUC.

