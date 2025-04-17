Return-Path: <linux-kbuild+bounces-6670-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C5A91418
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Apr 2025 08:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 932AF3BFD28
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Apr 2025 06:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33D61DA2E5;
	Thu, 17 Apr 2025 06:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1X0TxiQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951E13208;
	Thu, 17 Apr 2025 06:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871536; cv=none; b=L9ZrwICK7GfpPg8hXZUVCx4LYQVxbyqAv9hPUZB035rQ0UnFU3CQCb6v+xnZu29dCByy9o3TzCxtLzFrVDBIXXJYnOF6Z7i1XWaheDayo3zHZq5xZ4YfRi3zsiy5zgXygJyH9VukVcCZc5/IFFBLoBx0njdlvPE5B4I/YcGogOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871536; c=relaxed/simple;
	bh=ynTXwFihEEN4bWQSiOjx5PziQ0jr0xeEIjU1wRMCN5s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ya0uGGdQ+WtXGmoQUg7IQP1m6WNiiikYVD9BQsOkTglnVktDcCYVYpNorYUAqEwIN6egCtkDmg6HWJQU8vtj+GWPtPxRl4t9OLL7H1UzZjrSGqj41dyWc0XH7m2nOfMuVXy4PZ6J0bCWKpeCO+zs7gQBPEuRMV/bLVeh5C9mIGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1X0TxiQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3796AC4CEE4;
	Thu, 17 Apr 2025 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744871535;
	bh=ynTXwFihEEN4bWQSiOjx5PziQ0jr0xeEIjU1wRMCN5s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i1X0TxiQOZSCNkdxdA84ZA0me1j+dxbHbsBHgMZp5Be5+ygw6IfsQbY/N2W4/VcBx
	 dr3KbLsUdqif2zDHKAFKmH0y3i5/88KAw30eAVb9fUYsmaIkCTfl6GBIkF6E9OAASQ
	 WpFagCAj69cBVVoN2EjPstIrVOEhHz8io9ETBiGIpbPGi0cvjbqAN5stIvibK0z8az
	 87dl5WDaXXlE5wDQImRmf/Ma9g4wPoOYBBgLuWAI4CpJizOin1q2upAlpeHfIivRWv
	 VI+Uh3FaHhdZXNaNT2E8z2k9YVc1dMc5G6HztFRXQfajDSlYn6D1z+8uuaZsWXw9C2
	 GBe9TWNwNhY8Q==
Date: Thu, 17 Apr 2025 14:31:52 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Airlie
 <airlied@gmail.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250417143152.24371d26@sal.lan>
In-Reply-To: <Z_96BpMMOzcotJqI@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
	<4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
	<87tt6opks7.fsf@intel.com>
	<20250416171917.0985c0eb@sal.lan>
	<20250416172901.60104103@sal.lan>
	<Z_96BpMMOzcotJqI@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 16 Apr 2025 12:36:06 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> escreveu:

> On Wed, Apr 16, 2025 at 05:29:01PM +0800, Mauro Carvalho Chehab wrote:
> > Em Wed, 16 Apr 2025 17:19:17 +0800
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:  
> > > Em Wed, 16 Apr 2025 11:34:16 +0300
> > > Jani Nikula <jani.nikula@linux.intel.com> escreveu:  
> > > > On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:  
> 
> ...
> 
> > > > >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> > > > >        cmd_hdrtest = \
> > > > >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > > > > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > > > > +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \    
> > > > 
> > > > KERNELDOC is not set here.  
> > >   
> > > > 
> > > > /bin/sh: 1: -none: not found  
> > > 
> > > Weird. This is set on Documentation/Makefile:
> > > 
> > > 	$ grep KERNELDOC Documentation/Makefile 
> > > 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> > > 	...
> > > 
> > > drivers/gpu/drm/Makefile should be able to see this variable there...  
> > 
> > I suspect that the building system tries to confine variables to
> > sub-directories, so maybe one solution would be to move it to the
> > main makefile.
> > 
> > could you please check if this patch solves the issue?
> > 
> > [PATCH] Makefile: move KERNELDOC macro to the main Makefile
> > 
> > As kernel-doc script is used not only on Documentation, but
> > also on scripts and drivers/drm Makefiles, move it to the
> > main makefile, as otherwise sub-makefiles may not have it.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > 
> > diff --git a/Documentation/Makefile b/Documentation/Makefile
> > index c022b97c487e..7a2069e87dbd 100644
> > --- a/Documentation/Makefile
> > +++ b/Documentation/Makefile
> > @@ -60,7 +60,6 @@ endif #HAVE_LATEXMK
> >  # Internal variables.
> >  PAPEROPT_a4     = -D latex_paper_size=a4
> >  PAPEROPT_letter = -D latex_paper_size=letter
> > -KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> >  KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)  
> 
> In this case the _CONF makes sense to move together as they are coupled
> semantically.

In a matter of fact, it doesn't...

> >  ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)

This is just part of ALLSPHINXOPTS, where it places two definitions
to be used by the Sphinx kerneldoc extension. I need to double-check
it, but I suspect that this is not even used there anymore. If it is
still used, it can be cleaned up after we remove the Perl version.

So, I prefer to keep this (perhaps with a different name) at the
documentation makefile.

Regards,
Mauro

