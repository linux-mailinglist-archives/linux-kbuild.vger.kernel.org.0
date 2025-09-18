Return-Path: <linux-kbuild+bounces-8846-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC70B82DAD
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 06:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7EEE7A64B8
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 04:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC4323D7F4;
	Thu, 18 Sep 2025 04:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeE1FzUU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30EA1F4181;
	Thu, 18 Sep 2025 04:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758168552; cv=none; b=NUHywVy/+94y7L/NFn6FdNd6TvvirjD3rGxVbuInGnE13E7HciYy05gQNtLS4dtKL912udd32L6uIKbpJpZBD3HoULpWRTVwtaOLHKkNRK2P6+VMyZIaBhAKjsVc8tF3/qWjmQF04DsqoAUP21dvyLUhEapQKx3G9O0VGodnnmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758168552; c=relaxed/simple;
	bh=DWbSGaeUDI+94RjG4nVLjU8+xda9a6RkuDCPS0NFvYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fStaQ5MjH98QJzcTNYf66ijrBM7cnrMLgRy7OFiqmHHAYk1nMCsFK/K7Jzqn+PSC760psJX6NzGxH9aFk+HpmXRPtqw8ia17rWJPRcgDdkCwgWjqo9Bz6+hNj6/WMA3lAa7Oo5DhOiRIsJXr4haHCwcTHWU4Yh977jmfOohnCFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeE1FzUU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC85C4CEE7;
	Thu, 18 Sep 2025 04:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758168551;
	bh=DWbSGaeUDI+94RjG4nVLjU8+xda9a6RkuDCPS0NFvYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeE1FzUUm9Gp0s0l9dMYuEkT1qY9+hNwzO0zKMfnauL5MIxSYxRxRkQsMcnDF4+eB
	 4+byZ7+cqmfE8LibXGsNEr1hXDyDnki3WkCPWY2zvwp5AOX+K9+FFXuMQVpdI8ILVB
	 Elo3pDQHPobx5Jgnda8HvFzD5x1EE/mVL5HQ4NXc7emlRYALVJalPxTOJpQCpkx7cA
	 /POob3n1wYHJnxF4wqrNErMCrc6QngfIh9jh4F39f+Hbx3lo6gGxAT5x0hLBr1RbqF
	 T35D94prSMKkEabxTk75EP2UUtxTxGcb5id5V0r3ROuzUPkfrbjbn2381nX15coArj
	 4I358aDxRP9ww==
Date: Thu, 18 Sep 2025 06:08:51 +0200
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
Message-ID: <aMuF0zY_3gusK1nz@levanger>
References: <cover.1755535876.git.legion@kernel.org>
 <4d53c72293d88b663257a0d723ebf3473a08b374.1755535876.git.legion@kernel.org>
 <aMeqgPVfJcjBLhl8@levanger>
 <aMkN1m55vejTii_H@example.org>
 <aMkvtg55F1gJ5feM@levanger>
 <aMlKTPpNXrRW6v_7@example.org>
 <aMlbSEnwGOPM39Op@levanger>
 <aMqhuFQGAGtYFbRV@levanger>
 <aMqrrjXZxYXN0zdY@example.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMqrrjXZxYXN0zdY@example.org>

On Wed, Sep 17, 2025 at 02:38:06PM +0200, Alexey Gladkov wrote:
> On Wed, Sep 17, 2025 at 01:55:36PM +0200, Nicolas Schier wrote:
> > On Tue, Sep 16, 2025 at 02:42:48PM +0200, Nicolas Schier wrote:
> > > On Tue, Sep 16, 2025 at 01:30:20PM +0200, Alexey Gladkov wrote:
> > ...
> > > > I think in the case of .modinfo, we can change the flag in the section
> > > > since we are going to delete it anyway.
> > > > 
> > > > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > > > index dbbe3bf0cf23..9a118b31d0dc 100644
> > > > --- a/scripts/Makefile.vmlinux
> > > > +++ b/scripts/Makefile.vmlinux
> > > > @@ -87,7 +87,8 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> > > >  remove-symbols := -w --strip-symbol='__mod_device_table__*'
> > > >  
> > > >  quiet_cmd_strip_relocs = OBJCOPY $@
> > > > -      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
> > > > +      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< && \
> > > > +                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
> > > >                           $(remove-symbols) $< $@
> > > >  
> > > >  targets += vmlinux
> > > 
> > > Ah, great!  I thought we had to fiddle around with linker scripts et al.
> > > I needed to use an intermediate file:
> > > 
> > > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > > index e2ceeb9e168d..516d51ca634b 100644
> > > --- a/scripts/Makefile.vmlinux
> > > +++ b/scripts/Makefile.vmlinux
> > > @@ -90,6 +90,9 @@ remove-section-y                                   := .modinfo
> > >  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> > >  
> > >  quiet_cmd_strip_relocs = OBJCOPY $@
> > > -      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $< $@
> > > +      cmd_strip_relocs = set -e; \
> > > +                        trap 'rm $<.noload' EXIT HUP INT; \
> > > +                        $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $<.noload && \
> > > +                        $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $<.noload $@
> > >  
> > >  targets += vmlinux
> > 
> > I'd like to suggest another version closer to yours, as mine has several flaws:
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
> > +      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $@; \
> > +                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
> >                           $(remove-symbols) $@
> >  
> >  targets += vmlinux
> > 
> > 
> > 
> > Rationale (mainly for myself to not walk into that trap too often again):
> > 
> >   * Use ';' instead of '&&' as 'cmd_' is evaluated in a 'set -e'
> >     environment ('cmd') and thus '&&' may hide a possible error exit
> >     code.
> 
> No, it can't hide exit code. The exit code will be correct even if
> ‘set -e’ is not used.
> 
> $ (exit 0) && (exit 2) && (exit 3); echo $?
> 2
> 
> Actually ‘&&’ is protection against the absence of ‘set -e’.

That is correct for such a simple command sequence.

Putting a compound 'command1 && command2' sequence in a cmd_* macro leads to a
mixture of non-comound and compound statements:

    ( set -e; (exit 0) && (exit 2) && (exit 3); printf 'bye\n' ); echo $?

thus we have a case as described in [1, "-e"], so that the exit code 2
gets lost due to the following successful 'printf'.

[1]: https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_26


> 
> >   * Create 'vmlinux' already with the first objcopy and let the second
> >     one modify it in order to not need a temporary file; iff one or the
> >     other objcopy exists with an error exit code, the 'set -e + trap'
> >     ('delete-on-interrupt') shell will remove a possibly existing
> >     vmlinux file.
> 
> That makes totally sense. This will avoid a temporary file. I will use it
> in the new version.
> 
> -- 
> Rgrds, legion
> 

-- 
Nicolas

