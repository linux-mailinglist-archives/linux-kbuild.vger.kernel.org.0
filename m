Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2EC824E421
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 02:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgHVA1T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 20:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgHVA1S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 20:27:18 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EBBFC061573
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:27:14 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id x6so1739921pgx.12
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xbPuPNjfIY+zfHmVne0cy0lMy+OdPzwGw1ja89KiJW8=;
        b=IYiMJ+AFwbI8+UBo2xhM4v6W5PCK6uuMqOIU7h2DyadM7X4+IRDlEEcGZyxIMhwBgE
         peHTksKr7pnGbglxdf+guxBH1Ca5SyrHhN3xNINyFiQ8cuwXmZ2kjaEVdGhRLv3AVTkN
         GUPZ4vhYdoKKrljcIIijra88CY8Ypv3DQSSlAlPlVwG8sOzHJrf3QAFJ4CJeunJY3evk
         0RLlXAOf0r99ZoBzS7CV+KPXxkkWk3s4qxu1uOc/GLdo9JoZRQumvygF6sZP6MfwxrY4
         ENH6zrzKAdW0HUy5d6/6CpnT3M07gKbZhFBfzX01cQUK3hvCyDkV0WWkDyYHbm16Tgn4
         xKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xbPuPNjfIY+zfHmVne0cy0lMy+OdPzwGw1ja89KiJW8=;
        b=WtA1a7FzPzcUHLxffwHEzfCBTMfMgsH0xu8aQkdq/y/1eYrGa2RdvZniB7Y6Tdz90j
         o8mDCG4xXzVDv5aCDLbgTo0Acn+pGn6AgtH4nb15wY6Iyrnp2ZGYFTOrxulh8AFS3GtY
         k2Q7S16uL7Lo8zxbGcD4gW3buebKr7kXT3X+H7+zdNW+KoBTiu1QQmuq50E6CrQIkd+o
         VtNsCI4/avHNywNtTRfamfLwyOt10sdsgbSzOXy90IBPcTqD4hMiB2X8rF0pajep7K7C
         n5aV4umUsittfVVkj1DkTqSi2ZfOd4Lng1yY64v/TVvCHkPZMKA2aiPrD48/EGD82/S8
         lJCQ==
X-Gm-Message-State: AOAM530fBUDQFxaQSD/9rUuvdjPmIOmMooY0TzfmJz9Xrl6GQxsR9VFO
        nvZjzfW0312zRDZoUWqzgJgDNctcmoPAY7P84Bs2ug==
X-Google-Smtp-Source: ABdhPJykoW8Yo+buP+dWEHtamKES5ah20sUKlfBFJMv+IXwAWpGJA8Th9mtHZL9va5ZYIzj9PA6kkWrT8I+J/o04smQ=
X-Received: by 2002:a63:a119:: with SMTP id b25mr3941267pgf.10.1598056033866;
 Fri, 21 Aug 2020 17:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org> <20200821190159.1033740-4-masahiroy@kernel.org>
In-Reply-To: <20200821190159.1033740-4-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Aug 2020 17:27:02 -0700
Message-ID: <CAKwvOdn0VyObYvoBqoXPGT4o8LPSPsvc=pNpvVtu6jRxxhOKiA@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] gen_compile_commands: do not support .cmd files
 under tools/ directory
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
> The tools/ directory uses a different build system, and the format of
> .cmd files is different because the tools builds run in a different
> work directory.
>
> Supporting two formats compilicates the script.
>
> The only loss by this change is objtool.
>
> Also, rename the confusing variable 'relative_path' because it is
> not necessarily a relative path. When the output directory is not
> the direct child of the source tree (e.g. O=foo/bar), it is an
> absolute path. Rename it to 'file_path'.
>
> os.path.join(root_directory, file_path) works whether the file_path
> is relative or not. If file_path is already absolute, it returns it
> as-is.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - New patch
>
>  scripts/gen_compile_commands.py | 31 +++++++++++--------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index 535248cf2d7e..1b9899892d99 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -59,23 +59,21 @@ def parse_arguments():
>      return args.log_level, directory, output
>
>
> -def process_line(root_directory, file_directory, command_prefix, relative_path):
> +def process_line(root_directory, command_prefix, file_path):
>      """Extracts information from a .cmd line and creates an entry from it.
>
>      Args:
>          root_directory: The directory that was searched for .cmd files. Usually
>              used directly in the "directory" entry in compile_commands.json.
> -        file_directory: The path to the directory the .cmd file was found in.
>          command_prefix: The extracted command line, up to the last element.
> -        relative_path: The .c file from the end of the extracted command.
> -            Usually relative to root_directory, but sometimes relative to
> -            file_directory and sometimes neither.
> +        file_path: The .c file from the end of the extracted command.
> +            Usually relative to root_directory, but sometimes absolute.
>
>      Returns:
>          An entry to append to compile_commands.
>
>      Raises:
> -        ValueError: Could not find the extracted file based on relative_path and
> +        ValueError: Could not find the extracted file based on file_path and
>              root_directory or file_directory.
>      """
>      # The .cmd files are intended to be included directly by Make, so they
> @@ -84,20 +82,13 @@ def process_line(root_directory, file_directory, command_prefix, relative_path):
>      # by Make, so this code replaces the escaped version with '#'.
>      prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
>
> -    cur_dir = root_directory
> -    expected_path = os.path.join(cur_dir, relative_path)
> -    if not os.path.exists(expected_path):
> -        # Try using file_directory instead. Some of the tools have a different
> -        # style of .cmd file than the kernel.
> -        cur_dir = file_directory
> -        expected_path = os.path.join(cur_dir, relative_path)
> -        if not os.path.exists(expected_path):
> -            raise ValueError('File %s not in %s or %s' %
> -                             (relative_path, root_directory, file_directory))
> +    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
> +    if not os.path.exists(abs_path):
> +        raise ValueError('File %s not found' % abs_path)
>      return {
> -        'directory': cur_dir,
> -        'file': relative_path,
> -        'command': prefix + relative_path,
> +        'directory': root_directory,
> +        'file': abs_path,
> +        'command': prefix + file_path,
>      }
>
>
> @@ -122,7 +113,7 @@ def main():
>                  result = line_matcher.match(f.readline())
>                  if result:
>                      try:
> -                        entry = process_line(directory, dirpath,
> +                        entry = process_line(directory,
>                                               result.group(1), result.group(2))
>                          compile_commands.append(entry)
>                      except ValueError as err:
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
