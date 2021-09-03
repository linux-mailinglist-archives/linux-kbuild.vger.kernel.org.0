Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9514007BE
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 00:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234631AbhICWHS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Sep 2021 18:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbhICWHS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Sep 2021 18:07:18 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4097C061575
        for <linux-kbuild@vger.kernel.org>; Fri,  3 Sep 2021 15:06:17 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id s16so486054qvt.13
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Sep 2021 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=xKcsIX3BfLBwQgdXTJ8xpZnHGVXMHnmcgqRZLMQsLms=;
        b=e0hA8wdoOpUzzJq5zimuZoliotF/jZH+dEmCYrj3QzZzypb/hy90w3lEgfJCGKupgL
         vUsN4iHKw0jdZE1Cvm71LTj/85tzxaBKAHKCOiAXZVH9LrHE55qmasJOGxflSWiE4yhm
         bZGSg1v3GSZNvbX+cEWFIPyuyoFwe6M3J3Z+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=xKcsIX3BfLBwQgdXTJ8xpZnHGVXMHnmcgqRZLMQsLms=;
        b=ks+xVykmnHndkAsfOYPfoPLeoZDZFKyCLgl6fwZPZnPUqfRbvTzaxHQd5Nw5N5aOX7
         zsCu66gKBDdZKHjfv9V09cgQh0S1ZRPjQBbybjpz+StO5CJ95jMSVHTuYLwrSNsai6tO
         aXxDhu+n+GrFisONrcrRRF0iz0njcR1y6r09jGyFDnSHOnZScy4C2BxwFjW+8vUquXx2
         2xewniVPciPPRmPMBluYKXffpx49XojGGWgUqLmrtnrUAQ960xpsX7t87REB0yLoczG9
         Td8aQ/1y7LreG5F3CefKxTgNY8hfhqAJeFDGb+T+K5rhHjNsXUrE8PdPWKR6JP0Xg1Vd
         3M7g==
X-Gm-Message-State: AOAM531IFnMsd3KiTGaNvZbKVpsvZJHjdhzNPj/pLJuBGWEhrTne6ZSU
        85QEcD2+JlrN+ACtrdgQOaJxX6OR77Xc3LDoHOoKPw8kd6/BsHoA
X-Google-Smtp-Source: ABdhPJwlbA8ZvmxrMRfWZiXhit//urNbuikAJziCnd9qByfUTVm9Z47/FOzIOnNP/nFB0d34eKqM8oCrVGjGNR/iN0s=
X-Received: by 2002:a0c:e910:: with SMTP id a16mr1320836qvo.37.1630706776789;
 Fri, 03 Sep 2021 15:06:16 -0700 (PDT)
MIME-Version: 1.0
From:   Markus Mayer <mmayer@broadcom.com>
Date:   Fri, 3 Sep 2021 15:06:05 -0700
Message-ID: <CAGt4E5tzxtCLaasW_Es4oqx+H2iH=Qmid8YG-gtZrCcK7n_B2g@mail.gmail.com>
Subject: Module build problems with gmake 3.x
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Kbuild Mailing List <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

We are running into build issues with some external kernel modules if
the GNUmake version is 3.x and the kernel is recent(-ish). The culprit
seems to be the sub-make invocation when GNUmake < 4 is detected:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=688931a5ad4e

The module build works fine for older kernels (those not containing
this patch) even with GNUmake 3.81. And it works fine with GNUmake >=
4 with any kernel, even those with the above patch. In other words, if
the sub-make invocation doesn't take place (either because make is new
enough or because the kernel doesn't have the version check yet), our
module build does work as intended.

Due to how the build is integrated with other components, we need to
be calling "make -e" to have environment variables take precedence,
which seems to be another piece of the puzzle. The problem doesn't
seem to be happening without "-e".

The ingredients for our problem, therefore, seem to be:
    * old GNUmake (<4)
    * newish kernel  (>=5.1)
    * run make -e

I should also mention that the kernel module is being cross-compiled
for ARM and ARM64, although that does not seem to be playing a role
here. In my example below, I was using the native compiler.

The problem we are observing is that the contents of $(M) and
$(CFLAGS_MODULE) are lost during the extra sub-make invocation that is
conditional upon GNUmake < 4. There might be other lost variables,
too, but we haven't noticed any effects if there are.

Losing $(M) causes the build to go off the rails completely. This is
easily detected and can be worked around by setting $(KBUILD_EXTMOD)
directly and foregoing $(M) on the command line altogether. The loss
of $(CFLAGS_MODULE) is a little more insidious, since the build does
succeed even when it's empty. However, required defines remain unset
despite being set in the top-level makefile. The resulting kernel
module doesn't work (which can lead to a lot of head scratching). I
also don't know of a way of working around losing CFLAGS_MODULE's
contents.

I was able to reproduce the loss of $(M) quite easily doing something like this:

obj-m += hello.o

all:
        ${MAKE} -C $(KERNEL_DIR) -e M=$(PWD) modules

clean:
        make -C $(KERNEL_DIR) M=$(PWD) clean

Instead of building the out-of-tree hello.ko, which we are asking it
to do, it'll go off and build all the in-kernel modules instead. Since
it sees $(M) as empty, it just executes "make modules".

Unfortunately, I have NOT been successful reproducing losing the
contents of $(CFLAGS_MODULE) in a simple test environment. In my
tests, it was always retained. Nonetheless, in the actual build
environment, it does get lost. And only in the combination of new-ish
kernel and old-ish make, i.e. whenever the sub-make invocation happens
due to the make version.

BTW, commenting out the make version test does make our module build
work. So, it is definitely related to that code snippet. (Of course,
building on a reasonably recent Linux distro also makes everything
work, but that isn't possible for us in all circumstances.)

Do you have any thoughts on this or any pointers? Is there a way this
issue could be resolved? It does seem like the version check has some
unintended side-effects, even if the scenario in which one would come
across them is fairly uncommon and most developers will never
experience them.

I am willing to try out any suggestions or provide further information
if needed.

Regards,
-Markus
