Return-Path: <linux-kbuild+bounces-5097-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB89EFD2B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 21:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1360188AE82
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 20:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553A41CD205;
	Thu, 12 Dec 2024 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WXSRplWo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005E1D88A4;
	Thu, 12 Dec 2024 20:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734034639; cv=fail; b=NGZYfpwPPQDLAVI5kYjizBs5FUs0rHN/1TbtL60P2PxV0f5th5vklNHdQKyx/j1eEHzn+56daKoLAiU1WKXjPggDbft9hyttPFPDSfYEUo9lpeotju1BTiJYo4OX0RKS7WN4N61AT9CYylnNj64y6G9INpC9dYZZqZkOFz8MDYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734034639; c=relaxed/simple;
	bh=ZtuT+XvRFdRjakg023KPzdyxl3ugdy6SFGtbom0GEjM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EDvZYhsJ5wKE0BgP29NUTpgWMTFc8yBmjfQqjV+SKjuv1QG/DpD/ZdjinB+oW553vd7XkH3w09LCZtBeiWLS/vY7KsmnsY4Jq1vvmgIpf2FA+b8UGCALmjwJ/qLmKW5YyJOKvwE72e95QoRrKSzYMG9W6kfc0tQqXFyuAvzMLdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WXSRplWo; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBPW4qJ1e32LHAon8nfZzrQJ9vjYE6E+IKR4MUoFdjmA25R03OSep5wmOWc9P8FQNWxIRz5mFp9WkrjZ5zCfhrfpYVgKtxZNyt/nt1/QZE17j/CDfEzTKaCMnDVKGcvcSSNizeEnotPsPCHN1hcMYLLJynScX8+Fr60vYnPFLpo+Y9/sl1RtLQYpMYF8uV7oK8EaIh/xHm5LbyGx9RE57S2uUjFZVnQpOAqgNGnuNYgFyv/shAjgQuHnt88GvXEMPPRUpU/lbOWHP/iCyjwluxh6RhvoaW25S8FZUv1b0UtWeSz7DbWl0/faauKJ/kUPyY5c4aUUjm2Gr8gZzPdtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znlvQly8wV9BqON+vlfzGFth+1DlAompcZ73D0nQo+4=;
 b=o1e/6847eNafn51fr6AYl4YYq2QKEBV7Wju5RiquFQONcYRvCyEOPqXdnHpt95CbNmxmSBpqC+nIEaJidl1ZS/8Bm7E9RxfRy/hzOZ1ktXyO6K2g4NimneiNdhPr3iqvKutCSnSmMIgFdYJ1/x1Xm0FPGLlc0OGFo9a6s7eV4KvO3Thi3Y+O8Nn1IkgBG16iEs+VTPEkKX6rCKxGtpOwSa1nh3uchyD1N+nOrEYiT8r18x7E7NT2oyK6C+zF+01pqNZ/mQtWOhklv03UgarxyKfqfypgtdP73fuE9FKFpiBZIfMTArrv0JbqPIfzzf0izs/pOU3dmc+RDSIJ/d5Zfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znlvQly8wV9BqON+vlfzGFth+1DlAompcZ73D0nQo+4=;
 b=WXSRplWoh32XCG7pvNJHi3sX5/zGMVnSrLtYSBTlkZwb6CrF+Goi2rnj0bP7Qpcr/e6ascx06C7HBoP3SnxmRgITfKDeLQLwouE3cfC+m+3MJiSMm87wzES0MdEVC3Esl/kV+b9ZtZ/+Ei70U2qMv23Z2XAkoFZtyM1jZ7Lv7IwAXAvB7TDBirCRsJIaOyu9L8UiH3gOGPECprYreZRSqu6aZ2SNLIFi4s/E+nAVmJZYPSASzeI6akBptxeAwxewZf9Sylyuukx5RCZnnxxfR56jUTB0jf9/LWykQqXCl4+t1irhYZuoblBXVKnYlCzj9tZn5eGivuiKAOJSilIx2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 20:17:12 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 20:17:12 +0000
