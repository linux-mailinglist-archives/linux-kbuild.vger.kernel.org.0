Return-Path: <linux-kbuild+bounces-11076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 885VFdTDh2n4cwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11076-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 23:59:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AA61075D7
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 23:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 303123011F1B
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Feb 2026 22:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DF9311957;
	Sat,  7 Feb 2026 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JZukj1rs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022108.outbound.protection.outlook.com [52.101.96.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE22DC793;
	Sat,  7 Feb 2026 22:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770505168; cv=fail; b=n/iPTx6sUyNHjobSu403PgaIVRkurIMrrYgxnimW6Vih3McQKBcXBKrVen2bwV7tSTiu7qBlGe1rLCz/GYkwdyT8YsrNJFZPqtd6w+Iu6L9NjJWXSBwNL/wguaxzGIDPsuhskoyN3hpcw88+RcHKSci+RlSGICWtb86sOSMrLWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770505168; c=relaxed/simple;
	bh=02oJeVP6S5a0AettqCkHW+IJKwjJD9wduJuveRjF4D0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PCFAfLXMO1KSojxF9qDaRa0J+N+w1wjS2Ac+jfbgkKwXk9DOvoq3yA3TAA0LcY5/UAaCC24bVNHxKud2OsUuLxRU5FDNiaFw81ge4UxQVo+tOdprMo1ken+n21LlB7ijycgum5QU2tOZ/7Y2NzK9If5DpK8kadP0AUhvtgmbUIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JZukj1rs; arc=fail smtp.client-ip=52.101.96.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d83VGyQfuYjKcDY/wkgId6zSvOuXhIkkF39GvRZCXClQVHEYdsowVg62Z7Igztdv5sHuNyHyXT2qJgYd9jsxgcaQZpEC+7YNRTKH56ZbC1kf86/WaFlOq/x1mMy9Hqgg8HoevD/ejKrhy0GUf9zKNHYBgDeCDwi6GqVBYARz3ta14MRAzJTudK6GC7jMQlZZKHcwByt7xTCPf2K9wLBvLiVBwq5L+JtAjOqF1HvDr03xR/FM4uyAFNme5tgkae2YgZmV0bUnwnqVHlERu+GoC9GUTcknNNoY2RsYrQ5JEt74a5Wtnd/yZWoTi3TYuGyvO5mq5jX0x2ajPWZNiYJN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWvAnCSh1qv1piI6q8jypDRTZKqiQYu+JOD6aP0ll9E=;
 b=OyTbL/XPYB5bTkGmRyUzZzTY9bfzXVA5+mI5mqIYnsuH7xb0jgAuvsxNXefXTR7q4MqYiTA7nBX4j4Vgfy4nq68wL2IkR+890YjygoxCw8JSCqJDHlaej3/szq0zfq25wJKMp/PijphC6r4kLJCCnxpkffl224+c9bTughbQcOu9A8Rm7+pojmA/dzQSGvL/VsC74zEdr7hMm7paRedmZw7bpVvQaB8TZ3W5HwGpNVLHSXbVjTiLCqEEAB6KB9mavpWi2Rp89QnI3l7juiLnL1qpn8qW49FWkFJLbHmx34SBWb6eTkuhdOvsjCauiqM1n/ZdN/tcnuCpJ6G9gsjIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWvAnCSh1qv1piI6q8jypDRTZKqiQYu+JOD6aP0ll9E=;
 b=JZukj1rsrV16yKvazfGuymzGn7TPniHjLGrjc0sZgs4tNRArt0EEvdnvbAI+60WtDc4Idso5n3Y8zJ0/EQaheEkaELxmxeERK1yMDBSEbioTXWSVVNRmWdiUE9QdV1/ycY9ljhQzsOkS2TeLEBxozY8yN9jzNTgvKxq3++Jxc2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7908.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:40e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Sat, 7 Feb
 2026 22:59:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9587.013; Sat, 7 Feb 2026
 22:59:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 22:59:24 +0000
Message-Id: <DG93P7TMCWCH.3ACJU31B2HELW@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Nicolas Schier"
 <nsc@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Asahi Lina" <lina+kernel@asahilina.net>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] rust: build: remap path to avoid absolute path
From: "Gary Guo" <gary@garyguo.net>
To: "Nathan Chancellor" <nathan@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260207144356.3063613-1-gary@kernel.org>
 <CANiq72mhhSKV=CecnZnqhKrt9tpGdMu1hePJtGDgRiD4JG902A@mail.gmail.com>
 <DG8VP6BH1MPV.13AHBBEMZHOF4@garyguo.net> <20260207220543.GA1670883@ax162>
In-Reply-To: <20260207220543.GA1670883@ax162>
X-ClientProxiedBy: LO4P265CA0087.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 4efee8ac-99e5-4f1c-3538-08de669c89d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2d3aGpJTTVqNDBVTTlKT0VsL3J0ZkxwNEVDOEk1bDMvUzBScjZWMjFzdFI1?=
 =?utf-8?B?Z2o3SEhzTDRDbG5Wa21CUUFoQ3BPbjM0c3NyNTl3V3Zqd1pMSXlJNUZLTmpw?=
 =?utf-8?B?a0RhbGxhZktWUVhKdGZEZ3QzZ1pZVmxCdjA4dk1wU2praFBiSGlpTGNzcDEy?=
 =?utf-8?B?R0U5dTRnNXUxelZSUmxCQXlKWWE4YWJONC9yV3JDQTVyMWVpWS96Qzc3S3VV?=
 =?utf-8?B?MEJ2UlUxd1VKTkJGc0pXcDRTWm00NVpMK0U2REo0ZjFiZ2s3QmliUHRJWkVj?=
 =?utf-8?B?WFdrZjdIQ3o3eGdXb0pqQmxPbnBDUTJ6TTNJblh1S3I5L1IzaXFkRXpIU0My?=
 =?utf-8?B?NzFYQk5OV0huNDNwczduWkJmcmNLNHRXYy95MmhvTTlaenU1MmJySEZvMXhq?=
 =?utf-8?B?d2FzY0FyM2xsWHByeWtJZUFLNVZycnBQTnBENFNBRGhqMmMzdUpHTXBtWXFS?=
 =?utf-8?B?UE5RNTFJQkxmaVRvbUtFY3FJOXZLdFNIR25MWFZqNEtLb3J1NGtoTWk3YUI5?=
 =?utf-8?B?bFBlcWlFbUU4YkNCQzVyMXFNSkt2b2xSOUpCUU1OcWQ3NkNlcVI4Skt6VDlN?=
 =?utf-8?B?Yy83ODdNL3hoV2twa3lZdUE0V2FVWG1KWDVqbTR1OWp6UCszU0llc2dBZlFD?=
 =?utf-8?B?LzlVYUVRL09pc1VnYmVYZ2IxQlp5OUYyc0pVVHcxRUF3ZUdjZXVsSjlqTGxQ?=
 =?utf-8?B?VFdiQ0dVMTVoQ1E3dStpNEIxNW41UXFSNTNUU1I5dm00RGhmcUhnRE50Vzls?=
 =?utf-8?B?RlJkV1FxN2M0NTQ3NklKWlFqZGJ6VEQ5dzJZQWJpMU5reTJKSjVFLzRaQzRG?=
 =?utf-8?B?cFlPNnlYYTl5Q2JXMXlqVGZDaXhpdlBkQ2Fmd20raVV4dlMxbHlKOVVLanh6?=
 =?utf-8?B?NHkwQnY5cWZYQjhDT0NoWXZ2MnBaWEhzdUtpWURtdnB0VllYMEp0RFo0M1JJ?=
 =?utf-8?B?b3RTc1NoNnVieTBqQVlyOEh3SUw5N1ZaMElkZUlLUTlhQm8rekg5Ni91Y3Vj?=
 =?utf-8?B?NFVic0VlTjBSbkN3b2UrSWRtbFhHMmdyRlpvRWZMeldxVU9DOElmVEhjc0Iz?=
 =?utf-8?B?MnhZSVFCQmx5OVQ1TFZOdG5hOXFqa2FhWkl4bzVSMmlFUjhObzZQRzMrV08v?=
 =?utf-8?B?Z2dpOXI4N2VueG9idVdNZkpsRHlXOU01NmRXdk1rc2JVbkpaM1NkUXVLTE1G?=
 =?utf-8?B?VTE4dDJKSTJyaGpOWng1ZEprTnl4UzFXQmdwSDNKeGcvbHU3MTRQYXpRbGIz?=
 =?utf-8?B?VW5TZ1dHdHlRYWpjTXVIV2dnS2x0UEpMSmYxVjRmb2JsQ0RtVWZ1dk1VRDR3?=
 =?utf-8?B?UWlTREcrQTBEbStUVmtmN0Nva2NJbUFKUlBkRzdOQXR3QXpvNjhGTUtDeDBT?=
 =?utf-8?B?WXh3K0JxZzR4SW5tWU5yY1k2aVdZTFRIb0NETE8wOUlmYmhrekV2QjQrQ3Vz?=
 =?utf-8?B?ckpCNGpzcmFiaWkxOUljWE9TYVl0am5aeEQ2Ukc2enN0b2NlbEErWjFuNHpB?=
 =?utf-8?B?R2xIUDFubDVMVWwyQWdWV1ZtQ3FOb1pFQnN2NmVFNStSWjVUSS9XVmhvdW9B?=
 =?utf-8?B?ZGIvb3ZadTdFUWxid2VXaGlVM0hjSHFXWGxDMUx1ck5oT1UrTkRMeitVVm5W?=
 =?utf-8?B?OHVnaTkxMjlFemhzaCtRN2svZms1aGtrdmlGMW5rK0dnb0RBZ2FnRUNtaVJK?=
 =?utf-8?B?WTlvWGVWVXovSlAzZmtxOVQxNm42Y3dBZ2ZLaEJXcG9vb294VVoxckF4U0Zx?=
 =?utf-8?B?NDZxQUhCeGxOcloxQ0ZrOTVBcng4SEhoN1g0bEJqaUdFcVQwTGl6RFRUTWhY?=
 =?utf-8?B?bHJjeWIxaEt3djRhTEZGdnlyb2VhdWN4Z2ROYmhkekJnWm1tNXMwSStvSGVo?=
 =?utf-8?B?cmdOSStLYmw4cGx5VndsT0YzSEpWa2d3UXZvanpZMjFpQlE0RDR4VCs2WkRi?=
 =?utf-8?B?RzBrL1MrVDUybDlHaU5lMmt2enF2dDdFcnhxUTNPQzk1N29GRXR3VkdBUlRQ?=
 =?utf-8?B?b25KYU1xc3hKWUV0SVNKazd6MHNTWUFLTW8wU01vbFR3V1JkYXdQdmlNeXVu?=
 =?utf-8?Q?RxDOrD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akszL2lKZjl6ZGNPMGxpenU5aWFaelMvL1g5YXgreHdmRzd5Wm5jdTQrNTZy?=
 =?utf-8?B?R243WWpMTWc0cDBDdHlsZGRsS2Vtcm5aWGdqaE13ZkJNTm53aFdsMURra0Jj?=
 =?utf-8?B?WUNhQ0hPTGRMK09oWC8wUmdFenFyeDU5SGU5N3ZnQmhPNzROZVFmNGNMNWdl?=
 =?utf-8?B?Qi9wOEY5TjVoWThsYmRqTDJHNk9WREdidjgydmthbWZTcW1VYUlqRnJpYldm?=
 =?utf-8?B?Y1RRcFZzdnVlc1Q5VUFTN3pSRW1nbENIQWlLMThDY1ErdTlZVnRSVXRXMDlW?=
 =?utf-8?B?MHlTc1gyTDV5ZVdTZk9LWCtRK2FMVTBLODZXNXZnRnpaWVg0bng1Q1IwdzJI?=
 =?utf-8?B?RGJqdU1seFArV1lZYzd4WFNqTjlpbVcwdFlBR1plcHlpR2VKa1Y5N3N0MDZN?=
 =?utf-8?B?Vi9xN2hNNHd3dk1mR1gxZitIUThqd0dYSUY0cjI4U3JpNUd0ZklDdWJGbHRq?=
 =?utf-8?B?SjExeitmWHdqSEJPN0wveU1LdDBaZnV0dWhYSy9kalU0QUdJVkNubVZUSjlK?=
 =?utf-8?B?VHNCWWdzYXJqUngzNEhTT3ltditySGoveHdHRkhqeE9zS2ZvOG8yMWxXY0Ft?=
 =?utf-8?B?dCtaOTgvU3dBTm10WHNnbjRLa1lrdVpMWGdOK2dsenF1NnlFWlVUV1NKWE5P?=
 =?utf-8?B?OWhHNU9Ya01QM0YrU0hZaTdMRURxNkpWaW42bDNMeU1oZVIwQllzS211b2Nm?=
 =?utf-8?B?ZW9jdEJZSTQ4QXlUMUk4VnBDUDJsUWRmbmFxbkZzTjZsVmhhRHM3bmJCaSty?=
 =?utf-8?B?aTNnaUUxclJIbzl1WDF3TFkyTzI4M0w5MVgzYk1md2pFYjRHN1RJU2J0Vkw5?=
 =?utf-8?B?RjduSVhCUk9hU3VaN3QyMlVYYzl4Wm1icTh5V3dnM3BrT3VITmFuVjYrcmdC?=
 =?utf-8?B?SXhHY2s0S3QreVRTb1VTclh0d0ZvVWNtclhKbW9welRaREVsM1VCaitxUkNN?=
 =?utf-8?B?Umo0KzVNalN1MlR0dEpQUmJGSUNHWE1GNC9MeGpjL25HQmxDVDhKNzRqeElu?=
 =?utf-8?B?cm9MeG9KelIzcFcyVW1LZUl3bjFkTm5JbjBDdHFDRzNYaWN0YjUwWXM3Ukx5?=
 =?utf-8?B?U1BkcTVKSkR4TkUzdjl3eU55Rnh4VzlWWDdlR2tKVXB3SGpqd0EyWG5DWjFz?=
 =?utf-8?B?Uml4V05MNzViS25NZDVlamdKZFZsQy9INjl6RUdGUk8zSFUzdWZRY1o0b0hQ?=
 =?utf-8?B?SzlBK3p0UldaMlUyM01lRkxtaGJFQVRWWWpaWTA5YWUraU9Xa3U0c1BBRnhp?=
 =?utf-8?B?N0FVM05lTDRnaW52bnZrbkpJSmZlM1BQeUl1QkZETFdIb1h6Z1RrTm9TUEJq?=
 =?utf-8?B?em4yQWNXMGFwTEdyMkppczVGMUJ2RDdtVitBQXB5R2xkNFJIOGlYTkZPRTJP?=
 =?utf-8?B?M2N2ZEh3b1VheTVwZGxiakdNWHlmSmRkMUZESVFwNUxpcWFjRjdHeXg4YWNR?=
 =?utf-8?B?RXdoNlVSU3V0anhEV1gwV1BOQjBFRGtDRDV5OEhabjU3c1ZUNExGZkNscFZU?=
 =?utf-8?B?dEdVODZxYkt6WHN0cHFPem56bWtJWFhVbnhCei95dUNsK05mZ1ovQlBpTDFM?=
 =?utf-8?B?cHovbHYyalFJOGNtOFpQZmFaK2MrdlR2akVjUURGU3NnenBPSTZNdGx1YnQ1?=
 =?utf-8?B?S2tscUFhdHdFQ29sVE52S1NCcjAyVENlZFVpVk5NOU4ySFZPTmpjY08zek5K?=
 =?utf-8?B?OEtUQ2htMFBqUk5CNi9yLzVuN2I1cXR4WDVWZk1MSitWQ29PMzJaN0hMSXdS?=
 =?utf-8?B?aFVMcnkvaGdiWmQ5OFVJMUpDVnhNUWtDcFpZUzJUSWpzN1hmcVBMWks2VWF6?=
 =?utf-8?B?b01XcUJPSHBjb0hRTnp3RWk0SDMvcmp1dEc5ZGNBckd3Ynl1RFBJUTVacjNO?=
 =?utf-8?B?S1JXWHRmRWxKTmJ4WUxPdE1HZjdWVDlTM0dVaEMvTnh1YWpMMy9jLzliVTda?=
 =?utf-8?B?azltaTRSZ0xhTGZoV0tHa3BrQXArd1JuVXh2OTRhSjFBR2pBOHg4andEUzNQ?=
 =?utf-8?B?OWNpci9jZEY3dGR3UGVsUmlxTGxyZS9FdjBDMkRubXYzaVBsYjZkbUtrMDZo?=
 =?utf-8?B?dmJ5TmpPM1MxYzY4SzlodzV4ZG5YRjQvQndvWm9oVXZtV0VwaVpBbEhTSFEv?=
 =?utf-8?B?VEtTcWFKRzJWZTZzUjNyb1o1T1d5NkNEeTJuRWNBbkZWb3ZXaHVHbERZZEJQ?=
 =?utf-8?B?TjFJL1NFRHNMSFNkM3BYcWV3SGlUbG5MbzFuamhFSC9VQlRjcWkvanpHTEpV?=
 =?utf-8?B?VnJWbE5kaWUyRm1xTmJ1VmhhOTJNWm5hVldPbXJTS29NbEx4ZjFKRGM3YVdp?=
 =?utf-8?B?V1VWY3J3R3NLbGM4N3Q4VUZOWS9FUFRsL0c0VTFlWXFQTEFmb2NLZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efee8ac-99e5-4f1c-3538-08de669c89d8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 22:59:24.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88BiU8fPm7SztfEdUUojTfZsr63ptPZOZupexagyQT7Oe9beW9iOR1VBRijTmLRnw94IAVNz1kbw1y9sznDOUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7908
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11076-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,protonmail.com,google.com,umich.edu,jannau.net,asahilina.net,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild,kernel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95AA61075D7
X-Rspamd-Action: no action

On Sat Feb 7, 2026 at 10:05 PM GMT, Nathan Chancellor wrote:
> On Sat, Feb 07, 2026 at 04:43:11PM +0000, Gary Guo wrote:
>> On Sat Feb 7, 2026 at 3:22 PM GMT, Miguel Ojeda wrote:
>> > On Sat, Feb 7, 2026 at 3:44=E2=80=AFPM Gary Guo <gary@kernel.org> wrot=
e:
>> >>
>> >> So, fix this by remap all absolute paths to srctree to relative path
>> >> instead.
>> >
>> > In case it matters to Kbuild, we had a relatively recent revert
>> > related to this flag:
>> >
>> >   dbdffaf50ff9 ("kbuild, rust: use -fremap-path-prefix to make paths r=
elative")
>> >   8cf5b3f83614 ("Revert "kbuild, rust: use -fremap-path-prefix to make
>> > paths relative"")
>> >
>> >   https://lore.kernel.org/rust-for-linux/20250511-kbuild-revert-file-p=
refix-map-v1-0-9ba640c8411e@weissschuh.net/
>>=20
>> Ah, that explains why I recall we had this flag in Kbuild but can only f=
ind the
>> filter-out directives now. I missed the revert email.
>>=20
>> I am not convinced that the ability to launch debugger outside source
>> directory overweights the benefit of not leaking absolute paths and maki=
ng
>> builds reproducible.
>>=20
>> The reverting cover letter says "As there is no simple or uniform way to
>> specify the source directory explicitly" which is clearly not the case a=
s you
>> can just invoke the debugger in a different working directory... GDB als=
o
>> provides a way to provide source directory search path:
>> https://sourceware.org/gdb/current/onlinedocs/gdb.html/Source-Path.html.
>> Similarly, LLDB provides `settings set target.source-map`:
>> https://lldb.llvm.org/use/map.html#remap-source-file-pathnames-for-the-d=
ebug-session
>>=20
>> I think we should revert the revert, then.
>
> For what it's worth, the C side revert also mentions that it broke
> 'objdump -S' [1] and working with GCOV data [2], so it seems like it is
> not just debuggers that have a hard time with that loss of information.
> Maybe those do not matter for Rust code or developers though.
>
> [1] https://lore.kernel.org/aBEttQH4kimHFScx@intel.com/
> [2] https://lore.kernel.org/edc50aa7-0740-4942-8c15-96f12f2acc7e@kernel.o=
rg/

Hi Nathan, thanks for the background. I tested that objdump will indeed fai=
l to
find files with Rust `--remap-path-prefix` (even inside correct directory) =
and
that's indeed problematic (objdump has an `-I` to add search path but it wi=
ll
only use the file stem and not the full path).

The best path forward is then perhaps to use `-Zremap-path-scope=3Dmacro` t=
o limit
the remap to Rust macros (this include `#[track_caller]`). The debug info w=
ill
still have non-reproducible parts in it, but at least the ones ended up in
.rodata will be remapped. This flag is going to be stable in Rust 1.95, but=
 is
available unstably for a while, so we can start using it in the kernel alre=
ady.
I can confirm that objdump is working fine when the remap-path-scope is lim=
ited
to macro (default is macro + debuginfo + coverage).

Unfortunately, using remap-path-scope does not give the expected result in =
older
Rust compiler versions, so the issue reports that I linked will not be reso=
lved
with it. It looks like remap-path-scope is working as intended only since
https://github.com/rust-lang/rust/pull/149709, so Rust 1.94+ (I haven't
double-checked the exact Rust version, but in latest nightly Rust, the rema=
p is
working as intended).

Best,
Gary


