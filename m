Return-Path: <linux-kbuild+bounces-6191-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63649A635FD
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 15:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B16A1891895
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 14:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CC55C603;
	Sun, 16 Mar 2025 14:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCtv1fGO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D54854673
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Mar 2025 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742134157; cv=none; b=JPldJDmyzf15iHrUBfGqEBYGaivwZ9zGxqRcNjbQ61XF4yZSOj3HH2xoLsbb4fDWPYNznprR4FWmvdzIGX3UjYovXLfXFvYQVw98ZDrjnjijOP3RNBxEV6EGjKG6pOWQna3zrqLnXV0XaYvZH1LPpF96ySw2kmUL+u0kM7cLC+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742134157; c=relaxed/simple;
	bh=wU+h1/mGkI0Ouvm0JG9pmOItT73sOENrMQWYhRMeZiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9J12ZfeGwH+QeGNhsRhYKWFDz8P1SnlENIWQNl+k5LHFJxb0WMaBTL9CxIliUlPAumoPRqQUBhkdoyHvIziSSIf60YYVWrGDapyI+t64G6wVH8Kj5SE6/E3XfyOYd7mgWU9Hx2TI2JH7nfdIaEJsrjHKoaDua+cntz27QzXmZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCtv1fGO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0724C4AF09
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Mar 2025 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742134156;
	bh=wU+h1/mGkI0Ouvm0JG9pmOItT73sOENrMQWYhRMeZiY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kCtv1fGO9QNHVcZi4x4y4ImTAM6wE5nEJW5Ytru/5JP6QBhwBSy5H2qZREfy1MmMV
	 p2cLPbYM4uaCqHWZIcFw9qZOioTjhvNvAujn3D7NmuqnheHk6G9fNgk2TKKYollVPz
	 08ZD9V2oKFZrhbLe3fXZsW7XEjRK6tyrsr+PZH1FblLCqCGw+rjYauK0iK+ZC3kNr9
	 D6XeoklWghUNNa2zFCWjbcasxtZ42FVsgRzq4WBRS5O+S7QGZKg8PphX99AMCGxqSG
	 tEgGIeZvkooEC5/S4AXR99IaOVlyN310JR8FoORIaA08ImhZ8yvFMPnS2gKLAhAkJI
	 XbX7aRSe1kkXg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549b159c84cso3585354e87.3
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Mar 2025 07:09:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8hj3mS4lXRatJ7ov5pmC+Tj7wAwmXVO9kSAZy1+ZV8HKD4rF3SSdvWExtfuRojsndK4VjailmKY9BOQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQU218MC8Ax5nIgObo535OobhexPvL+cbsW07HXpclc5Th8XAd
	1xfeCBHXV2nfsGoVAZg2iJ6Q5OCWHU15me2fT9ZWMQYYa+do03FSKovUu1uLTrm/0aiwo/4fLeG
	hZcwMKi24eFggrDTEPLxVAJR4FJc=
X-Google-Smtp-Source: AGHT+IFgNHoODEqrbgYbZjTrUA96HByHMipMHG1JH0Qy/JfS82gDVHqymv/IEyd2BapSAOqx+WW3C2rTJ1Fil2Vi9C8=
X-Received: by 2002:a05:6512:1286:b0:545:10eb:1ab2 with SMTP id
 2adb3069b0e04-549c398d167mr3611216e87.33.1742134155097; Sun, 16 Mar 2025
 07:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202503161833.ytx1ivfu-lkp@intel.com>
In-Reply-To: <202503161833.ytx1ivfu-lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 16 Mar 2025 15:09:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGqqW2UPvxB+o_LNSXb3CBk1QsQuCpmY=OsQPY=kWHFnw@mail.gmail.com>
X-Gm-Features: AQ5f1JonePai-5_ejUylzciYQE_fCI-n5gOvfA2mN3w1Tt00Tosys_ftHKke75M
Message-ID: <CAMj1kXGqqW2UPvxB+o_LNSXb3CBk1QsQuCpmY=OsQPY=kWHFnw@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 25/35] FAILED cannot open vmlinux: No
 such file or directory
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Mar 2025 at 11:20, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   e3de46f775ec29a17f671523798c28222a4ce818
> commit: cac289e2b2b0909b52c0a694c4469a9ad9f03764 [25/35] kbuild: Create intermediate vmlinux build with relocations preserved
> config: i386-buildonly-randconfig-001-20250316 (https://download.01.org/0day-ci/archive/20250316/202503161833.ytx1ivfu-lkp@intel.com/config)
> compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503161833.ytx1ivfu-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503161833.ytx1ivfu-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> FAILED cannot open vmlinux: No such file or directory
>

We need the below - Masahiro, would you like me to send this is a
follow-up patch?


--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -185,7 +185,7 @@ cleanup()
 {
        rm -f .btf.*
        rm -f System.map
-       rm -f vmlinux
+       rm -f "${VMLINUX}"
        rm -f vmlinux.map
 }

@@ -288,12 +288,12 @@ vmlinux_link "${VMLINUX}"

 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
-       info BTFIDS vmlinux
+       info BTFIDS "${VMLINUX}"
        RESOLVE_BTFIDS_ARGS=""
        if is_enabled CONFIG_WERROR; then
                RESOLVE_BTFIDS_ARGS=" --fatal_warnings "
        fi
-       ${RESOLVE_BTFIDS} ${RESOLVE_BTFIDS_ARGS} vmlinux
+       ${RESOLVE_BTFIDS} ${RESOLVE_BTFIDS_ARGS} "${VMLINUX}"
 fi

 mksysmap "${VMLINUX}" System.map

