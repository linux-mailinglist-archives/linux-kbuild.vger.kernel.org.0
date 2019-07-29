Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C23E791DC
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 19:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfG2RRu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 13:17:50 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39495 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfG2RRt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 13:17:49 -0400
Received: by mail-pl1-f195.google.com with SMTP id b7so27806050pls.6
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2019 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XDpc8dttTfICfu+NA2rP7d7EK6Xfd1t48iUvlABkY5c=;
        b=E6X9hG/qC+ZFNxAoh/s2Pax+XfWjHa0cGxosOaBllMvG1GoZ+bG7ht/P+SsHlvVM2i
         iAKE8UKAG1/U41GXIS9cayYInLH7IhdLfc9d2fM77LE/9ZjF5EAp0NTs1Umd/hYBB8aK
         ZPWUu/MSUNU+qmL7DyG4FegdgaQ4lSbnnfvmIHoynHJTgZfshP1otKFBvsI9Uw0nDVGF
         u2gAJ5e8o+Q2z+6XMKTj0WNKR210qYVB2RM8HcZNBnh8Aci3EM3fKgJDZtv7nH7yjLdc
         a5EsADvAaOmrrvElKx5wG0aHrb7xop8JK3ZevyugGcR3LOoQb7hb6N0oIP1G1cJjeoVZ
         cQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XDpc8dttTfICfu+NA2rP7d7EK6Xfd1t48iUvlABkY5c=;
        b=pZJZGKJBeHynpE7IyeaKCLeyWCLBgJVajI8vyroETAf5sovbuXKIMoy4wEeLoTGria
         IkOT27YQnjuIkLVcsrTjJtHvEG/p5TWdx+WgaoudG9Q6SNNmeXgY8faTiP91SCP3VzPb
         Yr8X3EU5webo5WRp4a29bNDk5C8/4EAlioa4brRhnzKoKLT4d5jZmvfXBBV3CAcX5f4R
         idhaojKL9deOUm3VBsJRIL+kFSNmHCUIdM1HORmmmQ3F9Ph2l2xjC7R9GxKEBWzCi6PC
         FDfrV4+RL5AO2J18bNUNHtUG34RmxZIfoiJsePOHWY/Hr6IgKfuwN++g0olGvFCTihiN
         Iygg==
X-Gm-Message-State: APjAAAWJssb61w7jo2ccaVJ61sTYYT4OipSrdMEovZ04Nt/ictthJAb5
        lB4uNUkcwcRcs0nLvvJyQSodeM/85IYzd3pq4KFUOw==
X-Google-Smtp-Source: APXvYqxkT4VhjJ6KR1/tOHA5hLJ9UZagJd/hPjuYBLQaKT1Zd31YQEsLjxmsmeguf6m3YBH0px2RpYUr7v78Frn4l0M=
X-Received: by 2002:a17:902:b944:: with SMTP id h4mr34783730pls.179.1564420668750;
 Mon, 29 Jul 2019 10:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190727030110.17208-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190727030110.17208-1-yamada.masahiro@socionext.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 29 Jul 2019 10:17:36 -0700
Message-ID: <CAKwvOdmUUuFvdqD3X4SO7xPOpUevvc0iDpyUGC98KQH_AvvD=A@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: lower the entry count threshold
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Tom Roeder <tmroeder@google.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 26, 2019 at 8:01 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Running gen_compile_commands.py after building with allnoconfig
> gave this:
>
> $ ./scripts/gen_compile_commands.py
> WARNING: Found 449 entries. Have you compiled the kernel?
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This potentially may need to go lower for other arch's allnoconfig.
I'm guessing you tested x86_64?
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/gen_compile_commands.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index 7915823b92a5..c458696ef3a7 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -21,9 +21,9 @@ _LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
>  _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>
>  # A kernel build generally has over 2000 entries in its compile_commands.json
> -# database. If this code finds 500 or fewer, then warn the user that they might
> +# database. If this code finds 300 or fewer, then warn the user that they might
>  # not have all the .cmd files, and they might need to compile the kernel.
> -_LOW_COUNT_THRESHOLD = 500
> +_LOW_COUNT_THRESHOLD = 300
>
>
>  def parse_arguments():
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
