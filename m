Return-Path: <linux-kbuild+bounces-9395-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F687C30A10
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 11:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3F351896D6F
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 10:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851382D94A2;
	Tue,  4 Nov 2025 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FUDNnPVT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013051.outbound.protection.outlook.com [40.107.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6112C21D0;
	Tue,  4 Nov 2025 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253969; cv=fail; b=NrlpH+DVtHKHdNh3HxbNDfp82gRvM9oCgiRHo6bc0s2u+V6Mg50kYWmnr12js1FOt1MiV8+U6msudZ/XC7Pi/5DzPM8yhz1WXz4vffcJTO6p9WdTa6Vi3p0nVQBsX8p0y1uOzR6SgvGlvzz7tZI0wONicR0wZyJYTeOUg3XBgzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253969; c=relaxed/simple;
	bh=Zg03s2hcec8pcLMW810gAELvkRX8QR/iSEmoa02GEos=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Qpz3tfKSiT7OyfuLgcPWtwX0ucyjBsIrwfqdjcbpZw8Vt7w+IXuXsS8SgYz7gAv3xM0io0wg2A7rcKkNYAKURTt0Iq4Igo8hQUCL2rH5wc5FUBfFHAdmApMeVmeGzXs2i9LI/EIxgpCgLTwC7jAhJpsRGBqH2YS3rOdSqIA/U8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FUDNnPVT; arc=fail smtp.client-ip=40.107.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2W9dTa9WQp6H73InYYX55L6Tr8OTONQ418qn6SWMTaUSIRp1xwPrTrjhwjuYpx0jjWtb6jDdLaVLtSBFxe5v2zA/I3YUUv1qOpb1D93tUvNPXBCaUe7ghPpZrRAjItgEdflA2u7SU9hIMn71syqD86A0e9KokRBT+B40Zs0nH9T4xhP8Hk5L6p3rhmuBSS2+ESwW6tD8Mp1unNvH1PCEjznRVyAQ3cuothC5cW6zFn+THrnDEXV+TbpESPDEnQOjCzITJSCq/qzTt8NON4F6Gpt3Umlq6ogOsJINJ41O8HhrbFiab71DjNQ4i6uFJZ6vTmnxKKfEuX/BCH/+XZfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RI27N63iGUCBJ5z9khzwi8Kcjl32frc2Me8ogh96n0=;
 b=tfHfsxiYvwtSXNSnsRFQTc4+XniwpLkkNJUp/cBJqH67U4fi8EdobOHYotZxIXgJECfOXgd7E2X/zL/Ffvd+ywPTGSnZG18LvCBugOK+Ri/XP81MXXOkzZahy2o37sqoYKryWJU9jy11BZHyGR4Cs9pRAaQUA7x4Iz87GyVLwV1I9YToLpVSBsdLZaIThwiosTQnqm1jX+/Q6DBVGUfjCX7ZkTlxUX3NhkVdeBKY3n03g1Ishuli1X1DtR5RXHRd36gkHioCo0Jub1DD/zOKuQUU2g1Wv58BbjMOqWzimOhH6PSWU0scspjiA4WuAUwwFp74gQuCNiWgu7wrMgap6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RI27N63iGUCBJ5z9khzwi8Kcjl32frc2Me8ogh96n0=;
 b=FUDNnPVTI0btPv8bAXjmrJ2nhc+77rOrxqM1rkUR5Kpn03VgzWPvMjgT/3X+zsGnyOS85yV1Z3T4hy1jXx4MdzlZSDH6bERML1vUoakuIi/NmA2YVUecUROrCfKr0J+ZpoiF4sCb0rPtnyx+7xab14uohvhuJ3KLZcJxIPHR6Zz9EOTb5v4PA/lgFskkb+q/0Pr0oW4pUjotPd5rM9AHIVYQ7SZKBTjfKifAaiKmE5p9wt9ilnwjd8b/LpNmPSAe0ulHWDBeHyPVYlW+8opSwfu4Zvkd3mnPQ1bDqCkqOTHLIm1eTAFGmYzrxxdF5A/YAOZAW37C+kAV57aoA4Kp8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 10:59:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 10:59:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 04 Nov 2025 19:59:16 +0900
Subject: [PATCH v3] rust: enable slice_flatten feature and provide it
 through an extension trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-b4-as-flattened-v3-1-6cb9c26b45cd@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAITcCWkC/3XNQQ7CIBCF4as0rMUwtEXiynsYF1AGO4lSA4Rom
 t5d2pXGuPxfMt/MLGEkTOzYzCxioURTqNHuGjaMJlyRk6vNpJA9gABuO24S9zeTMwZ0XNgWhe+
 V0q1i9eoR0dNzE8+X2iOlPMXX9qDAuv63CnDgWgkv0SI6706hkCOzH6Y7W7EiP4HuF5AVsKKTT
 h+gN/obWJblDdJ4PULwAAAA
X-Change-ID: 20251101-b4-as-flattened-0b3e0f566836
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0187.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 334510a4-d9ab-44bc-f5f7-08de1b9136d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0JrdGFBTlNPL2VoR1pOdUtxUTFraXRKYkNyMFVJeTdCcjhCdXA1ZFViWTlP?=
 =?utf-8?B?Ym1QR3loL0xyaUhtTlQ0M245U3MweXllQ1NMN2tQcGs3NEtCRUxwZ2YwMkJ0?=
 =?utf-8?B?aE1MUDlNUXhDZjhjeXpwZDlXT0JveWp4TjFGYmY4RldSSG5Bc0hjWmkyN0s1?=
 =?utf-8?B?R0NoaTZZT1lFMUFQL2JvZVJIK0hHZ2EvMVBBN1Q3TzBGUlBUUGkxR21GcUFo?=
 =?utf-8?B?V1czdjhkSGlDTXBlTnUrNkpmZmQ4bXNEYk82SlhjZHFGNXdwWFQ5L09FT2gx?=
 =?utf-8?B?aDRsdVJjM0VWU3pHUG1kQXdXaEswYU9NM2c3NklyZThnMUxhajZqQmNlSk9M?=
 =?utf-8?B?UElTcDd1VS9lQndoTWo1THZlL3BZL2syMGZRbFBJYUFCbit6SWpyRTVxMmZX?=
 =?utf-8?B?SHpQTEVKRGZIYjdacFFrY1d1WC9sNVpUakVTN3AvdVptYW5wTi9zbjEwY0tq?=
 =?utf-8?B?S1I3TkNqcmNYN2NKZS9wWTBMM2dUbTBoOC9Md1MvdmhLVnFtaTlORmcxMmdT?=
 =?utf-8?B?dTNoOGJURHJBSG5WMXBPMFhUSnAyNVJvb0R3bUpFK0hyNkZISWlrVktXV1Nr?=
 =?utf-8?B?ZW9rcFY1QnpyOG1IcDJRVVV0VUhCL0Q1aEhKaWRBQmhDWGVCWVcvcmJRSXpU?=
 =?utf-8?B?MTBHd0dqdjdWMU45VWRtYjRrRXpwSFJQVWpaMDZOUU1xMlpHY3dIMFlBZk9Q?=
 =?utf-8?B?aS9obFM5RXE5NEZqakZ1emo0SElMcWc5bkQybkliblBHVjhBRjBEbFczWXVa?=
 =?utf-8?B?L0NnRDh1OXdEUDQrWmovdnUvZVUraCtJNVBJcnp4L250VEpOeEh0VWVmV3I3?=
 =?utf-8?B?RU9MZWtMeVhLb1RyaTNGRndVZ05HS2hUSVlpL2NqS2hkOWo1T3dkSVlDa294?=
 =?utf-8?B?UlNGK0dLZzVZWlRGTk1MWHZyYlFLaHdPZkpyRk5UUmV5Q2RlT05sTHVkUzEr?=
 =?utf-8?B?NHdUN3RwL3FkS0hwYWNBN2lIdDcwR05ac21RZ2ZOdHpHOWRteGJxOXJVVDZL?=
 =?utf-8?B?WjcyeklGTTFNVitYTVBLVnlRZFRYMCtDWHd6TlB5VEw4dkhoS1c3NnRGYk9E?=
 =?utf-8?B?T0FrdHVlRVRZQnVwRUkxR1E5enFzemVTMGkxekdiekx5d2huOG14cDF0V0tu?=
 =?utf-8?B?T1c2UDQwT0VWNzQwYnQzOWFaODVyNWZrQ3lkK2hsd3JjTVFORUVlTnFzbyt0?=
 =?utf-8?B?TVRVcXpxVWduN0hSdFRzazlJejl3ekxWMGIyMnNQMHA0V0JNVm8xVEZKTGZx?=
 =?utf-8?B?RWxrTVhaaUNKQWdNWnZDQk9mNnVIMmN1VGFzeE0rSWhDdDljaSs3NEtBY1lN?=
 =?utf-8?B?aS9YMC9BcXdYWTd2V3h1a0toRWFxclErZU5tQTFLSC9RS1VsTlNLeFkxSEFC?=
 =?utf-8?B?a2M0MFZtbTdUdUVWRGZlNkhVWVdkbzNtQ2FNRjZ0ZEJ4SE12TURmckJESitE?=
 =?utf-8?B?RTczN1FrT2JuODFKa2oxZFk1TFBGT3JBTU9ybTk4Myt2SXZqUmZtNHJoVjlX?=
 =?utf-8?B?d1pSOFZEeFd6dklPTURWNlgvL0JQRXJ4U0c4d3I5Y2FDZnhSYW9lZXp2OXBx?=
 =?utf-8?B?QUhNSmJTa1hvcnJ6ci8vYTFhbE5WRU1QblI4Z2I2MkFxeTY5YnZMMTQzZ1hC?=
 =?utf-8?B?aksyeEJnYVRlVTdzL2VXRTRQNkhoR29zZEdMZmx2MUJIQTZkaHhqZEcwZHQ2?=
 =?utf-8?B?RFJDdGovcjJKQWNDSGtlWHkxaDhzYm5LMmZhRktEQkhMTGhOSkN2MVplMElB?=
 =?utf-8?B?U043WVc4YWV6YkE2ZEtxbmE4ZmUzcFAyUzh0UHFGOFVTNy94bkI4bHV1VEM4?=
 =?utf-8?B?MGxZcTZWSFRTeUtNN0dXalFqalovZ3pvcHRSU2tzbXN6ZWJPZ3Iwa3hqcXFt?=
 =?utf-8?B?NjZWbmNMZ1kyZ3I4VlJMd3huQWJ3L3NYTVNQRGZDamhtV0FpVG1taUJWeDZI?=
 =?utf-8?B?WWNaNVAyZUZvK1UzK2dtbGVEUWhGNUx4Q0VMN1Zna3FqcEZEQVNnR1FPb09P?=
 =?utf-8?B?K2dnbnFXQWcrWjdhUHkxN0htODFGUGZOSTllUUJYU1Q2RGJESzN1a25OdUY4?=
 =?utf-8?Q?WOzdhT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm4yTWgxWEcxV3lJZXhmc1hnTnJjYkZ6aVlhQmszbVUyKzdEc0JWUVB1d2Vu?=
 =?utf-8?B?elhoYUw3R0NRYUUzczREWmEwblpGRG94QlQ5aDNiNklWRy9lajlHRHZiK1pL?=
 =?utf-8?B?QUFuSXYra1lnSS9acnBjZEM2MEUycHYrYjNwdnloSTN4VVpUTVhHa0ErbUNy?=
 =?utf-8?B?em93WG5sWWlTV2hEZ1phWDI2d1FXVlZBQ1RhV2x4djlJSGRSaWphaGJhdnN0?=
 =?utf-8?B?OEdPcTg4dHhLK2hOWVpFRTRialhHWWV5a09VTEdTZkVOL0xLbTVFZHY5emhH?=
 =?utf-8?B?MzZDTlozWDA2YkdPeWpTWmZaTlZhT3J4Y1JyZjkvNUN4ZzFWMlRTOVhTbkJW?=
 =?utf-8?B?bmw2WFF6NTM3QW1HTksyWDBWTjk2R3dpSnZMcFVJWVo5MTBheGFZR2tmSCtI?=
 =?utf-8?B?cWlGeXdjU3RTL3EzUjZOcVRXZEx2d2lKTk1ZSlkvY2tyczZnSjc1R1hSTWlT?=
 =?utf-8?B?RDVXOHpGd3o5b2x1NStwY0hET1lvdnVWSzBPTWQwaUhYRXMvNGFmWmNod2gw?=
 =?utf-8?B?aURiOHFwazZ0amhRN2ZyeE9DblZpVndRYUU3VnMzTVVjV2FaOCtzczA0ZkVQ?=
 =?utf-8?B?UkZGUmtqOW5acUdBeFExSGdsUWxOaTI2VUFiSjNKYlVKV28rVmtjNTk0ZENX?=
 =?utf-8?B?MGc2TUJ2T2lrbG5Ock9WbVdXeTBoZHkvM1RmWTBrWTNybUlOSzdvYVhVM1pv?=
 =?utf-8?B?cjV4eWhCR2t3aVVVRGVMVGlraXJLS2Zxa2krUElES0dCYTZiNUY2aE1ZVUd1?=
 =?utf-8?B?cnNpaFNJdG11dVI1ZEZtRFdnQWRuZ3NONzNIT2dRdWNZR1NZVDJGcFlsWWpF?=
 =?utf-8?B?cDZnYmRHaVhBQnNCZmpVS1ZmYTB4c3RuNHk3YkhNa1FzZ08rZFhBOHZ5ZzVy?=
 =?utf-8?B?QmpxL2FuV083Z3lXVHh3b2lZU3gxeWE0MVJpTVVGck5zZzhpckhSSnBEd3E5?=
 =?utf-8?B?VWZHWXBIekVyY0gwSFluODZaMmlaWDFBeVVKSVdlTFRBOTlmQWNON3U0YW41?=
 =?utf-8?B?amN0UVI3WElzaG1qSDZTYi82cWE5cDM0anIxQi9JYW1MSnEvRTN0SkRtam5F?=
 =?utf-8?B?c3NGVk9YUzhrWUE2dUcwRmdlL0hUdHdpbURQQnJYamc5cTVISXEzT1BvcUlm?=
 =?utf-8?B?YzBqUDVVaXhpOFBmT0NWUVlMMVpnT0tJZWdkQXE4a2lxOEpsY3hiVHVTMnMr?=
 =?utf-8?B?UVN0VFgrWGtvMzRibVIzNHVUQlNqNTl1aEV1RDk3TndJOGZMTVpMNmF3VkQ4?=
 =?utf-8?B?VVFUUXoyU2Zua2c5Q3hUZ29OQWVNZkh5M3JNQkZ4ZlFFbVdWUjZWR2UzSmJW?=
 =?utf-8?B?MDNsZGV6SWNuK2xpclNhNUtweGNSMkZiMzA3OGdEVVg5TzVNbmVFd1p3ZlI2?=
 =?utf-8?B?VnB0cVZIUTljeDNsWXJXUmlKQTBLSDN4LzhkcTVoc3pwYlVrMnMyL1lXVlRU?=
 =?utf-8?B?eFNZeldYVnNIUUZQRno1ak1TWEpQejlKWUNTNTJZMjZBbFRSdHB2OVFTdjNX?=
 =?utf-8?B?aFA1M0NYTGtIRTNnZHBSSHhiY2pNRVg5bmk3WEwrMjZSNEFWcDJXaEIrZnFD?=
 =?utf-8?B?R1h0SlVKUGVpQzFPYkR1SWFoN0xpSTF3b3B2REZtWTVBMnAzRXB3ZW5tYkxO?=
 =?utf-8?B?L09wTFg0VFZENy9xdXp6T3ZtbmpoTUh3d1ptOTNWUm45RGJubEpVQm5lN1dj?=
 =?utf-8?B?M3RkUjgzRHJzOFc1SzBjL25pamZKV2s1WE5nWFV1MnM1b21zM2k4c29Tb3hP?=
 =?utf-8?B?UjZudUtZTHJyK1R1NWNBaG1IRjExNGNZZEpTMWk5TitLczlmeElhWDFxSTdt?=
 =?utf-8?B?YTFLWXlHVnVVUEEvTzZaYXBNZUpBdUhvUHgweHgwV1VGSGZCbG9OOE1zVGE1?=
 =?utf-8?B?Z2FnR1JNTTd5aUo4RjNoZWpxdlRvMURMRE1VY2Y0WjUxeFc5OFBVcXZwRGU5?=
 =?utf-8?B?Yy9zQ1JuSUZIWWF3VWV1eWZ6QlhSaHJLeGkzS0VSdjQ1TEtWNTBGSjJNbHVY?=
 =?utf-8?B?R2V4Mlpic3gzU1BJbjltNjV2M21sUXdnU0JzN0l0clowYUFtZEFtZmJLS0gx?=
 =?utf-8?B?WE01ek1FSkdoYnQ0bTlRUkNxQWVNczFURnRJbjFNSXA2YnVsSEVhSE9tQ1dh?=
 =?utf-8?B?S25ac2YwY1lvM2E0YUk1cDJZaG9IZVRHRGRraFBsak5COFVCUndYUUJrQlVz?=
 =?utf-8?Q?YibWlK7omNSfKxSFNQVrEGTH5ZiHTeFQ2uZW2N+EWfoH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334510a4-d9ab-44bc-f5f7-08de1b9136d7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:59:23.8802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yqpl+h+VzUZkQbO2tP1fZW2ytOfxLAxNbjA+kWTcGJwKdgfs/uuoVTE28VPnH6P3hQstQAh+x/q2Laa8JUpSww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890

In Rust 1.80, the previously unstable `slice::flatten` family of methods
have been stabilized and renamed to `slice::as_flattened`.

This creates an issue as we want to use `as_flattened`, but need to
support the MSRV (which at the moment is Rust 1.78) where it is named
`flatten`.

Solve this by enabling the `slice_flatten` feature, and providing an
`as_flattened` implementation through an extension trait for compiler
versions where it is not available.

The trait is then exported from the prelude, making the `as_flattened`
family of methods transparently available for all supported compiler
versions.

This extension trait can be removed once the MSRV passes 1.80.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
This patch was part of the Nova GSP boot series [1], but since it
requires attention from the core Rust team (and possibly the build
maintainers?) and is otherwise buried under Nova patches, I am taking
the freedom to send it separately for visibility.

With v3 the extension trait is now imported if needed in the kernel
prelude, making its use transparent from user and not requiring any
user code update when it will be removed.

[1] https://lore.kernel.org/all/20251029-gsp_boot-v7-0-34227afad347@nvidia.com/
[2] https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
---
Changes in v3:
- Include the extension trait in the kernel prelude so users don't need
  to conditionally import it. (thanks Alice!)
- Link to v2: https://lore.kernel.org/r/20251104-b4-as-flattened-v2-1-b042d8715a8d@nvidia.com

Changes in v2:
- Rename methods to `as_flattened` and `as_flattened_mut` to match
  standard library (thanks Alice!).
- Only expose the `AsFlattened` trait if using Rust < 1.80.
- Fixed a couple of typos (thanks Miguel!)
- Link to v1: https://lore.kernel.org/r/20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com
---
 init/Kconfig           |  3 +++
 rust/kernel/lib.rs     |  4 ++++
 rust/kernel/prelude.rs |  3 +++
 rust/kernel/slice.rs   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.build |  3 ++-
 5 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49..7da93c9cccc3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -147,6 +147,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
+config RUSTC_HAS_SLICE_AS_FLATTENED
+	def_bool RUSTC_VERSION >= 108000
+
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe7888..2581a356d114 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -21,6 +21,9 @@
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
 //
+// Stable since Rust 1.80.0.
+#![feature(slice_flatten)]
+//
 // Stable since Rust 1.81.0.
 #![feature(lint_reasons)]
 //
@@ -128,6 +131,7 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
+pub mod slice;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 198d09a31449..9ee8acc563de 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -51,3 +51,6 @@
 pub use super::current;
 
 pub use super::uaccess::UserPtr;
+
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+pub use super::slice::AsFlattened;
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
new file mode 100644
index 000000000000..6ca91a4fd1f2
--- /dev/null
+++ b/rust/kernel/slice.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Additional (and temporary) slice helpers.
+
+/// Extension trait providing a portable version of [`as_flattened`] and
+/// [`as_flattened_mut`].
+///
+/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
+/// have been stabilized and renamed from `flatten` to `as_flattened`.
+///
+/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
+/// by different methods depending on the compiler version.
+///
+/// This extension trait solves this by abstracting `as_flatten` and calling the correct method
+/// depending on the Rust version.
+///
+/// This trait can be removed once the MSRV passes 1.80.
+///
+/// [`as_flattened`]: slice::as_flattened
+/// [`as_flattened_mut`]: slice::as_flattened_mut
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+pub trait AsFlattened<T> {
+    /// Takes a `&[[T; N]]` and flattens it to a `&[T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
+    ///
+    /// [`as_flattened`]: slice::as_flattened
+    fn as_flattened(&self) -> &[T];
+
+    /// Takes a `&mut [[T; N]]` and flattens it to a `&mut [T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
+    ///
+    /// [`as_flattened_mut`]: slice::as_flattened_mut
+    fn as_flattened_mut(&mut self) -> &mut [T];
+}
+
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened(&self) -> &[T] {
+        self.flatten()
+    }
+
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened_mut(&mut self) -> &mut [T] {
+        self.flatten_mut()
+    }
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d0ee33a487be..a84b9e3171a3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
+#   - Stable since Rust 1.80.0: `feature(slice_flatten)`.
 #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
@@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_flatten,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

---
base-commit: 6553a8f168fb7941ae73d39eccac64f3a2b9b399
change-id: 20251101-b4-as-flattened-0b3e0f566836

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


