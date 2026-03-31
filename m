Return-Path: <linux-kbuild+bounces-12451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELZ6ADU4zGn7RQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12451-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:10:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FAD37166F
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3A083061544
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436E843DA35;
	Tue, 31 Mar 2026 21:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="S2rvH5Yz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022109.outbound.protection.outlook.com [52.101.96.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6E3FB042;
	Tue, 31 Mar 2026 21:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991259; cv=fail; b=G+BD4sGntO1hajo0EsLoB0wtr08BWBzaLIgy9mx/Q4lw6eqw4Pv87HlZQsgGPuFO+ycWgLViZon7SVjQFWZZWrj5XY+WGeAAVniba1W6XcvIiF9f2uL3FLgAO2l4XpTTU5lwD/TSZJGhG7ng55Bu435e902k1l+R4v3bd0umyg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991259; c=relaxed/simple;
	bh=xUpeAAHHv8yIdPZ8H82PoLXj1akeeUoGQLhUTkLr8GQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gOLR4wCa6npqK83U6mc8Q9FhZKPJKQV1vOfyAyfjjSAn5qENiFPk56M237Boyx4nSRKi2G1ISB80oO+rMfG5O2bUBH11NFTcUBrj2rz8ADue1qcx81t26VRAlglUHWur8c8j4mKIK/gpkMZ3l5Wqy0YqK23pSXwltt7bQ41ieQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=S2rvH5Yz; arc=fail smtp.client-ip=52.101.96.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFYJ0dhqlVaLy13iudXqZOWnoNh/AEP1QWMqViDZPb149Yq0KKDfa4DULjPwB3G246024vrqvgYgDv2LAJnt3TfKN+qWsVFZ5w9sJqhiS07EHfWXZ1mK1dDlt3mqxFpkR4ESgEgfPq80RsFkQsYKkhc7Njbt0V9dnCCmsN8SUysmREXGRDYpGOQEDRTXVrt6Lw1zMwLdVud4WRxKr6Zij1VtRTCno8yKa/nxf8BqDJDXAsWrHThQoUAudjl0l0NqRYQfA6SPmRTtPgmvWIz/6oGKDypb2eoC8X2ye00Ycysjx2bWVKamQmbveowuCl10syf/swVuLbXkjcoPPKlhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvOYrSzEDRX9aypP7iTgaOBaCXIUWYpdsTwcJK6PhUA=;
 b=YLGpxXr+YZgI1yHQambl+WihVyHE8dCu0ghDOjgrcHUCKhXH9mkzCzJPsdYgQyinQ3OYLsTx5YX3Wg0wt1otAuSRY7fVa4jkIRm3Pm5PTZV6TYECoQsHlz+KVZFIKs8JrZq0u6pvhhQ8IngB/pREO9DjFV1RFJZUtCcEe4g8dwr2wzyfriMQigj8vYFkIFG8D+8Q96tLZLYDylrvP/tC2Zw6YyV9YXv5NcLflLm/cAg/THKPhuNMdzjHmoLem07KCXmN56hMNBAy6P9TnmJh7NaosC/mG5raEk/EAqnsfWQh9ztcIVekm5TFLxobYE6Z49AU+vZjsJFCiXKQ2BXQSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvOYrSzEDRX9aypP7iTgaOBaCXIUWYpdsTwcJK6PhUA=;
 b=S2rvH5YzNpX4qDjAgPcjBeGves7EavMJlwk7El1f1EhUK8UviBbVoRZWDSL2Cxnq1tqOeeaGkbU3ByVP8zWJUbXH56HF1lxzVbPX1gsr5kG1LcqLNZX45YSd1K9MaGdemsJz/rR/Exestc132Rz22BWG67/BHBdJ0qzXKRsN888=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6523.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 31 Mar
 2026 21:07:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 21:07:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 22:07:34 +0100
Message-Id: <DHH9VXDSLIPE.10JBKMPZIPCUB@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>, "Aaron
 Tomlin" <atomlin@atomlin.com>, <linux-modules@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: macros: simplify `format!` arguments
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260331205849.498295-1-ojeda@kernel.org>
 <20260331205849.498295-2-ojeda@kernel.org>
