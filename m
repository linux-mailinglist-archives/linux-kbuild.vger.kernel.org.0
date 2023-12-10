Return-Path: <linux-kbuild+bounces-312-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544A080B959
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 07:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 812591C20380
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 06:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0EF17CF;
	Sun, 10 Dec 2023 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqaoGpBz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FE7EC
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Dec 2023 06:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD46C433C8
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Dec 2023 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702190317;
	bh=f4J07cs/v/dEud5COvTxeWJSCG3sw0khndP3TOKc6ME=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CqaoGpBzgeXYkMpVJ2qWZ5tkk09Gf0unItMoQfQs5rSCSJZMLQDQHIqUm/9b+Lrvj
	 49DkQ3OPMjR/i9KE1hq2bd5qm6K6cmz5f6aM9dpp29oTdENeZQrNFkYMwmi3Cuzdhc
	 hPZrVW4F0SiULkTlbqiaquzprP8tW/gBMjlrxTluScDAfD7D4O2kEWsbiKlnL867ff
	 kEzREVvxQAk/GTd/pZlEBTKF65KJyyK16nYdClBW3mbC65NzVKVor1fWYK7eMtcoi+
	 hArsYY+wflHv5V5PdwT6/hK6rJIRVXDgPCRzXr/8aj4uzCOqE3E6PcmAk367y81Q8m
	 T3MR9Qf+6qcpg==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1f5da5df68eso2542593fac.2
        for <linux-kbuild@vger.kernel.org>; Sat, 09 Dec 2023 22:38:37 -0800 (PST)
X-Gm-Message-State: AOJu0YwkS/QcDvvgmTdbOWQED9ifaehLoMFfGkrkLQMyLGBbA7GsNG1y
	i2ozjFWyES/dDAekP+MLAICJRxoujqu4Cgqfw/E=
X-Google-Smtp-Source: AGHT+IFOD+sUTuoV9xyfBhxWx1/VGTbS8HqdOkH18ZV+mM42FcGpkKNvZ/SKVUkz4BG7/+aQx+ByVPiPW19OTqeUyJE=
X-Received: by 2002:a05:6870:80b:b0:1ff:bab:7bde with SMTP id
 fw11-20020a056870080b00b001ff0bab7bdemr3397089oab.50.1702190317344; Sat, 09
 Dec 2023 22:38:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205-maintainers-kbuild-clang-tools-v1-1-a646a1985300@kernel.org>
In-Reply-To: <20231205-maintainers-kbuild-clang-tools-v1-1-a646a1985300@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Dec 2023 15:38:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+iPy9_zt5ma1fE9tKF9OP+skU876b6q5MaPeKy0j_aA@mail.gmail.com>
Message-ID: <CAK7LNAS+iPy9_zt5ma1fE9tKF9OP+skU876b6q5MaPeKy0j_aA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add scripts/clang-tools to Kbuild section
To: Nathan Chancellor <nathan@kernel.org>
Cc: nicolas@fjasle.eu, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 2:06=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Masahiro has always applied scripts/clang-tools patches but it is not
> included in the Kbuild section, so neither he nor linux-kbuild get cc'd
> on patches that touch those files.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>


Applied to linux-kbuild.
Thanks.


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 788be9ab5b73..cd9bf44dc1b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11526,6 +11526,7 @@ F:      scripts/*vmlinux*
>  F:     scripts/Kbuild*
>  F:     scripts/Makefile*
>  F:     scripts/basic/
> +F:     scripts/clang-tools/
>  F:     scripts/dummy-tools/
>  F:     scripts/mk*
>  F:     scripts/mod/
>
> ---
> base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
> change-id: 20231205-maintainers-kbuild-clang-tools-93666b423b02
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--=20
Best Regards
Masahiro Yamada

