Return-Path: <linux-kbuild+bounces-6154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54535A62859
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 08:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C40D7A8B4E
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 07:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEF619340D;
	Sat, 15 Mar 2025 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8jHEQhR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D808635E
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 07:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742024755; cv=none; b=U5PJyKDL7/YpPduIW6wGspX9Odd9v+4/8Ch35A95VuteYI0OC8X/jwhE8GjC1UT0RURh8hTDOf6KxqWbsA+oJqcHDcGVm+il4O6hDPs6N/5N3kGiLt0NPYbARL0UZ4Eku7/QMKeJY6xaeobAqNozKtKxy2ybTMM+wDeDBr8htlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742024755; c=relaxed/simple;
	bh=7JxOgSe/h1RaEWC42NdexEfAD69T/7lik0SJ40Krvcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AS/qPCWZ4BpAhvZ3d3L37DIw01cxIBEfZKNNa8Hk/Jcn1ju4w9MDskITeFh7HzIMbA87ZqnB1LvZ7ql1s/LdHwdDZWgxkjIOVEQNIEfyGfpRObcLCyP9plsceYP/+C3nMA8gTbwqIAXRu2tjVqFyf7fd5aaVmR2j1EVAiOEUF5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8jHEQhR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6F6C4CEE5
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742024755;
	bh=7JxOgSe/h1RaEWC42NdexEfAD69T/7lik0SJ40Krvcg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D8jHEQhRajb2cgwKnO/LHZyMUXCFQui8CnqprOHsDMmC//qKp7fVsSocHlhnaNFfp
	 UyZ2mJiMQGzbohaq6wTIIqC9KIM6QrVKmUORvrhBkaaZ6qxUMRDvIaHCey4ZK7Wl6+
	 aq0gjGCGgyoZWJSVjKh+GGqU2SCprSeCXcQP5dNl2VFVBruihq3oIqGKuzFZdPtm7A
	 SRdbz8ROR4AicdHc01bUJDBi3gIY9u5SSPE9iVn953ZRAAqyWYnYspRfeDjHLxty32
	 8BXLDauzGMgyHA14aLSQqPozawLJ/+uVEJBp9mMBb7WlOS9PyP6XCdkL6ejeUz8EFz
	 jDecDpLzRYRoQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-548409cd2a8so3229702e87.3
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 00:45:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfO5bRBLw47oVI8pXysuF8Cxuvce4ymbsO+XgtRW+NcY13Ci+subkxRaom2rEijSFPtWm2KH2ZCLxOvMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vL3gayWMeS04aLi3/Vx9xglfgFoV3PslnUHyOA1+2XopoXSq
	xl7LEJTaxu0nE8eeluITi77MsLMkFshyChnl3yX3aNJoJESWRuEEg8v5ZYO2f2cMPUOwooHJJvJ
	IuioAt+9+OuAU4ML/lLq5qwb5Ns0=
X-Google-Smtp-Source: AGHT+IHzlGxP5Jac84HYVBDduo1JDy0yLK4tVWVWQcimhOuUgBiCFBKsfj1WDJO6vMeUQhDOnxyEt8s0XqNaZ5vaY8s=
X-Received: by 2002:a05:6512:4029:b0:545:5a5:b69d with SMTP id
 2adb3069b0e04-549c3908614mr2197521e87.31.1742024754066; Sat, 15 Mar 2025
 00:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z9IsEPOnC+MGSAEA@rli9-mobl>
In-Reply-To: <Z9IsEPOnC+MGSAEA@rli9-mobl>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Mar 2025 16:45:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQpbQCzKha63SnJG2TpyXCFB4Vu8Q9xua9G8ht=Fbk_kA@mail.gmail.com>
X-Gm-Features: AQ5f1JqtQgkkNT5LJwQIIoL85pSILCA9OWIViBVqV0J6yLE8Gy2zJauDfxlQwnQ
Message-ID: <CAK7LNAQpbQCzKha63SnJG2TpyXCFB4Vu8Q9xua9G8ht=Fbk_kA@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 15/20] error: Unrecognized option: 'remap-path-prefix'
To: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas, Miguel,

On Thu, Mar 13, 2025 at 9:51=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git kbuild
> head:   bc5431693696b3f928b0b7acf8d7a120127db7a4
> commit: 6b5747d07138f8109b1a150830f1d138de146ac2 [15/20] kbuild, rust: us=
e -fremap-path-prefix to make paths relative
> :::::: branch date: 24 hours ago
> :::::: commit date: 30 hours ago
> config: x86_64-buildonly-randconfig-004-20250312 (https://download.01.org=
/0day-ci/archive/20250313/202503130111.NH87la6s-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250313/202503130111.NH87la6s-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202503130111.NH87la6s-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error: Unrecognized option: 'remap-path-prefix'

Do you see this?

I tried to reproduce it on commit
6b5747d07138f8109b1a150830f1d138de146ac2,
but I did not observe the reported error.



--=20
Best Regards
Masahiro Yamada

