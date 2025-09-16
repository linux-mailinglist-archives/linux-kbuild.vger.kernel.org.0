Return-Path: <linux-kbuild+bounces-8833-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9541EB596D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 15:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A31947A23C4
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 13:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632AE2D4807;
	Tue, 16 Sep 2025 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmRzLJuu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BDA248F7D;
	Tue, 16 Sep 2025 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027833; cv=none; b=Cvs4zv2C1Z7T4vN71MldVUQiNDyyBXWn67D18wB7pNNzbTH/DB9vNYp4GGjK5MMsBy1WXMpTW/E/xI1+rRkGNWETk12tCxANsXmb7TYYGhEaX+1mdcUgqxGL7rDkeuRybBx83XYiYItmR5I1qar4VRIULihagTbJEulEUqZgFMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027833; c=relaxed/simple;
	bh=xlae1wF0J130jtwg6EYfQcFhZjLwjiRFyW9NKgHZCAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+kLiWxlge6jbVHEDn71R4aBiFdZ94lhw98W1Iv5VdliYDk+RNiqAu7/mggpcEjckDrDAQIYm4uaMFW097yqIw3GTGtGAbsqb+zwO8uORnd7YdIK6bZKcs6Ln+pHriJJKOArQEETsSspQz00R4ZZE/5EGZIdDP5XFQ9mAA8nWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmRzLJuu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E22C4CEEB;
	Tue, 16 Sep 2025 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758027831;
	bh=xlae1wF0J130jtwg6EYfQcFhZjLwjiRFyW9NKgHZCAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lmRzLJuuhcwEe47TwLrX3dZEjy6Fyv1PHIAJbIjgd4V+mQeBkIYkg29UspxuCVvDB
	 AcWbozXEYCGq5Iuk+7JKShUkRSfcJujoDjV5MGivkbC7v4sJ9Wt4OuBqZJNGopAs8M
	 TJImjIQSHYxsWudqCRI2Jd/dHXEgoNxazg8LKkL71EfAa84fNJKPxp4H8B5Up43tFI
	 PdLDLQcSqyPnAfkQ1m3zQDk7iMKd+S7+b35H/GCGSqq/UdeA2XcBLehBLxe4PoMZnE
	 CjP8v/5VvQ+qNXZAkV5SRknrMSMOEkq5WyUfvGX5cgAHMnw3NKAG5mhjKFhLXMcoaS
	 BE3gckgYx2y9Q==
Date: Tue, 16 Sep 2025 15:03:46 +0200
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
Message-ID: <aMlgMkB2nL31K2OB@example.org>
References: <cover.1755535876.git.legion@kernel.org>
 <4d53c72293d88b663257a0d723ebf3473a08b374.1755535876.git.legion@kernel.org>
 <aMeqgPVfJcjBLhl8@levanger>
 <aMkN1m55vejTii_H@example.org>
 <aMkvtg55F1gJ5feM@levanger>
 <aMlKTPpNXrRW6v_7@example.org>
 <aMlbSEnwGOPM39Op@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMlbSEnwGOPM39Op@levanger>

On Tue, Sep 16, 2025 at 02:42:48PM +0200, Nicolas Schier wrote:
> > > > > Hi Alexey,
> > > > > 
> > > > > with this patch applied, I still get a warning from objcpy as Masahiro
> > > > > and Stephen wrote [1,2]
> > > > > 
> > > > >   SORTTAB vmlinux.unstripped
> > > > > + sorttable vmlinux.unstripped
> > > > > + nm -S vmlinux.unstripped
> > > > > + ./scripts/sorttable -s .tmp_vmlinux.nm-sort vmlinux.unstripped
> > > > > + is_enabled CONFIG_KALLSYMS
> > > > > + grep -q ^CONFIG_KALLSYMS=y include/config/auto.conf
> > > > > + cmp -s System.map .tmp_vmlinux2.syms
> > > > > + echo vmlinux.unstripped: ../scripts/link-vmlinux.sh
> > > > > # OBJCOPY vmlinux
> > > > >   objcopy --remove-section=.modinfo vmlinux.unstripped vmlinux
> > > > > objcopy: vmlinux.unstripped: warning: empty loadable segment detected at vaddr=0xffff8000807a0000, is this intentional?
> > > > > 
> > > > > (arm64, allnoconfig)
> > > > > 
> > > > > Kind regards,
> > > > > Nicolas
> > > > > 
> > > > > 
> > > > > [1]: https://lore.kernel.org/linux-kbuild/CAK7LNAR-gD2H6Kk-rZjo0R3weTHCGTm0a=u2tRH1WWW6Sx6=RQ@mail.gmail.com/
> > > > > [2]: https://lore.kernel.org/lkml/20250730164047.7c4a731a@canb.auug.org.au/
> > > > > 
> > > > 
> > > > Hm. I missed that. I need to investigate how to fix this. Nothing comes
> > > > to mind right now.
> > > 
> > > Same here.  Only thing I could find until now is
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/scripts/link-vmlinux.sh?id=90ceddcb495008ac8ba7a3dce297841efcd7d584
> > > 
> > > where '2>/dev/null' is appended exactly to prevent this very warning.
> > > But for me, it doesn't feel good doing that when stripping to vmlinux.
> > 
> > Yes, that's not a very good approach. It will hide other errors that will
> > definitely need to be seen. I think the commit you mentioned is actually
> > incorrect. I think there should be a different solution.
> > 
> > I think in the case of .modinfo, we can change the flag in the section
> > since we are going to delete it anyway.
> > 
> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > index dbbe3bf0cf23..9a118b31d0dc 100644
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -87,7 +87,8 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> >  remove-symbols := -w --strip-symbol='__mod_device_table__*'
> >  
> >  quiet_cmd_strip_relocs = OBJCOPY $@
> > -      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
> > +      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< && \
> > +                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
> >                           $(remove-symbols) $< $@
> >  
> >  targets += vmlinux
> 
> Ah, great!  I thought we had to fiddle around with linker scripts et al.
> I needed to use an intermediate file:
> 
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index e2ceeb9e168d..516d51ca634b 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -90,6 +90,9 @@ remove-section-y                                   := .modinfo
>  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
>  
>  quiet_cmd_strip_relocs = OBJCOPY $@
> -      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $< $@
> +      cmd_strip_relocs = set -e; \
> +                        trap 'rm $<.noload' EXIT HUP INT; \
> +                        $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $<.noload && \
> +                        $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $<.noload $@
>  
>  targets += vmlinux

according to man-page:

  If you do not specify outfile, objcopy creates a temporary file and
  destructively renames the result with the name of infile.

That is true even in freebsd:

https://man.freebsd.org/cgi/man.cgi?query=objcopy

Do you want to support any other objcopy implementations ?

-- 
Rgrds, legion


