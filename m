Return-Path: <linux-kbuild+bounces-2219-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8D490E302
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 08:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 188821C20BEC
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 06:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BE418028;
	Wed, 19 Jun 2024 06:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aU0eoeLh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BDB4A1D
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Jun 2024 06:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718776994; cv=none; b=u+4DcRaZMRECijtyhdT2bLjcOsxX3SW8mLT8y0dYJX9k1M983oN3HJvmdQ+WWv5GUdCmuAzEKJzhqLZkc3AHFoNHwJSO1rqxxvB0cvBu9jEE260S54DTPy9FJ8KUzBzdsshwKNhb69FRzuwk0SXQBcVBc7AEujnbW9V5L1FD+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718776994; c=relaxed/simple;
	bh=5hpz5uUYfOoq1EivL6iFSrUDuwZN4ebrRKdj9q0sVDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPbWuX6sKft/tmSKrk4NbQVvaMAhc/kG87qBBEwzaMFRGo3K7mPdzzxizKTGC1GZNRvfS1+w8VgbPMuoVpwN93M4wokUC4anYUnltRLH6sfjptW/2zCOhJSKCjoZtuTK3hBV89qDIaNkQ95u7V7AEUtLUAgs6zbpBMetYUucK5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aU0eoeLh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170E4C4AF49
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Jun 2024 06:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718776994;
	bh=5hpz5uUYfOoq1EivL6iFSrUDuwZN4ebrRKdj9q0sVDI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aU0eoeLhcjmGxZjcG6oAeRN0AfVgX3OOISLyIBQCrjwgRHiw9gNjCio2fvQ9l8olH
	 N0DfSzaoEBpd5zoIXh7Qh4iDizBNHOv+nDNZY61zHDXnul5ssgSzRPFumZ7U9QmDZC
	 jmq+IaKZ5oyARq0gbFYb9ce9o8xIsxtd0/3IYosY3GBiHi9RuDqO/5PzZHZ2kkHNXn
	 G6m4LMRo1V10rhtjGkFCkVlcgyxyaSHOYm0va6Fwh9dwNN9QN3csv0xW/1CAF7ewVA
	 84oxEPFpo9gFhrCxuAWBbcLS2AX0suxOH3gV8L95PIacjhsYBHv4jkCYWuj2+cFyBY
	 L0ChwpbJlR8tA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec1e5505abso4315741fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Jun 2024 23:03:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOKhbyyBVZrr6f33seBmd443lS748sl+mTeJX71w9IBNhBY5UAjnKk3xg9cb/bo/888ITYDl0U6MPNQ+29F6AHyccCFUKJsdh9VV2+
X-Gm-Message-State: AOJu0Yz8Ku/GflDFVnJB3pDjCfbyVghLIIGugxmj1N7HGlDMYohnTAMa
	K9JYcXtaH/AJ51pY5kvfuJ3osi2wufeyH6s27r/iNnXYOHqwtauxFQISJ9Px4D9/ZaWK5f6/5rk
	oUiEvaIDRcoHPHLeyJ2yCSWSKYD0=
X-Google-Smtp-Source: AGHT+IFQRC4TQufyih74aIb/A8UVL0SAzA2QVkDSG7UkLT2L96wmABDXoIgcR8bO70JEad+7ICWJ6hh3UAKc+z2n1nc=
X-Received: by 2002:ac2:59dd:0:b0:52c:8508:e851 with SMTP id
 2adb3069b0e04-52cc47d6018mr904446e87.14.1718776992698; Tue, 18 Jun 2024
 23:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZGVi9HbI43R5trN8@bhelgaas> <CAK7LNAQPXapu3Ydh9XaB2ggGqgfYX5mo0pHPNHDcnm=w3ubYag@mail.gmail.com>
 <Zk-C5Eg84yt6_nml@google.com> <CAK7LNASrR2W-obUurSWaKLnQ+CB1o9iuoaM-hbHnv-zoazMzmQ@mail.gmail.com>
 <ZnIYWBgrJ-IJtqK8@google.com>
