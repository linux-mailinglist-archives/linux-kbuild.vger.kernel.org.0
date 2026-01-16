Return-Path: <linux-kbuild+bounces-10611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F76D30945
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 12:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 126FF301E175
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 11:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A537936D4FF;
	Fri, 16 Jan 2026 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CIjB/s2v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022080.outbound.protection.outlook.com [52.101.96.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82B36999F;
	Fri, 16 Jan 2026 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563789; cv=fail; b=Ckgrq4lxWsFiGv4pCAvIgSdXXRwC5+N0Ml6Zz1jYuZGzdDTGCWqqgd2wbJptYCO1l8ghelRvwuc37QOjtoVGndamAtHgMI+MlQ1FserVDfL28BCn7larHo+m7T7L6hs+sGLzAfRCbCvfpTovn4bdthd339sbzXt60ngCoycL5r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563789; c=relaxed/simple;
	bh=pPc1367E9qXd1hmYcd3BauEvyRvqpAREohzbD27EGLI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=CUuM06CXiYYu2qlF58uFIXwIK61YoNZgYqrmIImK2Ynls0OP0jL2hh0ecF9C9o8kMCqv0zfZgGxfY8Ow0yfdQDc+X1vDoQrFJraGmIjIOnA9SuLBTW5PDYPRs7/sH5KPXXcZElSjgLJLr41YYPDznuY4U7aj3dvhyfacCGYQt2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CIjB/s2v; arc=fail smtp.client-ip=52.101.96.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuNCIB7FG58GtejkIxFNHR+IW0g2hp5DuTdRv6g7O+oBHsR5icfR51HLmxJn2TozceiWLDPhs2KclF1Xv5pxZGVPRV1ypruMaXW5yrqWIQGpEgmuHoAbuqWlEjBYMdLamiJ+PJjAXa4QGl07I1BJU936x45JEFELSYH1kbx+3UcFnjCOMApSR2YfP9aCEebzAjAMQm0nNhmwhaapynv5HRRmOQs85/F68OhMUWe+7XerfdvgsuM09iKCI4BhAJ3V8n91B/HXO0FA3E7VChD4u4hm2DGkPwzSvS+FQZ1Cegl+cpbKbs7a/9Si1/Zzxt5K691aPOC3H98ZuMB4FDbSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHkmEtLqI8sMuj//v5GvKBd1WX8KDPIuxIweToxYSoU=;
 b=JVKfYkbJQ6YR7hCeB61ghK1mfjX9quoOXAsOBFOi5bsihb0gBAOCdMe9FSbrKqzXO9ucREN45FnaKjor9EEmrBEa9+H7U8xNG4FEfRs9V/z7NR7Q3OHwdIZuvso/Z8zhugCxgcMvQkNEiGJTv/dVuPlMuRRW3O2UaFN+xo/t0fk4qvphjAoVmERin7xhG5oACg7OYVS6LqL++IBjKQD/35cBX+VExyKxEFJQ16wUyvtb1L98rXzfg60xo+SPLmN87w6Heh2IClY9Zy8IQT1vlQqubkp858gCLnM+ct4Go/aYCJmiqP9toNj8SlauX2Tm+d9gYL22it8iosIKEKVkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHkmEtLqI8sMuj//v5GvKBd1WX8KDPIuxIweToxYSoU=;
 b=CIjB/s2vOwgJz0pRFOPFf0pmJ6KyjwGwcqgMwTC4LTlfO+s3dZEK+jmoy5Ry2h56dCv25arLELoFw9B1WfNlopqlmMA/XAp2ljBSN2qnBNdaQXW/1PF4KrVtwIitKJU9P0eRiTJvMj2UBAb746l/U1KhM7qHfHeYqXCejaSjCRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7528.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 11:43:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 11:43:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 11:43:03 +0000
Message-Id: <DFPZJE4FZ9IY.3P0266KCG8VBB@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] rust: kbuild: give `--config-path` to `rustfmt` in
 `.rsi` target