Message-ID: <12257d86-a4bc-4e98-bd0f-39ec41f1756d@nvidia.com>
Date: Thu, 12 Dec 2024 20:17:07 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] modpost: distinguish same module paths from different
 dump files
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20241212154619.2235767-1-masahiroy@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20241212154619.2235767-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0439.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4cce49-22d2-481d-8a3e-08dd1ae9f693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG9ZWk1POThmN2cvQ0ZCUjNoV0tJOTVQQnorVE1JMEFGcDJDbGhZRkVLQ2ZF?=
 =?utf-8?B?TDlsREZJUEN0cXAyaUcwS0FTQXhDdmNkWExiSmJPVGJ3TFVnTkl3M0RnSlhi?=
 =?utf-8?B?T1J1UHc4NWQwUzBzdjI4dktKK3A1Y0ZUcWYybkVsNVNzSERreGY0MFFqL3Yr?=
 =?utf-8?B?UllSUW9MaHhmVXE2RmwvcTBrMUxpdjBlcVVKVTM3bXpsUFIrMnRabnR0cnht?=
 =?utf-8?B?RHpsWVk0TGNDSmtOK0NJd3ZlbVZSVGRWUjhQZzFjN1U1U2Q1NWxXMSs1ak5p?=
 =?utf-8?B?SWZremZtN0dqNGlnSEppSCtjOFE5dWRRajNka2Z4M25idXJPOFl3VTVMVG1W?=
 =?utf-8?B?TTVuVGZpR3o1Y0M5Mk9OUlZpZkRxT0N0Q0wvTzZhc05EZ2llUjFSZjhzalFQ?=
 =?utf-8?B?K3RaazkyejgxekZxdjJNdnBaT0ZqQklVRzJlTWI5d3FTQ1ZCWkpWR0d0di84?=
 =?utf-8?B?aDFhQ05kM0JUZVZEUlhFVTNJcWNLTkI4aEJ4WVlHNmluaXVabDhqbjR2SU1F?=
 =?utf-8?B?bzVKT3BWdWdOcEN4WUZjSUh4REVrMUNJMGVVSnlBOXhVT1g3Ui93enpEa3d2?=
 =?utf-8?B?cDlBdm96YWJXNDBPZXZCTFVxN2xEUi9selVDNG1HZENpNkZqVDRzdGhQU3Ev?=
 =?utf-8?B?RGRJZERsK0pBcFJlTWhFSVBlc3ZRMjBGWmxNWmRyN04xbzFtdjJDWElLZXRp?=
 =?utf-8?B?OTdzRi9xT3dZSk1CVS9IeFkzMmhwR2ptK0oycFU1dWYyaG11TC9LTGJyMFd4?=
 =?utf-8?B?YTlrWWljRWtxYjI3dVl6WXJxRjYyRzNZOTdxWDdYNnRkYnk5Z2ZhSzRoa0pa?=
 =?utf-8?B?d2RFblVPL3F2SnlXdGJkcVo5ZVpMaWE2a1d5Y25DN0ZmS0hjUzF5RFhjdXYx?=
 =?utf-8?B?RFJUVXFZT3VmMkNNbEJLODBrTlZNWDVyZmZReThUSmpyMm5pZlFuZGhOUmx2?=
 =?utf-8?B?bW92YlpKMkx5clFvNkpPZDZFYlFXWkpIRVNtT3lVNmtBMC9XanM0MTNiMmJR?=
 =?utf-8?B?L0VOZXhpVTdrWEJaS2FoZngvWUMraXlkOGhFVEtQUTFzaXlKeTVldlVwbWpD?=
 =?utf-8?B?MThnWXhlZk9oSzdHRlQ0Tlo3R3I5QjVJcUp4QStXN2xUQTNtMGJ6Nm80Q2h0?=
 =?utf-8?B?enFCT096TEJ1RXY4b3RwWXh0V2ExaDdlVDREWW5GaFV0UGlHd3RJMWlBTXpj?=
 =?utf-8?B?Skt1T0NsNlAwcnVCU3lxQWNRZ0RKeEt5dVZqZk5MbnpGbkJWZVdLM1BIUHNW?=
 =?utf-8?B?YmM3NGwrd2VOVlk5MHdrRnhGckhVRFZPUFNxQ2M0L1hKR2VpZndETjdLMGda?=
 =?utf-8?B?Y1VhOEt3UmN2WlhianUzdHBvQkc1V2FuTkNxWmlyNWZqRUQxbFJlRERaTHc4?=
 =?utf-8?B?blpRUWxBNmpJNUVDcEVYbGxqR0pUcGVjNTNSajZ1Q2t2d21rK1N4eFBueWtC?=
 =?utf-8?B?US95N1kwS1czV1N4VExHaUF4dFU5REx0blNtNHczOTBpYzF6VGdOSitsWlp5?=
 =?utf-8?B?VkpVZmxyS1VXQnhwRzJ5d2gyWmVSQVp2MlQ5NEZhR2ZFeS9SUXZRR0ZpRmpx?=
 =?utf-8?B?L0pLL1F5TWFhL2RteXhsOVJBeDYvWlVrcDhCWi9mNjByeGh5U002c1F1Ulgv?=
 =?utf-8?B?cHJUM0ZSN2cxYk11dXdrUXd0V0o5MmYvbnUybEpXMmt4MWNFT0NIZXdQUDk2?=
 =?utf-8?B?OGl6eENNRUFmcFhVMlEzaCtXZGhJTVdkUk1iblhiSnpCR2hwZm9WTjRmTzZq?=
 =?utf-8?B?VVpSTUJtaG1GeFJVZnY4VldjVXU1NktEQ0ZyR2wxcEx0Rmc3QlJPK1FXVnJE?=
 =?utf-8?Q?4RrOeHZQ6lr0hUWHY1HN0Ns0pqZ6VcRSLievU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDdrZnhuWUFUM0RvU1ZoZi9pUXJSNUxObVFuK2x1VklhdWh0Tk1ING5WOFlL?=
 =?utf-8?B?eTFBR1g1WXhEZ2k3T2owMkhHMnF2bWkyaHkzczVSUi93TlRtWlhvYWdpN2dy?=
 =?utf-8?B?bE54b05nUm1oaUZPWXE5VWpTRHJQYVNJQTJuYXRxdVpRSGhNb1J2RU91NXd0?=
 =?utf-8?B?L1RTbGYzaUFjNk02akIyZ29NL2lZdEkzUE5TR3htR1MxV1QzeWRnZnNWU1Rm?=
 =?utf-8?B?cHZLSnlsbE5FN20zTXpMQXUzSFdlNVpXelpDcE5uUVdBMHJ6amxkUVk0UlhJ?=
 =?utf-8?B?YWVXV1k0YW84L05OcnE3Ymc5emhsd1JhWXlWaUtxUVpabHhVSHdwRFpkemVi?=
 =?utf-8?B?b1QrY28rY2I4RFpucFIxcFZpK2Vtb0diTUhCN0VsWXVHdG5FRjQzT1hhYUFJ?=
 =?utf-8?B?Y2FBN3NjWlU2b0pub2xTODlXZ0lmM2dybTBFdU5YU2JUaHRCZXJQb1J2c0dt?=
 =?utf-8?B?eHV1MGFEcktiTFVKV0ZqYVd6MFYxSUZSVllFNk1ENkluemhXM0tINmhGRlhw?=
 =?utf-8?B?S3crNHhBU0wwaWIwMTZ1b2IybDQwL1J4MkJRYTBsS0RMTGdWKzlJaWkxWTM5?=
 =?utf-8?B?OUNkcHk5Ui9iaW9xQ2wwUkRZeG92V0JsSWhWTjJUNUN3RmYveW0yTkxLM3lh?=
 =?utf-8?B?cktGT0hZSXIxd0k4UVRWakNidWVTZDU2MC8xNzFLanloRmd2ZldtdFhPWlFW?=
 =?utf-8?B?OXVrRVNDSmxlZ2N6aS94SDBwS3NhZjdJelBSUng1NUFIOC9iRXhFK1hIRGtE?=
 =?utf-8?B?U3RSMHFYUE9xUFpHTXpMVllWb2psbks3cmF3V1Z6WlpITENSZ2FNaUdyZEtR?=
 =?utf-8?B?WFRPa0RwZlF0SnVvdFlFMkRHWm4vQWl0a1QrZXVVMmhjbXI2VEYvWDVUV1Rs?=
 =?utf-8?B?YlIveGZlQUxkUG9WZDBDakJNRTdIZ2xmdVBMVW9rYmxSTDYxVUxDejlnU3gx?=
 =?utf-8?B?aEhaVE5ZTGhHUW9PUXVZT1Z5cDRaSXh4d1Y5UnhENEpzaXlWVVJ6MVB1dWxW?=
 =?utf-8?B?WjRFclE1TGYrVzRVU1k1cHdWZytMSS8rYTdoK2tjbmdXZ0w5TGp2VjVvaG02?=
 =?utf-8?B?SWc5NURJd25jZzN2eDlvQldMbTFiTTdHR1BsWExhYXc3d014K0EzamRkUm5B?=
 =?utf-8?B?WVR3SHk5MWdkWEVERHU5Y1U1QWIyRDhOL2tLTGhaRlRsckhZQUhNZDBLZHpC?=
 =?utf-8?B?S2t5RlFMR0F1Z1h0emlsNTBMR0F1bThSckNvakI4M0ZUVnRVYk5FR3d4MFg3?=
 =?utf-8?B?V0JwUWZLRzJzc0hydnUrY0hyemNoYzA5NkZxam9qZnpORzh5L3hrVW9GR1Jm?=
 =?utf-8?B?dG1FSDNkeFQ2MS9qbXdSNXRmcHhQNzN6MFRHSkMxM2pyODlmSlBKaEttZ3ha?=
 =?utf-8?B?aDltRGV3WG95RkhKWEFrK1I1bVJ2Nmdrc0xkTFNpUFFvT3g2YTQwdFl6cU05?=
 =?utf-8?B?VFlod0hLZzV4VjJNeklaUUV4eVBvVFFPMVdWbElMSXo3R2FkNDA2dnlWRVMx?=
 =?utf-8?B?cW1yaGpyaUtLSVZYWll5NWdtN1EyaTArMU9BWkVGWEVhSlo3OXp4NVhVUjli?=
 =?utf-8?B?YkExRzE2NVJXU2dhekxmamlzdVJZN1FwTWJGNTRTdyticzBRRFQwbjBGWTZq?=
 =?utf-8?B?SnpjNm9odHdoNkVIMG0wb2I5dWoxSm5KV2FOYzJjOUJmZytBOCtQSzk0R1VK?=
 =?utf-8?B?RkdhMzNRY3VJZVFadzcrUE1JZ053b0lnRGcxY0d3aXNsVWpXTHJMczk4WmpT?=
 =?utf-8?B?RXNXM29pcVR5OEpJWmJoMGpCcjgxYWJnaHdjd1VwbFR0YVIyTzR3U3V0UmYy?=
 =?utf-8?B?RElLZVNzUWVwdnI0cGNYYnh6cDBvRnU3TFJkcE12VWlnak5nTU1GUlhEdG9q?=
 =?utf-8?B?c0YyOEtVbzE4QUlJUVhNK1Urd0F1SWY5NUJsRFFuU1hsTWd6VEdXanVJZlZ3?=
 =?utf-8?B?WHhDclBpS0NrRGJPeW1sbjE0MkU3ZzN5Y2lsTU4wam5ZV0M1Mng4V1MwZzcy?=
 =?utf-8?B?RDdSN2x3S3hNNW5TTGg2Z05WZUNtV2tUU0ZuNlpwanZ6SDRTazR1ZURweXJD?=
 =?utf-8?B?UGxvS3VtaE5HVEpOZTBzM1pIYmNoRmxmMEx2TmxTbDhWNTc0K29MVlhqYjln?=
 =?utf-8?B?eG0yZ0xJVGhoQ1ExS1RQZWM5Z3dFK2M0TURmb2hIU2xQdGFITVZwWm1EcEpP?=
 =?utf-8?Q?mpWkR0ipn8r6N4DIGBCG8hI/ny4ge192JpfY242MKGFq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4cce49-22d2-481d-8a3e-08dd1ae9f693
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 20:17:12.5899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CokJXKO+tLHnpilO5QjJyrXm/fpd5yyrQ4m5ObYev3UCZCElXv8HEkTg/ABj/b47DiMWEFQse5E238U6BW+Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8044


