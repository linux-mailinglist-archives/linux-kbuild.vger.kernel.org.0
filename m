Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279F33DB033
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 02:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235364AbhG3ATW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Jul 2021 20:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235214AbhG3ATV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jul 2021 20:19:21 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F4FC061765
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2021 17:19:16 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l4so9857269ljq.4
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2021 17:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdWfDCJ/BnpSi88/sBE0t81V5bfAq7zpAMM0ZeL7bXw=;
        b=BALfDfaIU52dOkdhgi3958ygiyewSiZd/p8RdUrdIdjC7JUVLSCp9mAqns3CxtyQy2
         5/3UMJlV79lCh6/AmihvIf0trZeBHtj0u1ZY/h/U7moLru0kPv1zQx0Y31kegPyqyAqL
         ufFEsb5tdT9yxFSQe7zP5D4pZ21JcFyXueEyrL637FX1N2n6E5boqpbioyyaNljfbFxM
         7T6NbO2kcddZnJwbfeUfO4ooO6V2BSP9Wy/ilwC8qzfVklYMYIkaxzjVJfHQrmkhOdN2
         4lf0lgsHQUCsgdReykUspUj9qS/jnLx39Fh/71sZM7S/8F9l3xrtYnFYAIYk9oetEiYe
         vdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdWfDCJ/BnpSi88/sBE0t81V5bfAq7zpAMM0ZeL7bXw=;
        b=g21blUWtUhJGRV0O8XadD2HWjYToK2U/BwGDtpxoNXv+xYWw6apShEz+vH5qpC/3dV
         gtGeXxfGsi+j99SiO5SqD/yKqXtWPOhAzS9+A9eTtBg8G35INgUSQ+b0DHMcLH98U+6/
         qHUXHluxNhF6+egK0z1kKGbNTiG6TZuINg/YW32qYVDVHgC7rpwgVrMnlsx5+8Od++HJ
         d7fc6wE43m/Ud9X52jilCxMD/jNlelfSneTCZLveAkOqT1kUIesO0f0lT+0tG1MLQhlL
         t9hHLvEOoKBR8GJXPrKixt6zHLseHOsBbg30WaWJ7Y7wWbk7IvuM/aAlb4L5uMuMMPd8
         u5kA==
X-Gm-Message-State: AOAM533dm6poTfR67eNPoj8UnEIqSuw5Y0kO78NaTTP9CW+QI2EPYH96
        ariZbxOiKa2wYeb0HaQyXditXWnqFnZfK6SPFPSl1A==
X-Google-Smtp-Source: ABdhPJwWmH5ArkOIqPVwVZuQtBaUrWYJbCFYb7NadmZtZmLpwGWzD5SzE0Mjkl/u0ZFGg6RB4CGp6ZdoGY6dQ1gaIvU=
X-Received: by 2002:a05:651c:329:: with SMTP id b9mr4549340ljp.116.1627604354847;
 Thu, 29 Jul 2021 17:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210729165039.23896-1-ndesaulniers@google.com>
 <20210729165039.23896-3-ndesaulniers@google.com> <44117d0c-51b7-1f68-f752-ba53de503b14@kernel.org>
In-Reply-To: <44117d0c-51b7-1f68-f752-ba53de503b14@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 29 Jul 2021 17:19:03 -0700
Message-ID: <CAKwvOdm0xs4ikb0K0_b8Az0T=Kxu_-6AHjWHOhjsKZb3hTrH2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 CC=clang LLVM_IAS=1
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 29, 2021 at 2:00 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> While I understand that the LLVM=1 LLVM_IAS=1 case works perfectly fine
> with this series, I am of the belief that making it work for CC=clang
> LLVM_IAS=1 is a mistake because there is no way for that configuration
> to work for cross compiling without CROSS_COMPILE.

So with v3 of this change, rather than:

$ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang -j72

If you wanted to omit CROSS_COMPILE, you'd need:

$ ARCH=arm64 make CC=clang LLVM_IAS=1 LD=ld.lld OBJCOPY=llvm-objcopy
STRIP=llvm-strip

or

$ ARCH=arm64 make CC=clang LLVM_IAS=1 LD=aarch64-linux-gnu-ld
OBJCOPY=aarch64-linux-gnu-objcopy STRIP=aarch64-linux-gnu-strip

That's straight up worse IMO and defeats the purpose of "shortening
the command line," which should be the goal.  Not "making CC=clang
maximally flexible."  We don't want folks generally using CC=clang;
preferably they'd use LLVM=1.  I need to rewrite our docs to make that
more explicit and straightforward.  And if folks would prefer to use
CC=clang for whatever reason, let them explicitly state CROSS_COMPILE
then.

So I agree with Nathan, and hope Masahiro will reconsider that perhaps
the v2 variant that required LLVM=1 maybe makes more sense.

Either way, I need to fix the comment in the new script, commit
message, and docs, so v4 is necessary.

I'm tempted to add a rewrite of our docs to say "just use LLVM=1"
front and center, then get into finer grain details below, moving this
second patch to be the third in a series.  Let's see what Masahiro's
thoughts are though first. (I do appreciate them, even when I
disagree).
-- 
Thanks,
~Nick Desaulniers
