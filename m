Return-Path: <linux-kbuild+bounces-5191-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AFF9F79CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 11:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BEBA16E4B0
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 10:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758DE222576;
	Thu, 19 Dec 2024 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dVRkuZil"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57F2208A7;
	Thu, 19 Dec 2024 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605321; cv=fail; b=Q/qx1s1cipLyNCjLqVY+rFUJWfj450btCfFIk0pno8Rr0b7iR3yHTVDwwBM4p+S0sw9sfHfnk2+QMn627/oXTuoYtgYYHx8lG/ylqxiYf19UpzbE4YQBe3Y13g2miDr2xgCvEwQjYJ8BnRw8A0WZzkBCC3pfC33D/wXpxvrZbBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605321; c=relaxed/simple;
	bh=1EWyxzSb0ka8UiOk6TGGnPslpVjb9M0vWVLPUBWnYhQ=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AcNIoTpIrCUwKX7GZ8E1T6zTLzQe4ATE76DJ8pGUMowP7iXUe7hedfcVyv3OBx6u3GB3P0wn41z0v2Mq6EL0oQ8xjinKBvEOJsYdazDgDMngE91ReDL8CNrnZ7XGuA7A7JqGQia35ZqtQ2RnxR3XYxgX3OjZoZcSnJt1g++x+Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dVRkuZil; arc=fail smtp.client-ip=40.107.236.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNWeAU/F5pczmiL96ZofjWV14Ka2TOuQebYpLEUDjcQXlTncSSyM/JVIjYmIHzWreC0ePtXPdQTteDHtFTiUP8Zn2gsP0c2LVWKSuE27eWIhHR0Ly15cB7wJ2gIcP2TOnVyaT/oA87aYfwyFJFRVrqsYbD1oacLHWUqcGFiO+DWP70wN1Ed+CLVETSYjlF9n2UfwQ8quCSLv/gJyGJAiGQogRPgf4o+AwnYhl0HiWqkQXM5W1wHH0GhzCpMReQFUhtDYrv0168QwtP37nb1RaX1jDvb6mu7WzvjTkVT3X42ihSSeBdjLD0Xyn6L/c7pAkr8pWD09BsbWSDcPVbQr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lTpiCOBBuzXCP5r0NpBG5O1vne2VMDdViOYlkkXGFs=;
 b=wokYr1qjFF24QIuwgSRJpS+xuQNf44sGA8S+4gLK7uGUx8Xr+WpuFNhj4wDvLVWrc5bk5sCUYoCAMK7h3OkQCLsDAylNUh0SzEqBi9s0gIbc4vPUBfsO+qd39RNELU23Z2H/V9fdnclSvuR5obuFzO4ZBRZ+pPe0OCR1F6u6xtTkMTvmXYht6+t0IttvSndueMk4tWgVuXdgVJG0EpaiGyNteeF+u7r0Y5JTGspRqaXxgVfNjbPImsOUoRHtUuEXIWBr9hBcODBOVEBNqO0lb9eRPkIhbcoue9M3bsQpl2vEUWCDM99fpzGcRMXA/2XNNcDR4lrU0RnQjxpyI1PfBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lTpiCOBBuzXCP5r0NpBG5O1vne2VMDdViOYlkkXGFs=;
 b=dVRkuZilchgHjN9frQ7Ku4yd1Cs9I0hN1ocs+4evycjsLX6OjK63IoqHf+AcSAq2zDRX6n8q0IE9L1KgrmJR57If99J+dTGmxYcb+jysXdwF12TT8H9zPBYk28S5z7E1KVQF8j0YkQqU4gp5SciMsgYSzdB8d8867pXFhoCaljXLS0RDJpzRR2UB45d7SQX+5T9+sgd9JJPZAiWJ3wCVLnanDfrxVEASuOZ59LSBf0pfdfNB26KQTF42UmAnM2fPjnAkJmOPZjYFkHI90sCixp91XtBexwH/B0Pmz8Yn6msLz3qSWwccvxGfuAnG9H0nAxL6AJ3D/VwKrYP2lFr/UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 10:48:33 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 10:48:33 +0000
Message-ID: <5963c8b3-7e03-4f2d-9198-f02cc3140313@nvidia.com>
Date: Thu, 19 Dec 2024 10:48:29 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] modpost: distinguish same module paths from different
 dump files
