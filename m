Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFDB710940
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 May 2023 11:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240246AbjEYJxH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 May 2023 05:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbjEYJxF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 May 2023 05:53:05 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2084.outbound.protection.outlook.com [40.92.98.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BC912E
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 02:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXpnHxSatRGY3pMGyhNNCk9F7aVRfHyon9arfcEdF76vPWUKpVprAeR7Gqt0OG1xPcuFD71RqrEReqnh02SbLep4AqGAG780NetIWvDv0ZJVHS3x2Hy6mzHJP/M9ifGhHhP5Z8xg/X7CaJ40pXkMmtHWeCg4lXFUQ1QEwHYuAkLQ8Pg7JTPnOguOm6TiiTQAcZVdASTfjSgl57KRolTBJPqbJ7ZtJk+QikYX+cMfgfRBC4Uc8EbzYMYDP/McBqAWqYuSghzUUnPUyJraaEmk/T2r5GrXH8kFQYBBLzWp86bAZLMu5chubR6BDwFTuSjv61BXRWH2op7OdbIClYdHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXWeq+3PRNEweWV5pj4ZGdRSsBh8+KMBzCtRcVkFEhc=;
 b=kXblrx6UvKuXbR4AO0TfJZe0xACNRRgAmmPQl2iZdEAl3/MqBabOUiIhCtg1wWzYnmFtMCpz5GqY5fUVaWiSU5RqJgq9dGsZQCbb9KXlwIq3n235SOKO3dI14HbTCwEBxArnlfW9pyJ/z5nj64D+l+JSTZkYHxRKHdj8m4ghgESf4rGhE6yGjLHxRVTvR/ExZVn65UzVZJN6GWKlJAT5FCqeRxQSYifltw8k3dxo0XvTXwAasI3dGAMSBH08fcjjY0UVRWlKTGeI67to1hRmORRAdU26i+JuWs/KhAx3ldmZH88hR4oEzPjr1MqM9tE1Eat6HGplQ/2o6qECUmSeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXWeq+3PRNEweWV5pj4ZGdRSsBh8+KMBzCtRcVkFEhc=;
 b=A/R8yr6o8MY0D+GnyNXBy4Yi2brW0k42Sp1OiX2V9i/Cx48IGh4jMtGLeSGU0KpAcZzQwcTJe+W4LzLoiCigNGUk8WkfauwT3r3QwoI851P3woRlY7kZRHqwuoLCgvJrxJ20wO3sfi/6gfnuO6A1XAdPbMUlAH3PxzNK3Q6bT6y17NZP2fv+gK1dwoFHuPZHGiEbIutALrNANP4lP90cPfHk+wS+llX+DsoY5hXzAktkhtTVfH57cXYtJq4AaGZ0CQsAkRBqO0sthXeyTaw5qxGVeQUuQ3moVmBn46XinlANizIwEsHkvYtSeAfN8ZeoC82S/Ogouk29Hx7T6FvOXg==
Received: from TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::14)
 by TYWP286MB3509.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:393::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 09:53:00 +0000
Received: from TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d9fd:1e8f:2bf4:e44]) by TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d9fd:1e8f:2bf4:e44%7]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 09:53:00 +0000
Date:   Thu, 25 May 2023 17:52:50 +0800
From:   =?utf-8?B?6IOh546u5paH?= <huww98@outlook.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, Hu Weiwen <sehuww@mail.scut.edu.cn>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] gen_compile_commands: include targets not end with .o
Message-ID: <TYCP286MB206691CCB2017E03B2AA7567C0469@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
 <CAKwvOdm6diEmc+utBNxQ4ftx3Ai2SD8q32TxRgeZ-rpGoL2Bjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdm6diEmc+utBNxQ4ftx3Ai2SD8q32TxRgeZ-rpGoL2Bjg@mail.gmail.com>