X-Mailer: aerc 0.21.0
References: <20260115183832.46595-1-ojeda@kernel.org>
In-Reply-To: <20260115183832.46595-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e5161b-7ab2-4f56-e890-08de54f4690d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWFUUDNCN2JLdUJ2NUpHWFNSNUdqUmNROStFQWZmaDhmbUJ1bjk1VVM1Qjhy?=
 =?utf-8?B?MXF6NnpVUm55SS9WR0duc0RuMUFlUDJkMnBqZFBJeG5telgwUUk2Z0c0THRt?=
 =?utf-8?B?WHJLVzMrbjI4bW1mYm1UOTFCdUpJSmd4T2NhblVOVVE2SDJ6VGJUd05ZUVN3?=
 =?utf-8?B?VFVLSzRRNTJhc3BFYTFRaW9pakY4ZXY5UjNLamJBR3h2RnJ0Q2ZMOEMvSU90?=
 =?utf-8?B?OGJRUjJQUVd5WEE2YnVhb0l0RHN1MWExRVR1dnFEazU0UENETXdzOFdqVXpV?=
 =?utf-8?B?Q3BwaVNSTllZTFg0UFVPNHhnQkk1SjNDczdBTEs3eVVhT2RheTZCOWNEVXhT?=
 =?utf-8?B?U2ZTVlZJNDVid1JzMjg1aXJwVUR3cnU0MGtMODd2ZWY4SE03K2dMYmwxdnN3?=
 =?utf-8?B?MXorZjNTWGU4WWFUM3R4aUxUQjFHRVZWT0pjblFFVmJ4cGtLWVhVRFhNeS9F?=
 =?utf-8?B?UUFjVkpCT2xTRE83VTU3TXJzcUtjNm5rYTdKNStFYjRCZEhpdURlWDl3Z1Vi?=
 =?utf-8?B?dk02U3lVekxwVjg5bHhLVUhHQUxqcWVRay96ZWdVZ01HN0FITWlNaGkxYW80?=
 =?utf-8?B?a2Y1S25GSGVaUHg1aUlzdFprMmFTY25kVFVEd09pR3FYa2c3N0E3S3Z0RFVG?=
 =?utf-8?B?emRqcW5vQkVMTGU3NHRxcnhLc2pscXZhaStDQ2R0RitybFFSVTIvd05DRG5J?=
 =?utf-8?B?ek1vTU1lQTdCYnFCQm1UbWVpN3pUWWFoeEJIWWZIWElFbmpaZk9sVzJRaE5T?=
 =?utf-8?B?ZnhYY09WdUcyVnNTS010OXpZRXZzS1JvYkxHVnduQ3JKQzkrWTVJV0xnZHBO?=
 =?utf-8?B?QmhqQTAvQ20vbnF3REhpZ3R0cVR6UlZ2by9sbUowWkJhMTZ4blpTb1d5RWcx?=
 =?utf-8?B?TzdvSWh3SmdLKy9PYm5XMnhPSkRnSlJtWjR5YW1LbzJ2V2Juc25jSVcyRzdV?=
 =?utf-8?B?b1dEU09HR2tjM0RSK1hxa1FCSUwvcXJGWXRvcklHL0ZRNjdzNUZoaUk5TFpw?=
 =?utf-8?B?WHVTRWhwS3h2MjZQNmc4TTNqWG5iMGQ0UGhabVozNFY4Y2RhbmNIaUhNM3Zn?=
 =?utf-8?B?R0h0eUFkMlI3UzhkdWFzbXVtSkpFRXQwM1NWZXRFa3VnWkw3aGUvMXVVcFB3?=
 =?utf-8?B?LzM2QndzNWE3Q0FwZ2pJa3VNMjZFaTR6SDM5UDNoTm9tQmR3RUtzcWxmK2xp?=
 =?utf-8?B?UG5qekFmdFo0WldNNmZ1TjJpeGY2bHc4S0hrVEw4RDhHcUlIck5sdEFybytQ?=
 =?utf-8?B?cG9Mb2hsTUhQa0s5cDF0cGI2YVArSGUzS2R2ODdwOG5xMllpSXRveFZxQ2hj?=
 =?utf-8?B?TklKcGNCeHBNOUc1VWpsOTZoQ01ZOFZPRHVvTDdXTlo5TkprQW5mUWM4YWRy?=
 =?utf-8?B?eGNpNS9vREl0UEZZUEt5SjJLbUdUWjl1S1NQMmNjaXVBelA0WFUwUnNIR2R4?=
 =?utf-8?B?M2ZNSmxRbFdGeTB0U0tFVGgzVzgreGxXWHMyY2dvUTN6OVVsODZaajV5cFVD?=
 =?utf-8?B?Ry9sMUV5TDhQK2cyTXdPY2lEZDZnUTM4N1dDMUIwV2Z5ckFONlVXOVc4VldJ?=
 =?utf-8?B?ZHNKSEVJZkZkcmR4STlGcVJocVpOSWk0MVRXKzNaTytrNkRuWkdrOXZNZy9H?=
 =?utf-8?B?LzkzNGNCbWtPTkQvMjlKMGZOU1pXZkk0RzdUSXNKc0ZUbkc4SmUzYjRTcUNm?=
 =?utf-8?B?ZVE2bkxLRDE5Q3VXRStXb1c5ZTZJUnJYMWFQT2pJWGsvdnlHRENBNFIzN2wv?=
 =?utf-8?B?c0s2Tzk2VVJ3Ri9qWGZNTEx6V2VvTmtjK01idXZoalRYMUpNelhSd0V5bVcr?=
 =?utf-8?B?TGlNeE4rZW5UdzhTdkJteFQvL1Y1K1RSbzVDZWlPdHlFbGt2ZlZyd2VkU2ha?=
 =?utf-8?B?cC9aVlE5S3NEYVYwRzU3K1lLa3NEQklrRVdlU1EwazI1QVc5MTJnR0V5WXZ0?=
 =?utf-8?B?Yzk3WWpVZVBpMCtLdjdBYW9tcVBVSHdjN3BkWTRERlM2SXNEZTlKT2Nvb2N1?=
 =?utf-8?B?YTRVU2YxWnc5SGVkcXhadTF6MWZoMHpZcW5ITHo3d1FWV25ySE1NR1BuSWgy?=
 =?utf-8?B?by91eEFIWndJUm1iLy9HVVp3WWpZL0Y1eFNNbGxvektxTFlPU1E3aWxNYVJ4?=
 =?utf-8?Q?wrCg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlNZL1BtZjA1MlhQRHV2dlhRYjZyWk5pZ0FKY0JWRWFLTTNzbjkwTGZDRFRm?=
 =?utf-8?B?UWV4L21oeld3a2pHajRlaDRUV0c1Wk90cXhycldIcU9xYmVwN2hLbU5XVVNE?=
 =?utf-8?B?WlV6NlRMR1UwMkF2SjZUNlBlREpnOHRzVmVYb2NGeGtzNmF1RFlTK1BJUUJN?=
 =?utf-8?B?WXVlNmZxcmV5WGtMQ2NEMUgyYVk1eDlSVE84dXRwbXh0MmhaNVp1LzIvVytn?=
 =?utf-8?B?cjAxVHRvOExHd2czd2ZkSitjUEpaNS9EOVF3anJEQ01tYkcydCt0VU5iYkxo?=
 =?utf-8?B?eVpMTUdXNHcvWmxWdlVDQWhhdk9wYzNvRWF4RkJvWUg0M1VCbDBHdzlhZEhm?=
 =?utf-8?B?TW5HRGRzdFpwVmR4dmExR0Zwbml5SEFuRW40TmsrdWRTbG1kS1VNY240aEF5?=
 =?utf-8?B?MzZqOVVVU1Y5ZHBSeXZGdXB4VFNRTnIzUFlWVkUwenk2SVppTkZiYlV6V1BV?=
 =?utf-8?B?SEdkeTdTUmhXaFVkOGhXWit1ajhDN0VFSm9YQXdHdFIrVHBxcnBsVVdJRW5Z?=
 =?utf-8?B?RlRHa3RMdmdkSTZOUkllTjF1M1RmYkFUckhBb2FKSFlFSFZ3aGZqOE4xbEhi?=
 =?utf-8?B?cEZleGR1Mm9oTTBVeUtqTDRFT0xQTWJwSWw4RDFGVUp4N2VkaXB5NTJ6TzVo?=
 =?utf-8?B?NXkySjhCbkp6RTJUcnM3TFRaUFNFS0h0YTY5WXRwRk9qQmRSRThabUJORFFa?=
 =?utf-8?B?aldnYlAzREdrRWl5Snh2U2VibmpNZmdteW4rTXhxeDFMWnh0UVJMMzNUOGNY?=
 =?utf-8?B?SXd2TTZtZS9zbHF3SkN6YmNkOWJQUWJ4bVNrZnRaVDNlSkJjUUVlUUh3NGt2?=
 =?utf-8?B?NTlTbkowVHBhL2t0U295enUwYndQdmJYTlRXNVZtY2ZaWUIveGNWUmNieEZm?=
 =?utf-8?B?UzkrSGVRaHAyTUgwUGg0Wk9xOTdKRXY5OXB3NzRhSko0Wkw4eXRqZFY1S2M1?=
 =?utf-8?B?RXRCNG83TnlDV3g0VFo1c0lVYlFpdGg4eWNKNEpmMlpUaTVTZ0I3NmdWTm45?=
 =?utf-8?B?UmdFSGhncU13OUx3bzRMSlN5NVJjOW8xNGJNM2FFaVUvNWFCV2F0b3dnSjNy?=
 =?utf-8?B?Ti9QTHBJSGVZWWhyYkRFckxEdDZSeGNDV0hxa3FoTlI2dkpUd014cmpzdW54?=
 =?utf-8?B?RmI3bmpwUG9QQlhzY3IxV0kyQU9kNlJvQWU0cGNxMGxuc1dSWVV3MHd1UWM2?=
 =?utf-8?B?WWxrVTcrQklPS3JNWnNEQUxBc3hxUkZRcmFJTE5WY2s0aUp1cHF1Tko0UGhB?=
 =?utf-8?B?V2xSYWtYdjlOajluOFh6bHFkS0czWVVTRE16UmZGT1FuYWJIUUJJK1pJdHFL?=
 =?utf-8?B?akZJeUV2emlubWhCS0JEUHhONVByekRhSUxZTUpIMGRhc2lwU2IwTHNqZlpk?=
 =?utf-8?B?aGdhdmFteFRtWUM4SE1vVVE1VVhxL2xyVFRnSTcxQ3g3L2pBdDJzemtydGRQ?=
 =?utf-8?B?dUZnS1Y1cHlqYUNFaWRzWEY0SDNoQTRMbnNKZjY3aGdMNTBBbFdxWHVVajBB?=
 =?utf-8?B?R3U0aVdRdFZWLzVrOE9lOFc3MXJ2dDUrNWRHSzI4VmVRVTFhUlRxZExDejRu?=
 =?utf-8?B?OTJ2QW5oWGVsWGxTVXhXMjI5S1JwOFkxMDZnd3BFZFQzVFRkbnZnNlg5SzZn?=
 =?utf-8?B?ZVJja25YZjNxaUlBTCtkUUt3UWNnZWVuMU1mdDErd2VsWUhSNitzVGRmQkRu?=
 =?utf-8?B?MWJFWUVkRW9NYWE4L080OG5CTXhRNzluMFVHblB3STlDdVd1RmtZNkx1dVV5?=
 =?utf-8?B?ejN2VmhGb08rWEFhMGpvdXNrMDA5cjRZd1hjRHlKNXByQkVvczcxZnp3RERh?=
 =?utf-8?B?dW5DaERwSHBndWRGUTc2TmZPZ2ZxaElRQmZWaFdoOVJCMzV5Ri84MjRmWGZY?=
 =?utf-8?B?VHJzZW9oMUFJbnlVMFI5Mm5PcUFoWG96RXdGYXUvRUZEVWM1dmJ5dWJaWDI1?=
 =?utf-8?B?SVNCdGxiYmhiRU53OFhpNlByTDZQQXhScnFXUStuRlFJQnhkT2pLVjNxV3hF?=
 =?utf-8?B?RlUzWDVuSWNmR3pwb0JpbVp1KzhrOFVXYjR3T1BvWE5GSzJlYlF3aWYraDhV?=
 =?utf-8?B?bkFDUkRIbDg0SmtqQzUwbVQ3ekQ5TnBMUEpWUUE4RWRjUlBUS0liNDBvcmRw?=
 =?utf-8?B?cGorbmJ0K3B3a213Qm5yS3VDMVdISWRvbjJMNXlhNGVkSVd5VlpsZkF5KzVO?=
 =?utf-8?B?OWVkYUFTcXJObk5IaTBzYzYxc0VNeVpRUTdNeFFzRjN4aDdZNWgyNVBKRG9F?=
 =?utf-8?B?OHZVaUN3dEl4NkxJbW1xMisrK0dZS3BLdFZKS0NxdEw2c1haWUEzamllQURV?=
 =?utf-8?B?akhET2RySmV6aElLaUhMbEE1ekdESjFOUVJqY3JFNjlTMjFlOHk1QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e5161b-7ab2-4f56-e890-08de54f4690d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:43:04.5126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBoJNk8Vl5kYeV8zUpR1ngYe06GTRKuRTD9QnnzmKXL2r3R/5GotmCqpzoHy4mkFe04YV435daYHZAwDexmbyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7528

