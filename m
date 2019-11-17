Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA65FF631
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Nov 2019 01:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfKQAcj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Nov 2019 19:32:39 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35594 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbfKQAcj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Nov 2019 19:32:39 -0500
Received: by mail-lj1-f196.google.com with SMTP id r7so14698951ljg.2
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Nov 2019 16:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=knT5eug1ThI8ar7lmpi7yRk7gD5tsJK0aCyrTYGT2SY=;
        b=TizowyLdMboygP+1eW2n9Dh7mWzNake/Pf7HPqbHATIa5ju+lAYU6zkxU25WeaSbTB
         DgBnWRrtwkZuYawiW2LGvprqAiiLLrDz6cjpuO5SgMdfSkSB1Q63HKGPoy/IdySQLgSw
         TsSnbcxoZAZYLdmMTsTmF9SJdaKv17km3kI3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knT5eug1ThI8ar7lmpi7yRk7gD5tsJK0aCyrTYGT2SY=;
        b=CIEjeaktV3sOaAEMrtnNpJNa8pX6wQXLS4CcFNtk4yVWDlDhVHF4xEdBRl0JoxIJT3
         Cuesh/s+zKeKz3M34caBvFs4apOxot1htJoPrF06vtzpg1+4mY9W0GtZgB6FhsOHg7Xy
         NCATUouXqF1uVg0P3enw5ShlJ3Lyk+wR00JvIoUrGGrdcCl2A0qFxm4rPC/vQpJtFoQt
         +IONckp1sFoWUkkQE6oDNToyjCuyvXfkMUTAwh47HS+zwRiLQcrtVRN1Y1ECHNRPAt5X
         L4fEevbzc7rXU2uGGpPo+FcMIje9g1fvUIHJ8zSkku4KrzfU2ZZaLDWTzPh34rv09RHM
         LYrQ==
X-Gm-Message-State: APjAAAUbilssGq+QndVoHvA7mLYZl3jQCY4S03z4kPv0QfVapwliNpP6
        BymV51oA7KvqwHtGQnchu0JhGCllEsI=
X-Google-Smtp-Source: APXvYqwRPLjkDv8Bb6d/dYx2GW0pyojCDXQL7D+ETVrmFXEjPlMnjUZj2treoGbY3FnV7/+KKVNrfg==
X-Received: by 2002:a2e:8784:: with SMTP id n4mr11836861lji.230.1573950756734;
        Sat, 16 Nov 2019 16:32:36 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id g26sm6477494lfh.1.2019.11.16.16.32.35
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2019 16:32:35 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id g3so14656350ljl.11
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Nov 2019 16:32:35 -0800 (PST)
X-Received: by 2002:a2e:8919:: with SMTP id d25mr16013569lji.97.1573950754952;
 Sat, 16 Nov 2019 16:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20191114223036.9359-1-eugene.loh@oracle.com> <20191115114708.2a784f8d@gandalf.local.home>
 <CAHk-=wjQBFTaEfHQNmrBQOLOLey5Goz01wJHTJKKLQm22ZyrJA@mail.gmail.com> <11861ca1-76c5-ed14-8ee1-f067c7e5b0c0@oracle.com>
In-Reply-To: <11861ca1-76c5-ed14-8ee1-f067c7e5b0c0@oracle.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 16 Nov 2019 16:32:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjoXE1tRVVwgDY=G8xXKCAxz8mfYBaTh8wF=QTFPRwmJQ@mail.gmail.com>
Message-ID: <CAHk-=wjoXE1tRVVwgDY=G8xXKCAxz8mfYBaTh8wF=QTFPRwmJQ@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: new /proc/kallmodsyms with builtin modules and
 symbol sizes
To:     Eugene Loh <eugene.loh@oracle.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, jacob.e.keller@intel.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 16, 2019 at 9:58 AM Eugene Loh <eugene.loh@oracle.com> wrote:
>
> Since there are very many gaps, adding dummy entries makes sense only
> for "big" jumps.  I don't know where one would want to draw the line for
> "big."  In any case, to identify such gaps, one would still need the "nm
> -S" information provided by this patch.

Sure. You can have some kind of error estimate where if the size of
the thing is much smalle rthan the gap, add the fake padding object.

But it "much smaller than" would likely be in the area of page
alignment, not "next function was aligned to 64-byte boundary" kind of
small fixups.

Honestly, if somebody needs the real size, why aren't they just using
the original image?

> Meanwhile, there are some symbols that encompass others.

Yeah, I don't think this is at all worth worrying about. Again, if you
want that kind of information, you should use the original vmlinux
image, not think that "hey, /proc should give perfect information".

The /proc interface should be a rought and convenient baseline, but I
don't think it's at all interesting to try to make it perfect or even
all that clever.

Most of your questions boil down to "just use vmlinux" instead. If you
_really_ care about things like "one symbol can encompass many
sub-symbols", you shouldn't look at /proc/kallsyms.

So I think we could improve on /proc/kallsuyms, but we should do it
with the aim being "just make it incrementally better", not some
"let's solve big problems". The big problems are already solved by
just looking at the vmlinux file.

For example, I think the whole "include which module the symbol comes
from" is a nice improved quality thing even if the module happens to
be built-in. If that is easy to do, then we should just do it, and it
allows people to see interesting information and might make it useful
to (for example) have tools like profiling be able to zoom into
particular "modules", even if the module is built-in.

And if there are big gaps that aren't just "align to next cacheline",
then that sounds like it's worth pointing out too.

But I see _zero_ reason not to say "just use vmlinux if you need
detailed information". The /proc file is not supposed to be a
replacement for the full setup, it should be seen as a convenient
shorthand and as a "if you have nothing better, at least you can get
_some_ information, and maybe you can also use it to validate that you
have the _right_ vmlinux file"

                 Linus