X-TMN:  [XXFNkomudNLA2XNYAazoF50FxlG0xLkw]
X-ClientProxiedBy: BY5PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::14) To TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::14)
X-Microsoft-Original-Message-ID: <ZG8v8o6LqyqDKujd@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2066:EE_|TYWP286MB3509:EE_
X-MS-Office365-Filtering-Correlation-Id: 8caa5ecf-2433-4b3f-cffa-08db5d05d2fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9t6PUwZLznmnrNijmRP7z92gDUN+sHkcNDaEFgPWX7r606m018j/uKdu/XBj9BSexxtz0/ApwdL/bcQs1zihJohACPgyly85tgH5M8eVp8r+vmBCQM2vIOwyLh65Id3uU1LQij080ZqXPRCe4Q/gOmyaC8ET2swV3prMPXJrhQ5BPUG8gwHB7YflyX5uiZGbGetIGQAyfJNdYTcyUEaijtnDYVb5dUNG64Brdt8/SBV8dBNYe44VmTm1C9+qkh+h572pvKtKettx2zYESX2hYgFkVzxSquuHwbYBi+MCpTytoNarE8+3/vVPMjLWqHLZ0GmsSdWgwsmGg0fPXK3jnOHpXCa6eB0E4QECoMRk60HSqz/aqQTuKBjFpc6XExSul8DHpgl76AOt2ZVVC00FOYXXBiMDnM5EOSW0JiJkNNkijp6EDV/vwKnvIzY2BXl9LTPiAUq1jHGVtB5RJP04ZcLM7fhPmxAeTk7y587mJwQOtZh5PlP3+C9RLoGUFBuYD6ayFkWbubU95fbbHAuq2U5QXsn3K1g6WfWd9EVnqSFmkfO02Wf4mOYlT3T7kw+7IsXaMQq0ubGCNKdZWz5aJscKS20hBut1UB0p/rFzvuY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGxaWFdxNEVocE9ZU2RJS2ZxalpXTGRSUkdFZ01DZXlabVh4OVlKNU94MGFa?=
 =?utf-8?B?WTdPKzB1REEvZllmUSttSmR0TEZxcHpWbDFRMUdEZGRlK3ZDZHVlL0E1MGRs?=
 =?utf-8?B?NWpDdW9Id1VWRDk3SGd0SlJPN09jd1RLcUxVWmVUTCtSbGdQYmo5cmVzQXFw?=
 =?utf-8?B?THFldjdyaGdiRk5BMVRmQUVvK25BVGRrQTlHWTdxTW55QjJrWHAxWG01UzE3?=
 =?utf-8?B?UmFlV3Axc1VxRTVaOFJPeXFnVCtzemp4U2hqMEdHS1ZRR2VXbGFQcmRidWtU?=
 =?utf-8?B?R0NQNUNzWWZYZFA2Nm05Y0d5QnBLWm9BUjBNTXVZampNRWFGanQ2a21Sdmcw?=
 =?utf-8?B?K1o0Z1JYaUwyQi8vRnduL041Y09aTCszUFp1aHZlNEpqUG01bHNycnE5eUhF?=
 =?utf-8?B?Y3JjTUJDUFNRbTdEVUNoTmxWaVFxYXZDZzJPc0pmOTM3Q3NTVGg3SmJBWVEx?=
 =?utf-8?B?QTRoMmFGRERZeTlFWFpMbUd1RTBsekorem5HZXVSZFpyMXhpRGNJWVE1aEdx?=
 =?utf-8?B?dUFCL1d4L3Q5TDZKOVg4N1laNFdUb2lISHNvNDVRb3BZNFo0NDhqc1JlVnlj?=
 =?utf-8?B?dmtuZXRBMWRsL09tUFFWbGdiRVJ6MW5YbHpDeHMzOC9YVWpyT3UwUGJGTlRO?=
 =?utf-8?B?VmxVb1ZpNXlzb2xramc5WW4rNnBsU3UzMUg4eUVud3p0RWo4K3FvSnVaVWJq?=
 =?utf-8?B?MmkwSnFEZlBrUzJHTVRxS0lTS0FUT0xxb1oxbW5LWXpkRi9zcjhPYUdHQVlt?=
 =?utf-8?B?Y1RrSVRGNVZNSktmditycmQ5S2xjS0dpcUNmSkljU21BMURWU2F6Um1FY1Jt?=
 =?utf-8?B?dEtaaExuZFk3cEZWLzh1a01RT1lUTlJobjQ3UDducDJMNms3VncwK1p3aTR0?=
 =?utf-8?B?NVFDYU1yZHNFUnQxU0lMVGVxY3MxRjJ4TXFkdkhxVTFPdUpRUStuczNqdnJz?=
 =?utf-8?B?NHgzM2VzbE52VlJKSmhHSVBJc2dCU1JGWWp5MCtPNjNwVWJhL3hFYlJVYStX?=
 =?utf-8?B?bndsV2R6UFF0dWZvQUQyMnEzb293emZjb3NYVFUyUS8rS0p6cnA1aWpQYXlH?=
 =?utf-8?B?blRhOTg4M2lCMVJDa0crTTE2cm9IODY2QjJnVlVNakhTTGlhcHJlMHNiR2g3?=
 =?utf-8?B?TTdNUFNDWUpkdVMxZTJiTEJkR0VqYXBNK2JSbWZqYXFxRGdJUzk0YjVPY3d4?=
 =?utf-8?B?TkFZUUtiMnBZcmJ2WjVlcTRpT3Jyek53MUROcUNrSjVXMFAxZmxIZGF0cDYw?=
 =?utf-8?B?ZUxMZHdleFJrMzV5VmN4RXAyZThINjkwZHpNQjdtTUZRV0RZSWxEOUYzQThk?=
 =?utf-8?B?cFB4a0hQeVJWTUNJMUF2b3MwSnRuWjZ5Q1A4Nmw2OElUbjJFaHVSNXkvZWFV?=
 =?utf-8?B?alZsVWI1eVVFaVFHMjNrSmlTZmJtUnlpYlB3dW80ZjlpQktucHJ2anpjOTM5?=
 =?utf-8?B?ZEpIbS8rNWxSRjk4T3lSQkR5cW5DMzhhc1V5bkgyU2dScTZtVUlGTm1oWlJX?=
 =?utf-8?B?amllQWUvWUxQL2xrTllIOTBGbjFtdzdwc2dQcDdtb2tWZEZMUjh6amUrQVpX?=
 =?utf-8?B?ZVY0S0w2NFRzc3RRVnJTME1CcW9INEl3OW9hc3lMWlVldUVkNFdGWjkwVUYw?=
 =?utf-8?B?czRrc0VOcVI3QkhQa1kvc2hSZnRxL0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8caa5ecf-2433-4b3f-cffa-08db5d05d2fa
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:53:00.6476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3509
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 24, 2023 at 12:10:29PM -0700, Nick Desaulniers wrote:
> On Sun, May 14, 2023 at 3:19 AM Hu Weiwen <huww98@outlook.com> wrote:
> >
> > From: Hu Weiwen <sehuww@mail.scut.edu.cn>
> 
> Hi Hu,
> Sorry, for the delay. I'm usually faster to respond to patches. It was
> my mistake this fell through the cracks, and thank you for the patch.
> 
> I received this email from <huww98@outlook.com>. Do you mind resending
> with your signed off by tag set to the email address from which you
> are sending patches?  This patch looks benign to me, but it makes me a
> little uneasy when author != sender.
> 
> Please also cc
> - Masahiro Yamada <masahiroy@kernel.org>
> - linux-kbuild@vger.kernel.org
> 
> As this would go in via the kbuild tree.

