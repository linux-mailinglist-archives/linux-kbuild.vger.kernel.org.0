Return-Path: <linux-kbuild+bounces-7218-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E52DAC0582
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 09:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C5859E2E6B
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 07:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A08F1DF754;
	Thu, 22 May 2025 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9WvvaYX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9887176ADE
	for <linux-kbuild@vger.kernel.org>; Thu, 22 May 2025 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898480; cv=none; b=JNfGth0NReSp4G210Folr/p9i7uXDO4dqLwKo7Sve2hq8Oifwk4na7NZBO/qOIAwlcOcVtHVvpeTNJwPxRLK3HWXV8doqwuWEjW4Ifq+OkilpxzpS/3Y8LfRTj6xiGDl2zUdYNdqtfhec9R9ycT6Pr+23IYy1P8NaUNiQ22ovI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898480; c=relaxed/simple;
	bh=RB3l8yqb3os/936y+e9sai81mbUUS8Rw8EHhMjJoQ8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQ+zLN27Vx2j8tzQeIolHQgW0N+GChSgm6jpfVvolxvg9Qrp/ID7DqCL9kLmrdwM07roPEu/eQdk+iCzOat9LVrHLaY2RCDgB+EUBBGi8StZP6ZqZYxpb/jXav17QiFjlUebCG1lJ1lYlx8Spcalo9TuPkcMTFrn+dbcysATSJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9WvvaYX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6222AC4CEEA
	for <linux-kbuild@vger.kernel.org>; Thu, 22 May 2025 07:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747898477;
	bh=RB3l8yqb3os/936y+e9sai81mbUUS8Rw8EHhMjJoQ8k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U9WvvaYXzezCF/dTCiqe4QHlaLLUGPr6+slh5SicUpynsncDPAVagosRmzGiizHZP
	 t2J3Xflm6l/X+eCDiDnnF2Wy9oWJs5Wun+un7tH1bJ2uCHHn1Zg47Gk0EzvckIeloq
	 huUBz+kjA5oj0AD6UcR39nC1APBSDxUr3l8Pu2eIePWxR/a+R5x4RwhFlcdxd5/bYI
	 7QoO4F29M1P9xAlML89y4f8F2Iolu0PjN3ZN6hz3QQRyNq4ksPlM7FIfsP0Ym6Lepx
	 Buc4jdH5x4Znh8TfvEPBun6etBBMD2e4eFJh9m/p6tQm9v/esp3HH94aqu/npk/ODB
	 c7d2Evr3c5I4A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54acc0cd458so10054980e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 May 2025 00:21:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YztclLG/+ddMez4RIaBM4HSdaZ6vjIyyiv8xs/ls5f7nAKn+pXg
	xcHD+5XQGT2mzwSI0Frr3PwGhWA+su6e616Xvnboe17pNUR0ECQ8m5a2KVlES/IE9WmkKC26o5g
	kWsSO6ZpxHnPJezvGmH6kZg9dlo8dj0w=
X-Google-Smtp-Source: AGHT+IF/gZlN1DQUIoUwiBaciFsp9fulbEVNlT8mZ0TeHOnRDI1zjJjjgCdup+EtoreOpeq1ugLExHK+NNrSimwD90U=
X-Received: by 2002:ac2:4c4a:0:b0:54f:c31b:aebf with SMTP id
 2adb3069b0e04-550e7229980mr8655488e87.35.1747898476094; Thu, 22 May 2025
 00:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521195840.3915171-1-shankari.ak0208@gmail.com>
In-Reply-To: <20250521195840.3915171-1-shankari.ak0208@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 22 May 2025 16:20:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQgb5u-+FEp1PjSxT7whNbW8YoiYt41m01M6yrt+=PXrA@mail.gmail.com>
X-Gm-Features: AX0GCFvPiGuagLkR5bgY2MLr92azjeG5njo36siiswbNeNI8R9emx67gWvx4YDI
Message-ID: <CAK7LNAQgb5u-+FEp1PjSxT7whNbW8YoiYt41m01M6yrt+=PXrA@mail.gmail.com>
Subject: Re: [PATCH] kconfig/nconf: Replace deprecated strncpy() with strscpy()
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 4:58=E2=80=AFAM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> Replace strncpy() with strscpy() in fill_window() and dialog_inputbox() t=
o ensure safe, null-terminated string copies.
> The changes follow kernel guidelines deprecating strncpy() due to its und=
efined behavior on non-null-terminated output.
> Buffer sizes are correctly handled and strscpy() is sufficient for both c=
ases. (See: https://docs.kernel.org/process/deprecated.html#strcpy)
>
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>  scripts/kconfig/nconf.gui.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 4bfdf8ac2a9a..a1306fafd07f 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -176,7 +176,7 @@ void fill_window(WINDOW *win, const char *text)
>                 char tmp[x+10];
>                 const char *line =3D get_line(text, i);
>                 int len =3D get_line_length(line);
> -               strncpy(tmp, line, min(len, x));
> +               strscpy(tmp, line, min(len, x));
>                 tmp[len] =3D '\0';
>                 mvwprintw(win, i, 0, "%s", tmp);
>         }
> @@ -358,7 +358,7 @@ int dialog_inputbox(WINDOW *main_window,
>         y =3D (lines-win_lines)/2;
>         x =3D (columns-win_cols)/2;
>
> -       strncpy(result, init, *result_len);
> +       strscpy(result, init, *result_len);
>
>         /* create the windows */
>         win =3D newwin(win_lines, win_cols, y, x);
> --
> 2.34.1
>



Same reaction as this:

https://lore.kernel.org/linux-kbuild/6180248b-7ece-4400-a3ac-eda8b7c3959f@k=
ernel.org/

--=20
Best Regards
Masahiro Yamada

