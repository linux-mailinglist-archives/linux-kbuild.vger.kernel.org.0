Return-Path: <linux-kbuild+bounces-7410-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE8AD1B38
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 12:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56A0716A5F7
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 10:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC0F24EA90;
	Mon,  9 Jun 2025 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUVX60CC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D029443ABC
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Jun 2025 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463647; cv=none; b=LSW2wAXhmTIreP69KOMk9Qd7vr3HYRvdcyODYgCx/o2ly9SQflhu7yFExB/JIMOoZmAXars61zaVrDKOzX0c2/CqTBNXGEaXztIYV4YgBIB+15XGzxFJzqtrTGNwoHc9wvpLSwhTp4tsDvOfrzmikuFihvQ+xKYeSda6zgSbOUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463647; c=relaxed/simple;
	bh=LdTPyX2LDpSclfNK44ZxvKsz4A1i38C6VIF9ml/YzPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBSGIYYyLt9AaAt4SpXS3bGRiK+hohzhezlSPHODHWg2wLVfreVwoxJy7zCPgE28+0rQnx+IPGaWGRLJfqW+2sbW41EUgE4WghISZhIoerk9ghHeT3Gr5arfRgTCD1rr+DeA5lVHZUZKA+JKi1xRF6sxOA1ZC/7vdttaOH37bxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUVX60CC; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2c4476d381so3449671a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jun 2025 03:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749463645; x=1750068445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BauS+XzO6xpoTQgpfzl8i7lfhfKkdnzvzA18jLCmCYE=;
        b=VUVX60CCBeUIr3NDKva8sM/UFHL9WICdhwIJ+lQcNQPNrdSwtxjpUJvEbKAHTNVUcT
         5PzURK+4xlhaRTX8zJsLP2GJ5mSUWoIt/k/ZbtVyly5I0Mlc4yAS6ExQTwwpoBVTlabz
         IJpFVxf2dcO5aRUTCEJ7P+F9+yQ1h2tBWHrCRt+L2GABayHqYjqsajRYcSA5YgE+5w0m
         cyIgb0MrHaxSmZhNOGDG0kkhkMJDLj8AcbZqVeGrOjndbgs+w5QNZX10ALlNUJLA8Um+
         GILVvRagVfxOu1W2DpTxbwIyBionbXKUInjMbo2kGWGj/y/LoFTWZQpttPHpBki+a+Kl
         TrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463645; x=1750068445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BauS+XzO6xpoTQgpfzl8i7lfhfKkdnzvzA18jLCmCYE=;
        b=GSD6CcQp4DRqSKQVDRgQuRQTo4ovcm7sllA9HXgLw6LuPZgN3r4eUawGI6XmhwF4Av
         /XOLvs2HNPKaiuGIcEP7SRs9pqLsa2SWQU0GoqyCRYFeAP7h69hVVCxYdagJRT1A2+Tk
         VyE/5DjEzZ1U+kQJBM0TVMYEusFd1rmZVz/VUfl8oCkS/cIRGJ7aNOCtDCFaA0R24cJx
         B/hy7PQHeUAlms4xKSQfxPbCZyRv/AuvPU1Mw0TJTt2+MJVnpnUMHZrYqRzDrEZOsF+Y
         GjjDxJF+QI5Gql6FrBMrn8I7uO0aE1jZZoUnybBd6aYf1uH/0ibMNKeJkXMoqbtnb2f6
         N09w==
X-Forwarded-Encrypted: i=1; AJvYcCVR+O+cIXBv77YSe+2xt4NikBGpqXbUfnk8Ocpkj2WI9CfO+v4Qi0qqHq3V7fb2+rKcSWmtz78e6SQpG8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywefu/7zTmFt5yMpijb98/PkpdjPbuIhwG3+IBeLfVTXUnUtRna
	w++aHC73n7IwEFkr1Q0l4POZLIY2CaPBspi1l5hDKFi9bwL/N3+FhyIzkCBwslfKyIQVbSc/hn5
	NijSOPDbybG8JfQvFD9zqKRZ6oFYiO1jp/OcpqFs=
X-Gm-Gg: ASbGncuqwT4A27qbW4F6cIrRfBnxT2Zem1VbNtkfEgFkxBnhmRn7D4WAtABR8Zhpzam
	fKDwV06tXe//UTWAjNzcr1/GhBz/9/N5qkclOZZjhl0sHa0yjHImf8WP7BXrw0fshFsYcbE00ZN
	mxebTEStf05hMDIPZBY+S2vRVvAtGxnDmk
