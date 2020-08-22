Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF9424E428
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 02:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgHVAfn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 20:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgHVAfn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 20:35:43 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8897C061574
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:35:42 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t6so1518775pjr.0
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tqaym6YY8iaHj+Q6kB4hQ2UFRz3fNuxdZoJtYXC2HaI=;
        b=eOh1OEAkvPLK9de2if6pYhN3E1jRLf6ksoKwtX5M1NPjek4+/2u+3jOm7+XQEYN6A/
         thqtscYN2+k7bUdA0JOmF/9lsNrVKDVVJbhba/dO125e18KfOxFCpU3VNlx0nnjCvm+r
         jTv2p+8/8GYtekIZph1DcsgH2GeORYBSQqnsjJvy7LBQo03uyZtAdkaLWdTzTLDHRep3
         8wBGIdfmXJQghRZHROWGJpmEuHfSX6Vt1TJbtkMrEvPIQh7rTf2RjliOZfvgFFa5KTE7
         JGnHXxN+gdiIvJ7jm1BWKr5qggjkudb/67gSU95A02KNnokOX1aBlvqusck9R7MdKg09
         nS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tqaym6YY8iaHj+Q6kB4hQ2UFRz3fNuxdZoJtYXC2HaI=;
        b=XuD6P8RMNOfkDOI3fI5Ayz5IUEorK914wpZsEbTCiklxDVjMMVTIvleqkB8Z7lD4RA
         gFwIVazkLnA+uAoBk5X8eoWiBM4G3Gd4pnmOxiOqYUY5PyGmsV2zNZg7gKvMmxi0/yB7
         KfUbTashYEjMLt9NFXl3d656jaU1AeWfm5JnkbGQK3QUGLqSTi+zPFBUR7ni7pSNrkZI
         Bn60tSkMQfTMWvdo8FymCBkR6XS8d90zllASYQpur3aqiAZy8mfWvTcgNyg/SJUcTp7J
         /aPuXVQJ0IsxhfmbFAt9Az0ptYED+hPWsCChldli6eJxkhXBIM5coliLMkoBUfamCLan
         r7CQ==
X-Gm-Message-State: AOAM531mlU7vzNZCFtaSvqvxjdyHPI/zkY02hvM2lfGwMRcmyR3rEI5M
        Z78HekRo3FE1NbIHhxmZRrXJgzQlzx4xoZdhlzEjAg==
X-Google-Smtp-Source: ABdhPJzOzd8bvoTUITSwAw3/Hi1kDJVCaLpCqNcJEpwo3dMJ5QODS5YomHcYDreTimiV8cKSQQcXECSOzDIAaFy8Uko=
X-Received: by 2002:a17:902:cb91:: with SMTP id d17mr4189501ply.223.1598056542037;
 Fri, 21 Aug 2020 17:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org> <20200821190159.1033740-6-masahiroy@kernel.org>
In-Reply-To: <20200821190159.1033740-6-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Aug 2020 17:35:30 -0700
Message-ID: <CAKwvOdmPzuQi5Z1KxP5KV6w-L+uYR709p4JheS6nCb2o56Pohw@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] gen_compile_commands: make -o option independent
 of -d option
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
> Change the -o option independent of the -d option, which is I think
> clearer behavior. Some people may like to use -d to specify a separate
> output directory, but still output the compile_commands.py in the
> source directory (unless the source tree is read-only) because it is
> the default location Clang Tools search for the compilation database.
>
> Also, move the default parameter to the default= argument of the
> .add_argument().
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - New patch
>
>  scripts/gen_compile_commands.py | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index 5f6318da01a2..3ed958b64658 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -39,11 +39,13 @@ def parse_arguments():
>
>      directory_help = ('specify the output directory used for the kernel build '
>                        '(defaults to the working directory)')
> -    parser.add_argument('-d', '--directory', type=str, help=directory_help)
> +    parser.add_argument('-d', '--directory', type=str, default='.',
> +                        help=directory_help)
>
> -    output_help = ('The location to write compile_commands.json (defaults to '
> -                   'compile_commands.json in the search directory)')
> -    parser.add_argument('-o', '--output', type=str, help=output_help)
> +    output_help = ('path to the output command database (defaults to ' +
> +                   _DEFAULT_OUTPUT + ')')
> +    parser.add_argument('-o', '--output', type=str, default=_DEFAULT_OUTPUT,
> +                        help=output_help)
>
>      log_level_help = ('the level of log messages to produce (defaults to ' +
>                        _DEFAULT_LOG_LEVEL + ')')
> @@ -52,11 +54,9 @@ def parse_arguments():
>
>      args = parser.parse_args()
>
> -    directory = args.directory or os.getcwd()
> -    output = args.output or os.path.join(directory, _DEFAULT_OUTPUT)
> -    directory = os.path.abspath(directory)
> -
> -    return args.log_level, directory, output
> +    return (args.log_level,
> +            os.path.abspath(args.directory),
> +            args.output)
>
>
>  def process_line(root_directory, command_prefix, file_path):
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
