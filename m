Return-Path: <linux-kbuild+bounces-12233-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJCoIJ3MwmkBmQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12233-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 18:40:45 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D312431A2C4
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 18:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6D233014C27
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 17:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC2B407589;
	Tue, 24 Mar 2026 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ckvSIwf7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EI7p2Apn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23BB3DBD5D;
	Tue, 24 Mar 2026 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373717; cv=fail; b=fyKiK3Igjb1f6R0Okewhi+O0oodNX0aVvZhLLwZN8v1YzuBOIT7+Yxh8nj4HV2qUkmY9aSBU/ocIZMiZpmOZzVrMixFRCwiI/VwLF9h63TfT9l1KE1mQvmhfikcR3BnOHNq/ZmFMMekmJ9dIirSLAuJt3mcP2OY6OGtpIdkG1fE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373717; c=relaxed/simple;
	bh=mG/fW1PI9VxCumAgnkHP2mplavwQ571jXB7m85+Vo7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dh0jFIlrZ8s7za37ckDiwEn/SIgDYUvVPy7jttXElU16rV5K3hvw4/U3SxAbq4lOJF8r81Ctm89zNUe1fHs9zDoJSh34Pf6ZnSzc2GhGEIasNpB6OB7frkyCA9CLtc6bCmkaK9NuzYsG9T/XxkUP7eGYmODuThKx7UFJXoYScpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ckvSIwf7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EI7p2Apn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OCBsEm4016998;
	Tue, 24 Mar 2026 17:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=A8bNXlkP5gVPA89uFxTddkmHCZhgk52t5L2eYXPZ09k=; b=
	ckvSIwf74C2jjAOr6ff1Prp2iz+KqN6+oxVLMvaylr5+3Tnt7VC4exqglMwD6qcP
	Evzcwxvg3/05hZqczqj8n7PtBYjnUGy5nHaI3TeCmvW/5ullPiCqRep0hvsUofG3
	wrOSU9+spnIDioFs5jeaDO071LUP2JvPgNhOJy2zqjQRiCDs1fBZ8CnxlbjZczbd
	xjKAG47p84qc57FmuPTQgvnYVE1zdD91bSsK2MLQKpYshtYOdYOfIBNKToMXXr1n
	XIVpbjUDUefVCX1nIXlbpjmEWUOvHNEdaUnzmHCF7jwTCuFsjda4HeKaDNekBuE3
	NW8UX8mVXwGi1sJtQmhMSw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d1kj2cqd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 17:34:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62OGmG4K038856;
	Tue, 24 Mar 2026 17:34:21 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d1hsabtjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 17:34:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBJ2LWXL7VVn/W5JD7DUyvLjydgd2F+6/xI0PZSolURZLznnGJmtQxoOm0c8zHakyl6ZDMFiQhXXvAeCp+7E6IVVNMrfg3VczThCIJXdvnTPtMMrS6VNGaHlFcH/dMU8LK4yt4LWIblcsVLAUzZZNFIy0G1gfHTTHp+0asB3e8osuBiQ4zEnkrkJvqK7UPm+P6OCdY+mN9v4HlHf/GdxNyUUtBZQu/Dj5IiarJ/d4+Ag9eStZ+YQxcKZgBV6dqq9BzT65lxk/A1/QUFDKiEK5zNKT4jkuUwKqpFWRLrVP1dj/uWhA91z+8lmrMW4EpLAyxtGz4Bvx+treHT5QxB0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8bNXlkP5gVPA89uFxTddkmHCZhgk52t5L2eYXPZ09k=;
 b=irjGdKyz82qfyuuGu2o9yBCrOawdNfTQFduZl157Fo0WJ3KXzWodvSMK43BNp8KV3q2/b4Io9ohB70ekzFnBiruZs6US9055DXOR/kB7/U3wqxUuVN+uFmotH3+41n+QwFxDO7jU7WiJs/IaA9hI37iNxSGF6ke2LdVRmwBoyUNFIsCBq5v+wWD9eCVYtF/A+bkGEPjCDs6FQItUn4zLnaUiCs+Hob15CbV1xB5nnWY2LjBR/lGCP8OajnbGOJGrdWxi+3hEaASiQTHpvKHH3eVK5SnGSnAtmdcVpkRMU8HffgM2fEPVMUVbEgPf/m1o54UNyGfvOUYiCUrAPytWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8bNXlkP5gVPA89uFxTddkmHCZhgk52t5L2eYXPZ09k=;
 b=EI7p2ApnUgaD2LGLfF7bkjsXdx8DAOksyejtOvn+/vqgaBnMQzirCEdNPr6KWW27cl6YHraZcoB48lcb03ZNLpRjZdP/SRLsmhAynSuxTxoWCx/i6VrpsUqlxB+1roRNxB7I8ILK6zOKZXWlnKByZxZzOHtaIgnXLaD45UUxbfg=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 SA2PR10MB4570.namprd10.prod.outlook.com (2603:10b6:806:11e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Tue, 24 Mar 2026 17:34:16 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::3292:21a0:97be:4836]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::3292:21a0:97be:4836%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 17:34:15 +0000
