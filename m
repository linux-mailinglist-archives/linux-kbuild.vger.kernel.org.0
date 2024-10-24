Return-Path: <linux-kbuild+bounces-4317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD629AF5B0
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 01:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F932B21979
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 23:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20D3218328;
	Thu, 24 Oct 2024 23:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1x5Q9jgc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EFD217902
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Oct 2024 23:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729811190; cv=none; b=L4H+m70JX2OuUnEGn33P+H/CVaWk7ml5XS/2oR9H3dWOTcsrFndxFDpsd4SZzFPLomSNKXg4BPX6sU7BczMXzJN/CQf686yRRA2mthGkRkvQ7ue3WTdZzFMFzI0xBGf1Q7kqKNckFIh5zq7B/RqZFfctqvwXWkxI+/cIw7xFCaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729811190; c=relaxed/simple;
	bh=HMpKxgYPxHCa/w+TdKwcqFScgohp/4MHekk0zNJ9O7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5WVsMFg+VfDHzZTkCUI1QQPaffUE/lFxez5ujlsMzCIUG2HwDMsJDUt5ijivHVw2NJwaR7zcSywmwbYvqWAy5VASoQhJjPZdRmQA14wZQQNjnoLGEdcePmhoMqKgCszvASuXQBfJZdLCVaZPQGBiIa+uuC9mbJkN+4trxUrta4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1x5Q9jgc; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ca03687fdso41885ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Oct 2024 16:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729811187; x=1730415987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ETJZ+z0riIyNZ07U3QSTstx4QvvpQHVTh5tLw1Ae2tI=;
        b=1x5Q9jgcwOMSJz/4OFTSBP4Pg8oGKC0g8ODCGs9jjFHxDx/E7xdi7f7b7LLFXrRrfd
         MXC/RI2Fuhovdgj9PCCcTZ/QXfTIlZvUaZXP8ysFXpVMOobD1MHfzZ31LtiZa6ar6CNv
         CPJoyRYkkXx+iKnkGcH6wCHkv0jwc8jcRgBsIKK6QWdhdbKFvo42PFB/xb/kocizpaO1
         64FgBPpIqBs8NDqrB5cKYD7zuytmtvRlDXDHvq7NVAi9ihURD/Xx9FQVpJNW86MC3CiV
         HwCpFmS6rKAB8A4I73WQUX44pENSlyCl6Is+x3lpSGXCG4eYM1qbNEB7zP8riyqUaR8J
         wfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729811187; x=1730415987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETJZ+z0riIyNZ07U3QSTstx4QvvpQHVTh5tLw1Ae2tI=;
        b=mQOks0OtIxJFiibWonTc0csXd1ZiGLizwABL3qj9BAVOM5Cmw61cvzioBIsAOeP3Ck
         dElRg27T9FzdTfj4Z031UzvYDEYOmyZVyXZhPgswALsSX2rYFT/hSP+7HYoRiPS8Z0Y1
         2+WxUN6shnfRHdn8kNWsSFzbDvlJ55PLMlP943tQc7MW2rRwm4+9KV86D5sCdGxgrOAj
         vSGHB6Bil1Bunafb2ZsSMaNzEs8AoI2hDsgipQyxNiaRGvtSLcNVrNdDsAZY8eCP4TD+
         5LPM6mgWBKKUuDvicvT8wKZNF0sMi2MH7qbUZcBnmrUE8AKtWjs1ARbfSRDA1OodVhC5
         DbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP1+1RMEzNACpUrzsYVyh2EtOXB0ZhQePNK+0M53473i+MDvWl43L2GVJshGWbbfDCoUXfYrbIMVh6fAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTuI+ZP+x89Om9U4KjHSadLZqu5vQ2cSdo3ecAyu3fL88VqShI
	6+gKBRtwloKktq1aosbtMrwXiCBUPA5EDBrZHjCiIgrgGD4+Y1z6XEO5JckfJw==
X-Google-Smtp-Source: AGHT+IFJuHdwPAvfIIk6Cjv1uHcC4bkvVJ4gTYWWjL2dM+mbjxBVmFxEzO9xnCcZL8zQeDD9a34Ovw==
X-Received: by 2002:a17:903:2445:b0:20b:a2b8:1850 with SMTP id d9443c01a7336-2105b1d0744mr482185ad.15.1729811186359;
        Thu, 24 Oct 2024 16:06:26 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0cc7csm76651665ad.101.2024.10.24.16.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 16:06:25 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:06:22 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 3/3] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
Message-ID: <20241024230622.GC1382412@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-3-339787b43373@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-extended-modversions-v7-3-339787b43373@google.com>

On Wed, Oct 23, 2024 at 02:31:30AM +0000, Matthew Maurer wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Previously, two things stopped Rust from using MODVERSIONS:
> 1. Rust symbols are occasionally too long to be represented in the
>    original versions table
> 2. Rust types cannot be properly hashed by the existing genksyms
>    approach because:
> 	* Looking up type definitions in Rust is more complex than C
> 	* Type layout is potentially dependent on the compiler in Rust,
> 	  not just the source type declaration.
> 
> CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allow
> it to do so by selecting both features.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  init/Kconfig  |  3 ++-
>  rust/Makefile | 32 ++++++++++++++++++++++++++++++--
>  2 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 530a382ee0feb391b4717abdba3672e584a462d0..f5cce579f29b2ed89e97f8075a3bf70e32e71ad0 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1942,7 +1942,8 @@ config RUST
>  	bool "Rust support"
>  	depends on HAVE_RUST
>  	depends on RUST_IS_AVAILABLE
> -	depends on !MODVERSIONS
> +	select EXTENDED_MODVERSIONS if MODVERSIONS
> +	depends on (GENDWARFKSYMS || !MODVERSIONS)

Nit: `depends on !MODVERSIONS || GENDWARFKSYMS` would match the
convention used below.

> +cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
> +	$(call rust_exports,$@,"%s\n",$$3) | \
> +	scripts/gendwarfksyms/gendwarfksyms \
> +		$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes),) \
> +		$@ >> $(dot-target).cmd)

Note that Petr suggested adding a KBUILD_ flag for passing the
--stable parameter to gendwarfksyms, which I think would be useful,
so once I send out v5 of that series, we'll have to update this to
also use the parameter when processing Rust objects:

https://lore.kernel.org/linux-modules/8017c328-f039-46c3-b472-f203cd6e2cfe@suse.com/

Sami

