Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424F63EDCD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 20:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhHPSHk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 14:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhHPSHk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 14:07:40 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EAFC061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 11:07:08 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id g26so6994778ybe.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 11:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=33dTcPj9L2G+RiKdxFTGDEqQpLqBfKgRb9SoQPYPLpo=;
        b=VSWUay3SY15/4NGBWoTChPwDd8ujDO9Higioy3JypbcqKCd0muev0p6XdXyxEwUZVn
         uKgSYwgM98pbBN/5NVqZHMNTXDUsa7Om5jGYlpjssksxGrct/ihvltgP/uL0wRiXihQh
         utTideL2Ooc5wfnb9Fv6fzQAYvwAJBGaiZavVhZBU1xWmkFShJhyVxaIfm2JAvt6sdsJ
         q7IQoqe2TSV/f5zZRF3lDoOAcsNIFkxaBNce0kP1iZDah/5TxMk1N1Ejzb65voAamF47
         +jYW6wz2jrCtI+fAwY5Yvec9iKYgFyUwT1Q1wNUuJiWZG2zzLkn2lL88MfYUykOmPpC9
         JJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=33dTcPj9L2G+RiKdxFTGDEqQpLqBfKgRb9SoQPYPLpo=;
        b=AjTMKwVBIoG472ds/Gz6ht6B2xtYL+1PBEK5wHcbEwS6om6tfGIA5DwgWFsjG2B2Mp
         S1isVTBPARZJLmREDdBAUNEpvb9MCHFffjAmd0orN9lPySiCt6nPUK5n6pX9+An6Qx1b
         F6yP2/liOFNSOmSyDoniLsQZHI+n+jqmXT+9XszwS83vO7e0ovv103WJs8wgn0Oj2TzV
         q+odXrqrHOdmAzAdi/vNo66O2342JvRPsA5R1hAc97DyW/qZQ3any09eKPw4/Fg04p2W
         xHK8jKRAXI+gciRcmz8bTGjF9JjjzDyPWCBAkrnzL2w5RXkHXavUd56EKT8QVPKoj63q
         Kb2g==
X-Gm-Message-State: AOAM531RwPrkLFOo6SyehmoDd3KngfzffulTl8OGxrdqyshBOYa/J/II
        A8J5QSuewmSFT7NS94YkxFIWrDID24dCoyW9ETvIEw==
X-Google-Smtp-Source: ABdhPJyVkuwrdgobTNu4kxdPgWfK7qHvFVtdQhFN9x12wS3JBVRcN+l90XrQT/bDKLNpqJbOomcXymVHho5i6gjKmOE=
X-Received: by 2002:a25:c4:: with SMTP id 187mr24437571yba.498.1629137227399;
 Mon, 16 Aug 2021 11:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210812214614.1797845-1-samitolvanen@google.com> <CAK7LNAQ8Ucg=ZrEtMUCMkq3wonZqaijtrqbeUBod6DLERrp=zw@mail.gmail.com>
In-Reply-To: <CAK7LNAQ8Ucg=ZrEtMUCMkq3wonZqaijtrqbeUBod6DLERrp=zw@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Mon, 16 Aug 2021 11:06:56 -0700
Message-ID: <CABCJKucbKVFvOmo6AsJBQfxL0zO3N9R2ydoCvZKpTwPSbOvbkA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Alexander Lobakin <alobakin@pm.me>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 14, 2021 at 4:27 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Aug 13, 2021 at 6:46 AM 'Sami Tolvanen' via Clang Built Linux
> <clang-built-linux@googlegroups.com> wrote:
> >
> > With CONFIG_LTO_CLANG, we currently link modules into native
> > code just before modpost, which means with TRIM_UNUSED_KSYMS
> > enabled, we still look at the LLVM bitcode in the .o files when
> > generating the list of used symbols. As the bitcode doesn't
> > yet have calls to compiler intrinsics and llvm-nm doesn't see
> > function references that only exist in function-level inline
> > assembly, we currently need a whitelist for TRIM_UNUSED_KSYMS to
> > work with LTO.
> >
> > This change moves module LTO linking to happen earlier, and
> > thus avoids the issue with LLVM bitcode and TRIM_UNUSED_KSYMS
> > entirely, allowing us to also drop the whitelist from
> > gen_autoksyms.sh.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1369
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Reviewed-by: Alexander Lobakin <alobakin@pm.me>
> > Tested-by: Alexander Lobakin <alobakin@pm.me>
> > ---
> > Changes in v3:
> > - Added missing FORCE.
>
>
>
> All the modules are recompiled every time.

Oops, .lto.o is missing from targets still, which breaks if_changed.
Fixed in v4. Thanks for testing!

Sami
