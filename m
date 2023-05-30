Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7EEF715957
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 May 2023 11:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjE3JE4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 May 2023 05:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbjE3JEs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 May 2023 05:04:48 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2021.outbound.protection.outlook.com [40.92.98.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D07CD
        for <linux-kbuild@vger.kernel.org>; Tue, 30 May 2023 02:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iR8SI2TyRa5x1rhk5zfeUPGXUpwnwCu9XFxin0SFYC2fkAk//G6bTufoQgYH2dg6HhNfkIwE32pu8qRZZQM3ulyyMExHKK634jR9nLffNezPUjRxwsB55utyCwz4/qGC48NwT+NGft/dxksuyT+cUp61hJqLZqCvPyPHbO73tvu+o/re9sZAdTTxcMZrqZQe6RiXL5wUjbwv3G1SW3OP3sndo14IyESbvpmCgCoQ9SJUG2P/zjSvTgFdctfLiTKBQeEvJIW0APmSO0WTop8J3JG0tZHud3Hpd8HAMP0XOtRxQy87t3YyPqSC9ZkKiZqPQpSufX4qYbd1M+ZzOKwGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOGUqrctGZhDKefy2Wl5F+dCrMWvOeTjlYW2Ekx9Sdo=;
 b=A0ZMV39vqWX1xmCeR6d3lCqwzmQQQAJ5SxLT5aWxbjkzliAHz2tsaUl05Y5Hlrh5E3Es21SP7qNrxvOS72O6w8eyHNJsxI6hjnAIFU+5KEttIWhG5C3d5gC+cwTC59qAoAqc+IvDy0wY38XqD7UutbLTHuup8dbaJ1goEnTqm2ll7rvoggpihlRg3QfOpCYcY0tzVOzJizalLRaAqHkAx1hqZpGSupkqX+gS4Tisb9HpVamIlqVYSILQVtTb5W5OdCUPHTrLVwjAg3bQn4aksDCYv6K/X/nhIJxELorM+v/hAETLRBrV7MSjMoejW0ybH40IWd2PZDACj19xR4YEOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOGUqrctGZhDKefy2Wl5F+dCrMWvOeTjlYW2Ekx9Sdo=;
 b=LYB+RarHHWYRGxEVs1mFhIe0rZxceJ/G9npCgZD8mWkM97VUC2R9jZU3InIJdls6/7RL0NmHRMcRWJFZRw6yrYWYu9ijqyBxvBvRkiLzQeHriy5m2pd8H+B5fs4bnm4dRRXZeSZ2TB5aNE4vVALfhDbuY+wfJND/M4B7vSuxdJkl7VOuxpU2pfE4wd2NpN76txG9Mk5PjCDnMdGKfN/ouRrFTckVeZUCoG0GCPbuNpuUX0gnJYx7Lp1stiTCYTVC6Jy0lXOpIgW6aCWB9Vh9tuNn+Ar7ItBsdHaFX6WQPSSWTd9Ch262zy+r4tb0fQU+Qzzd/zxtD4dWjQAkxuELXw==
Received: from TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::14)
 by OS3P286MB2539.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:04:43 +0000
Received: from TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d9fd:1e8f:2bf4:e44]) by TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d9fd:1e8f:2bf4:e44%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:04:42 +0000
Date:   Tue, 30 May 2023 17:04:34 +0800
From:   =?utf-8?B?6IOh546u5paH?= <huww98@outlook.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2] gen_compile_commands: include targets not ending with
 .o
Message-ID: <TYCP286MB2066563135B12E064AA59976C04B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
 <OSZP286MB20611C35BF36F4EB69FD3DF6C0469@OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM>
 <CAK7LNATz8xDmf5SuApGnrbkxvWPJNG1HTuQSrw2v_Ox5sXQO2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATz8xDmf5SuApGnrbkxvWPJNG1HTuQSrw2v_Ox5sXQO2A@mail.gmail.com>
