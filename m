Return-Path: <linux-kbuild+bounces-5468-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF0A0BB99
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146E33AC9B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C5C22DFBA;
	Mon, 13 Jan 2025 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0kFRQ2d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6065822DFB4;
	Mon, 13 Jan 2025 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780988; cv=none; b=Jt71Ile1CnsNekBIThko2jNIKNLFzsZIDLN37lylL4AH54Xfr6WjD94Oq5rP6NTIjdj3r2vXwcYtBMI1ptOjj1PEI7CSdfoEBomE+dnjtp/LHPSCH7r7E8N3Xl3iAHMat0++ll+XA3CEIYPJ2JDUK7TFn3RYG3eIM5Lhs91DdBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780988; c=relaxed/simple;
	bh=ySZhrV7KxoEoceQ7GO1oMNQ6hJVR+4rWEVsbhAzW6xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0leyQvX3fxEX2Eg7ssUaFSyyx9H/e478jSPt2NoN4EppHR05AegETKdm1zEF0hZdHRvEiONObP67vdqLwKVyTM8RFWbLrOUhxo/13IjDRzBdeYCgN8IWJSQi99ZrU9CWwMTSP0QZRGtGM8WXGHBCUmNESbt32yroQBk68NUnWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0kFRQ2d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8961C4CEE4;
	Mon, 13 Jan 2025 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780987;
	bh=ySZhrV7KxoEoceQ7GO1oMNQ6hJVR+4rWEVsbhAzW6xg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q0kFRQ2dWCSaUoXOl2eVB/tWlbeGYAgdrPF2xWrir0QIZwcTXRng10Ynb7GskjCTt
	 ynnIxQ2FLURIP4I4PDkqEPU+3TPpg+YTTKUpGa7jGzg6foD1xgFzVn6by+vnxiwSDm
	 mACMwVaULUom5fP1yMXBc0JYW6/26b2F8DARMG9UAxfg9cUWHr41wDbDAvWQIlEWQn
	 tNrH1eC00V4+Q35Oq5ZzxJAThQqP+p06aBiOl4okEap2sKwWcvjdm765085op+5b2+
	 PycxsJLItwsj+Z/HqA7PevddE0dkOAeNOJvZHQqcuNZUa6jmp9AcpLE3kxMA3vThIq
	 DQuAyB46GTcWw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3003e203acaso33195391fa.1;
        Mon, 13 Jan 2025 07:09:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUnqEDI3IjlHYM9eExIcmuKDuZIaVryyQH4Q7sS8An89Smv6Dwd6cQu5ZGpz9Hdw8u5uWICN8t4B6JjoGz@vger.kernel.org, AJvYcCWDkMUofk/rwHBdwkKya4Xrf7durtheeZfZCN7/3jUlhHiuRWXApBP+xA5kroJC5Nomq4RlHj6/Linyig==@vger.kernel.org, AJvYcCXTuFOJO3/7c9eGu1tab80RJWylb4KQcCMSlFO4wrGoOZ7yBqpXV8UNz1SSL0QicVhPYz/AWGAS4Am5AF4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgw/zNfqQI06f9AsHnDQK9+o5M1SqqfVtpI5FJezmNCKArNORx
	QtXoqAiRsUTzOROkKeeTKfDKeIy8PzxDTzL19fBaRy6V+kOBWFAmMenc3QQsJ2ByH8y5uLd8Bvt
	lRHf0RJ/gx6turY8zzE7exjmbpc8=
X-Google-Smtp-Source: AGHT+IGbUkOcXb0e6H2t3vy22I/KxhY5cdwF9uFWxpJILef6hsn0LJJk83aecUNNIJFWk9t6jD5HcQSKaA5naE5eaek=
X-Received: by 2002:a2e:bc89:0:b0:306:1501:b18c with SMTP id
 38308e7fff4ca-3061501b3camr29624171fa.13.1736780986298; Mon, 13 Jan 2025
 07:09:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113143222.1868692-2-ardb+git@google.com> <82c4c224-1e3a-4fe1-8bec-a9a3d82cbf3f@w6rz.net>