In-Reply-To: <ZnIYWBgrJ-IJtqK8@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 19 Jun 2024 15:02:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT9n9cQ_5mZ6rE+VD-KwOQm_Rjq=Q-Cx7ib+bSqmbbubA@mail.gmail.com>
Message-ID: <CAK7LNAT9n9cQ_5mZ6rE+VD-KwOQm_Rjq=Q-Cx7ib+bSqmbbubA@mail.gmail.com>
Subject: Re: possible dependency error?
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kbuild@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 8:29=E2=80=AFAM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Hi Masahiro,
>
> Thanks for the reply. I've been away for a bit, but I've poked at a few
> more things now.
>
> On Sun, May 26, 2024 at 01:35:43AM +0900, Masahiro Yamada wrote:
> > On Fri, May 24, 2024 at 2:54=E2=80=AFAM Brian Norris <briannorris@chrom=
ium.org> wrote:
> > > --- a/tools/lib/subcmd/Makefile
> > > +++ b/tools/lib/subcmd/Makefile
> > > @@ -76,7 +76,7 @@ include $(srctree)/tools/build/Makefile.include
> > >
> > >  all: fixdep $(LIBFILE)
> > >
> > > -$(SUBCMD_IN): FORCE
> > > +$(SUBCMD_IN): fixdep FORCE
> > >         @$(MAKE) $(build)=3Dlibsubcmd
> > >
> > >  $(LIBFILE): $(SUBCMD_IN)
> >
> >
> >
> > I may not fully understand the design policy of the tools/ build system=
,
> > but this fix is presumably correct because the 'fixdep' binary
> > is needed in each sub-directory for it to work correctly.
> >
> > tools/bpf/resolve_btfids/libsubcmd/.exec-cmd.o.cmd must
> > be generated by tools/bpf/resolve_btfids/libsubcmd/fixdep
> > instead of by tools/bpf/resolve_btfids/fixdep.
> >
> > But, fixing tools/lib/subcmd/Makefile is not enough.
> >
> > *.cmd files under tools/bpf/resolve_btfids/libbpf/staticobjs/
> > are broken for the same reason.
> > So, this is fundamentally broken in many places.
>
> I think I hacked something that works there too. It gets a bit uglier,
> but not too bad IMO.
>
> > And, as you noted, there is no easy way to fix .fixdep.o.cmd
>
> I haven't come up with a *great* solution, but I came up with something
> that works for the most part, by circumventing the normal Build /
> Makefile.build split. It's getting pretty ugly too though...
>
> > Your description in
> > https://issuetracker.google.com/issues/313508829#comment32
> > is all correct.
> >
> >
> > "can we just use Kbuild?" is a good question.
> > I do not understand why they use fragile build systems,
> > where obviously they cannot do it correctly.
> >
> >
> > In fact, I submitted a patch to migrate objtool to Kbuild
> > because that fixes all the issues cleanly.
> >
> > The objtool maintainers rejected it.
> > https://lore.kernel.org/linux-kbuild/1551764896-8453-3-git-send-email-y=
amada.masahiro@socionext.com/
> >
> >
> > Not only the build system.
> > He also refused to participate in the standard Documentation
> > directory.
> > tools/objtool/Documentation/objtool.txt still resides in its own direct=
ory.
>
> While I don't love having to solve the same problems repeatedly (once in
> Kbuild; potentially-many in tools/), I'm also OK with trying to hack
> fixes into the current duplicate build system if it's not prohibitively
> complex to do so.
>
> Here's what I have for now -- I might submit some or all of this as a
> proper patchset if I can fix a few rough edges.


I do not see any maintainer for tools/build/, but at least
you can find who is picking up the patches.


masahiro@zoe:~/ref/linux(master)$ ./scripts/get_maintainer.pl -f tools/buil=
d/
Arnaldo Carvalho de Melo <acme@redhat.com>
(commit_signer:7/10=3D70%,authored:1/10=3D10%)
Namhyung Kim <namhyung@kernel.org> (commit_signer:5/10=3D50%,authored:2/10=
=3D20%)
Ian Rogers <irogers@google.com> (commit_signer:3/10=3D30%,authored:1/10=3D1=
0%)
Thomas Richter <tmricht@linux.ibm.com>
(commit_signer:2/10=3D20%,authored:2/10=3D20%)
Quentin Monnet <qmo@kernel.org> (commit_signer:2/10=3D20%)
Jiri Olsa <jolsa@kernel.org> (authored:1/10=3D10%)
linux-kernel@vger.kernel.org (open list)







