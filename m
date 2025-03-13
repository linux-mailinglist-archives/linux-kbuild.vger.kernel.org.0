Return-Path: <linux-kbuild+bounces-6114-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 743E8A5ED40
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 08:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 614167A2DFC
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 07:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2641225F998;
	Thu, 13 Mar 2025 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTWg1cgk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BB1FC0FE;
	Thu, 13 Mar 2025 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741852059; cv=none; b=KPBo4LydK51cHc1EIANkzAoKda0gYhaFBLsyxQ4SEulWxdL0Rx7rcXN9kqQm3L6ms6dGmXQxxIAhe8ZC8B7r6cgt6HMq/BtiWEvGbfYgvrdfUhE04eq28DO77bnpfkPk9rp60GzQmXEAGIyywOAhDS86g9blcpXhBwBqNlbh72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741852059; c=relaxed/simple;
	bh=8hHJ/HFvfkEZ6i76S/7Osadp/4nyw/q4ACUf+uYItAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rM67MzzmX+cU7GElhdxwuWCgCtJvNqWTrxHRx1+VcW5VAVFhsjGcDjuJ0KdzKSR9m2cvxpoiYAY/NB4tMj8EEzYW7quewdEqSuPwbz67MXQ/zADwnvr1B2KpXqik84KENUeyAGJIy55HNxSMSvepS+qgp3V97KODlQpnDl0izQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTWg1cgk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E734C4CEE9;
	Thu, 13 Mar 2025 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741852058;
	bh=8hHJ/HFvfkEZ6i76S/7Osadp/4nyw/q4ACUf+uYItAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sTWg1cgkF0HN+R3Lg8H/q/Qfjx3ASKAcsERfvzaHk+wqZXINU/PpwXojnwHctHxN2
	 pnwecDDH1dZYi/0IudVv/vq/4AWn5X0Ie/cc/iqapwIqu7FlJGBgNSjAY6sAdCbmHQ
	 mFrbh/bGD8i/JyODx1v8kBN72mqfabTlCLWwDl3EAoFmGrYHXSL+ayydujC3gDNVgU
	 QDRyGK745K9PoW6FwPtlizS+JwHawvlwVFOZk28JB3TcIj5Vk2ZnJNXfkzzaimDUWB
	 m1OWmFSQqL7n+KU5/4MHY8BXqtiEmpyUl/kv+vtCVXbeqlFj4Buv7Mf2dy7f0fDqlP
	 dJSfRcH8a4W0A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5495078cd59so667389e87.1;
        Thu, 13 Mar 2025 00:47:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWec4tYNnT2JKvbELdE3pxEOT+bVBDFZNJK8xx8FJGHhvcOOlErORrxjgwDVu00Gran7u6DgE0I5Qzc8Ryy@vger.kernel.org, AJvYcCX6TJ5GGCULGUtKzmHjDuYMZdG1GZrZ7sVt63AxCPBrRpLMDSm6FPkG3re5ekV+Z+4ZtJezQ+EZQoXZyS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz46vLHowm8AwyOkx5fF1Yt8CXOsFkhdDrxczOF26/NtDGtMdrF
	I3NKOu2Pzmfm8CWDcoSHcZpUcbje4cOFX2UTUHlSi3BUehydT2nWuPQ393pT3eGlCj3oC9wi3MG
	nz9OvJb6KKQ/xxxoOApT0clKfCS8=
X-Google-Smtp-Source: AGHT+IFLgYAj/1b+D8/tOT9N04CdBa+1enXtS6QVrZnRpM8XirsjiCQj5kY6LGKs43WUlwcKAqmgm6k6rbNO5qrbN90=
X-Received: by 2002:a05:6512:3d19:b0:549:4d78:2418 with SMTP id
 2adb3069b0e04-549abacd211mr3858294e87.27.1741852056477; Thu, 13 Mar 2025
 00:47:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110616.148682-6-ardb+git@google.com> <20250311110616.148682-10-ardb+git@google.com>
 <CAK7LNASxNhDnCmpuf7yEW4Lcz-vRtitx8HPeoZnGNWdb-6pEsA@mail.gmail.com>
