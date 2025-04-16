Return-Path: <linux-kbuild+bounces-6638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A235EA8B5A4
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 11:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C843445068
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 09:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147E22376F8;
	Wed, 16 Apr 2025 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5eYNU70"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B122376E9;
	Wed, 16 Apr 2025 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796318; cv=none; b=XrHdTXQw0YEVMv2vJud8Eu1R7QizOAPLF2euTj6QRe8ROQvgwzeeyCG93LKtnTgZaZb22uJ6gR2KoM4lD68Yb+fW0AXGMH6QuIZA8X4Sg/4GVYN8y+Dnxmh/E/ZJP+ZPWurLStgKhyhVGUaGrRcNZLNtuKpPeiPRqj0T+NG1bOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796318; c=relaxed/simple;
	bh=+ZCWbE1PR1VWajVp5YhiYDBJVfRXd0HwklhLy77IOWI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nu3dwJsuSEajt+dPhHxxtR9wvSS8h2FLNvmGPUn72EQAQt7BARA11yEWpJvFwHqracHKA960nLOU9oRVMizK6fLY1jGelZLBjcWqyzFsxwatynbig03fr9YSwDRI/0hAjZYqCchrtMwZjL1kVk6e8WFhixpUnM9KDsXcGT2KHZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5eYNU70; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B442C4CEED;
	Wed, 16 Apr 2025 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744796317;
	bh=+ZCWbE1PR1VWajVp5YhiYDBJVfRXd0HwklhLy77IOWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J5eYNU70oLJ0F1Q9S/3mFsHhNQ/7mz9Cowdbh+vkRpjA/X57MT+RQ8apm9iZz+2r/
	 NgeC6JlaQHH26sf3mfYC0lsJKDR8CmG1iwguO7pVLVs+q3ML81C70/y9tON46gHKKR
	 g3vj31zi6pfp2nWRDrFExRd1pBxQ4bGzDpp4QPb0P93SxWlIp4sHfyMzV57QKDxk3O
	 DQ8QKj74wOvwEYvbb7hNbbm/bd4/Q+vPEtZg2RtA9nG7ghOPWpXVjIIVCOOCn6/PsY
	 fYG1LajUfhqaX2GKX3E2OJdSgAwWZz7sa/V43RPpfxaVOU82iLmPNx9k09o+vJ7gFD
	 1csmdSufPcBRQ==
Date: Wed, 16 Apr 2025 17:38:11 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Andy Shevchenko <andriy.shevchenko@intel.com>, David
 Airlie <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250416173811.71c3c345@sal.lan>
In-Reply-To: <20250416172901.60104103@sal.lan>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
	<4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
	<87tt6opks7.fsf@intel.com>
	<20250416171917.0985c0eb@sal.lan>
	<20250416172901.60104103@sal.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 16 Apr 2025 17:29:01 +0800
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Wed, 16 Apr 2025 17:19:17 +0800
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > Em Wed, 16 Apr 2025 11:34:16 +0300
> > Jani Nikula <jani.nikula@linux.intel.com> escreveu:
> > 
> > > On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > > As reported by Andy, kernel-doc.py is creating a __pycache__
> > > > directory at build time.
> > > >
> > > > Disable creation of __pycache__ for the libraries used by
> > > > kernel-doc.py, when excecuted via the build system or via
> > > > scripts/find-unused-docs.sh.
> > > >
> > > > Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/Makefile      | 2 +-
> > > >  drivers/gpu/drm/i915/Makefile | 2 +-
> > > >  include/drm/Makefile          | 2 +-
> > > >  scripts/Makefile.build        | 2 +-
> > > >  scripts/find-unused-docs.sh   | 2 +-
> > > >  5 files changed, 5 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > > index ed54a546bbe2..d21d0cd2c752 100644
> > > > --- a/drivers/gpu/drm/Makefile
> > > > +++ b/drivers/gpu/drm/Makefile
> > > > @@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
> > > >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> > > >        cmd_hdrtest = \
> > > >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > > > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > > > +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \  
> > > 
> > > KERNELDOC is not set here.
> > 
> > > 
> > > /bin/sh: 1: -none: not found
> > 
> > Weird. This is set on Documentation/Makefile:
> > 
> > 	$ grep KERNELDOC Documentation/Makefile 
> > 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> > 	...
> > 
> > drivers/gpu/drm/Makefile should be able to see this variable there...
> 
> I suspect that the building system tries to confine variables to
> sub-directories, so maybe one solution would be to move it to the
> main makefile.
> 
> could you please check if this patch solves the issue?

Answering myself: it doesn't.

Heh, trying to quickly write a patch before calling it a day is
usually not a good idea ;-)

I'll send a fix tomorrow.

Regards,
Mauro

