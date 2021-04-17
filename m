Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033A536323F
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 22:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236977AbhDQUmp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 16:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235701AbhDQUmp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 16:42:45 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5DEC061574;
        Sat, 17 Apr 2021 13:42:18 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id x11so32326844qkp.11;
        Sat, 17 Apr 2021 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OZCtjiq+TtU/bYufAUJ9Epcxe9a/rj8c4fRa7cPGESQ=;
        b=sRIJWUQJCJHm1AgfHoVzpSm2+ctHS3onk4geU5ZUT4Wp4KAj/7G8E1vOgdksPWJ81C
         x52RqNX6MMn/m3FYxxEB6W2Bf39Ac8hfTwoz1/UWitwXStiX9IZ82ZTmWGiBQc1zjoCm
         s/824dSaxocpj4j+A6VW7KUmR8O5rXhrLAkxxGQhIYwxV0EJb24Xc8XJMeTSmb0flKJv
         fhulQcXETgkQD5qLqRsklUDpIbmNJ6AlfyPRBbweimybi4xT6TME/CE6lVr1f1N/Im3z
         euPHbQrKvbY33BHboJs0KPmOrb/SKdHhrf1smSUhIbEjbd1SgVKQwxqBV21GI3cp3HzI
         i7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OZCtjiq+TtU/bYufAUJ9Epcxe9a/rj8c4fRa7cPGESQ=;
        b=IbB36w/S/f1anwz/ZZ+1U8byhGS8MuMBL6H9x4spsPbXSp7n+LG92bPstfuj0swIrB
         xa7lOQdHiJ9cgZzCWxNw4sEzJKIwE7GyNXRANOusdhBKn5+pgCCv90Ma4pl8DkyaYWPl
         wdtjms5r9lQKRZ12kbdanXtIVydYRG5rIsZWpxluu+pyPo/ubFjwfQwobR15uQLv4U7J
         p2hb0fjlEMZ4qnMYWz5SZLTap62ebU4G7Uo8/zk6vhIfKdV194uKuqti2M4anWlXROuw
         H/Vu5R+77i7d9m3DKxddosPnovGBxigmsKWo5i8HbMv9aIRnFK0H1a9BiykMMggzF0fO
         8RqQ==
X-Gm-Message-State: AOAM5332UXEldwlTDivZ0s9KAy09RZrAGjgH/QGeJJpon/hP631g9MVk
        gBCthJcwNU0xR7lCseZ26FICeroCdM4+JzykCSeB/KzuKGM=
X-Google-Smtp-Source: ABdhPJxj8ZqgeeFDnsLsol2Yd3RPg4w95egRHZO8Mm8mIcbSu6V7oOyioYQwldxWWQ8xgWJFjyW2sdevdr6SNCh3F4M=
X-Received: by 2002:a37:9c4b:: with SMTP id f72mr5310531qke.237.1618692137593;
 Sat, 17 Apr 2021 13:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
From:   Richard Weinberger <richard.weinberger@gmail.com>
Date:   Sat, 17 Apr 2021 22:42:06 +0200
Message-ID: <CAFLxGvzzmytRewN+tnepyKDY6f1yYUUtXVtnV+ozDzdfOwVN6g@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 2:41 AM <ojeda@kernel.org> wrote:
> Regarding compilers, we support Clang-built kernels as well as
> `LLVM=1` builds where possible (i.e. as long as supported by
> the ClangBuiltLinux project). We also maintain some configurations
> of GCC-built kernels working, but they are not intended to be used
> at the present time. Having a `bindgen` backend for GCC would be
> ideal to improve support for those builds.

Sp this effectively means gcc is a second class citizen and even if
gcc is supported
at some point one needs a super recent gcc *and* rust toolchain to build
a rust-enabeled kernel?
I understand that this is right now not a big deal, but as soon a
non-trival subsystem
is rust-only people are forced to upgrade.

Don't get me wrong, I'm all for having rust support in Linux.
But I'm a bit worried about new dependencies on compiler toolchains.
As someone who works a lot with long supported embedded systems I learned that
as soon an application gains a hard dependency on clang or rust I'm in trouble.

-- 
Thanks,
//richard
