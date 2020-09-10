Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30E1264B3E
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 19:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgIJR2a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 13:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgIJRYp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 13:24:45 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A705CC061757
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2020 10:24:45 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b124so4984558pfg.13
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2020 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g/DxpxIJfXdy7C8opyI8o+XkWeSXniE6Oz2qu6dzaF4=;
        b=qMZpuCyYWD6jZb+YzEyDAHOq9S96Dlc35zPEjydyxNKaUZLI+nsnTqKBltm7I7VQby
         HADCCTM9PWgXBnh/yMcjkuvxmRlsT5UNJXub/kYzv20GW2EKNQChlxY6p1hDrhjikVEM
         Y+KdEXPqXZ38Ol+OaDahwozrZuq1MEwyZ2pzintGUyw4fpxqp9GWD0eGlWbL4iCvW9Bj
         ofC7YnNgP7EgwY2vyDqqmL5l163B1x17PQenBv/kPXwJ3NQU2iMK+zB/IWAXaj3bZoaW
         oayGFBuGysrV56Qz+yWBWg7vkmwI0lExK3a6Cqh86+l2SoKA3YHsQx5QxJRwY1D4m3Gs
         hNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g/DxpxIJfXdy7C8opyI8o+XkWeSXniE6Oz2qu6dzaF4=;
        b=ci4bdOVrleLqLpsym3b+/DJaEnSP7ezfsFlV4bcrdun1e/pmrHJwzQAOHIIRctapp/
         bPH/NtBkff8ICBeaqKC70ggnVG3xTpXLSCrSpYhjMlQZ3L4HRB05UnoK6vo4uBjS7cpj
         5DScmd6DhCXwKa1gELqC1Il3idDX1K7TnqyAMf6/eaGfAVPgEIJD3wYCyG7Uc4Qt8Mit
         Z78f7CmJVqoWghn0GBLEP2qmp4OPQcJHth+nmNI2jbbWZskMXPJAK8Qhn9/l8PUztFZn
         QIy4wkYCWwmGVt642nVYQ+zHHgacblAM9tLzOrvU0aFHommo4UMOTZfLu9/0mJp9ZKh4
         7ulQ==
X-Gm-Message-State: AOAM531E2u4bDajOycQtjc9O/1oUKflqoXRt+slXxoVCc8SNCKGAuhVo
        7Dlxwx+qji54M6PnBSL/uS9KHpOjYOuFfsWOr4/t6w==
X-Google-Smtp-Source: ABdhPJy84r1DwOSmKuO14ubUxn/70iTZvTReoqQc3tEIf4yVSD6MRkGs/ON+GUp+U07oYBFP6qROw9QwQ7dzGR8qvH4=
X-Received: by 2002:a62:8349:: with SMTP id h70mr6667701pfe.47.1599758684979;
 Thu, 10 Sep 2020 10:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200908221638.2782778-1-masahiroy@kernel.org>
In-Reply-To: <20200908221638.2782778-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 10 Sep 2020 10:24:33 -0700
Message-ID: <CAKwvOdnP7UmpRPL8XjzoMPjgQb9Di8OXk9UEX8NWaa35A01Q3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: qconf: use delete[] instead of delete to
 free array (again)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 8, 2020 at 3:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit c9b09a9249e6 ("kconfig: qconf: use delete[] instead of delete
> to free array") fixed two lines, but there is one more.
> (cppcheck does not report it for some reason...)
>
> This was detected by Clang.
>
> "make HOSTCXX=clang++ xconfig" reports the following:
>
> scripts/kconfig/qconf.cc:1279:2: warning: 'delete' applied to a pointer that was allocated with 'new[]'; did you mean 'delete[]'? [-Wmismatched-new-delete]
>         delete data;
>         ^
>               []
> scripts/kconfig/qconf.cc:1239:15: note: allocated with 'new[]' here
>         char *data = new char[count + 1];
>                      ^
>
> Fixes: c4f7398bee9c ("kconfig: qconf: make debug links work again")
> Fixes: c9b09a9249e6 ("kconfig: qconf: use delete[] instead of delete to free array")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/kconfig/qconf.cc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 8638785328a7..c7216b9110fc 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1276,7 +1276,7 @@ void ConfigInfoView::clicked(const QUrl &url)
>         }
>
>         free(result);
> -       delete data;
> +       delete[] data;
>  }
>
>  void ConfigInfoView::contextMenuEvent(QContextMenuEvent *event)
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
