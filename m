Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0651B1CFE2E
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 21:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730200AbgELTXr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 15:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgELTXr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 15:23:47 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCEBC061A0E
        for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2020 12:23:46 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u15so1856377plm.2
        for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2020 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X3Opb6arzJwXelkGLAeI5ijV0q+qANDWY75OUMFqdTw=;
        b=uGqh2RXUdJGWl4vM5ngSkKyM33oCzN0D7rcTg3PahkCN5jK46nLHvb81Q6+NXnvJk6
         LjUqly3uQEVD7t/d9EUt+Z7iaEkHN+WWMlSTXWjuF7T5NO3Vib4I2JIS89lpqrhIOx1v
         sZ6h90wKOXIzfl49sNYheDJhejgkqD8GVao4Tj6ExSkA2DfXUIG14pvJ6cAjN5BRDiio
         ZTAS0jFvVdqjYdf2KJ47sIn7LpAQjmJZPfqEEVRzg8PoSIetgsVuPk7fcaaMtmB6wh8e
         HkN3ZzjHFrxeqBOVBc6mAB+pYXi9ZRBkJOaVDiWPHcKMwsPmAd6w8WRR/XXnvj+r2zqs
         HRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X3Opb6arzJwXelkGLAeI5ijV0q+qANDWY75OUMFqdTw=;
        b=P7vue1y50ZPHyLjG6xNE4mFGFkqNINvVjifrILqEoteKkddgCl5oDzwuIEWCqhvuaz
         iywuSSHODJYzPdtpcaPEkCHPNThHaQXKooH7JALvhHB9XxGiDdiVM7T6flb7Qvgdasf7
         i/MMq/Y5oh7rdQw8A+bFUnx4xCzca4nG2+PIXW31LcQLCjUXBmGKFXKbXBj+w18qnuwI
         su7lBEn0031Oua76WyvyL+6Kc7NuPbX32/Mv4nX3EnkvAbRGUwi0b+XBH3vYm0D6EIYb
         wFRcTwdb9B0ez+6mFlPrQv0dzbaxYs2yo+buv+F4zQQvEPFcbGG9DkBYZlbnziWtMj+X
         LVDA==
X-Gm-Message-State: AOAM531A5ullV1cR2ZDCGgCy5prp/QX+1sR8x80/gxywANz1aLCu9LR6
        QbjJQm3QDnqdhWl0RsqwMLInwQOymygWd3cvopmemw==
X-Google-Smtp-Source: ABdhPJxJM3DP8tQlMfcGivh9vfkZm4K3CVXJuLlEPwZAMHaub6Fim/plw5kyQ/IFPpdLRyyZau9KKX5M9Z0ugKluwR4=
X-Received: by 2002:a17:90a:2a4a:: with SMTP id d10mr4799210pjg.32.1589311426080;
 Tue, 12 May 2020 12:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com> <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
In-Reply-To: <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 12 May 2020 12:23:34 -0700
Message-ID: <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nick Desaulniers <nick.desaulniers@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 11, 2020 at 10:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > >On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
> > ><nick.desaulniers@gmail.com> wrote:
> > >>
> > >> As debug information gets larger and larger, it helps significantly save
> > >> the size of vmlinux images to compress the information in the debug
> > >> information sections. Note: this debug info is typically split off from
> > >> the final compressed kernel image, which is why vmlinux is what's used
> > >> in conjunction with GDB. Minimizing the debug info size should have no
> > >> impact on boot times, or final compressed kernel image size.
> > >>
> Nick,
>
> I am OK with this patch.
>
> Fangrui provided the minimal requirement for
> --compress-debug-sections=zlib
>
>
> Is it worth recording in the help text?
> Do you want to send v2?

Yes I'd like to record that information.  I can also record Sedat's
Tested-by tag.  Thank you for testing Sedat.

I don't know what "linux-image-dbg file" are, or why they would be
bigger.  The size of the debug info is the primary concern with this
config.  It sounds like however that file is created might be
problematic.

Fangrui, I wasn't able to easily find what version of binutils first
added support.  Can you please teach me how to fish?

Another question I had for Fangrui is, if the linker can compress
these sections, shouldn't we just have the linker do it, not the the
compiler and assembler?  IIUC the debug info can contain relocations,
so the linker would have to decompress these, perform relocations,
then recompress these?  I guess having the compiler and assembler
compress the debug info as well would minimize the size of the .o
files on disk.

Otherwise I should add this flag to the assembler invocation, too, in
v2.  Thoughts?

I have a patch series that enables dwarf5 support in the kernel that
I'm working up to.  I wanted to send this first.  Both roughly reduce
the debug info size by 20% each, though I haven't measured them
together, yet.  Requires ToT binutils because there have been many
fixes from reports of mine recently.
-- 
Thanks,
~Nick Desaulniers
