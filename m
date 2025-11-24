Return-Path: <linux-kbuild+bounces-9827-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5026EC8267C
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 21:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F6243ACF8F
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 20:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF4321D58B;
	Mon, 24 Nov 2025 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mPzcYXgy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012065.outbound.protection.outlook.com [40.93.195.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193C4E571;
	Mon, 24 Nov 2025 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764015692; cv=fail; b=j/cEDb002YH/HwSE6TjTGmEYzqLivex1hi5aJx1W3eSGiOm7pUYoybMr9XAK9txAZuTTsfUGB02QvNtqyl0Ow11QuQ8Xe723Xua4epbKthY7YEyGx2BEyfltAi9Ss9DgLkHeCVekBbSWV4uhUVKJeaxIql8XId+11qymWsQT9TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764015692; c=relaxed/simple;
	bh=DdS4t/MHgWt32CWg61rE3RdohqdWrMiXhWwdDBv35rU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C7Xqtmh0F1PF8aE/EUL2kfTo6aDO2QoXmycjxyDmJH9fYKCFOpfNu7CF7DXhYbxG3sDzXabSDE5rK7WD+59UrvJVam3B1H6ZdchCMNt8MTuDiPg5yi731x9zL+6ZLrO/o7o9VKCDgzX16P3cLO79+lCDmoBXq6skXGvpU86Oz9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mPzcYXgy; arc=fail smtp.client-ip=40.93.195.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPiw17qoYnc74quziQMRx2xC9I/JoxH9Lerrk5/uQGhQCrTEaYz+FrHpc6UvSZjh5/EqIgRTozVsNaHXInFGsOBtwNywuyMUCru5JuabeGLOGbfUCEnNb2Eb3sVMThkasr53ci2+v5XaeZWf+x9nNLyA5zK/hnyB8TnZVxnFI1JpkLhonHlQw8A2GTl2GHxd2OR2ntuGWBobTe3q6CE4mOc4Icst+qhQwzAWit1pHylAkYaJFLN3XlKq3FJYR+E59QQPPFnfH01rsBPB1+eRWE2VHx7IYDDvAIOwwgtGGFb77FOeETf1HjDnHucDERgpdOvMB7iNgceabqQKMiZOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STCJ2KZFaaENswwS0zm8reULx7pBtI/yKz6oD6E/+ts=;
 b=bg6P7mzZB0az3o194xUHlaSOt/FKJGBCScjUgeZlfwS1HwxCxadV2D6d48CnPwUuWFy9l2nd0qdB6mN8hzuPYiRgiH/14sswKx1rarDowRE4Fbs0iu+slTZus5DPnjsfwu9UGYNPdW+V6Ilv+pf6WZ/HwJhqMSEr0j8sZ9ksuATwkAiY1U4RSCh5hFpeMdd6r97hEO3QQNhCMgZtpoVO0H7s53GzFu62VFxO2qeimEim5HHN1MFgLHVTmNvFypFR9B4OXQwPtHQPuRi/HkbAGUtAO6Jji8OOVks9LJZTAT2q93S6s78TmZtf+vuyPtNrGpmMH0wOyxPfRzSqxFcWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STCJ2KZFaaENswwS0zm8reULx7pBtI/yKz6oD6E/+ts=;
 b=mPzcYXgyANPCWdbYd0g2sm35ak+dOncs17hLA83xbBdmpXfdZRNhTIgDrUKiXJ251Gt1q2TYQ7LE4gDtQK7wrtNuziJ1H2u2z8+fXzqARFdq0/d77sWdb390225C58py9IEjrtsDzO3WosFNNfBeoK1IBO8w9Aa7r/VAb2GDj2lo0L13srKGJRXt7Pb7D0S2MA2SPQ3FCxEbMxnpULvS++vbb5I3reKP4S97oniu8q1M/vh+lfUfmsr1xJa8FWrFrYmh7y6f+k0pCxLlqJBr5pGGwZkcggcHC2rjaEkmMlR2iRxSL647gDhB7xhMgDZZ99lsbUxPCoqNmdh2iYeGMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 20:21:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 20:21:28 +0000
Message-ID: <390b8d02-310c-43c1-af7d-509fff23bfd0@nvidia.com>
Date: Mon, 24 Nov 2025 12:21:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20251110095025.1475896-1-ojeda@kernel.org>
 <20251110095025.1475896-10-ojeda@kernel.org>
 <98e549da-b7d5-45bc-8a9c-d05eb06a75e6@nvidia.com>
 <CANiq72mcQJnW-F+nb=Vseoa_amcwwhkC26N9BOs12MVfMVOdVA@mail.gmail.com>
 <27735776-7538-495c-b4b7-2ae8893d28d6@nvidia.com>
 <CANiq72nAJeGZKZUND8Cwmd=V5_rWAmA=KYUD-TZ6auV9qmCtvQ@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72nAJeGZKZUND8Cwmd=V5_rWAmA=KYUD-TZ6auV9qmCtvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a50258-04e3-4e2e-0324-08de2b970c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cW84a2R0dmhPZTVtUEM1MVg1R2RFRjhtVFZxbjRQcW5HVW1kcVE1djdVelhN?=
 =?utf-8?B?V2tZUTV2UWdZRVRySHdSbUw4VU5zLzJKczRjUDcvNjY3WjhNVjV0a05FNEs1?=
 =?utf-8?B?ZnBlSGltYzNHMXpjRTNjUGNUNkpNUjFPcGVjVC9NN3k2YlpqT0NFWFF0Ujgx?=
 =?utf-8?B?cDFwV1NqTG5oSE1JUkJSRXRBL3gwcWoza3plL2FiQkJJVkI4bDlDTFdGdTBw?=
 =?utf-8?B?eW52RCt0cFVWT1RhRkRkYndtSktLdGdGQktySDY5SU5zbmovSFQ3Mmlxa3o0?=
 =?utf-8?B?ckQvQkJvbFRtOHFsdlBNOEZMVmlidVZ2UUVXbHJzdmVhZm5td1UrZzVKbjUr?=
 =?utf-8?B?U2JtYk9qODJaZldDOW1CN2I5Z2JwY1FxUVk0RG5jdDdwU0lEN2pTMW5xK21v?=
 =?utf-8?B?N0xPNDBiU0dRM3JQODZkMEducVdmcFYvelVhNUxFMHEzaTB6R09HTzZaVWdT?=
 =?utf-8?B?ODdBNFFzbEprUzNLbFlIdUNBbUR4bVRLZVZUVXdyWkpFSGNvblBhTEEzYURF?=
 =?utf-8?B?TnFudk9wOWVQd2M0Zk9xUmJNMDR4SFZKMUFxUW5ZUlZ2TDc0a0FaRUppUEp2?=
 =?utf-8?B?WVdKNkZxWjZZTCtvVGMrKytCY2x3eHRWTHljMHZKVXB1WTh3Vm5WbmVpcUcy?=
 =?utf-8?B?VTJNN1VwMnozSS8xN04xb0dRMmhuZkMrRCtsd1ZEWmd2ckhoaFpSalBrajNK?=
 =?utf-8?B?UmZZRW9raTZ4UzFzYzFtclNTMHBMQ2hCTXI3S0tzaE9xeUIydVJBUXpZai9R?=
 =?utf-8?B?NUZoVjg4d1JYOVBJNWlFOEw5aTd5bURFTkxCVVFnWWFEaG1HQi9STTVkeTdI?=
 =?utf-8?B?UmVwcHp2Z3JGVzNiblgxQjZ5YTFicUJmN1JFMVVpVS9MK0xsMVM3cjVPN3BG?=
 =?utf-8?B?SFhTN3JnTVN5TnVldWJ1SGJHSXdCSW1OR0dTUkNLVmNQVmtpZjhySDJpU29S?=
 =?utf-8?B?MERHRk9MS1lkWjhIMVUxRkZLTU4yaEhnZVFRWDFoa1JKdEYyMHVYNlFhVW1h?=
 =?utf-8?B?NTRmQXM1ZlZXSUp0eGdBSkp0WjAyQWIyTVYrbjllSTdiTWMwRFdxcitqZnRz?=
 =?utf-8?B?Z2oydklMTWV2TnZOUHo3UDZUSDgvZG5FUkFDR3FVUFJ2ZmJyQ2pzMjF1Y083?=
 =?utf-8?B?TUJNRzVaQXlWdC84NTQ0azVFNTV1SlE0QlBMNXV5dkNLTVRiWlFQNTY2blpS?=
 =?utf-8?B?bnh1YjBIU0VVNnpVKzBUa292UlpiUWYzNkJTYm1BMWg5YlM4SGp5SEtpWWRi?=
 =?utf-8?B?QSszaldoRHBubTRqZVBUb1pDMm03Z1NYNVBIUzNteUNGWGVxUEdod2QreEg0?=
 =?utf-8?B?OHlxUXhGYXJjQjUxb1ZkQlZ6OFNLcHgxVnV3aFVHd1hkTkpOVlNSV0ZwRVZ5?=
 =?utf-8?B?dGFqaXNJNE5oaGdOdUxzeVhEcHJVWGRCMUpSUW12NldLaTZRUk5WRmVsRjFV?=
 =?utf-8?B?ZVB0Unc3NHJxQjBaWTRhTEFuSU1ic2NtVjNMMFBmRFdkK01vVzhPL1dwN0Zx?=
 =?utf-8?B?akNuWTdENkNXeGJtamhGSWhmOWRaZEF5WS9Odmp4OXRuT0tJaTNwT0kwVldT?=
 =?utf-8?B?VlpWTGcySCtuSWdDM1l3TFJYNzNZcEY3OXBWVzBJZldteGY4VHhWTTRERlMw?=
 =?utf-8?B?VDhLMWFrMkxLOXZkcUdIc0Rkb0w5dzZ0VFZFNUVGdWxKN0hVaE5LMkZLZmFx?=
 =?utf-8?B?cE1JY1Nad2R6dlVWUjJEdm5PR1E5R3Z0VnI0bHlrWXdqWTN6d2E2d1dyeXdS?=
 =?utf-8?B?ajcrWDlxK1l1VXVTSUFPWGlLd2QzY2NzclpXVXczUDlYaGJIVnJKRUgxYkNx?=
 =?utf-8?B?WFZOZEJ1VkkrYjREMlhWK3NBbmJvNWJCc08rUlZ4OWRrUUVKQzZQbFJQalk5?=
 =?utf-8?B?ZXBRejBmRVRJYUpRVkR3MTZXSzVTRzNNeW9MWWswYWdZbmdUMUJrNWsxRkhx?=
 =?utf-8?Q?0PhghuXHGf4U0YelcS1suYZdl8Pr9pwQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anFTMGhDUzRlbmN4NEU5eHVDUGxHUTNHaURDdE1XYnh2elptNjRqMi9idXR3?=
 =?utf-8?B?K25xNGNkWHNBeFNVeWExN0RqMGQ5djJheVNlTjdWdk1BWUtaa3g4QkNDeHdJ?=
 =?utf-8?B?ZGlsNlZhYi9raml6Q3ZkREg2T002cmQ5aE9tNVJNdjhWN0gxeWR6RTdBTzRZ?=
 =?utf-8?B?VVZWUUcvRUFHZk9OQ1FPaU80WGNpK0gwNUhvNTYrdWs5UmN6YzFlWkM4Zklp?=
 =?utf-8?B?WGNkVnR0c3dob2lxSTFJcnZObkViNnVkRVk0QzdrdDFORmNnT2o4MEQ5RjFi?=
 =?utf-8?B?NFBMcVdpejNyS09DdjJCa1lBaVJnVStjeTJSTFJweWJOYlowR0JVQUdENnhn?=
 =?utf-8?B?Y3B6YUpPY0lNK2pNQWJ6M2I0SmMxWk9zcnNVRWxINGJvdm5uTmRjdlJzYXMw?=
 =?utf-8?B?TGtyYlYzZ1VuOHlOcTVZRE5SaVlWcHlHKzAxcVR0NTc1QmY4N2pmSlhOSGc3?=
 =?utf-8?B?N1I1TUYxQ0M1b1RnTEJNZnhNOTE5SzRhVTk3czlvVzU3bk5mSUFIS00xb2xv?=
 =?utf-8?B?SzRmYkVsQ09YU1ppYlhTZTVaQjBaaUxnLzFVYXdKQ3ZEdVBBMkxmWjN3eHA2?=
 =?utf-8?B?U1hhSnljM2daaXZSd3F3U3JtdzlaekN4aUp1SUxaLzE2YzhGdUtscW4vZVFM?=
 =?utf-8?B?eWozQk5ycmVTZHI2WkRoMWlTVHQ3cTlhNVNnb05ScCtrVWhMTlF1NEw4QS9q?=
 =?utf-8?B?Uk12MUdCRExWYWxXM2RTdmxhbU5BWTM2TUN2REhjZ3hFUnlaR21EVUthcFpw?=
 =?utf-8?B?QzBaNjVXeDJyRzgxYk1VOFd4M3BXeEV1Rjk2ellIaXlyVTdvM2hXSlNObnRX?=
 =?utf-8?B?eHZESDcvUzlyVDJkTE9RaXV1WXB1T3YrQWVVRUhiWmdoUXI5b1Fwa3dUbXZQ?=
 =?utf-8?B?b0lEMjRrRHVCczFHa2t4NGQxUXAwNm05OTZhRzlmay9HUStaVHd5NFoxVTd3?=
 =?utf-8?B?QnI2bGNPRXpqNTdSSTU5RnN6TmIvMTAwd2xxcW5xTS9MREVQdFFjZ21OSWtB?=
 =?utf-8?B?UFJZOUZmT2ZlUjU5eHhHSnhqdk5QaUJQdUwxNlRBTUZpdHA1SGN1NW5FeVN4?=
 =?utf-8?B?Rm10WnpMR2QrREMrMUhxZ1F1RDNzdFIrV2k4eUQvTmgvR1NpVHVOWHBkMFd6?=
 =?utf-8?B?cEpyTHZGT2ZWSnd6MWtENEMvakNkWUdhcUx0a0tBS2pYMkdVdmtrRURRZXZ3?=
 =?utf-8?B?cXYzdU9XRzVyT3R3SHAxREcvaG1STjBqb1lMS0pnY1VhVU9ucndJNnpNVTBw?=
 =?utf-8?B?eUVrQ3FXUVIwNGp4SzQxb2hEMVRZVnl0S0lQT0ljb1MzSXRDby94RzNwNW16?=
 =?utf-8?B?RUxIeWJZV0JQMXM5c3R3VXZYeU1wS3BzejRnV1ViQ3lNeExlY2tWc0ZJdERY?=
 =?utf-8?B?VmR0TTNBSFpVcTd0L2ZGYXhqUjFQK1p1NkpXNXBMWHBLUlZVSnhTVEN6Qi80?=
 =?utf-8?B?RlhCN1lYWEpRVjNaQWFhVWdTQ3VhL3RwNTZpZWZDTCtpNnhhU3lOK1k3Mm8v?=
 =?utf-8?B?UzUvTTJhRW5mN2dvWmIreEhiMU53ajJneFpOS0QxRERWMG9TdEF5YThPS09H?=
 =?utf-8?B?N2pzbFZhWjljdFhTRVM5Y3FLbzZuSUk0emRVbVdOMU1YQXBYTkpucytEa3pu?=
 =?utf-8?B?WVo4ZDFhOVJzdEpMYTAzYUllWVBRNmVlL3N5Ukt0b1JqQWRhaTZTZ2kzTnlz?=
 =?utf-8?B?ZGJqbTFldFNZU0JqREdESGxab2NJckxZYm1YMzRmQTJxbmozYTc3dEpxV1JJ?=
 =?utf-8?B?b0V0cDRhcEZmQmZpdHJvRzNaejVwZStQRWYrRGdaRHlkejlPTUpYR2RUTDV3?=
 =?utf-8?B?REtkNmUxYmk3c1p6djBma3Y5Vm9lcW5VbG5NdUk5Q1crQlM1M0F4TFVDYkNM?=
 =?utf-8?B?U29wcXJVcnh6Yjk0VURFZk5UUG1FQ0FCS2NLUFpWdGpJM0xEdVdlbE5naXR3?=
 =?utf-8?B?SmYrS0wxdDlOT0c2QnlnQVM1QVZSbWpreU81MHl1V29lL0gwMG0vR2Y3bm1W?=
 =?utf-8?B?Vlp2MGVHLzRTU3RFdDZkbVZGN1F2ZlhYZ0l4NGg2OVVEc3BOK1pMOFlEd2ZL?=
 =?utf-8?B?Wm9neUk4V09abU9GWW02ajVZVkxPTmFrS3Jiai9NTUlwNWFEaG1VYlNVUXpr?=
 =?utf-8?Q?4w5tAuj/9hpKD+oMPGNyA9pi7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a50258-04e3-4e2e-0324-08de2b970c44
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 20:21:28.0626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSnex1Db1LSEQ07hfWnmrGduPRodCyzony/x55aV+ImOREfwynX0EaMsTKWNszOy5XDR+r5+rx7l4DIlyyUNiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778

On 11/24/25 12:00 PM, Miguel Ojeda wrote:
> On Mon, Nov 24, 2025 at 8:37 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> A minor thing, but, it looks like maybe this was forgotten or
>> overlooked in v2?
> 
> No, it is there.
> 

ah I see it now, it's a couple lines earlier than I expected, but
looks good!

thanks,
-- 
John Hubbard


