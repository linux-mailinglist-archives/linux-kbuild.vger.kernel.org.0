Return-Path: <linux-kbuild+bounces-9362-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D3C2903E
	for <lists+linux-kbuild@lfdr.de>; Sun, 02 Nov 2025 15:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54A83B0675
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Nov 2025 14:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954601DF25C;
	Sun,  2 Nov 2025 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bHOoKn1o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011017.outbound.protection.outlook.com [52.101.52.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3D4F5E0;
	Sun,  2 Nov 2025 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762093736; cv=fail; b=CSK1nu89VvQ4tH+wfMs09y1ukLrRQIHOZsDMpXQ58xeQMrOpEZfsvcdK/95bXWBEqFXFd6PSvBASqKLoDnwvJ5Af1ZQSjzgfZpARsY3CQuHa7R1NCkC35bMb2MquKyLnhGrlW10TgCXTIKefxldWKttbzQLZxY4jLFzgWzlkI9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762093736; c=relaxed/simple;
	bh=3pV5sd//1knTaBAtDkbwNdz8r0C7dW4tKYsv0JlaDj8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=V5W1xTAePHxfdyYXs/Pu81QOjtn4cvj9Qt8UBtgdRj5p6GzI3y5agWqKIvEpCzaEkTC4aNlhYR5SL5VIugw5wmRtNhBX5Q/7CRbQqbyRM1uFDekmBnLiQFxEKoowcnH8n7PHJ8tibhAPdjwYKkXV4qhCN+CUwVR/m//fkRD8TkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bHOoKn1o; arc=fail smtp.client-ip=52.101.52.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/Zo6IR7NkOfHe0Cmlpg7zENHH2O0HxiS90P0Aut3RfrQnsVbRx8cJUpnvUdXhaWYJPruiAFR43bnSSYUq8g4GLb4KIrIwzzBFkoYgCOJ6FZN0zvrTHySzD+qreNLNT11q6bVAKvoHCuQfbY3EQcZneiaMVAtBuedsk9O0fW3e/xikSrdlAb5HON2J1Rr/pqk4/iAAv1h1vInq7zrHxrvvKZWMaCFTn2wl1BlFBtTmdx27x02n2qer2/1yJCky4j88BPcDnpPtgWEep+KFgqeUOrim8HGwN5MPpLP7Kzvo2x2bWcRReb38XokjB3lWn1GpSojQ/6iuQlKBMQvTJYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pV5sd//1knTaBAtDkbwNdz8r0C7dW4tKYsv0JlaDj8=;
 b=m3xs7UD/qSBdC88TzkXd41UKOnD4PzlPHNqPPG3gSToea7rL0hbpXb+ELl9q2C4UgTY9mA+me8fjgCy1qAvw2nzReK1NMGBBPiS1Lx9OEbJbrHwtVyi5UMye3OjBWMPvaBLdin6mctjCNOMWgfOzzl/svs5lCF7IV4opQVU31/CJgU8gA313TsUsRQ6Y2ydzPYzZ9QvIZmPc8Ck2VkVWlETH1ah0FXAltBNT1gDDUZFKAd4hfm80ZxL13ZiZ4KrMuaysU4r40nLoSvEj55+RkZxHqEZTePHv99tT6tddHkAJsQmhsj4idr9PD6nElWO1+8ZnAPMkKxYqCBHo0T3J/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pV5sd//1knTaBAtDkbwNdz8r0C7dW4tKYsv0JlaDj8=;
 b=bHOoKn1omHbfOblTnhYzqvDaFPbqSIjWTuN3k8lyZnmGOZJn5MQrgIhLKUEgZXIUbtzKHA9qYwFIjfLeVFfbNx1Uk6/OL7dEq0iEKUH/eCP8D186imecsCECzY3XxKwlE1Tcr9nkG+KII3C+NcVy+VYbjNw2e2Sj3mrPdzOIRcx31EKj5n8YyCu5yQpKJBkg3DhgnekIMa7oSWePx85vBxS4dTlRHqHRvvRec2ooEaY2bGep2Zs2AccJfXLkC7F01yOAiTjrlZy0+yL6XduTqDGbjNLeZ6kO7lWNWNp9Rxwtao5JFqQzyCkTD5Hw91vRIqn5Imze7nNvCUaiECxmPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 14:28:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 14:28:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Nov 2025 23:28:45 +0900
Message-Id: <DDYA3ECFG4D3.1H28762AJJ0Q4@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH RESEND] rust: enable slice_flatten feature and abstract
 it through an extension trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
 <CANiq72n6KLjA5XQmAhy=SRTnWY8sCCmp9ETnB-dTSVZ84-mjzw@mail.gmail.com>
 <DDXUPAELH6C2.3JK5JVGP87V8N@nvidia.com>
 <CANiq72nakhVrfK=pyz8VBo95NJHpoeDXRkqUBc4GXSdroYuAQQ@mail.gmail.com>
