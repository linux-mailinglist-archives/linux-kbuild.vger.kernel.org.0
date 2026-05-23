Return-Path: <linux-kbuild+bounces-13319-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EpRqB1QlEWr/hgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13319-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2026 05:56:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF795BD0A0
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2026 05:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82DEA300D179
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2026 03:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D083128AB;
	Sat, 23 May 2026 03:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dShIPu0a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861D22157B;
	Sat, 23 May 2026 03:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779508560; cv=none; b=Eqd+LDf8VPgIgzI1thr1/0VpLCBmTKSNYWWAkQ9ViCPW4DKI0w7AxY2N0GxCe5e3cr9YIp5hmgrf42X3SvlfqLUPj0zdRI0qSrYno/kSu24XBbJ5sARkokFje9VHMifISsAaPWy2b4k9FOHlWTHUuwJ92y8mhGricbsCazJYVOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779508560; c=relaxed/simple;
	bh=5R8dOd7/Efu3V9hnWLCu5wWLSVn2NiA/viNMis3oLvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jg1hfl/jLJknP7wdwaNg09w4kU5gcCrRAYll3a/UhLjQEcTAsv5OHiW6ur1kVOqRgVi69Po33hKtYwrElUImfsiuFVQq3ZsG3P6oq39j2YvxUUf1vkildoyuBgV30TJH3YmNPfUMv42Ir/38ZZS9KrQlrS178zoOSU/8dv+Evrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dShIPu0a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41AA1F000E9;
	Sat, 23 May 2026 03:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779508559;
	bh=NguJ422WOFN+P1L+I5df30qtvOuCNIl7YQS2b/vDziE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dShIPu0aZYYCIXvLczPtt/9Gr99mZOyb9mruLMem9/XUPISyOQuIt/ndHzZqCwCWe
	 GLuqL59gjN/wyi8QCmIASkCzhPL/ZhJcKPXEGJK5+yjaE9fT2Rg5VM3qsVsp6b7zVS
	 Pgo857OTDe4zKSgBNgpxMJhVBSiUV8Fr5yhs73r+1Vd7VREHW/gwrthlfA02O8gsV/
	 X/qkcKf7t1M6nNJuQ8yfgiZJFq2WGrE8feoxpFy4qZVEH7SUQXby3haASCV0ZMTPOj
	 j0OoPbB+3OmWvNmVhwlcTAp+Va8strjmEYtJmcligNO3jWXwYNoXBKKKwn1aEWHbVl
	 xF6mIgDsmL+Zw==
Date: Fri, 22 May 2026 20:55:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Yonghong Song <yonghong.song@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <20260523035552.GA799545@ax162>
References: <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
 <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
 <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev>
 <CAF1bQ=TFMSkLE6bqPEOqGxcLbC7tYfPqEmg7xrjbc2m_B=72GA@mail.gmail.com>
 <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev>
 <CAF1bQ=Ta0LJVSiEWnhyq=mXA81m3=-gW1H+iyQyQwZ+w02g1VA@mail.gmail.com>
 <21591f06-fedd-4a51-b06c-947c72b1457f@linux.dev>
 <CAF1bQ=Q3szLgxREV2R=v9eEqDrme8r+Ky2ZtQiuXZ2A1ZrHPYw@mail.gmail.com>
 <20260523011721.GB520407@ax162>
 <CAF1bQ=ScvbDL4TY8=FJzwULP9KS-aZ4K=o4f+QxGssca+Q7ovQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=ScvbDL4TY8=FJzwULP9KS-aZ4K=o4f+QxGssca+Q7ovQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13319-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4CF795BD0A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 08:29:53PM -0700, Rong Xu wrote:
