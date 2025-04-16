Return-Path: <linux-kbuild+bounces-6634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E2A8B516
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 11:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 210663BD2C1
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 09:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA52232395;
	Wed, 16 Apr 2025 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OO9fL/pU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C62522B8C1;
	Wed, 16 Apr 2025 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795183; cv=none; b=N95EtkZh95l3Q/38HkXBTLpEpgAbnm/xIkE3D+RtoWHS0xcItpYmOkwWsPft7XhxnguVM6ykp7GFGp79Tnh4R9QZgXJjms6RG9kk+rsGDqZ+sqSFw9SuBJlL6Ip1kQ5Z2sTzpbCHObSHBBrakUPl4Mp/Sx46rz8qHSl40i7hWEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795183; c=relaxed/simple;
	bh=3IzjhMKt3C/Wjt/0qk13UqqN5hoOSs+vGT3liSo6GvI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X3S5iaQvXQCTPyzzlPgdQ74WLJDqEjTNHoNnlQf8I2T2g9IgRhcFl+1LU1cZOXtzR6FBGEOPBNg/v8L5XRnh2YPF+TNo37sczsmQt+4BSmU9k0ov1z/Uz5m212iI426/d8DugLOTGQNmmRrbCIhCVzVHHNlNlU01uZp+aE10BVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OO9fL/pU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBCBC4CEE2;
	Wed, 16 Apr 2025 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744795182;
	bh=3IzjhMKt3C/Wjt/0qk13UqqN5hoOSs+vGT3liSo6GvI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OO9fL/pUj0PmyztYhGQC0YKRuzcSnYK7Sib01pp7086unFIPzfMyFuzjMb2obH+hi
	 UQxdF68uNvzqphRvvWoINuTeGaEDd3r+bbpUu1w7jGHFZfsrr9pCgERW06XLl3yRtI
	 /SgQv63ZEzkJhHmvjyMSCbg7n303VUdpR8uYC+QYN8cYgAFqHVX4aNIyVJtyjVcRzy
	 sCNuqf+1/iJdwM9XSfUHW28hHni0EbOsr9ftDIfnh69oaVtKW6X1IibMY0M0T5Mg8+
	 vzk2HfEL30Uh5b13Hn3rL/O6w69cXIif8xk8aPjJWffbo8YGONdguhc5An3RZuhfFI
	 PfiW3qQQXsL2Q==
Date: Wed, 16 Apr 2025 17:19:17 +0800
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
Message-ID: <20250416171917.0985c0eb@sal.lan>
In-Reply-To: <87tt6opks7.fsf@intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
	<4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
	<87tt6opks7.fsf@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 16 Apr 2025 11:34:16 +0300
Jani Nikula <jani.nikula@linux.intel.com> escreveu:

> On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > As reported by Andy, kernel-doc.py is creating a __pycache__
> > directory at build time.
> >
> > Disable creation of __pycache__ for the libraries used by
> > kernel-doc.py, when excecuted via the build system or via
> > scripts/find-unused-docs.sh.
> >
> > Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/gpu/drm/Makefile      | 2 +-
> >  drivers/gpu/drm/i915/Makefile | 2 +-
> >  include/drm/Makefile          | 2 +-
> >  scripts/Makefile.build        | 2 +-
> >  scripts/find-unused-docs.sh   | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index ed54a546bbe2..d21d0cd2c752 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
> >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> >        cmd_hdrtest = \
> >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \  
> 
> KERNELDOC is not set here.

> 
> /bin/sh: 1: -none: not found

Weird. This is set on Documentation/Makefile:

	$ grep KERNELDOC Documentation/Makefile 
	KERNELDOC       = $(srctree)/scripts/kernel-doc.py
	...

drivers/gpu/drm/Makefile should be able to see this variable there...

> 
> >  		touch $@
> >  
> >  $(obj)/%.hdrtest: $(src)/%.h FORCE
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> > index ed05b131ed3a..ab6b89a163e7 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
> >  #
> >  # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
> >  ifdef CONFIG_DRM_I915_WERROR
> > -    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
> > +    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none -Werror $<
> >  endif
> >  
> >  # header test
> > diff --git a/include/drm/Makefile b/include/drm/Makefile
> > index a7bd15d2803e..1df6962556ef 100644
> > --- a/include/drm/Makefile
> > +++ b/include/drm/Makefile
> > @@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
> >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> >        cmd_hdrtest = \
> >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > +		PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> >  		touch $@
> >  
> >  $(obj)/%.hdrtest: $(src)/%.h FORCE
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 13dcd86e74ca..884dc86ce04e 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -83,7 +83,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
> >  endif
> >  
> >  ifneq ($(KBUILD_EXTRA_WARN),)
> > -  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
> > +  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(KDOCFLAGS) \
> >          $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
> >          $<
> >  endif
> > diff --git a/scripts/find-unused-docs.sh b/scripts/find-unused-docs.sh
> > index ee6a50e33aba..d6d397fbf917 100755
> > --- a/scripts/find-unused-docs.sh
> > +++ b/scripts/find-unused-docs.sh
> > @@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
> >  	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
> >  	continue;
> >  	fi
> > -	str=$(scripts/kernel-doc -export "$file" 2>/dev/null)
> > +	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
> >  	if [[ -n "$str" ]]; then
> >  	echo "$file"
> >  	fi  
> 

