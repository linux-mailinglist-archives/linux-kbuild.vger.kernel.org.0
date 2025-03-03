Return-Path: <linux-kbuild+bounces-5945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E8BA4B7B8
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Mar 2025 06:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18CA8188F981
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Mar 2025 05:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C76E1DDC23;
	Mon,  3 Mar 2025 05:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTwiyhBT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE8EADC;
	Mon,  3 Mar 2025 05:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740981006; cv=none; b=uZu5Ky3kntVwUEijUeQKMc4uYbviUAm6hxPy2Iw50NM4Y0QVT5eEinkIQyNoEiq5eH0W5/riOt7IN0jG9863qLLQiXkEwhUYOJK1uaQzHGlRo7TCph1uj1HEA8WqoeKX7xRBUG5lzs/GsDWDAxunCxy+JxeU8O1nG94A9I3AZkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740981006; c=relaxed/simple;
	bh=k2xbveDoFxdUzTFJuB6DzYcuZIQ5OqHBlUA2PU4WaNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2l7aqTlXYuzOt98vfbhBG0BW4sqIcJRMojAAfIn/IMwCXiiQ0UyEu+zVe3FyeWPtUI4S2FIDnnEOPZgG+IKQEQLw4faXvChsS5YHPQnoeckgARDJU9NIYhjFCS5RzOoY6FsjjC74vTmGIi00/Pr0kFBamLgk5+HBkLyrgodC3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTwiyhBT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7204BC4CEEA;
	Mon,  3 Mar 2025 05:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740981005;
	bh=k2xbveDoFxdUzTFJuB6DzYcuZIQ5OqHBlUA2PU4WaNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oTwiyhBTzLzPCkzZ4XWbqRMrCLDONnA77iX39zlS58kQdY9Gkkwl3/Vx9CfAHVSYs
	 8UoiuxsHgHH7nS/TTjtTL55+bD7HUqkVoQE6PE+jBDQo5H0F0H1r7faq3tFjIcK5xJ
	 sF5y+6eveBIJsYHwuvBYp1iVlORN28CnaUGEyiDVl1qMAEiE0lN+obdBIzo1IpcqtV
	 84jyqgPNIHEMGuMB/yLWl12gG0cloiJEExG9FnEZMAfElFHeobretM+XrTcBoUr2zv
	 hBucaR54sI3gTVhj3Mho6sTLzrjgG+2nwsHYoMeHq2wj20GJzKNTkXWrBVKsz/xU2V
	 hUmYfMxn7919g==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-307325f2436so41839461fa.0;
        Sun, 02 Mar 2025 21:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVn08SbQZW3qGxpLsIGn74mCmNFMXgd8Ze0tWCI2xflHI3317HdMx32nXnW5YI26cTdFlqRxr1zbvGpaEhI@vger.kernel.org, AJvYcCXy01GtbPdcXHfWx4RbnnxFf9CL7NSZTXB6DW9UXN7pFmTD+elWidTeB5Ptc8Fr7mNmVdBI6DLn6ubhO/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHidpt1NiVCmzu1QVwb7RUYgKlXptKx/dLy6h+7aayWyCpwabO
	eJWFmxe11O2OzMD604DCejR7JNHt4upZLg4GI/D1PhwOJW/ZR3FAlPE+RErNsacnTU9Fm9DCqQE
	GwtX7ra3Da9hmAJuoPr00MI88JyE=
X-Google-Smtp-Source: AGHT+IHu3kdL4xDT5Cgl/8XctOfnHF3BccNzp6YCz4eDyaQ97WDqTmBQPFl5CT9oiIz0JvxOky6GbBIf+Do2T2NGttg=
X-Received: by 2002:a05:6512:693:b0:545:1e2d:6b73 with SMTP id
 2adb3069b0e04-5494c11a3f2mr4425290e87.13.1740981004140; Sun, 02 Mar 2025
 21:50:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226133014.381585-1-xry111@xry111.site>
In-Reply-To: <20250226133014.381585-1-xry111@xry111.site>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 14:49:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS63a15aRo=XYMAe=aBkVofz=WM9X6N_g2nQAG5eqQV5Q@mail.gmail.com>
X-Gm-Features: AQ5f1Jompcg71qxx24_ep5c7seASJscxz_AmAS1EglLr_y8hh_TjaZ4yA6T2WzE
Message-ID: <CAK7LNAS63a15aRo=XYMAe=aBkVofz=WM9X6N_g2nQAG5eqQV5Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add dependency from vmlinux to sorttable
To: Xi Ruoyao <xry111@xry111.site>
Cc: Nathan Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 10:30=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> Without this dependency it's really puzzling when we bisect for a "bad"
> commit in a series of sorttable change: when "git bisect" switches to
> another commit, "make" just does nothing to vmlinux.
>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  scripts/Makefile.vmlinux | 4 ++++
>  1 file changed, 4 insertions(+)


Applied to linux-kbuild. Thanks.


> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 873caaa55313..fb79fd6b2465 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -79,6 +79,10 @@ ifdef CONFIG_DEBUG_INFO_BTF
>  vmlinux: $(RESOLVE_BTFIDS)
>  endif
>
> +ifdef CONFIG_BUILDTIME_TABLE_SORT
> +vmlinux: scripts/sorttable
> +endif
> +
>  # module.builtin.ranges
>  # ----------------------------------------------------------------------=
-----
>  ifdef CONFIG_BUILTIN_MODULE_RANGES
> --
> 2.48.1
>
>


--=20
Best Regards
Masahiro Yamada

