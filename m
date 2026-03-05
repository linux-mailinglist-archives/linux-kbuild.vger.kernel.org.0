Return-Path: <linux-kbuild+bounces-11582-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DUdNuR0qWl77wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11582-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:19:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4930D2117CD
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F4723068ECE
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 12:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F97B39A070;
	Thu,  5 Mar 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AZEKRimD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022089.outbound.protection.outlook.com [52.101.96.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0539B48E;
	Thu,  5 Mar 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713084; cv=fail; b=pCnBrzMnxvlYYaREBKZrjLRBoQ0wnVLwZ594Jz6yDBNYZm9amR8v6RddSSm0h+C22phFE+1uh/N8m4sqInHwp1OddWz08a6XMK0K2kO3c8mOmOyZXKx/+C0QjV2sd6Qtc6yOH12N+jGJjN9I/pJShcHdmY1mIVQJfCZw4cHLh2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713084; c=relaxed/simple;
	bh=FsDs4WaJIZ0CWh0e17fRoDZ0SHXmcfXsISGRHCpqQCs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=R115JLs8TdYP102ezLv0zDyhAq0S/4oxjgcpZR0sEB3KRHtyPiWfh6S5f+pwNV33uBC3+A1JTC0/Noqnt3qoIE3XFuVkVdo/njj0mXoVm4pvLFjhjehcrpYXpZKxJ2H7ri8lSXLj1ptZDWb7Ljmetx7A+JQRch6LQxScj3G3Cws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AZEKRimD; arc=fail smtp.client-ip=52.101.96.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6S5DOXB+S0Dz3u/oKWwYLX8wbQszwT7mwl0BgyAqtGeV87fap+m5iyiFpNVmnw8/9T5vmr002TkvNkjmvTFLKLrYS7+g5R5pRd7xuu8hP536rEQUgsXFbpOiHv/1M4n3oD4F1cbcOjTppc0C53MQIjfR5qjbWe6JPr56h/t2zSOXGrxv2nfyWufDgui4jgBWUW4bcuUi3kA/CyqaYsG0Cu4YXsZbiYtlEzla7gMOrs2UX7NDnjvNwApFvoam4J6EVN3DuLePbGd967/MfCnEtpGChi0erXP2qbc/x0SibUlW2BoCu2yRAgkWNVERczG1t78B70GpTwCCuGgT0RbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsDs4WaJIZ0CWh0e17fRoDZ0SHXmcfXsISGRHCpqQCs=;
 b=w1a2JQCPehLs3HjnV4VqDHoC9rD9QoJjqgosQM6edivNdZphrjzO2TTJI0SwQ9aFnlmEq2YAeK6bgNa0hBEx74in1DExru5xt1ib/oGFjdAAqGoix87hRtBjt/zw21IykQU+5gOBcovlstlcNzwRs5JEUQB+EDKNYmmX+prRk7OyzPxVINYe1IfRBDScGOjORJuC3rjhnyzf5elVNSnQd02l+yHfEYKCkQpmonqgimb2b9/86WPPDLov//+Npo515Iuc+Gi46gFe76sD0preRaSwsR2yN/xgVhulIKKTURUtbbrY10QUG+Au9NjExwvlUg1Yl0yu8haW68eDtvGotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsDs4WaJIZ0CWh0e17fRoDZ0SHXmcfXsISGRHCpqQCs=;
 b=AZEKRimDjFS+DTulAzC29Kgo4OsCCvUIjIK+EfSsXDyX2qYq8JJvYOAbNoopvF0ocUyfEcU2QfQ+70HHmX5XdJBdOvVMTKPJibLuMC82PFRI3XxreWepI5ctOrddCbZ2NZ6Q0go7ueGrz8M8noRHa40hCbSZzwZQEnBfjenL2rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6302.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:185::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 12:17:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 12:17:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 12:17:52 +0000
Message-Id: <DGUUC74P2D10.30VWI1W6CR6Z2@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Jesung Yang" <y.j3ms.n@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Carlos Llamas"
 <cmllamas@google.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/2] Change Rust Binder crate name to rust_binder
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
 <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
 <aZ3A_KBWFJES0d_t@google.com> <aalf03M58WisOEZ-@google.com>
