Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED4B2176116
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 18:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgCBRcw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Mon, 2 Mar 2020 12:32:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42120 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727000AbgCBRcw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 12:32:52 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022HLmA0111489
        for <linux-kbuild@vger.kernel.org>; Mon, 2 Mar 2020 12:32:51 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2yfhqpwgk2-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Mar 2020 12:32:51 -0500
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <naveen.n.rao@linux.ibm.com>;
        Mon, 2 Mar 2020 17:32:49 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 2 Mar 2020 17:32:45 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 022HWiiV45220140
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 2 Mar 2020 17:32:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 31EB34C040;
        Mon,  2 Mar 2020 17:32:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C1ECB4C04A;
        Mon,  2 Mar 2020 17:32:43 +0000 (GMT)
Received: from localhost (unknown [9.199.48.41])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon,  2 Mar 2020 17:32:43 +0000 (GMT)
Date:   Mon, 02 Mar 2020 23:02:42 +0530
From:   "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: eh_frame confusion
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
        <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
In-Reply-To: <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421
 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-TM-AS-GCONF: 00
x-cbid: 20030217-0016-0000-0000-000002EC5DC4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030217-0017-0000-0000-0000334FA18A
Message-Id: <1583169883.zo43kx69lm.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_06:2020-03-02,2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020116
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Naveen N. Rao wrote:
> Rasmus Villemoes wrote:
>> I'm building a ppc32 kernel, and noticed that after upgrading from gcc-7
>> to gcc-8 all object files now end up having .eh_frame section. For
>> vmlinux, that's not a problem, because they all get discarded in
>> arch/powerpc/kernel/vmlinux.lds.S . However, they stick around in
>> modules, which doesn't seem to be useful - given that everything worked
>> just fine with gcc-7, and I don't see anything in the module loader that
>> handles .eh_frame.
>> 
>> The reason I care is that my target has a rather tight rootfs budget,
>> and the .eh_frame section seem to occupy 10-30% of the file size
>> (obviously very depending on the particular module).
>> 
>> Comparing the .foo.o.cmd files, I don't see change in options that might
>> explain this (there's a bunch of new -Wno-*, and the -mspe=no spelling
>> is apparently no longer supported in gcc-8). Both before and after, there's
>> 
>> -fno-dwarf2-cfi-asm
>> 
>> about which gcc's documentation says
>> 
>> '-fno-dwarf2-cfi-asm'
>>      Emit DWARF unwind info as compiler generated '.eh_frame' section
>>      instead of using GAS '.cfi_*' directives.
>> 
>> Looking into where that comes from got me even more confused, because
>> both arm and unicore32 say
>> 
>> # Never generate .eh_frame
>> KBUILD_CFLAGS           += $(call cc-option,-fno-dwarf2-cfi-asm)
>> 
>> while the ppc32 case at hand says
>> 
>> # FIXME: the module load should be taught about the additional relocs
>> # generated by this.
>> # revert to pre-gcc-4.4 behaviour of .eh_frame
> 
> Michael opened a task to look into this recently and I had spent some 
> time last week on this. The original commit/discussion adding 
> -fno-dwarf2-cfi-asm refers to R_PPC64_REL32 relocations not being 
> handled by our module loader:
> http://lkml.kernel.org/r/20090224065112.GA6690@bombadil.infradead.org
> 
> However, that is now handled thanks to commit 9f751b82b491d:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f751b82b491d
> 
> I did a test build and a simple module loaded fine, so I think 
> -fno-dwarf2-cfi-asm is not required anymore, unless Michael has seen 
> some breakages with it. Michael?
> 
>> 
>> but prior to gcc-8, .eh_frame didn't seem to get generated anyway.
>> 
>> Can .eh_frame sections be discarded for modules (on ppc32 at least), or
>> is there some magic that makes them necessary when building with gcc-8?
> 
> As Segher points out, it looks like we need to add 
> -fno-asynchronous-unwind-tables. Most other architectures seem to use 
> that too.

Can you check if the below patch works? I am yet to test this in more 
detail, but would be good to know the implications for ppc32.

- Naveen


---
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f35730548e42..5b5bf98b8217 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -239,10 +239,7 @@ KBUILD_CFLAGS += $(call cc-option,-mno-vsx)
 KBUILD_CFLAGS += $(call cc-option,-mno-spe)
 KBUILD_CFLAGS += $(call cc-option,-mspe=no)
 
-# FIXME: the module load should be taught about the additional relocs
-# generated by this.
-# revert to pre-gcc-4.4 behaviour of .eh_frame
-KBUILD_CFLAGS  += $(call cc-option,-fno-dwarf2-cfi-asm)
+KBUILD_CFLAGS  += $(call cc-option,-fno-asynchronous-unwind-tables)
 
 # Never use string load/store instructions as they are
 # often slow when they are implemented at all
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index e147bbdc12cd..d43b0b18137c 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -25,6 +25,7 @@ KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
 
 ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
+       -fasynchronous-unwind-tables \
        -Wl,-soname=linux-vdso32.so.1 -Wl,--hash-style=both
 asflags-y := -D__VDSO32__ -s
 
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index 32ebb3522ea1..b2cbb5c49bad 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -13,6 +13,7 @@ KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
 
 ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
+       -fasynchronous-unwind-tables \
        -Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
 asflags-y := -D__VDSO64__ -s
 
 

