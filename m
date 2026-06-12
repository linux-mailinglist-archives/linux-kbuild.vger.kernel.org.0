Return-Path: <linux-kbuild+bounces-13739-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S3b2JTECLGruJQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13739-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 14:57:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 954686798E1
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 14:57:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=NNGEDVxb;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13739-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13739-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F93230091CF
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 12:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F70338550C;
	Fri, 12 Jun 2026 12:56:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012046.outbound.protection.outlook.com [52.101.66.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B69F2D3ED1;
	Fri, 12 Jun 2026 12:55:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268961; cv=fail; b=ZAnKCqvxnjlxRNuG3wpvmpewQc9hXeLeU+REvPGcgn2e9mon6yLMzGa4KDoXb78Q9QlaxeRO3StmCmUJgMIZKOo+4OCvqGVpIvG7hO4ycX3rbAraOlC3yUeWJDeLyAsuy7Zz6FdmTrPYmkKrFUJ0zMWXV7iaYjAbPdogDfz3n+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268961; c=relaxed/simple;
	bh=1SfwCcdqtBvChJoCjKFoXtMR9lcEiNlKUzVNVlrPPBs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TJmuX1y1L6NXdo0NAu55p5X9xF4BH3+f8zUdjnfK+VDoe+y5gqekIQe9UjJin8eCmDOzbD5YCZj3mD10xix8A4qq9wxgjmKjXX8HeIfgRymKx5qmBDh31mTtVtq6zId+8pZPEF7FsEZQ/aNTxJuDIvwjqsA6FUwO/PtXQz8z46E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=NNGEDVxb; arc=fail smtp.client-ip=52.101.66.46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDf5xsKvC5bzSBWImMZFlWpFsQZhddHtOgbRZ1shV7O75XAKrYEWNRacxff3tSJ3kchlkaYnS17wA5vxfXwM7UM8ir6PiYW4w4WMs8Yz7vR2kOV0hvOLb5MrerConRbT3I9oDlAfAcHT/IKdBJ1rqJKN2DWhu0WcqGlj+qJNQ5bJZwn1y2/CQAOiRq9xbyO7CuPGx4hKT9N1s5+ZzOLz47v2AJWmyTTbpV+XY2sYPoZ46OKgO8XY/N+T2BUTa9udIoL5FYFdvGGyqPb3mgZv6bqdAsfWFaZpOkQEHP3lVoTrwPE1JxB+igCjaTD1wr7BzfFqawycqKikYQIJYah3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO/6LqX1ou4Z3VRKAIDsM3acu8fUnJgiHoFfOZKSXGY=;
 b=I4IfMNb3iO1UzmRpC6YJbF/6tDI0bcSWfDu0QYTiWnrKypsuA2+B0fIbLBCOq3J1r/lv9qhoYCq61sE7OPGYBb45w1yL9hW1aHlfrYRFEptTOUMCQZatqL9YpgvuArSac87ntz4hFMxUsrL6MnGMiyDnBnX+gkSS28DVlYWAbtZsvkm1wquaWcLPBM4e6n1ZYBwXSVHOH7xHDwmzrkHTEHm8K4pIHobpE4mOYLf4uxk3FxyDOlD5QmuP7hCJKMxS9gF8ElT782taujccEVbSGJGiMnfcIhF7AHXxGSbE8TLxAcWYhK+oz//DoEAlxQtBCBBQu4zC5gMo3VyoxWk/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO/6LqX1ou4Z3VRKAIDsM3acu8fUnJgiHoFfOZKSXGY=;
 b=NNGEDVxb83KibfO2+9+QsrD+wUQ0Xto3ua0ky92PSloglX9CkQ+Cgl03FLKj71OGVO9t4fAK4K5u09bUMZ7a215Gxz66RrrrZneHdCq75Y0UCPalfdKYsQ4XsxsnmMPeToaDMznNQqu7RMS2ib8coSoXTok2VgsH6x6O3kqAXn9IHn2awm1GSvCsa3rJ9F3UCbMmuuj0TWNH3D8/Am66niXb+Yb5WEVHbiyr92u1mZe2F6TgK6ADNRi/uCRc1KYhAlpHL+GX7XGU6LzMBGjTBU/PmxesbbqwC8m3zaCK8MeRfflJpIaYNV0wPDbTPzOnkeuk+3XjpK8wgOUW4pyPMA==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by VI0P189MB3236.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 12:55:54 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:55:53 +0000
Message-ID: <56f7bd56-db01-475e-83e6-65963974f613@est.tech>
Date: Fri, 12 Jun 2026 14:55:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/14] kcov: add barriers to recursion guard in
 kcov_df_write
