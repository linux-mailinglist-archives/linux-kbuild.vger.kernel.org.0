Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A66433140E
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 May 2019 19:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfEaRpR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 May 2019 13:45:17 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:53240 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfEaRpR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 May 2019 13:45:17 -0400
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hWlaY-00048y-04 from George_Davis@mentor.com ; Fri, 31 May 2019 10:45:10 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-01.mgc.mentorg.com
 (147.34.90.201) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Fri, 31 May
 2019 10:45:07 -0700
Date:   Fri, 31 May 2019 13:45:06 -0400
From:   "George G. Davis" <george_davis@mentor.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC][PATCH] Makefile: Fix checkstack.pl arm64 wrong or unknown
 architecture
Message-ID: <20190531174506.GC10644@mam-gdavis-lt>
References: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
 <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
 <20190531163908.GB10644@mam-gdavis-lt>
 <CAK7LNASq8eW0D8fpbxFGhAgR5D158emTR2quCD5ufyC+kK-2GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK7LNASq8eW0D8fpbxFGhAgR5D158emTR2quCD5ufyC+kK-2GQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Masahiro,

On Sat, Jun 01, 2019 at 02:22:36AM +0900, Masahiro Yamada wrote:

// CUT

> As far as I understood, checkstack.pl is supposed to
> understand both ARCH= and 'uname -m'.
> 
> 
> For example, the following commit supports x86, x86_64, i386,
> by using regular expression.
> 
> commit fda9f9903be6c3b590472c175c514b0834bb3c83
> Author: Konstantin Khlebnikov <koct9i@gmail.com>
> Date:   Fri Aug 8 14:23:35 2014 -0700
> 
>     scripts/checkstack.pl: automatically handle 32-bit and 64-bit mode
> for ARCH=x86
> 
>     This patch adds support for ARCH=x86 into checkstack.
> 
> 
> 
> Following this pattern, does this work for you?
> 
> diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
> index 122aef5e4e14..371bd17a4983 100755
> --- a/scripts/checkstack.pl
> +++ b/scripts/checkstack.pl
> @@ -46,7 +46,7 @@ my (@stack, $re, $dre, $x, $xs, $funcre);
>         $x      = "[0-9a-f]";   # hex character
>         $xs     = "[0-9a-f ]";  # hex character or space
>         $funcre = qr/^$x* <(.*)>:$/;
> -       if ($arch eq 'aarch64') {
> +       if ($arch =~ '^(aarch|arm)64$') {

Yes, that works, thanks!

Will you submit a fix or would you like me to resubmit with the above suggested
fix?


Thanks again!

>                 #ffffffc0006325cc:       a9bb7bfd        stp     x29,
> x30, [sp, #-80]!
>                 #a110:       d11643ff        sub     sp, sp, #0x590
>                 $re = qr/^.*stp.*sp, \#-([0-9]{1,8})\]\!/o;
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Regards,
George