Message-ID: <cbeb9f50-9398-4afb-9fb7-243d2841187e@oracle.com>
Date: Tue, 24 Mar 2026 17:34:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] kallsyms: show function parameter info in oops/WARN
 dumps
To: Sasha Levin <sashal@kernel.org>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>,
        Alexei Starovoitov <ast@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        David Gow <davidgow@google.com>, Kees Cook <kees@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Helge Deller <deller@gmx.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Juergen Gross <jgross@suse.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Vlastimil Babka <vbabka@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Petr Pavlu <petr.pavlu@suse.com>, X86 ML <x86@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-modules@vger.kernel.org, bpf <bpf@vger.kernel.org>
References: <20260323164858.1939248-1-sashal@kernel.org>
 <20260323164858.1939248-2-sashal@kernel.org>
 <CAADnVQJjJwRtUQNZAhLoXF7DYprhU97xJReZg9izV7n3f7=uJQ@mail.gmail.com>
 <acK1M_CvbYCtq7im@laps>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <acK1M_CvbYCtq7im@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::14) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|SA2PR10MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: 74043743-2b3c-4ff4-7c64-08de89cb9221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|18002099003|7053199007|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tEZ6tXNY8kDeimKuHmsPQddlihY/srQb5v74AINNqkI+sp5OduXGNjFyU8R3XDxpsnG+o2h7Qp6I6o1sL0DIKFemzvL9GBjiTC2LZ5fN7PQ38Z7BHKY8LrmQX31lM4GAXhmTT/8ecC7V4x+JkrvkxLoI1r0MTX+xTWaOGDR9qTMrunllqYI3dwamjs3quhNF8JTuEIcImsbZ0AyXCsER4qrO61sm1xag+RTOeV39VaRpqAWfQ6jTyqjEHQL2BK7IxftheUoumJk/uiGWmnfl+0n9yOzUEHiILnKmutcxHNwa8iDQYDSj/jEDr/R8Uj4KF2Rz32bdV4/DrHSL7syN64ZUIXL4VfjLvMnbv920ad553Ilq2J7FO6PeNHjPYWLViYljleU22tR33Hhb0QtHFl2JiuprRFzzzNnkJ6V11Jt2O6nrbRZqxIm0Jga22weiL/DgYIiqN8jnLlUoknzMWQgCUGPWhwN1EYajEWEz6qH1WrTdWerKRyykESfdfNex+l5QaLmoc4xhpdASPAmJ7cfrn6oy3KIlxn0aBPl2/Acf+xQ2livPMYcM2WPicJQUzgu2uQxxEVLfGB/fE6tVH89AoMCJmxKMVcFyhdVIATzELRZx+/cn80IlS51u+na5Md4g1bwQmh0JqRQ7YFw0KzbfudehZXu26KqXcqj1v5GFImcAObZu2dWiS0kDCtJGiYS1W3ic+ikexG9clbegVo9aQPPqC/7OgbiIp8wIPKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(18002099003)(7053199007)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW1ueTVxV3poNTV2dmdveXZYU3BSZXBsOUJvZTBPb3czNHY1QVZLQyt5enBm?=
 =?utf-8?B?Uk16SmhHVWtvcWVPUVNlZmYydUpXN2VYS0RNaysyYWR2NzhCaDVON0pnNGNa?=
 =?utf-8?B?dVduMldCMDlVekJlYk9CSE1tWnBWc3J2MmgwRVdVUFo4VU1HSEwvK2M4a1ZE?=
 =?utf-8?B?eVdNT1pJcFoyUzlRZVZNVjkrT3NleGNZQUtXa0M4T3M2aWw1L1BjL2lNVjhj?=
 =?utf-8?B?eFA4QzNvVzA4a0dqeDZoOXdwdWRmTUVVdmpwT1h6RDBzRTgzdnpnd0pzTzFo?=
 =?utf-8?B?cy9EcEZkWUN3TnF5a1V0SDVLdDhGQ1pLMGVEZjk3WUNVdW5NL1BtTVpvYlhU?=
 =?utf-8?B?M0laOGtrN0pXZDhwekxlbSswWDFMMTBQNXRBNVllS0lxTnZJSm5xUDMzSmZZ?=
 =?utf-8?B?SGNxRStiNkx6SStTUWZweVN3R2RuaWtoNnAyVTJZQlRINlNGb2d0U0R4NGtZ?=
 =?utf-8?B?Yzl0Z1NtVEZvbHBSNUNHYjVadHhLdG9xYitqZkNMbWdTTWpJVG91NFpETFdh?=
 =?utf-8?B?U1A3MUdyRUNOaDBvTG9YeHJGaWFDVGM2a3F0QmZxTEhuRnc0cWRSR28vb2NO?=
 =?utf-8?B?TFpvSGd6Tjk0S0c2M2JIcjRFTDlBbkxRb0M3L01tSVdKTVkxbHc0bmsvcG5Y?=
 =?utf-8?B?MGJVb1hFaEtYSThYSWdINjBnampMcVVZa3NGWmpqaVhDblh5NVhTYWtScFdt?=
 =?utf-8?B?dlZHYlpjTmJwMWhVUmp6UVlVbTNpbUw0TlFXWVVIYllteDhRUnNaR042WjNi?=
 =?utf-8?B?dk9lY1RSTzVWdEErNnZVVGVqMDlKUktFeFhxdVE1QnZkVkh2N29sS1h3dW9N?=
 =?utf-8?B?TDF6RnF0aGlZOFBvS0Z5OXBuVi82cHUyMGNQZ09lTkFJNU1aY1ZQSFNqU01V?=
 =?utf-8?B?c0ZFejdkSDhHYStxYnpOTGJOYWpFTnYxblNsRmZYZDhrUTQ1WjgweTBLU3gw?=
 =?utf-8?B?TXBqMy9tTyt0bGI2U2xpQk9nMW0xcHF0dlUwekxpa1hTbGx3dFgrbU1iUFI0?=
 =?utf-8?B?NFBXb3ZSTW11SXN0SjkrdVN2dkE0N3o5T2Q4TjBtUHV3SFpkZDVnVU5sWjVI?=
 =?utf-8?B?T1VTUEkwYlRJVUdEUEw4cDZZVGwwL2ZlR3RHRnNiQmU5dDRXcFVhMnV0T21z?=
 =?utf-8?B?SGFTN0pxb1NlWDQ3Mmx5K0loNHBSU2owdVdpQzY0SDRnQ3JiZ0Q3cWViYWl6?=
 =?utf-8?B?VHhxWlFra05zSExhVDNSY0VLQmd6NG9FbURQcXhUQTZDOUlNZ05ueE9aZ1Y2?=
 =?utf-8?B?SFUzOGhjVHBiK2RMTVpuZTZBVmcveERxTkx3YS8zS2dDOGorVWIrS0pEM1N1?=
 =?utf-8?B?ckMxeUNaamFxajNhSFVsSVR3U2RYMjNldGJtVDFpR1JTTHQ4Mm9kZUFRV1gr?=
 =?utf-8?B?MG1XVTdmcW1xYStDb2M0K3RrUjQvQ2g4cWE3VlRHc1NwZUp1VWZ4QjFxUE53?=
 =?utf-8?B?VVY2S2xwajBuODBXOVNLcHZ1NUNTaGdReE1jdnVtV0NhOVg1bVpkUjAzbzVI?=
 =?utf-8?B?YTNNYk5FRy81SDRsbEc3VDdNVUhySFVtSHdYZVNxTTJkV294cW5yZ3Rndk5T?=
 =?utf-8?B?NTZaaThWSlJzcittZGcyRHNqc1pzZDExeEZUUnhaTjA1R010SXBVb1ErZWpy?=
 =?utf-8?B?QThUM0FuQnNVc1VsdzlmakJ4WUhDSVRwTEVBOTVVZkN1Q2p6emZOSVNJNW5K?=
 =?utf-8?B?S0F2YmZwYklURzhBbFRudFVmY0RUNzVCNmM1YUF6NkVJVytuYTE1S3ovNkgz?=
 =?utf-8?B?cS9pTFRhUjNWTTZwdEExNjFqekZlR1crakRZSkI0UnZJNmgvTDBBN3lCbUM2?=
 =?utf-8?B?Rll6UkFHSkZyalk2MWg0cm16c2J0R0RpUXppS25Xc1RQc3dNUFd1bnc0cWZj?=
 =?utf-8?B?M2tuVEI1QUxxN1VOUDFVbWdlQjdXVVNYanIya1l0dGhSeUNWSG5rWndEN090?=
 =?utf-8?B?cDJKS1dJTDBzdXBLdDczcHdocUZDaHpodlE1RVA5Nk9Pa3NOcFhyTDBPUlhB?=
 =?utf-8?B?QitUZ2dnY0xWK3B4R2FFeFZiUjVtNU1EV2JMS0c2c3liTHhMMmhVUXd2OVZH?=
 =?utf-8?B?SGFQZTVsd2lMK2UvaHNuRWlFUU8yU1lXRkRpaUV4R2VSUnQxWG1oT2dxL3Q0?=
 =?utf-8?B?Skwrd3FLbVdOZG1SOHlyYkUrd2l3RHdSREMxRitqeVJ5eDVEemdnSDdkZ2NQ?=
 =?utf-8?B?WXhPbmRtOUhaSExGbFZ5SXdEVFh3aFQzZ2JqZkJqdHluYWdmd1h1MVVTQk9U?=
 =?utf-8?B?akhJdDY0TlIxMWk1UHZndk9Uc2RySDl4SDBZT2xoR0lPTklhbmdiYmthZC9W?=
 =?utf-8?B?K3hQSE1pK0RMS2w1aGhsaGJhcmZPZWFSUEZFWEFnb0F6a1VlVzYyQT09?=