X-TMN:  [8Wrp9o0ZpBkzRq038aliWObrTUiOlSmS]
X-ClientProxiedBy: SJ0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::20) To TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::14)
X-Microsoft-Original-Message-ID: <ZHW8Inu3JOnEgeW3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2066:EE_|OS3P286MB2539:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bfd797-9e81-4b69-dbf2-08db60ece7a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S62FtHwUGhst1USQuuPjRLm4Y/jr/dNZmQ+NEZSD4Dw8KqrPv2a3Gv/QDlVpDYmF7uTJ6kgSknzUYFuwrPRGxkEzKSSkQ5L/8/qZb0lQA3q0hosU9S0ZZ5FR0jwPAW5/2ShoEt4wU7GtrCATsuFdfSUy2rFZUv1ehHCxABjpt4iV0HcMssU3CO0wH6Wmol580n2n3F07wCtCD5yLa4FpKm/AeK9FXw9JOqZCqzEL9S2+lVJ+ngVBhlfXVJdyG32SsPYYujSdC64s59bCHAyHZHWDh2c0K0UctppLUh7DCthZyFSjkIqSabqPfO8+GwLDhKZMYt+YiMYnXB6/jHAoG4drR+JsPktKU+F8jWgWTJRFRGoIAXVqbN7jPWO/BPjNofO4YMHpswDWQbrcM3JuxzL9xhcOoJpgja18BGmgLWCEvWdixt0ieXFokHS3dmlvmz3hXB5YK5NXFG7FAfacJSgD598xNkSCdu0RXg60XgIPyH+oFCtBVqRnYPeDkxQrQkNsRZ2lYAWDX3ozI5Rx1yuZQkbKKdk6uL+L0z0duBPOrQFgbAST6N7Y/IHgVaG/ENNhO1b9rmx+bQ7RGKpBuonHJIXNiUOSTVi3ItKiZoETwE0aEDrTHod6gx99PNr0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUovK1pQeXJVM0JmQTA0R2hQaG1EbE5xTVdQaDkrQXZPbGk1N3drMGJ1U25B?=
 =?utf-8?B?ay8wa2JTYWx6MlBCSU5YTmRSSHQ1UG5EbUtKTjhWRjVyVFNtdDY1N3AyMFI0?=
 =?utf-8?B?N2pobThnd3pYV1NRaUNZc2libGl0cURoNFNYeklTTzRscW1aNTJwd1ViaTVy?=
 =?utf-8?B?c283RUd5cDJWWE1SQ0l2QnhlVzhpZElVNXNtUWE5RkVVNnJDNDViNmE0WEhX?=
 =?utf-8?B?YVFzTlhva3VvZ1k1WS9EcTN0YXIyaitnK3hyTTcrN24rbXR0QU5SdUpOL2kx?=
 =?utf-8?B?U0ZJK01LYkxSNlE0NHV3VTBWTld1cENaaHNlUHVUaXN6amZsR0xQRjRObVFq?=
 =?utf-8?B?Vk9DS05oNERCeG5CQkEvYS8wV3NNVUhXVnNNU05wMHg2T1dyVU0yby9CckxL?=
 =?utf-8?B?aCt1ak1aYkNTZDhySGw1Z2hrSDNuZXIyUks1MitjTUJjbWxNVytMVFNPK1Av?=
 =?utf-8?B?MHQ3ME9aSnVuRDNvdmM4SDc5MW9ieHNDQVBQNHQyTDA5VGYwRm5jakpveDdR?=
 =?utf-8?B?K3dPWi9WNVRUYXFESUV2OHNrbWJ5Uy9YZFA5bG9JcTI2ZzAweUpmTWVRbmNB?=
 =?utf-8?B?T3E3UGNNL1g1b25hL0trS3dtNU5IbnV3d25yOUlobjVXVVVuT2NRcC81QzR1?=
 =?utf-8?B?bTFGVEgyaGNMS3dpWEl3VjBPaVc4anJJOUkyNlNOTWZwN3hHOUkyUXZ5NkZJ?=
 =?utf-8?B?ek9ueEx3bUxVQWNZaTFwY25RM3VkRWwzNjVFcll5aWhWMjF5OVBRaEp6bXNr?=
 =?utf-8?B?b1ZGL2pjUG44bGc4dTZsajdheVpEbmVHWi9DeElHQnE2TWFQQVNLZnNUazlY?=
 =?utf-8?B?QWhoNHM0MFBTVFVQVTZpMmRMNERjOXA4QzVTbGswOEs0WUZJaUtyY1N6THRr?=
 =?utf-8?B?NXZKS1Bjdkc4SXEyNFpmaUJzejZPVDNmaTV1MWcvWDhVaC9vamlyYTVBL2Mx?=
 =?utf-8?B?VjdaZytkYnNuS3p6UHcxMVAvRHBMMm02S2tRL1JQUFd5dFZTTmhTSWlHR04v?=
 =?utf-8?B?ZzNKbmtZUTN2T3hRYmZZUVRsZ0dKRkhJZWk4clJqRFJKaU9Vdno0TW8rbXFs?=
 =?utf-8?B?Ui9UcFRncFFEYVN6TkRsbm9DQ0UwaVdNRDJrbmZPUkNVYjZYaTF3REZaTVp1?=
 =?utf-8?B?QU03RmFNWUNuUUZROSs0QnI0MEhWaGJyVmg2WEZmWjhGMEJQc01jbitKem9F?=
 =?utf-8?B?ZCt2clNzNVZjZE02T2M3Y1IvVXIrMjJxbHA3RzFuWVFSUXlmTFJXR09sYVVL?=
 =?utf-8?B?a21JbmFqLy9ZU3dncjR2TFFCNHFkNGUvays3LzltOWVKSDNtVHU4WkU0TmFt?=
 =?utf-8?B?TnVsY1lMdGFWS1A3cFRaOHZZUzFlV0ExMDBuS2VkZk9YZC9ya2NJZ2kvUzJU?=
 =?utf-8?B?WVI2eUdhT0FNOHR6QmkrZmtCQTA0ZlBoTCs1eTgxUFMzbHlFQ3ozRWFRM0hQ?=
 =?utf-8?B?L3VpS3N4MmhBRGdsWnF2RG5jTDBVMUo3SC9RMHU5eCtRWjR1Yi9DNCtOUCtl?=
 =?utf-8?B?UkM0REJEdlBlTHJxOGRoVjR3OFFoMTZ1THdvOFE1REUyRkdLYVhPaFpsTUxX?=
 =?utf-8?B?ZU01Qk1xazBGQVlQV2ZQWHh4ZVdqdkdiaDRQbjY0L1BUVU9sbEZ3QklIdGlT?=
 =?utf-8?B?c2NGNldNLzZCUzBHK2hmOHNVQU1mZ2c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bfd797-9e81-4b69-dbf2-08db60ece7a6
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:04:42.9641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2539
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 29, 2023 at 07:13:46PM +0900, Masahiro Yamada wrote:
> On Thu, May 25, 2023 at 9:21 PM Hu Weiwen <huww98@outlook.com> wrote:
> >
> > Currently, we only extract commands for targets ending with '.o'. But we
> > also have many standalone executables built in-tree.
> >
> > Remove this restriction. And to avoid some false matching, exclude
> > targets end with '.c' or '.h' when directly walking the directory.
> 
> 
> Can you give me some examples of false matching?

