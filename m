Return-Path: <linux-kbuild+bounces-8491-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C50CB2931E
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Aug 2025 14:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D2F483ABD
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Aug 2025 12:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A218022616C;
	Sun, 17 Aug 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFgvmGuL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FF8217730;
	Sun, 17 Aug 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755435165; cv=none; b=qk4ychvWcmyXhU3EeA6LUd4YXkQS8/9ZOrxSXmM3IVXSQGHMinoI4iCpcMp9qdIvDoIgPxwoNCl0DiEFKddjhhds+tMvwiF9MCVZJ9Se4eYq2wzegr+cQxLmShX+G+X1AG6ByJZGddV5LLV2EXTDX8yaaHmcPtM+ICD0xdQbXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755435165; c=relaxed/simple;
	bh=oV3+jyn62XLBXLWVu/rJ9L9fudX4FVawuqdm6lJhq7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+3RAB/vHul4/6ggZN2CALcJjBEpwLIdBxZKC0J0vvzKGaXW7vIQdTH91f3r0m17zPiJ0pfziWCMR9IPGha6qpp58HZmRbx/CiXmeK31woz9qb+U28gIcwbbosBloBaLmgbl+NIcTqgQYTpDUAn2iVOAUY23oSepKHR4+7YOx38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFgvmGuL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A31C4CEEB;
	Sun, 17 Aug 2025 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755435164;
	bh=oV3+jyn62XLBXLWVu/rJ9L9fudX4FVawuqdm6lJhq7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFgvmGuLRnMlhs3uzPT6dzO/0601X701xh5wUSGa8kB8p+tbmNGNUddGn02r2bFvK
	 nQSdzm+3FQxNehb0XhcfGlcqXNoRKx5mKGkhj8OJbVkcsB8i49ha3ooOGPSKBWVqHZ
	 Z/GEb20mBg5Un/U8FhC1srOSpgEwMhNE9ZOA1uuxiqOvP4IeulXdD10W6swrR26K64
	 67kZ9kikUi6lWB1I+YaH+cQe+x03fcJNSE/TJ1dxeXQAmGjeCMquD7k5zf0TicImqC
	 Ue9K0igLzTCgEOF3BEkWxEicdSCuVZALimhgpPA6nuSYAFqAgUKcZCXkISYNOiWh6u
	 KFHJ3WDqiE11Q==
Date: Sun, 17 Aug 2025 14:52:39 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6 3/9] kbuild: extract modules.builtin.modinfo from
 vmlinux.unstripped
Message-ID: <aKHQl_XC63-c-81L@example.org>
References: <cover.1755170493.git.legion@kernel.org>
 <16859d94a2c8e4b1bb305defdb8b7be238499c66.1755170493.git.legion@kernel.org>
 <CAK7LNAR-gD2H6Kk-rZjo0R3weTHCGTm0a=u2tRH1WWW6Sx6=RQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAR-gD2H6Kk-rZjo0R3weTHCGTm0a=u2tRH1WWW6Sx6=RQ@mail.gmail.com>

On Sun, Aug 17, 2025 at 09:34:52PM +0900, Masahiro Yamada wrote:
> On Thu, Aug 14, 2025 at 10:08 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > From: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Currently, we assume all the data for modules.builtin.modinfo are
> > available in vmlinux.o.
> >
> > This makes it impossible for modpost, which is invoked after vmlinux.o,
> > to add additional module info.
> >
> > This commit moves the modules.builtin.modinfo rule after modpost.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> 
> I got this report from Stephen
> https://lore.kernel.org/lkml/20250730164047.7c4a731a@canb.auug.org.au/
> 
> Please make sure to have no regression.
> If this is difficult to solve, please discard this patch,
> and consider a different approach.

My emails must have gotten lost somewhere. Because I replied to that
message right away and provided a fix. Stephen even applied it to the tree
later. You were in CC whole time.

https://lore.kernel.org/all/20250730090025.2402129-1-legion@kernel.org/

Tomorrow I will make a new version with the corrections I missed. But now,
I'm not sure to which tree I should send it.

> 
> > ---
> >  scripts/Makefile.vmlinux   | 26 ++++++++++++++++++++++++++
> >  scripts/Makefile.vmlinux_o | 26 +-------------------------
> >  2 files changed, 27 insertions(+), 25 deletions(-)
> >
> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > index e2ceeb9e168d..fdab5aa90215 100644
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -96,6 +96,32 @@ targets += vmlinux
> >  vmlinux: vmlinux.unstripped FORCE
> >         $(call if_changed,strip_relocs)
> >
> > +# modules.builtin.modinfo
> > +# ---------------------------------------------------------------------------
> > +
> > +OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> > +
> > +targets += modules.builtin.modinfo
> > +modules.builtin.modinfo: vmlinux.unstripped FORCE
> > +       $(call if_changed,objcopy)
> > +
> > +# modules.builtin
> > +# ---------------------------------------------------------------------------
> > +
> > +__default: modules.builtin
> > +
> > +# The second line aids cases where multiple modules share the same object.
> > +
> > +quiet_cmd_modules_builtin = GEN     $@
> > +      cmd_modules_builtin = \
> > +       tr '\0' '\n' < $< | \
> > +       sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
> > +       tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
> > +
> > +targets += modules.builtin
> > +modules.builtin: modules.builtin.modinfo FORCE
> > +       $(call if_changed,modules_builtin)
> > +
> >  # modules.builtin.ranges
> >  # ---------------------------------------------------------------------------
> >  ifdef CONFIG_BUILTIN_MODULE_RANGES
> > diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> > index b024ffb3e201..23c8751285d7 100644
> > --- a/scripts/Makefile.vmlinux_o
> > +++ b/scripts/Makefile.vmlinux_o
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> >  PHONY := __default
> > -__default: vmlinux.o modules.builtin.modinfo modules.builtin
> > +__default: vmlinux.o
> >
> >  include include/config/auto.conf
> >  include $(srctree)/scripts/Kbuild.include
> > @@ -73,30 +73,6 @@ vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> >
> >  targets += vmlinux.o
> >
> > -# modules.builtin.modinfo
> > -# ---------------------------------------------------------------------------
> > -
> > -OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> > -
> > -targets += modules.builtin.modinfo
> > -modules.builtin.modinfo: vmlinux.o FORCE
> > -       $(call if_changed,objcopy)
> > -
> > -# modules.builtin
> > -# ---------------------------------------------------------------------------
> > -
> > -# The second line aids cases where multiple modules share the same object.
> > -
> > -quiet_cmd_modules_builtin = GEN     $@
> > -      cmd_modules_builtin = \
> > -       tr '\0' '\n' < $< | \
> > -       sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
> > -       tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
> > -
> > -targets += modules.builtin
> > -modules.builtin: modules.builtin.modinfo FORCE
> > -       $(call if_changed,modules_builtin)
> > -
> >  # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
> >  # ---------------------------------------------------------------------------
> >
> > --
> > 2.50.1
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 

-- 
Rgrds, legion


