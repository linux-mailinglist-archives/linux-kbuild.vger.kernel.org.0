Return-Path: <linux-kbuild+bounces-13677-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x0y+OF8JKGrv7gIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13677-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 14:38:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 460EF6601A8
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 14:38:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=garyguo.net header.s=selector1 header.b=OStXuSEc;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13677-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13677-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=garyguo.net;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E2423078F4A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 12:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6082640BCB9;
	Tue,  9 Jun 2026 12:32:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020103.outbound.protection.outlook.com [52.101.196.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF073E9589;
	Tue,  9 Jun 2026 12:32:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008353; cv=fail; b=p1E73czmyr9DgiyPmPKN949TlLby1F8d2y7tPUI74ZhU9+7oTrKavwYxsJS93xaAIci2HouZrwGToE5eGr9qT2i51ysYo6e7qliVkPU6oR9GtOionHbNPbqy35r+tuBLPQM8QtGgxQgfSpIS04nx1msRjeIQHuVVw3aojostc78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008353; c=relaxed/simple;
	bh=u1C/k8Bg4aSrUc2Yl7+6i/PbB2R0F/j1dlGDVY99Xbw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PbNDbi64Y0g7tTJn36ZpZMT7AmnDiwJDAKe1/emAln0TgbOFQskUEhSxs+RuG8rZLN3hglTJFPTdW8MbgoeYIrPcSWldCTHRy6K1zuvdE0GJrBc19dCItDNcCu+8zbiDxsBl2SOfXr1XxtF+4lxEEsxgxy0p4hS0yD4B1ohHRF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OStXuSEc; arc=fail smtp.client-ip=52.101.196.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bulOu9VtjVTNW8dmzE1VW0jhA93RMGk2Sq47qYSQr8as/cLopLfrtmEP0S9JA/o28FzE+lLM7MENNr81hCggzhOAtSYsEq4k9PSXC/wCEgr4978dXCIzz1p4mC5zwuKinEUyM6e3+dNTAxyovwbaYowIpEfvOcMLGF0sxF4m9uprIP0/WQC9ab5y60th8Gb2x0IqJaFeTAKhUG+UZhgndh0QfoFP2lL5bgDFnHd9sBjKXT1rC8kd1/edwqjblqoAaymo6nM2s1UXY1gQGl8LGhlv2++vUosAmlVZeZ6vUA97VJ9U6T6geJ8LSlimYR4rf2EHTFzM95tcZ0eDJi/N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wguFY6dLMb0PRtncVh7+jIvmiybpQTEkn1UwAYmJPfc=;
 b=eUavvQYknGfBkBnoYrZxQGvk4ASNj+9Xvoky5FvoDXRPYzNG/fdUBHh5KWrUjjlt3ikE9R26Dq+s4qfE2r4PTthsW4kiddnATiIZtMAxr7JhxoqyvyXJybfO7GjWZJo2n3Y9d8lQ5pYTGFUBSIbdfdYTlnlALPZwuD5HiqpG1MrvaTPnngPr719R4OhC2N8SgPS9xXce8MjR8jPbJxyR0CTV1slUo/DvwMVLqSLenbNjLkRVj80ffau7g429rLtg4fC2faBl7CtxxMHvFNqGctZ5P25cghJU8Px21g8682HGr0V06bOkfEeyDqJaEPVOY0HBplxFS90FpH8qluCYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wguFY6dLMb0PRtncVh7+jIvmiybpQTEkn1UwAYmJPfc=;
 b=OStXuSEcEpEB4sYhLsmVnANIqOKd5fGK5c6B1anhKsPmiKb79MkGmBstwzKMHIYVTguWaS+71bDZ8r1QjDVfnjmDXkkSo9dI8cPDZZyPv+dsGtCfaj260qMxyHCHqjS3KXV7mU8Iswz/nxLvyIZR8VvaEEF5jJWRBX5ARb0P0MI=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6413.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 12:32:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 12:32:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 13:32:27 +0100
Message-Id: <DJ4IRNNDA4P9.3QRKDJGTBL0AN@garyguo.net>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Joshua Liebow-Feeser" <joshlf@google.com>,
 "Jack Wrenn" <jswrenn@google.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260608141439.182634-1-ojeda@kernel.org>
 <aigFQcq3JHtdpsIn@google.com>
In-Reply-To: <aigFQcq3JHtdpsIn@google.com>
X-ClientProxiedBy: LO4P123CA0599.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d0a2d4-5cb1-4254-ebb3-08dec6232ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|6133799003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ayhoIcnlObVR+B1buHqQ1dE3iJHzFDoBZpDC5pC/5YhnLd7gExrNfyqB88BF0ux3FLNkwOu33KZNGp1zXV2gygAL6uVDDmct8/fKqsaH62uXihJrhAE2fuTkRvIIeYqyTF6A1ib5Rx7sBujM3/U3jtMZkY6ZAaCFAlQz4t1gTKMrh4Xa62QPY9v6sPrW5cwhUUa/F0xGmJZ+qyd4YmO4UxN9+hEZzgZwzLLfh2z0zTDWl6IclxQXKRN6PhFpqVb8jlJq1epwG1bYTvwiWDg4y9T3IGP1+Ax3CxgbZ6pokh+E2ElliJJoVY3OuAzOBR+thfU2m83udUypTedQaFlTCdfLK+qA7VJLAs+YzOE/BkqvNhGgK9pF3vXshsEaEyFOmkauwngkYCqcNPZ5DPA+gPNNvdGpzaXXoUE+qz5Sv9EXyIHovFjRL/yh8UcxdKC4FPtQEL7IspEf1znrwWD1m3tewRVpAfXLW7Ici6ofClbx6h8rsfNLakERdP+WdhBv7Mbf1m4rNym6cOAHAdVl2FHDeVjridZB+q0+WaR+x75PrhEY9VOjBew2ckg1PSVW2cJ5zDO9aiGbfyI48kEXWTCd5jzhCEnNIEDkihXuelcSQLW7u5IJhlXoatnxfcSKlhQyxd7irfRHCFK/zZjzGc+INOm2LEwcWaf1u/fpXjp/6Wa+5kwn9AMM38zVsRmQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0E0WUNpbDliNi9FRU9kZWVHS09BTmZaNjZBZmRGZVQ5L3ZLc2RWdFBvcVhD?=
 =?utf-8?B?aW9YRWtqUmJIM1g4YzU1cTJhUHR2QlJNOFE5dDExYTVsRWJoMzFHck1oNzhO?=
 =?utf-8?B?SXIzV0svMjdLelQrQjJHZUlnUHhJZEhWRURsT1JpaldkSFZTVjYwZ3VYc2Mv?=
 =?utf-8?B?Y0UrSE1XVmZZNm9NNEdtSkFZMEhaOXA3c1kveEJ0QlpScDJJeERGQ0Z1UGRO?=
 =?utf-8?B?bXJUdE5mWEovMWNxM2RpQVkxWnpQUnJLN1FoUHphMzhEVzU2d2pKYmZudjlH?=
 =?utf-8?B?L09MeWdRWERSeWpWMDdRbG5KR1NUM2ttVXhJRzNWcnJ5aGJGZzRRaGQ3TU50?=
 =?utf-8?B?ZCt3K3dqSHVmWjlBQ3BBRjNIZVNBV2MrcmY0d24ybDJ2OFNhcFRLZzhLcGJJ?=
 =?utf-8?B?eXBxQW5xQWdTQmtQTnZxMU9uVHkxK3FFSGttMVJYNFZlc09aVnlZS1NjTUdh?=
 =?utf-8?B?T2ZYR3pKZFByek5yUGhDWEhxbGtEb2N4VU1SZDhmRUh5QytQQUh6VTROT0M4?=
 =?utf-8?B?eEg0SndTbWJWT21LemxzZWF0V0tjQXY1YjBBRFQ1bTlWRnZLYVBndnEyTWx2?=
 =?utf-8?B?TDBYcHBSOHRrbDk5cUxMZU5sU0J5bCtwVzBzWU9HbG9GRWlQYWZWNDd5NzlD?=
 =?utf-8?B?SHVrZjFQMU55bVpzYjF1UStHY1I4bzRvMjlydXZYY3lCRCtmKzBsaFdBQWIr?=
 =?utf-8?B?Qy9yUVpEaE5pdi9qSDdNTXAyek5vZHFtbmJGNy9pWEFBbDBqcXVHSWx2N3k3?=
 =?utf-8?B?WVp2V3B5V2JaM3lCbHBKbHVBck5jRDI1M1RWM25RSkYzaEszbHFnUlBxWXdB?=
 =?utf-8?B?a1hwU1VPNXh3TDc4M3RVN3BCOEplL3RLbkplYTZKbzU4eUZoR0trME5GY0c5?=
 =?utf-8?B?VTZwTWx1d2hoeHBlYlRMekl0VjdzTm1WdUJoMkd0K0RUa25pSGY5bExKdXcr?=
 =?utf-8?B?U3o4aFhJdStJbFZ1TTVqblFlSk0zWFVhendJSUQxdUFKcU4vZU9keDZoSUtS?=
 =?utf-8?B?SU9VcHFBU0cyYTEzazNSWXZWSmtSc28vVzRaYm5BN0k3WXQyM1hHU3l1QTE0?=
 =?utf-8?B?cGdzOGYvSTV4Wm9rOFlWQUhEUUdENGtxYXNZZ2pUYms0THlhMjFnRzlQeDFM?=
 =?utf-8?B?K000a28zbkNiNm9WcWNLOSs2dWF3aGNKdnVMTjkvQ01XdVVGTUlkU0F6Y01S?=
 =?utf-8?B?WW5mZ2t1c2hmQlMxbXd1cnR3cFFLRDJGQ200VzA2SzBtZ1oybGhDaHNXbTJz?=
 =?utf-8?B?RWdXVUVBNkluc29lakpHcjdXNmIyTis4LzZJdUVqZTVYVDhya29QT2VrSFNU?=
 =?utf-8?B?d200eS9qN29DcytJSU1WRXNMR2FnNUtqOGxYL0R3dVV0N2RZNTdTb1ZhMEpM?=
 =?utf-8?B?eVpnbXVKbnozdTQzRXBZdEJTUjZPMzdVUG1NdmViTE5TT2Q5YjhrdTZORWRx?=
 =?utf-8?B?b2ZOdzQ1REZCTkFFUTJZZkUyRjdkZksyWm5MTGdXdlYvRDhmV0M0YTdwV25D?=
 =?utf-8?B?T1FZMjVJZi9hQUFHeEpMaERSanZLYUE1UFRQeXc1NWRpcmFtSHRZbEtlZnkv?=
 =?utf-8?B?KzNXc05NT3pPc0QwQ3BIdmVwcjVSNENUY1ZubGtMRy9aZkRXYjRReWpLQTVQ?=
 =?utf-8?B?c2xXS0kvdFh4YVpGQjhzV3hDV3BDMTFtOWhhMFZIc0llV2tyZ2tya1hUZkxH?=
 =?utf-8?B?SlBRNDRCc3YwckV6eHVTcW1IVTFIWlB0dlBOVXhNamczRzhGN01reTFwQm5E?=
 =?utf-8?B?WjlRQzVBS2NTNFVVSU1PaU1Ha2ZyWjdrTllxL1FSWkl1K2ViQk5zbzZibFBC?=
 =?utf-8?B?Ylc2dFhrTytZTWFhZm4vSUR0UTdua2g3NnlXclhTeE9PaHhDY3hBbTdIRXh5?=
 =?utf-8?B?Y3FDeW1BS0xMWkRaYncvZ01zNXQyWjQ4dGUwSVJ2dDVoalhXY3hKeUtYR0xv?=
 =?utf-8?B?MmRNbXlZSjZ2SnJiYXh1VkNKalozVmg2ZzN5d0xhbjJNSmdhYnIzU0xFbGNX?=
 =?utf-8?B?OFlnU21xMkVSSVB5WnVhemlaSUZuRm4rM1J4dHVhRlB2RWZVK3VKcElobnNN?=
 =?utf-8?B?aHU4eGFNZ2RzanZVK0NEalBwaEdQbndCeGJ2NUxYWTd5cTNxMjJSVzRyeGpz?=
 =?utf-8?B?WExlUjZDODF6TUZ6UmtZMUcvT1QzMUo0MTZiWDJxZW10UzNGdEMzeHhaODM5?=
 =?utf-8?B?cVZselJlc3J1RkdRb3RyQURzMDUwOXdJQWtQSlZoNGxwL2tiUW1UNDJYL2ZL?=
 =?utf-8?B?OVBOazkwMDU3NWVTTzdZYmQ3NE15c3lYZTJUaThrWDVBOTlCN2g1NUU2cHBo?=
 =?utf-8?B?VFEveU9BeGpSUU11RVk2aERkOUNlbW44SVNnS205RWlrWDdPanprdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d0a2d4-5cb1-4254-ebb3-08dec6232ad7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 12:32:27.8925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bFl1zKEL0WzkQNXIwogLtOE2CBcl61xnDlo6+7Sm5mpOVgFjOLCy8XZAoaSXHTv77juZjUVOFaLGIL8tjFiZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6413
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13677-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:aliceryhl@google.com,m:ojeda@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,google.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,garyguo.net:dkim,garyguo.net:mid,garyguo.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 460EF6601A8

On Tue Jun 9, 2026 at 1:21 PM BST, Alice Ryhl wrote:
> On Mon, Jun 08, 2026 at 04:14:19PM +0200, Miguel Ojeda wrote:
>> This patch series introduces support for `zerocopy`:
>>
>>     Fast, safe, compile error. Pick two.
>>
>>     Zerocopy makes zero-cost memory manipulation effortless. We write
>>     `unsafe` so you don't have to.
>
> I tried applying this and using it with Binder. I ran into one
> challenge, which is this uapi struct:
>
> struct binder_transaction_data {
> 	/* The first two are only used for bcTRANSACTION and brTRANSACTION,
> 	 * identifying the target and contents of the transaction.
> 	 */
> 	union {
> 		/* target descriptor of command transaction */
> 		__u32	handle;
> 		/* target descriptor of return transaction */
> 		binder_uintptr_t ptr;
> 	} target;
> 	binder_uintptr_t	cookie;	/* target object cookie */
> 	...
> }
>
> The problem is that when the union contains a handle, there are 4 bytes
> of padding in the union. Currently Rust Binder handles this by wrapping
> the uapi struct in MaybeUninit and using MaybeUninit::zeroed() to
> construct it, ensuring that even if padding is present, it is zeroed.
>
> However, this trick relies on unsafely implementing AsBytes for
> BinderTransactionData with the safety comment being that the MaybeUninit
> actually always contains initialized data.
>
> To translate this to zerocopy, I'd have to do this:
>
> unsafe impl zerocopy::IntoBytes for $newname {
>     fn only_derive_is_allowed_to_implement_this_trait() {}
> }
>
> One fix could be to update the uapi header by explicitly adding the
> padding, but that's kind of awkward for a union like this, since I'd
> have to do it like this with an extra struct:
>
> 	union {
> 		/* target descriptor of command transaction */
> 		struct {
> 			__u32	handle;
> 			__u32	_pad;
> 		};
> 		/* target descriptor of return transaction */
> 		binder_uintptr_t ptr;
> 	} target;
>
> It's not clear to me if changing the uapi headers like this is even
> allowed to begin with. It's a somewhat non-trivial change.
>
> Any better ideas?
>
> Alice

We can patch out `only_derive_is_allowed_to_implement_this_trait`? I don't =
like
this "extra safeguarding" in the first place. I think the "unsafe" there is
sufficient.

Best,
Gary