From: Jon Hunter <jonathanh@nvidia.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20241212154619.2235767-1-masahiroy@kernel.org>
 <12257d86-a4bc-4e98-bd0f-39ec41f1756d@nvidia.com>
Content-Language: en-US
In-Reply-To: <12257d86-a4bc-4e98-bd0f-39ec41f1756d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PR12MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a21be4-1a5a-428d-aa76-08dd201aaeac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDhjMjdyai9jTXI1ZFgxdTVOcFVFTmx4RUc2Z3EyeUxvbHU4SzZBZzVSMi83?=
 =?utf-8?B?TjlnR1REbUFQNFZBRlgxOHlvV2NBMXRYWk9NUkV1L2JZL2JjNCt1UVVPcFQz?=
 =?utf-8?B?dW5KM0dhWjlLazVsTlJhY2hZRGFSRmVIMGtod1hyNnYrSlNsU3lxbEQ0M1NO?=
 =?utf-8?B?YnJsSjBrRTZkcDdTVlZiMjJkOTV3ektqbUZrTng3M2tGTTI0K1VxdktiYUhu?=
 =?utf-8?B?d0IzK1Roa2RRNTUxV1BHNkxvSWFnKy9Pd2pSWDhlU1lnbmpNOTFqaGhaQ3Rz?=
 =?utf-8?B?VlUxOFQ0dlhuVjV5VnExcTFmc3cwcEVpK0k2Wk5WV1Y4a041WHZ3elA4elRV?=
 =?utf-8?B?bG9lOUM2ZTBEMkZ5WjdzdkdMdFdNcm96NTJwZVJXQThZa2VoQkRybjBDQTlK?=
 =?utf-8?B?bUlCcmtNSDdMYkJ3RzhpSjVVak1ENzhDbWVQQ2plU2dyTlhla2IzcUprM0ps?=
 =?utf-8?B?cnR1b0R1cjBWNkhia2sxeTgzZkIyZ3N6OUIwcHJaU0NhdnVNTHhDTmxKdk5O?=
 =?utf-8?B?RnFPajYwaTFkZWJhb0VKRzE1dU4zZThOSk1mQ2FsYW13MkpVU2FGaEZpYXV5?=
 =?utf-8?B?RWtMQ3NZRE42N2RnL3JYcWpyOFVoVjNXU0ZCempZYlplY1huUVlWaDlZNVZ0?=
 =?utf-8?B?UUhUYmJuODBtUk42NlhxRUp1b01iL2JYMmVBeFNhMi9Ud3h3KzQxR3dnL2Fq?=
 =?utf-8?B?bmtxWlJzai9LNlJvMXE4ZDlGbFJ6VWgwbkduRExsUnRoY2xwMDRmY1prK1dV?=
 =?utf-8?B?ZWJ1WlpxVXpnYnUwL1hGZmdtY09sYktBdERtMzhoMTRkdW8xSXJITVdhVndq?=
 =?utf-8?B?WUVWMElkdGJzd0lxMHJUNWxpUEZKZW9kbHJHWHBaZk81QmpjQVY5UHBnM2ZP?=
 =?utf-8?B?d1REQXU2VmhYQ2QwOVhxSzNUaEs3TC9YYy9NQ05MMFZDRkJLeFhKYXZBUXpx?=
 =?utf-8?B?QzZsNDFsd2dDUEdBNm1ydGZrdjVXU0JIZk1vaE4ydnNBb0YxSVVCaU1vYkVh?=
 =?utf-8?B?UFlBUm9TZEZ4M2hwWktsNWoyeVFyTllTOVU4MW4wcVJTTlVIdGxpS2RnL1NN?=
 =?utf-8?B?akFycjIvNk9oWWtHZWVGanhwNzRpME10d0kxQy9LQkdSLzR2MFZHdmFMbHl0?=
 =?utf-8?B?VlpUSjhJL3dFVyt3TDBZdllHNnBydEYzTllkWTlpcXcydVI2M1M4L1Yzck9P?=
 =?utf-8?B?NXM5MW55cU9BRWxBU3F6a0t6Y2YwQWwzNlljaVJZK1hBbXRhN1BpRHYrSWUy?=
 =?utf-8?B?aWdHMlcwbUxGYVB1SDlLcHVIVklnQlNsUzk2YlhkNUhIbXc3RWVSazRMWFZN?=
 =?utf-8?B?Y3dJMWRDVmRoVUxtaEs2SitFaXg1aE9JT3FiYkFYTHBMQkNPQmF4R0oyMHc5?=
 =?utf-8?B?VldRY2ZJVFlER1hPZVI2RVorVm50QTQvQ01JclM3Tno0bjhXYys5YjJoY3J5?=
 =?utf-8?B?eUpEVkhTZW9aZ2QyVktJSmE5WW9oSzZIUWd0TERud2dNTno2NlEyRmwzQjQw?=
 =?utf-8?B?OE5pamRYRjNOdi9SK3BTN3dKVlZRY0RLZG9vL0lRekw3U0llNXVXUVRYYmND?=
 =?utf-8?B?MHpiZk5wQmMxbVB0Ti9meWlRSk9rK1RKQXlvZ3RkL2N5Rk1Eck1YOElnMnRy?=
 =?utf-8?B?MzVqN1MxTWZ6cTVnRCthenVsV0NYNXNDUmhMMm5VdGp6bTZTRUljQzk1eUhi?=
 =?utf-8?B?MVpHTnk3MHc4bWdPNlFqQUNWd3FsMGtoSzZILzh1N1lWZ0RaNUhWMTZaRmdJ?=
 =?utf-8?B?ZlN1bVh0MXRGc0t3RFIzS1hrd3dCbk1VVzVqWTl0UjNNZDB2QkFRUVVCRzNV?=
 =?utf-8?B?KzZXMHREOHltWmpoS1dCNjBBU3cvUG1INGFFbzY4N1hTU2JpbURwc3dvaVVR?=
 =?utf-8?Q?52zD7pm4zVY+d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cURTQVNXUHU5Wk9QN25YUTZiSFQ1OGdiR3BacnFmR2xoWk52b3hkbmVBTFJN?=
 =?utf-8?B?UjJXZ1cwaFM0TFJyRkJpRjUrZS8vSE1jM3F3ZU9wY0xIeC9VdG9ZMEE2ZE01?=
 =?utf-8?B?VUxyMExjdmdGVFREQzNLRzF6enh4b0E2b1Q3Y3Y5aVFwRXA4KytPMVlISThG?=
 =?utf-8?B?T25jM05vdmNISFNiMnNjZEwzSk90MU4rMHNRMzBjeE1McWpXQzdqdW9RNjFj?=
 =?utf-8?B?MWJxUkIvS3gxKyttWWN6UGhUNmErWDFZZlNrY3NVVnMxZjhMeWpiQVJnenBH?=
 =?utf-8?B?Y3BxYkl4SWIzaGE3bUpzSkpnSHdiN2dyT2YxRTMydlFuMFI5eXNDSnVRbXlY?=
 =?utf-8?B?MXRxbnFvbk9CZXBxRzQzSUpYR1JSK0tRby9McVhLSng3bUl3Q0VMa01xYThy?=
 =?utf-8?B?VWZEK3BPSCtENVhzTkNaa09zZ01WOXhZQUc1aGNrWWtuSnllWkNqVXRoRGVs?=
 =?utf-8?B?ZFlVb0FDNzNxbDJjQzQ3eXFyaVpqWW54TWFwelYxN0pSeXllV0k4UGh4Q2hU?=
 =?utf-8?B?T0tYTTZxUUhMZUNYWkh4K0NRVGNJYThjVnB4VEpvN1JwckZzWGV1U0J4MWZM?=
 =?utf-8?B?dG43QXlBcnl0eHlsbG5vZ0dwSmxUNjBGb3JQTEpkWm9YWFM1alVlSHA2cGNJ?=
 =?utf-8?B?ZE1tZHg0aW52QTE0Tm5oU0l5SXlNajdOKzJRSXFWSFhPVGVQdXZCckxYZDh6?=
 =?utf-8?B?dzBFcWc4aWZpUFhFN1NCSHoxa2xuUGJwZ2I3bHV2UC9aWkl5RG1VUzdvUjAr?=
 =?utf-8?B?bm94T3dvWWhzNXZHWGVuUGdjcmxleEREdXZ5T0JORVlMR0xxazdxYkowMHd0?=
 =?utf-8?B?ZTJOZVFaaWRZcSthRExKKzhXdGxvL3BsWVQ2WXJmalN1a2Z6amlKc3hRMFps?=
 =?utf-8?B?YW5hMURzWmU3aUFPZFRlNk5nSmpiN0tNdVhxTkNTL1duS3hBSWYwLzcxQWNC?=
 =?utf-8?B?OVpvYTlsaERBeEorR2M3d3ppN3pHUXhOcVhvNDBiMDRuLzRmaTEwbnNWcEN0?=
 =?utf-8?B?OTFiOVZ1VUtiY2dUMkhINk9RU2praDVHdTFaRm9pajV4NjJxeUdiMndjKzlx?=
 =?utf-8?B?UG5wVkJBRldycVlLTkRJM2tJQ0ZmU0VWY2FSMm9MUkZaY3dyd1ovRSszbWZ3?=
 =?utf-8?B?aGFleFFZQWcxSmFTejVRN21HMkxhaE5Bdzh0WmxSZmhKekF4VmxBb0pBYXhO?=
 =?utf-8?B?STRLclpKbHgrcjgyTFhxTGdEUjhIWm9SVXc5ekdJRFdOYU1wY1FPbjh6eDBI?=
 =?utf-8?B?QmxDMWpPYUo0aFB1QnRLTklpYk9RNGg4VXVvdHBxOEU2ZTZPcUlMTWgwTUpr?=
 =?utf-8?B?M1FJUnBlMHExZ2hPWkg2Nyt1ekZ4MGhUNnJwdTYzWE54bVNNaDBvcnZQb3NL?=
 =?utf-8?B?aGdmaWZkYVVHSkUwUWplZTdxdzd3Y3YzWEJIV01GV1Y0K0c4Y2ZGZVk0MGxp?=
 =?utf-8?B?Um1Iby8xL05sRmlRL2RacTI2clBIQVF1SmgwR2ZDcWh0bXMyYWd6TkE4ZTNU?=
 =?utf-8?B?WEVCVVBYUnZ1WWpabk9ZL2NSUnFVRmhuL0VTSW02M3VuQ25KZ201cVUyZnhN?=
 =?utf-8?B?T1JiZlBnOVBGOXRqYXh6R2V1ZG9HcU5WcXd3WWdUdVNqTmxLRkVQZ0cySUZw?=
 =?utf-8?B?SEJkaDM3YnVwWllObEtxWWZZQ0ZLYitjcWxiSEY2TlNYN1BxK3VmVHUzdm9m?=
 =?utf-8?B?ajRWSTA3T05TZDVWQjRxTitVTUtYWExCdlZjTG43aktxemZjZy9Ic2J0alRI?=
 =?utf-8?B?bFlZQStDRVNPWDhxY3N6NXhTZzJCUk1QY0JVQ09yQUVEZkpZUStxNEM4aytY?=
 =?utf-8?B?ZjVZeVNDZThwU2pOcm5qRDg5TWptWjBUaEcySHJaR3dVamNqbWZSdTc4TXJ4?=
 =?utf-8?B?K3pLaXhja1E2UFprSnhjSUZoWCtKTWErYXR3NXMzOVFkb2Z6dFNqcGF1dWU4?=
 =?utf-8?B?bmlBZ1VDOHplNVMzMG1vdExiUW96VVFlMWxxaDlKaDlTNHJ4ZGtITkttYVU1?=
 =?utf-8?B?SmpILy82VjR0UlprdnpybTAvMUlxMkkwUkNkaGNDWlZqTEVRdHRid1VLMG9U?=
 =?utf-8?B?TllNNC9SRUZYUlVDZ0M1dGwzbDdvVFRYV09IQ0dQaVdWcUsxUk5oUXpkcm82?=
 =?utf-8?Q?puC0GNi4NC2Qg9xOWOflb6jNO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a21be4-1a5a-428d-aa76-08dd201aaeac
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 10:48:33.0786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xDmd1TTvejAJ1DerWfmVze+74h1JuyIeHBSIEjsgfm7D4sQ4/GqZA3AM9dTendttRS2JYSTC5NSIng3bRQODg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650


