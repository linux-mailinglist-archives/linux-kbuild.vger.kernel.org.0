Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE1E178988
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2020 05:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgCDE3w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Mar 2020 23:29:52 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46759 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgCDE3w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 23:29:52 -0500
Received: by mail-qk1-f195.google.com with SMTP id u124so344048qkh.13;
        Tue, 03 Mar 2020 20:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t1NqEPmPFW/DQNPAWKwqQ6I4sp3jdBpQkWn1PXctu8E=;
        b=DXgwLsqDtpKJ4F4VO/7EJnfi3ZX4uTj2MWLSzNtUxeZvEW+nIYtmQaoVbZ6HYvy9UH
         hf6mjQCLaWx+PqnNLgCe3TU6Pb77Z+9iIjncAVa32xBFhTlbXsdYDJHr42HHRvjDoRm3
         zi8TsBUyVwHZdsCdQ77HIW/TwpxpP3m4PHxJxVVaAdLlrpheevBptJijdw6BdofsCE9h
         XjzcVUgrQP04zgYKTtYT9MGIdp7rsfiyqJ8Y5YV4Ed/3V9qMv0B/fPnWr9trCtAoEFnQ
         D5RGBnKHj+SRVpJDCCUsBo7WD5zQG8z/nBhMlQwywXU0dBM5gCPU6NaFoa8BNUlAR8An
         0WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t1NqEPmPFW/DQNPAWKwqQ6I4sp3jdBpQkWn1PXctu8E=;
        b=mgvB/lhXN7UnXBqzwIWpjzMWfVLeIEdO9mSlTsAVY3w0rZKuUSMq9otw9f90YEjSPL
         iaVfh7833k4S2Sw0DzklK0ZtU6vp1CtTHiI1Mg8oiRnqSsJQgIpX923lYhPtAycu9ldj
         1y8wiUrYgG1ix18qSg40FduZQ8i9uAH/2v0Zabb/AnAE2nCOtc4smhxdfWT+jh7X/2uT
         CG6BfMZSxRGJZSehYarvusZrj5a0zQD23bmnMZZASKcDyo3JPtVGUL2PpYBIvJtYxalV
         IWXpxDTPVzNcLrZD0sre89XjGx1HD5Az5hzZaneElWQJ1Vy0+GwykbGxky8VwFxZEff6
         5w1Q==
X-Gm-Message-State: ANhLgQ05ixYNdcbH2ILoDRqG0BHpaneexPNm3AsD5k60Tj2zJHw84KwA
        krasnjx4YdA1dIa82yapCMaplYUNuxaZozfm87KeOlU0CCo=
X-Google-Smtp-Source: ADFU+vuZFxFnIIMAjlmtqfuIcb7FLGdjsdyyJ54YCoOI+LDTc/E2ZLGK6WHe7Skm6Ar1AL6PvzXr2IZGnIOVMxMYcrk=
X-Received: by 2002:a05:620a:99d:: with SMTP id x29mr1243671qkx.39.1583296190999;
 Tue, 03 Mar 2020 20:29:50 -0800 (PST)
MIME-Version: 1.0
References: <202002242114.CBED7F1@keescook> <CAEf4BzYrBoQJ1tPMRMQ_-G6e76=zj4zyC=HrY-mxH_9QK65oqg@mail.gmail.com>
 <202003031301.083CF048C2@keescook> <CAEf4BzbX-Eo3+DCG4zBMhJtLSZrtp48Z-8SvA8qy-WXA5kjR6A@mail.gmail.com>
 <202003031758.AE8FEB7@keescook>
In-Reply-To: <202003031758.AE8FEB7@keescook>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Tue, 3 Mar 2020 20:29:39 -0800
Message-ID: <CAEf4Bza31J_3Puwf7gnq0jDYRH2_JkRM9L+PO8dFrCzp+==8Lg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove debug info from kallsyms linking
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 3, 2020 at 6:11 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Mar 03, 2020 at 01:50:52PM -0800, Andrii Nakryiko wrote:
> > On Tue, Mar 3, 2020 at 1:06 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Mon, Mar 02, 2020 at 10:55:04PM -0800, Andrii Nakryiko wrote:
> > > > On Mon, Feb 24, 2020 at 9:17 PM Kees Cook <keescook@chromium.org> wrote:
> > > > > [...]
> > > > > @@ -118,8 +128,9 @@ gen_btf()
> > > > >                 return 1
> > > > >         fi
> > > > >
> > > > > -       info "BTF" ${2}
> > > > >         vmlinux_link ${1}
> > > > > +
> > > > > +       info "BTF" ${2}
> > > >
> > > > Any reason to exclude linking from "BTF" step? It's still a part of
> > > > BTF generation, so seems fair to have BTF encompass both vmlinux
> > > > linking and BTF generation/deduplication?
> > >
> > > I'm not sure I'm following what you're saying here. If you're asking why
> > > BTF linking is separate from the final vmlinux link, it's because of how
> > > kallsyms is generated. Currently it's using a rather brute-force
> >
> > No, I meant that you moved `info "BTF"` to after `vmlinux_link` call,
> > which will make it appear (from make output) as if BTF generation
> > phase is shorter than it is. No big deal, was just wondering if it was
> > done on purpose.
>
> Oh! Yes. I changed the reporting in commit 8959e39272d6 ("kbuild:
> Parameterize kallsyms generation and correct reporting") so that
> vmlinux_link reports the "info LD ..." line instead of each of the callers.
>
> This current patch adjusts it so "info BTF ..." is reported for the BTF
> generation stage (right now there's no delay between "info BTF ..." and
> "info LD ...", and it looks like the "info LD" stages takes way too
> long. ;)

Ah, I see, got it!

>
> > > approach to figure out exactly where everything is going to be in the
> > > final link, and for that it need to have both the BTF symbols present
> > > and the kallysms symbols present. So, unfortunately, each needs to be a
> > > separate step. I spent some time trying to merge BTF and kallsyms phase
> > > 1, but I didn't find a viable solution. I'm *sure* there is a better way
> > > to handle kallsyms, but I haven't had the time to really investigate it.
> > > I think it would require some close coordination with linker behavior
> > > changes...
> > >
> > > >
> > > > >         LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${1}
> > > > >
> > > > >         # dump .BTF section into raw binary file to link with final vmlinux
> > >
> > > BTW, in looking at BTF generation, why is this cut up into three steps:
> > > pahole, objcopy, objcopy... shouldn't pahole just gross an output method
> > > to dump the final .o file? That would be MUCH nicer. Especially since
> > > the first step ends up rewriting (?!) the original ELF. This is a lot of
> > > needless IO...
> >
> > Just mostly historical reasons, that was the interface pahole already
> > supported. I agree that it's a good idea to teach pahole to just emit
> > a binary BTF section dump.
>
> /me adds it to giant TODO list ;)
>
> --
> Kees Cook
