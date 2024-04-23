Return-Path: <linux-kbuild+bounces-1664-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16C8ADDEA
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 08:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F1791F227D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 06:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0F021A06;
	Tue, 23 Apr 2024 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bvstzn1o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8021CA80
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713855450; cv=none; b=PU1zigUsJzN/efBxzGk9SAwacLJAprWWC2F8fqW2rfdbwKVIYL9a+aSmZx3Jm2buTHZMwirMTFrgPrRWyevJbZTeXfVZhJo2DQuhX8DmjrFIEja2gTy/I2uB4qkPVlAlK6MrHWiy2clWdBFOaDvQCiqqJ3NsCbGKynmuCpF4bY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713855450; c=relaxed/simple;
	bh=B+0GTksd8zO3OPlnZxHlFRauW96fynG/Slbh3qVc5Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PblVSdBiaeVBlEawcfJqWXj07I3WOiM/YUO5bsf3aPNgYn6TdsTaHR8jBXn+WNnj1Ta65tv6mu+hjL51KqiOWHxd7pjcQj0zxT6FHtLMM8q8+c3gNDIpNq8qo91mUVQafs+LiRY2AcPmNrUaWMWz5zs/TKucn1a+CHh0PwCKQI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bvstzn1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF226C2BD10
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 06:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713855449;
	bh=B+0GTksd8zO3OPlnZxHlFRauW96fynG/Slbh3qVc5Js=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bvstzn1ofwKc5ORTqrF/v1dEO+5W2PaLQCYN+twYPOdpVTdw+WG+gbCB31s36TMw6
	 j9hp0tXLGyf1sgzWK0M8uaUUgoVoOw2lQPj5H+u1DNHirh81/cNERntVT4Wy1cXWl7
	 cTvaECJovqeHnG5QzMo4Nwmo38p4hhSaHrL+UM+P+hr3f9go1AqbmXHzQmlvak7VTd
	 /xr2p6beH7AKWjNg2iVNZOH2mOGwqNYGhs8oXVccxrDlOK7buQRMjnSJMbKSV+PqH3
	 YgKJCRCTZO5lEI0GLPxhanePNToAmpht6BTbpgVMf0IyMv8gvBy6Qmuqzp1LMdQvXv
	 eI99Sjir+o8NQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso66149061fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2024 23:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/gPp8Sj3cOlzfvlmx4u9DI/HXaBaQ/KIi4dwucTVhBMUgLZfPJj1pREd4pY0h/ma3fa3s0OX83uJ1Ef9Ph+RCWHJ4emgda2eHdmLJ
X-Gm-Message-State: AOJu0YyYALYdJC6jX3dV81MwOjhLr5t9hJQNwoX7+dHhcAQumnMLd3SV
	xeMuOAJB2YnTx5zaJMF1udXpU4/OVJQoHOsJCIAVmMQkZrSOSJJEPmgAlygSTlG/kT4zrlhFdsv
	i/HYOGmbRAoj619lzdAhTgi7O/fI=
X-Google-Smtp-Source: AGHT+IFYA4dYyXRPiOTmEbsgsg5IGOye5nVBcKkgR/dL7lzNTwRVPu8NEbuHg8PG+dFkdU5UQlOClkXLMK1Bwb6Qu94=
X-Received: by 2002:a2e:87d5:0:b0:2da:7cac:a75e with SMTP id
 v21-20020a2e87d5000000b002da7caca75emr7154687ljj.22.1713855447895; Mon, 22
 Apr 2024 23:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202404231102.r0G0StUJ-lkp@intel.com>
In-Reply-To: <202404231102.r0G0StUJ-lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 23 Apr 2024 08:57:16 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH+i1mEFsgZnXokbJ5srDbZY50QGGJcf7yr0w2BowJB8g@mail.gmail.com>
Message-ID: <CAMj1kXH+i1mEFsgZnXokbJ5srDbZY50QGGJcf7yr0w2BowJB8g@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 5/7] kernel/kallsyms.c:181:56: warning:
 array subscript is outside array bounds
To: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Apr 2024 at 05:50, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   8246a1e9b922c0e797ec28d8a602de1384ff8140
> commit: 0bdad28369fc5e93de39b5046228ed78e982fc71 [5/7] kallsyms: Avoid weak references for kallsyms symbols
> config: i386-randconfig-001-20240423 (https://download.01.org/0day-ci/archive/20240423/202404231102.r0G0StUJ-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231102.r0G0StUJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404231102.r0G0StUJ-lkp@intel.com/
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
>
> All warnings (new ones prefixed by >>):
>
>    kernel/kallsyms.c: In function 'get_symbol_pos':
> >> kernel/kallsyms.c:181:56: warning: array subscript is outside array bounds [-Warray-bounds]
>       return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
>

OK, so weak definitions result in compiler warnings. I don't know
whether C requires weak definitions of array types are always the same
size.

We could work around this by
a) emitting the weak definitions into a separate object file, although
this may still violate C, and does not hide the issue from LTO
b) go back to using PROVIDE() in the linker scripts

@Masahiro: any preference?

