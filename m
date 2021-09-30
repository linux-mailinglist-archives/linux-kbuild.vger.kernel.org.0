Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE3341E41E
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 00:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344758AbhI3Wut (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 18:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344107AbhI3Wur (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 18:50:47 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17B5C06176A;
        Thu, 30 Sep 2021 15:49:04 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id d18so9517046iof.13;
        Thu, 30 Sep 2021 15:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vOtIXIDfSsulhUrItDNQERb0f0g8vwOd+YpN2bOuFew=;
        b=UsJzLo6YvJ6tSS0UKfdSYQv/O1WCavAUERunvK+OOYqhIEDAS4Z2vFzdKFwqiPmuLh
         6vevGTjNkpxP1BrrwxdpDz2QXThg/BpKbo9iEsLpomx0/HYd6wGw4n9/053N62i/+cHf
         n4LAKuTY+c5axHHMCsyZm//x8uVjd2ME65YOa5+awossXqI0wN2god8xyUEVnDXJ73ZC
         jS7ANVlJzya6Q4KBbze2jQP3/GRw6jUvGp2vouIqQzmoBozzSRo7M0RWaAeakNd++t0q
         aMjC0twctVpOeB4ubdeEjbMQKtIcVfwvvyJZwwgeC/I6SDYVC4oUQRqUxBN/itndGpes
         6M3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vOtIXIDfSsulhUrItDNQERb0f0g8vwOd+YpN2bOuFew=;
        b=xfq0fBSgTDxDxwLVRnYwm/ikVNTw5gJqWpCAXk52/njBbqIyi1x1imyULmgJuZQ+W8
         SsIn1U3GlIaqNC6nCFmLBiQawF2KYcEXWetPOafD93uAXWlntyxOPoNwaDZMdVl9qGG3
         djHncKVDVnpRy7ZLG+ESlo5p56pbKRET4u6rx9Krq33QTPMqFdU5wxmlRYtPCaWOznt7
         kUPyC41yKBD7rsg1GNM9er0ccyrw51jsEs62922UW4uG7iVw6mMnRaiLfp7SBZVvyjSd
         kvx7yHkfnNF4ZRu2vEZgzqZSgHcxEQxHF6CQzhqjTA7fy1uHwZOZcJIBCJdec/XgCTbO
         PdHQ==
X-Gm-Message-State: AOAM532u17rmWzXbI2Mhdqct2rbtavIJC7zns4Z1pdvBYezrthSrEm7l
        1bBlW30JACMDsMIgedYpjJleN7gk9ZnwG47FsHQ=
X-Google-Smtp-Source: ABdhPJz/YDrixlOb9rMZRSF4thA+3ftj/kiegqmIwGTDbMhl4uZQjKdWFZPuzBzbjuKnzp2MGOcTIH4Lk3dZrekpXZ8=
X-Received: by 2002:a02:a60a:: with SMTP id c10mr7053135jam.131.1633042144130;
 Thu, 30 Sep 2021 15:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210930222704.2631604-1-keescook@chromium.org> <20210930222704.2631604-3-keescook@chromium.org>
In-Reply-To: <20210930222704.2631604-3-keescook@chromium.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 1 Oct 2021 00:48:53 +0200
Message-ID: <CANiq72m3=pD=D_dt1SUZRAp19WV86LjWRj9xd-tt1YNtnkqy5w@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] Compiler Attributes: add __alloc_size() for better
 bounds checking
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andy Whitcroft <apw@canonical.com>,
        Christoph Lameter <cl@linux.com>,
        Daniel Micay <danielmicay@gmail.com>,
        David Rientjes <rientjes@google.com>,
        Dennis Zhou <dennis@kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Pekka Enberg <penberg@kernel.org>, Tejun Heo <tj@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-MM <linux-mm@kvack.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 1, 2021 at 12:27 AM Kees Cook <keescook@chromium.org> wrote:
>
> +ifdef CONFIG_CC_IS_GCC
> +# The allocators already balk at large sizes, so silence the compiler
> +# warnings for bounds checks involving those possible values. While
> +# -Wno-alloc-size-larger-than would normally be used here, earlier versions
> +# of gcc (<9.1) weirdly don't handle the option correctly when _other_
> +# warnings are produced (?!). Using -Walloc-size-larger-than=SIZE_MAX
> +# doesn't work (as it is documented to), silently resolving to "0" prior to
> +# version 9.1 (and producing an error more recently). Numeric values larger
> +# than PTRDIFF_MAX also don't work prior to version 9.1, which are silently
> +# ignored, continuing to default to PTRDIFF_MAX. So, left with no other
> +# choice, we must perform a versioned check to disable this warning.
> +# https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
> +KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
> +endif

An amazing journey!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