In-Reply-To: <CAK7LNASxNhDnCmpuf7yEW4Lcz-vRtitx8HPeoZnGNWdb-6pEsA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 13 Mar 2025 08:47:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFXo1dkh4iE=hnuPoQF61g2YPaeuG0Swp7CxSP4FYgvQQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrHAxVQxXq5RYt8jcT41tgYQ48AFEtuc3b0FjorUifa7uvMV9EZ8TqwqHI
Message-ID: <CAMj1kXFXo1dkh4iE=hnuPoQF61g2YPaeuG0Swp7CxSP4FYgvQQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] x86: Get rid of Makefile.postlink
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Mar 2025 at 03:09, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Mar 11, 2025 at 8:06=E2=80=AFPM Ard Biesheuvel <ardb+git@google.c=
om> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Instead of generating the vmlinux.relocs file (needed by the
> > decompressor build to construct the KASLR relocation tables) as a
> > vmlinux postlink step, which is dubious because it depends on data that
> > is stripped from vmlinux before the build completes, generate it from
> > vmlinux.unstripped, which has been introduced specifically for this
> > purpose.
> >
> > This ensures that each artifact is rebuilt as needed, rather than as a
> > side effect of another build rule.
> >
> > This effectively reverts commit
> >
> >   9d9173e9ceb6 ("x86/build: Avoid relocation information in final vmlin=
ux")
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/Makefile.postlink        | 38 --------------------
> >  arch/x86/boot/compressed/Makefile |  9 +++--
> >  2 files changed, 6 insertions(+), 41 deletions(-)
> >
> > diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> > deleted file mode 100644
> > index 445fce66630f..000000000000
> > --- a/arch/x86/Makefile.postlink
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -# SPDX-License-Identifier: GPL-2.0
> > -# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > -# Post-link x86 pass
> > -# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > -#
> > -# 1. Separate relocations from vmlinux into vmlinux.relocs.
> > -# 2. Strip relocations from vmlinux.
> > -
> > -PHONY :=3D __archpost
> > -__archpost:
> > -
> > --include include/config/auto.conf
> > -include $(srctree)/scripts/Kbuild.include
> > -
> > -CMD_RELOCS =3D arch/x86/tools/relocs
> > -OUT_RELOCS =3D arch/x86/boot/compressed
> > -quiet_cmd_relocs =3D RELOCS  $(OUT_RELOCS)/vmlinux.relocs
> > -      cmd_relocs =3D \
> > -       mkdir -p $(OUT_RELOCS); \
> > -       $(CMD_RELOCS) $@ > $(OUT_RELOCS)/vmlinux.relocs; \
> > -       $(CMD_RELOCS) --abs-relocs $@
> > -
> > -# `@true` prevents complaint when there is nothing to be done
> > -
> > -vmlinux vmlinux.unstripped: FORCE
> > -       @true
> > -ifeq ($(CONFIG_X86_NEED_RELOCS),y)
> > -       $(call cmd,relocs)
> > -endif
> > -
> > -clean:
> > -       @rm -f $(OUT_RELOCS)/vmlinux.relocs
> > -
> > -PHONY +=3D FORCE clean
> > -
> > -FORCE:
> > -
> > -.PHONY: $(PHONY)
> > diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compress=
ed/Makefile
> > index 606c74f27459..5edee7a9786c 100644
> > --- a/arch/x86/boot/compressed/Makefile
> > +++ b/arch/x86/boot/compressed/Makefile
> > @@ -117,9 +117,12 @@ $(obj)/vmlinux.bin: vmlinux FORCE
> >
> >  targets +=3D $(patsubst $(obj)/%,%,$(vmlinux-objs-y)) vmlinux.bin.all =
vmlinux.relocs
> >
> > -# vmlinux.relocs is created by the vmlinux postlink step.
> > -$(obj)/vmlinux.relocs: vmlinux
> > -       @true
> > +CMD_RELOCS =3D arch/x86/tools/relocs
> > +quiet_cmd_relocs =3D RELOCS  $@
> > +      cmd_relocs =3D $(CMD_RELOCS) $< > $@;$(CMD_RELOCS) --abs-relocs =
$<
> > +
> > +$(obj)/vmlinux.relocs: vmlinux.unstripped FORCE
> > +       $(call if_changed,relocs)
>
> Perhaps, it may make sense to rebuild vmlinux.relocs
> when arch/x86/tools/relocs is changed, but
> I do not see such dependency in the other
> arch/x86/realmode/rm/Makefile.
>
> https://github.com/torvalds/linux/blob/v6.14-rc5/arch/x86/realmode/rm/Mak=
efile#L61
>
>
> So, I decided it is ok.
> If you mind, you can send v3.
>

No I think that's fine: this patch reverts the changes to
arch/x86/boot/compressed/Makefile; if we need to improve it, it should
be a separate change in any case.

