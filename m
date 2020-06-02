Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F901EB5E8
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2020 08:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgFBGki (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Jun 2020 02:40:38 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:53454 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725616AbgFBGki (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Jun 2020 02:40:38 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R351e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07484;MF=alios_sys_security@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0U-M329z_1591080034;
Received: from 10.0.2.15(mailfrom:alios_sys_security@linux.alibaba.com fp:SMTPD_---0U-M329z_1591080034)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 02 Jun 2020 14:40:35 +0800
Subject: Re: [PATCH] mksysmap: Fix the mismatch of '.L' symbols in System.map
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
 <CAK7LNAS290zRibWqbu1AxQ1W9afPR21OYSia+xkqwoot9zRd2w@mail.gmail.com>
From:   AliOS system security <alios_sys_security@linux.alibaba.com>
Message-ID: <befdf38d-631d-8722-df7b-6e670f9c0bc8@linux.alibaba.com>
Date:   Tue, 2 Jun 2020 14:41:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS290zRibWqbu1AxQ1W9afPR21OYSia+xkqwoot9zRd2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Thanks for your suggestion, I will use my personal account to post
a new version later, and amend this comment.

On 2020/6/1 19:01, Masahiro Yamada wrote:
 > On Sun, May 31, 2020 at 7:28 PM AliOS system security
 > <alios_sys_security@linux.alibaba.com> wrote:
 >>
 >> When System.map was generated, the kernel used mksysmap to filter the
 >> kernel symbols, but all the symbols with the second letter 'L' in the
 >> kernel were filtered out, not just the symbols starting with 'dot + L'.
 >>
 >> For example:
 >> ashimida@ubuntu:~/linux$ cat System.map |grep ' .L'
 >> ashimida@ubuntu:~/linux$ nm -n vmlinux |grep ' .L'
 >> ffff0000088028e0 t bLength_show
 >> ......
 >> ffff0000092e0408 b PLLP_OUTC_lock
 >> ffff0000092e0410 b PLLP_OUTA_lock
 >>
 >> I see that in the original patch[1], the original intent should be to
 >> filter all local symbols starting with '.L', so I wonder if the code
 >> here may add a '\' before '.L'?
 >
 >
 > You are right, but please avoid the interrogatory sentence.
 >
 > Shall I reword as follows?
 >
 >
 > The original intent should be to filter out all local symbols
 > starting with '.L', so the dot should be escaped.
 >
 >
 >
 >
 >
 >>
 >> [1]. mksysmap: Add h8300 local symbol pattern
 >>
 >> Signed-off-by: AliOS system security 
<alios_sys_security@linux.alibaba.com>
 >> ---
 >>   scripts/mksysmap | 2 +-
 >>   1 file changed, 1 insertion(+), 1 deletion(-)
 >>
 >> diff --git a/scripts/mksysmap b/scripts/mksysmap
 >> index a35acc0..9aa23d1 100755
 >> --- a/scripts/mksysmap
 >> +++ b/scripts/mksysmap
 >> @@ -41,4 +41,4 @@
 >>   # so we just ignore them to let readprofile continue to work.
 >>   # (At least sparc64 has __crc_ in the middle).
 >>
 >> -$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( 
.L\)' > $2
 >> +$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( 
\.L\)' > $2
 >> --
 >> 2.7.4
 >>
 >
 >
