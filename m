Return-Path: <linux-kbuild+bounces-8838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497DAB7C395
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 13:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88CAA16AB1D
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 11:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C266371E81;
	Wed, 17 Sep 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APrOTn/P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6962DF712;
	Wed, 17 Sep 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110148; cv=none; b=l3NK7+jymL5DqH8Z+aRzKrXJdBN6eXJESNM7mGaJL0qw4Cn4x7zxexSM7Cfw0N7oDGmZa7LKOEBCBIpot14PDys/3lZqe1trwumlORLyCTp8hmny83SDOz80doQqDPYOeWrhrPglFKjZuvzDT/nSdLpYG7lSQaXpcNJC65ziI28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110148; c=relaxed/simple;
	bh=XuKskSIDES7GZZfe/LxPxNAGVLbMO39veQ0oMPgJMk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2gCMnSV34Yj/QC9kYRifO6w0SMz6qndGQ4j2jdf2YNb5VaZaE7cU0OT63eyfwfXnXiZQBvQdcs4Ogt7tXkbvdVXg7rqIwxBGPrygmnGtFkxeCiApDz9TIYsYl0HZzmX/ztAK6FflzzgRVL1SX5T2VNjYFOga/CmvVTm0tyXBZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APrOTn/P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937A5C4CEF7;
	Wed, 17 Sep 2025 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758110147;
	bh=XuKskSIDES7GZZfe/LxPxNAGVLbMO39veQ0oMPgJMk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APrOTn/PdjlgJhd824IjPN5cScrTKUy1xdd0XrPprXwvxpKBxhgcBbctMa7BHQpge
	 kTeNW4LZ2abfSI8uDKwPtuv35f/pcG7aYcrjr2zQISLltzaYjQOqYTpnHSUwCOMZ0s
	 hMApXTcRlx2vnNC2QstPYRdwnoHF/3/z147n13ioS0zGpCyWY0oAZ0pDz7uM0PYDyd
	 Ih2d6ZAtJCkP4q1Z2bZXloMklYmhn1yTikHLjBwgB6BOZgc4AkOmuXGkgQHlaT6xWN
	 u69HXV1sNWUOG//f8ef6AHZxg3NH6a5Cnd/dqWT9Z9x1Dh9TaFfK41Xx4plScjDqCp
	 Ve5Eg+N+Jc7cw==
Date: Wed, 17 Sep 2025 13:55:36 +0200
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
Message-ID: <aMqhuFQGAGtYFbRV@levanger>
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
> On Tue, Sep 16, 2025 at 01:30:20PM +0200, Alexey Gladkov wrote:
...
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

I'd like to suggest another version closer to yours, as mine has several flaws:

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index dbbe3bf0cf23..9a118b31d0dc 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -87,7 +87,8 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
 remove-symbols := -w --strip-symbol='__mod_device_table__*'
 
 quiet_cmd_strip_relocs = OBJCOPY $@
-      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
+      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $@; \
+                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
                          $(remove-symbols) $@
 
 targets += vmlinux



Rationale (mainly for myself to not walk into that trap too often again):

  * Use ';' instead of '&&' as 'cmd_' is evaluated in a 'set -e'
    environment ('cmd') and thus '&&' may hide a possible error exit
    code.

  * Create 'vmlinux' already with the first objcopy and let the second
    one modify it in order to not need a temporary file; iff one or the
    other objcopy exists with an error exit code, the 'set -e + trap'
    ('delete-on-interrupt') shell will remove a possibly existing
    vmlinux file.

Kind regards,
Nicolas