To: Alexander Potapenko <glider@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>,
 Yunseong Kim <ysk@kzalloc.com>, Yunseong Kim <yunseong.kim@ericsson.com>
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
 <CAG_fn=XRzSuFrxtFbz2t9jjY8HPUUhhnU3iWJiSV-X4+hg66cw@mail.gmail.com>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <CAG_fn=XRzSuFrxtFbz2t9jjY8HPUUhhnU3iWJiSV-X4+hg66cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::15) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|VI0P189MB3236:EE_
X-MS-Office365-Filtering-Correlation-Id: 21059141-36fb-4598-f95f-08dec881f026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|6133799003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	mBaOhkZLAGjNnmH3Tu8rXvMAuxONazSJ0VCfMd6Q5qTheCXEt/ZTGFv8G2SStr+FYlDtC+U68Dt4CpRZ1NTjRN5atCx2ZZchnZ6MLlcgGut6e+GmbY6c0PizUc1fENSV5kymfxMiW2l071h2BMcV8ttbhwNZ17WbvrJocyOdIKD6Iq++v63jCggGSVxBDSSKQ9e3l/bJOyz2Lxx7MuSmGcrGf7jXXznppJZjCkKx1RKwTc+ggSRFezzobBBqhRlVfvzg4msMZR0Dsd1uCI644uQbCFnAGg2AdfX0zUxk5SMy8f7F7EwAuql+7S2cITir6+Q1/O7KTKQTuAQ07HK73Z/D0wkpSH7fgeoqrPfpwPQZSS1JD7aMw4P3F8OXpJn7zimB/G6FgZFCVvi6f7kZGPpjLNwMvSXYYeNYZ5U3wIFPXGIhhvegvppBsupQCZG+hTmtgD4rXgE+kl26sgsPkSjDeVRvWrUVn5Ar432+wDuadt0Sjekgq/elWGkqXkuE2lAIGaaB+KBm/1hVHPhqgapQn653io05WQOOpB3r6bcgOkMeRP05sQx+ZBX/Y4BmnwN2DLoVNeyotCWNSXQvOws8HB63gPL8ciDZhY0fDKHZtw45rlc6PGr2VyiQwFy4IY3/Wnj2EVyy9R/zGjcT60semWJ76LC3PR6stTzXdLJy5GU5UjpFGGYC0kiYsm/C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekpxcWVWU3J4dW96aHFETks4M3k0VGpuQzI5ZDFGeWxrL2l0M0NoUXQ5Wllr?=
 =?utf-8?B?SWhYOTBXblMvV2RsalpmZkdZcjJkaEJPSTRYWjNGeFk0NExzOTFYeUtnQW9B?=
 =?utf-8?B?Y3NvUS9UdU1Da1pJc0FtQkx1ZEhXUmthQTFXV01UaEtJZVJ6YVBGbk1NdVhP?=
 =?utf-8?B?ZmFMOGdXTmd1N3dXeWJLcHFIU1l5V1NIeWpMVDJKUEk2ZlBhZVJBZForWVpV?=
 =?utf-8?B?ZlBjQU5BdWgvbnAyZmRseGRGQTk1WWsvYXEyZzlpZmMxMzhkRGtaZUQwOWs5?=
 =?utf-8?B?eDBCR1l0eGU5K1JzL3o0Zm5sTDErN2hZeXVscHNGdko5WmdMd010MVY5cXVp?=
 =?utf-8?B?Z0cvMG1uQ041cmxMRExCU1NHZ203d1dRTllsaDBlYjA0Z1BrZ2FObXFvNTZu?=
 =?utf-8?B?Slk1ak1mS1l2YzR2SDNmYzZEa2lmMDc4emRnR2lvY3dEL2lUeUhJZ3ZPVHdO?=
 =?utf-8?B?YWc3STRwa3BRQ3Vpam1GU2xvN285SjZLMWdnZGFEQVg5MEZCK1hxeUdnVVRZ?=
 =?utf-8?B?dTdSZTZzU3RYOEpIWEZsUVl1VSt2UktjQnV6VW5sdFRHY08rNlF5NnlBcThs?=
 =?utf-8?B?SGY1eHJqbFI5bEhCd0tDUjdqUTRTTUM4NHRqU3dqVnJiOU1oZHVYZTZubDZl?=
 =?utf-8?B?TFNGWCtZUG9iZDkzbXdyYy9JQWdyVDMyZkc5QkloaHdlZ29xZ2VhVkVMQThU?=
 =?utf-8?B?QkNldzEyRmdZdjRSd1YreE8weVp3djVQTXVFV3FUZFlJU0dnMktJaGRKcnJX?=
 =?utf-8?B?Q0VCZnE1NFM1ZVlGcUpUNXA0QXpkekRPRENCeVo5QWxTTmNSWU4rZkdIWXRN?=
 =?utf-8?B?WVgyMWxGanhUQ1hIdWZMUE5Lb0dhWlcxaS9wQ2tnMUxkQW5sYWFKMlNETnhn?=
 =?utf-8?B?bGRCcDRBdW1qNFMrckJRdkQzdVV3NWdLSnkyU2p6NU4ycjlXWlN5MzRsVG5l?=
 =?utf-8?B?UEJBUkpPdlI2NDdYZCtOcFBvVk5va0svanI5bjkyb1NJR1RISVBMV3lBT3pM?=
 =?utf-8?B?bGpjL0VKV2p4WWk2RVBsSG4xdG05K245NVRuRTlWN0F0ZjN1YWgydzRXOHpR?=
 =?utf-8?B?NlhKb0NPcWtmUGh0Mnl3TXFKQXpxN0FzOHJ2TXNCR3VROVk3OVV0MnVudzQr?=
 =?utf-8?B?MHFsbjF6aCtxcllsTjVGc20xQlhhWFo1N3locWpvK1BJRHhncUNndzg3UHh4?=
 =?utf-8?B?WU12QURvNE9JbGZMSlkxOFFGOXJzZE9xd1FUd25Qdm5nZXpuUlBkRG9waXl2?=
 =?utf-8?B?MGRGVDFjeUc0ZUFhODNNcGxFNWJ3WEMvZ1cxSVd4NGtLOUsxNVhUcFFkM3BM?=
 =?utf-8?B?S2lEc3pYTWw3YXgzaUxYRlU1djlHVUR0eVpXRzRHVmdrRW55bTFodlNtWXVt?=
 =?utf-8?B?VWs1aXFlamNLY2lJQm9WSFJMV3lqYmZxTFlid3hqT010TG1IYnZ5VjZta2xQ?=
 =?utf-8?B?RzNiZEJTcnNBaTBPNGlHbUdQeVp5Rmpia3d4K2hTbnV1R1lxUFBoR2VvUUhk?=
 =?utf-8?B?UXlOMnk5czdsejJCL2VBdjBpdkxaTXdsM24rWWtQZjU2Tzdib3pGY0VUWnRZ?=
 =?utf-8?B?eCtSeDZUZ1M2ZjliZ21PbzNuRUVmeXpxTDlJdWpNRngrdWJvNEhsSyt5Uk9B?=
 =?utf-8?B?QnE4ZjFybGlVRXRscWJ0eEIwekl0N3RxR2llQUpkaTV1WXQvUVVTUVhBOXM3?=
 =?utf-8?B?eTdsc2ppVmsyTkZRUXNWRlUxTGxXWHZYelllVVFlcHhrT0pSekxhb251M1Fz?=
 =?utf-8?B?VURHUitNQTVKOXNyNndWNUFJL2dSTUFWRFpqaStUclRieXBleVNQWDBlOWR1?=
 =?utf-8?B?eXRKVCtRQUY3dUU0NHU1VkJvNi9TRGQyckNYY3lHYzM5cWtVdU1Vdm5XdElZ?=
 =?utf-8?B?OHgwWU5wc0RQZnp2OWVaZndXcWQ5aG5ZMU93Y2pBMFU5d1lmTmoxdEpzaytT?=
 =?utf-8?B?T2hBc0QwSlF6NkFEVDN5Rm1kZW5TVE56RjYxczc0Z3I3OTdyYTIrMUdnamJH?=
 =?utf-8?B?OTl2b3pidzlnSkV4M1I3eDEwemVyNHl6NnNqSjB5VlQxUGpiZlBUNFFzc2Vr?=
 =?utf-8?B?M0ZpeUF3dVFxMHdJSFdWa3czOTIyU1N2QXhZYU4vbFZjblp1QVZzQXc2KzFE?=
 =?utf-8?B?RzZPZDVncVNOcWwzMW82dzB3WFdHOGdkTHBUVDFxUU1yR1BiMUFzcERnMnNC?=
 =?utf-8?B?Z0ZoNks4UXFrc2JLenRVcnI1RFlIRnR3MjdvYU9SQXk3cDNmL3J5VXdBQzho?=
 =?utf-8?B?Q2xPRS8wZWpYaGlFenBvbmJZaHVFU0dBZllwUFhsWkhmL3FhWDEwYStUNWtT?=
 =?utf-8?B?K3k5dkF4byszRmhRZmZJVjlpVjhsV0c0NEEycjcxbFNsM0FQU2lqZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 21059141-36fb-4598-f95f-08dec881f026
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:55:53.9566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZL1jHNSJseZfzeNrUNcvuzkLiXvCzovV7SbsVJKhprtiKwUZ79sUjryNmA09XdqIpTjqFAvAOp3512qLqgKjdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3236
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13739-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:glider@google.com,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:llvm@l
 ists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:ysk@kzalloc.com,m:yunseong.kim@ericsson.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[est.tech];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,suse.com,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kvack.org,kzalloc.com,ericsson.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[est.tech:+];
	RCPT_COUNT_GT_50(0.00)[51];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 954686798E1

