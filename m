Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428DC18E61
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 18:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfEIQro (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 12:47:44 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39339 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfEIQro (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 12:47:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id w22so1499286pgi.6
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uYk0Stib1S6j7rRokCo3UxF4SoOnEStXPt0j/utJxV0=;
        b=apbaedw7M3uODDt+dMyXOD59+2L9ZFxx145owoGc17moNv28ZyB9a7MDYB5LqCF11l
         MZy5qsnipC/b7MVbqq3eq7V/2F9EASd4be3S8GNhcibsMo7I1FoN0TwHYwWlEL/yyjLR
         KHakab3lnLuooKPYxwuRiyhoSZPRdWRVRQlVyHHxhVDjf5fyqU6mm+FFVEKtt0+Szw3B
         2r65R9+QP6FN5kVPTI9B9oEcXi1BGy/M17Z7kKmBe1nk2o2YenMGeFZ6uILArU8mWJSo
         /a8uFxnkRtS5UiUZ7qX5YrwNfvFQklDRF9yXvmymrnR9lYEojnPA203uRwGF5H178Vbu
         slDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uYk0Stib1S6j7rRokCo3UxF4SoOnEStXPt0j/utJxV0=;
        b=VZFoLbRSOa6+jVBXDqELXfCT2BfsmOC4cwM3iBiNAbDxvutn8gC0/5ZyFNMkY4koL+
         aLHDehBG4gn8GlxU/OqW7XN2iDAbAixW2coBdmCuOD7u78JahnKM4bAPU2zR82fFrlJ8
         KKhtEc+AIfcs9+x2a3hxP3Ovs/mBANsyharh272FLdsjMcmmpTkqcIk0O+GmQPaDvqnk
         xYlOvTzpBj7fF+tLW2ONnJE27ELzrDwo85/qKQRExBq+ALstOiLpkoeE0UVe8nFY225M
         LJkyntRGqCisW3xyZjire7J3zJwDxgpkjtxobyufN7scy7GBZskdX64/uwn9DYSzwz1Z
         DhTA==
X-Gm-Message-State: APjAAAX1DUN4IZ49fOAqmSF4cY6xc8z73vbxy9ZLccjuVxhxwR2V+pMH
        eLFTDVxhhVE4VY8ejMZulIuOSt6ZLpJIJeqZ4mO4EQ==
X-Google-Smtp-Source: APXvYqxz7AitnE/CkDlINuSoVj5oxFBdCUXYpflrpL6vQ9L7ZNgSfzm3dvjnidI4LoyVJ2BxlQxHzXN2Rtp0nIEyhXs=
X-Received: by 2002:aa7:8096:: with SMTP id v22mr6717172pff.94.1557420463262;
 Thu, 09 May 2019 09:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064635.1445-1-yamada.masahiro@socionext.com>
 <CA+icZUV03ZF_FWMMyY=36-zQZPWO0YUBuSs9bjQqpmXJzVYYRA@mail.gmail.com> <CAK7LNATgQaHU+6WiMvx0AAf=9AJ5nrL8f8=SJMOCJNQNb_=X1w@mail.gmail.com>
In-Reply-To: <CAK7LNATgQaHU+6WiMvx0AAf=9AJ5nrL8f8=SJMOCJNQNb_=X1w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 9 May 2019 09:47:32 -0700
Message-ID: <CAKwvOdn7bUOeiE8LobyENmPvYGO3j7rt1N+Ht7tcDWaOBuHhdg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add some extra warning flags unconditionally
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        chromeos-toolchain <chromeos-toolchain@google.com>,
        Android-LLVM <android-llvm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>
> On Thu, May 9, 2019 at 4:11 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > BTW, is this a speedup when doing CC/LD FLAGS etc checks unconditionally?
>
> Yes.
> cc-option is somewhat costly because it invoked the compiler to
> check if the given flag is supported.
>
> So, I want to get rid of as many cc-option calls as possible.
>
>
> > Asking in general - do you have any numbers :-)?
>
> Removing a couple of cc-options does not make
> a measurable difference in general use-cases.
>
> But, this might be more beneficial for chrome OS
> because $(CC) is a wrapper and invoking it is much more expensive.

Android does too, which we plan on removing as we recently measured
the performance cost of 5% for having a Python wrapper to aid in
bisection.

Anyways, I checked these options with clang 4 and gcc 4.6.4 in godbolt.
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
