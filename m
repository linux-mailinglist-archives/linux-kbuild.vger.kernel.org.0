Return-Path: <linux-kbuild+bounces-1353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C3888D24B
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 23:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F1F81C67300
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 22:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC0613E03C;
	Tue, 26 Mar 2024 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knur54c4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D3F13DB98;
	Tue, 26 Mar 2024 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711493814; cv=none; b=udwDTPMM7PfdpnTffn53jBu+6xZ3AyVWDTB7X69ahrwlukwx5rBupaR0G/wn4IzDanltnL2OCUbcrWmMAPQ1Sjj4gXZ+H9yqfIhRMOyJnQPrRih/nrGcu4zrxXoA7VIV06IHWhqECs7srB9HrNGPEQ28W/O0Bx8nbZohJKqoOn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711493814; c=relaxed/simple;
	bh=uMrfzN4xjKjod6GbAc1xRQd4HusxFp38FVyEvv2mIkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhSOH7miMikczNbvupDBQB8krt3PujNZbg/lHgrQLQxMoeqii2Dapdq3IsiepmVw3I6OOApob7e9L7tFCLTuY8EVK7GI98vE9xN0ibZYHPtHFdWIybTeqLTBvLJKsYu4DloO/Xwb7S57symmdMFfKDCO5R1m+OhFW19y8Wvx7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knur54c4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A308FC433C7;
	Tue, 26 Mar 2024 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711493814;
	bh=uMrfzN4xjKjod6GbAc1xRQd4HusxFp38FVyEvv2mIkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knur54c4eVgsNUNQfgkHX+FMHtB4w0y37mRCWkmBDyM1xKXZ8MEnDqG3oeYUBuu5o
	 ZJSsNnndctin55unNbYnFqDuPY4yxaB9fjSaUFtd6aJvxVkabOL6FjKAOY3kc0ldkD
	 B7Cc+0gwSEiGtr8Rpeh8CAVGPnsM6LVJ6JfU+8iihJKDUdPiNL2sGhCNvNQ94Hajhn
	 gMoUEyyaIlTyQilt1rew3rAhVOyzX+QKEQ22d8dDg2L8shl2SJQZ61jNbsP+q4KV5l
	 YWTODMdkdknK/m/AgVZgJWtg0IvDbXsFrLKonIZleuQzP46MtfjcU2o29F2cHA3JJc
	 OaxpvvvnTDRhg==
Date: Tue, 26 Mar 2024 15:56:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sui Jingfeng <sui.jingfeng@linux.dev>, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RESEND v3 2/2] drm: Add CONFIG_DRM_WERROR
Message-ID: <20240326225650.GA2784736@dev-arch.thelio-3990X>
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>

On Tue, Mar 05, 2024 at 11:07:36AM +0200, Jani Nikula wrote:
> Add kconfig to enable -Werror subsystem wide. This is useful for
> development and CI to keep the subsystem warning free, while avoiding
> issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
> hit.
> 
> v2: Don't depend on COMPILE_TEST
> 
> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/Kconfig  | 13 +++++++++++++
>  drivers/gpu/drm/Makefile |  3 +++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 6e853acf15da..c08e18108c2a 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -416,3 +416,16 @@ config DRM_LIB_RANDOM
>  config DRM_PRIVACY_SCREEN
>  	bool
>  	default n
> +
> +config DRM_WERROR
> +	bool "Compile the drm subsystem with warnings as errors"
> +	depends on EXPERT
> +	default n
> +	help
> +	  A kernel build should not cause any compiler warnings, and this
> +	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
> +
> +	  The drm subsystem enables more warnings than the kernel default, so
> +	  this config option is disabled by default.
> +
> +	  If in doubt, say N.

While I understand the desire for an easy switch that maintainers and
developers can use to ensure that their changes are warning free for the
drm subsystem specifically, I think subsystem specific configuration
options like this are actively detrimental to developers and continuous
integration systems that build test the entire kernel. For example, we
turned off CONFIG_WERROR for our Hexagon builds because of warnings that
appear with -Wextra that are legitimate but require treewide changes to
resolve in a manner sufficient for Linus:

https://github.com/ClangBuiltLinux/linux/issues/1285
https://lore.kernel.org/all/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
https://lore.kernel.org/all/20230522105049.1467313-1-schnelle@linux.ibm.com/

But now, due to CONFIG_DRM_WERROR getting enabled by all{mod,yes}config
and -Wextra being unconditionally enabled for DRM, those warnings hard
break the build despite CONFIG_WERROR=n...

https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2eEBDGEqfmMZjGg3ZvDx2af2pde/build.log

Same thing with PowerPC allmodconfig because we see -Wframe-larger-than
that appears because allmodconfig enables CONFIG_KASAN or CONFIG_KCSAN
usually:

https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2eE2HDsODudQGqkMKAPQnId7pRd/build.log

I don't know what the solution for this conflict is through. I guess it
is just the nature of the kernel being a federation of independent
subsystems that want to have their own policies. I suppose we can just
set CONFIG_DRM_WERROR=n and be done with it but I would like to avoid
this issue from spreading to other subsystems because it does not scale
for folks like us who do many builds across many trees.

It would be nice if there was something like CONFIG_WERROR_DIRS or
something that could take a set of directories that should have -Werror
enabled so that you could do something like

  CONFIG_WERROR_DIRS="drivers/gpu/drm"

and have -Werror automatically added to all commands within that
directory like subdir-ccflags-y but it is explicitly opt in on the part
of the developer/tester, rather than just happening to get enabled due
to all{mod,yes}config. No idea if that is feasible or not though.

> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ea456f057e8a..a73c04d2d7a3 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -30,6 +30,9 @@ subdir-ccflags-y += -Wno-sign-compare
>  endif
>  # --- end copy-paste
>  
> +# Enable -Werror in CI and development
> +subdir-ccflags-$(CONFIG_DRM_WERROR) += -Werror
> +
>  drm-y := \
>  	drm_aperture.o \
>  	drm_atomic.o \
> -- 
> 2.39.2
> 

