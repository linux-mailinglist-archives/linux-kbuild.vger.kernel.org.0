Return-Path: <linux-kbuild+bounces-11295-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC4xGzU1jmnQAwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11295-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 21:16:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C34D7130E5B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 21:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 980F2303EFBD
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 20:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061EE25A2C9;
	Thu, 12 Feb 2026 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SfvC5iZb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4E33EC;
	Thu, 12 Feb 2026 20:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770927408; cv=fail; b=hosUsu/c1RN5RKa5MZwohdTznK6FYxfGid8BXWm7rqHr+Bz4uZrbItZHQY3RTvWkqsHF1LtLnaajM3hw7k2Vf1xav6Kk+sUw8aASchCTjDVBuXuF/+M55tKVsxslQJZ4dqf3R4/bAGNK/tWF8YTe/I6vcsmQUv6WD+cUY6AbI4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770927408; c=relaxed/simple;
	bh=BFsQ0YTE/QBT5N5GI17yLz0ni1IZig8XMErpczDhquk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Az1xCGCsV8SnOrkSaF2r7JW4wAYGrprhtuli3d+W9zo9JJF74lLm8ZL9PbH1Wb4ut1tVf/1wwBzMfUELc4e3WHW/9glBwMlsABIQwBk71P30bB6J89CrvyEvB5lp2C63dL2elj/IA2DtCLvD73L9MmecoTgwf2uteaOe6ynIq4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SfvC5iZb; arc=fail smtp.client-ip=52.101.52.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjxBcHrQ7rsDAEIlxgi5eIFfhguIMzP38T2bn8N2T4rAGHzyeBsFx4JUwOy0Hk7cJCTU/5Xnt1SMt1CZn2osC9we8wAC43JFJ1z7ldzovGoZCyjho0vW01tggXZ0cXI+e+6oq8VbOVMMN1Ue6C/9+NONvtpHYOd9DuFN/3SggqFtdKUDBPvaiE/VnncmPZ9jYC5RUWVZls4MzLQN0NkJWwyLEbOwYO3DFVSTv3dBvxakjrwdyH6J2h6MPGlM7WwJ8ImdITX5E9AegEhgf719DgO8lCCOxFNJvLXDM7kmgOZvnIfcGg8NWMCtIOw3TWyBaSLTBxf3wd2LCxe0FRnwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ai1pu/Eqb+d5dU2b/6A1Tju+GxDEqyAYiLiQI67hzw=;
 b=dzVVNZPLgqYAyip5lMkuAwoyGKENBfCi0xgI4irSdxo4NSqK5BBIaQuTSCGFFblb1Ha68BhM337VvV+udswo4czaAnaRI5yVrzQ6jieinCvNwWQQtCW3b/xFhzcNS2rE8SEfrEvZKsq4fsBRCUdWqs/xpv23ux4L6Ho63amKhVUYAakISblo8bDP/owFAXAQ/z/yaj2bkHe4UI9ZHOoaag1KOQzHXUtVcR293xMDKuLrgj/+b6wpHB7py6OQaI0OkUlqgqik499K2ElDKxOSuisrV9MyzjsiN26PPKLw4cS9gleNpTG79tgNG4SJiFkh5GROlmQ+leHYIwZn/EBSQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ai1pu/Eqb+d5dU2b/6A1Tju+GxDEqyAYiLiQI67hzw=;
 b=SfvC5iZbC595CQYOY8TBUWbb9kjLmOoWALk8sd/ZDY0KAYiqFotOujG7dBd6kL0xquoqhJx8bJD+ZeLt0SqPhBJ1rUODOcZVWUP3zVWrio2oe7uyFuZzDgYeRoD87r+iVKYyLqqW4ezUAtBecXbYvdOYG6vO8xCcJigAwVZuz+NgdpfwL8jKh/v+ZPPxCsr7Vq/+W7oi+YQrwyJ/OATNAvJo8fV+UpStm7w8ZjjgqN7zLiOjL++ciS4seAMumlDfAKFW0/mvaNvjpswoYjTwYrPVUtnR34Tt5aK1DBDOEcX4e+HPWT3dYy6iK+C+UiBM4oyuGLTPK7ororS/AgbpXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by DS5PPFBB8C78349.namprd12.prod.outlook.com (2603:10b6:f:fc00::660) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 20:16:41 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 20:16:39 +0000
