Return-Path: <linux-kbuild+bounces-12077-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFk3FaTiu2njpQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12077-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 12:48:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A572CA988
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 12:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8BCF3021943
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 11:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DE93CE496;
	Thu, 19 Mar 2026 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eim6K/9V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021127.outbound.protection.outlook.com [52.101.100.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2583CD8D7;
	Thu, 19 Mar 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920874; cv=fail; b=mKVYTNBKDUlVQ7/TdUWtgckfdUryN2WOluozs/cMUdcYSnXzOjH+l5WDxMStRyLjIOgctxJidrvEoFBY5Ic/oSR3X37ERExmpZJojtZkTHiuw8HA92IY7q3j28/IkovXviC86C1ZlrJehDSGsJGIl1aHJmnPaOBT2324aZLyfgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920874; c=relaxed/simple;
	bh=+n9zSf5J1oiN9W0txJU/VQ4F2ZSbl3PrJL7xMsF8R60=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=X41fsd8XqzHkwT/CvJqun6kT5pEj3VwFAJSFNjQG07i3NdtXY+4+a1oBj7/hhVplFCLVK+AmwUXrP3t9E1EoIKI3jOJQwK9grw+9NnIKFsm2JenwaoKKtgddEe8KWMv2jn/5lj7ME1ooclyEjC0aRTGw856frMv0bhB3Kn17w8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eim6K/9V; arc=fail smtp.client-ip=52.101.100.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihwTz2J95caU6LQz3NhPRAs7fhhCha6paQaQCN9qyuSaPAEoy1GBqPkoDVIf1bFlRF1dZXA92ZsHJsuF+rLMwsRUOOxgL0xxsYpTTbwtMPus07REtwpHBsKb+vs5vG3ns/Z+lqqpLOZ4+qbjRRBncPAGqvTNo7rD6Qx8jDR1SXbwl3TRJczeHv9qJBmFmOMANmI+EBtmTFi35wHwVTzAFiMI/oOyLW0rOrzqhNYs9UcPBZz+M3KU2cAqhcSTgBSVoMYeXaWHMZatUwgR/JozmLROtrVOG9AHegvb15SNWI3mLZx7lfeCalNZ2sW6u5efDJix2snTZSI2wP5jzoJ29g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mcnko24g5+G+/kPKO0G+crdMddYLcvSvwgxCDFHV2rc=;
 b=Tg2zs20u6dbyuRGTpnUzY3GLhOENIhehHEbOPDHhqvb9forbi+W1fi8nV5PJeAmzLpacLOGHvKEyTgkcmu8n/kbfJl9810F2mHPdOgJ6kCXXj1knWi4PTPKFaWLGloNhUWdCHePdJqRamHSzbLyfzIwkhMLGTQzAeRNaFPkqpOYSD9UhcLzT1rbdlWeOVBDqkOAhCDhsVDI0haRzavsRvaMNpL9/kFuz5qN7bbCXqImMma3SS8ZuzwbBupmrU5WnET348XNiwGVahuB1pOHnPt5UkgyqpvcGIrn8GltzwEY5lemmUSzcAcoWLxxIS4ViMYjVuQDa0ROmlQI5vi+/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mcnko24g5+G+/kPKO0G+crdMddYLcvSvwgxCDFHV2rc=;
 b=eim6K/9VPrQLK/wBIA0IQCWJ6uzLerA3g7f2QYEtp3N13IiTR6bvjWXfThnkC5tsYfJYiKzYQpEDTJ4VPbr8+FO/XHBAWbF4sWnrp/xAstINy/FrIwFjBl3/mwLUtP/w7S7AvwL8einHrtcvObgeBD2iWotrlgnHURW2KiDizQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3359.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:47:44 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 11:47:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 11:47:43 +0000
Message-Id: <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net>
Cc: "Rong Xu" <xur@google.com>, "Han Shen" <shenhan@google.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Matthew
 Maurer" <mmaurer@google.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net>
 <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
In-Reply-To: <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
X-ClientProxiedBy: LO6P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3359:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ffe0a4-a6bc-4c04-0d3a-08de85ad5530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	EuY4fw62XsidwgVUazE02+itkyPbUc9nHhJ4ctBK6kQ0pzgcBjbVmCUaJHNtGmawVXfG3jf1mWuZuhhJBInFdlpO4S7wbcs4AzmubCrEUZS3Rlg4mZAew/zwTEKUJdM0YhEp3VG42ZwwDRgxFyXji4HPyKdYyXUttYJLANWzVADv+y7+iu2owj3F7Gsf/pF7aMG6ouCkEZ7jTlvsxsX1lTGSdtCzckpWk7Irq/rDmfontVCeKBesoH7/0xvIeMOKtkwoSg0Ld8I+/NT7Vf7Mggt1999tKOGAGEORvhsMqLdjgm7DKIi0P5IEfXmAuYOlwEqJcieeNpF90TExjeae0VVzjhcovEiulNhoAa6EKWM63II0AK3JK7Ke/yb5Ln/J5smZEIrOyOp0wpcLVqZSrpINWqTBXxEPr3RbsSBTxqTsngxmwY72qtYeXWNiT9sPU5zxOuhhPu5emVCAmCw3qQEP5lgT8LpPGWpi5lvnS68yD8bSqBnzENtHj+b1VsivDEugpkZqOWnspbi+B/jdymatkdodawXsVhcWCx7NrgvRlU49+qd0N2AhPBMZYXn69Xy8fghPtcU4a20k/07mtFqHT+8izHOjk8oVcTCidggo5HP/LaW7Y+LOhLpts8FX7DCz17WhRA8y1yF674mI6WpthOQi8NV/Q/6MP4qFheK/7hnL9u1NEeOPZEv0GZVuMpxxGRFpxs1rllp9i2NpaR2XHMjuKVMWeN+p+6rcp/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlpLUWNKamd3ZWtnNDdvNmNJeEZlMkgxbGRoZkJSS09HNENYYWFxTk8ra3Er?=
 =?utf-8?B?bHk2Q1dmNVB3eFZXZndGM2J2M3dWT0NzbnNXOVY3WE80elZSbkRySlFHQkVY?=
 =?utf-8?B?TGRna3ZSMzZtZEpVUFRLMFhNVFJtT05vWWM2Vno1UkEwazBrdE9sVExuNGRw?=
 =?utf-8?B?NmgwRkVtQ3VGdnRUOFJuOEFTK3ZtTjZZTjhnUlhiNW1qTkpORXJDTC9QcVNl?=
 =?utf-8?B?VWFoWXQyci9FVHVtSmgwMnlDVG4vZEtOUTJkYm5JVHY1RGp2MDJWb3NJYWRE?=
 =?utf-8?B?Mk1LK25Yb0dFaGhCOStSME9iQlhJbDU5SU5Id1U5YnhERzBlalZqUWcrTndv?=
 =?utf-8?B?ajYxaXR2VXBmeTMwQW81eWpFbGdRZjh1My9JYmdIUlBBTU0zbGo4Ylo5OFZv?=
 =?utf-8?B?Z2xhbVdBU2xoeEtaNXZNcDZLeDBRVml1QjQveDl3MjZzRXEzQys2akhjcHdE?=
 =?utf-8?B?eWVtT3N2a29CMGFnM3htRGd4VDBKaXliNmkya1JTb3N2cHpIVXB2TUZuVUhL?=
 =?utf-8?B?cGYzMFBSZEp4VStOT3gyeTU5b0pVRmZmR2JvMjBjZjU0bk5BMWpIZ3J1eWE5?=
 =?utf-8?B?MkFUdk8vMUNndU9TZVpsZ2FrZmc0TUJvOHR1NjhhSEFveVRnMmJhcVlYZGZ6?=
 =?utf-8?B?N2YwaGRnT0tjV0ROcWRHUUNRTHpmRGxKVnIvcHg5bmdTMlVEaDlBYWtvVFBE?=
 =?utf-8?B?SGQrSzlKbEpQWlFmbGdUeFlTR0EyV3R2V1VZc3pKQkdId1dUc280S0E1MVRT?=
 =?utf-8?B?U3cxTFRHUDBnWDBPejNocHFTSUxLckdDaVlMaTUxTHlpVUh6VmdkNkI5bEgz?=
 =?utf-8?B?NnJpSzN2WS9TeGJ4eDJPaERRMFNnZXQvaE1nYUt1ZFpEYVlZeG1wL0VTbGlU?=
 =?utf-8?B?QzJLdUdLV3RobmpzQXZleEk4Z3ZQRy9Hei92SXdiYUtjSzJWVnRkalgxaVQv?=
 =?utf-8?B?d2VGUUhiazhSRUdSaFhMRVhtYWtRWDg0WWJ4ZGIrTEwraEIrd0ZrSnlzQ1dQ?=
 =?utf-8?B?Tm12WSthY0dOZlpTZUp4b0lNQWtENmwrcC9temxNbWs4aGV5eEZHQlJzVWZj?=
 =?utf-8?B?amF6RStSL250TFNuL1RDS25ySHozVzJOTEhXeHZ0SUt4L3FFWXhhU09iMnlH?=
 =?utf-8?B?SUx6MlEzN1k4dVFHVWYxWHFTRllBV3pscUZ5L09hZUo2NWo5cDQ3S2lSUTJC?=
 =?utf-8?B?OUZDem1qNm5CUWhubk1zOGdVamtCVGN2M3FpMGxsYW9xd2dkdGtFSG1TSXI1?=
 =?utf-8?B?eVZnYWVTaUM4RUE0UmE0Zy9XNC9OYkhOQU5nUzRFYm83SG5DbkFqazN0S1ls?=
 =?utf-8?B?NkNxOTFzU0JxWFdLa0dxTkduMVNoNHUzMCt3TzR1YXUyczRCbUNGU1E3TzJB?=
 =?utf-8?B?RlNxMEw3SjQ2NDFWMWVXaU5aTVZ1YUtnRU5PQkp5cEEySFVDQU1PWGpZSU92?=
 =?utf-8?B?Yk5yZmVHS2dvOFJGZFRuN0ZQREFyRmxENGM4d2c2eEhiTHBiMENBQWw5a0d4?=
 =?utf-8?B?Q0hHUlZrZXNNS1dIdVgzNXdzb1VDcy95bUFFVFZlMWd3NHRlaUR1Wnkxdnhu?=
 =?utf-8?B?UjBhY0xudHBpL0ZLRjhiSlpLM1crb3NhR1BjTzc3aWl0QmE3emZ3UUVYem1o?=
 =?utf-8?B?bTBqSEp2dng4OEhCcUNmTjFWMXEwNE4rZlQ4TkVQWHE3UFdXTTBCcElsa1hO?=
 =?utf-8?B?L1diMDE1Qzk1eStIazNRYUJGQ1FENzZET3dJdEtuY2RxYjhwNHFBd3ozWENx?=
 =?utf-8?B?ejBKMkl4UjV5amdzazU1c3Z4ellvdHJrWEF0WHp0aXZjOTZTSkZGQjduNC92?=
 =?utf-8?B?akxXM3NLYVo2MTZOVGREdnNyQjg1a0dYNTBRZFJ0Ry9jTk9qT09sSTkzK0R5?=
 =?utf-8?B?ZEtncm1hQ29sZDdCY3Jmelg4TDMrYWNnNGtjTlJPdXV2TFdqTFlsQnpTeHNi?=
 =?utf-8?B?NUloajBGWStUTVU2T1pXT3IyOHJtbVRvOVU1bCtzV2N6KzhaRjFuekpIdDNJ?=
 =?utf-8?B?L2tDVW9iWDlaUVFkaFRKWC94OEZPREhoMUptbkxBRDdIM0dzSzEvTXZTa3NN?=
 =?utf-8?B?TDdaWGNINkk0NXRIV3FjWlBPalloSjZYbnFSaC9RS2grWkZMNjhkdTZGd2lL?=
 =?utf-8?B?Tmh5dWhBRGZEQ1N0aWVEWERKR3g2TVFJYkhDZ2hzb3pSTzFPcUcyMVVTWENO?=
 =?utf-8?B?TlM3aFNaTzNkTGc4Y1B6STNIK0QxYXB0QUEwVnAxekRuN2RJNVRQMmptcm1o?=
 =?utf-8?B?cmZIVGU4Q0JDUUZmOHI0NittOW92NEozVzZFMjlNUExNelFSS1JrNHAwZlpT?=
 =?utf-8?B?eTR1OXJSSlhpeThCNDFMUjhjVWJYQWExcnpTMXR0Ukd1dFdZUHg1UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ffe0a4-a6bc-4c04-0d3a-08de85ad5530
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 11:47:43.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXSTSZ0WMaUaYC0NFHRYX0Smhq/LGmYm1hKj794jSwqnDTuU57036IvxlqILKXvB6V0TH+ifbM2lfhtU0ty/wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3359
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-12077-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,protonmail.com,umich.edu,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: 00A572CA988
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
> On Thu, Mar 19, 2026 at 12:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
>>
>> On Thu Mar 19, 2026 at 11:22 AM GMT, Alice Ryhl wrote:
>> > This patch enables AutoFDO build support for Rust code within the Linu=
x
>> > kernel. This allows Rust code to be profiled and optimized based on th=
e
>> > profile.
>> >
>> > This was verified by inspecting the object files and confirming that
>> > they look correct. It was also verified in conjuction with my helpers
>> > inlining series, and it also appears to have worked correctly when
>> > combined with that series once one missing thing [1] was fixed in the
>> > helpers inlining series.
>> >
>> > Link: https://lore.kernel.org/all/aasPsbMEsX6iGUl8@google.com/ [1]
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> > ---
>> >  scripts/Makefile.autofdo | 6 +++++-
>> >  scripts/Makefile.lib     | 3 +++
>> >  2 files changed, 8 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
>> > index 1caf2457e585..3f08acab4549 100644
>> > --- a/scripts/Makefile.autofdo
>> > +++ b/scripts/Makefile.autofdo
>> > @@ -3,14 +3,18 @@
>> >  # Enable available and selected Clang AutoFDO features.
>> >
>> >  CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enable-f=
s-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
>> > +RUSTFLAGS_AUTOFDO_CLANG :=3D -Zdebug-info-for-profiling -Cllvm-args=
=3D-enable-fs-discriminator=3Dtrue -Cllvm-args=3D-improved-fs-discriminator=
=3Dtrue
>>
>> I get that it's currently named as AUTOFDO_CLANG, but this really ought =
to be
>> AUTOFDO_LLVM...
>>
>> The flag translations look correct to me.
>
> Do you think it's worth having Rust not match the CFLAGS here?
>

I think the C flags should probably be renamed AUTOFDO_LLVM too. After call=
, all
the perf tools involved here are called llvm-foobar as well.

Best,
Gary