X-Google-Smtp-Source: AGHT+IFg7kDt0UfkmxMAV07TU4V2DlRmO26WgbXuAH7iz6+av97htN3Sqw+Oe34Ll1DhoIyJwQKQw+ZckSNkJ7A0gfI=
X-Received: by 2002:a17:90b:57c3:b0:30e:3737:7c87 with SMTP id
 98e67ed59e1d1-31349f424a2mr16196872a91.5.1749463645074; Mon, 09 Jun 2025
 03:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525164014.1558750-1-shankari.ak0208@gmail.com>
 <CAK7LNATZUUupYq88bhLKCQLdSt+_-9AigiNmbvsmXjOFcN3Gog@mail.gmail.com>
 <CAPRMd3=yWe_b9==eSCOrzC7v_Bnb2bQgxqrL+jCtfeSCm=Y3_Q@mail.gmail.com> <4b267dd1-2fb2-43d8-bac1-910f3fe8868a@gmail.com>
In-Reply-To: <4b267dd1-2fb2-43d8-bac1-910f3fe8868a@gmail.com>
From: Shankari Anand <shankari.ak0208@gmail.com>
Date: Mon, 9 Jun 2025 15:37:13 +0530
X-Gm-Features: AX0GCFt8ZbuHLYJshwPCgDNqKwX-RJ63SElbJ_IoZFyW5Jh8fsOBGXx_IcjJVIw
Message-ID: <CAPRMd3kWRHvUE=FuRoGBXYR1POCL05sec4-9u6_Pb667TBFaiA@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig/nconf: Replace strncpy() with snprintf() for
 safe string copy
To: Franco Martelli <martellif67@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	CAK7LNAQgb5u-+FEp1PjSxT7whNbW8YoiYt41m01M6yrt+=PXrA@mail.gmail.com, 
	linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You can omit the format specifier of snprintf(=E2=80=A6) when you use a s=
ingle
> variable:
> +       snprintf(result, *result_len, init);


Wouldn't passing init as the format string directly lead to format
string vulnerabilities if init contains any format specifiers?


On Mon, Jun 2, 2025 at 7:27=E2=80=AFPM Franco Martelli <martellif67@gmail.c=
om> wrote:
>
> On 02/06/25 at 09:15, Shankari Anand wrote:
>
> >>> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> >>> ---
> >>>
> >>> Tested with:
> >>> make nconfig
> >>> Verified successful build of the nconf binary and usage in the menu c=
onfiguration UI.
> >>> Also confirmed no compiler warnings related to string copy functions.
> >>
> >> But, you did not verify if this patch is applicable.
> >>
> >>
> >>
> >>
> >>>
> >>>   scripts/kconfig/nconf.c     | 6 +++---
> >>>   scripts/kconfig/nconf.gui.c | 5 ++---
> >>>   2 files changed, 5 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> >>> index 67ee33fe16ef..42a78f0baf16 100644
> >>> --- a/scripts/kconfig/nconf.c
> >>> +++ b/scripts/kconfig/nconf.c
> >>> @@ -589,9 +589,9 @@ static void item_add_str(const char *fmt, ...)
> >>>          va_end(ap);
> >>>          snprintf(tmp_str, sizeof(tmp_str), "%s%s",
> >>>                          k_menu_items[index].str, new_str);
> >>> -       strscpy(k_menu_items[index].str,
> >>> -               tmp_str,
> >>> -               sizeof(k_menu_items[index].str));
> >>> +       snprintf(k_menu_items[index].str,
> >>> +               sizeof(k_menu_items[index].str),
> >>> +               "%s", tmp_str);
> >>>
> >>>          free_item(curses_menu_items[index]);
> >>>          curses_menu_items[index] =3D new_item(
> >>> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.=
c
> >>> index a1306fafd07f..d55518268f45 100644
> >>> --- a/scripts/kconfig/nconf.gui.c
> >>> +++ b/scripts/kconfig/nconf.gui.c
> >>> @@ -176,8 +176,7 @@ void fill_window(WINDOW *win, const char *text)
> >>>                  char tmp[x+10];
> >>>                  const char *line =3D get_line(text, i);
> >>>                  int len =3D get_line_length(line);
> >>> -               strscpy(tmp, line, min(len, x));
> >>> -               tmp[len] =3D '\0';
> >>> +               snprintf(tmp, sizeof(tmp), "%.*s", min(len, x), line)=
;
> >>>                  mvwprintw(win, i, 0, "%s", tmp);
> >>>          }
> >>>   }
> >>> @@ -358,7 +357,7 @@ int dialog_inputbox(WINDOW *main_window,
> >>>          y =3D (lines-win_lines)/2;
> >>>          x =3D (columns-win_cols)/2;
> >>>
> >>> -       strscpy(result, init, *result_len);
> >>> +       snprintf(result, *result_len, "%s", init);
>
> You can omit the format specifier of snprintf(=E2=80=A6) when you use a s=
ingle
> variable:
> +       snprintf(result, *result_len, init);
>
> >>>
> >>>          /* create the windows */
> >>>          win =3D newwin(win_lines, win_cols, y, x);
> >>> --
> >>> 2.34.1
> >>>
> >>
> >>
> >> --
> >> Best Regards
> >> Masahiro Yamada
> >
>
> --
> Franco Martelli