X-Exchange-RoutingPolicyChecked:
	UpEOQUnRKP7nNq7o+cjCD1gOuU6JuunpIED7ExdjTO1c76SEWuQqzW9VMZVJBJ8/ZrG3tjwdzVfgj1jCJsteXDugAlr5RpputR76NOxZ5ZSHlUbHkbe24uAJWl2g5i8kTWH6oZZjgitnXPBIaopLAlvHYrgCfEgHkw37+W3cZ4hWoAfdQQcw70uYe0mKN/6sw/+0Cye8TYH81crxJLehlUJgaIqRx2gJtowOVq/JCmQK19cmLPI+G8PetkZEp2UpNxSCfXjgw2uJZ2d/1QBGT0yqnAU2kSWPddzUcuC95bKrguzi07tRQLNbHi/Xdz+JQBCiKjc0hTk3bHhJ70cR2w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gf5isUxCpuCoWVMngTistQT14j17cZNMqbybrU8thEkLCq5GGfFMrnqhBxLugt8+M/Jvxw5BbaY2DVIjL6NNpDR3yXBcWtxQeowmK1jyysu7e3AlSv7zDflvCLTuSe30gU66UgjDjBsr73RpjrEMIOS058N8ILL/uxEFVAe1REP28J8tFVeproOkOSTbsm+0MEI3I8B6HS2UJXuW+irnNG7A3A4HwtZLizyPr5nx7hjGi3lx0mms7I7N2/aU/tcb41KgxYRkawKTe6d3uTyBvI0Fv5/KmwTlFu/O7rYL6h0xDeQupQbqqYvJ2c5CIA7/nfp/tunKhg/q4nN6rKOy2aRTbD8vTCb+wESNQN+9c965YgPUAuoZm/fv4I6YeXwVw7Nl64l07zFkRWNBAsAeCTbroPDmakNfZI3Xd5qApeOvd6jzwBFvrXOSv0lwGz/+DTl4SeARWdngFCFR7Sc5pCEXn4qOZ2M9GXwtLr7ihpU8yNXvJ8U1Zgd9eN5gZPQ1MtVH3/rZLFnDa36+5gm1uQ0JXJHOzsjulGbhVznU549kvb8TpgPwD0Lq3v1qm5EemrCbgPM/b33JuCJiK5N6qURwMqnByZIhdbp1w1x7IWE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74043743-2b3c-4ff4-7c64-08de89cb9221
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 17:34:15.8811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IC6A/upSePeUuQeMoSXsgXOHakswdjxcF7JMzCrdFaV5ACXcsR1o+l+QmxYHPm0fl3WGOq+M4OuBvw4x3nmFaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4570
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603240136
X-Proofpoint-ORIG-GUID: Ejxol1MMritIebj_bUbqKnFHBKCuIzos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEzNiBTYWx0ZWRfX1l7vHNUzu0AV
 QxtiQxoG3qOS7hzcLbvCdmNXtSV7MGSKwF7w6L/hLli7BiAjAXF2GwICCYFbbrNWqfuOe44GkrB
 08WxUDtMxYKCnAKEdJ47wPv+fpwUynJCiJ9t11/im5yr5YqEAjmZDDHeg4fKKqMaTmoHwfIyx/B
 /yAlAN9uKC2ePQQ5VD/1f4gewfirH3Xd1qj6nvRvjsbEAmqR9y6a9VXERFaYcfOuP9VA1zuFjyO
 jfViWqz4F2p1MGam/sioKlv3HAx4NiisCUL0asbi/C2V3MQenfEDVAUSnFg7bnaDL+Kr4cMT1qA
 ILfceePDPdkGl0V3txmXy95nWERe3gz8njmky0C+sCOhrl0GMoxzZudcHTSykUfX81/wr20vy5s
 fol7X8vwQd95RXow8YqSO2th8YYVvEWdNZiFGUAtWiSOZw+sqmZz8wDHl0Bx2x6S2jRMZOsvrWM
 ipbfbsrM4rwZOmCAiQgX0io4H0mF0398ybFaihsM=