On 12/12/2024 15:46, Masahiro Yamada wrote:
> Since commit 13b25489b6f8 ("kbuild: change working directory to external
> module directory with M="), module paths are always relative to the top
> of the external module tree.
> 
> The module paths recorded in Module.symvers is no longer globally unique
> when they are passed via KBUILD_EXTRA_SYMBOLS for building other external
> modules, which may result in false positive "exported twice" errors.
> Such errors should not occur because external modules should be able to
> override in-tree modules.
> 
> To address this, record the dump file path in struct module and check it
> when searching for a module.
> 
> Fixes: 13b25489b6f8 ("kbuild: change working directory to external module directory with M=")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/eb21a546-a19c-40df-b821-bbba80f19a3d@nvidia.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   scripts/mod/modpost.c | 17 +++++++++--------
>   scripts/mod/modpost.h |  3 ++-
>   2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index fb787a5715f5..94ee49207a45 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -155,12 +155,13 @@ char *get_line(char **stringp)
>   /* A list of all modules we processed */
>   LIST_HEAD(modules);
>   
> -static struct module *find_module(const char *modname)
> +static struct module *find_module(const char *filename, const char *modname)
>   {
>   	struct module *mod;
>   
>   	list_for_each_entry(mod, &modules, list) {
> -		if (strcmp(mod->name, modname) == 0)
> +		if (!strcmp(mod->dump_file, filename) &&
> +		    !strcmp(mod->name, modname))
>   			return mod;
>   	}
>   	return NULL;
> @@ -2030,10 +2031,10 @@ static void read_dump(const char *fname)
>   			continue;
>   		}
>   
> -		mod = find_module(modname);
> +		mod = find_module(fname, modname);
>   		if (!mod) {
>   			mod = new_module(modname, strlen(modname));
> -			mod->from_dump = true;
> +			mod->dump_file = fname;
>   		}
>   		s = sym_add_exported(symname, mod, gpl_only, namespace);
>   		sym_set_crc(s, crc);
> @@ -2052,7 +2053,7 @@ static void write_dump(const char *fname)
>   	struct symbol *sym;
>   
>   	list_for_each_entry(mod, &modules, list) {
> -		if (mod->from_dump)
> +		if (mod->dump_file)
>   			continue;
>   		list_for_each_entry(sym, &mod->exported_symbols, list) {
>   			if (trim_unused_exports && !sym->used)
> @@ -2076,7 +2077,7 @@ static void write_namespace_deps_files(const char *fname)
>   
>   	list_for_each_entry(mod, &modules, list) {
>   
> -		if (mod->from_dump || list_empty(&mod->missing_namespaces))
> +		if (mod->dump_file || list_empty(&mod->missing_namespaces))
>   			continue;
>   
>   		buf_printf(&ns_deps_buf, "%s.ko:", mod->name);
> @@ -2194,7 +2195,7 @@ int main(int argc, char **argv)
>   		read_symbols_from_files(files_source);
>   
>   	list_for_each_entry(mod, &modules, list) {
> -		if (mod->from_dump || mod->is_vmlinux)
> +		if (mod->dump_file || mod->is_vmlinux)
>   			continue;
>   
>   		check_modname_len(mod);
> @@ -2205,7 +2206,7 @@ int main(int argc, char **argv)
>   		handle_white_list_exports(unused_exports_white_list);
>   
>   	list_for_each_entry(mod, &modules, list) {
> -		if (mod->from_dump)
> +		if (mod->dump_file)
>   			continue;
>   
>   		if (mod->is_vmlinux)
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 49848fcbe2a1..8b72c227ebf4 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -95,14 +95,15 @@ struct module_alias {
>   /**
>    * struct module - represent a module (vmlinux or *.ko)
>    *
> + * @dump_file: path to the .symvers file if loaded from a file
>    * @aliases: list head for module_aliases
>    */
>   struct module {
>   	struct list_head list;
>   	struct list_head exported_symbols;
>   	struct list_head unresolved_symbols;
> +	const char *dump_file;
>   	bool is_gpl_compatible;
> -	bool from_dump;		/* true if module was loaded from *.symvers */
>   	bool is_vmlinux;
>   	bool seen;
>   	bool has_init;


Thanks for fixing!

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic


