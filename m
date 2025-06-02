Return-Path: <linux-kbuild+bounces-7333-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3845ACA9C6
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 09:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0F59189C1EA
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 07:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D9D42AAF;
	Mon,  2 Jun 2025 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2BBALic"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47AC79C4
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Jun 2025 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748848528; cv=none; b=EZFQP18QAP55YU+BpRh4BTqP0lFG98D70lpdHP0oCy3XjwNg+7HsunbjijxXONCxifudhQI/Vu3UFyf1xjz+c6H6Qw5jUglGmIs1j/ZU4JY8Jw81xaWMorwlpKIrkqU6z7p/kbcLlqTCf6AvLbbPglVoHOv5kWuXtgtQLgYW0TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748848528; c=relaxed/simple;
	bh=LjQJv5Pf41mGMoQsVsPr67Xu9Cl0FFlSf2tw8N65n5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rg2ZpZOQqUTauVvQD+gjmaDjY40HRCBSNUSvT9bQy+RbURGpcz/KF9OEdUx0yEQ+MHuUIwa54CMaSFo08XLJVq3oCT5ile6WJrcqf32Ny/4D2YcjtAnBKEe9VfS1T0cQDgSfdNNsnYF9t0aCbroXNXvbxqniFA01qZ0vK1OHnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2BBALic; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3124f18c214so1884872a91.2
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Jun 2025 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748848526; x=1749453326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URE5inO/DFvs4egiAf4gbbuk/Aga9GZIpfbKGDvGhnI=;
        b=F2BBALic5xMpgMFjDlpT4rP39tMs4g/U5PKNJe7k4MtCUmv237gmtW6JbnhmmhuiNP
         qLBiTUGPGLK5ijcCjZOd+aqg328lLOBEqjQU1hTrphZ6PLIOEs4VzZ+b1t9Y9IdYGnLV
         sVzEfjcXlf3X/vvuSegtQbDKCDBhvvI46VVJGhKZWkd78qn2s27NpxWJsol3diYF90uk
         ol6+DtvslYZemb9fSZeL1EFQVavoAEQ722ghPg685JP5+Fr/hWbVomannHxn+31OVA7g
         6g4MwlYVnwRWO7gUaMSCYP9gOoPK2Agzh9Gd56w+n9qUooXQPzGoriI8SXc7vSfNoQ3Q
         dwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748848526; x=1749453326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URE5inO/DFvs4egiAf4gbbuk/Aga9GZIpfbKGDvGhnI=;
        b=cHRTc8cGWwA3bPSg+SYjNS9rVo79NNR7CSKKnADm3R88ltr2bUryMyi1x8ZhcEBi3/
         se/7H0owMdaeWWln3k5/LrR0WeSA0uEsKruPh4OK4+8lrfDbuGfmY9/hW+Cbj/MsHJbv
         Javln7PIr89cBV0HHPhrxOX7w1R6/SRzhT6MeESe5b7nVwK5geeqzWkUOZZ6mfckBNuz
         8Qxx9NjXdWEz78UEqHahO4hesi3kZyIdSX2VjS4FXZdaJquAAc1fv5gnCGnqCbn+aIF0
         oh7V4sv8ykz/6DmqLBXu0Ch78A9xYn+GqlzENsa0gPz5QHPl2HYfvn0d8Wov0GoqBulI
         ZAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+kpZVEwolyoswa5EQ8hqCFH1qBHvCxlVOLYD8wTOPNSbnv0vL/rbp7enQvwziG0Q8MebrtvdTd9f8r/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM5CsE44AZG5kmNKJ9M/5sXV886xFY4w1Q32AqdQ1Tkk4Mc5fP
	ts00LUDYDvESziXksCNPPMt4yo5CPrYl6tC1RalWi373LDG8aMESXtsNbvY154ZHO3fQ5yDFv40
	/RlnZm3CsKjaMFGkbRud01Zn7CO0XiS4=
X-Gm-Gg: ASbGnctqG8yd52J++RCxNRWX5gN9tPaYIiRJqXe6QZQMZQlLi1MCK8qPVg1XotAcURB
	wYX3rNW/J4+889cRh+t1wN8772mRffRagImHoKMbHXBAItzOlO5BQf+BBNVJip4kxqvI8k32Z6P
	1z6toOrMyzRduHQHf+eykydjrQfHZNcVNAVg==
X-Google-Smtp-Source: AGHT+IEF2kxzem2+21KiUK3T4Jh9eQ3mvfKjqmfs27jj+qatHyKPW8+AWlveIx9IXZSIMX1unVzJMoCE1lKYIOhh2Ps=
X-Received: by 2002:a17:90b:538d:b0:312:26d9:d5b4 with SMTP id
 98e67ed59e1d1-3127c718575mr12864588a91.17.1748848525959; Mon, 02 Jun 2025
 00:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525164014.1558750-1-shankari.ak0208@gmail.com> <CAK7LNATZUUupYq88bhLKCQLdSt+_-9AigiNmbvsmXjOFcN3Gog@mail.gmail.com>