Hi Alexander,

> On Thu, Jun 11, 2026 at 6:21 PM Yunseong Kim <yunseong.kim@est.tech> wrote:
>>
>> The recursion guard (bit-31 of kcov_df_seq) prevents reentry when
>> copy_from_kernel_nofault() or other called functions are instrumented
>> with INSTRUMENT_ALL. Without compiler barriers, the guard set/clear
>> can be reordered relative to the function body, making the protection
>> ineffective under optimization.
>>
>> Add barrier() after setting the guard and before clearing it, ensuring
>> the compiler does not move instrumented operations outside the guarded
>> region.
>>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
>> ---
>>  kernel/kcov_dataflow.c | 2 ++
> 
> Please merge this patch into the one introducing kcov_dataflow.c
> 

Understood. I'll merge them in v3.

>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
>> index df7e8bf70bfa..5248293280d5 100644
>> --- a/kernel/kcov_dataflow.c
>> +++ b/kernel/kcov_dataflow.c
>> @@ -86,6 +86,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
>>         if (t->kcov_df_seq & (1U << 31))
>>                 return;
>>         t->kcov_df_seq |= (1U << 31);
>> +       barrier();
> 
> Please make sure barriers have comments explaining which barriers they
> pair with (see kernel/kcov.c)

Thanks for the pointer. I see the existing implementation now and will align
my changes with it.

Best regards,
Yunseong