In-Reply-To: <CANiq72nakhVrfK=pyz8VBo95NJHpoeDXRkqUBc4GXSdroYuAQQ@mail.gmail.com>
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd38f73-16d7-418e-cf8c-08de1a1c2346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R013Rk9xTUpBRjZ4WG9DMDVZYllQTHlxNG9UNlNlRlJUVmU4YlNNZzZrQ1Mw?=
 =?utf-8?B?eDllMktSQUR4d29kcjkwMjlId2JJNlZvTE5MU2VmMnRwY3U3WWp2Q0Jsa1VF?=
 =?utf-8?B?OTc0ZHNUZGJYNGVadk1YeVBvL2FVejFnakNhNldOZkNKTVFwdElBeUpwT3dZ?=
 =?utf-8?B?dnNxd0xTZnBkNy9TWGh3MmVQNzFLOWlQaUZMUTU3ZHo2VjRITkl2dU1zZEx5?=
 =?utf-8?B?QkJ1UEFnbS9vUDZjM2Z0UWxnQUxKYnlDQTV1VTFHQitBZ2hCb2ZsTzVaMVdj?=
 =?utf-8?B?NFM2VE9CY0trbkhPWnROUS9tOHlxK1RNMXB6QlJSb1crMi9jeTFqWFUrTmcv?=
 =?utf-8?B?QVI1M3VMenhTTDZxWlVpaHRIWlArQzBHTVVSbzZzVHRaQWhmakFCWlBZZlVk?=
 =?utf-8?B?dmRWbTVYZFFMVXBnbWRDalBHbTZtY0U4NDV6eXM0Z3dYd294VHJENlpQQ1Bi?=
 =?utf-8?B?OVBlRTV5YmgzWmV6ZTh6YXU0emlPTURsLzBGVTA2OGh3aUxrTEVYdTFGRTJE?=
 =?utf-8?B?RUlzWWZGeFZFcmt2UTRHNVRjQWNadFFkcFc4SUlIc1lab2ZDTVludzBHQVFS?=
 =?utf-8?B?MThXUElIQ0hzd1VJU2R1b1ZGUmhmblNBci9zTnJpM0xrcy81VmJrUmNDNG9n?=
 =?utf-8?B?a2ZMbWhET1Zxc0p5bktTZG0wRVIyUUFNSnpKQ0RsazBUQ2pMSGZRQTkrSlQ1?=
 =?utf-8?B?RHZWSVBuZTZkaGFSckk4M1dLVGlVTXQxb3JQcytvVVpYVGx4azJ3QkhlMGRs?=
 =?utf-8?B?OUdpRS82Tm1GWGs4bCtoOG9lVGxTTWYvVVdLdGZUTlJxNTVJMVlrcDZsWm40?=
 =?utf-8?B?c2JveUhWdVVIdHg3SDA2RmlWMllwYzJqRVByemZsVVkwY2h0cngvREpzLytr?=
 =?utf-8?B?ckY3eGFKdGFXSmtoL0tRWlgvdDVacmJYTWlTY3dBaDJTQnVxUlo2dWt2RTh3?=
 =?utf-8?B?SCtpSXNrUDh3Sk50QXdKV0VsSXc2WGwxWDV2dnFkcVNyR2k5QVhwdnZUTDBN?=
 =?utf-8?B?Q1lzTXh0aHhIT3hjbE8vOGtIYUVFVytiYzV1QzNFZG4wMW44SWQvRmwycXhO?=
 =?utf-8?B?KzM2SzVINDNXVlpaOWZQSGNKUUtIcUdDMGhjbForSlc0dFhVY3BlbFJkSWpS?=
 =?utf-8?B?OEFSK3dXQnh0MWwvb2w1NC9EckcvbXhOYmx1cjVrYlhPbndxWGhPMTV1OElw?=
 =?utf-8?B?M0x2K01QTFFUQys2bmZabS9GbmFhTVZCVmdjMDlxT3hPVThOeXlIOURzbEt2?=
 =?utf-8?B?MDFUdjQ1VStVU213NU4ra09KWGZZcXpUWHVhNVlKTWMrTCs2bFRwanc0UXY1?=
 =?utf-8?B?Rzdhdk14Ym95bU5vbEhVNER5aEQ4d0RYbFk2bzJwQnBUellwa3QxcThmcmNk?=
 =?utf-8?B?ZmdBd050VTR5Q2t1c3g1eFdQTklCaVN6aVdoZVVjTWkyc0J2NVFpVWRTdWM0?=
 =?utf-8?B?di82dS9qM2xZYTZuMkJUcDlqRmVQRmU0SjBsZjU5bVR3RG9NME5nbklPbkhw?=
 =?utf-8?B?bkFkZGtxSDUzRWFpWnk3cklWM0VQUk43eUZsY3ZxL0VQZDhNK0FWY2ZCRnJ3?=
 =?utf-8?B?QnVqUUNlYXNUWklBNjJXSDBwVk45UU5pYzMzUW15dHpHNHVWOXMwcEFjMXpx?=
 =?utf-8?B?dDBDNFF5T3FLK0xoRmh1T2FQME5uOUdWNmJPejkzREozeWU1ZWdKbU1QeEsv?=
 =?utf-8?B?NHN3bGxFZ1B0L2ovQzI2WTlRcGZVelNsUkJtZTlURmpYR0VFaE16M1c3VDVT?=
 =?utf-8?B?Tlc1YmZwZGc2d283eDdsQVo5d0xGSFJlc2VTeVJRTmpYZytibVF2cnJHVnBw?=
 =?utf-8?B?Tml3dWVmdzN2aHVYZjRadmw0bXBuaWd4TzlOcWgvMlkrYjAzcnVoQ01xNHlC?=
 =?utf-8?B?MVBTdnlSckhrVWNNUmllUVM3UndKVmR2M2hDc3dIb0tqSTBBNURuK0NSZ3I4?=
 =?utf-8?Q?c0SJUekTryDtYsKjjxMEx4Eoxw4N7W+X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVNhK2QzRkFYRTNVQkI5VTU3STZlYkJpaWRmaEs1SE56ZDJ0c1RqR3ZxY3l3?=
 =?utf-8?B?TGJkaG5SUzNqeGg4L2QxUUFzak5mNzVCYUdXaEpzeUNaaHdoMUZ6QlhQeDFw?=
 =?utf-8?B?d3crdTVML2ZYR0FvcW00SG8xV1U4bXNucUlVS05BVVRRbkNmRXJ3Vk83N3Ft?=
 =?utf-8?B?bG03YlNzRUpVcEhQaEtKeXA3Wmt5dTRMTUdpcHQ3cUYwVjlCVHpjRTROOVc0?=
 =?utf-8?B?dkhjYlk1UnJiSnB5WEZDSTBpYTd4WHpDSWowMVFUOEgwTXFXVVBOSGNYYWtm?=
 =?utf-8?B?TjI1N1hXY1E1YzBrVlVYSnZwQ0hoRy9HeklpUGc0ZzlEcitBSkZubUpjSGpN?=
 =?utf-8?B?d2Ewd2xpQ1liR1R6SEMvTytDVlROM1NieUxSbUdZbDlVOGxvTWVYdzE1S0ts?=
 =?utf-8?B?U0FqTktGUWJJOVVhUmtobjVhM1BONzVERjFEaTJtL3Fhd3IxbGZjdGhmdHFX?=
 =?utf-8?B?TmN2NVdoRkw0Q1FHWlUwWVhLQXV0eEdka0t6MmVtWWFhQjdlWDZBdWd4VnBT?=
 =?utf-8?B?cjVRWTVFdDVlaHA5SENndnVkV2NHbEhRZkJyejc3RWwwVmlEUW1tVVFSTWlG?=
 =?utf-8?B?RnBFY3h0TjBibjVLSnBKMzcxMC9GTy9hRitQNlFPMzNyMjVFUDVHcUp2elhk?=
 =?utf-8?B?bmJDd0F2Q21PWGU2aW5rb1hYbitIQVdnK1ArNkN6cmdkNWE3dWhQQ2V1ZGlt?=
 =?utf-8?B?bzZIQ04ra00za3B6amEwOTBpQ3Z0dkQ2M0ZDbm13YzhsU01BbUZsSFNYcjFo?=
 =?utf-8?B?eVBCQi9HdHAxSndCdEVVT3UwYjAzM3BYSnFwazQ4R0dnV04rZWJHTjlnZHZi?=
 =?utf-8?B?ZTJES1FONkZMVndFV1FZalNNQkhnc2FONXFyOVlkRXpVRm1GUlRzTkI1Rllo?=
 =?utf-8?B?MHMyc3drUlBid3JpaXV4Qy91L1pIamZwUGwxUTExQ2lBVU9GKzd4NURjQlB2?=
 =?utf-8?B?K1JWbGpHL1BVby9PMUFMZStCWFE2VlRDRExNUk1zT0J3YlhBVTlNdENQRDYr?=
 =?utf-8?B?WlkzbHdDNkJ1NS83dFNDTHo2WGZ6MDRKOXhXL0pVZmsrM0FTMFI1S1BZbmNL?=
 =?utf-8?B?THVTZFhGcUMzaDQvNnQ1UFNjMS9ZN1BKUVZYNm5qdTlNaXpjN0FUdXpkRWZN?=
 =?utf-8?B?dURWYjFjVjVCb1Vqb0Y2bGsyTndrTVVPNGNzWGlZbk1JSXFLaXVDWTlkWUxZ?=
 =?utf-8?B?Y3YxdlQvUWlSRUZMZEZienZrS2p6dnk1c3pCcERUSEdTM1pOZjE3WUpWS2l5?=
 =?utf-8?B?MFNlelpNTWtSYWhUOUJCN21SdHNnbjlXMk5ZaTJCMzYxSUp4cU9DTXFOZHB4?=
 =?utf-8?B?WVZSSUQ1dzU3b21jOTZ3THRkUkgzMldldUNic21HTTg3U1dIYjd6cEloYWZH?=
 =?utf-8?B?MXRGc29Bb1M2dnJBV2JnTE1sUjgrb0pGNnNKSnRKK3IxQmpvaTRJMWFGSGFQ?=
 =?utf-8?B?U1k4Z054Nll0b1k1ditYMzB3b0ZGZkg0Q0hBcG5kOVp3UitiSlRZaUNsQ0xL?=
 =?utf-8?B?RWdDZTV6T212ZGNkRUU3UEg0MjRCVjVWa0ZrSElBOWZkTElEdjRyRDJhbEc3?=
 =?utf-8?B?SlI1YjdmTjNONUlnZWtJZHRvUVNDN0ppY2pkOWpxMzRaYlBLdEllWG9pY2o3?=
 =?utf-8?B?RkZLNFRoYnA5QnpGMFU1dTRnQk50S1RoTzh6Z1AvU3RJVWV1S0c4aG4rOFRM?=
 =?utf-8?B?ZVQycGlGdTZqbWdtQzBEeURaRDh4NzF0cldXWUpjVXhhRVpPVGhDbStiNzNx?=
 =?utf-8?B?SXo2MDdjbDhSN1k3cUZOVlNmUDJhUEMyT1ZDZG94d0xVbHBrVUN6TGM2Q1Va?=
 =?utf-8?B?c2g4NWMzOVBDbThXSEk1V3RpNHhkU1A0R3Nidk9qeGhOY2I2WFc4d2JrT25K?=
 =?utf-8?B?bG1DUVJOcHRodW1qSmQ0cCtPT05hbTJndlVxelRjOW1QTWVRRkJtRHpMaE5n?=
 =?utf-8?B?WW5FbTNJZG5DNkZyK3E4eUJ4a0xiMkFxQjlmelZ2Qk94ZnVyU3Q0MWoyVzFp?=
 =?utf-8?B?MUZDM2lOMG50bzVPNllMWFN0WEdiMmEyQ3hCMXR2d0IxYktrbUlNQkJRYThr?=
 =?utf-8?B?MWlJL3hneUxPMlc4VFc2OHlmUmE1c2d4Q3VSUTd3UDJacXpjUXhPbkh5RTY3?=
 =?utf-8?B?V2NhdWdMbWNmRXRsbC92cWpFT1dmT2lKcDRLUkUzN3NIbjFxaVhRMThsOUtj?=
 =?utf-8?Q?XDDtVuC6IjA9GkqZblhw2ChVhLEPf+Sc9kIsmx8rOyOz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd38f73-16d7-418e-cf8c-08de1a1c2346
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 14:28:48.7763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX9g3F8f/7TLsXmtsLb2KkbjJ0VCRhY0vCKi8RIMjup7U1rxrYinOU7p7ZHr9m9VPYMsK3Rr2Rino8OZkfV+9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158

