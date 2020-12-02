Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA1F2CC795
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 21:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730895AbgLBUOj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 15:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729283AbgLBUOj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 15:14:39 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA9DC0613CF
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 12:13:53 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id d20so6697877lfe.11
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 12:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JwDuNvESJRp4+4wFGB9eXTmw8LHatjPDAWUGnhDNQM0=;
        b=KUyCsmBcx+HvkQ1kf35woQhB1Qz1x70+qy7RY097/niHceovj20Z+xZSCDSq+d4F++
         YpHeiGGOgTuzGdTQONHv8+VtQ2144XQJw7ZA7Y2d4NhdhvP3uoSPeAUXSszMArwHx+4A
         2ou/o0cFxCawwIMqypcafgKaRFutrW3QJ9Od8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JwDuNvESJRp4+4wFGB9eXTmw8LHatjPDAWUGnhDNQM0=;
        b=OqDj4uUvtEMcdg9sWDPKcTtO9qps1tvSIpMDLrBtQobEFIdvh9IQKdmJXQ9yABYpi1
         6/8RZTgysJf65LV4PwTFVXJ+YNKFxGA8yOzo6PtA/suVOP2qiOZnBnU35/ct1TUNicLn
         iIIjf/r52tvsmbijb7emWe/Z9cxQXcLZHN1Ze4tl0wQA9MNZMZ55xvmXDZhLsZHaMATV
         1sPp3VRhXpH/f/YVCOdjcOqylxq2kft/G7RFrsCMAYGwx4h6CL5aqGmZztoihoQWbYtn
         6Amv/4fE8a8bDXhfcEjbWM1wY6Lhbe6qGqF2zR7Z8wYYRyWInmfKZ8s6HaiPfXe61A0m
         3+OA==
X-Gm-Message-State: AOAM533QlubuktbbaVkqn85FRGhTZpdG1TlzJEv8mxqjGZ0iZ/Ip43Bq
        IaeIbbpXL+Qa2c9aRzy+hukDVSOCmG/VDA==
X-Google-Smtp-Source: ABdhPJw6yhtOqe4Hmykl8fRDxWt9FqcXb9jtOyoGehCMMWcpHktXbmAktFPjnFXH6w+BcfSt/QBRbA==
X-Received: by 2002:a19:22c9:: with SMTP id i192mr2108012lfi.65.1606940031255;
        Wed, 02 Dec 2020 12:13:51 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id u26sm761989lfi.195.2020.12.02.12.13.48
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 12:13:48 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id y10so5284354ljc.7
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 12:13:48 -0800 (PST)
X-Received: by 2002:a2e:7f13:: with SMTP id a19mr2003590ljd.70.1606940027777;
 Wed, 02 Dec 2020 12:13:47 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
 <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
 <CAHk-=wi86Eu8Whu66CVu+GVTxbuJG+QNvDuk-hXnWu+5q90Zeg@mail.gmail.com>
 <CAHk-=winw=9xh6SmFJPZgi8ngVR-ECTA-kDAAU3DEPLMoUrzVA@mail.gmail.com>
 <CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com>
 <CAK7LNAQtABssBH2LGThgv-F3_aSrz9Hd-ra9Yyu4-FFzY1nsUw@mail.gmail.com>
 <CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com> <CAK7LNAQGHjLYteCt+8BXSY-5CB0gaO1JtHY-SpPFrfdchoHKrQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQGHjLYteCt+8BXSY-5CB0gaO1JtHY-SpPFrfdchoHKrQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 2 Dec 2020 12:13:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=whfP8CBZGVKzuES9wU2BKTEdUTUhMMW-G90vxdMR8Zi0w@mail.gmail.com>
Message-ID: <CAHk-=whfP8CBZGVKzuES9wU2BKTEdUTUhMMW-G90vxdMR8Zi0w@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Emese Revfy <re.emese@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 2, 2020 at 4:54 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Just a nit:
> Now that the test code does not include any header,
> you can also delete
> "-I $srctree/gcc-plugins -I $gccplugins_dir/include"

Ahh,m yes.

It sounds like we might be able to delete the build test entirely if
we just always expect to have a recent enough gcc.

Testing the headers for existence would presumably still be needed,
just to verify "do we have plugin support installed at all".

But I'm not planning on applying this directly - I find the config
overhead to be a bit annoying, but it's not like it is _objectively_
really a problem. More of a personal hangup ;)

        Linus
