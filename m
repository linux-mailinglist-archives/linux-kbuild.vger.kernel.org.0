Return-Path: <linux-kbuild+bounces-11513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCqFN5+kpWngCwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11513-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 15:54:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C47C1DB37F
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 15:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 034553073F7A
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 14:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84494014AF;
	Mon,  2 Mar 2026 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="m+xmmBWu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021122.outbound.protection.outlook.com [52.101.95.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196B33FB050;
	Mon,  2 Mar 2026 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462970; cv=fail; b=qne05ETCpRQmNzLFJU0gkBI9pYDHL6+irfczPR+wcL7u56Qe42D8QPamOtyPTXCJxk7PhFzW/X1g9LHbwNa4d7Ls/yXqPxTulfUWvAMsmbqDjis04hszjB1seLyt4+5rQnVWel1qt+GZ86xDBL9VKx6C/JDZhgbKiSiVOT6/m7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462970; c=relaxed/simple;
	bh=TQu29oBiPoWwncnzgA31H8xlMnO0OHOx0QivBP0u120=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AHYWOPE7UgkFCpOik/oc9kPtZvD/1Eo6FQ6ZzDspaCSqVAJhzVS/aeN6SDqUmPkUnEu80TJDAvIQout2nmXe5n9DIq9H5tPYFqhbfBCCFRUBGYHkIijReg3pQSgnkMvU89nI1vHNgXN6nmpLxGzPOfaAAVkXDOjGf9PThCvvfJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=m+xmmBWu; arc=fail smtp.client-ip=52.101.95.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SY7YwbXsoRO3NY8XayUpWcVmUhhT5OHN4tugrKKxq8nf4L04mvHCnhAYvUhJnhUEgs9LxIXMrtC2iqnUT7zsHoxtiQAFSkOo1pCcXUtCEbTImV9g1wfwIWGGGnSP4mbY0Z1p4BELXnrpD/BOhwzrPkn4jKx5r3IlcGg71Ss0O1TpTjPnTSViHswR8HEK8Rfz8Yvwp9QLx8iAof2KBtg32k8tU0JjA87W39YjsIdOIvHC0lzdvy38eXsPnDaVtoZArcZGc50MZGI3b+IgqvNakMf6scOGp2w9TRDuc1cSdBeDbqoAidUCD6xd30rdrlVY0w80OXSBo4hN/ml0Z96Jcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIS+aZVFENn2FbwJRpkVfErI2Botq02BCpP/hgLctE4=;
 b=KDLwJ6MoYlaQA8z29VbQFl9QIY6NGufeDjSXHPU9kGlsmnGna/xljoCYbdmbCtCjjknKdKQjXWBjFKKI1HJ2UPHQxjOuMoyEgP3Sq5ybnHkhJR1jtRgRYnDbeQUXbn/VYq1QQh15d02FueZSriUZOB+67lE/a5GYFpwvbi2Es7DHZ71dqJz1vTkk7OuqS0SQPTHwl8ZS9X+Vq408flxINwVBWxdor9nAdLxZJiwrEPMeVSzdsm79J/UBXeOCrzvlx7NuxXKzzcpZliIvEKVLK4ytSRZ4Xez80LN9RgGVKVwU7u4Ve7xZg5xJ14oqXRuXstrYAdRYnK0lcRCBe3XIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIS+aZVFENn2FbwJRpkVfErI2Botq02BCpP/hgLctE4=;
 b=m+xmmBWua6ygcl/4pVPJBo77Fs9DlLuLEe094l/oVp3HRmHrCKqH1HHFHf0L0LsmU5e8M5GVgQeKHYGj7dukJpLlkJhHwNC+XAzcsHXWCdYUDOvBkm4WXttYGAT6WEae/3DIRNth+VgyVcXqz5VjQRswKr1/KtP4U9njsqXHihk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB9294.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:273::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:49:24 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:49:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 14:49:24 +0000
