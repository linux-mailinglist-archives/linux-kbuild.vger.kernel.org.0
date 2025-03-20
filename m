Return-Path: <linux-kbuild+bounces-6268-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EECB5A6AEE6
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 21:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 677DE189175A
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 20:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9BD22687A;
	Thu, 20 Mar 2025 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1Qsj5N9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C52288E3;
	Thu, 20 Mar 2025 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742500807; cv=none; b=dr/Ds6osCuvkAQVTWNU1kgmDnGklGpWa/+uzqQrhBlOvSN+kZ/SmJVVtPtinq+pSSs4tNfAqBPiCKX17l7DRPlIGgY8o9c9RUrYPRbmXm2/D/x7LmQyLvxPH8rgv8WxWJxLumxHI1GqtzWuYpN995XQNmZf9rQ/Y426hmX6npTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742500807; c=relaxed/simple;
	bh=B2+84pr0As28UqPgTHxbMJThWkwRS5HQW3sICoYcfYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUY9ouIQWhuwE71U5HxOwzsKNGOgxzBC5gcZD5FQizu1oGOWyD4C1jed2fB4MnuoT+VjC+mPj8Zt0tPywE5hgzPJKFMWKy3EQCn/Ket8Grk6Ns+CQejQ8UubHXRImMUjPimM9f7JsKtkSSBunCr4F06l8STOmntc2nvPiWxh1OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1Qsj5N9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C020C4CEDD;
	Thu, 20 Mar 2025 20:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742500807;
	bh=B2+84pr0As28UqPgTHxbMJThWkwRS5HQW3sICoYcfYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1Qsj5N99wE2VbpsSwiJ3x6D+9w6jlOdnAGH0jvdz/+UslpTe/VvvWXmpSVb78x0R
	 85+88DAgn4DSVInCEJWIPEEpbpNh3fi6+RDkwxFXpjyaG1SUS2DBfkQufpe384nKT0
	 rQCKrm1k4bCfbn8V2J3nfxi3Efdgk2JhxNgCqsrBo+RPklH24SMVc8teg76FJlso+K
	 U164jPyITezwZu4JWbLl513Ks1nRROAeTzFrNGJ7ybrXkBST3GmzT5ZudnrZ3dpF07
	 nD3bVNNwVkbsfPlI1W8UgbAor5WxvYugNjAdQbo93I41517vg4bvy+DDi1wHy6B6Xo
	 ZuY6F7gIlo+5w==
Date: Thu, 20 Mar 2025 21:00:02 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org,
	brgerst@gmail.com, x86@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, linux-kernel@vger.kernel.org, nogikh@google.com,
	syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
Subject: Re: [PATCH] gendwarfksyms: define __GENKSYMS__ when processing
 asm-protoypes.h
Message-ID: <Z9xzwpBiIEJGQk0g@gmail.com>
References: <20250320070746.101552-2-ardb+git@google.com>
 <CABCJKuc3zZOG4qgoFca_g80GMkzviVRemGLJB8GaA88u27Mt8A@mail.gmail.com>
 <CAMj1kXFZFgYp40xD72s0oMThgxK7J-yyCYUQkkBQjh3xR+fNeQ@mail.gmail.com>
 <CABCJKueFujwW_=JMZHTf+Y3qN9=uvQYSoDcg_6v=9svUYTsMGQ@mail.gmail.com>
 <CAMj1kXHCX9oinqQ6xSMgKHdVqp16svPrs9bZu0tX_iD6h76NtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXHCX9oinqQ6xSMgKHdVqp16svPrs9bZu0tX_iD6h76NtA@mail.gmail.com>


* Ard Biesheuvel <ardb@kernel.org> wrote:

> On Thu, 20 Mar 2025 at 17:22, Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > On Thu, Mar 20, 2025 at 9:09 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Thu, 20 Mar 2025 at 15:48, Sami Tolvanen <samitolvanen@google.com> wrote:
> > > >
> > > > Hi Ard,
> > > >
> > > > On Thu, Mar 20, 2025 at 12:07 AM Ard Biesheuvel <ardb+git@google.com> wrote:
> > > > >
> > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > >
> > > > > Ensure that __GENKSYMS__ is #define'd when passing asm/asm-prototypes.h
> > > > > through the compiler to capture the exported symbols. This ensures that
> > > > > exported symbols such as __ref_stack_chk_guard on x86, which is declared
> > > > > conditionally, is visible to the tool.
> > > > >
> > > > > Otherwise, an error such as the below may be raised, breaking the build
> > > > > when CONFIG_GENDWARFKSYMS=y
> > > > >
> > > > >   <stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guard'
> > > > >
> > > > > Cc: Sami Tolvanen <samitolvanen@google.com>
> > > > > Reported-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
> > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > ---
> > > > >  scripts/Makefile.build | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > > > index 993708d11874..7855cdc4e763 100644
> > > > > --- a/scripts/Makefile.build
> > > > > +++ b/scripts/Makefile.build
> > > > > @@ -305,6 +305,7 @@ $(obj)/%.rs: $(obj)/%.rs.S FORCE
> > > > >  getasmexports =                                                                \
> > > > >     { echo "\#include <linux/kernel.h>" ;                               \
> > > > >       echo "\#include <linux/string.h>" ;                               \
> > > > > +     echo "\#define  __GENKSYMS__" ;                                   \
> > > > >       echo "\#include <asm/asm-prototypes.h>" ;                         \
> > > > >       $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }
> > > >
> > > > This works with gendwarfksyms since __GENKSYMS__ is defined after the
> > > > EXPORT_SYMBOL() definition, but I'm now getting warnings with
> > > > genksyms:
> > > >
> > > >   AS      arch/x86/lib/clear_page_64.o
> > > > <stdin>:3:10: warning: "__GENKSYMS__" redefined
> > > > <command-line>: note: this is the location of the previous definition
> > > >
> > >
> > > Oops.
> > >
> > > Do you think the fix below should be sufficient?
> > >
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -314,7 +314,7 @@
> > >  else
> > >  cmd_gensymtypes_S =                                                    \
> > >         $(getasmexports) |                                              \
> > > -       $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
> > > +       $(CPP) $(c_flags) -xc - | $(genksyms)
> > >  endif # CONFIG_GENDWARFKSYMS
> > >
> > >  quiet_cmd_cpp_s_S = CPP $(quiet_modtag) $@
> >
> > EXPORT_SYMBOL() has a different definition when __GENKSYMS__ is
> > defined, so I think with genksyms we actually do need this on the
> > command line. I suppose you could wrap the getasmexports definition in
> > #ifndef __GENKSYMS__ to avoid the warning, or just use
> > __GENDWARFKSYMS__ like you suggested earlier.
> >
> 
> Yeah, on second thought, we could just do what Masahiro suggested, and
> drop the conditional from asm/asm-prototypes.h
> 
> The issue in question only affects definitions, not declarations, and
> so having the declaration visible shouldn't be a problem.
> 
> Ingo, mind dropping this patch again? We'll do the below instead (I'll
> send out the patch in a minute)

Yeah, done & thanks!

	Ingo