In-Reply-To: <20260331205849.498295-2-ojeda@kernel.org>
X-ClientProxiedBy: LO2P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::30) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 7869f47e-392b-441c-7481-08de8f69882c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TiCFjSgK5VNlEy6TFpyKoVzUKVwl2d2XXSEdfbLUYJod845fjNAsL/gaX7vXnyGXREXuI+Vbxm1Di8nY6IB6ztUzkbvubMQnqQpj29ol583BuIUhY0oYW7C2ujrtRjrkVkjRxl5YaNXTsGzn+rPaKM2E9fPNO1shZ3ejMa4iTG4F9BqbTLJox9EmsqRyQeQ/p6om3rTCeD07uKmSLv6d/1485cKS5kVEw+YyTz6qSu6fztb3UR4c7xc0ec2CmUKDUrsV7enGIdGp+C462wr1zDXmjZ4ycfQW4uXrr4CLsaKwsAqguBUynGA5Mu527TMC7QFfZIBWXnfxAaWB1W3CDPgjflayv7gqrguV5NqLhk3z1VSniEPelrEktpZTRlztgVSLLbDu6yywwf5Mv4hWgHwIWVhACJWcWwaunn0lqKHbYBVeb99tCVJOvHKK1NRDtj8VPiNQSXoPS2yJiPnxdfcPE/IxRdoJFm/vphjNN75w1bO489W1hDHWCt3zZuzG6V8fRxo/vb6p+k/Rx3UWQO1vCxLqMWRfvrrIOT7EvrIePtvLxh830awHVYL4grNvt3oYGRueT/NN84pmQ1vCXDWXnzZvwI27p17vqaNHscmpjZB+9ArpIe6MsKtkQ5EkSSRBFzlYti8cM2cvFqlRTK05PbHs8grj3c9jP8NDJsDzc+MwYS369PL96wFDpJrd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WStMWjdhcHRWWjRDRUdTd2ZyYXZ2em9rYXp2M2ZZWEtub3k1MVQ5TDdhUC92?=
 =?utf-8?B?VlltRXlSYXVHOFdNTDR0TkhlYWtpWDM1VXFjOXFwaXhMNFJFWVpNbGE5YTYy?=
 =?utf-8?B?U2h5Vkd5NGE0azJXTTZEVFZVM0h3T2J5cUpKaGVtTG0zSW14T0o3dVlWczJQ?=
 =?utf-8?B?cmxTdnViTkx3NFlVTUR6R1FGQVFhTE5VVDc3R0hRb1phSVg0QnBFZlFNMnNV?=
 =?utf-8?B?WDBCTHRqODlXUHp6ZTJqU0pDbGsxNzBLYk1kUCtVVllOdXMrc1FpOCtrakJz?=
 =?utf-8?B?YWhKRFo4MGZjNEFWaDJLUlZQU2xPYzEyMW5qL0NDOHVtMUxNZDhrU2ZpUlpw?=
 =?utf-8?B?WnhMQkhlS3h1VTBXN2NHU0FOR3Zmd3pzOGs4d2NTM0d4c0hJMGlXUFJNbEtI?=
 =?utf-8?B?OUNTeUkrOEgrTFpXb0F6c2FUMG1HS3pvaU1TdTFXZzRTUGlEY0E2KzVhbTRm?=
 =?utf-8?B?dUdzSENSLzdHY1Z1NmtnNkMxcUNoYTFaQVIyTEJDazZpWk91VkNSY1NQbzVq?=
 =?utf-8?B?RnpSejFFTzA1TFZUYlBHdWMzVXllR3NjSFIwcFRBUGkyWTJJQ3hHZmRUZmR0?=
 =?utf-8?B?ajBCR003ak9yWGExei9RckpOczZZQlovY1EzczRHWU0vS25QVDEwbklHdWVJ?=
 =?utf-8?B?b0dSQkcxbHdnbDYzSmwrZW5VN3BLZ0xuV3pXS3FkNFVhS0JnZlVtNkZjWXBF?=
 =?utf-8?B?UmRKYXNnemkvT0JPMG9QYjQ2QXpQekMxNkEwaXU0REtnM1FWWU9hYjRnQVVD?=
 =?utf-8?B?WGJ4dmk1dWt2MHRXdjVHYVpCQTMzTkN4aWpyQUIwRUpvVVNSbnNmejVKdTVK?=
 =?utf-8?B?enNnQ1VNMnJHOUlsdE5BWiswVkdPTHloMis4UGs5d0szVUZBeHR6UmxRWE52?=
 =?utf-8?B?dWJOMFpwcUZtelVoK0JNay9GbkU4ME9GbGh3UHNidVJqVUJYTU5zNHlQOGwz?=
 =?utf-8?B?MGNmaU8rdkdoWWFaWkp5eG8yZGNmQlFCai9JNmhEMWttT0JuclI4QUxJV3ZT?=
 =?utf-8?B?cFR1aEhCY0w1UC9oWWZ3aVZTRDVGNEhNUkd5aFdQTW5CaUtJS3JxWitVRjF4?=
 =?utf-8?B?V2VtRGhOQjRqVTdBeXBLMXBkLzNWd0FETjNQOSt1dkVMMnJnOEtkVXhDSFow?=
 =?utf-8?B?YjdySWVCSSt6UU9McUgyRm1aZS81QUVnNnZPd3N0Z1NGUjJDclA4eis3WjZ2?=
 =?utf-8?B?VmFlMUhneENQNHhtOS9BWTcrckxaUCtoczg5U2d3UjNMYWk3UFM1RmxpUDQ5?=
 =?utf-8?B?NUEwZkM3eGE5TW9vN2Mva2xFaXBYdWRUYTczMVZQUVZSbFpYT2RsT1V1S2pS?=
 =?utf-8?B?aWtmYVlLTDB2MUwrdGZwbXpnSjBkQ3MxQS9YQ1VJTFUrNzBuWVErbkU3bG5w?=
 =?utf-8?B?UVFNQnpkL2d1RzF1c09EV0xnVUxOVmVhNno5WFBTekVTSG5lTnV0bzU2Mkty?=
 =?utf-8?B?cWhGcjNlNHMrY0hpV1VPNFlGamRZMmY4ZXFSZW9NamhJdVVmOHpwOVVPVnJ6?=
 =?utf-8?B?bWxBSU1IUC9EYm0yeWg1RTZ1SnBnVzZNNHVCa0JDaHM2bVE0eDUwT01qRTNO?=
 =?utf-8?B?Z1ZRZUlGNUc2clNWQ3A2V3JIWi9IWDdXUkx2R2xUdHQ3OEN0OUJaNXViclR0?=
 =?utf-8?B?RnE2dlBHVGpRcnRvMnJ6TjEwZWtPTHZWNGMyNXg0bHJpelQ3MUxsN2NvSGl3?=
 =?utf-8?B?RDVSN3p4RGpKVFJkdS9HOVVybG9KT3U4NUVGeGt5ZmtCOVYrMm9hL1BsdTRw?=
 =?utf-8?B?SlBHQ3dFWm41QktFVlJvNmYxTEZYZzFtRzZJdDlBbml3bVk2MWVMTTFpWlNK?=
 =?utf-8?B?VkgrRmREVlYwTWdObmRKamhPZmJZZXZZVlFXNUtjQkFMTCtZSWlTamlNZ1Ir?=
 =?utf-8?B?SCtFMlFwT1pRbWVsMUI3dmlXaVhFMFQ5SjhrMDJFc1JmUmIxTHMyelVQTWJQ?=
 =?utf-8?B?dHBQNWxnMEF4eUhIVkMwK1hRREEvUm9ZSmJXZVhVRTVJMkQvMUQ3WG4yQ2FK?=
 =?utf-8?B?ZVJFWm45M3IzalZqRW1TazRXcWc0STVhVjc5by9KajhlNk1ld2N2ZDRJbVJl?=
 =?utf-8?B?UHFrZFhtUWVmREdnRmdJbXRJTlNzTEJPdERrTXJ0dENRSXFzWENTWGduRnJs?=
 =?utf-8?B?VVd2V3BvMFo3QVRMWlJQM3R6WTZLUHp0aE5CK3pGWEZQTHhycVdmRnNNVkIz?=
 =?utf-8?B?SkZuRjJ5d0dOMGJiQzhDOUo1SDU1USttUGU0SGo4M0tlMkVvcm0xa3drdzEx?=
 =?utf-8?B?SW9velhZdVdrcU5icG5tRVpLVHdzLzFiOVpmdHhuM0VnQ0tJenV0N3l4MWQr?=
 =?utf-8?B?VmxObzVRNmgzT1JhaWNCMU9YcHdHOVJJNENzV2tzY0tGRE85TnhHQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7869f47e-392b-441c-7481-08de8f69882c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 21:07:35.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbR/imsy9VzFRsOz529hvG+1CYFSDlDQhm89l6qOY+o6dkvcvyRl9veNztwO5O7qM1ZTZtJ74TWYEAVsU4H75A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6523
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12451-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,atomlin.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,rust-lang.github.io:url]
X-Rspamd-Queue-Id: B9FAD37166F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 31, 2026 at 9:58 PM BST, Miguel Ojeda wrote:
> Clippy in Rust 1.88.0 (only) reported [1] up to the previous commit:
>=20
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:112:23
>         |
>     112 |         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>         |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     112 -         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>     112 +         let content =3D format!("{param}:{content}");
>=20
> The reason it only triggers in that version is that the lint was moved
> from `pedantic` to `style` in Rust 1.88.0 and then back to `pedantic`
> in Rust 1.89.0 [2][3].
>=20
> In this case, the suggestion is fair and a pure simplification, thus
> just apply it.
>=20
> In addition, do the same for another place in the file that Clippy does
> not report because it is multi-line.
>=20
> Link: https://lore.kernel.org/rust-for-linux/CANiq72=3DdrAtf3y_DZ-2o4jb6A=
z9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com/ [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/15287 [2]
> Link: https://github.com/rust-lang/rust-clippy/issues/15151 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/macros/module.rs | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)


