Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9CA8714C
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2019 07:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfHIFP6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Aug 2019 01:15:58 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53367 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405388AbfHIFP6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Aug 2019 01:15:58 -0400
Received: by mail-wm1-f68.google.com with SMTP id 10so4382108wmp.3
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Aug 2019 22:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mo9jl2fTO7MrBL73jImyv4V27EVzM5w8yQ4jscK8cvY=;
        b=K/DQWIcW+lp7tDWSdOBn+dI78lCIKTZDjOXiXcSBptb8DbfiakJqLfTOYm0Yybws5l
         1yhmKRRcImh39VfWsbNu6fkB3RPzM8oDG+R1hDVuKzujFJ9Bx31JnLyXTKHeRJxoClyR
         U7lUO/OxN+dqgRKrrbOumJGbmJjXgkfMINGZt5UpMJ/7qbJxlmjqb/ZQCTmQiQzyjhcn
         Uj4GCR99quN7N7h5c6NfRWDS+oyMR+kPkYZ/tEqYEldd9N50f9BbDfVfChwSPBxkk/CB
         gUP4CGgux9R5HxE2PoI/1TIiYn0osIfa+MkUUtEkBtB7H+Wc2/pUx5nqDO94hGHE/95x
         MOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mo9jl2fTO7MrBL73jImyv4V27EVzM5w8yQ4jscK8cvY=;
        b=M2uzDHI8xXrnJvvis5YfHI6oY2eAjK/fTEU3dvnreRS+PDB/K4hacOx/OYO/22NSf4
         tFji2w0+SWD5ii0hI2lqMifLpOUmoZgsvyEaw4Cddojo0gdo8/NuMIka/yfYi7EKFCPq
         TzPW/vK7ln8lZgFZAPyGVMNCYpUqKQbJdCCCW+kl/yUVgY4JtRGO1tt2kOll3Y/Yhi2w
         G2Dyha06i4LwWPlP1C36H/vINNE8bkyfsF3k/PSp9I4LluCgEJu+7kt8bmQ31JbBUjyV
         /t9GsLWBuZ5D2LaanGW5wLSD8/GbViBGcKXybmpJSLhaTa3nMsGP6HmSUW5zgb0HAYCq
         Yp3Q==
X-Gm-Message-State: APjAAAUX7YozzE4qSa3pl6NT2cuN+NKBhiaiqF8HQet5txfsORH3PNjE
        8XPGUmDbcsTRsi1F7L2Zrws=
X-Google-Smtp-Source: APXvYqwAtLRYb0yvOeM1HGaCgUg8wjZhfzAnHTDWQ/chznPkfeagR1/mENS9U30X1Lk0s+QWQp7anA==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr923969wmi.137.1565327755405;
        Thu, 08 Aug 2019 22:15:55 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id y16sm207953394wrg.85.2019.08.08.22.15.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 22:15:54 -0700 (PDT)
Date:   Thu, 8 Aug 2019 22:15:52 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mark Brown <broonie@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel@collabora.com
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the
 environment
Message-ID: <20190809051552.GA44466@archlinux-threadripper>
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
 <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 08, 2019 at 03:42:32PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Thu, Aug 8, 2019 at 2:07 PM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> >
> > Only use gcc/g++ for HOSTCC, HOSTCXX and CC by default if they are not
> > already defined in the environment.  This fixes cases such as building
> > host tools with clang without having gcc installed.
> >
> > The issue was initially hit when running merge_config.sh with clang
> > only as it failed to build "HOSTCC scripts/basic/fixdep".
> 
> Thanks for the patch.  I don't quite follow the exact error.
> 
> When building with Clang, I usually do:
> 
> $ make CC=clang HOSTCC=clang ...
> 
> are you trying to fix the case where you do:
> 
> $ make CC=clang ...
> <no HOSTCC set>
> when GCC is not installed?  Because if so, I think it would be easier
> to just specify HOSTCC=clang, but maybe I'm misunderstanding the
> issue?

As I understand it,

$ make CC=clang HOSTCC=clang

works fine. What doesn't currently work is:

$ export CC=clang
$ export HOSTCC=clang
$ make

This is problematic because there is no way for CC, HOSTCC, and HOSTCXX
to be passed to make within scripts/kconfig/merge_config.sh.

A quick test before and after the patch:

$ ( export HOSTCC=clang; make -j$(nproc) O=out defconfig V=1 )
...
  gcc -Wp,-MD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes...
  gcc -Wp,-MD,scripts/kconfig/.confdata.o.d -Wall -Wmissing-prototypes...
...
$ ( export HOSTCC=clang; make -j$(nproc) O=out defconfig V=1 )
...
  clang -Wp,-MD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes...
  clang -Wp,-MD,scripts/kconfig/.confdata.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes...
...

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

I wonder if all variable should be converted to that scheme or just the
ones that are needed in this instance. I also wonder if this will cause
any issues with people who define these variables in their environment
already; if so, maybe merge_config.sh should be updated to support
passing CC, HOSTCC, and HOSTCXX to make.

Cheers,
Nathan
