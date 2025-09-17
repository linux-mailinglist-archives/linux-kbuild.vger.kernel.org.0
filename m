Return-Path: <linux-kbuild+bounces-8844-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71AB7DFD0
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 14:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B13352A4161
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 12:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C992F361A;
	Wed, 17 Sep 2025 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MF8oaL0u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36960238140;
	Wed, 17 Sep 2025 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758112692; cv=none; b=Poai1bf7LBkB8mXiDpZTc1Ygls7ITxqRuYC78vvU16fXLLTSslywt+9AZN9QDtPKtspxMn/0KIeWvzmrj9jT0zBQ+FXBJHTuUlg8Id36KAfNItSOhAoLDHuO/Dt1TlUBrUo4V+H6OJTbSNOCxBax8ciVHuoBmyCsiQ6gkEu0kuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758112692; c=relaxed/simple;
	bh=njQagFFNmXLDsU0106/ybuoQRu4ry9/hROx7T9egjxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GogadFq9YaGk46JR+01vTSYFxrnCOSY6CdiC4+OBbDlYtb2FiAReRzY5p1FC4Oqo7wF9h76vKI5aYDEr/59jc//wUoNwqvfml1cCvUxlCOGFDOP6pPSEIgJqzs82oRGBDKL429jg2fcTg4vwWUdqMj610P5FBG1vTycuSmEq1J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MF8oaL0u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0E4C4CEF7;
	Wed, 17 Sep 2025 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758112691;
	bh=njQagFFNmXLDsU0106/ybuoQRu4ry9/hROx7T9egjxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MF8oaL0uphBz+qhs3WC3BNMbMAOKI3ee9eEd/ZshuvwwEgPEjzDPSfnEC09lVhfQL
	 FQK7c9HzvmaoTpE/8ZxQRRlcWSJ7cUEevMH7JJZGA6pHlawQOLK7aJrnBHVWYahnu/
	 df2z1DtH/sfueiZ3KLcNWHqWZnKB5e17sRjwY4JnxGNIX578u4ApLMqaemI2qA1EL6
	 HVzUoeYeaJewBmvnkL0yy1h7+1jjuUdWN4OiGnWTm/YwcEtFk0bkMDf5W4I43ReV1X
	 +opOw/8u2BHWillMaGWO9FHKhyaA+KnQvwl6VG3DNWXVBPGnrvymDbCj+poyvWSJYv
	 qm1jgNPdJnx4w==
Date: Wed, 17 Sep 2025 14:38:06 +0200
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
Message-ID: <aMqrrjXZxYXN0zdY@example.org>
References: <cover.1755535876.git.legion@kernel.org>
 <4d53c72293d88b663257a0d723ebf3473a08b374.1755535876.git.legion@kernel.org>
 <aMeqgPVfJcjBLhl8@levanger>
 <aMkN1m55vejTii_H@example.org>
 <aMkvtg55F1gJ5feM@levanger>
 <aMlKTPpNXrRW6v_7@example.org>
 <aMlbSEnwGOPM39Op@levanger>
 <aMqhuFQGAGtYFbRV@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMqhuFQGAGtYFbRV@levanger>

On Wed, Sep 17, 2025 at 01:55:36PM +0200, Nicolas Schier wrote:
> On Tue, Sep 16, 2025 at 02:42:48PM +0200, Nicolas Schier wrote:
> > On Tue, Sep 16, 2025 at 01:30:20PM +0200, Alexey Gladkov wrote:
> ...
> > > I think in the case of .modinfo, we can change the flag in the section
> > > since we are going to delete it anyway.
> > > 
> > > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > > index dbbe3bf0cf23..9a118b31d0dc 100644
> > > --- a/scripts/Makefile.vmlinux
> > > +++ b/scripts/Makefile.vmlinux
> > > @@ -87,7 +87,8 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> > >  remove-symbols := -w --strip-symbol='__mod_device_table__*'
> > >  
> > >  quiet_cmd_strip_relocs = OBJCOPY $@
> > > -      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
> > > +      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< && \
> > > +                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
> > >                           $(remove-symbols) $< $@
> > >  
> > >  targets += vmlinux
> > 
> > Ah, great!  I thought we had to fiddle around with linker scripts et al.
> > I needed to use an intermediate file:
> > 
> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > index e2ceeb9e168d..516d51ca634b 100644
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -90,6 +90,9 @@ remove-section-y                                   := .modinfo
> >  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> >  
> >  quiet_cmd_strip_relocs = OBJCOPY $@
> > -      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $< $@
> > +      cmd_strip_relocs = set -e; \
> > +                        trap 'rm $<.noload' EXIT HUP INT; \
> > +                        $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $<.noload && \
> > +                        $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $<.noload $@
> >  
> >  targets += vmlinux
> 
> I'd like to suggest another version closer to yours, as mine has several flaws:
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
> +      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $@; \
> +                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
>                           $(remove-symbols) $@
>  
>  targets += vmlinux
> 
> 
> 
> Rationale (mainly for myself to not walk into that trap too often again):
> 
>   * Use ';' instead of '&&' as 'cmd_' is evaluated in a 'set -e'
>     environment ('cmd') and thus '&&' may hide a possible error exit
>     code.

No, it can't hide exit code. The exit code will be correct even if
‘set -e’ is not used.

$ (exit 0) && (exit 2) && (exit 3); echo $?
2

Actually ‘&&’ is protection against the absence of ‘set -e’.

>   * Create 'vmlinux' already with the first objcopy and let the second
>     one modify it in order to not need a temporary file; iff one or the
>     other objcopy exists with an error exit code, the 'set -e + trap'
>     ('delete-on-interrupt') shell will remove a possibly existing
>     vmlinux file.

That makes totally sense. This will avoid a temporary file. I will use it
in the new version.

-- 
Rgrds, legion


