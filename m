Return-Path: <linux-kbuild+bounces-9358-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06725C2895F
	for <lists+linux-kbuild@lfdr.de>; Sun, 02 Nov 2025 03:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DF043AD49B
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Nov 2025 02:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602CF1C84BC;
	Sun,  2 Nov 2025 02:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TdYkKLXA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7752F56;
	Sun,  2 Nov 2025 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762050326; cv=fail; b=pAWQBBjloF8Aciq5n7v+L4DOIqkmcHnA/SWic+b/S2nmyONqrBLlcDi0hKCF8g8c7O/ojPW1rRXhLtCl9AABilGfSFrjtqvXOX1g1moZZcPBK26BmixrQU+9hA65aDWtCozlj7tx1w6CCmcvOTvnLbpEMih5Oi5PnXttu3NBpfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762050326; c=relaxed/simple;
	bh=HNxHvOkCJWX5+AdBnZKudydORwv/PcDce6zGCdgLGHo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Ou/hqOu4ej4rIfrKDlO9vqBfAaUX9KfLYHFBd7suq/fyNaNEK6AwmuKmfnC3qKnwgGVMyY3YyRsdEewd0PAtMAKcnIq5eoePwZ0e830rOGDwvoHhPnEYq3DEBB4UFwVm+NUDGB1zUe72IuL5HB++CpeaPlW0C925IlUqGoE1rdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TdYkKLXA; arc=fail smtp.client-ip=40.107.208.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEX48VupIbjctKXKcKgcBdLeoTpm3zAPw2MrlJHLSxojeXKRV20ufhXr9sELDlW71vizb0TgCk3Bmxz72RnHy5kGmQUYI28Ogqm7ieRCSWZlQqw5/HJgq8IybZeM8bqWCgO4vyGSdnx9CEsiJaquiPZ/Cyx+7fmjsMUsYte0y2Jy8rrdRHWK1gMeFOT8zhYD4o8tAtDMMb9wQfLUegbkOkWKZLoSSb8uK8KqKPnYhzZBkFonzQzWoh1NYctfAQGU6+tnLexUP5Mu5yYIPAF8FCqO8M9j+/cOlCE4r1B7PTi/c/JMWAMbyptCPuLAJ1w3aPne13Ly7aYsehz+JTxveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vE+0k1Qo2y0Hf76sPowhCCzBxRq0aYlfEL8n+7XzOqo=;
 b=sekE/EqJUlrB6WTjMdagdQ2vUMpl7/QPJbDS20T6+npnXgEyRwaxo5rXUPFi0AUidAf3NsFyO+JCT+9NrU9qF8z15qix7/gn5OQRGZOzxvKoik70R/uxSAnqGj8jikuAx9SxsE5fDl3clmuwnJXUJmtvJuqwVWGzYa9qdUYq/oK/rS4n5QnZrZ2cPDxTrbDuFH2Wrfv46MpE0uop8VwtidXKQdzkLb287QX/x8FH7x2OfwdLATJ6SyDoZh1yvoeK4o99m8Pn6GYnwcRzpjY3UgKl+2sR9/ELXHcscDb5MqgqpKh+1ImAAjw/AurrOTZH7f68wWBBE7DgpMMDWBEK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vE+0k1Qo2y0Hf76sPowhCCzBxRq0aYlfEL8n+7XzOqo=;
 b=TdYkKLXAmGIjtI7n+rhhYYq8NgruQ5P+plbpibCeQ7k90plbXTLm6of3maFieKgc9y1KYsMijXe2/j94vzEsHUihU4kZKJJ1MR9sX8oXHrKteby+bIDClo7wWZxBwdYBePBx++i7YcJVDJb4WSh7srUjQVELtfTOdJ6C052ZHHKjzEKexRmgQltNW+0oAesXvzCV6q7/K7O20mopYFoRgBbCQyZ0HBHGkCRXoRq/c7RnLc0PO8or18wjOZ+NeluNWqueSl99GB6XAnj4WJ5e5RixrF5T3EtNX5dq6+5Bzhn6idV8NvdPfK8moLeYOO0N+x1Xp7lV2lXCJK6OO/DhEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7284.namprd12.prod.outlook.com (2603:10b6:510:20b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 02:25:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 02:25:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Nov 2025 11:25:03 +0900
Message-Id: <DDXUPAELH6C2.3JK5JVGP87V8N@nvidia.com>
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
In-Reply-To: <CANiq72n6KLjA5XQmAhy=SRTnWY8sCCmp9ETnB-dTSVZ84-mjzw@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe717da-edf0-4232-42cf-08de19b70a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWF2N1AvTjRyQ2g2dXJqZGRFeXlKY25GMm1vZlR2ZVZOR3BtcTFDa1BpVXNw?=
 =?utf-8?B?YkxQN3dPZmhiTk5CTjlQc0tEMnhzbWNTK2FXeG9TU2pUMFRrVWhBMDJodzYx?=
 =?utf-8?B?UjkzWTNxbENYZFRtREFFMCs4SDNhTzVtcjJPbzhRZ1ZHSXloRW5kR1RVMTUx?=
 =?utf-8?B?bXhkZFphTnBSeW10cmdpSUpuQm1DNFNKYldZUWFKd2pPcDc4S3Azb1plK0gw?=
 =?utf-8?B?a2RFWWZBWi9reGV5bnIvcWt4TDBWK0ZaTjdjZGtWV0M4SjErUDFRWjJDT2dT?=
 =?utf-8?B?UXpNb2RxLy9XcmptbHV3UGxMSmFLemJwS1VKZFZoL1FFWmg1NE9FQk9uV3hF?=
 =?utf-8?B?aysybEgzQ2NQOUJzMmNFcFROd1YzSE5ibnBpZVV2S3Y0VTAxaGZKek1nOGNU?=
 =?utf-8?B?MGMzK3AzcjVUaERXVEwwTXBYVllGdVFDRkFWQ2JoR3ppeVA5bEJveFBlYVZt?=
 =?utf-8?B?dFBZd2d6a0YvelUySVlwWnp0enRORDNBM2pNLzVvSVl3MmQvUG1EbW9BdG1Y?=
 =?utf-8?B?bzFKNTUxQmlCZkNDUTBVTTJtOE8xYncvN1RhaGRCczRucktMRGwwM0krR2JN?=
 =?utf-8?B?R1ZWR1dGRmZsSUJLS2FKdFNRTkYxS3o5cCtpcGM0Z2tWUnRkOWNmZ1ZqeElx?=
 =?utf-8?B?UUpSWWx3a0djb004b2dPeGEvUkwxV3l5T2xSa3Q1dHc3bnVSWll0TEh3WE82?=
 =?utf-8?B?LzFtSG05RnA2ME1TQ2U3TXhNTzliUmZsOWJJV0RsODhzSXIvM0tDaFpJQ0RW?=
 =?utf-8?B?czlHOWpkMkd0V0FERDU5ZEFYbXZPeE9TVkZidklWY0lkT3N3WFBQbGE3TDRs?=
 =?utf-8?B?NTFqajRidFpoT2UzSjhOaTc4c212QkN4VUFXOWZoNlBFbS9acnVRMWRNRnhm?=
 =?utf-8?B?M2Q3Z0VBQ1dGbnZPcE92V1JxbjZqVER6M1VtVERLTDNaNXU2NGJ2UlNUTkYw?=
 =?utf-8?B?YjJsazNhYlRQZTV0WDlMd0QvaC9iZEFSaldsTUlETWszS3haYlFUek5nbGpZ?=
 =?utf-8?B?MGRNWjFoT3l6Zk1kNm5DM0pETG1NY1dZK0dIbzZDVFM1NlYvb2dEZzA5MVpz?=
 =?utf-8?B?OWVsMGRpZnZtVjA2SzJqY1k2RnZCQ3ZJTE9PeHRxQUVvV29SdzEwRWJGOFNq?=
 =?utf-8?B?dERiRVpHdktaS2lRL2RyQll6UWQxdnMybDVLM0ZDNEpENDNLa2lHSWVaMHhD?=
 =?utf-8?B?RjR2UEwvSDVyQ2tZWFR0VWRIWEZDM29oNDBQaG1NTGlxbHprWWh4Q3RMRG4w?=
 =?utf-8?B?Nm9lTGNZNmVRR1lNcExxSDloM3RIbnRySGQ5NXpLQ0hWMnRGMmdlWGJnWFg0?=
 =?utf-8?B?RjE1cXN4TkNJWEhBaHNYemk1cWZDWHpCYmlWL0U3bENFanBIbUV1SVhqZ2hO?=
 =?utf-8?B?eis4Y0FTUktjMGtjKzQyaW82M20xYXNZQkNuUHg2V3pqYkxaYUlEcjlRMWNh?=
 =?utf-8?B?bkhTUVRNeEZmTmhKaGxrWkNGT25sdEhzUGZaRzFtZlVpR3Nha0pBRDM5QjQy?=
 =?utf-8?B?azlWUjNJQ0NlSkU0TTBObk92cWpZbGV2WWh2UlkrQmYwUkRmd0djSVk2cHAw?=
 =?utf-8?B?WEV5RnBJN01CNDFsb1FjeEIzVzFZV2VDOURDd1FrazdGcUE4eHdNK1hXdjBH?=
 =?utf-8?B?Y1FZenNrNm1tQ2prV2p1alpTZE1pVHRMdXQ1L2IxeWpwM1A4UU52RmQwaFdq?=
 =?utf-8?B?ZHNIZU4xUjU1QkdiMW5rQXZjdGw3U2ppcXhCcmxJUk9QKy9qOFZoNlFKWjBs?=
 =?utf-8?B?WWFEMDlkb2FJcmo2Y3MwVStUcFJBUlRyUlc5ODJkV0tzRGEvY21WWXVGc09H?=
 =?utf-8?B?b1QwQ084RVJVamtTWEhseURzU29BSVJhVFNXb3djNWJHNG5wVkw0M25qaTVS?=
 =?utf-8?B?ZnVObGVVZnUwNVFSTmIxTnp2WEd2d3ZHbXhnbjdBMmd3d1dqYkJUTThoTzJJ?=
 =?utf-8?Q?CXsWHh5qRvYTZ0lzfbmh28p5/NkYkyNg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0NEdFJWVUUrbi9vRWpoY3hobUJQODg5UTA2K05ZK3VKc292aUNFSERURFNE?=
 =?utf-8?B?dlhKcDZFdkVXdFlSSkJxb0M0WTVJanpEc3JlMU5ZaUpFTmJFdG0rUUpsTDRa?=
 =?utf-8?B?T0d6dkRhNWVnSW03SWx5eGZQd3RmMjRiUE4rUktIamRiTXdvbzNIRGV6bmlv?=
 =?utf-8?B?NDFVNEJxSzVkY2l3elpvK2dReXA3NHNxQVRXS1h5SDNGaStXaGJVNFY5UmVW?=
 =?utf-8?B?eitROGYxaGNwQ205WW1FWjR4b3pOcnpuVTJNb0pEcmhPclBFanBGUmJKcUwr?=
 =?utf-8?B?eUhjK2JFNC9YN00wZkNKVEZ4N3VGeTVLK2ZpaXp0T3N6MDZacUdXb21jdmZj?=
 =?utf-8?B?SHhmRTA5ME4rVGJ2TkVjUWNVSDE2SDZBMUcrUU45WkhpcUxjUVpOUExiRVUw?=
 =?utf-8?B?ZUNKSU9aWUphdU9qS2ZwK0FIMkVyVUl5ZWloN0NJU2JMNU9zZ09OQVpDbWZT?=
 =?utf-8?B?bzFvZ1Ztczlzc0dDLzRYeTB5WXRaK1MwSjhQTnUzRktXTDdTanA3ZmpmM0tT?=
 =?utf-8?B?VVJPU2llT0JuOERVM0Q0ZFFwUWkxOER2V1ZZaWpDTHlWVCtkN3NMVmowU1ly?=
 =?utf-8?B?VGYvWGdLYlp6ZzVCaGRTZHpBa1p1L1UwN1d2Y1VRZHRIZzYyblJTQllBMnY3?=
 =?utf-8?B?ajVvY1p1dUtwYit2ejFWNHc5Tjc5dE9yY3FQKzNJQ0d6U1ZIRmE2Slo4ZFJE?=
 =?utf-8?B?N1JSWG5kUEg5U1V1ZGtkK1RYY2UwRWdzOFp0aVpSSE44QUdLeXk4bnNvdGxk?=
 =?utf-8?B?WkNSVERkN2N6SHhCU29ZV1hUNmJMRXJsSS9hRlRWL3kyYkFYb0tSZlVhZXZx?=
 =?utf-8?B?ZCt4Tm0xanRxYmVrc3l0T1VHQ1JMQjh6dHRGT1diTXREaTI1RnBLWnRwcGwr?=
 =?utf-8?B?MEpidkwrVWJGNERSRmtMeEhmUTNMWDM1OTREWDI0NlVuZng0Sk82ci9hSlpx?=
 =?utf-8?B?VStmZU55S2thb0NNK3J1UGtYZ3hMUXd4Q0JsVjhqZ0ZuaXhoNHQrU2NMSmRV?=
 =?utf-8?B?Z2wzOXd1MG0wWEMxY0hkQk8zeUJKcEFmdXhLVjMvamszdUR3TGE3ckFPTThz?=
 =?utf-8?B?cXhkOXRRam1lTmpTNUdmNlF5SlVsc1A0NUpWNTVkWXo1aDVPb1JKdDdZMlJs?=
 =?utf-8?B?bXNHaU1POGVWN2p2NnhQRlBtTXpNdGQvSnJUcWNYUmVPTVo0ZlJnM2RWeEta?=
 =?utf-8?B?Tkg2dGlmVU5PdGtCeFpXMkNpUkwvUE1iZ0JkNXBUOW1uZ3g3MjZwanJVckpo?=
 =?utf-8?B?ZEx2dWE2Sk5EL3BUL1BMMkFPY3NuYksrRWhsR21Fc0Y0OURzSmEvc1BXa2Vy?=
 =?utf-8?B?dUxwa0laSkpPTDZhWFp1WmhPMTVzWVg1L1pXSEk1bUl2ekFiTlMvNlllNXR1?=
 =?utf-8?B?VlRkVXJLV09NejQ1UFcrckxTTUtrUTluTFdxVlFPY2hHZUhlSWhURG5KSHUy?=
 =?utf-8?B?dHRUSFRQQmxaNkszNERBdDU0RjlGSmVhRE5LU2oxYXp2MWdES00xYnJVOEwy?=
 =?utf-8?B?QUU1ZERBR3YyZktQTnovbGJROWlZZWdNRDkvOU1PaXA3c2hsZm8wSjhhcXVk?=
 =?utf-8?B?elZjOU1FWlFFbVQrbmhZRC9yZDVOTEJhYVBEU1hPQWVkRzV6K0lYR2Y5WlBQ?=
 =?utf-8?B?RFNabVBSNEtCYVpnSXlOSHFuNDBuWnFPKzZQUUlkTzlSR0N5dkhIZEZva0dS?=
 =?utf-8?B?WEpscWZobEtXK3dkc3NyVjlYVzdLZEdsb09HaU4wbUxrYlNobXB5VzY3dXU0?=
 =?utf-8?B?cVF5eStUSTdKTW1hZkplRGl2TEhpbVNDTi9YdUlXYk9rQjBHMDFpVzAvbmI2?=
 =?utf-8?B?MUFQSjNxZDFhbFFTZkZsc0tQK2NLZk1YNTZ3R1A5QVl5UVo3b3QvRzUyV2Ez?=
 =?utf-8?B?VEVmT1dpS1A5RkJ5VG8xa2I0RFViUmU3WmdhNXkycytPTFBtajUxQnFxNk50?=
 =?utf-8?B?L3RSZ2tsbDlYMkpLRk0xZ3kwVVB6bWMxa3B2eFZrcW9zTERFUGxVeHRRclpn?=
 =?utf-8?B?eS9jeDltWTJQSjhndWhxRTJXcnJEeHVPcnRsaVNiOFRKcVErTE1mbkFXZVcz?=
 =?utf-8?B?SWxzRUdMS2NSUGZtNHdqSXI1Z3hkdFZtVVNkK1Y3b25xaVUvdC85M2hCY0Zh?=
 =?utf-8?B?bnNEL1FZRDJwYTA3MnJ4d2N5RVhTQmVyUnhOQ1c4ZDMxZXZNRFR0RWZlWUtI?=
 =?utf-8?Q?Wr4AqQEbT+4v8T/hzgrqIGUJNq4uQ0/63RdHlTNPaS8t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe717da-edf0-4232-42cf-08de19b70a95
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 02:25:08.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQa3Odf51GeWJ3hoOzDhKv44Z6U//jPjsI+3Meb6zHVseNLhAXUL9M2P3B9M2HrZHYThOMzHVlFlXmQnY/v4+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7284

On Sun Nov 2, 2025 at 12:36 AM JST, Miguel Ojeda wrote:
> On Sat, Nov 1, 2025 at 2:32=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> Hopefully it captures Miguel's suggestion [2] accurately, but please let
>> me know if I missed something.
>
> Yeah, this is what I meant and looks great -- thanks!
>
> If you need to use it this cycle in another branch:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Otherwise, I will pick it up.

Thanks!

>
>> +config RUSTC_HAS_SLICE_AS_FLATTENED
>
> I guess you used this one since they renamed it and since we don't use
> the `alloc` method. It is fine, both options are confusing in
> different ways, but sometimes the feature name is the only one that
> can be used (since it may enable several methods etc.), so I wonder if
> we should try to use that consistently.

Ah, I think I see what you mean. The `slice_flatten` feature has been
removed in 1.80 with the stabilization and method rename, so I guess we
would have to do something like:

config RUSTC_HAS_SLICE_FLATTEN
	def_bool RUSTC_VERSION < 108000

... and invert the logic in the code. That would run contrary to the
other `RUSTC_HAS` options requiring at least a given version though.

Also not all of these seem to be tied to a feature;
`RUSTC_HAS_FILE_AS_C_STR` appears to refer to the
`Location::file_as_c_str` method, which is behind the `file_with_nul`
feature.

So I guess `config RUST_HAS_AS_FLATTENED` would also work. I'm happy to
follow what you think is best here. :)

>
>> +/// In Rust 1.80, the previously unstable `slice::flatten` family of me=
thods
>> +/// have been stabilized and renamed from `flatten` to `as_flattened`.
>> +///
>> +/// This creates an issue for as long as the MSRV is < 1.80, as the sam=
e functionality is provided
>> +/// by different methods depending on the compiler version.
>> +///
>> +/// This extension trait solves this by abstracting `as_flatten` and ca=
lling the correct  method
>> +/// depending on the Rust version.
>> +///
>> +/// This trait can be removed once the MSRV passes 1.80.
>
> These paragraphs sound like implementations details -- I would
> probably leave that to the commit message or normal comments instead
> (we should notice we need to remove these thanks to the line in
> `Kconfig` already).
>
> Nit: two spaces above.
>
>> +    /// Takes an `&[[T; N]]` and flattens it to a `&[T]`.
>
> Nit: I don't know how one is supposed to pronounce these, but I guess
> it is "a" in the first one, like the second one (the upstream docs
> also do that).

The funny thing is that I intented to copy the Rust doc for
`as_flattened`, but failed to even copy/paste it properly! ^_^; Fixed,
thanks.

