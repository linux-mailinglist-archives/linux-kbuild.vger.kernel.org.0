Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 523B0A04A5
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 16:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfH1OTF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 10:19:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32927 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfH1OTF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 10:19:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id u16so19665wrr.0;
        Wed, 28 Aug 2019 07:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Seb53bhrV9qLT1s/qYvDSSQVj25Xuijj2Bv+NVJgBcQ=;
        b=XgVEVqMVsvRENk3CCBT1mQR1Ab+6FMr79DZ9YVtgGtYU1bOtezE4qtpsrhQvnbIx6M
         EAaJnNI4xc2EyyG/cu/kk5ALWTiLCptpNiKzo0kSsonP62YYUeRamv2GUtCQ98dln+KV
         E0aYIUKAHsQvPhGQvVohJSbp9GhD5QlM+tmhS/tsE4afMLhFYNA+4tWL32fMb/PUVfTv
         P4GvqdOpXcYZ0dzWaTAusKUPLp5pAFomAvX3lvChMOC6RFZRz+/h0mYIVAlbIFgpj/+l
         Awdy/eF3QXj9LcHpWtJqHg/p1885BDn8sz8QCjpbF30hJDJptdk6NY9b/vb5hNQdLvAy
         D3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Seb53bhrV9qLT1s/qYvDSSQVj25Xuijj2Bv+NVJgBcQ=;
        b=SpcryJ7FgmBpQmPW3UAymRN2/6DAz4yio699oqU1QMRHwccr2UAL30V/uROPUeJogP
         E2a1R4oG5qY/LSXsMvJ0Pmm2WUW6iX4B3qtYh4t5nVyxpDjn7r5Jg0zwuq2QPOfzRSA2
         IqoOZcOx3SiB8kilggCfiiCSbDL0DYnW94K9Q1j8506VI3isK9+MA+TWsNCoHCqiGv7V
         ab6u+rze8mUi/4Uer+LRKzGResVxSCG0jcqozlw4iUnAzcojzr7wkzZYCSBtUV9zE7D9
         hljicYB3h+GDZSUFkMiYg0+aFSJBa/1HTDL4uwFIp7sJY0s1j4uR0Mdq/iWVGKWf2zHm
         Ie9g==
X-Gm-Message-State: APjAAAWnZ/zCPiY+oKPEqtDaiAkDYyipBoh5A0qnidyY1cl8b0VqTFC1
        07PVZ8E1oo9QAkx0Js6AvENgk28HibSMmkgM1fM=
X-Google-Smtp-Source: APXvYqxeKif+VQwDRwK/EPQRG6U/V2qjCYPmjzlqT9bh1+ZpVCn8SHoVNLZpQocB1u/GulTYG+opibNwZwstIsxgBnc=
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr4682010wrw.353.1567001943244;
 Wed, 28 Aug 2019 07:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com> <CA+icZUWigJkh-VtJc4=xE06oMgE=ci2Mfdo2JaDv0fth8PKH+A@mail.gmail.com>
In-Reply-To: <CA+icZUWigJkh-VtJc4=xE06oMgE=ci2Mfdo2JaDv0fth8PKH+A@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 28 Aug 2019 16:18:51 +0200
Message-ID: <CA+icZUUhhOLfOgwoKP4nKOdPakNJF7XafJ09ERP6r7dOUduMsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 28, 2019 at 9:20 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 7:55 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Instead of the warning-[123] magic, let's accumulate compiler options
> > to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
> > easier to understand what is going on in this file.
> >
> > This commit slightly changes the behavior, I think all of which are OK.
> >
> > [1] Currently, cc-option calls are needlessly evaluated. For example,
> >       warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
> >     needs evaluating only when W=3, but it is actually evaluated for
> >     W=1, W=2 as well. With this commit, only relevant cc-option calls
> >     will be evaluated. This is a slight optimization.
> >
> > [2] Currently, unsupported level like W=4 is checked by:
> >       $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
> >     This will no longer be checked, but I do not think it is a big
> >     deal.
> >
>
> Hi Masahiro Yamada,
>
> thanks for your patch series.
>
> If KBUILD_ENABLE_EXTRA_GCC_CHECKS does extra(-warning)-checks for GCC and Clang,
> please rename the Kconfig into...
>
> KBUILD_ENABLE_EXTRA_CC_CHECKS
>
> ...or something similiar (and maybe with some notes in its Kconfig help-text?).
>

I have tested both patches against recent kbuild-next and can boot on
bare metal with clang.

I have *not* passed any W= to my make, but I see that clang's W=1
kbuild-cflags are active.

[ scripts/Makefile.extrawarn ]

ifeq ("$(origin W)", "command line")
  export KBUILD_ENABLE_EXTRA_GCC_CHECKS := $(W)
endif

#
# W=1 - warnings that may be relevant and does not occur too often
#
ifneq ($(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
[ ... ]
KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1

else

# W=1 also stops suppressing some warnings

ifdef CONFIG_CC_IS_CLANG
KBUILD_CFLAGS += -Wno-initializer-overrides
KBUILD_CFLAGS += -Wno-format
KBUILD_CFLAGS += -Wno-sign-compare
KBUILD_CFLAGS += -Wno-format-zero-length
endif # CONFIG_CC_IS_CLANG

endif # KBUILD_ENABLE_EXTRA_GCC_CHECKS

These clang KBUILD_CFLAGS are active independently of passing W=1.

$ grep '\-Wno-initializer-overrides'
build-log_5.3.0-rc6-2-amd64-cbl-asmgoto.txt | wc -l
27195

So the above comment is misleading?

Is W=1 activated by default?

Or do I miss something?

[ Documentation/kbuild/kbuild.rst ]

KBUILD_ENABLE_EXTRA_GCC_CHECKS
------------------------------
If enabled over the make command line with "W=1", it turns on additional
gcc -W... options for more extensive build-time checking.

What about?

KBUILD_CC_EXTRA_CHECKS (or KBUILD_EXTRA_CC_CHECKS)
------------------------------
If enabled over the make command line with "W=...", it turns on additional
compiler warning options like -Wmissing-declarations for more extensive
build-time checking. For more details see <Documentation/kbuild/kbuild.rst>.

W=1 - warnings that may be relevant and does not occur too often
W=1 - also stops suppressing some warnings
W=2 - warnings that occur quite often but may still be relevant
W=3 - the more obscure warnings, can most likely be ignored

- Sedat -