On Sun Nov 2, 2025 at 9:00 PM JST, Miguel Ojeda wrote:
> On Sun, Nov 2, 2025 at 3:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> Also not all of these seem to be tied to a feature;
>> `RUSTC_HAS_FILE_AS_C_STR` appears to refer to the
>> `Location::file_as_c_str` method, which is behind the `file_with_nul`
>> feature.
>
> So what happens there is that there are 3 states: "not implemented",
> "unstable" and "unstable but changed". That is, one transition is when
> the stdlib added it and the other when it changed.
>
> Now, normally there are only 2: "not implemented" and "unstable", and
> thus using the feature name makes sense there, because we use the
> Kconfig symbol to enable the feature conditionally, not individual
> methods (and a feature may contain different methods or even language
> features etc.).
>
> There is also the "stable" state of course -- the features don't get
> removed internally when stabilized, and in fact there is a lint that
> tells you about it (using that information), but we allow it, so it
> all works without extra complexity.
>
> In this case, we have 2 states but the other ones: "unstable" and
> "unstable but changed", because `slice_flatten` exists for way longer
> than our MSRV. And for this transition, for the other feature, we used
> the renamed method name, which makes sense since that is what got
> renamed, e.g. it could happen that a feature has 10 methods, and 2 get
> renamed in version X.
>
> So I think what you have in your patch actually makes more sense,
> since you are in the rename transition, not the feature addition one
> (i.e. we unconditionally enable `slice_flatten`).
>
> I guess we could come up with a different naming scheme to distinguish
> both cases or similar. For instance, we could add `FEATURE_` to the
> cases of the first transition. Anyway, it is not a big deal since we
> don't expect to have a ton of these -- quite the opposite, hopefully
> we can get rid them soon. And I wouldn't invert the logic of those
> equations, I think that gets even more confusing.
>
> So apologies for the noise there :) At least I hope it clarifies a bit...

It does - thanks for taking the time to explain!

I'll leave the config option name as it currently then.

