Return-Path: <linux-kbuild+bounces-8832-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EDBB59666
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 14:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B851E1661F2
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 12:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847432D8393;
	Tue, 16 Sep 2025 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNFxxsu0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D051D7E41;
	Tue, 16 Sep 2025 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758026580; cv=none; b=bD7Fh0cAJ0fquxCHh40uiHOQxkxNgvOF364mjM/4ZG4h8pAcrnjjDJrOp3pofeD0ZMmac8ULNSXKlM8lANJDlFA5J4x3wW8etq5td/qmDxjbseXYGjYXjV19jkcwrd/R2bB2clrU5hU11h16xHImVVRdNXzLIXLW+IbRbaUIxMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758026580; c=relaxed/simple;
	bh=Xym1C7kCReahUyIDaH4uVrxOPci8iDTBWhLqmHN44Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSj0cDe4Y3im0BvhemFRQks/MvE4e5ehgdNUaY77KiIMMd6dKjFC46IEsKWPlQ5NnIiqGQ23nyES/Px8ouKZc4CIFJJn4C2VK0cw1utVJwlyo36QG4JENoVuzLae5adYPVsZsyITUa3heYxfwfpZSESO+dLVhopVd8lCMYEzvyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNFxxsu0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70393C4CEEB;
	Tue, 16 Sep 2025 12:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758026579;
	bh=Xym1C7kCReahUyIDaH4uVrxOPci8iDTBWhLqmHN44Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNFxxsu0XuwyRswhzj+ojecyz5usTAUzPfD+lfcrQncx6Flw/nqRJBEzdZ9XFlEtk
	 y9tcIctwdPDCpm2CJGoHZQW6e2Yva7z8/5yFjvLyZqnadwmVw91DuvYcbATowvyRW5
	 zzFfnnHry6PNaheXQv0WTss8NwngwibjdjDUK741H8O7D67kYpEe81C/9PNLEC+u3+
	 wA7QD0sr7fgJTIAmBtSfp0pkaU80TZbzFx8OrtxAvbJhiOW/QD/RCz10fnepSiYLBj
	 6Eo24E/jQwacj2FTq9dsVOGIIl/F9nbwTvPSJmFZYtC5/cHu48gE1ufNfGJd7b+9td
	 GW7cTUf0laZKg==
Date: Tue, 16 Sep 2025 14:42:48 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v7 3/8] kbuild: keep .modinfo section in
 vmlinux.unstripped
Message-ID: <aMlbSEnwGOPM39Op@levanger>
References: <cover.1755535876.git.legion@kernel.org>
 <4d53c72293d88b663257a0d723ebf3473a08b374.1755535876.git.legion@kernel.org>
 <aMeqgPVfJcjBLhl8@levanger>
 <aMkN1m55vejTii_H@example.org>
 <aMkvtg55F1gJ5feM@levanger>
 <aMlKTPpNXrRW6v_7@example.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMlKTPpNXrRW6v_7@example.org>

