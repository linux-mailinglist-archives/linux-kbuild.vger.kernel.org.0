Return-Path: <linux-kbuild+bounces-13388-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPKkHP9UGGoQjQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13388-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 16:45:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9AF5F3E4D
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 16:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E87CF3041657
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 14:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94093B2FD9;
	Thu, 28 May 2026 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="o5IyIqNG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021124.outbound.protection.outlook.com [52.101.100.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204BD2DECBA;
	Thu, 28 May 2026 14:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779978628; cv=fail; b=FmsBjSFI+zK8vd8iJ15QWNMBF5L6JvOqxBQ5xtIdPKd+J9FvSEvK+aL7cJ1O2PsQJVcmXwcX31IwEX4ebV9LdJ+qQPZGuhm+vIj7mBiaF2+559/RQYnvpr2lx7eg7JVi7MhDmAV0dgnMWNGicup07NF2K2bUTGZicr/9Ff9Xd7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779978628; c=relaxed/simple;
	bh=9HZ/18Z9GRuD/+dBySkCrHjpLxLvkP8uxuDXkydprNU=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=iux7f+7gBzwsJjZdzohgw2vj/ECGYrhGcxG+F+9vfJMQDH9h0DerWiRMsYQLk8CyyNOpkU6lNI3tWPMFihEVm3Be7v/G+Nki0q02VMoBXXCOUGXDxQ/p9uiVK2p9/sfNFJQHS1pQqJvrQ3PlTcwjiaxlgMX85PTqDo/SRWAiCFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=o5IyIqNG; arc=fail smtp.client-ip=52.101.100.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBe04JYBHVWFT73G2zA9QOGsesaOd9kO8NPlt2zyLOCOWPns403PIlE9zMfYo1I+Y7lPMwHZ/3OYsqyMCGOdK1exT48+a/0A4SZwelkcYahYRzyMSmRTxx1hG+YDlMzkGTGdZS+tc1qV2aYSsTe0O+tyDX6tMHKt+LlOzSukZmxwWs7NoMGHFFUo3CRvPtdn8Cg2D/0JIaPyyiYuopZTMtAfJaXrOp6fD25mNMWSVA0G+2KitE5LuwrOPy2WDxZheuNMFq7Q9yC9Db0Z8uTZtyOVUxhYAoXAv/CD3llIUkReuPwPVWDiIT2dCfcdFFWUlUQlV8oj3kkNg1SyJ3sZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnhcYOj9/2Yr9i8/8i3jXYCXrqPOVQvNAUTC+YhAEkw=;
 b=mIGAFp3yoM5FcYbh46JDCPL/zmByT2AkUMofheOaYQSw3aRzOFcj/JSw9XhKPaAdaYDiCDOryRBextNs6+LZ+aloyTdpONL75wsT7p2C+JCrlyVS1ra2DSXI8gtDrdso4VVHFWnVTyqooCWAy4rqhv3IHM0RN9/grh30l/9fBiJ05bdPm+Enq/qg3rY3PEGEjuUCceJKVXE5J8GNiKLr1rijuNPm16sdNA8Dm1H0aj/rdfdCCVQ3hi+TSBXhoqYa9QKuTaD2Pxi/z+U3HMeTHB44zST80CNUq9Hlm3IOYx4zMFipAkyo8FFkaAXehyQ5EIVw5gLJg7VMyWhBNpPbQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnhcYOj9/2Yr9i8/8i3jXYCXrqPOVQvNAUTC+YhAEkw=;
 b=o5IyIqNGCocNcf/LA14gLOK+grQD1av186AN72bHU7WUsBZ78eTRKM/00W1KWHFviM18u8j1CbpJPHw5ZbdeM3vAQ56vl3MH9QQchGzhcUCcEeGPXA2Mam1eL1OvEnQ2cu2X4f3SOIgbL41Q5H/FCdSny/XsA6BG2byOcDY1cXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO8P265MB7630.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 14:30:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 14:30:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 15:30:22 +0100
