Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 594456AD5C
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 19:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730431AbfGPRGL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 13:06:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35335 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730384AbfGPRGL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 13:06:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id l2so19434663wmg.0;
        Tue, 16 Jul 2019 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N3XEJF+2nXhkm8EAAXO29BXSh2L26ahqWhB0e9A+/jA=;
        b=AxUPg0BoL/e2i7eiDYyIGJhfEJM6OOT42exGAtcMqU3OdKABcyLo64Ie5soORZaEGm
         EyqdDfV1o6eLeI+DSZBxypxMAc6EzqT6Iygya1H89kCn95Shg9M+vKJGxVnoc3X1vF6B
         v21u3Z4VtrYvWvAV0gigz6A9xQJ2enTk94cGyatuUc7RrKQaNRJmePYrhyMkPC/YaMY2
         MHBWjyX87XCePw1BFRu7GstJtrcN8FFyCELnga3w2Z7N4Z+dxkVJ8cTI5RXk3CeM7367
         e1CAe9O+0J782ueirhg7Kn9jiuVU8Ga9SlpW/SRuOvohJAiYCrO6Thi9z4Zb//qhKGvi
         4Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N3XEJF+2nXhkm8EAAXO29BXSh2L26ahqWhB0e9A+/jA=;
        b=TOLqCAq1lMqu5QW1QaVkrTBycPmqgcubPzM22XaXhb3fpYugwPb38as29nGrk8lhYp
         FCDkVGilH3yGe8FTlWyz2iIFfcinYQW4hOADvNl3dtvAdQajySvveti+GEizP7iSHxhs
         1MWjNIZunk6LzZ8MJT8iQrOydmyjZTeaqxW6DceazOY9WYHb2tGXER8fSlA5Gg9ox2aP
         ZSJiojahpA2GHbf6P3vage9R+lng84yLd+g0CkLDqm0atPQHMqVlXYrxj4K2KIH5Q7z2
         G7m3kwLDKGNlVZJa5rzusF1G0xyiUbJPlP3eAE03NnvOMscDM0U4K+6zaFWJTqC0MkP9
         KPQg==
X-Gm-Message-State: APjAAAVVq5zLdMKhHz0esrhBt3i7sl6yhUKLnDyCGbIFmWxf4fKdECkW
        Jpe2NWW57m9FTjHqfePfXD1k71HLKok=
X-Google-Smtp-Source: APXvYqxP9JsxTCwwtP6lTHLvxIHlswxwxGUngQajFr5QeEQlkAT0Q/Z7tf6Qp6BZppXQAXg+7szcGg==
X-Received: by 2002:a1c:343:: with SMTP id 64mr26637912wmd.116.1563296768763;
        Tue, 16 Jul 2019 10:06:08 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id a81sm20287796wmh.3.2019.07.16.10.06.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 10:06:08 -0700 (PDT)
Date:   Tue, 16 Jul 2019 10:06:06 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: kbuild: Fail if gold linker is detected
Message-ID: <20190716170606.GA38406@archlinux-threadripper>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 02:47:56PM +0200, Thomas Gleixner wrote:
> The gold linker has known issues of failing the build in random and
> predictible ways. H.J. stated:
> 
>   "Since building a workable kernel for different kernel configurations
>    isn't a requirement for gold, I don't recommend gold for kernel."
> 
> So instead of dealing with attempts to duct tape gold support without
> understanding the root cause, fail the build when gold is detected.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Link: https://lore.kernel.org/r/CAMe9rOqMqkQ0LNpm25yE_Yt0FKp05WmHOrwc0aRDb53miFKM+w@mail.gmail.com
> ---
>  scripts/Kconfig.include |    3 +++
>  1 file changed, 3 insertions(+)
> 
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -35,5 +35,8 @@ ld-option = $(success,$(LD) -v $(1))
>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
>  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
>  
> +# Fail if the linker is gold as it's not capable of linking the kernel proper
> +$(error-if,$(success, command -v $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)

Why are there two '-v' flags here? The second one is ignored since
command -v just prints out the path of the binary that is being used,
which would work in most cases but not if gold is the default system
linker.

$ command -v ld.gold -v
/usr/bin/ld.gold

$ command -v ld.gold
/usr/bin/ld.gold

$ command ld.gold -v
GNU gold (GNU Binutils 2.32) 1.16

Thus, wouldn't it be better to just call $(LD) directly, like
CC_IS_GCC and CC_IS_CLANG in init/Kconfig?

$(success, $(LD) -v | grep -q gold)

Cheers,
Nathan
