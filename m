Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6981EE74F
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 17:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgFDPF7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 11:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728638AbgFDPF7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 11:05:59 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0387EC08C5C0;
        Thu,  4 Jun 2020 08:05:59 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s1so7754701ljo.0;
        Thu, 04 Jun 2020 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+rSrnYLVqsdod0ox2SKtnqs+7zx/Hz4GLO8xy+04nE=;
        b=tiAiD1BqLUtW8rAX1B3Txst9ck1bpANIDb6532CrOzxa8+SYqcQVzMWUIrIqHwfkFH
         PHnApukstTsgqnDgvZmZZF7f0AkvM5cutsl0XcGi2Pbymm48rAjoDeqUP0rQJufNbjNV
         U1DTwg8QQcTfmMvRFRaIc/PUvQCShSldTL5qsURtgnTw2mS3pb1YcCtRkFDi9qkdBmbs
         +w3hI2IMbAuFHS2rWaC6Am5XmtU2osSFlJTcvkeFDjXW3t+Mc804R2xEZJmK3Bg3lazk
         j1hTv/fbOlKG+IG25Puo8o29RBHnfgg8yktHPNROZW7UkPsslMdeaXUYMod2IAvkYUMH
         NIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+rSrnYLVqsdod0ox2SKtnqs+7zx/Hz4GLO8xy+04nE=;
        b=m+OfOsBV4xpQqeyUBg7N11YS2F7QrhVHr5OB3bnKlJEbeQ22v7+OwLJy5wcN3LTpfP
         /1Ezz73rz/cKMCrG9kXFJC83rELzPUrcKjPhsRcIZ3uWMP52OeGt+00A2CNBMjpV07UT
         RyC/mFFAw6YCQ1r67xs8maUDO3+/7ycUDE9PEYlkTvPRvKpS0b3o3KDyqJ4COTwNEXk3
         2jLRc8voQk6qh0Yh0Bc4L+K9N0B+lWW7Bwb/SAZ4Wu9A7w0WrjiABjd0xL7WQQKyCXg8
         rZ5n12Q3BXbBuYy8Vwg21DYxaHNtHWB//q/uqIhTUUGWJiwD37ejAn8CU8qyRP0+aaAu
         rYTA==
X-Gm-Message-State: AOAM530JzP4UPr3wuf7AueAU6I14PfWgdJ5bj3dFG7oGFSPt17cRnqlt
        oo6Hdpcrg6kuiJjb3exEsyVX2CVz5hd5uXIWRWs=
X-Google-Smtp-Source: ABdhPJym59bLbz+stiI4tSpXC23vh9zz45NG9ccDG3uOprvfDj3mzLXeDS2rNjrYy3cjr00XLkkVPcKs0ltgUoq5nkI=
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr2534360ljo.29.1591283157446;
 Thu, 04 Jun 2020 08:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200604134957.505389-1-alex.popov@linux.com> <20200604134957.505389-3-alex.popov@linux.com>
In-Reply-To: <20200604134957.505389-3-alex.popov@linux.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 4 Jun 2020 17:05:46 +0200
Message-ID: <CANiq72nfByD5sO0a2G2hKCPtHgOhdYfFaXcK7pHnxXRGRUUjDQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] gcc-plugins/stackleak: Use asm instrumentation to
 avoid useless register saving
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>, gcc@gcc.gnu.org,
        notify@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Alexander,

On Thu, Jun 4, 2020 at 3:50 PM Alexander Popov <alex.popov@linux.com> wrote:
>
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index cdf016596659..522d57ae8532 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -41,6 +41,7 @@
>  # define __GCC4_has_attribute___nonstring__           0
>  # define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)
>  # define __GCC4_has_attribute___fallthrough__         0
> +# define __GCC4_has_attribute___no_caller_saved_registers__ 0
>  #endif

Nit: if you do another version, please move it before `noclone` to
keep the order (`fallthrough` was added in the wrong place).

Otherwise don't worry, I will sort it together with `fallthrough` when
I send a patch.

> +/*
> + * Optional: only supported since gcc >= 7
> + *
> + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/x86-Function-Attributes.html#index-no_005fcaller_005fsaved_005fregisters-function-attribute_002c-x86
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#no-caller-saved-registers
> + */
> +#if __has_attribute(__no_caller_saved_registers__)
> +# define __no_caller_saved_registers   __attribute__((__no_caller_saved_registers__))
> +#else
> +# define __no_caller_saved_registers
> +#endif

Ditto.

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