OK, will resend.

> >
> > Currently, we only extract commands for targets end with '.o'. But we
> 
> s/end/ending/
> 
> 
> With this patch applies\d, I get the same word count for
> compile_commands.json when running:
> $ make LLVM=1 -j128 defconfig compile_commands.json
> 
> on my x86_64 host. Is that expected?  Is there a specific arch or set
> of configs for which such .c files produce executables directly?

`make compile_commands.json' will invoke this script as 
`gen_compile_commands.py ... vmlinux.a modules.order'. So only '.o'
targets are included.  To include .c files that produce executable, run
the script directly after a successful build:
$ python3 scripts/clang-tools/gen_compile_commands.py

Some examples of such file:
* scripts/unifdef.c
* scripts/asn1_compiler.c
* scripts/kallsyms.c
* scripts/basic/fixdep.c
* samples/connector/ucon.c

Thanks,
Hu Weiwen

> > also have many standalone executables built in-tree.
> >
> > Remove this restriction. And to avoid some false matching, exclude
> > targets end with '.c' or '.h' when directly walking the directory.
> >
> > Signed-off-by: Hu Weiwen <sehuww@mail.scut.edu.cn>
> > ---
> >  scripts/clang-tools/gen_compile_commands.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> > index 15ba56527acd..6e88c7e166fc 100755
> > --- a/scripts/clang-tools/gen_compile_commands.py
> > +++ b/scripts/clang-tools/gen_compile_commands.py
> > @@ -18,8 +18,8 @@ import sys
> >  _DEFAULT_OUTPUT = 'compile_commands.json'
> >  _DEFAULT_LOG_LEVEL = 'WARNING'
> >
> > -_FILENAME_PATTERN = r'^\..*\.cmd$'
> > -_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.c) *(;|$)'
> > +_FILENAME_PATTERN = r'^\..*(?<!\.(c|h))\.cmd$'
> > +_LINE_PATTERN = r'^savedcmd_[^ ]* := (.* )([^ ]*\.c) *(;|$)'
> >  _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
> >  # The tools/ directory adopts a different build system, and produces .cmd
> >  # files in a different format. Do not support it.
> > --
> > 2.25.1
> >
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