> diff --git a/tools/build/Makefile b/tools/build/Makefile
> index 17cdf01e29a0..fad93f64035d 100644
> --- a/tools/build/Makefile
> +++ b/tools/build/Makefile
> @@ -43,11 +43,8 @@ ifneq ($(wildcard $(TMP_O)),)
>         $(Q)$(MAKE) -C feature OUTPUT=3D$(TMP_O) clean >/dev/null
>  endif
>
> -$(OUTPUT)fixdep-in.o: FORCE
> -       $(Q)$(MAKE) $(build)=3Dfixdep
> -
> -$(OUTPUT)fixdep: $(OUTPUT)fixdep-in.o
> -       $(QUIET_LINK)$(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ $<
> +$(OUTPUT)fixdep: $(srctree)/tools/build/fixdep.c
> +       $(QUIET_CC)$(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ $<



OK, you bypassed fixdep for fixdep itself.

fixdep will not be rebuilt when the command line changes,
but it may not be a big deal.
It is not working that way already.




BTW, did you have a chance to test your code
with the -j<N> option?


I quickly tested your change, and I observed new
"jobserver unavailable" warnings.


masahiro@zoe:~/ref/linux(master)$ make -j24
mkdir -p /home/masahiro/ref/linux/tools/objtool && make
O=3D/home/masahiro/ref/linux subdir=3Dtools/objtool --no-print-directory
-C objtool
make[4]: warning: jobserver unavailable: using -j1.  Add '+' to parent
make rule.
make[5]: warning: jobserver unavailable: using -j1.  Add '+' to parent
make rule.



The first line:

  mkdir -p /home/masahiro/ref/linux/tools/objtool && make
O=3D/home/masahiro/ref/linux subdir=3Dtools/objtool --no-print-directory
-C objtool

is an existing noise regardless of your change.
(I do not know if anybody cares about this either)










>  FORCE:
>
> diff --git a/tools/build/Makefile.include b/tools/build/Makefile.include
> index 8dadaa0fbb43..27b2090cb293 100644
> --- a/tools/build/Makefile.include
> +++ b/tools/build/Makefile.include
> @@ -1,8 +1,16 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  build :=3D -f $(srctree)/tools/build/Makefile.build dir=3D. obj
>
> +# More than just $(Q), we sometimes want to suppress all command output =
from a
> +# recursive make -- even the 'up to date' printout.
> +ifeq ($(V),1)
> +  SILENT_MAKE =3D $(Q)$(MAKE)
> +else
> +  SILENT_MAKE =3D $(Q)$(MAKE) --silent
> +endif
> +
>  fixdep:
> -       $(Q)$(MAKE) -C $(srctree)/tools/build CFLAGS=3D LDFLAGS=3D $(OUTP=
UT)fixdep
> +       $(SILENT_MAKE) -C $(srctree)/tools/build CFLAGS=3D LDFLAGS=3D $(O=
UTPUT)fixdep
>
>  fixdep-clean:
>         $(Q)$(MAKE) -C $(srctree)/tools/build clean
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index 2cf892774346..a8f34de1ca25 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -154,6 +154,8 @@ $(BPF_IN_SHARED): force $(BPF_GENERATED)
>         $(Q)$(MAKE) $(build)=3Dlibbpf OUTPUT=3D$(SHARED_OBJDIR) CFLAGS=3D=
"$(CFLAGS) $(SHLIB_FLAGS)"
>
>  $(BPF_IN_STATIC): force $(BPF_GENERATED)
> +       $(call rule_mkdir)
> +       $(SILENT_MAKE) -C $(srctree)/tools/build CFLAGS=3D LDFLAGS=3D OUT=
PUT=3D$(STATIC_OBJDIR) $(STATIC_OBJDIR)fixdep
>         $(Q)$(MAKE) $(build)=3Dlibbpf OUTPUT=3D$(STATIC_OBJDIR)
>
>  $(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
> diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
> index b87213263a5e..59b09f280e49 100644
> --- a/tools/lib/subcmd/Makefile
> +++ b/tools/lib/subcmd/Makefile
> @@ -76,7 +76,7 @@ include $(srctree)/tools/build/Makefile.include
>
>  all: fixdep $(LIBFILE)
>
> -$(SUBCMD_IN): FORCE
> +$(SUBCMD_IN): fixdep FORCE
>         @$(MAKE) $(build)=3Dlibsubcmd
>
>  $(LIBFILE): $(SUBCMD_IN)
>


--
Best Regards
Masahiro Yamada