On Tue, Sep 16, 2025 at 01:30:20PM +0200, Alexey Gladkov wrote:
> On Tue, Sep 16, 2025 at 11:36:54AM +0200, Nicolas Schier wrote:
> > On Tue, Sep 16, 2025 at 09:12:22AM +0200, Alexey Gladkov wrote:
> > > On Mon, Sep 15, 2025 at 07:56:16AM +0200, Nicolas Schier wrote:
> > > > On Mon, Aug 18, 2025 at 06:54:57PM +0200, Alexey Gladkov wrote:
> > > > > From: Masahiro Yamada <masahiroy@kernel.org>
> > > > > 
> > > > > Keep the .modinfo section during linking, but strip it from the final
> > > > > vmlinux.
> > > > > 
> > > > > Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms.
> > > > > 
> > > > > This change will allow the next commit to extract the .modinfo section
> > > > > from the vmlinux.unstripped intermediate.
> > > > > 
> > > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > > ---
> > > > >  include/asm-generic/vmlinux.lds.h | 2 +-
> > > > >  scripts/Makefile.vmlinux          | 2 +-
> > > > >  scripts/mksysmap                  | 3 +++
> > > > >  3 files changed, 5 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > > > > index ae2d2359b79e9..cfa63860dfd4c 100644
> > > > > --- a/include/asm-generic/vmlinux.lds.h
> > > > > +++ b/include/asm-generic/vmlinux.lds.h
> > > > > @@ -831,6 +831,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
> > > > >  
> > > > >  /* Required sections not related to debugging. */
> > > > >  #define ELF_DETAILS							\
> > > > > +		.modinfo : { *(.modinfo) }				\
> > > > >  		.comment 0 : { *(.comment) }				\
> > > > >  		.symtab 0 : { *(.symtab) }				\
> > > > >  		.strtab 0 : { *(.strtab) }				\
> > > > > @@ -1044,7 +1045,6 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
> > > > >  	*(.discard.*)							\
> > > > >  	*(.export_symbol)						\
> > > > >  	*(.no_trim_symbol)						\
> > > > > -	*(.modinfo)							\
> > > > >  	/* ld.bfd warns about .gnu.version* even when not emitted */	\
> > > > >  	*(.gnu.version*)						\
> > > > >  
> > > > > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > > > > index 4f2d4c3fb7372..e2ceeb9e168d4 100644
> > > > > --- a/scripts/Makefile.vmlinux
> > > > > +++ b/scripts/Makefile.vmlinux
> > > > > @@ -86,7 +86,7 @@ endif
> > > > >  # vmlinux
> > > > >  # ---------------------------------------------------------------------------
> > > > >  
> > > > > -remove-section-y                                   :=
> > > > > +remove-section-y                                   := .modinfo
> > > > >  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> > > > >  
> > > > >  quiet_cmd_strip_relocs = OBJCOPY $@
> > > > > diff --git a/scripts/mksysmap b/scripts/mksysmap
> > > > > index 3accbdb269ac7..a607a0059d119 100755
> > > > > --- a/scripts/mksysmap
> > > > > +++ b/scripts/mksysmap
> > > > > @@ -79,6 +79,9 @@
> > > > >  / _SDA_BASE_$/d
> > > > >  / _SDA2_BASE_$/d
> > > > >  
> > > > > +# MODULE_INFO()
> > > > > +/ __UNIQUE_ID_modinfo[0-9]*$/d
> > > > > +
> > > > >  # ---------------------------------------------------------------------------
> > > > >  # Ignored patterns
> > > > >  #  (symbols that contain the pattern are ignored)
> > > > > -- 
> > > > > 2.50.1
> > > > > 
> > > > 
> > > > Hi Alexey,
> > > > 
> > > > with this patch applied, I still get a warning from objcpy as Masahiro
> > > > and Stephen wrote [1,2]
> > > > 
> > > >   SORTTAB vmlinux.unstripped
> > > > + sorttable vmlinux.unstripped
> > > > + nm -S vmlinux.unstripped
> > > > + ./scripts/sorttable -s .tmp_vmlinux.nm-sort vmlinux.unstripped
> > > > + is_enabled CONFIG_KALLSYMS
> > > > + grep -q ^CONFIG_KALLSYMS=y include/config/auto.conf
> > > > + cmp -s System.map .tmp_vmlinux2.syms
> > > > + echo vmlinux.unstripped: ../scripts/link-vmlinux.sh
> > > > # OBJCOPY vmlinux
> > > >   objcopy --remove-section=.modinfo vmlinux.unstripped vmlinux
> > > > objcopy: vmlinux.unstripped: warning: empty loadable segment detected at vaddr=0xffff8000807a0000, is this intentional?
> > > > 
> > > > (arm64, allnoconfig)
> > > > 
> > > > Kind regards,
> > > > Nicolas
> > > > 
> > > > 
> > > > [1]: https://lore.kernel.org/linux-kbuild/CAK7LNAR-gD2H6Kk-rZjo0R3weTHCGTm0a=u2tRH1WWW6Sx6=RQ@mail.gmail.com/
> > > > [2]: https://lore.kernel.org/lkml/20250730164047.7c4a731a@canb.auug.org.au/
> > > > 
> > > 
> > > Hm. I missed that. I need to investigate how to fix this. Nothing comes
> > > to mind right now.
> > 
> > Same here.  Only thing I could find until now is
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/scripts/link-vmlinux.sh?id=90ceddcb495008ac8ba7a3dce297841efcd7d584
> > 
> > where '2>/dev/null' is appended exactly to prevent this very warning.
> > But for me, it doesn't feel good doing that when stripping to vmlinux.
> 
> Yes, that's not a very good approach. It will hide other errors that will
> definitely need to be seen. I think the commit you mentioned is actually
> incorrect. I think there should be a different solution.
> 
> I think in the case of .modinfo, we can change the flag in the section
> since we are going to delete it anyway.
> 
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index dbbe3bf0cf23..9a118b31d0dc 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -87,7 +87,8 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
>  remove-symbols := -w --strip-symbol='__mod_device_table__*'
>  
>  quiet_cmd_strip_relocs = OBJCOPY $@
> -      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
> +      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< && \
> +                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
>                           $(remove-symbols) $< $@
>  
>  targets += vmlinux

Ah, great!  I thought we had to fiddle around with linker scripts et al.
I needed to use an intermediate file:

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index e2ceeb9e168d..516d51ca634b 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -90,6 +90,9 @@ remove-section-y                                   := .modinfo
 remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
 
 quiet_cmd_strip_relocs = OBJCOPY $@
-      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $< $@
+      cmd_strip_relocs = set -e; \
+                        trap 'rm $<.noload' EXIT HUP INT; \
+                        $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $<.noload && \
+                        $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $<.noload $@
 
 targets += vmlinux


Kind regards,
Nicolas