In-Reply-To: <82c4c224-1e3a-4fe1-8bec-a9a3d82cbf3f@w6rz.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 13 Jan 2025 16:09:35 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHfD=ZBgOBZpAB97i210N7vtHd2_UPbE_2oAmdMA3Ya9w@mail.gmail.com>
X-Gm-Features: AbW1kvYpyJxTd8iahwxjc7X9ci_8FA4gjYXt6Ub8WEY5hrXC34Ji-2-m_yKfHRg
Message-ID: <CAMj1kXHfD=ZBgOBZpAB97i210N7vtHd2_UPbE_2oAmdMA3Ya9w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Strip runtime const RELA sections correctly
To: Ron Economos <re@w6rz.net>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2025 at 16:07, Ron Economos <re@w6rz.net> wrote:
>
> On 1/13/25 06:32, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Due to the fact that runtime const ELF sections are named without a
> > leading period or double underscore, the RSTRIP logic that removes the
> > static RELA sections from vmlinux fails to identify them. This results
> > in a situation like below, where some sections that were supposed to get
> > removed are left behind.
> >
> >    [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
> >
> >    [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
> >    [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
> >    [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
> >    [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
> >    [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
> >    [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
> >
> > So tweak the match expression to strip all sections starting with .rel.
> > While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> > single shared Makefile library command.
> >
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-s390@vger.kernel.org
> > Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > v2: add missing include of scripts/Makefile.lib
> >
> >   arch/riscv/Makefile.postlink | 10 ++--------
> >   arch/s390/Makefile.postlink  |  6 +-----
> >   arch/x86/Makefile.postlink   |  6 +-----
> >   scripts/Makefile.lib         |  3 +++
> >   4 files changed, 7 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> > index 829b9abc91f6..750d2784f69e 100644
> > --- a/arch/riscv/Makefile.postlink
> > +++ b/arch/riscv/Makefile.postlink
> > @@ -10,6 +10,7 @@ __archpost:
> >
> >   -include include/config/auto.conf
> >   include $(srctree)/scripts/Kbuild.include
> > +include $(srctree)/scripts/Makefile.lib
> >
> >   quiet_cmd_relocs_check = CHKREL  $@
> >   cmd_relocs_check =                                                  \
> > @@ -19,13 +20,6 @@ ifdef CONFIG_RELOCATABLE
> >   quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
> >   cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
> >
> > -quiet_cmd_relocs_strip = STRIPREL $@
> > -cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
> > -                                --remove-section='.rel__*'      \
> > -                                --remove-section='.rela.*'      \
> > -                                --remove-section='.rela__*' $@
> > -endif
> > -
> >   # `@true` prevents complaint when there is nothing to be done
> >
> >   vmlinux: FORCE
> > @@ -33,7 +27,7 @@ vmlinux: FORCE
> >   ifdef CONFIG_RELOCATABLE
> >       $(call if_changed,relocs_check)
> >       $(call if_changed,cp_vmlinux_relocs)
> > -     $(call if_changed,relocs_strip)
> > +     $(call if_changed,strip_relocs)
> >   endif
> >
> >   clean:
> > diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
> > index df82f5410769..1ae5478cd6ac 100644
> > --- a/arch/s390/Makefile.postlink
> > +++ b/arch/s390/Makefile.postlink
> > @@ -11,6 +11,7 @@ __archpost:
> >
> >   -include include/config/auto.conf
> >   include $(srctree)/scripts/Kbuild.include
> > +include $(srctree)/scripts/Makefile.lib
> >
> >   CMD_RELOCS=arch/s390/tools/relocs
> >   OUT_RELOCS = arch/s390/boot
> > @@ -19,11 +20,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/relocs.S
> >       mkdir -p $(OUT_RELOCS); \
> >       $(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
> >
> > -quiet_cmd_strip_relocs = RSTRIP  $@
> > -      cmd_strip_relocs = \
> > -     $(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> > -                --remove-section='.rela.*' --remove-section='.rela__*' $@
> > -
> >   vmlinux: FORCE
> >       $(call cmd,relocs)
> >       $(call cmd,strip_relocs)
> > diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> > index fef2e977cc7d..8b8a68162c94 100644
> > --- a/arch/x86/Makefile.postlink
> > +++ b/arch/x86/Makefile.postlink
> > @@ -11,6 +11,7 @@ __archpost:
> >
> >   -include include/config/auto.conf
> >   include $(srctree)/scripts/Kbuild.include
> > +include $(srctree)/scripts/Makefile.lib
> >
> >   CMD_RELOCS = arch/x86/tools/relocs
> >   OUT_RELOCS = arch/x86/boot/compressed
> > @@ -20,11 +21,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/$@.relocs
> >       $(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
> >       $(CMD_RELOCS) --abs-relocs $@
> >
> > -quiet_cmd_strip_relocs = RSTRIP  $@
> > -      cmd_strip_relocs = \
> > -     $(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> > -                --remove-section='.rela.*' --remove-section='.rela__*' $@
> > -
> >   # `@true` prevents complaint when there is nothing to be done
> >
> >   vmlinux: FORCE
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 7395200538da..f604f51d23ca 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -374,6 +374,9 @@ quiet_cmd_ar = AR      $@
> >   quiet_cmd_objcopy = OBJCOPY $@
> >   cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
> >
> > +quiet_cmd_strip_relocs = RSTRIP  $@
> > +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
> > +
> >   # Gzip
> >   # ---------------------------------------------------------------------------
> >
>
> Fails on RISC-V with:
>
>    LD      vmlinux
>    NM      System.map
>    SORTTAB vmlinux
> arch/riscv/Makefile.postlink:41: *** missing 'endif'.  Stop.
> make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 2
> make[2]: *** Deleting file 'vmlinux'
> make[1]: *** [/home/ubuntu/xfer/linux/Makefile:1167: vmlinux] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> Command exited with non-zero status 2
>
> I think you need to put that deleted "endif" back in.
>

Yeah, sorry about that, and thanks for testing.

