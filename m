Return-Path: <linux-kbuild+bounces-10772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFUsI5czcWlQfQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10772-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 21:14:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7315CEE7
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 21:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 447FDAE6ED5
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 18:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8A9396D35;
	Wed, 21 Jan 2026 18:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UTdNbwhD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020118.outbound.protection.outlook.com [52.101.196.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C72134B40E;
	Wed, 21 Jan 2026 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769019904; cv=fail; b=FDYFoSVXShGeW5TC8iqAInLaCBKWBvUrHbeTHLALFd+P0KPRTraKhnqUJt0RJa330bjdBDH9nhkYapPqOC2GORZEDZYXMv8DYEcoPCYxBXG08k8XUOQY3hxyD/T9VqhekXpK2UEceAdDUnkB4E9dSmuL4FjQe6pDa2FKgODJVyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769019904; c=relaxed/simple;
	bh=HThL4lIjICV+9sS8hsZLshU5XHEStZVsRfigoaEiC+U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lRMQ/wcBICGi32qrTTH3l+V8SaN4JB//NdKrSz/ARJGsceVFvrmXUIYo8fmyJ8i+2VRJw93KKsjOa3LVDZyXPQLaic+rzzlHqZRZIGGdgw2mKAmvyUhjVXXoZy0ph27dztn1t4gS1ByOLXl/liDFExrUHEqc/0DYwBoDtBHKa7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UTdNbwhD; arc=fail smtp.client-ip=52.101.196.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmv81gFhQ/OoBLEBobMHtnnTtcGGiGwJGZQaV3kJVZv1VtjV5aPgKOij78YIH9jiMGf37+wtHrDxgT75BK1BK10AZ/0a+tPim1NKA7SnC57KroOExc6BV3QVzS+tk8XFPW6Zg4VaoT/a86jfyZlzKakbL4sz5rXaTzb6j0UQ6XKMn9GdoQX2CVoS17e+nLz+JUHgoWH5Ned8jspcbd1o+zNoO1A+e5F+tYY4ZUxyPhXVty1xanmc/2U15H1r598TSpfOgt0EM1MKD2tGou7Cn5a2rtGycg++DVmuUM9nFMKtvhcqMyeSM8MljuzOIrCDnOUmRWKZHlgAFOue3lE45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGFT102AnRJfaEnPpeO4p2s+DU3RupJrtyP1maGDqnk=;
 b=zCM+ppB2/19potjYOVw5AfuCPMhT34BQ8yR3LrhmKe2A+qZtuPKJWDgb2KVIurCk79axBl/nbhOTOuCw6NDZt6VRi6QAU4pBVUD68h1tut4JSilV2oPPOvgMxqQhZ4VmN1HpPXckWzUYyrSehAOnhTEI6JumfNP6wmanYZIIb6Iq9WgxsGFWZTc8UN6PpyI9g4PVieeUN+aKzDyWXJOOKVX2YIkTdy1rwZ4qNuQQ0lb/R+8cO/9G7MNBrX1OeqTSCc1uXDOizYTFuYPci+POeVJ8I59RixAStzQc3Romcoh1h/dsr7uwaE/DRz3BVuYbBL310tyIe4SrBrVPUwS17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGFT102AnRJfaEnPpeO4p2s+DU3RupJrtyP1maGDqnk=;
 b=UTdNbwhDg2L5GgIuqYzuKNs2odbfuv+hNrURI5sI0e2ARQn0AzJTlUSrR7ZJjf89TLjPNU5V98J5iHAwYsw5CI6ur1DP53gFmmXJQ45AR1WdWpd+IGJg/4kx+QgYForHQR9gShcWSigZ+VI0C49rvWFEs0g3nBHCUFV7HfDMu6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB6898.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 18:24:59 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.009; Wed, 21 Jan 2026
 18:24:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 18:24:59 +0000
Message-Id: <DFUH7UI3MM6F.1B30NTZ5NFSKR@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1] scripts/gen-btf.sh: Use CONFIG_SHELL for
 execution
