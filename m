Return-Path: <linux-kbuild+bounces-7311-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE172AC99BE
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 09:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F06301BA2B93
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 07:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E0222D7BF;
	Sat, 31 May 2025 07:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhI4Ln8D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5A22D9F4
	for <linux-kbuild@vger.kernel.org>; Sat, 31 May 2025 07:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674806; cv=none; b=SaAlulx/UDoqMUvsunFF5Jc/duZIfD1TXywLXIRzQl62N07YyBkExWjCFXRLWAdDeLrH4i2ZP9GjCCi4jQfW0tx/OLUCgKyMv5bNQHfZB5of9riaZ0Ukp6YdUI8P7fYBmiAuNonUS9EGrDtkgQN9L+awodw/zN8FbK2iS8YteiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674806; c=relaxed/simple;
	bh=KqKvB9fXRmFWxmv8dxR1xLl8uhNg4arOTgysl4sxBuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSdUbB80aIFSkCIt/X0ByTozJIKmXfcR/71PNR2LmBVYwQe6J9Jrff4E/MpKi1q/uzUHw03Y/OyJUI0mxIDn9FMsXAUGFuqzDlQo4Ks822Ni09Cfl17W+f4npwBxrSa7n2I8SIQqDY3TN1UJA0/VBW7DBcGhvb3UK/V0EP/wm9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhI4Ln8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64489C4CEEA
	for <linux-kbuild@vger.kernel.org>; Sat, 31 May 2025 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748674805;
	bh=KqKvB9fXRmFWxmv8dxR1xLl8uhNg4arOTgysl4sxBuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lhI4Ln8Dfuc5y4N2jA4WWh01m4WBxQy7FIXe9sm/eZQ+2SF2Fpc93bKLE2yiYxoXp
	 WVzwUF3OKUwsMiOWY2ttZuo9Sv3+Jh0bmIPa2645OZhv9YeFOZUWtFszdBcjWCpzql
	 OCR4lieSHB8wTcT7wYh+IVFsaFOU//SkaDOz+YeuhAmF5HgutWQ7GV21X4OxFlDYB0
	 bId27GteAlojQ1q5/qUyvqQXqjhcZKeXOyJMRhBbr8KYQIcnuNKkwmVSWpsrkPG7r3
	 omlBntpsHH1jOd5qUL0HGqu949TythtMgixIxDTo5zscMS/UlQPvLHuJWEiaw7MZJW
	 SzFiQidkkAvIg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551fe46934eso3325838e87.1
        for <linux-kbuild@vger.kernel.org>; Sat, 31 May 2025 00:00:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YyJ9aforyasjHu4Kb1JPZpUjn2rdHtuEpIItoW3YNa253OMiL3k
	io+3CmjtrkTBD2OcxVrseD+huDQbcPzaQLRS7HHv3brkT7OeZmoy/x27bsB6geuB7Qv9EFgsDUm
	/Xs7Y84HQXi0QgZw4X4YGGxGPIyBNsk8=
X-Google-Smtp-Source: AGHT+IFMoizDKsdl/U1Zs1KwkyWsC5Id5Y3v+mUQvtil5RIL0JHDOEH82PKQTZyM/3MnK12er69AqeNxSJK0s++3FXs=
X-Received: by 2002:a05:6512:3d2a:b0:54d:6a90:5ba6 with SMTP id
 2adb3069b0e04-5533b96319cmr1984159e87.0.1748674804079; Sat, 31 May 2025
 00:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525164014.1558750-1-shankari.ak0208@gmail.com>
In-Reply-To: <20250525164014.1558750-1-shankari.ak0208@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 31 May 2025 15:59:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATZUUupYq88bhLKCQLdSt+_-9AigiNmbvsmXjOFcN3Gog@mail.gmail.com>
X-Gm-Features: AX0GCFvAHMhiTUN2pAYDsphl354SIUyMHHsvKTY0ATZH5yVlGBVqwfJUIAM7AaQ
Message-ID: <CAK7LNATZUUupYq88bhLKCQLdSt+_-9AigiNmbvsmXjOFcN3Gog@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig/nconf: Replace strncpy() with snprintf() for
 safe string copy
To: CAK7LNAQgb5u-+FEp1PjSxT7whNbW8YoiYt41m01M6yrt+=PXrA@mail.gmail.com
Cc: linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org, 
	Shankari Anand <shankari.ak0208@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 1:40=E2=80=AFAM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> This patch replaces deprecated strncpy() calls with snprintf() in nconf.c=
 and nconf.gui.c,

Do you mean strncpy() is deprecated in userspace as well
and all programs using strncpy() must be fixed.
Is this what you mean?


> which are part of the userspace Kconfig frontend.
> The affected functions are: item_add_str() in nconf.c, fill_window() and =
dialog_inputbox() in nconf.gui.c
>
> strscpy() is not available in userspace; using snprintf() ensures safe, n=
ull-terminated string copying
> while avoiding undefined behavior. This improves code safety and maintain=
s compatibility with userspace builds.

Please explain why strncpy() must be replaced with snprintf(),
and what is the benefit of that.


> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>
> Tested with:
> make nconfig
> Verified successful build of the nconf binary and usage in the menu confi=
guration UI.
> Also confirmed no compiler warnings related to string copy functions.

But, you did not verify if this patch is applicable.




>
>  scripts/kconfig/nconf.c     | 6 +++---
>  scripts/kconfig/nconf.gui.c | 5 ++---
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 67ee33fe16ef..42a78f0baf16 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -589,9 +589,9 @@ static void item_add_str(const char *fmt, ...)
>         va_end(ap);
>         snprintf(tmp_str, sizeof(tmp_str), "%s%s",
>                         k_menu_items[index].str, new_str);
> -       strscpy(k_menu_items[index].str,
> -               tmp_str,
> -               sizeof(k_menu_items[index].str));
> +       snprintf(k_menu_items[index].str,
> +               sizeof(k_menu_items[index].str),
> +               "%s", tmp_str);
>
>         free_item(curses_menu_items[index]);
>         curses_menu_items[index] =3D new_item(
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index a1306fafd07f..d55518268f45 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -176,8 +176,7 @@ void fill_window(WINDOW *win, const char *text)
>                 char tmp[x+10];
>                 const char *line =3D get_line(text, i);
>                 int len =3D get_line_length(line);
> -               strscpy(tmp, line, min(len, x));
> -               tmp[len] =3D '\0';
> +               snprintf(tmp, sizeof(tmp), "%.*s", min(len, x), line);
>                 mvwprintw(win, i, 0, "%s", tmp);
>         }
>  }
> @@ -358,7 +357,7 @@ int dialog_inputbox(WINDOW *main_window,
>         y =3D (lines-win_lines)/2;
>         x =3D (columns-win_cols)/2;
>
> -       strscpy(result, init, *result_len);
> +       snprintf(result, *result_len, "%s", init);
>
>         /* create the windows */
>         win =3D newwin(win_lines, win_cols, y, x);
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

