Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3A5182097
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2020 19:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730777AbgCKSSt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Mar 2020 14:18:49 -0400
Received: from mail-db8eur05on2053.outbound.protection.outlook.com ([40.107.20.53]:6068
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730677AbgCKSSt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 14:18:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfxsiFWDylL0RptgiTRYY2B63MJIwscV3He4fGF8Xjzbz9G9LUNtokLpd7uMoitu/9Qog+SCM4MTawhPeibVCo14E5qrrgxmypmVU599NSSxncYiSX+dO3umt0a8W9n2KffPqsuPdouK4oHWaUQYWbmd2XZJ4kNk6HYVIIjfs0o02pK/X+kkl+NqCC1cpwBn02Z1Lg3y/kNpezAmTWk/zrPWCQgS3kkRzHT14iaB+J+dCoDmIKFgA+JcblVdgEryjCwq8loseQPW5TE/4ULj2EwUrdE1Jp0M6sfq6cTi8iDT3DBpE+v6csBUV2tV2kCEySqHxpR9or95BSGCiW++Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUo+UMMc8USAjPkSyIhsXDviunZG/oq1c4adt4scomA=;
 b=AdH3Lnbhii9qEQp3s4se8+wWucPBbcD5WH3XI1h44Hswj/iB0MALmy34fA3MNg05vPH/eLXJgRZ1QwFxhf7oX7g2lAASk3WMyzh0PBTjBBJQ8iF08HCSrh1wA8yHQJqW0ugHnXiWU5IK9cAPG2322+hU20rzkYUTDMU5QmOb12ALqxcy3g6dmgOtTMuCshbDmDgOTx3sC/RR7xc+oTcavns1Pag730HkoDP4bN+ubGb8lCWAxL8iH5R6WUps5anIZQZ6eklDRwjxYqYvT8taswTT3teUaWQOduWkHqwMDeByXms7S2skuqGM9hNYn8GUI42OAu3ceHL1UkhvEJlLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mir.dev; dmarc=pass action=none header.from=mir.dev; dkim=pass
 header.d=mir.dev; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astrosoftrus.onmicrosoft.com; s=selector2-astrosoftrus-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUo+UMMc8USAjPkSyIhsXDviunZG/oq1c4adt4scomA=;
 b=CxvDJHo6WlqySRzbIwyjxWr2pJlg/xB42HJJubhFgbrvTizL9TXqnJowmHXFVdoxivmLCM1qr88Z8JWI/9ERjS/UU6Dt6wXzTmgCrn43CuSXonVzSSX0Qr8+jW707Vegu9w6R0w76DLBbZlDTexBDXr3gmqiWVH/ix5gebImiN4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikhail.Petrov@mir.dev; 
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com (20.178.22.75) by
 AM0PR03MB5620.eurprd03.prod.outlook.com (20.179.254.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15; Wed, 11 Mar 2020 18:18:46 +0000
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e]) by AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 18:18:45 +0000
Subject: Re: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with
 CONFIG_KALLSYMS_BASE_RELATIVE
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev>
 <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
From:   Mikhail Petrov <Mikhail.Petrov@mir.dev>
Message-ID: <bd6dc9fb-3171-c12d-6d80-31a52eb9eb0a@mir.dev>
Date:   Wed, 11 Mar 2020 21:18:40 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::18) To AM0PR03MB4881.eurprd03.prod.outlook.com
 (2603:10a6:208:100::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.103] (62.118.145.210) by HE1PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:3:e5::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend Transport; Wed, 11 Mar 2020 18:18:45 +0000