On 12/12/2024 20:17, Jon Hunter wrote:
> 
> On 12/12/2024 15:46, Masahiro Yamada wrote:
>> Since commit 13b25489b6f8 ("kbuild: change working directory to external
>> module directory with M="), module paths are always relative to the top
>> of the external module tree.
>>
>> The module paths recorded in Module.symvers is no longer globally unique
>> when they are passed via KBUILD_EXTRA_SYMBOLS for building other external
>> modules, which may result in false positive "exported twice" errors.
>> Such errors should not occur because external modules should be able to
>> override in-tree modules.
>>
>> To address this, record the dump file path in struct module and check it
>> when searching for a module.
>>
>> Fixes: 13b25489b6f8 ("kbuild: change working directory to external 
>> module directory with M=")
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Closes: https://lore.kernel.org/all/eb21a546-a19c-40df-b821- 
>> bbba80f19a3d@nvidia.com/
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> ---
>>
>>   scripts/mod/modpost.c | 17 +++++++++--------
>>   scripts/mod/modpost.h |  3 ++-
>>   2 files changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>> index fb787a5715f5..94ee49207a45 100644
>> --- a/scripts/mod/modpost.c
>> +++ b/scripts/mod/modpost.c
>> @@ -155,12 +155,13 @@ char *get_line(char **stringp)
>>   /* A list of all modules we processed */
>>   LIST_HEAD(modules);
>> -static struct module *find_module(const char *modname)
>> +static struct module *find_module(const char *filename, const char 
>> *modname)
>>   {
>>       struct module *mod;
>>       list_for_each_entry(mod, &modules, list) {
>> -        if (strcmp(mod->name, modname) == 0)
>> +        if (!strcmp(mod->dump_file, filename) &&
>> +            !strcmp(mod->name, modname))
>>               return mod;
>>       }
>>       return NULL;
>> @@ -2030,10 +2031,10 @@ static void read_dump(const char *fname)
>>               continue;
>>           }
>> -        mod = find_module(modname);
>> +        mod = find_module(fname, modname);
>>           if (!mod) {
>>               mod = new_module(modname, strlen(modname));
>> -            mod->from_dump = true;
>> +            mod->dump_file = fname;
>>           }
>>           s = sym_add_exported(symname, mod, gpl_only, namespace);
>>           sym_set_crc(s, crc);
>> @@ -2052,7 +2053,7 @@ static void write_dump(const char *fname)
>>       struct symbol *sym;
>>       list_for_each_entry(mod, &modules, list) {
>> -        if (mod->from_dump)
>> +        if (mod->dump_file)
>>               continue;
>>           list_for_each_entry(sym, &mod->exported_symbols, list) {
>>               if (trim_unused_exports && !sym->used)
>> @@ -2076,7 +2077,7 @@ static void write_namespace_deps_files(const 
>> char *fname)
>>       list_for_each_entry(mod, &modules, list) {
>> -        if (mod->from_dump || list_empty(&mod->missing_namespaces))
>> +        if (mod->dump_file || list_empty(&mod->missing_namespaces))
>>               continue;
>>           buf_printf(&ns_deps_buf, "%s.ko:", mod->name);
>> @@ -2194,7 +2195,7 @@ int main(int argc, char **argv)
>>           read_symbols_from_files(files_source);
>>       list_for_each_entry(mod, &modules, list) {
>> -        if (mod->from_dump || mod->is_vmlinux)
>> +        if (mod->dump_file || mod->is_vmlinux)
>>               continue;
>>           check_modname_len(mod);
>> @@ -2205,7 +2206,7 @@ int main(int argc, char **argv)
>>           handle_white_list_exports(unused_exports_white_list);
>>       list_for_each_entry(mod, &modules, list) {
>> -        if (mod->from_dump)
>> +        if (mod->dump_file)
>>               continue;
>>           if (mod->is_vmlinux)
>> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
>> index 49848fcbe2a1..8b72c227ebf4 100644
>> --- a/scripts/mod/modpost.h
>> +++ b/scripts/mod/modpost.h
>> @@ -95,14 +95,15 @@ struct module_alias {
>>   /**
>>    * struct module - represent a module (vmlinux or *.ko)
>>    *
>> + * @dump_file: path to the .symvers file if loaded from a file
>>    * @aliases: list head for module_aliases
>>    */
>>   struct module {
>>       struct list_head list;
>>       struct list_head exported_symbols;
>>       struct list_head unresolved_symbols;
>> +    const char *dump_file;
>>       bool is_gpl_compatible;
>> -    bool from_dump;        /* true if module was loaded from 
>> *.symvers */
>>       bool is_vmlinux;
>>       bool seen;
>>       bool has_init;
> 
> 
> Thanks for fixing!
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>


I have not seen this land in -next yet. Would be great to get this applied.

Thanks!
Jon

-- 
nvpublic


