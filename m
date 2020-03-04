Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D214A178815
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2020 03:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387411AbgCDCLT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Mar 2020 21:11:19 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42293 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgCDCLT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 21:11:19 -0500
Received: by mail-pg1-f193.google.com with SMTP id h8so214328pgs.9
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2020 18:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rt5Y6CjiWdPEMugA5HAYufaZHsJJ5Khz6YMhwDYj0u8=;
        b=E5/nlC5F6noM3LAr7LHBxwclPghaTl+9XMAexj/5eZ/ku4DJS/vJ/KQHwGU9AAfdNW
         AXrb2JUBlot7D2rvgXM8VQV8gkItV+9RkAAcvw1YWd9FSllYHWAIk3z9hVTwn41NP7ny
         cczZmHuRwYRR8V/1eyBhOfr63oWunNI5YRH08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rt5Y6CjiWdPEMugA5HAYufaZHsJJ5Khz6YMhwDYj0u8=;
        b=o2xR91nTql8zK4nqMsgptFDM6nJX51OPMktFkGZaqfZbDbMOGr+IhWlbqy+BoO9+q5
         BeQFRVAOymyiu5+tVS/Z459pk5KYZWMj0OaisFI04jnueTetq09ltVHgElCbekMK0eXu
         fzUSWF0PiUDb2Dyxm/5e11hQciMXGjWoE1BcnqIhgSYTlvmUTU/XYruV7pSSgZTOAJ/5
         99Bo8AfYUfj7FOKQePF15SSOu4QCEGcwAsuQdWqwkYIyC2RT5O6fzATtgbDxNf1XcBYL
         oL1gzeHUQz9u0I26iYHq3A/sU9wnfm4QzqVUkh069TOxnrAuXeLR6DR8/zp/JaebzjWf
         x2ew==
X-Gm-Message-State: ANhLgQ1BoebbQjyLihn5Ywxiwa+zD05Z/EyYN55NFPmkTlRGb6KOnSoV
        BhPKskQg5KNWAuifZDpFzrWI4Q==
X-Google-Smtp-Source: ADFU+vu1JdyqwDDPG1P25oqdOG6+XnVmRBU3PqYvGB4n2cjt3qBJeULCjCcl4OCUJu5/D2EQG50qqA==
X-Received: by 2002:a63:d658:: with SMTP id d24mr430043pgj.340.1583287877965;
        Tue, 03 Mar 2020 18:11:17 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f3sm19363907pgg.46.2020.03.03.18.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 18:11:17 -0800 (PST)
Date:   Tue, 3 Mar 2020 18:11:16 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: Remove debug info from kallsyms linking
Message-ID: <202003031758.AE8FEB7@keescook>
References: <202002242114.CBED7F1@keescook>
 <CAEf4BzYrBoQJ1tPMRMQ_-G6e76=zj4zyC=HrY-mxH_9QK65oqg@mail.gmail.com>
 <202003031301.083CF048C2@keescook>
 <CAEf4BzbX-Eo3+DCG4zBMhJtLSZrtp48Z-8SvA8qy-WXA5kjR6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzbX-Eo3+DCG4zBMhJtLSZrtp48Z-8SvA8qy-WXA5kjR6A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 03, 2020 at 01:50:52PM -0800, Andrii Nakryiko wrote:
> On Tue, Mar 3, 2020 at 1:06 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, Mar 02, 2020 at 10:55:04PM -0800, Andrii Nakryiko wrote:
> > > On Mon, Feb 24, 2020 at 9:17 PM Kees Cook <keescook@chromium.org> wrote:
> > > > [...]
> > > > @@ -118,8 +128,9 @@ gen_btf()
> > > >                 return 1
> > > >         fi
> > > >
> > > > -       info "BTF" ${2}
> > > >         vmlinux_link ${1}
> > > > +
> > > > +       info "BTF" ${2}
> > >
> > > Any reason to exclude linking from "BTF" step? It's still a part of
> > > BTF generation, so seems fair to have BTF encompass both vmlinux
> > > linking and BTF generation/deduplication?
> >
> > I'm not sure I'm following what you're saying here. If you're asking why
> > BTF linking is separate from the final vmlinux link, it's because of how
> > kallsyms is generated. Currently it's using a rather brute-force
> 
> No, I meant that you moved `info "BTF"` to after `vmlinux_link` call,
> which will make it appear (from make output) as if BTF generation
> phase is shorter than it is. No big deal, was just wondering if it was
> done on purpose.

Oh! Yes. I changed the reporting in commit 8959e39272d6 ("kbuild:
Parameterize kallsyms generation and correct reporting") so that
vmlinux_link reports the "info LD ..." line instead of each of the callers.

This current patch adjusts it so "info BTF ..." is reported for the BTF
generation stage (right now there's no delay between "info BTF ..." and
"info LD ...", and it looks like the "info LD" stages takes way too
long. ;)

> > approach to figure out exactly where everything is going to be in the
> > final link, and for that it need to have both the BTF symbols present
> > and the kallysms symbols present. So, unfortunately, each needs to be a
> > separate step. I spent some time trying to merge BTF and kallsyms phase
> > 1, but I didn't find a viable solution. I'm *sure* there is a better way
> > to handle kallsyms, but I haven't had the time to really investigate it.
> > I think it would require some close coordination with linker behavior
> > changes...
> >
> > >
> > > >         LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${1}
> > > >
> > > >         # dump .BTF section into raw binary file to link with final vmlinux
> >
> > BTW, in looking at BTF generation, why is this cut up into three steps:
> > pahole, objcopy, objcopy... shouldn't pahole just gross an output method
> > to dump the final .o file? That would be MUCH nicer. Especially since
> > the first step ends up rewriting (?!) the original ELF. This is a lot of
> > needless IO...
> 
> Just mostly historical reasons, that was the interface pahole already
> supported. I agree that it's a good idea to teach pahole to just emit
> a binary BTF section dump.

/me adds it to giant TODO list ;)

-- 
Kees Cook
