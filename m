Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6539817A56D
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2020 13:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgCEMlV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Thu, 5 Mar 2020 07:41:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52056 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725993AbgCEMlV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Mar 2020 07:41:21 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 025CbK2C116813
        for <linux-kbuild@vger.kernel.org>; Thu, 5 Mar 2020 07:41:19 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2yfknd3quw-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2020 07:41:18 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <naveen.n.rao@linux.ibm.com>;
        Thu, 5 Mar 2020 12:41:13 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 5 Mar 2020 12:41:10 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 025Cf9I551576978
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 5 Mar 2020 12:41:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E2949A4067;
        Thu,  5 Mar 2020 12:41:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 25C51A4054;
        Thu,  5 Mar 2020 12:41:08 +0000 (GMT)
Received: from localhost (unknown [9.199.53.44])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu,  5 Mar 2020 12:41:07 +0000 (GMT)
Date:   Thu, 05 Mar 2020 18:11:06 +0530
From:   "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: eh_frame confusion
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
        <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
        <877e01spfa.fsf@mpe.ellerman.id.au>
In-Reply-To: <877e01spfa.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421
 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-TM-AS-GCONF: 00
x-cbid: 20030512-4275-0000-0000-000003A8A160
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030512-4276-0000-0000-000038BDB137
Message-Id: <1583411741.zbaz5p86qy.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-05_03:2020-03-05,2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050081
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>> Rasmus Villemoes wrote:
>>> I'm building a ppc32 kernel, and noticed that after upgrading from gcc-7
>>> to gcc-8 all object files now end up having .eh_frame section. For
>>> vmlinux, that's not a problem, because they all get discarded in
>>> arch/powerpc/kernel/vmlinux.lds.S . However, they stick around in
>>> modules, which doesn't seem to be useful - given that everything worked
>>> just fine with gcc-7, and I don't see anything in the module loader that
>>> handles .eh_frame.
>>> 
>>> The reason I care is that my target has a rather tight rootfs budget,
>>> and the .eh_frame section seem to occupy 10-30% of the file size
>>> (obviously very depending on the particular module).
>>> 
>>> Comparing the .foo.o.cmd files, I don't see change in options that might
>>> explain this (there's a bunch of new -Wno-*, and the -mspe=no spelling
>>> is apparently no longer supported in gcc-8). Both before and after, there's
>>> 
>>> -fno-dwarf2-cfi-asm
>>> 
>>> about which gcc's documentation says
>>> 
>>> '-fno-dwarf2-cfi-asm'
>>>      Emit DWARF unwind info as compiler generated '.eh_frame' section
>>>      instead of using GAS '.cfi_*' directives.
>>> 
>>> Looking into where that comes from got me even more confused, because
>>> both arm and unicore32 say
>>> 
>>> # Never generate .eh_frame
>>> KBUILD_CFLAGS           += $(call cc-option,-fno-dwarf2-cfi-asm)
>>> 
>>> while the ppc32 case at hand says
>>> 
>>> # FIXME: the module load should be taught about the additional relocs
>>> # generated by this.
>>> # revert to pre-gcc-4.4 behaviour of .eh_frame
>>
>> Michael opened a task to look into this recently and I had spent some 
>> time last week on this. The original commit/discussion adding 
>> -fno-dwarf2-cfi-asm refers to R_PPC64_REL32 relocations not being 
>> handled by our module loader:
>> http://lkml.kernel.org/r/20090224065112.GA6690@bombadil.infradead.org
> 
> I opened that issue purely based on noticing the wart in the Makefile,
> not because I'd actually tested it.
> 
>> However, that is now handled thanks to commit 9f751b82b491d:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f751b82b491d
> 
> Haha, written by me, what an idiot.
> 
> So the Makefile hack can presumably be dropped, because the module
> loader can handle the relocations.
> 
> And then maybe we also want to turn off the unwind tables, but that
> would be a separate patch.
> 
>> I did a test build and a simple module loaded fine, so I think 
>> -fno-dwarf2-cfi-asm is not required anymore, unless Michael has seen 
>> some breakages with it. Michael?
> 
> No, as I said above it was just reading the Makefile.

Ok, thanks for clarifying. To test, I did 'allmodconfig' builds across 
three environments:
- gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008 -- ppc64le
- gcc (SUSE Linux) 7.5.0 -- ppc64le
- gcc (GCC) 8.2.1 20181215 (Red Hat 8.2.1-6) -- ppc64 (BE)

Then, used the below command to list all relocations in the modules:
$ find . -name '*.ko' | xargs -n 1 readelf -Wr  | grep -v "Relocation " | grep -v "Offset " | cut -d' ' -f4 | sort | uniq

R_PPC64_ADDR32
R_PPC64_ADDR64
R_PPC64_ENTRY
R_PPC64_REL24
R_PPC64_REL32
R_PPC64_REL64
R_PPC64_TOC
R_PPC64_TOC16_HA
R_PPC64_TOC16_LO
R_PPC64_TOC16_LO_DS

All three environments show up similar set of relocations, all of which 
we handle in the module loader today.

If Rasmus/Christophe can confirm that this is true for ppc32 as well, 
then we should be fine.

- Naveen