In-Reply-To: <aalf03M58WisOEZ-@google.com>
X-ClientProxiedBy: LO2P265CA0433.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf646bd-22e5-47fe-80a5-08de7ab13a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	CBSFcFsjSSCDmjg1yKrndjzvKmxusjeWAST6GGAe3U8qwJLKbyHmRL9eiScvaHArk8y8eW3MlEyXHULumMMs5W0vyPj/oh6Gd1NOACjFCRiwm2zq970h/Z3httkffDdP16XJPrOq7zOWbUJf5/OTQZMobpQLY44h1PVCmdfRs8qZdlrEjftHUrrp6pcc1/BtrCCRmc0WgBuz2yT2VIFU5ooDMSC834N+1zcVWhSIdcxpmgv+VFdkgyLa4Pv3Ahd28Rvl0utj/76xa6Cx1Q2FcG/R15TIFL0VDlswgYnREgehAE/RBbPF3o9l1tMAzFC074bTVeJgoh8ImMiE55Pln/s32fo2ysucftx7c7qasA0RQZ+zUAlrh9ZHBsAbmNstszXJhMX+BiizKS5LQl2nF9mr1nK23BNEaT+rDTsiA79nTFNYNXl4ViCQvUaxVt1ik6WLnUUEa/SLJA/OvZkW1LUDPiResTjMmGJPjyz5Iul8q9QXq2CVy/WGiB4ZjR2A6A1rCy7mTjS5gzkNFlEgX+Owsw76tHaRQBo1wiv4XNrxMRGJ+QPh8CuwWAlQ1ICwOvTuQwtZn29PSjTSbY3tN/4rlwyr9sw4GT8Y0n1+oHsRJKSag8q9h/27MTV33/kEPajBOTnkdvJezE0UQSdAZaub42NnKR331+4gtmj1mEPZ2RHi4aQsohB4xYAJu2Egr45AhIte6M/L+tC0NY+rarDzW4gNq7K+fezfBhcHo2I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmloVEZhL0NvU3ZFcW45ZHB3YlAzbGxLYXk2WkVZV2xyUzBLMzdlZnJRTmll?=
 =?utf-8?B?ck9wdi9Rb3dkeDk2ZmRsMHJYS0VLMXBnYzNZZzRXeFJXSzZlRXc1YzlvYk9m?=
 =?utf-8?B?SUo3QWZLN2ZVVy9hYUM1WDVXalBud2pIRVpMdDlSWE1SM2NGUXNPV1EzK0hW?=
 =?utf-8?B?d1VudE4vZFEwR3lRbWVzWDVZVEx6SGV6OXRGVGNMdTJPVWx1dE13UzIrVG9N?=
 =?utf-8?B?VXphU25zRzZrZjZCWkZiRllxTS95c2F3UkJsajZpbWJ1YmlkOENNSzh0U1Ur?=
 =?utf-8?B?NlNvMVFiQ1BxRzhjTzM5alZBRlV4djVzODBrVFgybXhvU1BMRTdrbzFjL1N2?=
 =?utf-8?B?Zk5NVFdzTjNMQXc4dmZMYXNTV2ttRjdpYXA1eW4zVW5leHprRUN0MHBNVUxT?=
 =?utf-8?B?YXB4elY5Zk9Ndzc1NUZobDdUYytWaTdOaEFUcy8zbElPUlBsZ3VNOHU5NDNl?=
 =?utf-8?B?MWVrOG16UmpnZzVLQWNCREdZdmQxcCs4Z0lHSi90MFFFNkgrRit0RzdDYS90?=
 =?utf-8?B?Y0krbW5WcVJrL2MyaDBwUS8rS3lJTnVFWlUwUGl4ZlRKb3pxakZoejRFcUVX?=
 =?utf-8?B?Ykhqb2l2aUZud1dEaUdqelJxblpQWExGS1ZkVjV4amJWaHJ1Yy9aSmdMYTdQ?=
 =?utf-8?B?bnBaZmc2aTN5K1BMT3YzZWJmSUJuYTd0Z0xDaURlZy9tRDB3bCtmdEhOcTlu?=
 =?utf-8?B?dGxzUGN1WkdXdHJ6VjhPc1ZrRHc0azdFTXVBeFVLTTFTQU5JNnZVQ3F5UjJo?=
 =?utf-8?B?WHloY29DZDFuRkFQc3RDc0MyRkh2STJnUUFtMHZ4ZndGNmtidmUySUlaNTFU?=
 =?utf-8?B?VzlyMDQ4QVFBSzl3USt6d0pkaXpHcDMzRTFDRWJIZ01BSW81OUdWbm9PNU9y?=
 =?utf-8?B?ZUpEQTJHQ3p2TGRCWXluVGxFbVI2alBVR21rSHE4cTlwWlVVRktPN1RXYUJy?=
 =?utf-8?B?Z3JON2E1NWp3VkRacGlQWFZHSVVhL3ZJYlZYNXI4dzhmbUl4Y0VqK00ya2hk?=
 =?utf-8?B?S1dyR3Uybmp1T3loZVN0NXhWbExaaG55SlBhNnVSd2t0cFM4dWJkaGNTdFF4?=
 =?utf-8?B?V09oT2plcTU3ZGU2RG9aRW1jakJoeGZPdXQ4TkFmY044dS95VlhzVDhhMENV?=
 =?utf-8?B?bWhwQXBuNXNVZHpDMjN0R09JR2xMaUV5Q3JNdjFFY3ZBSURCMEo1RUt5cElE?=
 =?utf-8?B?OWJ3b2hFZEdhWkVzdEpKQngyN2JwOCtWYmI5OTdlMkxybjBFa1dBR3hVL1FF?=
 =?utf-8?B?SEJSQzZmNTZMczJGTG9hWGQ5aWdLUXM4bExaOXRQTndIZFF0YUNTb2tjbDZJ?=
 =?utf-8?B?UnZ1c1ViZllxRm9DSlpyZURRTFZpTkhzQVpoWVI0ZUJkVFU2eVBDdVI2OXZ3?=
 =?utf-8?B?a0U1Z2NaNlFOUjlzS09VMHd2M2RmTXNxblVvNVVtYW1qQlpNZndKaURDa2lQ?=
 =?utf-8?B?cDVnQ2NUVVE0WXlYZ1lsenIrY1owS2VyUjlSUGt4WW9ub3c5YzZabWM5VFl5?=
 =?utf-8?B?OXhtUWtZU0RQbS84amlQTXB0bGkyc0VPdHAvT2FuNWJGbkpma0Z0dzEzWTdL?=
 =?utf-8?B?YktvSmRQOGhZY0M1bnNTVVpvODFlU2k2Z3BwZGZ6VGtzUWNqalZhMUdzc1VZ?=
 =?utf-8?B?bDRGTGlPWUxLMEl3YUQ1TU5Pdlp0aER4MWppYmU5Z2N0TXBIendzZjlnWnFI?=
 =?utf-8?B?dnQ0MTlhc05NL0RUS09TdnJtSmFQQ0F1VzZkeHJhclVBN1lLV3g3ejI2S3dS?=
 =?utf-8?B?MElxWFU1aFRBOEtGRGVuT0lOUWVuYm8vMUFDNHZ3MlJOYUpSZHRWdElCZ0Zx?=
 =?utf-8?B?SERnQk8vQnJidkNmbW9oelE5YkhZaWtkcHJ2Y2Z4OGRiVVR4U25nbXhmeWJR?=
 =?utf-8?B?Vm5IQnRXZEhrQVJBZlJHQTVNNWllWmsySlB0TUFBWExCMitkY20zMGpCMnNY?=
 =?utf-8?B?VlBtREpqaGxFK25FU2U4LzBpSDJDRGh3RjZTcFpzMVpIc2pVTHRoZmQ1dGVy?=
 =?utf-8?B?a0p4aEpkOExya0o4WlQrY1N5djQ4NDBWU0haMGhKZnZGOXJlcjNQSTBWb0Zu?=
 =?utf-8?B?eTFQckhaREpXVmw3TTN1VW42L3dtRURPNWdQWEhvQWRYZWIzdnQzcWJZeXgx?=
 =?utf-8?B?VVJPR0ViRUh2NXVUZjExbFUzU0E4bERCelBQYk5Ja1JpTFVXNUJkSzdzVWkv?=
 =?utf-8?B?RHFYU1I2b3QzMlFnQ1RGaDY3cHZndnZKQzlwdEhMMnZzN0s1ajBYbERFckFF?=
 =?utf-8?B?eDA1ZU1yM2pNVk52QzhodHpjOTNsSURib0Y1MFl3aThMeVlCWHd0V04zWXJE?=
 =?utf-8?B?bDFodU5jMHhxTVFXcWZtMlN5Q0RGZ2VHM09PWnJDcTMrWkxqS0RMUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf646bd-22e5-47fe-80a5-08de7ab13a48
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:17:54.0083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXCcpL1gLO+3lxUoN79cRA1AJvqZ22G8QvKVDFHnelX08yNDHS60eyGBm3JcG0G4ADgJHzflXlDet+jby+LnJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6302
X-Rspamd-Queue-Id: 4930D2117CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11582-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,binder.rs:url,rust_binder_main.rs:url]
X-Rspamd-Action: no action

