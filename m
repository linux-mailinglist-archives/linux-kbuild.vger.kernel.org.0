Return-Path: <linux-kbuild+bounces-8247-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2611B14F14
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 16:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E271D17F9CE
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 14:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9263C1D27B6;
	Tue, 29 Jul 2025 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxynFBV/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69597433D9;
	Tue, 29 Jul 2025 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753798335; cv=none; b=LsY7DCQ6N6cX0gdYg2hMKgoEdLwj4zBGmHQpqbxHHjcjDaImzASflP4E7FoVs+/fmM3VrxWBYC8v3zagmo3Pg4oONJYjFxXE+QpM2+6JiFGIB65dOD+vdJApJQk0YOm2u6393DQO4tJXJ6sgT4DwL1k1DeVbpWnNVi/usVBtj0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753798335; c=relaxed/simple;
	bh=jDRhN2IMBSob6zPe87nVLlzN7gWt3TNYEl/hJ6F36lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p842a+n2qxVWqHD1uqkhMhs/LGv9Kxnn/j8OaDrBJLH5i5pKtDIpAR3x0lYpkmqbXz+kOIx9UZmzS+2BtnE79CBL7Reb5VMi6I64Xo64k9S47u+tmSkkWHuTwPQ6ylJDWQZ+FF2OsVCVQd2i2OKrfLYZfiSzK/7JRg+eJi++0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxynFBV/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D2BC4CEEF;
	Tue, 29 Jul 2025 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753798335;
	bh=jDRhN2IMBSob6zPe87nVLlzN7gWt3TNYEl/hJ6F36lU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cxynFBV/6Bqqn6+gbuDvgsSNX7LB9BSsQhfh8nq/SyjSNUkGevn68dKBsbSn8NEQ4
	 dytSuMpEeDZP9Wl//PM6Xh0lUkugz4sC+DMEJZ/yIphA95V+ldLwvga6Phb7IvtWA+
	 3cHTVCrvynOQCZ+vbkLRj77g8CGP1vOr3MPNe64+MYi8/q8MXOLIc0Q5XFZsoI25pf
	 CZWUxWKDLQwBPkdhimiHCvNLhxO+vO4h3FzN1w9lOgGrYM8VGUrLxcAt1s1KuIH6ya
	 Zu/LNyiNcogw2bNzT+CSYoscxtjiYnpJz700h3XDaYWjVMtIg4irmqGWN9cn6rvmSU
	 jguLnq4nOrWTw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32e14cf205cso55700321fa.1;
        Tue, 29 Jul 2025 07:12:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpuiB8bG9LSXEV3EEdJlIcxxcPkRsmz0/hOiGa9alfbsJe+BLEUCN5XIDe/3QU7vrymhTq6+f4HLzG3h5X@vger.kernel.org, AJvYcCXAhD9iCOhaHYy+WZQDkEKGMNNUvDE92dzaPPalS/Xk3vzKh1Fhazv5nQx2RioVeMoLrGe6ATdN1mo0wvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4osSIzhB+oMACHsxqReW4ckHERryAANJCQA8DZyMrnjUN3ymb
	J/Besx17qMQYwyVIVK/SWPJjUK6UzZPnJaLHF8StxY74xUXIcJyvtgPEqYZ22bxQ/zWEeTciMya
	2fgZDRxVm+NcShOophR/hVOkpghAu0qg=
X-Google-Smtp-Source: AGHT+IH23hRA/y0GXDlQjGAIRAipKSLMeP2SE9aWCB8j/9drPhwYl9q06csg2Q2zs9K02T+77MvfoHiRKXg8Sgpvvz4=
X-Received: by 2002:a05:651c:1991:b0:332:2235:911c with SMTP id
 38308e7fff4ca-33222359358mr463391fa.37.1753798333708; Tue, 29 Jul 2025
 07:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726194307.182093-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20250726194307.182093-1-suchitkarunakaran@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 23:11:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBLKpvZnSnDQwbByVvCvSWMEJYo4=pnx6_9ZTZRqFCBQ@mail.gmail.com>
X-Gm-Features: Ac12FXyO8Zpy3bEwD1XaiVntflmoj0BvI1AivtiRIL0j8BjKTord1rBYVAGRK-E
Message-ID: <CAK7LNAQBLKpvZnSnDQwbByVvCvSWMEJYo4=pnx6_9ZTZRqFCBQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig/lxdialog: replace strcpy with snprintf in print_autowrap
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: nicolas.schier@linux.dev, linux-kbuild@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 4:43=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> strcpy() does not perform bounds checking and can lead to buffer overflow=
s
> if the source string exceeds the destination buffer size. In
> print_autowrap(), replace strcpy() with snprintf() to safely copy the
> prompt string into the fixed-size tempstr buffer.
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---

Applied to linux-kbuild.
Thanks.



>  scripts/kconfig/lxdialog/util.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/u=
til.c
> index 964139c87fcb..b34000beb294 100644
> --- a/scripts/kconfig/lxdialog/util.c
> +++ b/scripts/kconfig/lxdialog/util.c
> @@ -345,8 +345,7 @@ void print_autowrap(WINDOW * win, const char *prompt,=
 int width, int y, int x)
>         int prompt_len, room, wlen;
>         char tempstr[MAX_LEN + 1], *word, *sp, *sp2, *newline_separator =
=3D 0;
>
> -       strcpy(tempstr, prompt);
> -
> +       snprintf(tempstr, sizeof(tempstr), "%s", prompt);
>         prompt_len =3D strlen(tempstr);
>
>         if (prompt_len <=3D width - x * 2) {      /* If prompt is short *=
/
> --
> 2.50.1
>


--=20
Best Regards
Masahiro Yamada