On Thu Jan 15, 2026 at 6:38 PM GMT, Miguel Ojeda wrote:
> `rustfmt` is configured via the `.rustfmt.toml` file in the source tree,
> and we apply `rustfmt` to the macro expanded sources generated by the
> `.rsi` target.
>=20
> However, under an `O=3D` pointing to an external folder (i.e. not just
> a subdir), `rustfmt` will not find the file when checking the parent
> folders. Since the edition is configured in this file, this can lead to
> errors when it encounters newer syntax, e.g.
>=20
>     error: expected one of `!`, `.`, `::`, `;`, `?`, `where`, `{`, or an =
operator, found `"rust_minimal"`
>       --> samples/rust/rust_minimal.rsi:29:49
>        |
>     28 | impl ::kernel::ModuleMetadata for RustMinimal {
>        |                                               - while parsing th=
is item list starting here
>     29 |     const NAME: &'static ::kernel::str::CStr =3D c"rust_minimal"=
;
>        |                                                 ^^^^^^^^^^^^^^ e=
xpected one of 8 possible tokens
>     30 | }
>        | - the item list ends here
>        |
>        =3D note: you may be trying to write a c-string literal
>        =3D note: c-string literals require Rust 2021 or later
>        =3D help: pass `--edition 2024` to `rustc`
>        =3D note: for more on editions, read https://doc.rust-lang.org/edi=
tion-guide
>=20
> A workaround is to use `RUSTFMT=3Dn`, which is documented in the `Makefil=
e`
> help for cases where macro expanded source may happen to break `rustfmt`
> for other reasons, but this is not one of those cases.
>=20
> One solution would be to pass `--edition`, but we want `rustfmt` to
> use the entire configuration, even if currently we essentially use the
> default configuration.
>=20
> Thus explicitly give the path to the config file to `rustfmt` instead.
>=20
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


