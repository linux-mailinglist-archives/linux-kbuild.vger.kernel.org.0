Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9747824E43B
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 02:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgHVAlo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 20:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgHVAln (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 20:41:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D16C061573
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:41:41 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y6so1633940plt.3
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fpYkI6juAqMAAUVTQTHgpzHvlncEIWGwTCUc4UiA+NQ=;
        b=BPob3zYcwMB6bxh5Xy6HCPZOVzXpbXZAgORVwjpTTFMl/+hIoRgP9u9snUEd9ytwFN
         s/q8EexxPFJub6RCY0iCxBddroqjCnamTLaAwUGB0FQMR26DoQw8m08wSGK1JaZ8dlr1
         heVWZFhGKYkNuDcIsSP8YLSPQdUW0jZqvSPH1Hct1nc4y9b/hRyCxzw7jhRi1xoAOQ3M
         kbDAT57Xcz90ARycJCQYCjG/exCHnyD6Eh1HczygMhm7xr6zFsRGEVr6YWmUqZ3lwY1N
         SeJA8GohX+mwfQ3wFBnGbkeZxSt1zlJHv/5gqVkDZvrLYeOYLMrFwxIzl/AxByz4ISkl
         eAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fpYkI6juAqMAAUVTQTHgpzHvlncEIWGwTCUc4UiA+NQ=;
        b=fR1NfCglh9VFbc1e5plfENa+O2tdBKhYvv6pM19KTiN4oA+BTK2zgR8M0IRhpKTlcI
         xEcN1XXX5OvIL5PyAgXiX+hb/io/H7e2avk6biA7yQXv0wswKNSH60hpGO4kSzK1j20K
         fJCHWmBwt4wq6m6Jrf7GN/KxajCd2imKkMWh58jbXLuj9GbyPYwLZ1dIryfeAV9iReb0
         yE5+q/sYbNg1DEE/zkG00D69z7+jpC9CU/ksWvvHfADynlwShFVtSoOI7+FUv0UBSXsr
         Usyfl6LtwlcqBCEizcQ05wM759+hiVv1KZMtNFwHFxqYnurxi0KL6pe04GZD72LiWRl8
         TQgA==
X-Gm-Message-State: AOAM533ZmwSaCJ4dmwmrqStnU/dGUbWWMP2ZoTJHz/bBUNBRTuRHoSIA
        p7H31ong6CyuzeWoddNHpsBlSkfawJHA6iDZik9qPGZpPmo=
X-Google-Smtp-Source: ABdhPJxoznNG5mzZHJrBMDgeBePlf0XMcl7O3f+wmRk2kidEeZfhAnaAXZGPhl91K2hWHb7ldgHVUhfIVJs2bwaN4e4=
X-Received: by 2002:a17:902:cb91:: with SMTP id d17mr4204225ply.223.1598056899804;
 Fri, 21 Aug 2020 17:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org> <20200821190159.1033740-7-masahiroy@kernel.org>
In-Reply-To: <20200821190159.1033740-7-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Aug 2020 17:41:28 -0700
Message-ID: <CAKwvOdn9ZfvC4dzuVnxc_a52JFn_q1ewOWwZZD5b9=izeEayKQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] gen_compile_commands: move directory walk to a
 generator function
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
> Currently, this script walks under the specified directory (default to
> the current directory), then parses all .cmd files found.
>
> Split it into a separate helper function because the next commit will
> add more helpers to pick up .cmd files associated with given file(s).
>
> There is no point to build and return a huge list at once. I used a
> generator so it works in the for-loop with less memory.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - New patch
>
>  scripts/gen_compile_commands.py | 44 ++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index 3ed958b64658..6dec7e2c4098 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -33,6 +33,7 @@ def parse_arguments():
>          log_level: A logging level to filter log output.
>          directory: The work directory where the objects were built
>          output: Where to write the compile-commands JSON file.
> +        paths: The list of directories to handle to find .cmd files

Punctuation: please add a period.

>      """
>      usage = 'Creates a compile_commands.json database from kernel .cmd files'
>      parser = argparse.ArgumentParser(description=usage)
> @@ -56,7 +57,28 @@ def parse_arguments():
>
>      return (args.log_level,
>              os.path.abspath(args.directory),
> -            args.output)
> +            args.output,
> +            [args.directory])
> +
> +
> +def cmdfiles_in_dir(directory):
> +    """Generate the iterator of .cmd files found under the directory.
> +
> +    Walk under the given directory, and yield every .cmd file found.
> +
> +    Args:
> +        directory: The directory to search for .cmd files.
> +
> +    Yields:
> +        The path to a .cmd file.
> +    """
> +
> +    filename_matcher = re.compile(_FILENAME_PATTERN)
> +
> +    for dirpath, _, filenames in os.walk(directory):
> +        for filename in filenames:
> +            if filename_matcher.match(filename):
> +                yield os.path.join(dirpath, filename)
>
>
>  def process_line(root_directory, command_prefix, file_path):
> @@ -94,31 +116,29 @@ def process_line(root_directory, command_prefix, file_path):
>
>  def main():
>      """Walks through the directory and finds and parses .cmd files."""
> -    log_level, directory, output = parse_arguments()
> +    log_level, directory, output, paths = parse_arguments()
>
>      level = getattr(logging, log_level)
>      logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
>
> -    filename_matcher = re.compile(_FILENAME_PATTERN)
>      line_matcher = re.compile(_LINE_PATTERN)
>
>      compile_commands = []
> -    for dirpath, _, filenames in os.walk(directory):
> -        for filename in filenames:
> -            if not filename_matcher.match(filename):
> -                continue
> -            filepath = os.path.join(dirpath, filename)
>
> -            with open(filepath, 'rt') as f:
> +    for path in paths:
> +        cmdfiles = cmdfiles_in_dir(path)
> +
> +        for cmdfile in cmdfiles:

If `cmdfiles` is never referenced again, please make this:

for cmdfile in cmdfiles_in_dir(path):

With those 2 changes feel free to add my
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> +            with open(cmdfile, 'rt') as f:
>                  result = line_matcher.match(f.readline())
>                  if result:
>                      try:
> -                        entry = process_line(directory,
> -                                             result.group(1), result.group(2))
> +                        entry = process_line(directory, result.group(1),
> +                                             result.group(2))
>                          compile_commands.append(entry)
>                      except ValueError as err:
>                          logging.info('Could not add line from %s: %s',
> -                                     filepath, err)
> +                                     cmdfile, err)
>
>      with open(output, 'wt') as f:
>          json.dump(compile_commands, f, indent=2, sort_keys=True)
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
