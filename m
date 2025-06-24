Return-Path: <linux-kbuild+bounces-7624-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1435AE634C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 13:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 090FC3A819C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 11:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227D6221F17;
	Tue, 24 Jun 2025 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1uN4qgW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F195C283FC2
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Jun 2025 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763343; cv=none; b=OL3NkmIHYyzmlfGGlnAZUuDYg5S153zRKDcLX9/fx07O2H3TkZdlxvpvVAKW6/+iFM+v1xIRWgl03ILN/6hZiddVqQkaBOp2TlIUICSm+cG9bDBANCxocGPXr1j92tzmd6RWWhbbjEiexocXBw5q25c1sMhPX1v112WqlYZEtXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763343; c=relaxed/simple;
	bh=Ubv857HjmQvjkavC0JgEk1Z8MKMsNts15p3Af34V+Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0q5PH9u/4JOixsUot160yM0UbPPJMvTliaquD2UIYUC7NNA6oMNiEHrLnhbGjPYlOeJj8RsaRn9l6r0y3T6guOCNSqH+NAH0Hre8sTry7GNJNZ12Mo+8npufxwn1BjXej5fosNGc/vxjl9M0kF/qtg0ZqS6oXB9YxMgh5pZhzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1uN4qgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71000C4CEEE
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Jun 2025 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750763342;
	bh=Ubv857HjmQvjkavC0JgEk1Z8MKMsNts15p3Af34V+Oo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y1uN4qgWrm58E4TtWUh/kblBW03SRwCtbWqBPYnTjj1QmO64kKHHnRYH0+ZKaDz/h
	 HZoUYiAIU3WElVFg6Es8rS4ZItlHj+CNoyFFfQuWwlJeCLfl+AA0QUuFeoWEgu+2Q5
	 JNw77Zt3LiM4u0/E/JoYeASk2o0SfP8Ov5D3uD4mnTpdECB8tMsPjJO/Wfn2qYMLZC
	 pU87yUqcaiCEbffmNGrKCS0pkovBRdC98NZRPwYwztpAhNpgXDsztLCL1QfrLr9lhs
	 lT3JEc8OWKpEzNQP+sYFUUpebJPpkZ1cxG3RAAIaOejsVsU9OFQxEptvm/TZvwHQeD
	 odW+Ql1QWff+g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55350d0eedeso315942e87.2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jun 2025 04:09:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YxAnc8HW0FbW8srx06tTugFOjGDJxvoHRLHthjzOE7Fw5SuhERA
	6t9QWTCS0GB5L8yywp+abvuHqTD+iyutkwGCt36G72TZVVk2z33CtNTa4grov1VOYhlG14rUK0i
	4Z0L9WO6lYphfmykc1rlo7cOja5yt8BU=
X-Google-Smtp-Source: AGHT+IFVh2Otz6YKFRtEtOSBHD5pqK4iEBHWFP1shz0rWsw/4ItGBIr/UeG3XJ4nGwEOdTLxSqmh6SkBz6FNYhxRUoQ=
X-Received: by 2002:a05:6512:3e18:b0:553:2e92:2c98 with SMTP id
 2adb3069b0e04-553e3d0b6a7mr4724853e87.42.1750763341127; Tue, 24 Jun 2025
 04:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612074802.900256-1-shankari.ak0208@gmail.com> <20250612074802.900256-2-shankari.ak0208@gmail.com>
In-Reply-To: <20250612074802.900256-2-shankari.ak0208@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Jun 2025 20:08:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASH7HyQZtPjerws7K8Smn1OXeDAXODdB9VaULXiYOitQg@mail.gmail.com>
X-Gm-Features: AX0GCFvy2fV_GjX7m1hqtGQlaLJXd4mzH1_0yOp3IQCpgKl2ySwUZsrzTP-BIQI
Message-ID: <CAK7LNASH7HyQZtPjerws7K8Smn1OXeDAXODdB9VaULXiYOitQg@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig/nconf: Replace strncpy() with snprintf()
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 4:48=E2=80=AFPM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> Replace strncpy() calls with snprintf() in nconf.c and nconf.gui.c,
> which are part of the userspace Kconfig frontend.
> The affected functions are - item_add_str() in nconf.c,
> fill_window() and dialog_inputbox() in nconf.gui.c

This is completely unnecessary information.


> As strscpy is not supported in userspace, snprintf can be used.

This one is not necessary either.


What you really need to explain in the commit description is:

strncpy() does not null-terminate the destination buffer if it is not
large enough to hold the entire source string. Make sure to explicitly
terminate the buffer.


And, I do not think you need to use snprintf() - just terminate
the buffer.

> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
> v1 -> v2 : Changed strscpy to snprintf as strscpy is not supported in use=
r-space
> ---
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
> -       strncpy(k_menu_items[index].str,
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
> -               strncpy(tmp, line, min(len, x));
> -               tmp[len] =3D '\0';

This one can be fixed to

     tmp[sizeof(tmp) - 1] =3D '\0'



> +               snprintf(tmp, sizeof(tmp), "%.*s", min(len, x), line);
>                 mvwprintw(win, i, 0, "%s", tmp);
>         }
>  }
> @@ -358,7 +357,7 @@ int dialog_inputbox(WINDOW *main_window,
>         y =3D (lines-win_lines)/2;
>         x =3D (columns-win_cols)/2;
>
> -       strncpy(result, init, *result_len);
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

