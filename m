Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFE824E41E
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 02:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgHVAXd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 20:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgHVAXc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 20:23:32 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033EEC061574
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:23:31 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id s14so1619213plp.4
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lVdLiKM9f5DmQ4nw1uLUhU7UpsX2vw3oOdD0OyADK/0=;
        b=sIu0gzevYkqboleHnK2Q9CqZCj26fro5OeNZcUi6p+gA153dbXOvc3Mb/I6vM81W0L
         Oj6it/OcgT0MgfWplkZy4bAJRiswf5AFCijV+65+zoTlCZG/6mrZarA5m0e8Ij2/wvBL
         Cv2Gcr3dkUj91v6JxBq2YBXBxlTqWEjkuBID1CoTbl93ekviA4LSunno7hYvEFdSpdtE
         7+mxOtziV/B+2sMx7ziM70sUALjecs8FikInT+Ueif70uqLcHXnAo43DFGUY0+5twpW+
         wyR3t0vgpHiptl7NlLzMhSimb+HoyuQvmSmOSYV+fOl/fqw03KMGoiX5+HYC/vd7oLTN
         W88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lVdLiKM9f5DmQ4nw1uLUhU7UpsX2vw3oOdD0OyADK/0=;
        b=CmOnNnbkJPXcVMAp+9eDs+cK9pqPsuLgxI1M2TCO0ertxkRqHEtYYRo7dcB5+vsaH7
         sYXS4Gd6kZ7nJpJflM+JBsWO2/K2M955K+hsLtwlLb6uWRI3c7AAtMxqsSvxT/ei3AiU
         Zuymt4OjLILW1Az10ymYhzervyFcY06l024fsI+UULjYyTyUt3rUVZbXtx4pBQbeWMYu
         AmOHb04Q2cNVnTssJzVhqBYhwmrqw8aKNLi/wvpZpqNW3rG9y0w+/+MCBgn3QDLcgyhk
         YoEEH48AX2QI7+EKrlHYvat00AmcB3RZI7fkQ9Yndg+bfBkM4JsXH/iG4Em/TpnouEa9
         oI+g==
X-Gm-Message-State: AOAM532AgD7SJWY43Po4QSkVi2UVJ+LHXQ96XdFu+m8LVARGo4UKD8B0
        pvkCLiTG3qFc8D34rNIAFK8ndVw+UKHW7WASHnfRgyIm5FQ=
X-Google-Smtp-Source: ABdhPJyRUF02CDtQ6ouokAMHwyOD7b+hebBNoebXWi+VQhlKXfB/dJ0BXQNBwDHCHKrkSDKp7xnlBcZ10FdmQPGesRk=
X-Received: by 2002:a17:902:b485:: with SMTP id y5mr4181251plr.119.1598055810741;
 Fri, 21 Aug 2020 17:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org> <20200821190159.1033740-3-masahiroy@kernel.org>
In-Reply-To: <20200821190159.1033740-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Aug 2020 17:23:19 -0700
Message-ID: <CAKwvOdkz3asVBpi63yj94OMLnkU5q3rqA80trVXwyoDDcPs9QA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] gen_compile_commands: use choices for --log_levels option
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
> Use 'choices' instead of the own code to check if the given parameter
> is valid.
>
> I also simplified the help message because, with 'choices', --help
> shows the list of valid parameters:
>
>   --log_level {DEBUG,INFO,WARNING,ERROR,CRITICAL}
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - New patch
>
>  scripts/gen_compile_commands.py | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index 1bcf33a93cb9..535248cf2d7e 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -45,24 +45,18 @@ def parse_arguments():
>                     'compile_commands.json in the search directory)')
>      parser.add_argument('-o', '--output', type=str, help=output_help)
>
> -    log_level_help = ('The level of log messages to produce (one of ' +
> -                      ', '.join(_VALID_LOG_LEVELS) + '; defaults to ' +
> +    log_level_help = ('the level of log messages to produce (defaults to ' +
>                        _DEFAULT_LOG_LEVEL + ')')
> -    parser.add_argument(
> -        '--log_level', type=str, default=_DEFAULT_LOG_LEVEL,
> -        help=log_level_help)
> +    parser.add_argument('--log_level', choices=_VALID_LOG_LEVELS,
> +                        default=_DEFAULT_LOG_LEVEL, help=log_level_help)
>
>      args = parser.parse_args()
>
> -    log_level = args.log_level
> -    if log_level not in _VALID_LOG_LEVELS:
> -        raise ValueError('%s is not a valid log level' % log_level)
> -
>      directory = args.directory or os.getcwd()
>      output = args.output or os.path.join(directory, _DEFAULT_OUTPUT)
>      directory = os.path.abspath(directory)
>
> -    return log_level, directory, output
> +    return args.log_level, directory, output
>
>
>  def process_line(root_directory, file_directory, command_prefix, relative_path):
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
