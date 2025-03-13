Return-Path: <linux-kbuild+bounces-6116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7DA5EF9C
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 10:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0F89178194
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 09:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27308230BC2;
	Thu, 13 Mar 2025 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJ3v/KQb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94511FC3;
	Thu, 13 Mar 2025 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741858463; cv=none; b=pMEi45WRAiDIen6ndggbdUArrzuMCVRrO4//+gG5fYEKgVmbp6MpO4PkNRLvg5Yl9VwMpG0ubrwE54ZViETNCU6OIcflNtLdCPqkVrgGzKIlsXW6xwMbS7tasR80oarc+CTHDT+KUr/KDdbn7kO/sEhqZ77wq18twU4KPFjQ+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741858463; c=relaxed/simple;
	bh=vZoJDpDTmWHWIWAu2WSeOEgGu9mMhdvsQC0d26Wi4EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuIL6pFNSnvQPkJNJBUk6u9ze2HZANGbRyOT8ZX2FHKhw0iWh9Ki+5VuPos0CmoDfV47AxdcYMlCeTaWxD7ECoR036oDWXYrb9v2pUaA/B7rhU4QXGvKkd+GrjxuupOTI0e8tTJgjGfXu4Ao2MYHj7v6CleYrPlrw1b7tEEP1Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJ3v/KQb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0FDC4CEDD;
	Thu, 13 Mar 2025 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741858462;
	bh=vZoJDpDTmWHWIWAu2WSeOEgGu9mMhdvsQC0d26Wi4EE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uJ3v/KQbtHiRxiHdK+WMSahSOVWk23CN1xtmsNpXhXafJuxBYtYFCxuKoRD9Zxj7b
	 SpuM+892PUms50X1x+iLuWZ9qSh+q75FBjEQR3MTUvkPM/plj8a+JjDdroehSku2/J
	 DjvT4+Zr8mN9qWW1x1WGnuyE2N40p/y6AhCCeCaFkz3WKsx/T3Ae5015PMD2SzP4hY
	 l95kFUEDO5JwiQ7FMI2/t9fL2+VFjqH2kZ2p8vX/IisjEwVS3uc/LVPPIGKeunOd/b
	 DRUyKEKW50XBBKK18ItYM9m8SrIVh9Wh+NdatGuHYDSEukc4bc22Y1ZpCvEizd6r6X
	 FlO4rxUezCgMw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499bd3084aso741127e87.0;
        Thu, 13 Mar 2025 02:34:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFYMwO04dvnj5wJWPym6cnM8ppsbdcgVg+NaRHSHvxL4HcETk+pI3LKrykL0E25FD0mtXvus6dNGwmi6U=@vger.kernel.org, AJvYcCWXRBLy9AHi6fM4dpO+viwxbzQoWbmrGe6yhYmPHaerR2Z7A8ZiSiY+b72wAciVadbziyz+JnSikiOoRPoa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf2swWHrNyrpefE8cyP1IjXtr/I+OUR5ON0+7Q0cfSEVmWUKF1
	uKfkjCErjMdUVWXoJ1CI2Dwoog6UiJ3ciNhILayjNTfDB/lEZOMnP2MlbbMp73T1tmdDm6zZQR/
	s2LwHEKrdR+kKGr7o5ED3dIfjeCU=
X-Google-Smtp-Source: AGHT+IGiizjDd9U50PgmaruU6eXHUHi2xPUqWWSNcGHullv/aaClM9lkBlv5Mu+wibAEsAHWg3V8TSdK+NMBcnDEej4=
X-Received: by 2002:a05:6512:159a:b0:545:6fa:bf60 with SMTP id
 2adb3069b0e04-54990e4a822mr9816194e87.19.1741858461061; Thu, 13 Mar 2025
 02:34:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110616.148682-9-ardb+git@google.com> <202503131715.Fb6CfjhT-lkp@intel.com>
In-Reply-To: <202503131715.Fb6CfjhT-lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 13 Mar 2025 10:34:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGBLV6W7mJcELmsQuDUi0u-DofyD985znmVoHoZKZTuxA@mail.gmail.com>
X-Gm-Features: AQ5f1JrdY_O-dpd_Fst91bV8iY8Z5VXs88uikfiDeXUEQK3ipIbyhHsPjZh6oPs
Message-ID: <CAMj1kXGBLV6W7mJcELmsQuDUi0u-DofyD985znmVoHoZKZTuxA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
To: kernel test robot <lkp@intel.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org, x86@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Mar 2025 at 10:21, kernel test robot <lkp@intel.com> wrote:
>
> Hi Ard,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on masahiroy-kbuild/for-next]
> [also build test ERROR on masahiroy-kbuild/fixes tip/x86/core s390/features linus/master v6.14-rc6 next-20250312]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/Kbuild-link-vmlinux-sh-Make-output-file-name-configurable/20250311-190926
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> patch link:    https://lore.kernel.org/r/20250311110616.148682-9-ardb%2Bgit%40google.com
> patch subject: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with relocations preserved
> config: x86_64-randconfig-076-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503131715.Fb6CfjhT-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> gawk: scripts/generate_builtin_ranges.awk:82: fatal: cannot open file `vmlinux.map' for reading: No such file or directory
>

Hmm it seems I missed some things in link-vmlinux.sh - I will take a look.