> Thanks Nathan for comments and suggestions. My comments are inlined.
> 
> On Fri, May 22, 2026 at 6:17 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Fri, May 22, 2026 at 11:58:35AM -0700, Rong Xu wrote:
> > > On Fri, May 22, 2026 at 11:44 AM Yonghong Song <yonghong.song@linux.dev> wrote:
> > > > On 5/22/26 11:14 AM, Rong Xu wrote:
> > > > > On Fri, May 22, 2026 at 10:52 AM Yonghong Song <yonghong.song@linux.dev> wrote:
> > > > >> On 5/22/26 8:32 AM, Rong Xu wrote:
> > > > >>> On Thu, May 21, 2026 at 2:57 PM Yonghong Song <yonghong.song@linux.dev> wrote:
> > > > >>>>
> > > > >>>> On 5/21/26 11:31 AM, Rong Xu wrote:
> > > > >>>>> Yonghong, thanks for the update.
> > > > >>>>>
> > > > >>>>> Regarding this guard: ther is a period of Clang (before this patch and
> > > > >>>>> after your first patch), even though ld.lld having these options
> > > > >>>>> (specifically --lto-whole-program-visibility -mllvm
> > > > >>>>> -always-rename-promoted-locals=false), distributed ThinLTO mode
> > > > >>>>> remains unsupported, correct? What the behvior of using this options
> > > > >>>>> in distributed mode with these compilers? nop or it will lead to
> > > > >>>>> error?
> > > > >>>> The in-process thin-lto support is landed on Feb 27.
> > > > >>>> The distributed thin-lto support is landed on Apr 24.
> > > > >>>>
> > > > >>>> If people are using distributed thin-lto in kernel between Feb 27 and
> > > > >>>> Apr 24, there will be some issues. But people typically use released
> > > > >>>> compiler, so we should be fine.
> > > > >>> This is not the case for us (google). We do use compiler b/w releases,
> > > > >>> and we build our own.
> > > > >>>
> > > > >>> What is the issue if we use the compiler in b/w Feb27 and Apr24?
> > > > >> If you use the custom compiler between Feb27 and Apr24 and your kernel
> > > > >> will do distributed thin-lto, you can remove
> > > > >>      $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
> > > > >> from your kernel. Since you have custom compiler, you can
> > > > >> do some customization for your kernel as well.
> > > > > I am referring to this specific patch -- there are cases that use
> > > > > custom compilers built between the February 27 and April 24 LLVM
> > > > > releases.
> > > > > I don't want to see any breakage for distributed ThinLTO in these cases.
> > > > >
> > > > > I would prefer to keep this guard for distributed ThinLTO for the time
> > > > > being and remove it later. What do you think?
> > > >
> > > > For 'remove it later', when this will happen? When llvm23 cuts the rc
> > > > in July or cut the release in September or the end of bug fix say in December?
> > >
> > > I can remove the guard when the minimal clang containis the 4/24 patch.
> >
> > I think we could just change
> >
> >   ifdef CONFIG_LTO_CLANG_THIN
> >   KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
> >   endif
> >
> > to
> >
> >   ifneq ($(CONFIG_LTO_CLANG_THIN)$(CONFIG_LTO_CLANG_THIN_DIST),)
> >   KBUILD_LDFLAGS += $(if $(call clang-min-version,230100),--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
> >   endif
> >
> > when LLVM 23.1.0-rc1 is out to avoid that Feb 27 to Apr 24 breakage?
> 
> I don't understand why we need this new "ifneq ..." guard. We have
> already checked CONFIG_LTO_CLANG=y, and CONFIG_LTO_CLANG_FULL != y.
> I think this "ifnef ..." will always be true (so redundant).

Ah, yeah, I missed since I did not look at the full context. That could
just be

  ifneq ($(call clang-min-version,230100),)
  KBUILD_LDFLAGS += --lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false
  endif

then.

> >
> > > > If we carry the guard (for distributed thinlto) in this kernel release,
> > > > that means at some point, we will need to do kernel backport, extra work.
> > >
> > > I don't understand here: this is part of the distributed thinlto patch
> > > that you would need merge anyay.
> > > where is the extra work for backporting?
> > >
> > > > Also, since you are building custom in-development compiler, you can
> > > > disable this flag -always-rename-promoted-locals, problem solved, right?
> > >
> > > I'm not only talking about me. There are other users also use this way.
> > > BTW, even in google, I don't control the compiler that being used.
> >
> > So in general, we assume that folks who are using prerelease compilers
> > (i.e., 23.0.0 in this case) are upgrading them regularly, as we may need
> > to workaround or fix issues that happen in main that cannot be
> > dynamically detected (at least not easily or conveniently). For example,
> > recent main versions of clang have support for -Wattribute-alias, so we
> > need to turn it off via #pragmas like done for GCC, which will break
> > things for clang-23 versions that do not have -Wattribute-alias:
> >
> >   https://git.kernel.org/nathan/c/bc5ffe737f56ee2734597069ed71f48830549483
> >
> > So the argument about breaking compilers in between Feb 27 and Apr 24 is
> > not really relevant in my opinion since they should be short lived in
> > terms of deployment. However, given that things work the way the check
> > is currently written and the LLVM 23 branch is only a couple of months
> > away, I am fine with just sticking with how it is currently written and
> > updating it when things are more guaranteed to work.
> 
> This works for me. I can add a comment here.
> Like the following:
> =====
>  ifdef CONFIG_LTO_CLANG
> -ifdef CONFIG_LTO_CLANG_THIN
> +ifdef CONFIG_LTO_CLANG_FULL
> +CC_FLAGS_LTO   := -flto
> +else
>  CC_FLAGS_LTO   := -flto=thin -fsplit-lto-unit
> +
> +# The following clang options added on 2026-02-27 lack distributed
> +# ThinLTO support until the 2026-04-24. Disabling for distributed
> +# builds until the minimum clang version is updated.

I think the dates are just noise. I think we can keep it short and sweet
with something like:

  # These LLVM options were initially added with only in-process ThinLTO
  # support, so avoid distributed ThinLTO support for now.

Otherwise, seems fine to me. I will set a reminder to revisit this when
LLVM 23 has branched so we can just turn it into a version check.

> +ifdef CONFIG_LTO_CLANG_THIN
>  KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility
> -mllvm -always-rename-promoted-locals=false)
> -else
> -CC_FLAGS_LTO   := -flto
> +endif
>  endif
>  CC_FLAGS_LTO   += -fvisibility=hidden
> =====
> 
> If you are fine with this, I can send v10 for review.
> 
> >
> > --
> > Cheers,
> > Nathan

-- 
Cheers,
Nathan

