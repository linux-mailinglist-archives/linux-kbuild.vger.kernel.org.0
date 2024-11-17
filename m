Return-Path: <linux-kbuild+bounces-4700-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C499D0206
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Nov 2024 05:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D46ACB222FD
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Nov 2024 04:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633F11171C;
	Sun, 17 Nov 2024 04:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juXa5VM2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D5F9D6;
	Sun, 17 Nov 2024 04:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731819202; cv=none; b=u5dVon7b/ZW/v7SaDY27a9tOF4JCPggvrXiVqMYbI2AgKngxQIbSVOgO/TWHzxGYaAYbjyVwwQVlwLedHRPIh1Gsy7imx8EtEbhQHcB67nyKd7Nq5N99gt/7VObuTslK/HeclSwuGoZgqcdDh2oqBmZZ8jj2AZUcPpi0OIuwThw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731819202; c=relaxed/simple;
	bh=Z4M/l36RQ7BDxA0KkJcywqBI1etn5Goa+uDViOuOZao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1smu8VVj6cmDmwNhyPEt32ag5TeI+zLz0exmVP/TFeLTdeTnhwTrpXYD/7eVtbXgHBRrcnPXZQO7qyscGBxJGcECaAGV6OqpBo+qNgHfXgf6PiVvC1iJy7i/gMkPCQE1t8DcQdvXadhfDYmOoO2Ca4owHQuh7ZjvbQDcNV4s3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juXa5VM2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC79CC4CED9;
	Sun, 17 Nov 2024 04:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731819201;
	bh=Z4M/l36RQ7BDxA0KkJcywqBI1etn5Goa+uDViOuOZao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=juXa5VM2/3+gf5GKqZo2M0CM5a64MV7GtJW4uxarzymsNmtEjNFADlwrXXQWNeMFV
	 KJt7QUXfdahobcnv5LdrxDqPCdLQsnbPnEXQxcVeUMdzobUaqdIUjwi3sFTOA+ReUb
	 TTPM9PmbPYSxKxZix4/SUDOcFRQivtjmU75w7q++WCsBaZk7dfNr68JchAIViZYIsa
	 Qhz6kgjf0AN0qXTyIhh0BZbEF0sAKl69yljkCllDKExmJUVvSd+EVU6a8a+5GZfeXT
	 PokapZtrtiF/8047rXyoZ0q0Zjg/JePUCczkm6lT1LYaI/gbD21IAGFv+t6Uu53pku
	 kIr99w7ZzupEA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb51f39394so27779891fa.2;
        Sat, 16 Nov 2024 20:53:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPyZy4wQ7QE9Lzs0PNypb2Xvwd0dqiCpHD4rdfMv8F9m6IpmGsVWt2tfYBS4blWe2dSJXmNHjirBDul1vW@vger.kernel.org, AJvYcCXQHE0S1ObEOjHbaKe3sLLi7Rxd6+OPD5WQMIioPEpQkvzqcAI9WCfuHYPC8PlMpoaf6LwJzk68uVGlXqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCqo7n/wcZ6gA0kk69lBjADCJt6gaNrhF/oz7vDInN6H3X4TC+
	nhsQhO4kxes5q+Lew2fyg3q8moTQ4KlrBY+yyxlGklbRQvqpsZ7I4c8E8ycfqq0fQ+ZHGIFlwJv
	gxTkxn7/vYMlZLVoMDwNvpNNSr68=
X-Google-Smtp-Source: AGHT+IFfyVPI/OVi1o+HOnvr+Rz8GoX4PcmXLXqpQzSsQLua2qkafXKAkY8vkxBQcZ+N/vBhCTLgDEDFQ/sdJsp/NN4=
X-Received: by 2002:a05:651c:1595:b0:2ff:5210:4128 with SMTP id
 38308e7fff4ca-2ff60925ebcmr36647001fa.22.1731819200527; Sat, 16 Nov 2024
 20:53:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108214953.1160765-1-xur@google.com>
In-Reply-To: <20241108214953.1160765-1-xur@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 17 Nov 2024 13:52:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNARO307kMjXgBPG59g4zbiW6KPQK8SJqjhVS1A7esDJaZw@mail.gmail.com>
Message-ID: <CAK7LNARO307kMjXgBPG59g4zbiW6KPQK8SJqjhVS1A7esDJaZw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Fix Propeller build option
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Han Shen <shenhan@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 6:50=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> The '-fbasic-block-sections=3Dlabels' option has been deprecated in tip
> of tree clang (20.0.0) [1]. While the option still works, a warning is
> emitted:
>
>   clang: warning: argument '-fbasic-block-sections=3Dlabels' is deprecate=
d, use '-fbasic-block-address-map' instead [-Wdeprecated]
>
> Add a version check to set the proper option.
>
> Link: https://github.com/llvm/llvm-project/pull/110039 [1]
>
> Signed-off-by: Rong Xu <xur@google.com>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
>
> ---
> ChangeLog in V2
> Integrated suggestions from Nathan Chancellor.
> (1) improved commit message
> (2) added links to the comments
> (3) used ld.lld version in the version check for lld
> ---

Applied to linux-kbuild.
Thanks!



--=20
Best Regards
Masahiro Yamada

