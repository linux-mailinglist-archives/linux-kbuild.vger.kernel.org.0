Return-Path: <linux-kbuild+bounces-12901-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFvhOMWy8GnsXQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12901-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 15:14:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C87485A34
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 15:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4454D310D318
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 13:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2354143CED6;
	Tue, 28 Apr 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WR2J7w3Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021143.outbound.protection.outlook.com [52.101.100.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA9343E9F5;
	Tue, 28 Apr 2026 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381144; cv=fail; b=CTQ7zbvDfUSehxp6PXSSCYG+wKVDSsKGPDo2xOG6+YS3VtTrJtSUuoZkKSNuEyu1sKjKfdJOFQCa1lMDq4vq6PHxYcCBjmNqAAs+zJRwfXpj24R7+XTcriNKVtNZubPFnsXtBwJSH+OQepqVDgi4wy24tBmXEGbbEN+mAJ+8jcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381144; c=relaxed/simple;
	bh=qXeXqp29lthl3n+m2XG3UHZrgMI1rtKJ00SGkBaLC9M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IfBH8SHxP4ig25ePW607Cq7+XY3TtgCiLJ25Bm3ZNiJk+R+2DuHMcQL0jeBVln8+ztnqHnvyyrWGCkh33rkvNxteZvyT0HuWVFIUgtVoO18pETw+CZvnOIcqw4Vcw13v2LdyqtUOvY6rye8WLzraWhkMqKHeJo8Fje8skp9Mz+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WR2J7w3Y; arc=fail smtp.client-ip=52.101.100.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REtTe0gau8o1M1r97m/k+rAShVuF1p5eAoerIH0yyH02XSYeKqTuL2sXKRF9iAZ/QRFjfAWqeDc77CsHu2aaKcPTBhh8u9uZ+iXa2yTKS/qppVOgDd2fE2qNMeLzfOQA9/TtCIXCAkL7cZNJsMkuLHdrC58HNv+qiuSNQg+DPtU7pAIUqTlV6dzJDg0etsm3TAijVHACBJOKBoKHGXbvCRpnH+odUmxtB56PmqulrAOTBltbNxzyeGbopOWbx/QPqIFoRft/Xzr6XSQHQj8YDGuwT14st3C/PoiJyDen9AZYNkIO3SbVoK5rDq0uiiErbYa2eGqXga1xsu3HdMDc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXeXqp29lthl3n+m2XG3UHZrgMI1rtKJ00SGkBaLC9M=;
 b=DqTfoqFGvia2ZuX/mY631pF7fmeZWyj4bsIB39lt/v6FQzCfGFdiuSlbmuy6b9f5slE5nPtCN30WnTQJzlZu2Qg9Gwn3s7J2aLx9PIo6AMf0JDLKtYr7TCi7MBjvK92s9g3BWbwKijN9JPT98yM/A36lYhmZKbnBHFYLyl0Gznej5MQfo7RVQ8b/eqGVPnjAvUvd7/v/z5yIsFciiazEU+c8dtNRKr0ISApSazgd6TteiYYhSEqyJinHuNmJ4UD74h7o29dEENtxiyAe942Y7kuKshlaNYqEylFoxZcBEFGwKt2KFz0Ax1nUfAnPPc83zbBCFqpEbECPPR2nQu+LpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXeXqp29lthl3n+m2XG3UHZrgMI1rtKJ00SGkBaLC9M=;
 b=WR2J7w3YztA/1FqjCkArfFsiILlbWgiHYYNECXpswy5XoP9ZVSWMzZTdT1zZv2vlO5RQGl/YijBmn3vl1az8cn+bJ5/A0FXtpPrePrxpvpZoj1GMEzJldB9ZHHtCSEGRYKtJhtHL//b+LtxlQbbD/TniYqJjejMbtuJFLB5IeJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB1777.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:58::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 12:58:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 12:58:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 13:58:52 +0100
Message-Id: <DI4T1009OWYM.97DRX8ZRWWP@garyguo.net>
Cc: "Julian Braha" <julianbraha@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, <ljs@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Arnd Bergmann"
 <arnd@arndb.de>
X-Mailer: aerc 0.21.0
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com>
 <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
 <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>
In-Reply-To: <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB1777:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c8ba46-6754-4f6e-68ba-08dea525e630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cT70c13p3gpHAvOIbVHBTPRuQrT2CGjDz7MtP96nGoU5wKGniJUAcj9daJXKxxHzMjBSRZ7GfgiNn6KLI7WeHWr3PH6t0jucif5xzkBdFfdyKHV6ogLkp/Xg9NZQlMm9y8gQu7axerSJTyl6V3z/iTpx5UChC2rM4F1m5HHaIQfiG+TFjHvMNoFpCstH2UZpExvFx1unsF+w4DkP85UNWou/xoPHn1XmTKf+LihaJGXInbaiP0v1XZ7htrc824j3LdCzbaXG5NzhhjYM0DKXANhnhio3+ljZcH/vxunjbCYpWld1olbbA6vY46SmAGhwD+qWN16KEdyGVfOG5CTUY4zo8+MEuO3xbviMjo3vtlim3NqxktPEVvRf74Rm5eihVvkL9daHohYSJ0TIXCbDt80W2nDgDYw8t4E53z8ZglXUpQI8sSsCUnq+4uhEdl9pzmXMfN/u+fPMuvArllb3TV9iQlMS/40OA3kPHT6jfOUO3pQrV28auSS+cdqDXbhqgtsXDG954OaT0AmroBupEBs54ynLLqYlvYZg0qD1LDD959pgjIuuTpWsS3DWzKuqCB+yKOIHwezKYI2WDSX55V1wny06ZVVUdZk4Sf41vMfifGgBx9/pcJ0KFjidkf4wP2eXPMe7g7P3zn/BpG8QOqcseOT4raR7fEcH94MsWoM9IZajSlKy6TQQKfvyuUn+gRHa8UgAVu/p2Mi65lXkjEyqXt0h9fciiqSBJp1Oc0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW0zTnpSellvR2FNbnVLNFFDckpjWXpON2gvWkFieFNyamdSbG40UCtPN05R?=
 =?utf-8?B?MkxCSlVQd2hRMFcxUXAyS0JoeTNTL3A1Vkc3bWJIRWpTVzkxN0hHRVIrME9v?=
 =?utf-8?B?b3FuQUZ6WjNwcTNiK2dHbjhRRTJWUDlGc1ZCcWloWHhEWFBQZFQ0RWY3bS9Z?=
 =?utf-8?B?SytmM3IzaGxrWVAzclVxMHZJNnpnOWk3ODM2WTlRUE13dm1iS1JCYWF4UENw?=
 =?utf-8?B?Qjg1YkpZSjhGd2xaeXZKdTdXV2hhZGU4LzBZWlFoSzdzMXRicUl5SXQ5eTg1?=
 =?utf-8?B?S2dNMWY5WEdpWXVyaXFiRzMwRnJ5cEN5MGhHYkhQRFAzaU9ua1NWTEpnMTda?=
 =?utf-8?B?L0pkTjA4OWFDbVI2dnc4TitKaklGT050SitZL242UDNWYUNvcHkwTVVHcXNo?=
 =?utf-8?B?Slh1VXZuaEFjamgzTk1heTJOTzFPdFF2NzJwRVdxVlNVem9yN3VUZVhNaTJB?=
 =?utf-8?B?c1BJNmNEVlVTY1hZQ1RmQ2c1b1phTzYrS1JQNU9YcENmUnU3eGt6ZzZEMTNh?=
 =?utf-8?B?Qk5ib282R2pHWmNLMmtIOVFJZVFEclVpZGZsd0F6VHZxeXMwOThoaGk2RGV1?=
 =?utf-8?B?WXV5eDRaRUwzU2NYY3p0alpCVFVpTk82NXdUMEMySGxPNjlkK1FxcmR2WDkw?=
 =?utf-8?B?K3NnbkdYV1FWd0hvWXZiQTRQbUpiYXZwdWVFQWo2ZEw5QzFCcmxXTURjQVFJ?=
 =?utf-8?B?QnVTMlhLVmJ2VDJFMmVsb0kyNVJMVUtJcEs1UGVSTitYTjZOZmFYUVRWZnNP?=
 =?utf-8?B?QXQ4MS9VTnVRM1J2bGFkWlVtNjhhYmtBd3NPZUovNzUwdDE3c3RhMlBzOHpJ?=
 =?utf-8?B?SU56TDRFKzBiK1phTWdqUUw2N0F6alpUQ1l6Y0JuVEtzOGgyVFJRVTRkcHhY?=
 =?utf-8?B?VW1icWNXYVNpaEVEaUV5QU5wUEpQV1JSa1h5bjA3NkVmVGFXaFpRc2t3d29q?=
 =?utf-8?B?UU5tTnYvOTBXdjRWS0dCRHdxKzU3K0Y5cGlyZTlTQjcwT1lacTJSQ0gzdytT?=
 =?utf-8?B?ZXl4d2htMWtnaHpRQUlIeHdMTlRXa3kvamwxRHJMSlA1MmgwcjFodDBkVmhN?=
 =?utf-8?B?SHM3Uys2eVVsVHJDL1ZtRjdoV1lXRHBjUTJlRGFkYVFhY3NyVE9DNXZhOVhi?=
 =?utf-8?B?WGxoUUlIN21OOHZsMzZNRjJEOTh1eFFRT0dFcW9vbENNTVUyK1FHc0FtckVl?=
 =?utf-8?B?M1RFUnlkV1hjeE4ra1RWVyswWE16V0d0U3hXdmY3Y0t6N3JzL2N3bGdwNWpQ?=
 =?utf-8?B?VTlxZElJQnhPWEVtUllhQm1CUXhVZllkTFVPajJzR0Y3SFRUdjFwNHB2d21X?=
 =?utf-8?B?Q1hFWWpPZlhXNE90Z2FBQzUrWUZRcE4xWDI0d0psN3IyVWdQcmRDMWNsTUhW?=
 =?utf-8?B?VVNiY0FjeHluKytpaGwzSjhwTnlSRkxQTzNHSlhvOVZvTUxtd2ZvVXhEYmRj?=
 =?utf-8?B?ZWdkUkZjY1pVUmh1QUpMcnVNdnMwME9vdm83NjZtcEFWQWRmVHJPTnl0WE1j?=
 =?utf-8?B?bnIzZDJ4K1FlTnVzM0FpMW40ekQvYVZSTXZYb1NvZ1JMTnFEZ1JxbkFFQUhJ?=
 =?utf-8?B?b3JpWWR2UmtBK0FtYzJYdTZGRk1HekgvZUNCdVZScjN4R1AxL0RESW1ncmMr?=
 =?utf-8?B?T1ZRU2UrM3dHbEhob09RV0wyekJxRHN4dEhIck9xb2swSWtnTnUxTklPRSta?=
 =?utf-8?B?c2FXbmgxc1duOHNjRkZCUHg0R0txUDBCdWxhdUY2MUorYVB6NU41dXFCNDV1?=
 =?utf-8?B?MnBBS1pKc2hBRnAvMCtJNmdTWnJXT1kyY3l2UlJLTWVWWjg0Vkk0VzkzdmFN?=
 =?utf-8?B?YzRzRTdBZTk0U3gxM0NnTUR2UEJKSWxhSEF6SW9lUkxNSms2L1M5OGZOQ0RS?=
 =?utf-8?B?T3ZIbzNEK2pEcjdNUUZzZy9TK2Rhek9OSXk3MEQzcEw4ZGVFR3hEa1c1V29m?=
 =?utf-8?B?M2piY2hac3V3b2xScmw0dzFISTJmNTFvOGpxVE1yRk9RZ2hyYUJPS1ZNcG1m?=
 =?utf-8?B?aDVwNnBwak1GcGo1UXZLSG9jRGE4MzNaT1J6cnJXcjFmRFFhNER4MDg5S3do?=
 =?utf-8?B?M29wWmpFZXh1Yk1SSjV3OWFSUFl2dm1UdDVsYXBIRHB0SVUvcjJxWWNrSnQ5?=
 =?utf-8?B?b0l0TmpkKzBrbnZhcXVnaFQ4NEdqZ21PaWM5MDlaTDJhOFhyZTY1VkxLckth?=
 =?utf-8?B?dXlYUHVwZDZMRUJ6WlY0OHQ0aWxGRlloQzNwUVpRZ2xMdDJXLzF5UkYwK3ln?=
 =?utf-8?B?VWF4T2RUNE53R08ySVREUDVxU2pRRy84Y2Q5MzluSXMyQ1RZdjdZR01RYlNK?=
 =?utf-8?B?c2VoenpEWllCV3V4ZWswTE5ia2tyOVlDaWZxcXJKS3ZWcmRSNG14Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c8ba46-6754-4f6e-68ba-08dea525e630
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 12:58:52.8233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gz4m9T9DuMIbA2lndgL9RBWyVuK1/htC5dwCsSIrL2dPf7YukfTUrZFiZ82qSUiUpgkikoAkY9hqBTqzqQbh2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1777
X-Rspamd-Queue-Id: 96C87485A34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12901-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,linuxfoundation.org,lwn.net,vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:mid]

On Tue Apr 28, 2026 at 12:51 PM BST, Miguel Ojeda wrote:
>
> Then I thought if the same would apply to `clap` etc., but then again,
> we may want to write more tools like this in Rust in the future (we
> already felt the pain in the past the pain of not having a e.g. JSON
> parser), and whether we could have a more general solution for this,
> including perhaps even a kernel.org registry (either as primary or
> not) etc.

Personally, I think if Internet access is needed, downloading from whatever
registry doesn't really matter as long as we can guarantee that it doesn't
download random packages. Cryptographic hashes would be sufficient for that=
.

For the part of "not downloading random packages" but only those that are
audited by kernel community -- it could be achieved by using cargo-vet and =
we
can maintain a shared list of vetted dependencies.

Best,
Gary