Message-Id: <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
In-Reply-To: <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB9294:EE_
X-MS-Office365-Filtering-Correlation-Id: 27691dc2-feff-496b-3055-08de786ae582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	9Tt00LJ29ea1xSOUv1Mz8boAUBQ3nTnGE4gJuJOWMHX5tUxR5NmVhg0blgFk0Y4Lvnx4b9puK2/7EJHD0EumXaZdMVhljM+pyCRrYi6J3mnHQilGvrcj7shulaHNVnNNyJkvLRq5J/q+YokUDkvuNVStvdHZbyAm0mQ90VgJ6ScTdCVYHYLad9d0xeQwLx1WV1Iagvb6+JFC5EA5Zk4lbp33Whv+cbP+p3RXOBJARnETJbRaXAPZvhb1RqY0gLnfErafE4kxoY5aow0BstK0qGqedend8CllMU1Uwd0izeJ+bvZPHxhUbIoWlXigWOOKd/YkTcaTsn0vNVSLH25WO0cdtrTQTTx/l5KKheCTP3FXmFu64NTBHn1EPpTE/MYsfX3VX2w3fjqad++hkGkqKx1sLA9uDvoZSO+db4PXjREiNTVJom75kcLiWh6hBhXvCwePFYOdYepWLPO579uw3GflS9wvq8LVg0CMnanpsgR/3IL5139PhKRJZiLrU81GlQMMh1bRWQn60aRrjPDU2HxhpBDr9kB1pwHq4WD1nGUbQHbSauzmE38r9TPAHRa7BFwW5WmVv5Rmox59e89u3AzusXSI6/rS9+6zxVBojGLSE+zh7xGovo/Gb03VlKyWjlZqKRLP9GU6DGRhponAwG3UToPZHUzZQc2cErI5pLZLatPbu6jz9MsJp0Fkjqp8bh1MYgw7o3tM4h+wwMVuYYzfso9Gv4zf4lzwH9YITnwvmT5+TYN0Wziy/+u68ltm2aJmJHZcvHwRGBjh7U5MXGdkVo/sY0uqDZwNq01QXZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjEzdjdZaDNFR3FWNVdEQkJjK0JmZExGS1djTG0xSXpRdDdyNk5VQkVnMkU2?=
 =?utf-8?B?dFNtMFc3SEcvNnBma1VmOVlhL085UEVaWFc1bllHbWpJU0cvZGJ6WlpGc29z?=
 =?utf-8?B?SEJKcjRPVkdIZmdJdmxDZm45UEExZ1cwRnhjY1AzdkNGdFMvMEpMUEduSlFH?=
 =?utf-8?B?bDFPcGdzSkVJSkUxOXVtVUhlbDRkQURsWG82enF6MDBnZjRtUnlNNnRGcW9u?=
 =?utf-8?B?Vk9oUVNtOTc4WHZwRTNSODJCVE13YTZOYzZpbmNGZTVoVUJSVHRpZDJmTTgr?=
 =?utf-8?B?c2wrbW5FaEd6aHh4ZUhpMkZ0UWFJWk43RDdRcFR2dEhCOFhKS2R1MEd2NGxF?=
 =?utf-8?B?Wk55V05lZ2tqZnNuTU8rdDU1S2RKVS9nYTVMUFdYY1A2bUJhZG9Wa2dwVnFm?=
 =?utf-8?B?ZGYvdE4wK3RXNThUQUVFRkUvaGc2UnhlUnYycUN1RytVL0NVei9vSjRJQUZJ?=
 =?utf-8?B?bTV4QkY2eFB5OHYrb0J5TWZkaStRQlEyNkZJYWQ3Mi9VSnFJVWJ4eUIyb1BB?=
 =?utf-8?B?d3UrNDRJL1RySkkyTjdCU1hhRzVHSmxLWU9XVmpsVlJiUUlNdkdvcmMyQ3Rt?=
 =?utf-8?B?VGJNbGR0a1FmWldnQnFzYlp1c09hMUJXN2V2eFhreGJOUGZSckUraStBVVcz?=
 =?utf-8?B?aXg2OWhmWFhJbWovcGRKYlFwYmFPUXREVFVXcGVoWEJ6dFBHUXdtQlFVaUhM?=
 =?utf-8?B?M2d4WXVrZWVtZkpFY0xZcXFTbG9xWTdjVFNVc0NwR0tlQTNtTlRxVjB5cGVE?=
 =?utf-8?B?VXlSVkM1K2Y4UDZMc2tDbjlVb2lCcEpMR3ZHdHArNC9aK3FNeWhzeFNLS2R6?=
 =?utf-8?B?cXpVN3pMM2tnVjZqZC8zNXZUMnZVREh6SzlkVGtLVEx5V1Q4WXlodU00OWp2?=
 =?utf-8?B?QTFCNmVpeU1Jc2pZS3VKRHJxMGlleE1HTk1aZUd5eUVaZ1FOZWZoaU55NWZO?=
 =?utf-8?B?SHJWZmkvQmNwK2g4MUFtWTBmdGppRkpNN1ZWNXhCekJKaEFXb2ZRVnd2bk1J?=
 =?utf-8?B?L2VFN01SUXF4TU9hQ2pGSEJjaXN2LzlOa0ZPbTVDTFduMGFaekNOc055dms4?=
 =?utf-8?B?QXp6NzBPQ29PVkE1bENwZEpVLzZUZVg1Q250RFFOOXpvZ1h6OGVXSmwxL2lp?=
 =?utf-8?B?akl5VWI2OVZuYitLWll4NlVTVXpTRWs3c1FteEo1aEo1cisxZFJ1b2w5dTZv?=
 =?utf-8?B?ajFYSzdITTdyWTdKUitPUHNWMCtBcDl6Tm8ydHdyRGs1V2JBbjRsTEcvNGY3?=
 =?utf-8?B?YzRoN1VQVU96WUtadURkRU1leHBOOUZZcTVRWXFEeWczcHdIQURmSi9wVmIr?=
 =?utf-8?B?TkxxKzFueERHaE5yNUNZd09rUEQ2VFB0YmlwM2MrYnJTeWg1cnFmREo4V042?=
 =?utf-8?B?dFhxNVlRc2hWcVk1ZDEySjcwWnBtdmZ6YnBnM3NSTFUxN3NseWR0QlZYQmsv?=
 =?utf-8?B?b0Vqd3k2QUtXZlFQbmlXcVlBN0RNODVKRGtBNUxoR3NEWDBxVkhZYUM2bVdO?=
 =?utf-8?B?MDNrVEpJL0FVU0xZVGVCcXR6S0d1ZUwyenJsQzNpU1gxSkd3M251ODN4N21H?=
 =?utf-8?B?eUh6aVhqeFhYakIyMEpwcmZCdjkra3dMcTh2amFoRW9sanUxK25PQ0pVUjQv?=
 =?utf-8?B?anBsam1NUzhsSHVmaVpBVXRoNU9CNXFQamtEancvR2RSNzFTMGgwbENWb0Nl?=
 =?utf-8?B?bkRMNnVaUjkvemNzd2tlcGVkdE1CUlRyQmdKbEVPb0NkM3NzV0lnU1p2WjZC?=
 =?utf-8?B?R0l2cnh3Q0xBYUZxTTMxU1FvOCtiNk4rMUp3RGFiWCs2WHZjUjRidEl1WFY5?=
 =?utf-8?B?YmhTVDBkS0hidWFMMWVVaFVSM2w1QkFBRkFTVGQrc1lJVWFMeTBVL3UzczIy?=
 =?utf-8?B?bzN2OVY5c2pvUFl4UWdQSGlXTkRFcG1NQk94VExXR0crcGhvdXhHcXliVXY0?=
 =?utf-8?B?eEw5bnMrUCtCall6V2NQeGdXaHRYN3hYczM0UUNrQ1ZGMnhlMkt5UjFEWlow?=
 =?utf-8?B?bnVNK3kzZ3FJMXZmc05oZDFHZHhXdy9ydkk3dzJ1Smh1aDlhb2YwSjV0bnVt?=
 =?utf-8?B?aVZlME5JRmxzSTFQaFd0QVFvelQ5OU9JTUpPWDFjNFBtSHZqSzB6ZHpmUCs2?=
 =?utf-8?B?R3QyZ1VCSXJVSi90eVFHWFdRa0p4RURuUUxqOG9TSjBibFI5V1R3MHJXM2ov?=
 =?utf-8?B?TFFSNjNiS29JZ1ZpOG1STXJYbEl1U21aaG1kcEYyOVpBa3Nlcjl5a1dPQXhD?=
 =?utf-8?B?bDJHVFAvckhCMlBvN09KLytVUXBoSWJTbVZleHNDTTZQVzZieFNnYXZBWk9p?=
 =?utf-8?B?THNYbUJMM0d4Y1g3MUJ1ZjhVSElGZ0lPcklZQitVekg3R0xsamZFdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 27691dc2-feff-496b-3055-08de786ae582
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:49:24.6639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRHMlQgMivdBsk9UCaOJkaX4/PQdgdOiguNZYtpWlZBEnlyDpnKrgLNLcaCfyTQleAM5cOfnuMbLeuimcYpHlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9294
X-Rspamd-Queue-Id: 4C47C1DB37F
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
	TAGGED_FROM(0.00)[bounces-11513-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rust-lang.org:url,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 2:38 PM GMT, Benno Lossin wrote:
> On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 3da92f18f4ee..50866b481bdb 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -20,6 +20,7 @@
>>  #![feature(generic_nonzero)]
>>  #![feature(inline_const)]
>>  #![feature(pointer_is_aligned)]
>> +#![feature(slice_ptr_len)]
>
> This is missing a stability comment (stable since 1.79).
>
>>  //
>>  // Stable since Rust 1.80.0.
>>  #![feature(slice_flatten)]
> ...
>> +/// A helper trait to perform index projection.
>> +///
>> +/// This is similar to `core::slice::SliceIndex`, but operate on raw po=
inters safely and fallibly.
>> +///
>> +/// # Safety
>> +///
>> +/// `get` must return a pointer in bounds of the provided pointer.
>
> This only makes sense when the provided pointer already points at an
> allocation. But since the functions of this trait aren't `unsafe`, it
> must be sound to pass `ptr::null` to them.

The "in bounds" here is the conceptual bounds of the pointer. So, for a poi=
nter
with size `x`, the address of the returned pointer lies between `ptr .. ptr=
 +
x`.

>
> I first thought that we might be able to just use `mem::size_of_val_raw`
> [1] to give an upper and lower bound on the address of the returned
> pointer, but that is unsafe and cannot be called with an arbitrary
> pointer. Interestingly, `ptr::metadata` [2] can be called safely & with
> any pointer; I would expect them to be very similar (except of course
> for extern types).
>
> [1]: https://doc.rust-lang.org/std/mem/fn.size_of_val_raw.html
> [2]: https://doc.rust-lang.org/std/ptr/fn.metadata.html

I have a `KnownSize` trait for this in my I/O projection series that is
implemented for `T: Sized` and `[T]`, and it returns the size when given a =
raw
pointer.

>
> A pretty expensive solution would be to add a sealed trait `Indexable`
> that we implement for all things that `T` is allowed to be; and then we
> provide a safe function in that trait to query the maximum offset the
> `get` function is allowed to make.
>
> Alternatively, we could use something like this:
>
>     The implementation of `get` must:
>     - return a pointer obtained by offsetting the input pointer.
>     - ensure that when the input pointer points at a valid value of type
>       `T`, the offset must not be greater than [`mem::size_of_val_raw`]
>       of the input pointer.

Given that I'm not introducing `KnownSize` trait in this patch, this is why=
 I
haven't used this kind of wording. Perhaps I can just bring `KnownSize` in =
early
and use it first for documentation purpose only?

>
> Or something simpler that says "if the input pointer is valid, then
> `get` must return a valid output pointer"?

Hmm, wouldn't this give impression that "you can do whatever you want if th=
e
input pointer is not valid"?

>
>> +#[diagnostic::on_unimplemented(message =3D "`{Self}` cannot be used to =
index `{T}`")]
>> +#[doc(hidden)]
>> +pub unsafe trait ProjectIndex<T: ?Sized>: Sized {
>> +    type Output: ?Sized;
>> +
>> +    /// Returns an index-projected pointer, if in bounds.
>> +    fn get(self, slice: *mut T) -> Option<*mut Self::Output>;
>
> How about we name this `try_index` instead of the general `get`?

I'm following the name on `SliceIndex`:
https://doc.rust-lang.org/stable/std/slice/trait.SliceIndex.html.

Best,
Gary

>
>> +
>> +    /// Returns an index-projected pointer; fail the build if it cannot=
 be proved to be in bounds.
>> +    #[inline(always)]
>> +    fn index(self, slice: *mut T) -> *mut Self::Output {
>> +        Self::get(self, slice).unwrap_or_else(|| build_error!())
>> +    }
>> +}
> ...
>> +/// A helper trait to perform field projection.
>> +///
>> +/// This trait has a `DEREF` generic parameter so it can be implemented=
 twice for types that
>> +/// implement `Deref`. This will cause an ambiguity error and thus bloc=
k `Deref` types being used
>> +/// as base of projection, as they can inject unsoundness.
>
> I think it's important to also say that the ambiguity error only happens
> when calling the function without specifying the `DEREF` constant.
> Essentially it is a load-bearing part of the macro that it does this.
>
>> +///
>> +/// # Safety
>> +///
>> +/// `proj` should invoke `f` with valid allocation, as documentation de=
scribed.
>
> s/should invoke `f` with/may invoke `f` only with a/
>
> "should" sounds like only a suggestion. If it is a requirement, then the
> `build_error!` impl of the `DEREF =3D true` case would be violating it.
>
>> +#[doc(hidden)]
>> +pub unsafe trait ProjectField<const DEREF: bool> {
>> +    /// Project a pointer to a type to a pointer of a field.
>> +    ///
>> +    /// `f` is always invoked with valid allocation so it can safely ob=
tain raw pointers to fields
>> +    /// using `&raw mut`.
>> +    ///
>> +    /// This is needed because `base` might not point to a valid alloca=
tion, while `&raw mut`
>> +    /// requires pointers to be in bounds of a valid allocation.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// `f` must returns a pointer in bounds of the provided pointer.
>
> Typo: "must returns" -> "must return"
>
> Cheers,
> Benno
>
>> +    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mu=
t F) -> *mut F;
>> +}


