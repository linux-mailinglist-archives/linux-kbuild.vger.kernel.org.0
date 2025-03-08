Return-Path: <linux-kbuild+bounces-6014-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB2A57B7D
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 16:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 718C51888F2B
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 15:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95F71C84C1;
	Sat,  8 Mar 2025 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pfs+CVFQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DC72940D;
	Sat,  8 Mar 2025 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741446818; cv=none; b=b2VXLkOwNuD0wlHToTrwQewdNEhzbARniVtc5QyjHuPBEzhr5y23R+SDyIhvRKBTbAde6Xi708PZxtG8cKtgZSCvhPbJ+wjOCcDcSRd8f+f+FJKsxrXOJc/gsBmG3YPrqTuFWsqHzeoJMP/G0Ru95bEr9O0p0lzGPJqWFYqT5EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741446818; c=relaxed/simple;
	bh=bvvc1nYVs1I/NYL20PxAGXGIpw2D4A1yl9NIkmR4LL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5leyGZX0DcdwPL0M4cLO/NP0weZb4DmsqcseD/NktqBhmCxSL0D9ju/eCPGncs15nhw602LkMujJVvuyJJn9RewxMjaA41L1XaVbGOL6vWeh9mLmAGc+HnYC8kD05LySW9CUbEaLPGj6uUZED9TmUVfvZbUhRLsBxu4gR1ptLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pfs+CVFQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56E1C4CEE5;
	Sat,  8 Mar 2025 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741446817;
	bh=bvvc1nYVs1I/NYL20PxAGXGIpw2D4A1yl9NIkmR4LL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pfs+CVFQ8lGcBfOviehm83BLqDsoNYiJIyTIb/uNF9cmWIq2jClteU1e2sIS2983V
	 jy3WLdIqa52+HWS9TKdbECpx8i4HvMUFTf22E0dtE/h0yxL3v/wy38baobGuprxJB0
	 qNUw1GZfw3Ed2SXoMe7HxtETUVrLX2g9KPQ5vmOH/f19nx9bZFht0KU80Ae9gRE5md
	 OoaTpsrfqbt+ONzm6mKuyhqD69NeXBqyupb/VRxAgK7jo9KO5B0oeH9FuieYRp+G7u
	 kzkRSFg7Nkr7T1+OKtwZXoqWqjQqOhmJWG5Fkw4qK88m/Vp9mHg2BBUEZxbLLQICmK
	 ySzfK1oY2GdiA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54998f865b8so716324e87.3;
        Sat, 08 Mar 2025 07:13:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWroMyYiksPGeP0UUat41T2zjN0GTLPpW24Ku+8xQc0Ri7Xfua8urq194MhE4aJUl3GsAXlR9yaUyhDLBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbfQB1DcmXSLGS+WGBhIacbVikG1b1OQIiHJi4OAOU+l/pP7oA
	nfhO557jhmT9rj4HMjXF5J2pV2ppmeOGWZeLsHcLlYxs20clMp9FP9SD/kpnNGerGiTBh4qRVqh
	vDQsQZfl3JSLi/uofFlHCBRIC/CQ=
X-Google-Smtp-Source: AGHT+IG15kErba6fplqNRy3ab57qxrJal91wUafXRQ1i/hNjMaCSZO+CoKIPmUgRvwuKhajeiERlq70yjw9mtpipSJk=
X-Received: by 2002:a05:6512:ad1:b0:549:7d6d:3db6 with SMTP id
 2adb3069b0e04-54990e672fbmr2960937e87.23.1741446816549; Sat, 08 Mar 2025
 07:13:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308040451.585561-1-xin@zytor.com>
In-Reply-To: <20250308040451.585561-1-xin@zytor.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 9 Mar 2025 00:12:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
X-Gm-Features: AQ5f1JrMPl6wMHTyp_NPgg49k7laO7yRBmgdwk1Y0EvLypR_-lvRnqFbbi40T00
Message-ID: <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de, hpa@zytor.com, 
	sraithal@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 1:05=E2=80=AFPM Xin Li (Intel) <xin@zytor.com> wrote=
:
>
> Meanwhile explicitly state that the headers are uapi headers.

There are many internal-use targets, which are not documented in the
help message.
I assume this one is the case.

If users want to install UAPI headers, 'headers_install' is
the user-visible interface and it is already documented.





> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 70bdbf2218fc..8f5aa710105e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1659,7 +1659,8 @@ help:
>         @echo  '  kernelrelease   - Output the release version string (us=
e with make -s)'
>         @echo  '  kernelversion   - Output the version stored in Makefile=
 (use with make -s)'
>         @echo  '  image_name      - Output the image name (use with make =
-s)'
> -       @echo  '  headers_install - Install sanitised kernel headers to I=
NSTALL_HDR_PATH'; \
> +       @echo  '  headers         - Install sanitised kernel uapi headers=
 to usr/include'
> +       @echo  '  headers_install - Install sanitised kernel uapi headers=
 to INSTALL_HDR_PATH'; \
>          echo  '                    (default: $(INSTALL_HDR_PATH))'; \
>          echo  ''
>         @echo  'Static analysers:'
>
> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
> --
> 2.48.1
>


--
Best Regards
Masahiro Yamada

