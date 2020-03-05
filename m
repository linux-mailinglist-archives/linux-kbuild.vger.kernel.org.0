Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6734F17A597
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2020 13:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgCEMrd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Thu, 5 Mar 2020 07:47:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58176 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726048AbgCEMrb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Mar 2020 07:47:31 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 025Cd2hW076536
        for <linux-kbuild@vger.kernel.org>; Thu, 5 Mar 2020 07:47:30 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2yhhy7yegw-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2020 07:47:30 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <naveen.n.rao@linux.ibm.com>;
        Thu, 5 Mar 2020 12:47:27 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 5 Mar 2020 12:47:24 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 025ClNjc29687814
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 5 Mar 2020 12:47:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 617CA11C064;
        Thu,  5 Mar 2020 12:47:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 029A011C04C;
        Thu,  5 Mar 2020 12:47:23 +0000 (GMT)
Received: from localhost (unknown [9.199.53.44])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu,  5 Mar 2020 12:47:22 +0000 (GMT)
Date:   Thu, 05 Mar 2020 18:17:21 +0530
From:   "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: eh_frame confusion
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
        <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
        <1583169883.zo43kx69lm.naveen@linux.ibm.com>
In-Reply-To: <1583169883.zo43kx69lm.naveen@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421
 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-TM-AS-GCONF: 00
x-cbid: 20030512-0008-0000-0000-0000035998EA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030512-0009-0000-0000-00004A7AD005
Message-Id: <1583412126.fc8zskkv66.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-05_03:2020-03-05,2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050082
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Naveen N. Rao wrote:
> Naveen N. Rao wrote:
>> Rasmus Villemoes wrote:
<snip>
> Can you check if the below patch works? I am yet to test this in more 
> detail, but would be good to know the implications for ppc32.
> 
> - Naveen
> 
> 
> ---
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index f35730548e42..5b5bf98b8217 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -239,10 +239,7 @@ KBUILD_CFLAGS += $(call cc-option,-mno-vsx)
>  KBUILD_CFLAGS += $(call cc-option,-mno-spe)
>  KBUILD_CFLAGS += $(call cc-option,-mspe=no)
>  
> -# FIXME: the module load should be taught about the additional relocs
> -# generated by this.
> -# revert to pre-gcc-4.4 behaviour of .eh_frame
> -KBUILD_CFLAGS  += $(call cc-option,-fno-dwarf2-cfi-asm)
> +KBUILD_CFLAGS  += $(call cc-option,-fno-asynchronous-unwind-tables)

In terms of the CFI information, the primary difference I see with 
-fno-dwarf2-cfi-asm is that when dumping the debug frames, CIE indicates 
version 3, while otherwise (i.e., without -fno-dwarf2-cfi-asm and 
with/without -fasynchronous-unwind-tables), it is version 1, regardless 
of -gdwarf-2/-gdwarf-4. There are few more minor changes, but none of 
these looked significant to me.

>  
>  # Never use string load/store instructions as they are
>  # often slow when they are implemented at all
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
> index e147bbdc12cd..d43b0b18137c 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -25,6 +25,7 @@ KCOV_INSTRUMENT := n
>  UBSAN_SANITIZE := n
>  
>  ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
> +       -fasynchronous-unwind-tables \
>         -Wl,-soname=linux-vdso32.so.1 -Wl,--hash-style=both
>  asflags-y := -D__VDSO32__ -s
>  
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index 32ebb3522ea1..b2cbb5c49bad 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -13,6 +13,7 @@ KCOV_INSTRUMENT := n
>  UBSAN_SANITIZE := n
>  
>  ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
> +       -fasynchronous-unwind-tables \
>         -Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
>  asflags-y := -D__VDSO64__ -s

The above vdso hunks can be dropped since all our VDSO are assembly, so 
the above have no impact.


- Naveen