Examples:
- drivers/scsi/scsi_devinfo_tbl.c: generated by
  sed -n 's/.*define *BLIST_\\([A-Z0-9_]*\\) *.*/BLIST_FLAG_NAME(\\1),/p' include/scsi/scsi_devinfo.h > drivers/scsi/scsi_devinfo_tbl.c

- arch/x86/entry/vdso/vdso-image-32.c: generated by
  arch/x86/entry/vdso/vdso2c arch/x86/entry/vdso/vdso32.so.dbg arch/x86/entry/vdso/vdso32.so arch/x86/entry/vdso/vdso-image-32.c

I think only .c file targets would have false matching, because the cmd
must ends with '.c' to be matched.

> 
> Also, this patch would pick up *.i, *.s, *.lst, etc.
> 
> Does it make sense to parse cmd files for those?
> I guess the answer is no.

We are already parsing cmd files for those before this patch. I use more
strict `_FILENAME_PATTERN'. But it may be hard to exclude all of these
by filename.

Should we use a more strict `_LINE_PATTERN'? e.g., require the cmd to
begin with a compiler, not `sed' or something else. But we don't know
the compiler name, adding a parameter for compiler name may break the
existing usage.

> >
> > To really generate compile_commands.json that includes such target, call
> > this script directly with no arguments.  `make compile_commands.json`
> > will not include them.
> >
> > Signed-off-by: Hu Weiwen <huww98@outlook.com>
> > ---
> > Since V1: Only commit message is updated.
> >
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
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