Date: Thu, 12 Feb 2026 15:16:37 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
Message-ID: <aY41JdJ3_Nq9n_JY@yury>
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org>
 <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org>
 <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net>
 <aYgmENPRTdD4wCVF@yury>
 <CANiq72k4D0ZPDzBCHY7xq=qOmERHk3e7P8CcKtVHjjjOQhJ+2w@mail.gmail.com>
 <aYj7J0yTJtYlxLt4@yury>
 <CANiq72kkLe-to9hO9+Q6kk-xpfAUZTCEBug05USruPymE4GkeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kkLe-to9hO9+Q6kk-xpfAUZTCEBug05USruPymE4GkeA@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0965.namprd03.prod.outlook.com
 (2603:10b6:408:109::10) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|DS5PPFBB8C78349:EE_
X-MS-Office365-Filtering-Correlation-Id: 197b9b67-ddbf-477d-7f69-08de6a73a162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SU1WZHdVRTJCWnM0czhVR3ZJUmQ5RkZaclN3a3EySmFsc1Z4MzhyL1hmYkVa?=
 =?utf-8?B?ckQrU2pmbHpRaWVEYzlhcmFjY1RUMGNLT1E1NGxSSHpQay9YOWpmTjdBdlJx?=
 =?utf-8?B?V2RnSEtvalNGRXQwelJTZWJaNVdmRnErVUFVN1BuZnFJVFB2cjdTNjZod2lh?=
 =?utf-8?B?c2cxbVN4aEpaMGFFWGlhcWRVcnAyMjdzQWowazFRWkdIejl4VW01eFFWUHRN?=
 =?utf-8?B?ZzBzd1g5dEx2OVBxSkZlNXFiRTNmUm9GNjA3eUF4R2w4VTd4K1BFSTZWS0I4?=
 =?utf-8?B?c2RNVlYveVBiWnp0L1ZJT0pnZUtUWkF6a3FGS2Q3aC84cDFycDB5VkZMWnBE?=
 =?utf-8?B?KzkwNndmRjIyelBhUTFIRmFIdkJzRjlLbEx0cFZmVzJ4YkpFMll2L0RHNGJh?=
 =?utf-8?B?Rlc2S3V3SXBiTzgxcjViWmdyZzlQR1NuM2JYOTZBeXoxeXVxcXpOem9mdzlm?=
 =?utf-8?B?UzNpVjErdE1tdnRONmRZdTFDL2EwVWlpMUpNckJsZkdYWnBLSzZzNkRCM2ts?=
 =?utf-8?B?ZVY2S2ZkaUlMNXZoK3dYclo2WTRZTGpkNEl1cWxJY0g3aVBJVWQ3bUg4bDQy?=
 =?utf-8?B?TzVldGw5R0VtUjdxSDVIYmJtc1BxOThuaUFIL2c3dXFBc0VJQnYxM3k0TTBS?=
 =?utf-8?B?bk1Kc1UwNU82bUVtRUt1dCtjZGM3TlVXMVRWRWV6dHJERTNHWXNKNXVpS09X?=
 =?utf-8?B?bjkwdHpWMFFqZEJpY3Y2VTRqZVFmNTk5L3BuVDY1VmRhaU9YeFZmZFg5dTBx?=
 =?utf-8?B?NUwvUlk4bkdRMW1mRHk1V0YrTWcvSXEzaXQ0bFB4YU53SzBEZVVPdzhmVVZE?=
 =?utf-8?B?enIyRy9ZVFYvTkdUZWZyT1ZaU1RqWUQ2aEt2bjY3Qk0yY3BValpNMjlVNnRq?=
 =?utf-8?B?OG9PaG13dE1kNlBoRHlvYTNHdUNpcDZWRERkYTBkK0Z2NUFKTVdBL3A3OUpX?=
 =?utf-8?B?U1drWGQ5bkluWkUveUE5aWlkK3hUaGVGRE5FMXZaWlh3UHNYR3lMT0FTeUJU?=
 =?utf-8?B?azViR1VKQUNpQVkrbTN0NGtFeTdPZGxmTzRFVy85Rzd0d2dHS1BIYzdiSDdi?=
 =?utf-8?B?SUFhaXV2WGdWbGkyQ1JNVVg1cm03bEJJd29CUGF0dGVyU0NldkwwNmNOREt6?=
 =?utf-8?B?WWhUUmJMUWREZ09WUllwVHJ5Uy9ud3luTkplL0hlazlYWHl4bUZUSUlMT3Fl?=
 =?utf-8?B?cm96WFFzUlc0S1Brb1ZqenJGL1hBQk9yN2lieXFncXhQQlBPMWxDaThtRTVj?=
 =?utf-8?B?cG80TXZEOTZTaWcwSEZnaW4raFJoQ2pOeHBhOEdDcml6Wm5GWE5FaDdvczlD?=
 =?utf-8?B?NERMNlo3b3g4Tlh5QmZZeGVVVDU0VTdsRjdOQXJlWnBOcGhHRWRKclJ4Y1hx?=
 =?utf-8?B?cVlqTURHTUtDQ1NmVmdib25CeFYwTVFPV3lOYmRwZ1BlMVgzT2JHVGhOcUp4?=
 =?utf-8?B?cDR6TE84cFVrdHREWTJmSDUwRm9TZmUxWkxEOUtmVmE4WVZjQ1NqWnNJejRv?=
 =?utf-8?B?VFBVWk5STTYyY2o2ZGpJcXFDYjMxV3FwMytTOVJoK1plU3lOUysyV2NVdkxr?=
 =?utf-8?B?QUxvMU9GMEF2WkhJQmlhT084THRoTGRGMDlUemNjRGxJYkdNMUJWNWdPWXVl?=
 =?utf-8?B?NnZ3a2VqVVFNKzdkcDQ2UXhab2ora3FsMC80WW9LcTh5L1o3QVRUTmRxdE5U?=
 =?utf-8?B?R1lpZlVjTENiVXRWTm1TRjZpb2NhN29VdEhHbUd3SEdSWUsvczI5YjgwbCtJ?=
 =?utf-8?B?bW1DQkp4bXpZM0prRlN2LzdlR3pDSThwc1dpS09qaU8xYzdjb0IvdmlueG9J?=
 =?utf-8?B?SzAxOFQwOHR0VEN3ellMOHNoOWtUVEl3dWh2bXFhZktJUSszd2dIdnRsV2s3?=
 =?utf-8?B?WE9tU3RaTjhNQzRmZlVxQ3FIMWozbjU1TDN0RmN2ZnU3bXZQYXpFZENxSk1S?=
 =?utf-8?B?V3BEY0drV2VCYk4xT2YvVnFGYm53Nzh6VUN6TVNRYUpWNm54OGRoMENWUk0z?=
 =?utf-8?B?ZGt1TFNnZUM3OEo4K3ZOL1FRN1VYUXRiOFJPWDBVcDZQUktyc0l5K3BIYWNW?=
 =?utf-8?B?MkR2Ky9uaERWcUUwbjZ4NTlNTzFwdGlKMC9FQnVrYXVHNFlZd3JpRVBSTnU4?=
 =?utf-8?Q?FRik=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0dsb21icmI5eldwenJPaWhhdHc5MU5lZGR0YlVrRXlJSXJueG11NkRuNzF3?=
 =?utf-8?B?c05qajkvNWtmbVVDZWZ2dmk0Z1oxT1JoelNlbVdJdkF1RndnSkNQc1dNcUlQ?=
 =?utf-8?B?TkJaL2VUdzY1SUZsWkhBNmNHMWZXcDhCcHhITVlKVmNYcTlBQWdnTTBTNm1R?=
 =?utf-8?B?djJObU1wNEFUSUh3Qmd5VlVtV2RvM1VwemRrR1dmQitSckFzdnZWdmFpYS9n?=
 =?utf-8?B?UU03RUx5dEdYRG1BRTZjWGptTDRmL1hLZDZ3ZW16Vkc4N2J0Tkt0dnZnaFN0?=
 =?utf-8?B?Yi9FTmppdmZTMmRpek41Q0NLSEhFS0NBa2NwSDhuaGhtSmluRk01MnVPV0NV?=
 =?utf-8?B?TkI3MStWTDkwN3ArWUtOZDNyMG1yQzdxWnZDcWphYW50Tld2WWxvd3ZodE9N?=
 =?utf-8?B?WVcvV2x4eHlwazBzWFdJUXRsb3h4SXp4ZFQxV2J4OFI0dUlFRGtyZFhweE9n?=
 =?utf-8?B?TTZrbGFObWU5VWVmWEVRSjU1ODRpc0k3YXVTV0x4bW1EK1gyUUVrWXQwem1G?=
 =?utf-8?B?a1pkN3RTWGJ4R2pneko2RURhc2lmMlhXbHBXNWNld0haZkl6aVdveEZTZ0ZP?=
 =?utf-8?B?WEdtdG9xQWh1WUFzQmwrejg2ckE4dGVLTUtORzIrVTF5aTJKSC9pY2w0RjJy?=
 =?utf-8?B?T3R6eUhMWVFLY2FDV3dHNldkWlZaMWx3NGg0QTRYdGJEa05LUDl0SmZPaldY?=
 =?utf-8?B?blhkMHRYU0NVM2M5N21QN0wrOG9XVTBkSmZMejJVTUI4dXRFQUs5SVh2alli?=
 =?utf-8?B?dE00WFJkV3NRa1VOMEpPbmdmY0crNTBYUXpCYTQzSEVCejRGQXRBNm5QT3FN?=
 =?utf-8?B?eTluck4vWGN0cjBTVjVSdmxMaEV1WHo5dHBKbnp4eXNpMHFDTk1HdG1oZzkz?=
 =?utf-8?B?cUV2SFlRdkxmazd6RFNrNUF6TGU1eTZkUkNFak9kWXNhT0hxdFZWRDlweU9V?=
 =?utf-8?B?OE4vaFl6RXRxOGs1ejFnZW8yVmN4NzJudHRiRUlsZ3hseEJTVU1NVUY3NXFS?=
 =?utf-8?B?N0lDeUVlNEN6NkEvcUkvTVdPcWhkRW9lL1dBV1JjV1RpUFBNUVJmR2JPOVNT?=
 =?utf-8?B?TG1pSXlLMjE5N3MyUHR3Qm1QdWx4c3pPblJKNkpYWG56WGpxVTBGa1pzeHdm?=
 =?utf-8?B?TmpaQ2RJSnBHd3ZwcVVQMVc5NWROclk3TzdnUlIrTDZPODlZTEIwcmNCck5C?=
 =?utf-8?B?K3BiL2VDM25PUldISFJLcVpkOGJrVFJiK3lTWlM3andBL1d6Tm84RHFkaXEr?=
 =?utf-8?B?NGw1Ny9uOFZhQTFCQVBBTlNKZHk0eVdZcU5nd0d1LzJBeGFBSGtNNUd4b2dR?=
 =?utf-8?B?aTFNUjRiUHhzQkIwRUg3Qk8yVVN0bm5Db0ZUcWN1ZkhCOXpuZ3Bob0lwSHBH?=
 =?utf-8?B?OXZtM3RhaUlKODVzcStsYzMrbXZXblZ6K0pMWFVTOGZ0WGhPVllvLzdGaDlz?=
 =?utf-8?B?M2RqMGllZ3pKR1R0NmJHb2tVNUtpY0hoazhDZGRWTDE4UEFBZFRWMDNNZTM1?=
 =?utf-8?B?cVhidjVReGc0WXdsd0NKYXpqWk9HSkFmNWxnMWhsTlBVRmVKaWdhV3pwN1FL?=
 =?utf-8?B?R0hFVWszQm12dFp1dXVwS0RXSFhkdVFWVWxocXdiU0NRNEh1OW5xaGdoYXZF?=
 =?utf-8?B?TC9lclNBc2ZSZUQwQ01RcUs5cnYzN2FyT01IUkRua3d2VlBKb0M1K2VhQ1B2?=
 =?utf-8?B?QVJ4U1RZVzV1OGQ2bERjR25TVUUvYkY3NkI4THFLYmVMdVJzdkJBaXducW8r?=
 =?utf-8?B?bURWYVhMN3lybTVjTzV4d0VDakpVaktFb1ZWYTdhL1VSVXhlRnBGOFVKMkNH?=
 =?utf-8?B?WUc5cFhHcGYzcDduUXFmUUFOVUFKcTJlY29wMzJ2TDM1bVZrdlBVOHJEOUdp?=
 =?utf-8?B?Nm0rQ3Njd05VeXE1bU9VbkdSRWlZbGN3K2ZIR1hTdksvbGRPRkkrcnE2VTBW?=
 =?utf-8?B?L3Y5aEFRcTRnczBuU2F3cWNZbVkyMXVMV0FuZStGZFdkNmZGUXBMYlZjRUlE?=
 =?utf-8?B?cFd2VkxjUE5HS3NRdnRZQ1BWSzlxWmxwVmRVLzFISXU5NGdZRkY5Ny84aE9k?=
 =?utf-8?B?ZklSbFRHUjRxVWtkb1lRQmJhUWFXeTcwM0N6a2VZcUZ2ZFZTVWp2VHExRVdk?=
 =?utf-8?B?bTRPbWJ0K0xiaGJOY0tMcW9URTR6K2FrUkZqaHl5M2FXamg4TVJtVjBKV2Rv?=
 =?utf-8?B?V1BIdXpTV2p1OEh6YW5BNHRDOWhWNUU2RmxkYSt3SmtkeTZTRWVxNzdFcW5G?=
 =?utf-8?B?WEk5Y3lHK3pzK1NLOWFxdUJQVXVyTXk1dHo1RzhJbEhPaTdnQ3dCb1JncTVV?=
 =?utf-8?B?eWhFbkZpTUJEa045V2k0NmViVGZpYzJNblFkRlY3Uk4rSzZrZWVSMVJrQkp1?=
 =?utf-8?Q?viXYXa6lDUuUMu02aEKtq8m0Zl4+2sfB/lW4c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197b9b67-ddbf-477d-7f69-08de6a73a162
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 20:16:39.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Dzh2vEAcVyrusjx7+rv1jKvGge3YyAxG1b/gwBhAh3aPUIJtRVxqbGOnihEfLQjCNIv6Sapmp7nDWT9fgeQHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBB8C78349
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11295-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:email]
X-Rspamd-Queue-Id: C34D7130E5B
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:44:19PM +0100, Miguel Ojeda wrote:
> On Sun, Feb 8, 2026 at 10:07 PM Yury Norov <ynorov@nvidia.com> wrote:
> >
> > Can you please keep more context? It would be easier to refer to an
> > example if I have it on hand.
> 
> The existing docs for `build_assert!` have a couple examples that may help:
> 
>   https://rust.docs.kernel.org/kernel/macro.build_assert.html
> 
> (Those are the kind of examples I would like to have in the module
> level docs, I think they help a lot to quickly see for what each one
> is used for, even if one may not know the exact Rust terminology
> etc.).
> 
> > I agree with ""Build-time check" here is a bit confusing", and the
> > following indeed looks like a compiler implementation discussion. So
> > I concluded that the difference between build_assert and const_assert
> > is not visible from programmer's POV. Please correct me if I'm wrong.
> 
> Gary has also nicely explained in detail the three Rust ones -- what I
> was suggesting is to take something like that and put it in a single
> explanation in the module docs, with the examples we have (or others).

Yes he did. Thanks to you and Gary for sorting things out. I'll walk
through the #2 of this series shortly, but overall it makes sense and
looks good.

I agree, would be great to wrap explanations up in the docs.