In-Reply-To: <CAK7LNATZUUupYq88bhLKCQLdSt+_-9AigiNmbvsmXjOFcN3Gog@mail.gmail.com>
From: Shankari Anand <shankari.ak0208@gmail.com>
Date: Mon, 2 Jun 2025 12:45:13 +0530
X-Gm-Features: AX0GCFsMmuMqQqBLxVip_4x0V8fB6ORp7Vu7EJixsb0rTOdFdyCdfvHygEgOS4E
Message-ID: <CAPRMd3=yWe_b9==eSCOrzC7v_Bnb2bQgxqrL+jCtfeSCm=Y3_Q@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig/nconf: Replace strncpy() with snprintf() for
 safe string copy
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: CAK7LNAQgb5u-+FEp1PjSxT7whNbW8YoiYt41m01M6yrt+=PXrA@mail.gmail.com, 
	linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Do you mean strncpy() is deprecated in userspace as well
> and all programs using strncpy() must be fixed.
> Is this what you mean?

Thanks for your feedback! I agree that strncpy() is not deprecated in
userspace, but I replaced it with snprintf() to prevent potential
issues where strncpy() might not null-terminate the destination. In
these cases, we=E2=80=99re copying user-facing strings or constructing disp=
lay
text, so it's crucial they=E2=80=99re always well-formed and safe. snprintf=
()
gives us that guarantee while maintaining the original logic.

> Please explain why strncpy() must be replaced with snprintf(),
> and what is the benefit of that.

1. item_add_str() in nconf.c: k_menu_items[index].str is a fixed-size
char array. We want to copy a full string, making sure it=E2=80=99s always
null-terminated. snprintf() does exactly that by writing up to N-1
bytes + null terminator. strncpy() could leave the destination
unterminated if tmp_str is too long which might be unsafe for
new_item() or any future string use.
2. fill_window() in nconf.gui.c: The intent is to print at most len
characters, clipped by the window width. Using snprintf() with
precision (%.*s) ensures that we never read/write beyond bounds. The
result is always null-terminated. With strncpy(), again, we risk lack
of null termination unless manually handled (as it was done with
tmp[len] =3D '\0';), which is brittle.
3. dialog_inputbox() in nconf.gui.c: result is a user-editable string
buffer, pre-initialized with init. *result_len is the max buffer size.
snprintf() will write up to result_len - 1 chars and null-terminate,
which is exactly what we want. strncpy() could fail to null-terminate
if init is too long.


On Sat, May 31, 2025 at 12:30=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Mon, May 26, 2025 at 1:40=E2=80=AFAM Shankari Anand
> <shankari.ak0208@gmail.com> wrote:
> >
> > This patch replaces deprecated strncpy() calls with snprintf() in nconf=
.c and nconf.gui.c,
>
> Do you mean strncpy() is deprecated in userspace as well
> and all programs using strncpy() must be fixed.
> Is this what you mean?
>
>
> > which are part of the userspace Kconfig frontend.
> > The affected functions are: item_add_str() in nconf.c, fill_window() an=
d dialog_inputbox() in nconf.gui.c
> >
> > strscpy() is not available in userspace; using snprintf() ensures safe,=
 null-terminated string copying
> > while avoiding undefined behavior. This improves code safety and mainta=
ins compatibility with userspace builds.
>
> Please explain why strncpy() must be replaced with snprintf(),
> and what is the benefit of that.
>
>
> > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> > ---
> >
> > Tested with:
> > make nconfig
> > Verified successful build of the nconf binary and usage in the menu con=
figuration UI.
> > Also confirmed no compiler warnings related to string copy functions.
>
> But, you did not verify if this patch is applicable.
>
>
>
>
> >
> >  scripts/kconfig/nconf.c     | 6 +++---
> >  scripts/kconfig/nconf.gui.c | 5 ++---
> >  2 files changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> > index 67ee33fe16ef..42a78f0baf16 100644
> > --- a/scripts/kconfig/nconf.c
> > +++ b/scripts/kconfig/nconf.c
> > @@ -589,9 +589,9 @@ static void item_add_str(const char *fmt, ...)
> >         va_end(ap);
> >         snprintf(tmp_str, sizeof(tmp_str), "%s%s",
> >                         k_menu_items[index].str, new_str);
> > -       strscpy(k_menu_items[index].str,
> > -               tmp_str,
> > -               sizeof(k_menu_items[index].str));
> > +       snprintf(k_menu_items[index].str,
> > +               sizeof(k_menu_items[index].str),
> > +               "%s", tmp_str);
> >
> >         free_item(curses_menu_items[index]);
> >         curses_menu_items[index] =3D new_item(
> > diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> > index a1306fafd07f..d55518268f45 100644
> > --- a/scripts/kconfig/nconf.gui.c
> > +++ b/scripts/kconfig/nconf.gui.c
> > @@ -176,8 +176,7 @@ void fill_window(WINDOW *win, const char *text)
> >                 char tmp[x+10];
> >                 const char *line =3D get_line(text, i);
> >                 int len =3D get_line_length(line);
> > -               strscpy(tmp, line, min(len, x));
> > -               tmp[len] =3D '\0';
> > +               snprintf(tmp, sizeof(tmp), "%.*s", min(len, x), line);
> >                 mvwprintw(win, i, 0, "%s", tmp);
> >         }
> >  }
> > @@ -358,7 +357,7 @@ int dialog_inputbox(WINDOW *main_window,
> >         y =3D (lines-win_lines)/2;
> >         x =3D (columns-win_cols)/2;
> >
> > -       strscpy(result, init, *result_len);
> > +       snprintf(result, *result_len, "%s", init);
> >
> >         /* create the windows */
> >         win =3D newwin(win_lines, win_cols, y, x);
> > --
> > 2.34.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada

