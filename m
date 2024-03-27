Return-Path: <linux-kbuild+bounces-1363-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D569788D854
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 09:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01CC81C2664C
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 08:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED83717BAF;
	Wed, 27 Mar 2024 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTkkdulN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970262D043
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Mar 2024 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711526480; cv=none; b=pWRczZkRDyQPJf7vmcIOAe724cb0sP7BIP5rESAqqFTFIHxSjd/KwPlpIS6KMxZKhoM1v2WOr0tfwOYQI7Vl4sFkXAUofHWyS6CH15E/MWmw+7XQLIw9cnQ+yPLZr3xt3PafFltOzSR1c8OUAbItsl5WUdGJisrzw57C47XY2YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711526480; c=relaxed/simple;
	bh=GucQb4cLBgLnk1QG1F+L4Qynfl5w2SWCeBiPx1JgM5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tYCl8gahSODvsNYvJp0tWeIzjNL54nRyKLxcgBxEgpA/+y3iN/xpADbEgl47PQQJ878a2YDfiVYm0SdBSzz5MfBMWWxltID3KBXUZ5PlPgMJowe442rwqxQO0pTkAbT6UfUf3I8sbWwvDWeLWVgjJIWyhui6J2K0vwA8Hs4nlks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTkkdulN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711526478; x=1743062478;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=GucQb4cLBgLnk1QG1F+L4Qynfl5w2SWCeBiPx1JgM5s=;
  b=DTkkdulNFE5JiG0YAMUcip5B97QefqGDAdOsWt61V9xtPasHY7kFsj8y
   dOY+kBPKbZG6ZTXtNT3HWcHs67rJ0srvIIZAIVsk+dyyf6MGmhfniESav
   TZJAoDGxgIfxlTsgcFHiqoqw/S2S01OmQH5UjzclQlm3mInkGb54h0m+j
   1/wbfAu2EWFiyNVQglLE9NSdpj9MC0WgQSBMWjoQxi4M0QK8/F4Oe+bLD
   bbCm3gPpuiozsYES5oZ3+yV4BOlJxPIPUl46CjZtE3ZQX40c8hwIqHwuA
   I3P90G8FI/JBFctniQuxH0xAQtwOJ77CP9HMQN3rnZvGdDEYpXjxzLo9N
   g==;
X-CSE-ConnectionGUID: 9b973weuTcqPGm4VVLMpBg==
X-CSE-MsgGUID: YlLrarTST9e3TK9SOsQokw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6725542"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6725542"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 00:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="16863269"
Received: from mmazilu-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.56.43])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 00:59:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
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
In-Reply-To: <20240327-cherubic-steel-tiger-e1c36a@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
 <20240326225650.GA2784736@dev-arch.thelio-3990X>
 <20240327-cherubic-steel-tiger-e1c36a@houat>
Date: Wed, 27 Mar 2024 09:59:01 +0200
Message-ID: <87a5mkgl6i.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 27 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
>
> On Tue, Mar 26, 2024 at 03:56:50PM -0700, Nathan Chancellor wrote:
>> On Tue, Mar 05, 2024 at 11:07:36AM +0200, Jani Nikula wrote:
>> > Add kconfig to enable -Werror subsystem wide. This is useful for
>> > development and CI to keep the subsystem warning free, while avoiding
>> > issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
>> > hit.
>> > 
>> > v2: Don't depend on COMPILE_TEST
>> > 
>> > Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > ---
>> >  drivers/gpu/drm/Kconfig  | 13 +++++++++++++
>> >  drivers/gpu/drm/Makefile |  3 +++
>> >  2 files changed, 16 insertions(+)
>> > 
>> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> > index 6e853acf15da..c08e18108c2a 100644
>> > --- a/drivers/gpu/drm/Kconfig
>> > +++ b/drivers/gpu/drm/Kconfig
>> > @@ -416,3 +416,16 @@ config DRM_LIB_RANDOM
>> >  config DRM_PRIVACY_SCREEN
>> >  	bool
>> >  	default n
>> > +
>> > +config DRM_WERROR
>> > +	bool "Compile the drm subsystem with warnings as errors"
>> > +	depends on EXPERT
>> > +	default n
>> > +	help
>> > +	  A kernel build should not cause any compiler warnings, and this
>> > +	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
>> > +
>> > +	  The drm subsystem enables more warnings than the kernel default, so
>> > +	  this config option is disabled by default.
>> > +
>> > +	  If in doubt, say N.
>> 
>> While I understand the desire for an easy switch that maintainers and
>> developers can use to ensure that their changes are warning free for the
>> drm subsystem specifically, I think subsystem specific configuration
>> options like this are actively detrimental to developers and continuous
>> integration systems that build test the entire kernel. For example, we
>> turned off CONFIG_WERROR for our Hexagon builds because of warnings that
>> appear with -Wextra that are legitimate but require treewide changes to
>> resolve in a manner sufficient for Linus:
>> 
>> https://github.com/ClangBuiltLinux/linux/issues/1285
>> https://lore.kernel.org/all/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
>> https://lore.kernel.org/all/20230522105049.1467313-1-schnelle@linux.ibm.com/
>> 
>> But now, due to CONFIG_DRM_WERROR getting enabled by all{mod,yes}config
>> and -Wextra being unconditionally enabled for DRM, those warnings hard
>> break the build despite CONFIG_WERROR=n...
>
> Would making DRM_WERROR depends on WERROR address your concerns?

But then what would be the point of having DRM_WERROR at all? For me the
point is, "werror in drm, ignore the rest, they're someone else's
problem".

An alternative would be to "depends on !COMPILE_TEST" that we have in
i915, but then some folks want to have COMPILE_TEST in drm, because some
drivers are otherwise hard for people to build.

Nathan, we do want to fix any issues switfly. Are you hitting specific
build problems?


BR,
Jani.



>
> Maxime

-- 
Jani Nikula, Intel

