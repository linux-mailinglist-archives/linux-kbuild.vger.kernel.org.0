Return-Path: <linux-kbuild+bounces-6804-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF5AA5094
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 17:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19364A2E39
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 15:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75A2288DA;
	Wed, 30 Apr 2025 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvQkXnD6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977EE25D1F8;
	Wed, 30 Apr 2025 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027716; cv=none; b=j0GoWVbMvYR8EXeMsj0CLJ+kG8lAgurzlhlM4DVpTCHHCQPr4ylapEMRVQyF4JDQLbwcUAdU/LghkiCA+W+gcyjE5AglThM56vORBlIoBbIS4rBOjWR69jN7BIjfRLmUiIw3EEA794JDOI2SKdEhET3SA/fTGT40tJwfq6ZDXuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027716; c=relaxed/simple;
	bh=wvXwtYYiGxiI48kMlFqI73B5EWv7xUXFBIxXkrTt+Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oGziYQzE1ponTlioMelQbLMgEbIvhDXIacBszgNMzrmca9+uQPchzSb9AiqGC+/EcgV3Tpn+/+7vKIieA8jASWn3Udx4By1fsDYYfe7TK/NvfwtL5FhPNoWEh8buuRQ4W6SrJOHH6qT+gHxTLYaeshu7w5F9id+JMLqLuWnuYRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvQkXnD6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBD8C4CEE7;
	Wed, 30 Apr 2025 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027716;
	bh=wvXwtYYiGxiI48kMlFqI73B5EWv7xUXFBIxXkrTt+Bs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CvQkXnD6RRGzklG5EJL3MIu49bvDA2Vje5jq31Zjyv2Nscn6EYlldH9tuao2IjrML
	 30afHneVRi57pHYoNLnfpYjhkW+6iyni/VCnNmF0bLvzCKxoD7P7TxdnLzmx3ge3c1
	 7WJTUtpAsKUl9HOPPon78HV8gjsHURM10LYvOyhKXo6IVV8LT17RGpHUaWZpA2LcVw
	 yJfadKUxfK8xiA+UbbkkA98320JxxNblIeSxw/HnCC3+0io8rJaIcRtdhr13ldlzZs
	 9FKO+0ClU3Z+u2qmzU1g2y5vXwOZ3MX0tDU7NtpV3vFmhkera/NMv7fAYSfL8SPUv8
	 7ZsdRDuSXAXIg==
Date: Wed, 30 Apr 2025 17:41:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, David Airlie <airlied@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 3/4] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250430174147.05b330a9@foz.lan>
In-Reply-To: <aAvYkchT7RISfxsX@fjasle.eu>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
	<158b962ed7cd104f7bbfe69f499ec1cc378864db.1745453655.git.mchehab+huawei@kernel.org>
	<aAvYkchT7RISfxsX@fjasle.eu>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 25 Apr 2025 20:46:41 +0200
Nicolas Schier <nicolas@fjasle.eu> escreveu:

> On Thu, Apr 24, 2025 at 08:16:23AM +0800 Mauro Carvalho Chehab wrote:
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
> > Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
> Did someone check if we could add
> 
>   sys.dont_write_bytecode = True
> 
> to the script itself instead of cluttering PYTHONDONTWRITEBYTECODE
> everywhere [1]?

Nice to know that we can set it at the script level. Yet, this is is
meant to be a temporary solution, as IMO the best is to set
PYTHONCACHEPREFIX to match the directory on O=, when it is used.

Thanks,
Mauro

