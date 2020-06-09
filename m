Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011C61F4114
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2020 18:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731134AbgFIQim (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jun 2020 12:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgFIQik (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 12:38:40 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E6EC05BD1E
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2020 09:38:40 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id u17so12389313vsu.7
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2020 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zOlGKSFvY1pI9N1uJPPgWgfeEHmguEiYJ7YiYYJSbko=;
        b=hvovTJAJvh7wCMAYtoMOUN5GboICn5ViKLaH6VTVT6WsLLXtZ57QjQ0ytXukVQMAlW
         4PNiDQ5iylbja41COM15qdKydv0Frya6DfDeTT0wLLzfaaiLETWORrfkAJhPv92RCFfu
         q/2zJRCieLfXvJ8ogfHruxgWdnfmJiE/Ao6bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zOlGKSFvY1pI9N1uJPPgWgfeEHmguEiYJ7YiYYJSbko=;
        b=U6DiwPgE7DFdwjLtrf5rErqZmaonsAH43OAEMJiQUMyiuxpwicpouQOdYT9RMVhpgO
         4W/i5crxXLqrMtzS0FiZXR0eQSmkasPXDQH638WG0Dj3clVLwbdQW9LGCWKCZlStJgdk
         cJHljkhg5MskKo9sYIfHZgmWY4AZhyzhikLLDE5Yw16K/hzeOvBUB3O10iK/HdbWwsQN
         Q4ut+O4jjcBEhFgFqYQjSpV9OmUlwHWkMoMwFuBOGcI1NC9+Ql7eYllJgGrYXscUYbR8
         Ych/t+FzWxUzKxoqHgS0deuy9t1hva48bC44guJxUk2xYT7j9cB0uTd2p6vcxCLDTdYm
         S78A==
X-Gm-Message-State: AOAM531HG5YpgT2jd+jH/+ajt8OmNy+Mw6XWs+hBC81LEX+yt8pAKKg+
        Tt8Z0M8LI+KXdV5Z6Jid9A2FeqhzCSY=
X-Google-Smtp-Source: ABdhPJylhsrhY17i47mE/kyxXhpAWRgbFyiFCte7ORTk1zGgnS9RQojRZfPORipjlbLbYqEj+xiVwA==
X-Received: by 2002:a67:cb87:: with SMTP id h7mr4465400vsl.226.1591720719122;
        Tue, 09 Jun 2020 09:38:39 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id j15sm495815vsd.19.2020.06.09.09.38.38
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 09:38:38 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id g44so7059807uae.12
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2020 09:38:38 -0700 (PDT)
X-Received: by 2002:a9f:2804:: with SMTP id c4mr4120504uac.8.1591720717603;
 Tue, 09 Jun 2020 09:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
 <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com> <3cd1a050fe692425352745672295033c@talpidae.net>
In-Reply-To: <3cd1a050fe692425352745672295033c@talpidae.net>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 9 Jun 2020 09:38:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPW_o4ExmNUHe=2mYHLheKMfGTemW8CCiN4iQ7X3fAYw@mail.gmail.com>
Message-ID: <CAD=FV=WPW_o4ExmNUHe=2mYHLheKMfGTemW8CCiN4iQ7X3fAYw@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: install modules.builtin even if CONFIG_MODULES=n
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On Tue, Jun 3, 2020 at 9:33 AM Jonas Zeiger <jonas.zeiger@talpidae.net> wrote:
>
> Many applications check for available kernel features via:
>
>   - /proc/modules (loaded modules, present if CONFIG_MODULES=y)
>   - $(MODLIB)/modules.builtin (builtin modules)
>
> They fail to detect features if the kernel was built with
> CONFIG_MODULES=n
> and modules.builtin isn't installed.
>
> Therefore, add the target "_builtin_inst_" and make "install" and
> "modules_install" depend on it.
>
> Tests results:
>
>   - make install: kernel image is copied as before, modules.builtin
> copied
>   - make modules_install: (CONFIG_MODULES=n) nothing is copied, exit 1
>
> Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>
> ---
>   Makefile | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)

Note that this change broke builds in the Chrome OS build system
because we require modules to be installed to a certain path and we
weren't passing "INSTALL_MOD_PATH" when we called "make install".

We can certainly fix our build system (I have a patch at
https://crrev.com/c/2237511 for it), but I do wonder if others will
hit the same issue.  Others might not have such a nice sandboxing
system so they might unknowingly try to install files to the build
computer's modules directory instead of their target.

-Doug
