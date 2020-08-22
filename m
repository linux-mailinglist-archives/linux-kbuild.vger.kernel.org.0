Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1F924E424
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 02:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgHVA3g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 20:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgHVA3g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 20:29:36 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053BFC061573
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:29:35 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id m34so1744044pgl.11
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JLtyurL4mpiA5R+UunejNWPDeFw/A4442WcoR6JSjoE=;
        b=o7GFhujl8Gks4uE8CkUeHt4qBC9m1e89NR8gAhYSKdsmST4HFPnEj9eqGUznOXumqO
         JoWXabx64qut6jgQoVPDpHo2Z1VtzSwQmm9lFJVXZXKqrLjOmmH1bnhneGublur+0/Yk
         VmHo1mgBMar7IAbU3vVK6wl7Yn8usqUkrE0iCZdwuaWDshMm0aECWk0qjoSd6BKdEXhi
         zwuAutRkgtdfvjUn/a6bLae5e8oz5CYxzPOq25P2nk0RDCeWoRxkDZKBoEWD4hEi4SNX
         5ZjzO1c0SfHMLHWhjsIhcb782kk3ndb3OddkHSgI8T3++LDOdF4DHxmIVSrXK38kpuIL
         QSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JLtyurL4mpiA5R+UunejNWPDeFw/A4442WcoR6JSjoE=;
        b=rie9fPKo0e/YCIxqUqarhtWatjrYAuGKQlAHg/VZi5Wy7+yJorrBXPpR84IuUAgVoY
         +I499c1L2ymTX4mXMO9PQP14VgBmFqKn7DCERyQJiLPYdyCoWAFVoTdsFoXTd+Uf0euB
         /SOPykzKJ1ws2pvAi/gj4JjkZDykl4ZBhTudOaejlzQ3uWd0NHL7mp5jf6lm8DMkfOCs
         80zY1YMVtOK4qz/TmZZXWFLMKxFqkLBRoJCT6BQDneMuD/zuvq3GvcsIZKl2PgFwfWMp
         6Lkf90Q6yP3E6eJnBJarGodrulj6gFaLEXGHh+zn5IY0PQd9vwZcMT10kUdvxEOjLiL5
         lyPg==
X-Gm-Message-State: AOAM533mDdxpZGw1vSXFYl5PA4/mueO40vntnQej3KRbteDfwjKwsg7+
        zwy7nab66HsRB7IbzZTBa3u3A9YocXXzxPf+O6/d+A==
X-Google-Smtp-Source: ABdhPJzlkvjOSv2u05ib2YmE+PPr3Y3I2o0Q7Zr0QazouJzYAp+Hy7nnSzmVxKVefuU+Zxg3fDeGcEjO75MyzJSyJoY=
X-Received: by 2002:a63:7d8:: with SMTP id 207mr4123156pgh.263.1598056175162;
 Fri, 21 Aug 2020 17:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org> <20200821190159.1033740-5-masahiroy@kernel.org>
In-Reply-To: <20200821190159.1033740-5-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Aug 2020 17:29:23 -0700
Message-ID: <CAKwvOdnCZ7ao55Zdh3qkJQzudOwhkPFPOY802Emx3o7GMDdCwA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] gen_compile_commands: reword the help message of
 -d option
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 21, 2020 at 12:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I think the help message of the -d option is somewhat misleading.
>
>   Path to the kernel source directory to search (defaults to the working directory)
>
> The part "kernel source directory" is the source of the confusion.
> Some people misunderstand as if this script did not support separate
> output directories.
>
> Actually, this script also works for out-of-tree builds. You can
> use the -d option to point to the object output directory, not to
> the source directory. It should match to the O= option used in the
> previous kernel build, and then appears in the "directory" field of
> compile_commands.json.
>
> Reword the help message.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - New patch
>
>  scripts/gen_compile_commands.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index 1b9899892d99..5f6318da01a2 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -31,13 +31,13 @@ def parse_arguments():
>
>      Returns:
>          log_level: A logging level to filter log output.
> -        directory: The directory to search for .cmd files.
> +        directory: The work directory where the objects were built

Punctuation (add a period `.`).

>          output: Where to write the compile-commands JSON file.
>      """
>      usage = 'Creates a compile_commands.json database from kernel .cmd files'
>      parser = argparse.ArgumentParser(description=usage)
>
> -    directory_help = ('Path to the kernel source directory to search '
> +    directory_help = ('specify the output directory used for the kernel build '

Capitalization (specify -> Specify)

With that:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>                        '(defaults to the working directory)')
>      parser.add_argument('-d', '--directory', type=str, help=directory_help)
>
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
