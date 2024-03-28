Return-Path: <linux-kbuild+bounces-1378-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DFE88FE27
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Mar 2024 12:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6270CB22B5B
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Mar 2024 11:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B467E56E;
	Thu, 28 Mar 2024 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yd69XgQC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008487E57F
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Mar 2024 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711625648; cv=none; b=drN5juJxUkaP4fZeqokTMjyjT7lY38EtHyEFvaBHt8Z3qP/wgkC0uUOjY2HveeplhhZz9Y0BQ/wQvOVLkWwPu8HxOalDwX2zehYHnJtzIsFIsXyp1OyeslHWz9AFYeUHfHp7cB4sIxK0vNaa7xlEybAAIzhYzRS+yzwJc6hzuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711625648; c=relaxed/simple;
	bh=eBy42X35pJreeO0yYa4HjMU6RLBU89fmPu6IVcsQXa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OLa1RlDn3s1wJYQMOEgqEIkJNUX1ISczMAloOR4LlEjPGNODmpSgdIbyAfayK07zQjDQGqLSG/LbYLkBztq38Wp1BZdJtJ652XtEACEEO/xycKawJpQqDugptrcXI8pmBtyagaKr+rw1Wpa5qo4RBtjSO6uImNP9DE/DNYOl8OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yd69XgQC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711625647; x=1743161647;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=eBy42X35pJreeO0yYa4HjMU6RLBU89fmPu6IVcsQXa4=;
  b=Yd69XgQCgHNADQiqP8MkFqumlxehwR2w89jdZw8mYC74P3QyZmTpyBzl
   WrAs8qwUAKMJfP5dw+I8L/RYqSjIwBNcvf/koIFyCAoLvKKjoY1gjJLW1
   RVqs6dwBI1xhklFlXouiHYtFWK/wmnpxXMV2Lez5aaFT4K0dVHZx8Xu1u
   zkzMqCtdo0WvW09HvAr22gsofos1N58KAOrYWdLTbehyMc6aG1TNhMizt
   Y6WwsRtzLWlEnrzna9Q0BK4+/xNWByuys2/i9xHq8PTGzjAxR657qyCdL
   K+8f/VNqOJY1wg9iGuW2jMDJ5p5pZUkK/QAixXYUfilaRQg19m2EkxF+B
   A==;
X-CSE-ConnectionGUID: R8+fhdtERwa1T5dteeRK1w==
X-CSE-MsgGUID: hikXTWQmRx28gFWbDbid7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="32175442"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="32175442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 04:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="21344061"
Received: from abdulqaf-mobl2.amr.corp.intel.com (HELO localhost) ([10.252.57.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 04:33:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Sui Jingfeng
 <sui.jingfeng@linux.dev>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [RESEND v3 2/2] drm: Add CONFIG_DRM_WERROR
In-Reply-To: <20240327163331.GB1153323@dev-arch.thelio-3990X>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
 <20240326225650.GA2784736@dev-arch.thelio-3990X>
 <20240327-cherubic-steel-tiger-e1c36a@houat> <87a5mkgl6i.fsf@intel.com>
 <20240327163331.GB1153323@dev-arch.thelio-3990X>
Date: Thu, 28 Mar 2024 13:33:53 +0200
Message-ID: <87il16fv4u.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 27 Mar 2024, Nathan Chancellor <nathan@kernel.org> wrote:
> On Wed, Mar 27, 2024 at 09:59:01AM +0200, Jani Nikula wrote:
>> An alternative would be to "depends on !COMPILE_TEST" that we have in
>> i915, but then some folks want to have COMPILE_TEST in drm, because some
>> drivers are otherwise hard for people to build.
>
> Right. I think it is unfortunate how (at least in my opinion)
> CONFIG_COMPILE_TEST has two meanings: genuinely just compile testing or
> "allmodconfig". For the first case, we would want CONFIG_DRM_WERROR=y
> but for the second case, it would be nice for CONFIG_DRM_WERROR to
> default to off (because CONFIG_WERROR is enabled) but allow developers
> to turn it on explicitly.

Yes, CONFIG_COMPILE_TEST has become overloaded.

> Another lofty/wistful idea to solve this would be to implement something
> similar to compiler diagnostic groups for Kconfig, where there would be
> a hierarchy like
>
>   CONFIG_WERROR
>     CONFIG_DRM_WERROR
>     CONFIG_SUBSYSTEM_A_WERROR
>     CONFIG_SUBSYSTEM_B_WERROR
>
> where the value of CONFIG_WERROR is the same value for all
> subconfigurations under it but they could still be enabled individually
> without any additional dependencies (ala something like '-Wno-unused
> -Wunused-variable'), which would allow my use case of CONFIG_WERROR=n
> removing all instances of -Werror to continue to work but allow other
> developers and CI systems to just set their specific -Werror
> configuration and be done with it. I don't think something like that
> exists but maybe I don't know Kconfig as well as I think I do :)

Yet another idea is to have a way to mark a config option "manual", that
is, never enable this automatically under any circumstances, not in make
allyesconfig or allmodconfig, don't ask in make oldconfig, don't allow
selects. The only way to enable is to toggle it manually. If you want it
and enable it and see problems, it's on you.

CONFIG_WERROR and CONFIG_DRM_WERROR could both be like this. The problem
with them is that they're not so much different configurations, they are
about how to deal with build errors, and that's not really what, say,
make allyesconfig should be about.

BR,
Jani.


-- 
Jani Nikula, Intel

