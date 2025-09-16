Return-Path: <linux-kbuild+bounces-8827-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831CEB58EDE
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 09:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DAF9320122
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 07:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924162E3B12;
	Tue, 16 Sep 2025 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psp5bO/F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B12DEA6F;
	Tue, 16 Sep 2025 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758006748; cv=none; b=u7WNEiPPq4+hP+YThu8iJ0hDfRKuQJEy1tR9zlBZdCalihZK7q2fFbk2yK0kY2JyvYvB8bcFeES9bzAajJYEk5PoxvJB6UwnM7o9GMcMPiqxgNcy0nojNDOlbx5Ov1S/0xi1RMJPVybEsR3X1e4JttREsdgix7MDbaPT8+Upr10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758006748; c=relaxed/simple;
	bh=oU7VvkqktkVNm/KzNrVro7cjiuBKEqIXf9EnmXfNqrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQQ+Wqp9G6k9XU4icvK0yrgavZSurICZ1U/NbNpxLa8k167iUjwi4BDDZJNZ85qWIu+EmD2cHL7zpIek4rBlkHSaFMeXzTRFIT0RdIcGOdf1ir+jIkc5cxCfKIEI/g5tVs7uW9kBjyt4ylbHy8fh8/KqnjOasQI32TUII61I6+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psp5bO/F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B238DC4CEEB;
	Tue, 16 Sep 2025 07:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758006747;
	bh=oU7VvkqktkVNm/KzNrVro7cjiuBKEqIXf9EnmXfNqrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psp5bO/FZW/iyXU/LKpkMlICcpyAt3VX7ZKbABuO9tVK15McJy+5OJowkicZksuln
	 yZFBMkmAkhKrtl2cS4yanL4usmxSc8kddAt7daP9GOlusbHJ8kj5YOQPpWGDcu4gBp
	 XsnyHOw0ZtmQm55Jan1g4GUNvVHbNb+EqkTmAY5rqxtKQm3drNnGsBzCiutRQ7YAm8
	 Sk/wQQmeLWb08x4FLcR3zz9E/hDGexpTCiPLD2gIyccS9ecgi6A/akq/KLblK4abj8
	 AzBJgf6Q2TFrauF0/mt/GZDsJ+UCVVW4jslTuEhSRybzoSqgf7ZIt4OSf1OzUGMlr+
	 7u0hKreUOi1FQ==
Date: Tue, 16 Sep 2025 09:12:22 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v7 3/8] kbuild: keep .modinfo section in
 vmlinux.unstripped
Message-ID: <aMkN1m55vejTii_H@example.org>
References: <cover.1755535876.git.legion@kernel.org>
 <4d53c72293d88b663257a0d723ebf3473a08b374.1755535876.git.legion@kernel.org>
 <aMeqgPVfJcjBLhl8@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMeqgPVfJcjBLhl8@levanger>

On Mon, Sep 15, 2025 at 07:56:16AM +0200, Nicolas Schier wrote:
> On Mon, Aug 18, 2025 at 06:54:57PM +0200, Alexey Gladkov wrote:
> > From: Masahiro Yamada <masahiroy@kernel.org>
> > 
> > Keep the .modinfo section during linking, but strip it from the final
> > vmlinux.
> > 
> > Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms.
> > 
> > This change will allow the next commit to extract the .modinfo section
> > from the vmlinux.unstripped intermediate.
> > 
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 2 +-
> >  scripts/Makefile.vmlinux          | 2 +-
> >  scripts/mksysmap                  | 3 +++
> >  3 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index ae2d2359b79e9..cfa63860dfd4c 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -831,6 +831,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
> >  
> >  /* Required sections not related to debugging. */
> >  #define ELF_DETAILS							\
> > +		.modinfo : { *(.modinfo) }				\
> >  		.comment 0 : { *(.comment) }				\
> >  		.symtab 0 : { *(.symtab) }				\
> >  		.strtab 0 : { *(.strtab) }				\
> > @@ -1044,7 +1045,6 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
> >  	*(.discard.*)							\
> >  	*(.export_symbol)						\
> >  	*(.no_trim_symbol)						\
> > -	*(.modinfo)							\
> >  	/* ld.bfd warns about .gnu.version* even when not emitted */	\
> >  	*(.gnu.version*)						\
> >  
> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > index 4f2d4c3fb7372..e2ceeb9e168d4 100644
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -86,7 +86,7 @@ endif
> >  # vmlinux
> >  # ---------------------------------------------------------------------------
> >  
> > -remove-section-y                                   :=
> > +remove-section-y                                   := .modinfo
> >  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> >  
> >  quiet_cmd_strip_relocs = OBJCOPY $@
> > diff --git a/scripts/mksysmap b/scripts/mksysmap
> > index 3accbdb269ac7..a607a0059d119 100755
> > --- a/scripts/mksysmap
> > +++ b/scripts/mksysmap
> > @@ -79,6 +79,9 @@
> >  / _SDA_BASE_$/d
> >  / _SDA2_BASE_$/d
> >  
> > +# MODULE_INFO()
> > +/ __UNIQUE_ID_modinfo[0-9]*$/d
> > +
> >  # ---------------------------------------------------------------------------
> >  # Ignored patterns
> >  #  (symbols that contain the pattern are ignored)
> > -- 
> > 2.50.1
> > 
> 
> Hi Alexey,
> 
> with this patch applied, I still get a warning from objcpy as Masahiro
> and Stephen wrote [1,2]
> 
>   SORTTAB vmlinux.unstripped
> + sorttable vmlinux.unstripped
> + nm -S vmlinux.unstripped
> + ./scripts/sorttable -s .tmp_vmlinux.nm-sort vmlinux.unstripped
> + is_enabled CONFIG_KALLSYMS
> + grep -q ^CONFIG_KALLSYMS=y include/config/auto.conf
> + cmp -s System.map .tmp_vmlinux2.syms
> + echo vmlinux.unstripped: ../scripts/link-vmlinux.sh
> # OBJCOPY vmlinux
>   objcopy --remove-section=.modinfo vmlinux.unstripped vmlinux
> objcopy: vmlinux.unstripped: warning: empty loadable segment detected at vaddr=0xffff8000807a0000, is this intentional?
> 
> (arm64, allnoconfig)
> 
> Kind regards,
> Nicolas
> 
> 
> [1]: https://lore.kernel.org/linux-kbuild/CAK7LNAR-gD2H6Kk-rZjo0R3weTHCGTm0a=u2tRH1WWW6Sx6=RQ@mail.gmail.com/
> [2]: https://lore.kernel.org/lkml/20250730164047.7c4a731a@canb.auug.org.au/
> 

Hm. I missed that. I need to investigate how to fix this. Nothing comes
to mind right now.

-- 
Rgrds, legion