Message-Id: <DIUDREOJ8GWB.3QMNEGBRFQSWK@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Demi Marie Obenour" <demiobenour@gmail.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "Julian Braha" <julianbraha@gmail.com>, <nathan@kernel.org>,
 <nsc@kernel.org>, <jani.nikula@linux.intel.com>,
 <akpm@linux-foundation.org>, <gary@garyguo.net>, <ljs@kernel.org>,
 <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <masahiroy@kernel.org>,
 <ojeda@kernel.org>, <corbet@lwn.net>, <qingfang.deng@linux.dev>,
 <yann.prono@telecomnancy.net>, <ej@inai.de>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
X-Mailer: aerc 0.21.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com>
 <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
 <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com>
 <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
In-Reply-To: <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
X-ClientProxiedBy: LO4P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO8P265MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: d9591f19-afb9-4a02-2fb9-08debcc5a72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|18002099003|22082099003|6133799003|5023799004|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	t7h/98rKk7LfmyC+oVK26VNrJ271Wl2ffhrVszXPeXmLcc28Jz/VHUfGkgpCSf3yNocrnIPnrB3dEHJimNpTjVS1QVsgs3WIDFo8ExveFbKx4EzIrGW6J89koO0TQwAZOFpwmRQ4NQWsfmoifvcheMdaC7vx/F4OjthlwLkAOF6unVijl3dPnhMgEk9e6lgWUCIWVmgb5L2/BFCxF4n2LAu+Lymod3rjZ1cvl1NICGPkLwTgEBCt6L7yjbJOOrDZWmiV/VoHh+WQ5MZ8S6Zo3HxcH1YQS08Vf0p9lFB9PD/OWlUw9M9Yfpnk1RET79jW372gue7aUIUYZtpguLMhtq/n5StqPwvjncK+/K5Dvs0bhlez5UKEm0/Ud5xbJCooPxhOxoVOS17A+gjBMN5Oux3uS1+O0iJpDGVDNIHcZDJbQEtJZtxtbeap1xooaOq1H0fVRwdM5AeOxrQq6uUBijXzQwYt2IqsOeXkF+AdODYI70Db51f1PO+pLerlR/OqGDMnkx/9C9ZuO8DobWwEPJ3Maqacxv3/T6ThMEpFY/3xBFqsctNKrgDMximkwq/07emlClR78P/bUzgNKad5qtMrWqBLUGyjBLPyHGrncZcSWSPmaVSUQY4ygDRO/VBfzPNFL7jq63yUfUsMdVh7BantOd08yb6rPNZIrtu3O0oPcYx8NIaeBq7dtSm+ocKDWKUB82UQ3QEVng3G3Jd4kA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(18002099003)(22082099003)(6133799003)(5023799004)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDNYSC9sZ2h6S05leTAvWlY0ckphNUVKc2xrbFJQRjBrOW5WVFhDSjRjaHY1?=
 =?utf-8?B?Vzc5em5jTVM2aS9maUw5amp1VnJxQXdqVGxOWEFjc0VsejZJalFhOUNMMytp?=
 =?utf-8?B?YXc0VWdhTFh4RTJGa3BxNW9iTWhLTjN2RWFuWE12YWJvMklqRDBscUJBeWpj?=
 =?utf-8?B?endDMnNjc2NJL0d3Skg0cHpUOWNpbXR0bDhkU0wweU9ab2VHY25Hck11WDd3?=
 =?utf-8?B?TDRya2tQN0RlN3dhQXFYMEdXeXpsSGtqR1h5MDJGZWQ1R3R3L2VreG51bFVs?=
 =?utf-8?B?cERDcTFUZFNLMDNoc3JlMzV1bjZXa2dBbzhsMWNTbERmZ3o4QVFYME1DbGhN?=
 =?utf-8?B?WFhMcmJXZDBFOHJlc01uakFNZUhocEQzajR1bm5qVEkrMUxyZ2JiRUE1SWFX?=
 =?utf-8?B?MjhnK1diQmZ3WHJDbWp3Vnh4QjlFVldKRGltRm5PUVRTc0tGbTZ6dU16QURV?=
 =?utf-8?B?dTB4S2lLaDBEM2l3VnpQc25LR203d3FDRFpjd3NqZ2xveTQ5N0tEMGQ0R3FP?=
 =?utf-8?B?VVdPR1FCZllHTERzK0hHdmlGcnFJb1dENjhLMTlGN2lFL1FuaVJ4UkdRcXdW?=
 =?utf-8?B?dU5pdXdLZWo3MEthMXVCNy9zeGxPZWx2ZTRkY095SHloMGNSc21aY01jM0F6?=
 =?utf-8?B?VXdpU1pja2tkaGVYdm5EUFhVcnBsNmQ1YnA5azdGR3ZhaXRMOU9CVHhzNjlU?=
 =?utf-8?B?NUFudGppMGl6c3czTk5SenNHd0cvOHorR3JiTVVGVEJOZGd4WndjU3cyN1hs?=
 =?utf-8?B?MldITHpWYjRVNWJuZ3dCNWdOVCtGOXVTcUtRWDE0SVZ1eVZqd2hDbGF4bmxx?=
 =?utf-8?B?b21iekJqYkhGR0hiT05WU3hvalVBNndIRE5nK2hPZ2w1REZRamlGaEk5djZ0?=
 =?utf-8?B?cmgzdFZRM0JUU3ZuU1FzU08zQkFSbUM4QnhUc3FNbE11T1pFUWFTeEFIa1V5?=
 =?utf-8?B?WkUxRWtTaFpiQTkwTlNMRkRUTW8xcEFjREtPczVjeERlTTRCdThVOHQwMDNz?=
 =?utf-8?B?cmhWcXN3Ujlzb0VpcXdqMmEwR0hsZ2laVU1RdllSeXg0cEhycFpxeXR2RUI2?=
 =?utf-8?B?WXRnTlAzUmdCYTBaNHE1NExTYStXNVkyZVh5Wm9odjk2OUIyeWFWb2VJeUVz?=
 =?utf-8?B?QVBTN0QxVU9KVldqZjhYMGdVeUsyUm1LQkxnZkdYVEI1cytoRDNDWkEydzFH?=
 =?utf-8?B?a1B5cTJsbGJLNFNENDVuUHkrbitjUmg5dG5WK1hjZHI1eEd5YnpUT0RFRFpw?=
 =?utf-8?B?ayt3NXl3R2YrclR1dCt0SDdDMXdYcUo3eU5uNG9ocGpldHdHWWRhV3didmNr?=
 =?utf-8?B?ZFJodVpGU1F3dFpDQ0IyZHp4N0FuUDkvZU1Oc3JOY2hvT0tlKzBtQnhWNFJr?=
 =?utf-8?B?V1g4UGdUaTBNZVA1RmVJQXJielg4K3d2TDVMaHNNUUkxaFZ3eFlBQlJLUDYw?=
 =?utf-8?B?QkJBVi92S0V2UnNUL25EVG1DN0cxdHhudmhnNVNUcGFQZEN1R2ZDODlsZmZH?=
 =?utf-8?B?cUpHL1QyUUpCODhDcDdZczcrV2ZRT2lGRTcvUTVEM1IvWEo3VXA1U0xXMity?=
 =?utf-8?B?VEJvdjdTdjlEWmxsR1VvMzIzUUVzaVdkK0VPenFqeDE5b1pDZE83ME01WVEy?=
 =?utf-8?B?dHpTTWp0QzNBS0g0b3dyZUFERkNyWVlGQk5pU0xVT0FNSDVhczVOK3l2TC9F?=
 =?utf-8?B?VjNRVmRMTTJkOU93VVN4MWNHS0U4NUNIQjMzdWQ4cURiVklrWU9xYldta21l?=
 =?utf-8?B?NGZ5aE1HUjJMUkFrTncwTFN2WTV0amc4UjVoZ1ZJSVNURkM3UW15dndRell2?=
 =?utf-8?B?Tm1kcnVRMHB1bkZEY0s4K0czSTJxWGo1b0Vhbk9qb29HY0N4cjhsS1plbGdN?=
 =?utf-8?B?LzJ2b1pwWW9lVVZFdDI3dUxndTQ0cTAyRHVYVCtkOXp1d2FZMi9JNVZkZkJm?=
 =?utf-8?B?Tmt6NVBUbENPUjg5WlpYcnJnTDhyK2EzZm43V0ZHdkwvNnZSYllJTEljaEZp?=
 =?utf-8?B?aU43dXRTK1A0TEQwYWUzWC9vS2hlTkdVMUNyN3FqOFJzZWZOUGJzQzBBNG9P?=
 =?utf-8?B?Rkg3U0k1R01pRWozczUzdDlFa1pnZW1aUnpmK202azJkdVpDZytIYVc1NlRO?=
 =?utf-8?B?eWQyci9ZK1JZclNhdU95WEQ0WWtDZWhaWTVTc1djejdHaGI5bkdRQzZ4dDdU?=
 =?utf-8?B?RTdUdFFUY3F2QXJDMlJXN3BQYkdDN3dmSE5QM1MrdGZ6OVdQbHQwdUhiSk5t?=
 =?utf-8?B?bHdpNm9QOXRhWVJidVdreWtXSldkWElLQk82SUdPdkNZdXBzQXo1ZmVkaDd5?=
 =?utf-8?B?Zy9OaHV6NnZTSVovQ29tTUVLcldMOWFLS1lMZ3dFenZJWnJsWDRaUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d9591f19-afb9-4a02-2fb9-08debcc5a72e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 14:30:23.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stZVjAnAgKdS9PdlDN4dZlOSzfTuNLZxXC08u0v/gt7POPQirGkSIbr5Nf6qSMg/LcoCQq3g1YKDbuUD3L7WkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7630
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-13388-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,inai.de,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6F9AF5F3E4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun May 17, 2026 at 9:25 PM BST, Demi Marie Obenour wrote:
> On 5/17/26 05:58, Miguel Ojeda wrote:
>> On Sun, May 17, 2026 at 8:10=E2=80=AFAM Demi Marie Obenour
>> <demiobenour@gmail.com> wrote:
>>>
>>> I think it is simpler to just inline all of this code into its
>>> single call-site.  The safety of the code is obvious in context,
>>> and you can avoid checking for impossible errors.  For instance,
>>> since all of the options have required arguments, it really is safe
>>> to dereference optarg without any null check.
>>=20
>> If we are going to have unsafe code, then let's please build safe
>> abstractions wherever possible, just like we do elsewhere. We should
>> also write `// SAFETY` comments and enable the lints that catch that
>> etc., just like elsewhere too.
>>=20
>> (This is not to say we should use `getopt` instead of something like
>> `clap` -- as soon as we start using `cargo vendor`, then it makes
>> sense to at least consider having a set of vetted, well-known crates
>> to write Rust tools in-tree, as I mentioned in v1.)
>
> I was hoping for Linux to avoid the Rust trend of downloading tons
> of third-party crates, with all the supply-chain risks that entails.
> Hence the idea of using getopt and system C libraries.

Well, there're quite a few libraries which are "third-party" but they're
blessed and used by the Rust compiler itself (and often maintained by the s=
ame
group of people behind the Rust project).

https://github.com/rust-lang/rust/blob/main/Cargo.lock

For example, I would trust `clap` to be used, and I think it's a huge
developer-experience improvement compared to getopt.

I think it's not really reasonable to avoid all dependencies, after all, C =
tools
also require a few dependencies, it's just that they're sourced from distro=
 and
not crates.io.

I think the only issue is that unlike C libraries, there's no unified ways =
for
distros to ship these libraries (and some distros don't ship individual Rus=
t
crates as libraries at all). It used to be the case that you can enable the
`rustc_private` feature and just link against whatever the version that the=
 Rust
compiler depends on, but rustc stopped you from doing that a while ago beca=
use
they don't want people to depend on rustc's private dependencies.

If the concern is with supply chain security, there're mechanisms like carg=
o-vet
https://github.com/mozilla/cargo-vet which can be used to ensure dependenci=
es to
be audited. That plus the hash locking should be sufficient.

Best,
Gary

