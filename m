Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECFD677112
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Jan 2023 18:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjAVR2b (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Jan 2023 12:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjAVR2b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Jan 2023 12:28:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0EF1DB82
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Jan 2023 09:28:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 88FFC60B39
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Jan 2023 17:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53AFC433EF
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Jan 2023 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674408508;
        bh=438H6CrDOy6nKh2mCbJ0pDw6OZbSMl0pGNH7LBwxmNs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DotUkcBa3DbWKQ8OI+0UbcElDwpdxps2yFSSvZcsxKcWuP10R5n7tXotaRlXIP/pG
         DqYkk5t9mII8/jqTeb/u22NULJMmhkYd0d0BthPRN5L+lOmsaJGaIGqdAXueqcmdcX
         VY5T/7uOrTfT++uXh+iBfGBwgPCM3J+Dll/qesxRM4CfxOZ35DFkE/DmAyzJn8JAhD
         +uX20tKB/FfwZg53fbXPWL52qZ2RGTlUX0gwsyNZarudGFxfpwGWMB5HCtt7TTVQRC
         gBaEA9d/E/qptjUJmZGgbi/QN1bUO9R+a7zZxVKRpn5G2FQY7jR/vIbw382Z2ZRKS+
         6IN3VLGtxb/zA==
Received: by mail-oi1-f173.google.com with SMTP id r132so8531325oif.10
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Jan 2023 09:28:28 -0800 (PST)
X-Gm-Message-State: AFqh2kqtGgul4ReUTs0jnfxuHc8dU6rTi+p2Do8tEz4U2IrPUIhDEyck
        hxFXO+4VnRT53MwUQJKKLbYhw3PDpNaZs1Jy8qc=
X-Google-Smtp-Source: AMrXdXsSHIt9F5C7C393A5+0g/WZ7RA6Q4cJ0fjJFXejj/7jpOG4YOEF2bAx5Kn+Um+Ajm9siFac4fZK1s/pXPNfXUM=
X-Received: by 2002:aca:acd5:0:b0:364:5d10:7202 with SMTP id
 v204-20020acaacd5000000b003645d107202mr879673oie.194.1674408508135; Sun, 22
 Jan 2023 09:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
 <CA+icZUUgq-dnSTRbdynPA8bEWg6SsCE9GYBMF6iViVmo9DfaFA@mail.gmail.com> <Y8BPp905fJciHNa2@dev-arch.thelio-3990X>
In-Reply-To: <Y8BPp905fJciHNa2@dev-arch.thelio-3990X>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Jan 2023 02:27:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRetne7hK4xNeEpn7a1=Eaxr42X6nRWohJzWGYiyiPww@mail.gmail.com>
Message-ID: <CAK7LNATRetne7hK4xNeEpn7a1=Eaxr42X6nRWohJzWGYiyiPww@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>, ndesaulniers@google.com,
        nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 13, 2023 at 3:21 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Sedat,
>
> On Thu, Jan 12, 2023 at 07:02:30PM +0100, Sedat Dilek wrote:
> > On Thu, Jan 12, 2023 at 4:06 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> > > are several warnings in the PowerPC vDSO:
> > >
> > >   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > >   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > >   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
> > >
> > >   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
> > >   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
> > >
> > > The first group of warnings point out that linker flags were being added
> > > to all invocations of $(CC), even though they will only be used during
> > > the final vDSO link. Move those flags to ldflags-y.
> > >
> > > The second group of warnings are compiler or assembler flags that will
> > > be unused during linking. Filter them out from KBUILD_CFLAGS so that
> > > they are not used during linking.
> > >
> > > Additionally, '-z noexecstack' was added directly to the ld_and_check
> > > rule in commit 1d53c0192b15 ("powerpc/vdso: link with -z noexecstack")
> > > but now that there is a common ldflags variable, it can be moved there.
> > >
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > > Cc: mpe@ellerman.id.au
> > > Cc: npiggin@gmail.com
> > > Cc: christophe.leroy@csgroup.eu
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > ---
> > >  arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
> > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> > > index 45c0cc5d34b6..4337b3aa9171 100644
> > > --- a/arch/powerpc/kernel/vdso/Makefile
> > > +++ b/arch/powerpc/kernel/vdso/Makefile
> > > @@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
> > >  UBSAN_SANITIZE := n
> > >  KASAN_SANITIZE := n
> > >
> > > -ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> > > -ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > > -
> > > -CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> > > +ccflags-y := -fno-common -fno-builtin
> > > +ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack
> > > +ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > > +# Filter flags that clang will warn are unused for linking
> > > +ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> > > +
> > > +CC32FLAGS := -m32
> > > +LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
> > >  AS32FLAGS := -D__VDSO32__
> > >
> > > -CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> >
> > Set CC64FLAGS := -m64 ?
>
> I do not think it is necessary. ldflags-y is filtered from
> KBUILD_CFLAGS, which should already include '-m64' (search for
> 'HAS_BIARCH' in arch/powerpc/Makefile). We would have seen a problem
> with this already if a 32-bit target (powerpc-linux-gnu-) CROSS_COMPILE
> value since $(c_flags) uses the main kernel's CROSS_COMPILE value.
>
> > > +LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
> > >  AS64FLAGS := -D__VDSO64__
> > >
> > >  targets += vdso32.lds
> > > @@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
> > >
> > >  # actual build commands
> > >  quiet_cmd_vdso32ld_and_check = VDSO32L $@
> > > -      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > > +      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
> > >  quiet_cmd_vdso32as = VDSO32A $@
> > >        cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
> > >  quiet_cmd_vdso32cc = VDSO32C $@
> > >        cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
> > >
> > >  quiet_cmd_vdso64ld_and_check = VDSO64L $@
> > > -      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > > +      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
> >
> > If no CC64FLAGS := xxx is set, this can go?
>
> Good catch! CC64FLAGS can be removed. Masahiro, I am happy to send a v3
> when I am back online next week but if you are able to fix it up during
> application, please feel free to do so (once the PowerPC folks give
> their Acks of course).




I removed CC64FLAGS locally.




Just two comments.

- Is 7f3d349065d0c643f7f7013fbf9bc9f2c90b675f
  applicable to powerpc too?

  Maybe, as a follow-up cleanup, use $(LD)
  and remove -Wl, prefixes.


- ldflags-y still pulls $(KBUILD_CFLAGS).
  Potentially, a new flag addition to KBUILD_CFLAGS
  may trigger a new -Wunused-command-line-argument warning.

  I hope somebody takes a closer look at which flags
  are really needed for the linker.







> > >  quiet_cmd_vdso64as = VDSO64A $@
> > >        cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
> > >
> > >
> > > --
> > > 2.39.0
> > >
>
> Thanks for the review, cheers!
> Nathan



-- 
Best Regards
Masahiro Yamada