X-Originating-IP: [62.118.145.210]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f555230-389c-4c20-2a6e-08d7c5e8a319
X-MS-TrafficTypeDiagnostic: AM0PR03MB5620:
X-Microsoft-Antispam-PRVS: <AM0PR03MB5620B3E4A1E96DD133BE487092FC0@AM0PR03MB5620.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(199004)(81166006)(8676002)(86362001)(81156014)(53546011)(6666004)(16576012)(8936002)(316002)(31696002)(2906002)(186003)(16526019)(6486002)(36756003)(52116002)(6916009)(956004)(31686004)(26005)(508600001)(2616005)(66556008)(4326008)(66476007)(66946007)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR03MB5620;H:AM0PR03MB4881.eurprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: mir.dev does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CgK/+vQa6Z+M84p4s5dpD1MvOfBbQGpioUxS34fSgGDAG/mc+VNC82fiQWQnBWHW8FvX9BYYVl/s0NQg52Rci4wRP4Eudetoq6eS2i4hnUSRREwNo46zk8bshAIGNivZFDLG/2JqeI3FFrlB8iZSg1QLYunqYsrnN1KKaz6gV517gsK1p9FhmVRoXipV5muCflZUn0JqdH1q/u01x2Xg7nUA8Web3VUD1c9IisPEBBYE8X7t7q9FBrR3/VCwl5+qwWX/b2d7wKO53JoonKcucH/Z1y/57Bo9lGtIXhMONP9DHh9BPqmYWRlsr+K2aTMx56EtR3b/dM2u0RhVqsjnfFt0OHvwMhjdCgV2c70aUie377nsPYfKrHf/B8N5mcjp1ydo7XRNNZb8ocRUp6C6tfKAWzca3WW9Nfn90BMj5kNbzK79d6J3u2jul8khwo14
X-MS-Exchange-AntiSpam-MessageData: 9LqIGmCCg+MizdWlQKFdtGKkXtg/X9Sl6FRzAZ5ZabBmiBxGre9XYdeiLbmNrZZTPb2xKA674L0z7quZ7zYxyCp0KYasR0sQ/3HmJ2qxPIpaPUuhJg1IjmUMbqd8iLCvFY44anejzZ1p+8kr4cAnag==
X-OriginatorOrg: mir.dev
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f555230-389c-4c20-2a6e-08d7c5e8a319
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 18:18:45.7133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e87efa3-43e9-482d-a930-52632921709f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FnWhWmEZ1GijuZeQ1+JFzkWHDoKfFwMZYEyuz16bC3WNSVzIlDU2wQHSDvEbX3h8B2ZX0KIYDS+LnM1g+xGaIPVQqiTF2V14YeFPhVn+5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5620
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On 11.03.2020 9:06, Masahiro Yamada wrote:
> Hi Mikhail,
> 
> On Wed, Mar 11, 2020 at 5:34 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>>
>> There is the code in the read_symbol function in 'scripts/kallsyms.c':
>>
>>         if (is_ignored_symbol(name, type))
>>                 return NULL;
>>
>>         /* Ignore most absolute/undefined (?) symbols. */
>>         if (strcmp(name, "_text") == 0)
>>                 _text = addr;
>>
>> But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.
>>
>> It makes the wrong kallsyms_relative_base symbol as a result of the code:
>>
>>         if (base_relative) {
>>                 output_label("kallsyms_relative_base");
>>                 output_address(relative_base);
>>                 printf("\n");
>>         }
>>
>> Because the output_address function uses the _text variable.
>>
>> So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:
>>
>>         Call Trace:
>>         [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
>>         [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
>>         [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
>>         [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
>>         [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
>>
>> The right stack trace:
>>
>>         Call Trace:
>>         [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
>>         [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
>>         [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
>>         [aa095f28] [80002ed0] kernel_init+0x14/0x124
>>         [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
>>
>> Signed-off-by: Mikhail Petrov <Mikhail.Petrov@mir.dev>
>>
>> ---
> 
> 
> Thanks for the patch.
> 
> Just for curiosity, on which architecrure
> did you see  name="_text" and type='a' case ?

Actually 'a' is 'A' (my mistake). The architecture is PowerPC - core PPC476FS.

nm -n .tmp_vmlinux1 looks like:

...
         w kallsyms_token_table
         w mach_powermac
00000007 a LG_CACHELINE_BYTES
00000007 a LG_CACHELINE_BYTES
00000007 a LG_CACHELINE_BYTES
00000020 a reg
0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000400 a dcr
80000000 T _start
80000000 A _stext
80000000 A _text
80000088 t interrupt_base
800000a0 t CriticalInput
80000180 t MachineCheck
80000260 t MachineCheckA
80000360 t DataStorage
80000420 t InstructionStorage
80000500 t ExternalInput
800005c0 t Alignment
80000680 t Program
80000740 t FloatingPointUnavailable
80000820 t SystemCall
80000900 t AuxillaryProcessorUnavailable
...

 
> Could you wrap the commit log to avoid
> this checkpatch warning?
> WARNING: Possible unwrapped commit description (prefer a maximum 75
> chars per line)
> 
> Also, could you shorten the patch subject
> to make it fit in this limit?

Sorry for that. Now I know about scripts/checkpatch.pl. I will improve and resubmit the patch soon.

Thanks.
