Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1286178512
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2020 22:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgCCVvF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Mar 2020 16:51:05 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:38306 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgCCVvF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 16:51:05 -0500
Received: by mail-qv1-f67.google.com with SMTP id g16so63704qvz.5;
        Tue, 03 Mar 2020 13:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xky47bVPzg5Gl/0BGZMbvIE/TEeUaGB5mMzvY0QEU7Y=;
        b=PTUUzihwL3qO9sZetyfxD9eyNpBmcTkVaplWkwbDcPZ5gHHqwiV8ulscpDLg7ANjwP
         d7od1VptGo3sJp5yCHoB5tkozmVffqFzrECuVWK9DrmQKKl3MAwg/Av/2FO7pZf46b3p
         P3jRWU7g9BYy2xyx0IgmEZuakR4S7a0NDMK1BODWsmpgfAQul84NUIhK+0IyA3zh09Ii
         VQP+UJeKVNQE80/iu8qNT8p+PFkSHvTxsE3lF/BY84Q1+LRzS00H52vhTmGf7kJ0JyIs
         xJUpVcfjiyuxO60g4XeG8sgMudoIzrAQ/bV3dS3YkSRzX1L7D2R3RJdwOsSkCQDr9GNQ
         t6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xky47bVPzg5Gl/0BGZMbvIE/TEeUaGB5mMzvY0QEU7Y=;
        b=mimhxlgq8x4RlG6NDtkI0s+yPRB4KygklM5FjkAhUVYpncJ/LUB9OU7SGTQcumKflB
         eeldJHfnHCuxnNJUZ+W/Lhsp2Tezur8y7cPbUvZp6zagt1AV3p/gOiXSPENk2MTpWAxi
         hnVCHp4WrRUSmhA6jef9OHQV4LUsKdg22/oSUrPtUdiI3Kteu1WF0/aqIW606IBojg09
         mxxWHChF2wlXkBgt5eaqE7pww3zsxzKYv6e/J6IUaxexn46/iIPPgJVnpTSDeXXGTrD6
         gxFKjGpamD8rQHwIOX/alyoCD4aHE5Vep0RMUcgDT37hJLDp5ZbKuDrDoaBQHG2VQSsb
         CrOg==
X-Gm-Message-State: ANhLgQ0QgtnrY3Wj2sZ4ZLMTzJcI3gazh5aHp/URQi0pscsOQ9WfYq6u
        qomsp/sqQpJlOTzrJ7IwI2a/yUqiWMQqbDTaC40=
X-Google-Smtp-Source: ADFU+vsdKjbZxNp5m/Awru50Bmk3pJ3pvRLGW1OO4O+l6EyAfaqQBBE95210BIbS/fZXMb5jErVFre4ZrXFdgYLH2B0=
X-Received: by 2002:ad4:4993:: with SMTP id t19mr5833155qvx.224.1583272264109;
 Tue, 03 Mar 2020 13:51:04 -0800 (PST)
MIME-Version: 1.0
References: <202002242114.CBED7F1@keescook> <CAEf4BzYrBoQJ1tPMRMQ_-G6e76=zj4zyC=HrY-mxH_9QK65oqg@mail.gmail.com>
 <202003031301.083CF048C2@keescook>
In-Reply-To: <202003031301.083CF048C2@keescook>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Tue, 3 Mar 2020 13:50:52 -0800
Message-ID: <CAEf4BzbX-Eo3+DCG4zBMhJtLSZrtp48Z-8SvA8qy-WXA5kjR6A@mail.gmail.com>
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

On Tue, Mar 3, 2020 at 1:06 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Mar 02, 2020 at 10:55:04PM -0800, Andrii Nakryiko wrote:
> > On Mon, Feb 24, 2020 at 9:17 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > When CONFIG_DEBUG_INFO is enabled, the two kallsyms linking steps spend
> > > time collecting and writing the dwarf sections to the temporary output
> > > files. kallsyms does not need this information, and leaving it off
> > > halves their linking time. This is especially noticeable without
> > > CONFIG_DEBUG_INFO_REDUCED. The BTF linking stage, however, does still
> > > need those details.
> > >
> > > Refactor the BTF and kallsyms generation stages slightly for more
> > > regularized temporary names. Skip debug during kallsyms links.
> > >
> > > For a full debug info build with BTF, my link time goes from 1m06s to
> > > 0m54s, saving about 12 seconds, or 18%.
> > >
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> >
> > I've tested locally, seems to be generating BTF properly (I haven't
> > timed anything, though). See nit below, but otherwise:
> >
> > Acked-by: Andrii Nakryiko <andriin@fb.com>
>
> Thanks!
>
> >
> > >  scripts/link-vmlinux.sh | 28 +++++++++++++++++++---------
> > >  1 file changed, 19 insertions(+), 9 deletions(-)
> > >
> >
> > [...]
> >
> > > @@ -106,6 +114,8 @@ gen_btf()
> > >  {
> > >         local pahole_ver
> > >         local bin_arch
> > > +       local bin_format
> > > +       local bin_file
> > >
> > >         if ! [ -x "$(command -v ${PAHOLE})" ]; then
> > >                 echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
> > > @@ -118,8 +128,9 @@ gen_btf()
> > >                 return 1
> > >         fi
> > >
> > > -       info "BTF" ${2}
> > >         vmlinux_link ${1}
> > > +
> > > +       info "BTF" ${2}
> >
> > Any reason to exclude linking from "BTF" step? It's still a part of
> > BTF generation, so seems fair to have BTF encompass both vmlinux
> > linking and BTF generation/deduplication?
>
> I'm not sure I'm following what you're saying here. If you're asking why
> BTF linking is separate from the final vmlinux link, it's because of how
> kallsyms is generated. Currently it's using a rather brute-force

No, I meant that you moved `info "BTF"` to after `vmlinux_link` call,
which will make it appear (from make output) as if BTF generation
phase is shorter than it is. No big deal, was just wondering if it was
done on purpose.

> approach to figure out exactly where everything is going to be in the
> final link, and for that it need to have both the BTF symbols present
> and the kallysms symbols present. So, unfortunately, each needs to be a
> separate step. I spent some time trying to merge BTF and kallsyms phase
> 1, but I didn't find a viable solution. I'm *sure* there is a better way
> to handle kallsyms, but I haven't had the time to really investigate it.
> I think it would require some close coordination with linker behavior
> changes...
>
> >
> > >         LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${1}
> > >
> > >         # dump .BTF section into raw binary file to link with final vmlinux
>
> BTW, in looking at BTF generation, why is this cut up into three steps:
> pahole, objcopy, objcopy... shouldn't pahole just gross an output method
> to dump the final .o file? That would be MUCH nicer. Especially since
> the first step ends up rewriting (?!) the original ELF. This is a lot of
> needless IO...

Just mostly historical reasons, that was the interface pahole already
supported. I agree that it's a good idea to teach pahole to just emit
a binary BTF section dump.

>
> --
> Kees Cook
