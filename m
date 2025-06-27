Return-Path: <linux-kbuild+bounces-7730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E01FFAEB1E6
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 11:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A34F1757E4
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 09:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0CD28ECCD;
	Fri, 27 Jun 2025 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feLu9uV8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BCF291C2E
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Jun 2025 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014952; cv=none; b=grhOYcfa3IGw9lWb9Wz7CI1K46pEyQoNTzyaUHqJPssrxAHyPZsR3fLdNGhrFRNeutzU1GhQqw/yJ8ev+8xn9QMUi8py7pntF6RejL2xapfZXFMkNLJgIYiXEffzNpqutJ5KMAoa/cPYVMjiSKxaLHKWXvX1zBbFBJD7K1rslmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014952; c=relaxed/simple;
	bh=KxaR582ssVFji9F85gq9nIvLyIpxJsKIhozFwV6a/ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQBGKHgdqxQKT2acyTm61AReVwqdhW+Kl4yeJS7CT5iSEyn8y4SnGm0GoumMGimj1aRi0NtX0jd92jqLtzV2428r/Min+682l72H5Hei+yKzw5qzAnhhBsEn84paH2rILwHEGOb7DC581giREviNWWMOswv5k1w8BiviIqLL+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feLu9uV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A03EC4CEEB
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Jun 2025 09:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751014951;
	bh=KxaR582ssVFji9F85gq9nIvLyIpxJsKIhozFwV6a/ss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=feLu9uV82Cj5Ho7PS5jibqbH2bngpUha2L++6rT1qG3Y5upKIrAJe3Zff4MqDajxn
	 h2IuVbFYfFbqbITaYIVPipXG7cFNLFla6gfWAqKbfSyMIgz5UbrxomlYgtr1bopKuy
	 k9r83dyLuCs6WudPNgrERHoMaOvfADFJx2j0GH4q0GTh8zHM2/RYdmasrh2zYilqtv
	 D1QZRTR7+uLx+hMCymEMszQNDFOL/aIcAxu+Ly1mKmXJxNxeKJWr7toDRlJh3a8y1S
	 IM6tBBMEv7MVdN3ndgINmEP8QeZIIOFY35Eaq3xBRVfC9d56gzS/AmUM72effnEbU+
	 XI4ZmV1XwI52A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54d98aa5981so2778812e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Jun 2025 02:02:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YxFzrVHgBiZWiB+e44ri3XvDYJDMzeCRuLmRMMr2Y9bccJm85EO
	63VZsh5MGWYE2eDo8m4+U8VhslRzuGIx/UEvuSfqUosTJIUcvYQW27zqfwekMeDSMQ3h9NHuIdt
	21YxoXXiLk7nTvkHJUsiIPRri9EWc9Q4=
X-Google-Smtp-Source: AGHT+IFkMo2ZNKvKF2HDSFiodusgBmT74WMFhY7rFiIsOBRU/S0bM/2O5I67EcT6RPmwu9CiGPT5u4DyWoS+Pk6YUCc=
X-Received: by 2002:a05:6512:3e1f:b0:553:24bb:daa1 with SMTP id
 2adb3069b0e04-5550b7ece62mr817436e87.11.1751014950167; Fri, 27 Jun 2025
 02:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625190654.313652-1-shankari.ak0208@gmail.com>
In-Reply-To: <20250625190654.313652-1-shankari.ak0208@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Jun 2025 18:01:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNASxXXVywppjM=aqc4_TohmZnt8PHrc9HVhcZNETwONxUA@mail.gmail.com>
X-Gm-Features: Ac12FXwMLrXMIkMVMN8dAbnIFlJujq3gKRZ5FuNXeGTDhgm3lxik981VT0LvW6I
Message-ID: <CAK7LNASxXXVywppjM=aqc4_TohmZnt8PHrc9HVhcZNETwONxUA@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/nconf: Ensure null termination where strncpy
 is used
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 4:07=E2=80=AFAM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> strncpy() does not guarantee null-termination
> if the source string is longer than the destination buffer.
> Ensure the buffer is explicitly null-terminated to prevent
> potential string overflows or undefined behavior.
>
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
> v2 -> v3: Remove the replacement to snprint and instead terminate the buf=
fer explicitly.

Applied to linux-kbuild.
Thanks.



> ---
>  scripts/kconfig/nconf.c     | 2 ++
>  scripts/kconfig/nconf.gui.c | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index c0b2dabf6c89..cfa4d395dcd4 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -592,6 +592,8 @@ static void item_add_str(const char *fmt, ...)
>         strncpy(k_menu_items[index].str,
>                 tmp_str,
>                 sizeof(k_menu_items[index].str));
> +
> +       k_menu_items[index].str[sizeof(k_menu_items[index].str) - 1] =3D =
'\0';
>
>         free_item(curses_menu_items[index]);
>         curses_menu_items[index] =3D new_item(
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 4bfdf8ac2a9a..475a403ab8ba 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -177,7 +177,7 @@ void fill_window(WINDOW *win, const char *text)
>                 const char *line =3D get_line(text, i);
>                 int len =3D get_line_length(line);
>                 strncpy(tmp, line, min(len, x));
> -               tmp[len] =3D '\0';
> +               tmp[sizeof(tmp) - 1] =3D '\0';
>                 mvwprintw(win, i, 0, "%s", tmp);
>         }
>  }
> @@ -359,6 +359,7 @@ int dialog_inputbox(WINDOW *main_window,
>         x =3D (columns-win_cols)/2;
>
>         strncpy(result, init, *result_len);
> +       result[*result_len - 1] =3D '\0';
>
>         /* create the windows */
>         win =3D newwin(win_lines, win_cols, y, x);
>
> base-commit: c4dce0c094a89b1bc8fde1163342bd6fe29c0370
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