X-Proofpoint-GUID: Ejxol1MMritIebj_bUbqKnFHBKCuIzos
X-Authority-Analysis: v=2.4 cv=KtJAGGWN c=1 sm=1 tr=0 ts=69c2cb1e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=VwQbUJbxAAAA:8
 a=hsm6sQPgpTD18j6DnyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13824
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12233-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:dkim,oracle.com:mid,oracle.onmicrosoft.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,suse.com,lwn.net,google.com,linuxfoundation.org,goodmis.org,gmx.de,linux-m68k.org,hansenpartnership.com,gmail.com,ideasonboard.com,vger.kernel.org];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alan.maguire@oracle.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D312431A2C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 16:00, Sasha Levin wrote:
> On Tue, Mar 24, 2026 at 08:03:30AM -0700, Alexei Starovoitov wrote:
>> On Mon, Mar 23, 2026 at 9:49 AM Sasha Levin <sashal@kernel.org> wrote:
>>>
>>> Embed DWARF-derived function parameter name and type information in the
>>> kernel image so that oops and WARN dumps display the crashing function's
>>> register-passed arguments with their names, types, and values.
>>>
>>> A new build-time tool (scripts/gen_paraminfo.c) parses DW_TAG_subprogram
>>> and DW_TAG_formal_parameter entries from DWARF .debug_info, extracting
>>> parameter names and human-readable type strings. The resulting tables are
>>> stored in .rodata using the same two-phase link approach as lineinfo.
>>>
>>> At runtime, kallsyms_show_paraminfo() performs a binary search on the
>>> paraminfo tables, maps parameters to x86-64 calling convention registers
>>> (RDI, RSI, RDX, RCX, R8, R9), and prints each parameter's name, type,
>>> and value from pt_regs. If a parameter value matches the page fault
>>> address (CR2), it is highlighted with "<-- fault address".
>>>
>>> Integration at show_regs() means this works for both oops and WARN()
>>> automatically, since both paths provide full pt_regs at the exception
>>> point.
>>>
>>> Example output:
>>>
>>>   Function parameters (ext4_readdir):
>>>     file     (struct file *)         = 0xffff888123456000
>>>     ctx      (struct dir_context *)  = 0x0000000000001234  <-- fault address
>>>
>>> Gated behind CONFIG_KALLSYMS_PARAMINFO (depends on CONFIG_KALLSYMS_LINEINFO).
>>> Adds approximately 1-2 MB to the kernel image for ~58K functions.
>>>
>>> Assisted-by: Claude:claude-opus-4-6
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>> Nack.
>>
>> You asked claude to reinvent pahole and BTF and it did it
>> completely missing years of fine tuning that pahole does.
> 
> Let's keep this on the technical side please.
> 
>> dwarf cannot be trusted as-is. pahole converts it carefully
>> by analyzing optimized out arguments and dropping signatures
> 
> Fair point about pahole and optimized-out args. The problem is that BTF depends
> on BPF_SYSCALL, and the environments I care about can't enable either.
> Automotive, robotics, and safety configs all have DWARF and KALLSYMS but no
> path to BTF.
>

Curious what the blockers are to BTF adoption? Hopefully we can tackle some
of these or get them on a roadmap at least. I know some embedded folks want 
vmlinux BTF as a module instead of directly contained in the vmlinux binary 
to minimize vmlinux size; is this the problem you run into? Are there other
issues? Any info you could provide would be great as the aim is to make BTF
feasible in as many environments as possible. Thanks!

Alan