From: "Gary Guo" <gary@garyguo.net>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>
X-Mailer: aerc 0.21.0
References: <20260121181617.820300-1-ihor.solodrai@linux.dev>
In-Reply-To: <20260121181617.820300-1-ihor.solodrai@linux.dev>
X-ClientProxiedBy: LO3P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::13) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b5b235-03ff-48e8-711d-08de591a62d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TndhNXdjTWswSW1IMWJ4ZHA0Z2J0d2ZjMVFUaG5ZeDI4MHZBMy9IVXdPLy9t?=
 =?utf-8?B?b0c1U05idkFsMDNRQ0swQ3BiUUpuckc2ZGEyc09ReUN6K1kram1sc3ExWG8w?=
 =?utf-8?B?RURIb3NzT1JKelNkZDVYL0pBU3dnNDlDM0dpa1BKd1RYQmFMZ2dkYkxvM25B?=
 =?utf-8?B?NlBTQklyZS8xano5M3ZCWkgxU3FGcFhnQTJ5MFdHSGRIVGtEM3NORWpldkM2?=
 =?utf-8?B?QVErRVVjK21XT0JEblBSZjJpbzQvaVlBZG1uYnFLUkdYMVRmTE5BZm9ybnVI?=
 =?utf-8?B?TzlEK0M1TUFLenpEV3Zwd0tpdnhhZHhwejRxS09EMm55cjRaeHhxQUszeVR1?=
 =?utf-8?B?WkYvaEZUaDhxM2pSU3hlT0tJNHpEOHMzcytTQnVWZ1JIUlVTZi9Sai9hOGU1?=
 =?utf-8?B?N0V2dGJQY1VqQUV1bWovWE93YWVPeHBjaUtDcnVIUWc0RG9xUUtTVGc3TlM4?=
 =?utf-8?B?UzdlMmN4OVRhNDJSY3l2WEV3N255R3JRSnJ5V2dxY3RaUFV4b2gxS1FJdzdm?=
 =?utf-8?B?VUJCeWhIUnUzQXA2b0cxVVJBaTF0VWJkenVQQm5aaGY1RE1mc04yNFYzRWNI?=
 =?utf-8?B?ZDRzR1FhZWVVQ2hnUjcyaWRraEFTV2tBU0l4M1kvZlFia0liQTU4R3BWQUs4?=
 =?utf-8?B?ZTV0NGkyTW5paVZjZ0pzekZxWFNHYzVFV3hVSE94NHczc2kxSm1hTDN2dW4r?=
 =?utf-8?B?ZzBnMFZCYitMMnFQTEhPNWoxNFFHVE9rbWp6dWtHQjB3L20yN2NSb05ycmda?=
 =?utf-8?B?Uldsa3VTZ0MyeTFaRnA3a2pYVHcwTDk0amcrZHB6MWE5cHpWbkNJd0lidFNj?=
 =?utf-8?B?cG1aSUdnbkp5TkJSdi83a2ZuM09aQ3FNa3R5a0FsRFdSSmt4ZTIxYldwTS9X?=
 =?utf-8?B?bXdPdy9sS2J6Mm5nRHUyVEtRMzkyZzE0ZmxULy9rckJhYm5ET0dBNTN2cmF5?=
 =?utf-8?B?aTVUcnUvRU5BdG5KdUd2N2l4RW1KQlR4ZU9XOFVzVVdlZDdmbkFKMHgwUjNF?=
 =?utf-8?B?Sjd0S2F3OGRBMFo3cUMwOG1yZ2FSeC9yOGVwT0ljTXdJSXlUUmxlZG94UDZN?=
 =?utf-8?B?YnBjY0U4YlVnOWw3ZXRwWDg1QTRwTkt3ZzBNem9VazgyUUlaM0FBL2ZpcTlR?=
 =?utf-8?B?STJaVEFiWjdxdXo2dzB3MFhjakthRnQ4dDZIaDc4OXlqT2VncHZyak92aEk3?=
 =?utf-8?B?dVNPNEp2Qis5bC9TdmI3OW5ZSGYrWVltYzVObXl2ZTFUSmhsZHhDczdNaGdx?=
 =?utf-8?B?N0JFNEd0SjlwQUgvNnVrTlN6QnI5cGRQcjdIK0swaStTeXg1YXV6QXlmRFRW?=
 =?utf-8?B?MFNqWTluOWFUTkRvckpPNThTQkJEdUNzeDdObmxuMVNHQmxpOVhZc2dKYkJS?=
 =?utf-8?B?NzZ3RmY1UDFDVXhlSnhHWFAyc01VYU8vN1pQc1pSM0hWRS82ZEpZZnNUZFFx?=
 =?utf-8?B?eGRrWldoVGEyS3VtUVhTQ1VwTDBuVmVEZkE5Vk1SZWpuc2RmMzc1YlVTaEhZ?=
 =?utf-8?B?T1c4eURyQUphUXM1UTBYdlN2NEtHOGRhRG9UUkR4SVpjdU5rT3BBMFlJa2Fz?=
 =?utf-8?B?Rkw4VDBWK2lGV2FQSmJvYmw4cUtSRUcxaDJTOGFsVEw2aDJtVE5nSkpQMThT?=
 =?utf-8?B?NE1kKzJ1M2NPV0luUDZoTEQxc0dWN2hoYTVPWE42cDJhM2ltWXZtaWxsNks3?=
 =?utf-8?B?dHRvMXp3REY0S0xvWXEzQkg3NjU2a0QwNWZ2ZTF6UjEzVWhZZGpEdEdEVE8z?=
 =?utf-8?B?TDNkZGIzR2IxaUdZeXdxb0x1MDE5czZzZTFyWjlsclQ2dFRLMjgzbzBRL3Zt?=
 =?utf-8?B?ZFR6TWhEd1dQdm1ObUk5bWFTZ0NGNGpvSE5XcG5XYlRqSGFyS0RiZ3ZDNUFR?=
 =?utf-8?B?WHZBSmJPRWdUc085OERqczFmejZ1eEwzUlROemVZSkVPVGJ5RUVHd2ZlQ29R?=
 =?utf-8?B?ZXVCRm9rUWd4dUd4OWtDQ0FMWU56NlJpRDkxRnhaTUtFb002YUFDeGUvNG9U?=
 =?utf-8?B?NkhuQXVqZWxRV3F5WUNvdVpVb01OeWRJNGRwSTVEQjFnaGZBVEVtTVpsa2Fn?=
 =?utf-8?B?M3d3TWkxZGFjckRzZk1weVhVVytCZUl4WnpJM2twaEg2UStvVnhRM1IyMjBE?=
 =?utf-8?Q?iPZo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1NKSlYzMndQUUpNdFU4c0N4SmYvTlJkcllUMkRyL095YkVKREZtWFFOM200?=
 =?utf-8?B?d2ViM3U4MzFoSWVVS2l3Ni9QR0FRWHlpZjhQU2RBaFB3b1N6VjViL1pIeGp3?=
 =?utf-8?B?ZWdDSTJKN2NHcE44TVdNRG82Tis1ZFhoRktTUFQwUi9MWnRxYUpJWkFzc2FP?=
 =?utf-8?B?c1Z4aUxpL1AwSnB1NG50ZGtiVGh5Y1Q1NlNwTXN5RXQzR3dDNUJtRm5oeXJj?=
 =?utf-8?B?a3FYR3JMYVBGM25mc2JscmFvNGFDbDZiMHBsL2I2ZHhoUXpXdUpzRGhqODZ0?=
 =?utf-8?B?WjNIZ0xWUmliN1V3alBTN0dPOU9hNVZqeWpJeTc0YVJuYlFCVHhKR3QzTGUw?=
 =?utf-8?B?aGJDc24xWnNJRUh2czBWcjd1VGx1U1VjVlVvMmZ0WWZVb0RrV1p1N0U1VlJB?=
 =?utf-8?B?TnBmVFdZMHFEMlJOWVZxRlFHSlFnZjNvcFpBN2ZiaUgrTCsrdHBaejlMaTA2?=
 =?utf-8?B?REQ1SlYwaDU2Q0oxV1dKRFVyaS9DWDYzNmhmUS9kdnBxWWsycjlLZ1NURjRt?=
 =?utf-8?B?dWRpeFBJQW1QbGhrNS9Zb2RDVmJaS0F3RWJRenZDcHlreUU1Zll5QWlHamMr?=
 =?utf-8?B?WGdscG9OcCt4OE9WejVudUEvUENKTnNhNE9BVlhFTk9mQWZCR2hYRzVaTnBv?=
 =?utf-8?B?L2F6eW1vOSs0QlNRaTZONUZTaWxYVElQaWY2WVZyOCs2THg1YkdYTFduOTlm?=
 =?utf-8?B?eFdTNW14N1dDOTQyb2haUk5CWGU0M1hJdDQ0bFZGTmV5VWFNb2pXRHVIRmU4?=
 =?utf-8?B?VXhBc3VmTDhxS09md28xQmtxdEovdGlYWitTcVN2emN4TkVoWUt0RzUwbGNj?=
 =?utf-8?B?R25DdldlbWY5RThEKzNTWXBRaytoVk1WVUtqdklGNlFXSllVY09JWXlYMVRz?=
 =?utf-8?B?aElqMTlIWjM4dkFWSEdqVldtYnpCK1pWUWRBemJZNmhVTHFiYjdNRzMvMjlH?=
 =?utf-8?B?M1hhL1FSa2hPODRFRHBIdGpDZjFrTUdPdWdrVTg0VVlRYW1PY25rWGNPcHhq?=
 =?utf-8?B?c1JmVUJoZ1JwQXBJeFI3UHFEak1rakp1Q285NFRWTDgzMnpCa2ljekw2RFZt?=
 =?utf-8?B?eThZNDBydzB2ZDdzMHorM1Z6aU1sMTBlSUxQclI4OWlxbHc1VkVZVTlEVldR?=
 =?utf-8?B?bFVsd0RXNFppOGxRUk5VR0VSZWw2VlBxakExZTJIVk9IWFJnNDV6dlV1d0lo?=
 =?utf-8?B?Sko4bWUvOVo1Zm5NZGxHZnRzN2JiWmZPaWhQZTBuVXJOQ3VLZ3RZVU9CdHZZ?=
 =?utf-8?B?d1FYTnorQVVBQTRNZ0hTc3hLeElTakdZVzYxZGpUdG5hanRUR0FoNEZ0RW9H?=
 =?utf-8?B?UmVVNVM5S3gwb2NSeWc3MUpRalBDem9HelRGdUtVVml3YTJFcm1YZGd2UUty?=
 =?utf-8?B?ZVArWUVXZVRYdmtwM0g2eXlvVUtqWjBjMGJOWjRZUGtJRkRLeW5aNExvVGpW?=
 =?utf-8?B?SjRWaVAvaXlvWDdhZFFFd1NIcktPQkJGczhCVkZ0dUJUc2tOYWFxR3hHRU9L?=
 =?utf-8?B?L01DMmZPTXVJd3ZTa1lNTDE2cU9mdTNWS1E5VlRPM09TZjY4VkJFWUVGa01k?=
 =?utf-8?B?OS9VOUpjYW9DbEJzSTVRZzNKMmdPcVVNQ1BZQ3pOc2s3UkJzTW9keEFvNDBz?=
 =?utf-8?B?NTNJNTlVcWczZGcrZVZhNThjYk4vWk9aV3NIcjFqK2NrZVZvZzE4bTlsU1A3?=
 =?utf-8?B?cU5LcEJEL1VzL3Z1TDN2RnI3K3VwTmNpSUtmalRZWDZhdE9PZnVlSks2QnlX?=
 =?utf-8?B?U1hKenRFbExpekEyMmw3MTJpT2lQOGQrS01BU1NEd0dQRGMyRktjZVdwWGha?=
 =?utf-8?B?T2lFakFYTTY2Q0ZvcGZuKzhuMWtTMlVHV2xQRm90WDNETVBEb05QU0N3bm53?=
 =?utf-8?B?aDJYeHlXTHIxQzRnNlVIOGNFV0hRSDhnV2ZsSGYwcU8zakdRSGRFQ3IxSzFP?=
 =?utf-8?B?UEpRMU1RYmpKWUNWUnBSUVYwZnN2RzJoN2l6bnMwL0hFdDZRVk1MeHIvQU1r?=
 =?utf-8?B?TlVjaDl6Rzg2ZE5wMklibmJ5Wmt1WVIzdFlCR2t6VmpOVHJkVFpoWWdtZzI5?=
 =?utf-8?B?bjg0MXJEYkF5MElSTWFhMTBmNXg4M3YyTTdVVDMxcmYzK3I4NXRZaVlvajNH?=
 =?utf-8?B?VkJlR1hVRnBQS0FJaXd0UjFMNG1XUTFvYW5jWERGVVhoREkzYVhsSHFYNkNx?=
 =?utf-8?B?MzlHWGsxYlV4aTMreS9sV1NNS2wrLzlVeVFBYWhXZmpRcTJ4RzdDU1M0Skhp?=
 =?utf-8?B?ZE8rdTEvVWx5bTBBdDdMaWc2M1BtK1pmbWV4WGQrT1g2ZWFLSHJWZS9zRkdZ?=
 =?utf-8?B?OWhERWpBWEp4a3hMSEt4UmtqSCticTRvWjVXczhST0RuZTRDUGgwZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b5b235-03ff-48e8-711d-08de591a62d0
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:24:59.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZl+bEWpdFkROqeHT8x8FT6SM4OUQ6g6sFNpyVBSMRIEW+E5F0iXOLsu3xT8c41KvuucfUPCuhmjZ/HnhyfGIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6898
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10772-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[garyguo.net,none];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,garyguo.net:email,garyguo.net:dkim,garyguo.net:mid,gen-btf.sh:url,linux.dev:email]
X-Rspamd-Queue-Id: 0F7315CEE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 6:16 PM GMT, Ihor Solodrai wrote:
> According to the docs [1], kernel build scripts should be executed via
> CONFIG_SHELL, which is sh by default.
>
> Fixup gen-btf.sh to be runnable with sh, and use CONFIG_SHELL at every
> invocation site.
>
> See relevant discussion for context [2].
>
> [1] https://docs.kernel.org/kbuild/makefiles.html#script-invocation
> [2] https://lore.kernel.org/bpf/CAADnVQ+dxmSNoJAGb6xV89ffUCKXe5CJXovXZt22=
nv5iYFV5mw@mail.gmail.com/
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>

