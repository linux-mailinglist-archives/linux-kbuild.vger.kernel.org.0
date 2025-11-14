Return-Path: <linux-kbuild+bounces-9637-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E31DEC5F1A2
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 20:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE6CF4E197C
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 19:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE462312806;
	Fri, 14 Nov 2025 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/BHTggG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60532F0C7C;
	Fri, 14 Nov 2025 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763149842; cv=none; b=F1iPrbsvn/sSSO5x36VmhkC07iKenvPzYrZY9IXWdTynr0/J6QBnZqIItxfYmajKgLOkAckmjVWZpz8Njf2AcfbpIVikGmDzjNPDgDzQ/PdYEYc2xyJl/sRFLw5ToaUshbhYfL8akDpU71tOMl0c+XtxQBZs+zTlhpoIlK0trwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763149842; c=relaxed/simple;
	bh=P4jDFgpckbb8dQFLTRe3SuzEwoCwGSI3TBV6Fvm2Xmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbzMfhIZETeJNokYZVvCVLvPVxSo6c9YVeUB48g2HYGO+fqmJRUnKRmf1LEK5MbLgywnYTPhqlRKE1NMbFufNCJ8Eo598iolFNxsWYassQbOI2ecp3Sc6aw2hG6lN7mR3scfZ1dT3RWWJIsURcBKdfskVSSAGqK3oq6Y7GXm+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/BHTggG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E80DC113D0;
	Fri, 14 Nov 2025 19:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763149842;
	bh=P4jDFgpckbb8dQFLTRe3SuzEwoCwGSI3TBV6Fvm2Xmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/BHTggG9tTYn8Mkb0UOHAwwm6lQ/2zpXZpXGP5BB0oXXofILPf5JDftkh0zxKQVF
	 OiPXVwrQdhHjIrMFU57PKBbuBPr93mSNB6qIpnwb/P4bAs36SuRwJK+oO3sBUxntDW
	 50S0ZNUB86646bQfmbYCQrszzAK42crqOZjpWvkZDI7Z4wS3GYyJre8Ya9NhzcZ9mx
	 wmwBDkUX4l2LWIlGf/reQa+xT7BO565jPqmYszUSMWiAznHxHhClx3B/LpepdB70vW
	 alo098hg/hGTAYYEvDqeHKH8Iy9YJvs/Ni0Aztw9js9B9pO5O0sZN9HwuKwD6EQCjY
	 huWXvs64gwRKg==
Date: Fri, 14 Nov 2025 20:50:27 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>,
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <aReIA8YuOM7JIXIe@derry.ads.avm.de>
References: <20251114142741.1919072-1-sjg@chromium.org>
 <20251114142741.1919072-7-sjg@chromium.org>
 <20251114162255-10e006c6-dadc-44df-a8ed-ab4a00fc6402@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114162255-10e006c6-dadc-44df-a8ed-ab4a00fc6402@linutronix.de>

On Fri, Nov 14, 2025 at 04:29:33PM +0100, Thomas Weißschuh wrote:
> On Fri, Nov 14, 2025 at 07:27:32AM -0700, Simon Glass wrote:
> > Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> > ramdisk image within the FIT.
> > 
> > Add image.fit as a target which requires modules, so that modules will
> > built automatically when using FIT_MODULES=1
> > 
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
> > Acked-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > 
> > Changes in v5:
> > - Build modules automatically if needed (fix from Nicolas Schier)
> > 
> > Changes in v4:
> > - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> > - Use an empty FIT_MODULES to disable the feature, instead of '0'
> > - Make use of the 'modules' dependency to ensure modules are built
> > - Pass the list of modules to the script
> > 
> >  Makefile             |  1 +
> >  arch/arm64/Makefile  |  1 +
> >  scripts/Makefile.lib | 10 ++++++++--
> >  3 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 8cd46222fc48..4eccaef95826 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -773,6 +773,7 @@ endif
> >  # Just "make" or "make all" shall build modules as well
> >  
> >  modules-targets := all
> > +modules-targets += $(if $(FIT_MODULES),image.fit)
> >  modules-targets += modules
> >  modules-targets += nsdeps
> >  modules-targets += compile_commands.json
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index 73a10f65ce8b..7036f251ab40 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -174,6 +174,7 @@ endif
> >  all:	$(notdir $(KBUILD_IMAGE))
> >  
> >  image.fit: dtbs
> > +image.fit: $(if $(FIT_MODULES),modules)
> >  
> >  vmlinuz.efi image.fit: Image
> >  $(BOOT_TARGETS): vmlinux
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 1d581ba5df66..c6a3aa653035 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -398,11 +398,17 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
> >  # Use this to override the compression algorithm
> >  FIT_COMPRESSION ?= gzip
> >  
> > +# Set this to 1 to include an initrd with all the kernel modules
> > +FIT_MODULES ?=
> 
> '0' will also trigger that behavior.
> 
> > +
> >  quiet_cmd_fit = FIT     $@
> > -      cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > -		--name '$(UIMAGE_NAME)' \
> > +      cmd_fit = $(if $(FIT_MODULES), \
> > +		find $(objtree) -name '*.ko' > $(objtree)/.modules-list 2>/dev/null &&) \
> 
> This will include stale module files. You can get an up-to-date list from
> $(objtree)/modules.order with a bit post-processing.
> Maybe kbuild can be extended to also create a list of the .ko files.
> (I would be interested in that for my own usecases, too)

oh yes, thanks for the pointer.  This is indeed quite simple and much
better than calling find.  For in-tree kmods:

    compiled-modules = $(patsubst %.o,%.ko,$(call read-file, $(objtree)/modules.order))

But as we need the list of modules in a file, we can also add a
$(call write-file,FILE,TEXT) macro (cp. read-file in
scripts/Kbuild.include).

Thomas, is this sufficient for your use case?  Or do you also need a
make target outputting the list of kmods?


Kind regards,
Nicolas


