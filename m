Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26C6A18399B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2020 20:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgCLTgy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Mar 2020 15:36:54 -0400
Received: from mail-vi1eur05on2060.outbound.protection.outlook.com ([40.107.21.60]:13499
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726523AbgCLTgy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Mar 2020 15:36:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFMy2mD1zV7sozLvNudZ4W3WppKirDDtX0QdmiUf7arHOOY3s9aR8M4OtR5tEHOwQvEfuRv4OeesgMaEoSSl9Iog+lTTM7OVxwoEFcUokPwLSsTtbYp6T+WmXc3l+eWGQqWhBaZcnIee3APi8A5Fp0LkA/FCMC63fPOeJmVF+FttNQSS6A1nPwpsltGLDd+/3rDHn+jh0wASNx18mINRFNv0+S6YLvrFfiLZXM02YnPGZCQ3uON6sRL5PV89TTV5FTvrq6zK7fCu40BoQB0ozNRqL1tj6K6KpK5n4P9rj07d5mcLLWxjV2UfV6qz46vbMnR38E9UeR3N8FoaKn4jdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6poLu+k5G/7Ngi3FMEpZ+n00aInkkxoSqaE14DwV9M=;
 b=C+nUgS9OceCxdh69RnQzQZrzMAtEzZZxMyYfKHbzUaztVvK7Gul86T86ZADfgLLKEuxX7I6MBL8YZxRxhLVB4K6WsrxkrDe+6JSxyjxq1Wp3yf9Klr5gqEHa+425BVVvghs7VX4ZLi0CwQV7FdXR/FT966q7YJ8F2fY/bge4riKpNhVvHUOFeassZIg1bnZ/amSHFQc7krcWNuLHxvIaLFk7it4GN8tpM3Gv6UVoAtm0Y287S5HhpV0GsxLyJu3dUDIsFz1hG777GcjUn369SCE4+FCDZ/Sbq4O38ET+q2xNwHFAhrrPRzSknen7D1HLmJ2oPHGtYXUpRmEniQX92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mir.dev; dmarc=pass action=none header.from=mir.dev; dkim=pass
 header.d=mir.dev; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astrosoftrus.onmicrosoft.com; s=selector2-astrosoftrus-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6poLu+k5G/7Ngi3FMEpZ+n00aInkkxoSqaE14DwV9M=;
 b=bDUvuj0rCRRGmtn7A9EX+TLuSo6Q6+hBvBozaot6K/krT+V4cFNA6WK3scr1qhWbc1j0hCQNWPTPiChSnWam2K96aeVPWUlS+ejPCgWFu0UF/ibdqQLSJwiOOnjLWwcJZ+y4BTIg0u2TPyEDeFzgXfJewvnY2evkbpif0ZDWe0I=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikhail.Petrov@mir.dev; 
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com (20.178.22.75) by
 AM0PR03MB4596.eurprd03.prod.outlook.com (20.176.215.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Thu, 12 Mar 2020 19:36:49 +0000
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e]) by AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 19:36:49 +0000
Subject: Re: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with
 CONFIG_KALLSYMS_BASE_RELATIVE
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev>
 <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
 <bd6dc9fb-3171-c12d-6d80-31a52eb9eb0a@mir.dev>
 <CAK7LNASOHOkBPFTKQH2jPc522E=bBJ2wtK8q1PVrqMVhMChghQ@mail.gmail.com>
