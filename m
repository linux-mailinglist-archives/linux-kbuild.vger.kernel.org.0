Return-Path: <linux-kbuild+bounces-10804-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM3JDDwYcmksawAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10804-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 13:29:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FC166A38
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 13:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD87890492D
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 11:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34D2449ECF;
	Thu, 22 Jan 2026 11:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fTM6cdJ/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020115.outbound.protection.outlook.com [52.101.195.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17429350A16;
	Thu, 22 Jan 2026 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082217; cv=fail; b=BHxDTrrR+XUK8QLWyUH8bMC5hqo2ueBkR11OFEti/B9UnwWcy4KfW1SWJsQhcgrJgvhO7QYbhBxlTwDkKmVMLIRbHcfbmqTqNKGvqvGOHXSSwG83USGuwKI5+RiyK0RO7ChoBq1hWJIR6vwBoU3sQNEGyCb+x9WiV6kop1nGMKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082217; c=relaxed/simple;
	bh=nIWL39JMUA96+AcjEG861ooh3Kd+gxAvGCyi3R1U25U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GuW5H5ZY9fGbAAt8oYM9YewaTaa4BttA6B/w5WABOk2ADcDKwXwQZirVG4z5rmCC8Wof670nsFywRZVUXVPODoK+px4BTR5qRFJ3aBighiwpxJo1yMMR8sskEIAXh9UUmZeWW3kmHcCQ8hsJGcRAH7aGlOspEql+r2H1xdz16IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fTM6cdJ/; arc=fail smtp.client-ip=52.101.195.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZ8HDop4Dsc6NUzW45ANU7wKupGQ6L9ThUyc74BRK/TlAI6inPzDPCQwzlAa+F8m4J1O7a2NFrAI3fAUeRuA+/4WAeLGjYtjzrCnpzX0c1cBZxd4KmP68qLjsgrkayLNgsh0IIFnG3jdaKaS4CbYnz6hzBr6jc1NsWAmkFBXdipT2TzFUCKyYMgh2e5eTK4sOrySSiu3Sf4yg2JKY3Ez3Itb6zTD5EQhrkcq0tYSGt2pbOWTPQ3KEn66uUIY0N/H4Wb8FcMXMavd3x5/a1zlnxV/YsuWajxRQvEZ1CmFKyxC6rRmCkKdd2sLyDEfyxtZF+KfdMZEtLplpFF/rhuPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgZ2elwX5fv++IrGtSkTUqJChfwXANYaITxWTDzgXCE=;
 b=LNbwZD7SN8++ZhnUzLg96AkMVbXzBB9kAFTozOsJ6mOeE2o2ySAzqa1tsZ35zC6QdJnWIotnSBdjIHrQDoko6ua3IQjYPAI3/qZVCUc6s7GAqcNiS0+2W08fig0sKb+oGMPj54W4r7VICDnEdEljeR5UsNIjmB4h3EpZCrO9FCAttj0iaUmb53JVEzdjIp41bo/7uGgx2sHMl1i9UwANo4Lr3Y2VaEOzx+agOKGdT1N20lNOaFG6MPkQoDvfPE7OVPti4Lz0EXMUM6/755C681ST2sBY8fDL0cZ6dM/fFaIUEa8q17woenJjYITbySCfAdjoVke9OTIVsbFFGtFa7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgZ2elwX5fv++IrGtSkTUqJChfwXANYaITxWTDzgXCE=;
 b=fTM6cdJ/yRqMrooqAf7YTtFO0/6pN3SJINgVtgqssFioU3J2IuWEasTsvn9UJyyLnyXTZVD9zBckWuucsk0B2pCy6pE29AzCAvp2PSab4t9ZWt0MlXvEWRGmZfbf33DlIvn1SgQJEMQqpVN6864+qWQhD2CxYELkOB5mUwCEhig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2515.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 11:43:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 11:43:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 11:43:30 +0000
Message-Id: <DFV3AZV2J4YJ.3CQRIB59QRYBM@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] rust: proc-macro2: rebuild if the version text changes
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260122054135.138445-1-ojeda@kernel.org>
In-Reply-To: <20260122054135.138445-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0129.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2515:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3e6b86-290a-439a-ab0c-08de59ab7723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGNwT3VMUmtsaXBJOWFIMy9jMml0Ty9pYU9zdlNBaE9LWEJvU2VPNEZzVzkz?=
 =?utf-8?B?b0pwQnZWWnhYZ2FRTkVqUXpCZGJodk1KQkM1aFllOGdCYmZmdFNJOFBzTTIz?=
 =?utf-8?B?QmRHblNPU3pZQUhWV0ZGOFBKbDh3eVZTL1lzeXkxMGFCSk5QcDZlMko3L0Uy?=
 =?utf-8?B?RERFcWdRMkZMS3pwbVlNMGJKbmpKazlBVE9vM1FHM2EraWVIQlpYQXRtT0hJ?=
 =?utf-8?B?bld5Wnl6VWEydXZ1Q1NidW1EMGJGVnQzcTJ4b1kzR055cWo4b2VzYjRHcnNE?=
 =?utf-8?B?TENzc2pZN0NXeVI2L3UrTWJWaTNnSFNDdlJTU3VuS2tialVlMVBwR3VwVi9Y?=
 =?utf-8?B?SnRPZ0FjRWRhbDVPVy9hRU5FSjdRZG1TMkRTd3dBVTlTQUJ4alVsd0lYcUdZ?=
 =?utf-8?B?YkUwNVdkSHVJRGN1R2VaV2F0OXEzK3M1Wi80aVBtN2o3OU91K2xzdkR2aFdm?=
 =?utf-8?B?SmsyeGtvWXIyRS9VaTExNWhXZ1dSVnRXVElLQ3VmRHhjZWxrTFpXQUJlNW5D?=
 =?utf-8?B?VFZGL3Znd2JwVmV1VUE2czNYT0t6dzZrUlJRSlpPeUJNejZSTDRIbmVEcGRL?=
 =?utf-8?B?ODdJZDUrZkQrcWYrL1VNSHU2WCs2NUNIaExuWUdiMUxCT21HRWI2Y0M1MVF0?=
 =?utf-8?B?U0E0VGhMMmpnVnRtZ0pmTlY3d2d0K3NST2ZWaGxmcy9rdzg2T0xSeHRyTEVt?=
 =?utf-8?B?NEwxM0JnWk42MXBqSFoxYVdhcTBzM1dYUUFzeG4vaEVwYjZiR3FLaThQMDR0?=
 =?utf-8?B?UG1pU1grRWl0SDNwTjIvazVZU1FxdzFVWnNQOFdSN3JVWFJTajRhckxkS2Y2?=
 =?utf-8?B?RGpjby9CZmxQVjBXSWsxZ3JFb1l1OWtwbHVSdGwrYm1oZllvRzFlV0cyK2Rz?=
 =?utf-8?B?Z2FEVEVNVVBmMHlabEYwbXY3Q2dQRUY2S1F6TGF1Wm9uZEdiYmFqTGVONzBJ?=
 =?utf-8?B?NzRxYVNIbjRhOTFoUjVRQjhJODk5NkZES2RPdldSdEE5bjdGTlBkaStGRDhK?=
 =?utf-8?B?WVZPdHoxN2E3N0dWQ2YzclJDdGZYdndqZ2dUQzM3TTZJZkVRcXlkZURDay8w?=
 =?utf-8?B?dk0wclRjUHRKRyt6dlBPZmpIQ0NpVW9McGpiT2ZTb2lERnFMdFhucjI5OTA2?=
 =?utf-8?B?TFY5QU9QR2NlRm90WU9JTnVVRzZ6eXFQMGErYnJsY0NWUGZBS3RVUVJ6YUtI?=
 =?utf-8?B?RHV2OEZvYkRVNmVpVDBRT1A3cjZoNUpyZ1ZvQXBsYzUrOUtuRFpSZWhZbklu?=
 =?utf-8?B?eHpjNTRxbUVUQmNFTzBjOEorMmswOWRkUTFYeTdpVlFsNVV1RlBDV1M4dmd6?=
 =?utf-8?B?dEdSUXlab3hscDB4RTNpNWw5Vy9yMXJhUU5GbmlYS2k3VllxTnBHSUZRelk0?=
 =?utf-8?B?c2NSZllPbmk0NG5xamd4R2NzRkl3dzQzMkdQQmxpSUVjVnkyUnltc0IzMVBW?=
 =?utf-8?B?a244MmVzQ21RUHVmT1R3OXdQYnd3UmQwYWdyTUloekZSY2hBM2ZvQU83czRB?=
 =?utf-8?B?aUR3MFFndDZEbXhFbk9KSzNza1lPMlpzeWJxdVk1ekhleHBYdUFIQ1ZYanZa?=
 =?utf-8?B?T1I3M3lneGwzMThQWitDV0lEaE05NkRWOFZOTVVoNWxsNHlnOWhsVDJyeDRm?=
 =?utf-8?B?bENyQ3Q3OG5DWk1zYnZDR1BBWWZBMXVFaHRiVXlMeHZSTFRIcmVSbU1lRHZv?=
 =?utf-8?B?a1NkaFlqRXk4YWQ4QnFQYTlWZ2hqYUxGalZ3S2dJbVlsekl4TkRNTWQvS3ph?=
 =?utf-8?B?Q3dkZnpIQkd5bU5TTkZYNE55dVdjem0yYWs5TmRsaml3Vnd5bGJSN2VmQjhp?=
 =?utf-8?B?ZTRQMGdXL2xKMzZoTUNXNVViaXdCblZ1aWhqdmVheXFYcGpKMTZha2ZKR01j?=
 =?utf-8?B?VWhZU0VndWwwR3hVb3g1V0F6L2VPb2lmM3pTdmwxbFRwRmt6TmJrblBNdmFS?=
 =?utf-8?B?Y0tFRHV0VTE2UGNLTzVnTlBYSlgzQ1B3Y0d2NmIvNGZrV0o1WkRiL0x2VnVS?=
 =?utf-8?B?dmlMOVlnVGRnM2Q0ckVLRDVIUGxQNFlCMVM5ZGxQVDJJcyt0NktZTG5KTFZm?=
 =?utf-8?B?UEZvdXJ0bFJhRitVZ1hRR1JSZWVNNExUSmVYckJINWJpNkkzcDdRQkdSamJk?=
 =?utf-8?Q?B7bQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkNwb0Y4dGdhK2VXOWVsb0Nla0xvWEVxREhnSmFFVjJIdlVBWnd5YXFIYXNp?=
 =?utf-8?B?SmdjM3N6a0owSWFua1JySTg1UkJ2c3R3Z2Mzb1diakJQS1N2U0JDbVBvRHRr?=
 =?utf-8?B?a3VkZ281bHlsc0FWSjlEcnNLczJBSVI5alZwU2JScDdBSGRSWkQ1OXBRckNQ?=
 =?utf-8?B?bkdvTkhTSVhnSnZMTE85NHd3UmErZllhZHF6cjFveC9qNjEzYjRBcWV3VUJG?=
 =?utf-8?B?ZTRYYTJrbU1iTkxBRjc4YkxFbldCK3VmMlN0K3pLK0Rwc3hOTjA2RFBTUW1E?=
 =?utf-8?B?U24zVlBPb3NzcWlYaUtyczY1Nmtaanl1L3ZNNGpEeTBTYTJVdVZFUk01d2dF?=
 =?utf-8?B?M3dIa1pXNUxPQjRDaEZWUEUyYTMzRGFDUWJFYjJlajEweDFDWkdVZ3EvZytV?=
 =?utf-8?B?Ty9tcE5EMVZhdEdGM2ZqZWZBdjNPOUIrWlFVaWFyMmsxM01QNkdjV1dybVNB?=
 =?utf-8?B?dnZsTnJFcTMzMVBac3FoNDVhY2RHL2QwS3lXUGs1VnFublhRUWxVbVYzQzVY?=
 =?utf-8?B?WHN1VE0xU0VJU3kyaS9paGZYVUJ3dDROOXovNUFDL1dnTWlIRGx2V1JTZit1?=
 =?utf-8?B?YjFpbEZDY0l6MDlkSDFiMkl3V1ljRll6QXBGRXBZODQ2bWlCSG95bVpxelJT?=
 =?utf-8?B?c0NqZHJ1Vyt2QytLVlQ3QWJNRlVOSE4zbk91MUsyS3M1TXVHNUY3U1l0N1Bk?=
 =?utf-8?B?SmtuYTdEaUo4elJDaDI5d0hrZDFoclNoQkVMdnJISUtwNmRBRXNZeFgyUDVH?=
 =?utf-8?B?OGlVSGhEQjdDOEl6V1Rxc1ZUeG5pZTVsWGxaS0M0ZHZGR2pFbGlwYzRGM2ZX?=
 =?utf-8?B?U3A3cStxMk9HSEhtYk94WWlSWGdvS3lMSjd1aDhHVUdEcDlDbWVuU1JCMk8w?=
 =?utf-8?B?VUt5MFNJdWxRZzF6Y2lXeFdrVFVkQm8wVTQvblE4am81bmtFdmVpN2pJQzZz?=
 =?utf-8?B?U1BtL1dNUXBrUnJjd21QOFRBTDY5RFg4TFhkclVLS0FYcnNsNHlDdEptMXpr?=
 =?utf-8?B?cnp6Sml5dGdNZWFyOVZoTU0vS3JqUDhHT0tQUFIweUFHVnY4Q3lUK0Qzc3Nv?=
 =?utf-8?B?ZmFLWnNjQmVhNWFrM1kzTmpaRWlienFpTENFT0IrNmIrUVFFOVR5Smh1WUJh?=
 =?utf-8?B?aVdMYVJtYkZWaEpDalc4Y3JwL2VnSXRkc3V4c2RmeXZRT1plck5hYmNyWVFK?=
 =?utf-8?B?emNMQUpZSHFnQjdwN3FmbDUrWHdSOXJnVXpJMm5kaGR3RHV0SjZQSlRrZHdi?=
 =?utf-8?B?N2hidi9lRktLTVJ3WVNmSDhTWTNnenljUVowZ3FZWFdkTmZuVGJkWTR6MTJD?=
 =?utf-8?B?N1hwbHR0ZkowNHdRdDBxUUhGSlB4dFVjNytwV2VYaHlNQisrVEpwallqOVJ1?=
 =?utf-8?B?YkJON0JNT1ViWC8xSE5qQU5SckpKZ2dtQ3ducFdSYldkaVJBUlpza0lFNUJ4?=
 =?utf-8?B?d290dUFEa3FMTzlEeFphMmVMbXVpSnZZYzhyUGVoTms2V3VmNHp2d081S1J2?=
 =?utf-8?B?KzFEcnpZTUpVRnh5R2VaOEJ0aTJLbGpKOTJNVnpEUlZtaWFvc0RLakhiOHJE?=
 =?utf-8?B?YnBSOHBta2NmeUpMOSsvNjZ6WGpmaDJQSWp0b3RpWndMbzYraU9KY0tIcldr?=
 =?utf-8?B?KytNbXkrUWlXRGh2QVkrRnVpVDZGRFI2TlNLb29vVE1SYXRqbFozcDBnd0NM?=
 =?utf-8?B?K2J2OXlKZ0QrVTVKb012S2YyWXowdWwvZmMyUlNFTFVXL1dMQTNPVThHbTVy?=
 =?utf-8?B?SzVnZ1ZmQ3VEOU9WeHh4bm84RGhQMTVKMGJVVTJQWmZnMnZQZVVKM0xadVZS?=
 =?utf-8?B?UCtOUWllOHNIMEUrd0oyTGtERmFkY3BQV3RBSmtnYU90d0Z5eXBRZC9LVFVE?=
 =?utf-8?B?ZFg4ODJHcE1lWWpiT05lSWxSOUVtREh6azVHbWk0bmxWenBNUUNDWUFqZ2xk?=
 =?utf-8?B?ZldjWk1xR29RT3ZRem5oUFlRR0U0a0M2TEdMaUNPTVFxNGFsdE0wK3dYWFFp?=
 =?utf-8?B?RnhyWHZiMFdMZlhYa0JGMnlwTDNVNUQ2ZjJoR3BMRU8wQlQvZ3UwWGxOcjlL?=
 =?utf-8?B?YXFQNFp4bklmdkFWNkZROTFwME5jK1p6SEpXTldXZUZDRTFxUm1yNDRack0y?=
 =?utf-8?B?SDgzK0k4ZmJ2L0IzRkxweTdJdy85U283NlFrS3YzZzhUSkEvMEYwK1dpcVRw?=
 =?utf-8?B?SjFhSjN4a0FHOWxmUUVrTFdvbE80WjRkdHlzN0dDRHVFcDlLZzVqR3gxbDZV?=
 =?utf-8?B?YW9MTG4ycXZXazVHei8zeWlDa2Myd3c2d2JCc0t3SlY4WTF4cnpMaW9YTnVY?=
 =?utf-8?B?SDR1MjlRQThjNitGWHA2Qk54c3R1dG9GRHdyYnhNd2dkZ09zd1d5Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3e6b86-290a-439a-ab0c-08de59ab7723
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:43:30.7234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KratuKJ2wLM0mKsVv3Ga7rzfzhlhWQQfItux15lPg6R5NyF7q58aVGrWYZ/jcp7bTlZko8NY4LjV2qScvUMU7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2515
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10804-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,garyguo.net,protonmail.com,kernel.org,google.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[garyguo.net,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,garyguo.net:mid,garyguo.net:dkim,crates.io:url,shields.io:url]
X-Rspamd-Queue-Id: 76FC166A38
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 5:41 AM GMT, Miguel Ojeda wrote:
> The Rust compiler cannot use dependencies built by other versions, e.g.:
>
>     error[E0514]: found crate `proc_macro2` compiled by an incompatible v=
ersion of rustc
>      --> rust/quote/ext.rs:5:5
>       |
>     5 | use proc_macro2::{TokenStream, TokenTree};
>       |     ^^^^^^^^^^^
>       |
>       =3D note: the following crate versions were found:
>               crate `proc_macro2` compiled by rustc 1.92.0 (ded5c06cf 202=
5-12-08): ./rust/libproc_macro2.rlib
>       =3D help: please recompile that crate using this compiler (rustc 1.=
93.0 (254b59607 2026-01-19)) (consider running `cargo clean` first)
>
> Thus trigger a rebuild if the version text changes like we do in other
> top-level cases (e.g. see commit aeb0e24abbeb ("kbuild: rust: replace
> proc macros dependency on `core.o` with the version text")).
>
> The build errors for now are hard to trigger, since we do not yet use
> the new crates we just introduced (the use cases are coming in the next
> merge window), but they can still be seen if e.g. one manually removes
> one of the targets, so fix it already.
>
> Fixes: 158a3b72118a ("rust: proc-macro2: enable support in kbuild")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/proc-macro2/lib.rs | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/rust/proc-macro2/lib.rs b/rust/proc-macro2/lib.rs
> index 7b78d065d51c..5d408943fa0d 100644
> --- a/rust/proc-macro2/lib.rs
> +++ b/rust/proc-macro2/lib.rs
> @@ -1,5 +1,9 @@
>  // SPDX-License-Identifier: Apache-2.0 OR MIT
> =20
> +// When fixdep scans this, it will find this string `CONFIG_RUSTC_VERSIO=
N_TEXT`
> +// and thus add a dependency on `include/config/RUSTC_VERSION_TEXT`, whi=
ch is
> +// touched by Kconfig when the version string from the compiler changes.

We use the same trick for multiple crates now. Is this something that can d=
one
in Makefile or it has to be in the source?

Best,
Gary

> +
>  //! [![github]](https://github.com/dtolnay/proc-macro2)&ensp;[![crates-i=
o]](https://crates.io/crates/proc-macro2)&ensp;[![docs-rs]](crate)
>  //!
>  //! [github]: https://img.shields.io/badge/github-8da0cb?style=3Dfor-the=
-badge&labelColor=3D555555&logo=3Dgithub
>
> base-commit: 2af6ad09fc7dfe9b3610100983cccf16998bf34d


