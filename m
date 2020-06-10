Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C345A1F4EE5
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2020 09:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgFJHa4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Jun 2020 03:30:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:57466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgFJHa4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jun 2020 03:30:56 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE19D2064C;
        Wed, 10 Jun 2020 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591774255;
        bh=IH/VSuSEAGvCmDHtwWjVeUZ11F3kkh8B0kP5JWifwc8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kurjwS8fwiw8EGn0jbytoas/wrEj4xJkUEgxJkvcozH24JD2dlC5y+a4nJD0My3sq
         ul+wjivjzSARUMXtVw/lGNKsv6f0Tp7jqRq/C1+iXJ6YGLS7CKEkCCFlbDtWNARzK4
         Peuog3YYkCA20WJGXvYxTvu65RcFJjBDad24TU9U=
Date:   Wed, 10 Jun 2020 08:30:47 +0100
From:   Will Deacon <will@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Alexander Popov <alex.popov@linux.com>,
        Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org
Subject: Re: [PATCH 5/5] gcc-plugins/stackleak: Don't instrument
 vgettimeofday.c in arm64 VDSO
Message-ID: <20200610073046.GA15939@willie-the-truck>
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-6-alex.popov@linux.com>
 <20200604135806.GA3170@willie-the-truck>
 <202006091149.6C78419@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202006091149.6C78419@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 09, 2020 at 12:09:27PM -0700, Kees Cook wrote:
> On Thu, Jun 04, 2020 at 02:58:06PM +0100, Will Deacon wrote:
> > On Thu, Jun 04, 2020 at 04:49:57PM +0300, Alexander Popov wrote:
> > > Don't try instrumenting functions in arch/arm64/kernel/vdso/vgettimeofday.c.
> > > Otherwise that can cause issues if the cleanup pass of stackleak gcc plugin
> > > is disabled.
> > > 
> > > Signed-off-by: Alexander Popov <alex.popov@linux.com>
> > > ---
> > >  arch/arm64/kernel/vdso/Makefile | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> > > index 3862cad2410c..9b84cafbd2da 100644
> > > --- a/arch/arm64/kernel/vdso/Makefile
> > > +++ b/arch/arm64/kernel/vdso/Makefile
> > > @@ -32,7 +32,8 @@ UBSAN_SANITIZE			:= n
> > >  OBJECT_FILES_NON_STANDARD	:= y
> > >  KCOV_INSTRUMENT			:= n
> > >  
> > > -CFLAGS_vgettimeofday.o = -O2 -mcmodel=tiny -fasynchronous-unwind-tables
> > > +CFLAGS_vgettimeofday.o = -O2 -mcmodel=tiny -fasynchronous-unwind-tables \
> > > +		$(DISABLE_STACKLEAK_PLUGIN)
> > 
> > I can pick this one up via arm64, thanks. Are there any other plugins we
> > should be wary of? It looks like x86 filters out $(GCC_PLUGINS_CFLAGS)
> > when building the vDSO.
> 
> I didn't realize/remember that arm64 retained the kernel build flags for
> vDSO builds. (I'm used to x86 throwing all its flags away for its vDSO.)
> 
> How does 32-bit ARM do its vDSO?
> 
> My quick run-through on plugins:
> 
> arm_ssp_per_task_plugin.c
> 	32-bit ARM only (but likely needs disabling for 32-bit ARM vDSO?)

On arm64, the 32-bit toolchain is picked up via CC_COMPAT -- does that still
get the plugins?

> cyc_complexity_plugin.c
> 	compile-time reporting only
> 
> latent_entropy_plugin.c
> 	this shouldn't get triggered for the vDSO (no __latent_entropy
> 	nor __init attributes in vDSO), but perhaps explicitly disabling
> 	it would be a sensible thing to do, just for robustness?
> 
> randomize_layout_plugin.c
> 	this shouldn't get triggered (again, lacking attributes), but
> 	should likely be disabled too.
> 
> sancov_plugin.c
> 	This should be tracking the KCOV directly (see
> 	scripts/Makefile.kcov), which is already disabled here.
> 
> structleak_plugin.c
> 	This should be fine in the vDSO, but there's not security
> 	boundary here, so it wouldn't be important to KEEP it enabled.

Thanks for going through these. In general though, it seems like an
opt-in strategy would make more sense, as it doesn't make an awful lot
of sense to me for the plugins to be used to build the vDSO.

So I would prefer that this patch filters out $(GCC_PLUGINS_CFLAGS).

Will
