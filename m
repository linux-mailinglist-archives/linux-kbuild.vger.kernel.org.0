Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C905E1839D4
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2020 20:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgCLTvf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Mar 2020 15:51:35 -0400
Received: from mail-eopbgr60056.outbound.protection.outlook.com ([40.107.6.56]:21920
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725268AbgCLTve (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Mar 2020 15:51:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4qYaAxFAJwTd7FUrQmX8FKYQhNxX8flMRWyROx6GQ4l3nTyixFoBhd9wa1MEp76KiOVPZEd/LWSLVfs/2Gw9G7ZldoptRAMsUsdBRFAwlCMaB2d1SZWNN29i8pV8lG5QBqL3/zUK/BbcvaZAvPKIPW/4Qmjuxf5rebwwXz0N76audwrJFbpme2aRm2LDwarMKXdUpsVYZbAmgf3WN8hsOaBeoo8kTtJry0ODVIufy67LwA2/yhmyD7NjqtIeNDjKyJ4m/QcoBL2T2sIh+U7AlkvpJ3GmUxJDdvRrJ1k6Dw84a/dsdYFNCJV32U9wFAd4V7PZSyyrMyjN5uFmyaQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEAxxL6nLlVHTXwa7jed1k7bXcgB4TlZiEKAQmgjB8U=;
 b=fh9FGh7u/KZbi7k1XRUVZ7CXwkEzck7To1mEziyUhnIk68axQ9j7u0xW0FqVNbJPwJLzBzI2K9aR3kRhEEk4KI83mnHDfY0UjqWwiunDlD/PnpgFLtwNgTzjenAA0Ytt3fLcelSii2P1iYNrnCP8wjMQy3wpGEvgUoZ5C2IyELHnsPWbB5xpiHv13DWIEX8OpzQ3hbOOsyZ/+tp4Pj7HhMaPyVUmvxzaZMa44waei9fcf/3Adbm2DJ9XbdGLt0N1L1KI1lTpnfvqX+tQQ+oXblBc/0qBgx2g/LqfJvnmSYyo3dH6d43WG0abvmmql+whKI8exVlGMmlaq8NceMC+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mir.dev; dmarc=pass action=none header.from=mir.dev; dkim=pass
 header.d=mir.dev; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astrosoftrus.onmicrosoft.com; s=selector2-astrosoftrus-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEAxxL6nLlVHTXwa7jed1k7bXcgB4TlZiEKAQmgjB8U=;
 b=KRSQG/DzewrMAX7EjK+x7Apxgz244Z6xom0/yyCQ5JCJ0a+zO2G2xQwLeNyfpfX167IdcI5QNvIIDbySG3p1pQ+q73hDWmTH4TlCQUhcrU9YTRWtkruBglTV9Wd8+Q9P5Z/H7Zyz8OhcLXLtR11PJnzLkLG8L/bMnXBS/JWlpnk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikhail.Petrov@mir.dev; 
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com (20.178.22.75) by
 AM0PR03MB4644.eurprd03.prod.outlook.com (20.177.41.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Thu, 12 Mar 2020 19:51:29 +0000
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e]) by AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 19:51:29 +0000
Subject: Re: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with
 CONFIG_KALLSYMS_BASE_RELATIVE
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev>
 <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
 <bd6dc9fb-3171-c12d-6d80-31a52eb9eb0a@mir.dev>
 <CAK7LNASOHOkBPFTKQH2jPc522E=bBJ2wtK8q1PVrqMVhMChghQ@mail.gmail.com>
 <87lfo6i2c0.fsf@mpe.ellerman.id.au>
From:   Mikhail Petrov <Mikhail.Petrov@mir.dev>
Message-ID: <39bb9377-2609-5f3b-2627-2c6408a71e3a@mir.dev>
Date:   Thu, 12 Mar 2020 22:51:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <87lfo6i2c0.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0401CA0047.eurprd04.prod.outlook.com
 (2603:10a6:3:19::15) To AM0PR03MB4881.eurprd03.prod.outlook.com
 (2603:10a6:208:100::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.103] (62.118.145.210) by HE1PR0401CA0047.eurprd04.prod.outlook.com (2603:10a6:3:19::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend Transport; Thu, 12 Mar 2020 19:51:28 +0000
X-Originating-IP: [62.118.145.210]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c5a85f4-b6bc-4ff1-3cf4-08d7c6bec1a9
X-MS-TrafficTypeDiagnostic: AM0PR03MB4644:
X-Microsoft-Antispam-PRVS: <AM0PR03MB46441866BC909E0A60BD94DA92FD0@AM0PR03MB4644.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39840400004)(366004)(199004)(66556008)(2616005)(16576012)(956004)(16526019)(2906002)(5660300002)(66946007)(186003)(31686004)(26005)(316002)(31696002)(66476007)(110136005)(53546011)(6666004)(86362001)(508600001)(81166006)(4326008)(36756003)(6486002)(52116002)(81156014)(8936002)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR03MB4644;H:AM0PR03MB4881.eurprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: mir.dev does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vk+7peZWNmJR+7E+zHVpiwwcdpDVMfdOxaNTDKvxqD4M+s/2GzSk8qVmI3T4tPiu7uMgeypdzvfMsLXIwaygHPq9nWtSrljbz4PRvtPi1k5V11qzsF0sLLZBlUfUh+8C0CB4PBowXf9DWGm7t7dyjM3a2IByj5QkJoG+xb1LsVqL0TsZQEqM0Se03MvaSeuEciHCb0Avz5jRTqBWd7cSN/P48Go4/MD4CiibZjTvXy2WOWf4uEZCUZQNs5P51W5mWnLJQQLY1FH54tU62JpHXe0g/fJe9+AwbNLFC0Rc4k7c2nEOSRKLrYFzIFe18Sk3k/swufv5o+aFYoaX1MTjNdMtAMLkkDg9/ZucwFNStpaCvtuB0MjKqr6hTLeNtVBYviTh1OFt/RH3c5RXkspC5RxNqlU/GLRaLhZjAbFnEEItR/jQZUaNZvS6LRFFauoG
X-MS-Exchange-AntiSpam-MessageData: aJZoSihAqpMh5/S+/QIm3QbpGI/Lerm3cYOcjS7knjMW3qWJvG7qaQZAn5mY6gVY5nzNnbbZq+JsqHNobWSKjphA6I7IW7qPv1xm8qsPDxIM9OCYBD0rxPePfvo8GPO90rpKLlPVSK0ZRrdkuE2Veg==
X-OriginatorOrg: mir.dev
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5a85f4-b6bc-4ff1-3cf4-08d7c6bec1a9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 19:51:29.2813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e87efa3-43e9-482d-a930-52632921709f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PML5YMyI24pLlrPh2Va9mw8wemU997c91ReDDzY060sTRXVj1qzuVZlp0OtgPfpWFCcVt6tod7SIV0EnHiNwn75NPFN0/ltKXdI50g5Jo9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4644
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Michael,

On 12.03.2020 8:12, Michael Ellerman wrote:
> Masahiro Yamada <masahiroy@kernel.org> writes:
>> On Thu, Mar 12, 2020 at 3:18 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>>> On 11.03.2020 9:06, Masahiro Yamada wrote:
>>>> On Wed, Mar 11, 2020 at 5:34 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>>>>>
>>>>> There is the code in the read_symbol function in 'scripts/kallsyms.c':
>>>>>
>>>>>         if (is_ignored_symbol(name, type))
>>>>>                 return NULL;
>>>>>
>>>>>         /* Ignore most absolute/undefined (?) symbols. */
>>>>>         if (strcmp(name, "_text") == 0)
>>>>>                 _text = addr;
>>>>>
>>>>> But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.
>>>>>
>>>>> It makes the wrong kallsyms_relative_base symbol as a result of the code:
>>>>>
>>>>>         if (base_relative) {
>>>>>                 output_label("kallsyms_relative_base");
>>>>>                 output_address(relative_base);
>>>>>                 printf("\n");
>>>>>         }
>>>>>
>>>>> Because the output_address function uses the _text variable.
>>>>>
>>>>> So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:
>>>>>
>>>>>         Call Trace:
>>>>>         [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
>>>>>         [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
>>>>>         [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
>>>>>         [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
>>>>>         [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
>>>>>
>>>>> The right stack trace:
>>>>>
>>>>>         Call Trace:
>>>>>         [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
>>>>>         [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
>>>>>         [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
>>>>>         [aa095f28] [80002ed0] kernel_init+0x14/0x124
>>>>>         [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
>>>>
>>>> Thanks for the patch.
>>>>
>>>> Just for curiosity, on which architecrure
>>>> did you see  name="_text" and type='a' case ?
>>>
>>> Actually 'a' is 'A' (my mistake). The architecture is PowerPC - core PPC476FS.
>>>
>>> nm -n .tmp_vmlinux1 looks like:
>>>
>>> ...
>>>          w kallsyms_token_table
>>>          w mach_powermac
>>> 00000007 a LG_CACHELINE_BYTES
>>> 00000007 a LG_CACHELINE_BYTES
>>> 00000007 a LG_CACHELINE_BYTES
>>> 00000020 a reg
>>> 0000007f a CACHELINE_MASK
>>> 0000007f a CACHELINE_MASK
>>> 0000007f a CACHELINE_MASK
>>> 00000080 a CACHELINE_BYTES
>>> 00000080 a CACHELINE_BYTES
>>> 00000080 a CACHELINE_BYTES
>>> 00000400 a dcr
>>> 80000000 T _start
>>> 80000000 A _stext
>>> 80000000 A _text
>>
>>
>> Hmm, I am still not able to reproduce this.
>>
>> I compiled ARCH=powerpc, but
>> 'powerpc-linux-nm -n .tmp_vmlinux1' got this.
>>
>>
>> 0000007f a CACHELINE_MASK
>> 0000007f a CACHELINE_MASK
>> 0000007f a CACHELINE_MASK
>> 00000080 a CACHELINE_BYTES
>> 00000080 a CACHELINE_BYTES
>> 00000080 a CACHELINE_BYTES
>> 00000400 a dcr
>> c0000000 T _start
>> c0000000 T _stext
>> c0000000 T _text
>> c00000b8 t interrupt_base
>> c00000c0 t CriticalInput
>> c00001a0 t MachineCheck
>> c0000280 t MachineCheckA
>>
>>
>> Which defconfig did you use?
>>
>>
>> (I also CCed the ppc maintainer,
>> I am just curious what makes _text absolute.)
> 
> I have no idea sorry.
> 
> arch/powerpc has about 20 sub-platforms that do weird and wonderful
> things. Presumably this happens on one of those.
> 
> I played around with some of the defconfigs but couldn't reproduce this.
> 
> The only config we have that puts the kernel at 0x80000000 is:
> 
>   $ git grep 80000000  arch/powerpc/configs/
>   arch/powerpc/configs/85xx/xes_mpc85xx_defconfig:CONFIG_PAGE_OFFSET=0x80000000
> 
> But that's not a PPC476 platform.

It is a custom config for a custom SoC. The config is not in the upstream repository. PAGE_OFFSET has been changed for increasing the address space for PCI windows and some devices.


> 
> And _text is not 'A':
> 
>   $ nm .tmp_vmlinux1 | grep -w _text
>   80000000 T _text

I used the old GCC version - 4.8.1. In modern versions of GCC, the record has type 'T'.

> 
> 
> cheers
> 

--
Best Regards
Mikhail Petrov

