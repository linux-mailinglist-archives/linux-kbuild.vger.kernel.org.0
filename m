Return-Path: <linux-kbuild+bounces-5944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE08A4B3B9
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 18:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78B7E3B08C5
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 17:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118BB1E9915;
	Sun,  2 Mar 2025 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDj4WH9/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A41D5CC7;
	Sun,  2 Mar 2025 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740935764; cv=none; b=YM0PlRq8/dCsqPGabIK9ujvVDb9NkaRRBWdZaU4PtQYdxWpi6GjzLFbblf8QTZt1W/ZFHXQi3gw0ZczKtNusXcVcpx5aqyVLk75G13IL2a3j4lVWoaPkskFFllrk0jDmRQELfkOLTxFG1RlJxr8f8yt3PabU1ytfG5rEAUa58IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740935764; c=relaxed/simple;
	bh=C+5LcGfBUtvq89KxisTyEENM0n4q2gqsCs7v54Y82pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuDwoc7If6fvT77rSCpNZwtfBDJMm4ZzjDuXJq5qK4AdwTOTZVx43u3JX2tz064k9XR0CG+585p2cpy5Q9PY+gBNYhE85ms7tC8/ngK6PSk9q3D/FymZMXbKLA+3mM7AnQLG9noCZ4Ct6m+hbAsl94pEQ6d+MGqc3W1RGaZmAvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDj4WH9/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564B7C4CEE8;
	Sun,  2 Mar 2025 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740935763;
	bh=C+5LcGfBUtvq89KxisTyEENM0n4q2gqsCs7v54Y82pI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HDj4WH9/fXb4a6FHY8+/WyoVpyhprrK1a8xum5NBI8MAsvoW7YOcnX5YVS3EltEux
	 cBGPJMsmIFWQLZAgNBPaCFm/gSJdViEQ4BObczfPqv/ronOU2bYsT5bB1sztwCey96
	 mBopFYdAqbE9bypiHA43xzR6upiqg6O0dihhB8NkfE6HU5aX3mj8bFbo3KAgCYkwBd
	 3Od8IIPY4iQ7+Q1Sko8DKh2h+VvoRgGJnnShTFTBhpPME9I9IRS0TpPpR12/Yzbjzo
	 1WtLekTirw4iDDrS8o7hbmvDfoRcqczewnCQEz28gWUTvJVnUaj170m1Ogzh39/NHa
	 t5mg/sXRmXMSg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5496301c6afso567680e87.0;
        Sun, 02 Mar 2025 09:16:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHSSkCIT0osJ8pOBRYUSZAiVapFMITvxBwbtEGr+xKAZxQNSbGE7R+p6YRaqXTaiPaVEL3V8VQ1IocPtss@vger.kernel.org, AJvYcCWK/Zi/lXPlHB2B6wxeg15gZXk6OrjCbUiYiCiG8HolAN79ARnnaBkaYzp07Ga4OSn1MNoAO82B61DI0So=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqbdwEwAphDHFwOfzf9W2epI4WaWAvz8H2lFvbZxEE/HTd0I6v
	HFPYbnbn1oRwuxG68AjEWHz1VPz5d83Lthu2fwDfvCzkRq99oB4h398Z2Rqs7sZgJGJVYN6NHly
	o+tkZ7bie/nJrTJAY3SNCUBF6kXY=
X-Google-Smtp-Source: AGHT+IE37MiTtp2DXxPPSPuVqZfd9k0kkjXkkvCGTVMafD7ZcM6Ah7S8qYxRs8jydGahzE5e9WltMc2yukg0OnBMWok=
X-Received: by 2002:a05:6512:e8b:b0:546:1fd8:3876 with SMTP id
 2adb3069b0e04-549432de15dmr5315785e87.14.1740935761962; Sun, 02 Mar 2025
 09:16:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225100037.2709624-1-arnd@kernel.org>
In-Reply-To: <20250225100037.2709624-1-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 02:15:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARsT2sop_uUgERvJ_EhbFj825MPPrqqZv64_13z19KeHQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpSchcyIguDDJsm_gNw4MryJBtW1epPJBL1qrMzD1bJvalXRCihjJfRFnA
Message-ID: <CAK7LNARsT2sop_uUgERvJ_EhbFj825MPPrqqZv64_13z19KeHQ@mail.gmail.com>
Subject: Re: [PATCH] [v3] kbuild: hdrcheck: fix cross build with clang
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 7:00=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The headercheck tries to call clang with a mix of compiler arguments
> that don't include the target architecture. When building e.g. x86
> headers on arm64, this produces a warning like
>
>    clang: warning: unknown platform, assuming -mfloat-abi=3Dsoft
>
> Add in the KBUILD_CPPFLAGS, which contain the target, in order to make it
> build properly.
>
> See also 1b71c2fb04e7 ("kbuild: userprogs: fix bitsize and target
> detection on clang").
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Fixes: feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to linux-kbuild. Thanks.


> v2: use same approach as the other patch.
> v3: fix changelog text
> ---
>  usr/include/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index 58a9cbe4eba4..b9a2640b4bb7 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -10,7 +10,7 @@ UAPI_CFLAGS :=3D -std=3Dc90 -Wall -Werror=3Dimplicit-fu=
nction-declaration
>
>  # In theory, we do not care -m32 or -m64 for header compile tests.
>  # It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64=
.
> -UAPI_CFLAGS +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CFLAGS))
> +UAPI_CFLAGS +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CPPFLAGS) $(K=
BUILD_CFLAGS))
>
>  # USERCFLAGS might contain sysroot location for CC.
>  UAPI_CFLAGS +=3D $(USERCFLAGS)
> --
> 2.39.5
>


--=20
Best Regards
Masahiro Yamada

