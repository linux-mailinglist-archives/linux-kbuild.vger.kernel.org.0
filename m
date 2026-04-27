Return-Path: <linux-kbuild+bounces-12881-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBMILUhl72kIBAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12881-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 15:31:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC47473757
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 15:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6845D30015A9
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 13:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82103BD246;
	Mon, 27 Apr 2026 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MoKH/s+6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazhn15012034.outbound.protection.outlook.com [52.102.166.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE75311C1D;
	Mon, 27 Apr 2026 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.166.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296054; cv=fail; b=REzllNg98AoJy3QAeS+N/ziNqcdwhbI6lJ64kCrOejSA/cNeMo0zeLxkmEEeFyrOA6sBLyJZqj81NbQj7Iv6x7sIxkxaH/I34p51MPZRhF4dyrU496n6XiEllOsaD/mVo+6HljKkAQRnI3YMnQusQCjnsfbz3xVTBx84nVnXa1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296054; c=relaxed/simple;
	bh=OvuBrcgCgMjZOKkJkeLn+iPK3o2H8M7xVvcJRSVwcsU=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=u7UOtZ4m5224EaYY5rGTziT5z2pYrEdpYdnOv015xUCM2UIgVIJyhJE5NG/5PAcTIZDpuBInhiB71dAN9Yeu2uoT819sdGNmw0dRFZkxoATtm5y9rU2yGiy510G03fqkvrAykBTDF19aOawlY5DZoPO8jDOq+RFo82+1L4F3Z6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MoKH/s+6; arc=fail smtp.client-ip=52.102.166.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPF4pq+vRV6zxelBYu/Ozv3Zgd10K4cSzekJm1rcDldQt6+zN1H5ObkmVvrMSLnFsY045NhSCNqjIzDv9y6EFoagsaPJkeO82H+fPuGgb416MFPL5R3R5xa7y8n4LXHvNd9VuRw0kGDBKuCS+q5OrZQHEEXJDLbZVKku1KhwHgRbHoCFZuPJ38QsSVMn44SRtaK9KzSf/xXrrm6E/auQc1RrXJyjJLf4JY8ZQcTtFnw03hYuF39fi/yNOI+QfybitHwGp7StzgFX+zO3W1+09+zF5fCZcz7QYT86nqy6RKhVfFf8oSRiPXFY4ZxqADrlAb+FLp4mXRnWN5WSvaLQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yGFlUQyLx5Gu4ag607SO6IBPso4qkZTbsM3FoamTI4=;
 b=AfJGKoB/qlemMQ3cSzjtXdol05WnI+Dh/4YltnaIZumMehEfDw9yXspz2vMYK5WQNBKP+W+m1grmNRLzedg5lZrEfSMx2cj2o9/Ao1uvAszqMj6dxMBeeitrP+DYZ22L/mOH6x/rUDqdMJVQX48unZ9kM16oTt/HQBloDs92qykT7HvL5KT8LzrTD8BNkTwLP7yY5YGOoZakWtoK20kaO6jzvE3US7++wt52xerY4uqBfVkmwwcd3le9zTLDBfKIqyh1FAdYVLYOaveqPeEmqjzRt0PLkTVqu3IT/oA4lJjtEKnCAPP4R6ytgE6W2IoDe5BY4PRdFF7heJbOQoDOeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yGFlUQyLx5Gu4ag607SO6IBPso4qkZTbsM3FoamTI4=;
 b=MoKH/s+6TVMHokE74zEnP4e+Y3AMnDl/hpfHT23sPYG1/RAG2/mwFBacJN835EVaGxn8xAQkWoofdp7xByVxyzEGYX1i3Ciz4U/+PQfRnlirTzJffWhf7av1sKakeaG+pKt9Da3VHM98dP26dNUprP78ireEyN3KgKTLIpioofc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1963.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 13:20:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 13:20:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 14:20:48 +0100
Message-Id: <DI3YV94TH9I3.1SOHW51552497@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <christian@brauner.io>, "Carlos Llamas" <cmllamas@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: allow `clippy::collapsible_match` globally
X-Mailer: aerc 0.21.0
References: <20260426144201.227108-1-ojeda@kernel.org>
In-Reply-To: <20260426144201.227108-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0231.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1963:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e1f8e3-598b-42d7-d554-08dea45fcc6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|10070799003|376014|56012099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dytDcklyK1NJZE1XS256NEtNYVc4amJlSDBYbGVXZDQycmFQcGVyWm93bHBE?=
 =?utf-8?B?UW1QajFMV2JBZU5hcytnNXlicDBJNm9tMG80bDdGdzhtRTV3d3VsUUhZenhu?=
 =?utf-8?B?ejBHZnVTdTVPb0NKVDFLNFVaL3NMQXVLR0JHQ1pxdnZWelltTWFnZUhWUGlS?=
 =?utf-8?B?WUhrVzllZGppSHVmUWJuR3JvaTVJWmg2am1iWm5zY0tINlNMdnNSbFNSSlR5?=
 =?utf-8?B?SWZpbHFXRUN3eWlCNW9FTmkrSmNnaGpzaDdIbHZMa29qbk9FTUZ0bnlCa01j?=
 =?utf-8?B?Tjhsem5IZXFNMWcxbU0vWElqMUFaMDNsaStPb2NBR1RIMzNCUmdwODNEbFVC?=
 =?utf-8?B?c3JtVDNPUWtlV0EwRHVvYW1rR2dSMW9TbXJYNjN0Q0V1VXFyT1RzVUtjamFK?=
 =?utf-8?B?cFFEQ2hoc2JJcTNoZE9CdFpvOHQ0ZzJrREU2UG40QUV1VDRNRTdaemxCYnlt?=
 =?utf-8?B?azNOMFo2dEdlQkRuTWVrL096UGVCbTFmSWhMOGl5ODRhdHd3NHVmWWtIMjVu?=
 =?utf-8?B?d3lOWWVwaEI1S1gzZWdqOTRjZFpnSC9nd28vdDJDQWk3RU1TdFYwRG1nN0Fa?=
 =?utf-8?B?Q3RrTzlKd1doZWVCcm0xdk8yRVFJa2J6aXAvMVExeklvNXowU0ZUdmtzdFJj?=
 =?utf-8?B?UWRZek5LMkNldjlRWlVCaEFOTmhib0IrN3gzS2x2K251dXZGOExpQkhuUnlQ?=
 =?utf-8?B?R2tvS0dXZWdvY1EwZkEzL1RVM0pHckhKRS9TQVRmYXExK0pTUHFkRC91aWl0?=
 =?utf-8?B?QURFbUxjMllTZEhEVnFYaEVndTVkY0lvMzlIVWFjVE9wWFJXeERpbENwMjZ6?=
 =?utf-8?B?aWNMblFlR0ZIY1pGc2VoMnJyTnFyK1BmUHJYTmovTVVuUjVHdFI2K1V3ZmVj?=
 =?utf-8?B?RVloR1ZaVk1BVEk2V3FxdURESW0xUHRBcExneTF4TG5iSURITTBDamdUQ2xp?=
 =?utf-8?B?eExGSTZ4M0xwMUF0bkhjd1ZDeFRHRlBjVXBmWTExeEh6d0ozQ1NENVpabzFG?=
 =?utf-8?B?NlliSFdGeGwxQjhCSHBnY1ZPM0xqTWlvc0xTUCtvVnBuWDBrL2ptVW9vT0Js?=
 =?utf-8?B?TjJJajR5VmJGNVhHM2FVRGJBcWxSSjJlaHRFSzI3Nk5MS3R3bHEzNzBmYnpD?=
 =?utf-8?B?ek52Z1VkaEpiSWZ3cnZDM2p5aTZEbkhxbzErOS9JcDRjYThLZEtPQ2VQVGND?=
 =?utf-8?B?N2x0bXNqaUJsNFhDdzVEcVNXZ3hCMGprWDl4cGR2ODVRVnRpRDcwVUE2RTBs?=
 =?utf-8?B?UEFkbmIvL0FZcDhRRnFDWks1elNYTHg0VkJteXcxSG55U1NiRkxJY25VT0x5?=
 =?utf-8?B?dmowc1RUQ3Q5ZGg5TG5tazNlSXVsQ28yc0xqZEZjQVlVVnEyOWZvMmVCYitV?=
 =?utf-8?B?ZzByUEZsUVptQmJVWGNsajZML0ZoUXlwd1ViSmwwUEUyRzVkRmxmR0dnV3lO?=
 =?utf-8?B?SFVFRXQwSllJY05PUmVreTVOdllWSjBZODF6SjlFWTNGWWdFSldkWFZhVFZY?=
 =?utf-8?B?bXl3TmFIeTZka3NMcnZnRnYxTERiMXcwK3dQNnpORGtuRmFPdVJKaXBOSGFX?=
 =?utf-8?B?UGxCS2NsTlh6L1Ewc2xkREJCV29STG9RYWE1YWtmNENjbm1mbmRqYTIvcita?=
 =?utf-8?B?bHl4UXhkNGtGS0g0TEpIb3BhNTI2VHRQYllLU0trS1NQbnRxNFdETVh3bEdF?=
 =?utf-8?B?V3VocEEreVJ0UktFa05tTE5kMmFGNGtlZG9HcGdjYVJTU0tON3dhMjlhM3ZN?=
 =?utf-8?Q?Jp/a0lfoJQq9AXWM4Cpw6qHh/fmAUIrle2xjvrD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014)(56012099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXZnSWt3T0pTMFJjZkVjWDgwYkFFY2YvTGEzcHEzSVFObVVYbGh0QTY5RXo2?=
 =?utf-8?B?NHpjMEdUMU43dlJaRUhETUZJSXJ5emg3TzFJbmNINzVYMnhFSE5uaWFocXll?=
 =?utf-8?B?NHJiSXk1SDBZZ3Ayc1NGcUlIbnVUbUc5MnlHWUZ5TVhyUjFtUW1XSC9qb2R1?=
 =?utf-8?B?aUJGbUFkOWtaa2hiUE1zQlRBOU5FQW9pOFpnNmEvaHFqQ3FzbEZ0bStzNGx4?=
 =?utf-8?B?bUlyUFIrRUgrMkNTcHphMW5XRU9NUXFoR2J2ZDhVeHFGQkhsSEZYM2pGckwx?=
 =?utf-8?B?RlIxdHRGckJkYzlVM091OEwxS1FVRkZpNURVL09NN2sxeW9xVml1eDg0RVAr?=
 =?utf-8?B?QUl2eGJldmhzcjdKYzdMYlhUcEFpNVExR0hUQ284ckl6V2Zkd3E3bWpKL1E0?=
 =?utf-8?B?UEMzUDV3ZFg2WnIyaEhQVnlUOTUwblRhUkdjaXdrQi8xSXJOWnNpTjJMQ2d0?=
 =?utf-8?B?R3g0ZEZhZlRZb1d4ODB4aXpFalpzbWs0QzlBOEFWVUNaY2pReGRLdVRPWkdZ?=
 =?utf-8?B?L2xvR3o3NFYxcDc0TUlKTjhDQjJPeVFFWWF1VElBK2xWS09VL2grYlNkazVh?=
 =?utf-8?B?YUZmMVVLcGo5ZmJLK2NYbXVkRm01aXJoUG9QcE9LSUJtdnI5TnlDa2ZGWFBu?=
 =?utf-8?B?NkNyVk54d2JSRHN2R0wxaWFmL2RLZEd1SlNUNzN6anYycERKMFhLU001WXZ4?=
 =?utf-8?B?T05hY0EzeEN5bzhjSE1Mc2RQZktvdW1ucTdNWWZGWXV4VGJDOUN5d2RsVVJX?=
 =?utf-8?B?UDVpTjFLd3FlMXlJVE9sL2xEdVZUc2JtQnd5bDhWQnpJSXM0V0dWSnNURzEw?=
 =?utf-8?B?Mm10RElCTFdIQ2JxanAwcVU5QmZ5OVNoaWtHeTYwUG5UdWhZVVJyS3hUNEdI?=
 =?utf-8?B?WUoyZW5vc05PZjZ4Rm5Rb1JQdUl4OHBYQ016bVJwRkh3NDlRN1BZb0xCekI2?=
 =?utf-8?B?N0hLV2VKRHBuVzNWelB6bFViTGw2d25mbWZlVDFFUW5zUjc5NFBOWXBIUkFU?=
 =?utf-8?B?NkVvZ2FmMmM3K3VEc0JyQmdzTFFUOFpKRVdueXZ3bTFCUm5DNnZVbCtaVm5h?=
 =?utf-8?B?Q1o3bHYveWY4UVk2UWIySFpOQnRxamFuaUQxS1RYYkxDbHBGeGR1VnNscHRT?=
 =?utf-8?B?T1QvU3h0SjNiZ0c4ek0xdkw3K3d1bWdnd2lXQnlBR0hrcTkxV3pHNndoVFho?=
 =?utf-8?B?TTlDeGlTRnBISWJTQk0yUEtoNys2ejZvNTc5K0RWbThXU1lqRHFaSmo0ejR3?=
 =?utf-8?B?UmlSNlZIeEpCdGdqNkhTN0t5YnFZaTlsY20zb00vck9aTFY5NHdwVXFTOU40?=
 =?utf-8?B?RkExTlhhV3gyY0VSOC9PSWMvUy9VRGQwTE9USnNuWmpwZ3V2Y3JFZndTUyt3?=
 =?utf-8?B?QTdJWWlhN2VYSVVLMGVKVURaTmhIT2REM2s0MitqYUIxRlM5RUwwKzg4V0ZK?=
 =?utf-8?B?NituT0ZGam9LZ1U5MVJpVVR0Wk9jOWcxQ3JubHY0dzZSbDR4TGFTSGZ5ZzVP?=
 =?utf-8?B?OUF2aUg0Y3d0NWkrNzUwQnoveWpkYWFLUzJGcVBKR0VwVkxQVUZWYkRuajJT?=
 =?utf-8?B?TFlRcjdaSHNiVFloU2xIVVBreVNFL2ZMRmw2L0N0RzBBTFdVUm9kbm43ZEhC?=
 =?utf-8?B?S2ZzUTR5aFNsSWRxd0pJZTNGZmVxVS9rM3hVaUhUVm1hYXFLQ1ZJT0FGNUZS?=
 =?utf-8?B?RHNhWStwOXNZWE9iQUJEZ2ZyQlZlM2NOVTZEK3JyT0JMMlp3cTRrSjZldnpZ?=
 =?utf-8?B?cWNINVFoZjhFdWgrUGlwNkxPRWFpTkVOVXFydlp2aUYyTWFLNVArd0R1S2RO?=
 =?utf-8?B?YVVIajAxbjJpUTN2aE9Ed0hUaWVEVkJSeDJrVjhwMDN0UEx4VzBrQllGaWFt?=
 =?utf-8?B?a3FodTkyZlVxbjFTaHBsaE12cXVIaDR3UGRUREx4S1lETXlsc2lpTElyMS9U?=
 =?utf-8?B?MmFHUWxoT3dlb0x2WHAzTDhNQnRjNVFpWmpNU1crc0d1MFJCWnlNK2xTV3Jz?=
 =?utf-8?B?dTVhdDRlZDBDU2ZmajNnZ3gwdURZWUEwUUdNSXJXa1lBRTVXZE9rc3hod3pH?=
 =?utf-8?B?SWwyV3FvRUF6Mk9ERmtRODN0MUUrdWQrejZleEFHRDFlcjNyQjllWFpOZUIr?=
 =?utf-8?B?dnpxemR5NzNYN3lyb1ZNMnFwMDcyQmNyekMzYzJia3Y4bSsyaUt4Q1BkZm0z?=
 =?utf-8?B?dmF1cS9GTklhQkNEMFJHSGIvUHhHSHhDNGJGOUtxRm02Z0tRV0dQbVFsSmdi?=
 =?utf-8?B?ek1Rc2YxbTlqZ0xPSW9DV0RxWVZocUhwdzlKbGwxYlB6K0ZWTFl6THFsZzNX?=
 =?utf-8?B?ZGZnbXpuajVEVUQxaHlmbHkrdkpCZS9iYnRxOWlNeWg2cCs3T3htdUJrejZB?=
 =?utf-8?Q?1EBUKW71tSrzUrVPjBtv4MbW+8nTAdDWPC3t/7iANDWuM?=
X-MS-Exchange-AntiSpam-MessageData-1:
	JLwXXRc3fnIe+4c6mdMny5xkL1UQchSxluRwsYP4YfugYVZDAXJpeweDxdBbDVGmpiGUCAaM8ZwqEef88TDH/qe8iyWtNdmOxHI=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e1f8e3-598b-42d7-d554-08dea45fcc6f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 13:20:49.2630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAT4u6u9zufwSWLjBYAQkIBa1lkHt7z5Z5IqzxUMbyPBhzBJrTFi0yc3osbspq5Jo9MOed6nju0MJAXcYSuvng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1963
X-Rspamd-Queue-Id: BBC47473757
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [12.34 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	MICROSOFT_SPAM(4.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[garyguo.net:s=selector1];
	TAGGED_FROM(0.00)[bounces-12881-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[garyguo.net,none];
	DKIM_TRACE(0.00)[garyguo.net:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.582];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,garyguo.net:dkim,garyguo.net:mid,rust-lang.github.io:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Spam: Yes

On Sun Apr 26, 2026 at 3:42 PM BST, Miguel Ojeda wrote:
> The `clippy::collapsible_match` lint [1] can make code harder to read
> in certain cases [2], e.g.
>
>       CLIPPY P rust/libmacros.so - due to command line change
>     warning: this `if` can be collapsed into the outer `match`
>       --> rust/pin-init/internal/src/helpers.rs:91:17
>        |
>     91 | /                 if nesting =3D=3D 1 {
>     92 | |                     impl_generics.push(tt.clone());
>     93 | |                     impl_generics.push(tt);
>     94 | |                     skip_until_comma =3D false;
>     95 | |                 }
>        | |_________________^
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#collapsible_match
>        =3D note: `-W clippy::collapsible-match` implied by `-W clippy::al=
l`
>        =3D help: to override `-W clippy::all` add `#[allow(clippy::collap=
sible_match)]`
>     help: collapse nested if block
>        |
>     90 ~             TokenTree::Punct(p) if skip_until_comma && p.as_char=
() =3D=3D ','
>     91 ~                 && nesting =3D=3D 1 =3D> {
>     92 |                     impl_generics.push(tt.clone());
>     93 |                     impl_generics.push(tt);
>     94 |                     skip_until_comma =3D false;
>     95 ~                 }
>        |
>
> The lint does not have much upside -- when the suggestion may be a good
> one, it would still read fine when nested anyway. And it is the kind of
> lint that may easily bias people to just apply the suggestion instead
> of allowing it.

It's also just wrong.

    pattern =3D> {
        if x {
            ...
        }
    }

is not equal to

    pattern if x =3D> { ... }

because the former prevents other arms later (e.g. a `_`) from being to act
while the latter doesn't.

See https://github.com/rust-lang/rust-clippy/pull/16878

>
> Thus just let developers decide on their own.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#collapsib=
le_match [1]
> Link: https://lore.kernel.org/rust-for-linux/CANiq72nWYJna_hdFxjQCQZK6yJB=
rr1Mb86iKavivV0U0BgufeA@mail.gmail.com/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 54e1ae602000..e2a810bc4409 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -486,6 +486,7 @@ export rust_common_flags :=3D --edition=3D2021 \
>  			    -Wclippy::as_ptr_cast_mut \
>  			    -Wclippy::as_underscore \
>  			    -Wclippy::cast_lossless \
> +			    -Aclippy::collapsible_match \
>  			    -Wclippy::ignored_unit_patterns \
>  			    -Aclippy::incompatible_msrv \
>  			    -Wclippy::mut_mut \
>
> base-commit: 897d54018cc9aa97fd1529ca08a53b429d05a566


