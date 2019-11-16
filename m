Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA6BDFF487
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2019 18:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfKPR7O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Nov 2019 12:59:14 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46694 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfKPR7N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Nov 2019 12:59:13 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAGHwC1i192063;
        Sat, 16 Nov 2019 17:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=YWcfoZYSi9YC//sXmYQRC483wrkaFq2Y2pjRE5aGiMY=;
 b=B6wzF31ujjiG3eKkAgyQ1aU+tvB3bmFrXmWaYvXFZqI2YmVJj+PcIyp06mBkcFksoPKZ
 eSgtlA6UiSnogJ0QBker4QWwACWk8PnVnp3ZOOdBGTqgpLIj4QDGBHtpoqfafTU1PqXI
 JDxqp0m5rOfpzmSACPK0IpCrphl69Ri5AqiMgKPNJ894AlskvszVgOGSrJW+cmvKLYSo
 HWGM5PpZwIG0Bj52mMjACETRqcY+Ye9pFTh/KMrV6qfShoZLOeNclClvbiOsKPTeC8do
 pjCvSX83d5MgxC2bh/knNjWlRC7WX0B1UGb0kQtAjMQqgFXG4Ak78nIJy53zFZ6u9zH1 Lw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2wa8ht9k7r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 16 Nov 2019 17:58:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAGHvRvm187165;
        Sat, 16 Nov 2019 17:58:11 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2wa8xjjdmn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 16 Nov 2019 17:58:11 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAGHw6go028088;
        Sat, 16 Nov 2019 17:58:06 GMT
Received: from [10.211.14.86] (/10.211.14.86)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 16 Nov 2019 09:58:06 -0800
Subject: Re: [PATCH] kallsyms: new /proc/kallmodsyms with builtin modules and
 symbol sizes
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, jacob.e.keller@intel.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20191114223036.9359-1-eugene.loh@oracle.com>
 <20191115114708.2a784f8d@gandalf.local.home>
 <CAHk-=wjQBFTaEfHQNmrBQOLOLey5Goz01wJHTJKKLQm22ZyrJA@mail.gmail.com>
From:   Eugene Loh <eugene.loh@oracle.com>
Message-ID: <11861ca1-76c5-ed14-8ee1-f067c7e5b0c0@oracle.com>
Date:   Sat, 16 Nov 2019 09:58:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjQBFTaEfHQNmrBQOLOLey5Goz01wJHTJKKLQm22ZyrJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9443 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911160167
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9443 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911160167
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/15/2019 09:26 AM, Linus Torvalds wrote:

> Is a new config option even needed?

I suppose not.  The original motivations for this option no longer 
matter.  I can amend the patch if that makes sense.

> Honestly, I think the "add the module name even when built-in" could
> be done unconditionally with no backwards compatibility issues.  It's
> not a new syntax, and shouldn't break anything, and looks like a
> useful extension of the existing format - and one that existing tools
> already have to be aware of.
>
> The size thing is obviously different, but I find that much more
> questionable. What's the use-case? If it's just about the occasional
> big jumps, then adding a dummy entry for those (rare) cases sounds
> like a much better option, and wouldn't break any existing code.
>
> I don't see any upside at all in showing the "exact" function size
> instead of a size rounded up to the usual 16 bytes or whatever.
> Padding is real, and doesn't change anything.

Since there are very many gaps, adding dummy entries makes sense only 
for "big" jumps.  I don't know where one would want to draw the line for 
"big."  In any case, to identify such gaps, one would still need the "nm 
-S" information provided by this patch.

Meanwhile, there are some symbols that encompass others.  E.g.,
     ffffffff8a001000 1000 T hypercall_page
     ffffffff8a001000 20 t xen_hypercall_set_trap_table
     ffffffff8a001020 20 t xen_hypercall_mmu_update
     [...]
     ffffffff8a0016c0 20 t xen_hypercall_arch_6
     ffffffff8a0016e0 20 t xen_hypercall_arch_7
     ffffffff8a002000 8 T __startup_secondary_64
Something between ffffffff8a001700 and ffffffff8a002000 maps to 
hypercall_page, but you'd never know that from the "up until the next 
address" approach.

Symbols of zero size pose interesting questions.  E.g., do we want these 
zero-size symbols to have nonzero size?
     ffffffff8ac00e00 19 T __x86_indirect_thunk_r15
     ffffffff8ac00e19 0 T _etext
     ffffffff8ac00e19 0 T __indirect_thunk_end
     ffffffff8ac00e1c 0 R __start_notes
     ffffffff8ac00fd8 18 r _note_55
     ffffffff8ac01008 0 R __stop_notes

Size information also helps us distinguish symbol ranges when a 
zero-size symbol has the same address as another symbol.  E.g.,
     ffffffff8a9593e0 0 T __sched_text_start
     ffffffff8a9593e0 6b9 t __schedule
     ffffffff8a959aa0 9a T schedule
If we have an address above ffffffff8a9593e0, we see it belongs to 
__schedule.   Without size information, we might have assigned such an 
address to __sched_text_start.

Or how would one distinguish the symbols at ffffffff8b37d840 without 
size info?
     ffffffff8b37a870 0 R __start___param
     ffffffff8b37a870 28 r __param_initcall_debug
     ffffffff8b37a898 28 r __param_action
     [...]
     ffffffff8b37d7f0 28 r __param_disable_ipv6
     ffffffff8b37d818 28 r __param_disable
     ffffffff8b37d840 0 r __stop___param
     ffffffff8b37d840 0 r __start___modver   [configfs]
     ffffffff8b37d840 8 r __modver_attr      [configfs]

There are also symbols of zero size that mark the end of a segment and 
share the same address as the first symbol in the next segment. This 
means that the "up to the next symbol" algorithm leads to some 
confusion, e.g., overlapping segments.

Anyhow, given that we know real symbol sizes, why not just use them?
