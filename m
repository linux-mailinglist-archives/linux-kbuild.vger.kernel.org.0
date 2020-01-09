Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E2D135E74
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2020 17:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387743AbgAIQiR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Jan 2020 11:38:17 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:43847 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387741AbgAIQiQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:38:16 -0500
Received: by mail-qv1-f66.google.com with SMTP id p2so3202196qvo.10
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2020 08:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OPe/HMKwKhkEkwTPCWJjEeUhExBLeIT5A1xBW+xeUQc=;
        b=I8FfagaFavLXeHzK0DjgVqVFYUEzD9hocHdxthK9XOcJV/lh39/jEvN9Av39u85cbI
         3gpWldaYdt7d4zJrFGoctpLemS9PcOgnygUpKm9eemVR+f4ug9dZuk6yDOaUyJE5O7+d
         maxMZZOwR7yqLpPas3F7sk3Y9g4ruKh3ZRmF7wJsusqRmHOUMf13VI8lfzKMIwy4A+tj
         C0HeW37MBIVe7l4fGiOZeY6G37WnvPQuKOrVeS21N0WMwo1cr/UfFJSVZ89la2dnpaxF
         DvRiPNm1KVnNo+TonZhyIvRMiukJEon6259cqy/BpFf9JWP/szXLozoDXSAcn7pfMXdk
         NB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OPe/HMKwKhkEkwTPCWJjEeUhExBLeIT5A1xBW+xeUQc=;
        b=b/oA93hBziXNbSr/73Rjx5Gn9NE+cq4UOqa2cOlmsGRMOrSfKIWwgfXVPqMiUrnsMx
         22UbNBkbOKhR9G7Te4x2uG6VZylMuilN/+7lDBgc+XZjNIvIj+AbjQo/s0solXCWcDo5
         +dhK4betLVvvpIfs5689tVdS3FT/I9BIUIn+cPjwwvazP/Z6gouLYcU1XQjhDEE2jKD3
         X693xxKwlx2DPoSBcYFMD88yb9GqaMgdcpw7LapDWbBpBZfPidZDQvXv/h50qw3S6859
         MJMrEsin8UWFCpyJKvWUVSFMzdy7dCA0etHotlQ6nC5R5xIrkZYsNV85vM/DTMqy0EhQ
         gVmA==
X-Gm-Message-State: APjAAAVqBM//5kNXtaIym1yVqXmpkN76nB/4dtJ4pdKmZJlbrDbpce4w
        drBuCPYr44j2muKkqE/BWTKXrzGChX8d3LgQcE+qQOIWPT0=
X-Google-Smtp-Source: APXvYqygL86jZcsVrFwXhHQh9P+5HKhCz0Qq7ukOPdDluEQzw+d0pUENMTdTqOgXckbNuc8LW9siLvyMErzw9iPXr88=
X-Received: by 2002:a0c:d60e:: with SMTP id c14mr9507784qvj.76.1578587895785;
 Thu, 09 Jan 2020 08:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20200109161724.9546-1-brgl@bgdev.pl> <CAK7LNAQQcGLq46QOhqHArQvQG8DP2uQDtpn8XoUthNhwu8Aiyg@mail.gmail.com>
In-Reply-To: <CAK7LNAQQcGLq46QOhqHArQvQG8DP2uQDtpn8XoUthNhwu8Aiyg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 9 Jan 2020 17:38:03 +0100
Message-ID: <CAMpxmJUp_sEzf7sO1m=A+16eAhMJtu2Z_O2cZk7XCQeSjNj9+A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: ignore temporary generated files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

czw., 9 sty 2020 o 17:36 Masahiro Yamada <masahiroy@kernel.org> napisa=C5=
=82(a):
>
> On Fri, Jan 10, 2020 at 1:17 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > If building gconfig fails, a temporary gtk config file is left in the
> > kconfig directory and is not ignored by git. Add an appropriate pattern
> > to .gitignore.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  scripts/kconfig/.gitignore | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
> > index b5bf92f66d11..d22e6753397d 100644
> > --- a/scripts/kconfig/.gitignore
> > +++ b/scripts/kconfig/.gitignore
> > @@ -3,6 +3,7 @@
> >  #
> >  *.moc
> >  *conf-cfg
> > +*conf-cfg.tmp
>
> I have no idea in which situation this pattern is left.
>
> Could you tell me the way to reproduce it?

Sure:

1. Don't have gtk+ development files installed.
2. Run `make gconfig`.
3. Watch it fail with the following error message:

---
$ make gconfig
*
* Unable to find the GTK+ installation. Please make sure that
* the GTK+ 2.0 development package is correctly installed.
* You need gtk+-2.0 gmodule-2.0 libglade-2.0
*
make[1]: *** [scripts/kconfig/Makefile:212: scripts/kconfig/gconf-cfg] Erro=
r 1
make: *** [Makefile:568: gconfig] Error 2
---

4. See the file `gconf-cfg.tmp` under scripts/kconfig.

Bart