From:   Mikhail Petrov <Mikhail.Petrov@mir.dev>
Message-ID: <a4e69e0c-284c-8599-71ed-e20e6a25fcf7@mir.dev>
Date:   Thu, 12 Mar 2020 22:36:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <CAK7LNASOHOkBPFTKQH2jPc522E=bBJ2wtK8q1PVrqMVhMChghQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR02CA0091.eurprd02.prod.outlook.com
 (2603:10a6:7:29::20) To AM0PR03MB4881.eurprd03.prod.outlook.com
 (2603:10a6:208:100::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.103] (62.118.145.210) by HE1PR02CA0091.eurprd02.prod.outlook.com (2603:10a6:7:29::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17 via Frontend Transport; Thu, 12 Mar 2020 19:36:48 +0000
X-Originating-IP: [62.118.145.210]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2766f691-18f9-4d34-8da5-08d7c6bcb516
X-MS-TrafficTypeDiagnostic: AM0PR03MB4596:
X-Microsoft-Antispam-PRVS: <AM0PR03MB45967BDF606CF6A9FCE98D4292FD0@AM0PR03MB4596.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39840400004)(396003)(366004)(346002)(136003)(199004)(6666004)(53546011)(31686004)(86362001)(508600001)(31696002)(66476007)(66556008)(6486002)(66946007)(5660300002)(316002)(16576012)(52116002)(81156014)(26005)(2906002)(8676002)(956004)(54906003)(36756003)(81166006)(8936002)(4326008)(186003)(6916009)(2616005)(16526019);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR03MB4596;H:AM0PR03MB4881.eurprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: mir.dev does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDBu8namASLoM/ro8eHaI8DQA/bIWBbQfT1+m5zqNHcFuS9uoDTfJ1e7S7avNCy77GD18v3Ulgqfl8r9F75mp8cCj1CYDPOzxNrLLKZJaqI/sq+S+jLER/UutJrU6NgM9BwJTxrv3RGEIdEgDD5dSjtDCsmrA9wkDLaP7Jd+U7F5Q13jCdf2pSje2yyYCJ9IrLLrzoPoLrGZsbr226Y+bHw4jqFNbp6zbASMFFRsN8/nh4ZhgYHJFOzsR7Wzmt/oTWYeGSe8rQZEqd27A66pqdHRMUxyAlNc5jdLO1HrNPxEpqm/iBw0MYRgYNMHzLKKC7RMt8DMmqcJ/CZ6FJLoNO3up36pmTTL1I9/BB0G+4hsBKE2MuiPJtDm3GgC5p1/VsyTIns85qpjz7VtvhnZE/RO5iI71imJUeg7yqrWya32Dp+KvV1KuuAgl+ZfDGV0
X-MS-Exchange-AntiSpam-MessageData: ylBYPUSAnzQZC0hy77A4VB3gJjcTWODBGOfhJvUcxSoykxrzfO/2qpuzlegtZaZB+mdQDyJ7BnzpiEeuYISxti5CYUoVGezHjFBsubS+qqBfTIqujr8Cr5EQPH1jmfOXdnfDE8J982/726JwmzSq0A==
X-OriginatorOrg: mir.dev
X-MS-Exchange-CrossTenant-Network-Message-Id: 2766f691-18f9-4d34-8da5-08d7c6bcb516
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 19:36:49.2508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e87efa3-43e9-482d-a930-52632921709f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmLBXgDvXasohfbSkNmOxQIOAdN4dVPY7Z3ss3hy4pmJDwVbUg7STkwIGAtojwYQydC2qD9akVDJp39bxKq3Wji+7eJPEnX5ADCeuC7uf+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4596
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 11.03.2020 23:56, Masahiro Yamada wrote:
> On Thu, Mar 12, 2020 at 3:18 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>>
>> Hi Masahiro,
>>
>> On 11.03.2020 9:06, Masahiro Yamada wrote:
>>> Hi Mikhail,
>>>
>>> On Wed, Mar 11, 2020 at 5:34 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>>>>
>>>> There is the code in the read_symbol function in 'scripts/kallsyms.c':
>>>>
>>>>         if (is_ignored_symbol(name, type))
>>>>                 return NULL;
>>>>
>>>>         /* Ignore most absolute/undefined (?) symbols. */
>>>>         if (strcmp(name, "_text") == 0)
>>>>                 _text = addr;
>>>>
>>>> But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.
>>>>
>>>> It makes the wrong kallsyms_relative_base symbol as a result of the code:
>>>>
>>>>         if (base_relative) {
>>>>                 output_label("kallsyms_relative_base");
>>>>                 output_address(relative_base);
>>>>                 printf("\n");
>>>>         }
>>>>
>>>> Because the output_address function uses the _text variable.
>>>>
>>>> So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:
>>>>
>>>>         Call Trace:
>>>>         [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
>>>>         [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
>>>>         [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
>>>>         [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
>>>>         [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
>>>>
>>>> The right stack trace:
>>>>
>>>>         Call Trace:
>>>>         [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
>>>>         [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
>>>>         [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
>>>>         [aa095f28] [80002ed0] kernel_init+0x14/0x124
>>>>         [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
>>>>
>>>> Signed-off-by: Mikhail Petrov <Mikhail.Petrov@mir.dev>
>>>>
>>>> ---
>>>
>>>
>>> Thanks for the patch.
>>>
>>> Just for curiosity, on which architecrure
>>> did you see  name="_text" and type='a' case ?
>>
>> Actually 'a' is 'A' (my mistake). The architecture is PowerPC - core PPC476FS.
>>
>> nm -n .tmp_vmlinux1 looks like:
>>
>> ...
>>          w kallsyms_token_table
>>          w mach_powermac
>> 00000007 a LG_CACHELINE_BYTES
>> 00000007 a LG_CACHELINE_BYTES
>> 00000007 a LG_CACHELINE_BYTES
>> 00000020 a reg
>> 0000007f a CACHELINE_MASK
>> 0000007f a CACHELINE_MASK
>> 0000007f a CACHELINE_MASK
>> 00000080 a CACHELINE_BYTES
>> 00000080 a CACHELINE_BYTES
>> 00000080 a CACHELINE_BYTES
>> 00000400 a dcr
>> 80000000 T _start
>> 80000000 A _stext
>> 80000000 A _text
> 
> 
> Hmm, I am still not able to reproduce this.
> 
> I compiled ARCH=powerpc, but
> 'powerpc-linux-nm -n .tmp_vmlinux1' got this.
> 
> 
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000400 a dcr
> c0000000 T _start
> c0000000 T _stext
> c0000000 T _text
> c00000b8 t interrupt_base
> c00000c0 t CriticalInput
> c00001a0 t MachineCheck
> c0000280 t MachineCheckA
> 
> 
> 
> 
> Which defconfig did you use?

I use a custom config file for a custom SoC with two PPC476FS cores. The config is not in the upstream repository. The same effect can be reached with '44x/akebono_defconfig'.

I did some investigation with the GCC version.

GCC version  4.8.1 (akebono_defconfig):

00000007 a LG_CACHELINE_BYTES
00000020 a reg
0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000400 a dcr
00000400 a spr
c0000000 T _start
c0000000 A _stext
c0000000 A _text
c0000088 t interrupt_base
c00000a0 t CriticalInput
c0000180 t MachineCheck

GCC version 7.5.0 (akebono_defconfig):

00000007 a LG_CACHELINE_BYTES
00000020 a reg
0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000400 a dcr
00000400 a spr
c0000000 T _start
c0000000 T _stext
c0000000 T _text
c0000088 t interrupt_base
c00000a0 t CriticalInput
c0000180 t MachineCheck

So, I used an old version of GCC. Changing the GCC version solved the problem. Maybe the patch is not necessary.


> 
> 
> (I also CCed the ppc maintainer,
> I am just curious what makes _text absolute.)
> 
> 
> 
> 
> 
> 
> 
>> 80000088 t interrupt_base
>> 800000a0 t CriticalInput
>> 80000180 t MachineCheck
>> 80000260 t MachineCheckA
>> 80000360 t DataStorage
>> 80000420 t InstructionStorage
>> 80000500 t ExternalInput
>> 800005c0 t Alignment
>> 80000680 t Program
>> 80000740 t FloatingPointUnavailable
>> 80000820 t SystemCall
>> 80000900 t AuxillaryProcessorUnavailable
>> ...
>>
>>
>>> Could you wrap the commit log to avoid
>>> this checkpatch warning?
>>> WARNING: Possible unwrapped commit description (prefer a maximum 75
>>> chars per line)
>>>
>>> Also, could you shorten the patch subject
>>> to make it fit in this limit?
>>
>> Sorry for that. Now I know about scripts/checkpatch.pl. I will improve and resubmit the patch soon.
>>
>> Thanks.
> 
> 
> --
> Best Regards
> Masahiro Yamada
> 

--
Best Regards,
Mikhail Petrov