I can indeed build again when applying this on top of linux-next. Thanks.

Tested-by: Gary Guo <gary@garyguo.net>

You probably also want to carry some Reported-by, Suggested-by and Fixes ta=
gs here.

Best,
Gary

> ---
>  scripts/Makefile.modfinal | 2 +-
>  scripts/gen-btf.sh        | 8 ++++----
>  scripts/link-vmlinux.sh   | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 422c56dc878e..adcbcde16a07 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -43,7 +43,7 @@ quiet_cmd_btf_ko =3D BTF [M] $@
>  	if [ ! -f $(objtree)/vmlinux ]; then				\
>  		printf "Skipping BTF generation for %s due to unavailability of vmlinu=
x\n" $@ 1>&2; \
>  	else	\
> -		$(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
> +		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vm=
linux $@; \
>  	fi;
> =20
>  # Same as newer-prereqs, but allows to exclude specified extra dependenc=
ies
> diff --git a/scripts/gen-btf.sh b/scripts/gen-btf.sh
> index be21ccee3487..8ca96eb10a69 100755
> --- a/scripts/gen-btf.sh
> +++ b/scripts/gen-btf.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
>  # Copyright (c) 2025 Meta Platforms, Inc. and affiliates.
>  #
> @@ -81,7 +81,7 @@ gen_btf_data()
> =20
>  gen_btf_o()
>  {
> -	local btf_data=3D${ELF_FILE}.btf.o
> +	btf_data=3D${ELF_FILE}.btf.o
> =20
>  	# Create ${btf_data} which contains just .BTF section but no symbols. A=
dd
>  	# SHF_ALLOC because .BTF will be part of the vmlinux image. --strip-all
> @@ -107,11 +107,11 @@ embed_btf_data()
>  	${OBJCOPY} --add-section .BTF=3D${ELF_FILE}.BTF ${ELF_FILE}
> =20
>  	# a module might not have a .BTF_ids or .BTF.base section
> -	local btf_base=3D"${ELF_FILE}.BTF.base"
> +	btf_base=3D"${ELF_FILE}.BTF.base"
>  	if [ -f "${btf_base}" ]; then
>  		${OBJCOPY} --add-section .BTF.base=3D${btf_base} ${ELF_FILE}
>  	fi
> -	local btf_ids=3D"${ELF_FILE}.BTF_ids"
> +	btf_ids=3D"${ELF_FILE}.BTF_ids"
>  	if [ -f "${btf_ids}" ]; then
>  		${RESOLVE_BTFIDS} --patch_btfids ${btf_ids} ${ELF_FILE}
>  	fi
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 08cd8e25c65c..16d6a048e07c 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -206,7 +206,7 @@ fi
> =20
>  if is_enabled CONFIG_DEBUG_INFO_BTF; then
>  	info BTF .tmp_vmlinux1
> -	if ! ${srctree}/scripts/gen-btf.sh .tmp_vmlinux1; then
> +	if ! ${CONFIG_SHELL} ${srctree}/scripts/gen-btf.sh .tmp_vmlinux1; then
>  		echo >&2 "Failed to generate BTF for vmlinux"
>  		echo >&2 "Try to disable CONFIG_DEBUG_INFO_BTF"
>  		exit 1