On Thu Mar 5, 2026 at 10:49 AM GMT, Alice Ryhl wrote:
> On Tue, Feb 24, 2026 at 03:17:16PM +0000, Alice Ryhl wrote:
>> On Tue, Feb 24, 2026 at 02:24:59PM +0100, Miguel Ojeda wrote:
>> > On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
>> > >
>> > > Currently the crate name of the Rust Binder driver is rust_binder_ma=
in,
>> > > but I'd like it to be called rust_binder instead. This affects e.g.
>> > > symbol names in stack traces.
>> >=20
>> > We discussed allowing to customize crate names years ago, at least for
>> > dashes vs. underscores, for matching C names more closely and perhaps
>> > other needs.
>> >=20
>> > Back then, we decided to keep things simple to avoid confusion (i.e. a
>> > single identifier used everywhere the same way is simpler, at least
>> > for humans) and to avoid having to deal with those dual names
>> > everywhere (e.g. adding workarounds for rust-analyzer here).
>> >=20
>> > I talked with Alice about what she needed here -- could we rename that
>> > source file to just something like `binder`? That would avoid the need
>> > to have a custom name, so everything would still match (symbols,
>> > source file, object file...), and it would give you even shorter
>> > names.
>>=20
>> Sure just renaming rust_binder_main.rs to binder.rs would work too.
>
> I realized that there's a much simpler way to allow crates to rename
> themselves: do not pass the --crate-name argument at all.
>
> Because if you do not pass this argument, then rustc will use the
> name of the .rs file as the crate name by default, *but* if the crate
> contains #![crate_name =3D "..."], then that will be used instead.
>
> Do you still want to enforce that the crate name always matches the
> file name? It seems unfortunate that it's currently impossible to create
> a Rust module where the .ko file and crate name is the same, unless no
> extra object files are linked into the module.

I think previously a fixed crate name is load-bearing because we need rustc=
 to
emit outputs to a fixed location.

This shouldn't be needed after commit 295d8398c67e ("kbuild: specify output
names separately for each emission type from rustc"), so if nothing breaks =
with
`--crate-name` removed, then I think it makes sense to drop it to allow cus=
tom
rustflags to override them.

Best,
Gary

