Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E628B3BC18D
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 18:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhGEQVw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 12:21:52 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:29054 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhGEQVv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 12:21:51 -0400
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 165GJ1xv003679;
        Tue, 6 Jul 2021 01:19:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 165GJ1xv003679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625501942;
        bh=TviIxBe6uXwBdYLpXXiJTmijOR9PL90jTmqGpS0b2vc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Df392UW3XTvRoDpHgEOv7DdpzioNzTuGQd9BXavZ4z0dnetpP/wqlhXZNjsisn45H
         4V3SAc4BG1clpbuNXWAZUbpz3kQbUO0HoZFIDE8j4FX2IrbifPvp/viYtdmUdQCeLJ
         hXUzBesBj7qyAfUWehm/REDIoW9bV/5hQ83YU14qxVH1Y6wg9R7QTMIuNWT2zXXNG/
         0vEd/wshZFnF9K/eRnxIN9qlJ1BzLHjcaEcSEpToc3a3khnhZ7Ojyh3LM/efPlDf7g
         ATXQnVO1gEki2iS9QMllgKn5r5URXAMvwOKSZcbNQm9rrU4O68Yg++GtiuRyA3+5vX
         NyLahpMRZI/EA==
X-Nifty-SrcIP: [209.85.215.172]
Received: by mail-pg1-f172.google.com with SMTP id y17so18697739pgf.12;
        Mon, 05 Jul 2021 09:19:02 -0700 (PDT)
X-Gm-Message-State: AOAM532/z/OCWeMURrScFPsnYkR/NRSZWHEn2/tN7JKIlDTJpXtian1d
        U6tMcKU2udkv3llxMEt2Btc0NyjeT/zKP1qAcQs=
X-Google-Smtp-Source: ABdhPJwVXWErCsDqAwOIQildPUSbXSsdqyg3TPoivB4JNmcC7yFcwzOrOfMOrmeQ1uEoEBBzopmsJN+uDL8i9sxX10M=
X-Received: by 2002:a63:d80a:: with SMTP id b10mr16483848pgh.47.1625501941399;
 Mon, 05 Jul 2021 09:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210702235120.7023-1-maciej.falkowski9@gmail.com>
In-Reply-To: <20210702235120.7023-1-maciej.falkowski9@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 6 Jul 2021 01:18:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=tyS22vk1mO7uCuzZ=YuzgByzC4Aix9JwugdV3xpr-Q@mail.gmail.com>
Message-ID: <CAK7LNAS=tyS22vk1mO7uCuzZ=YuzgByzC4Aix9JwugdV3xpr-Q@mail.gmail.com>
Subject: Re: [PATCH] clang-tools: Print information when clang-tidy tool is missing
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Huckleberry <nhuck@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 3, 2021 at 8:51 AM Maciej Falkowski
<maciej.falkowski9@gmail.com> wrote:
>
> When clang-tidy tool is missing in the system, the FileNotFoundError
> exception is raised in the program reporting a stack trace to the user:
>
> $ ./scripts/clang-tools/run-clang-tools.py clang-tidy ./compile_commands.json
> multiprocessing.pool.RemoteTraceback:
> """
> Traceback (most recent call last):
>   File "/usr/lib64/python3.8/multiprocessing/pool.py", line 125, in worker
>     result = (True, func(*args, **kwds))
>   File "/usr/lib64/python3.8/multiprocessing/pool.py", line 48, in mapstar
>     return list(map(*args))
>   File "./scripts/clang-tools/run-clang-tools.py", line 54, in run_analysis
>     p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
>   File "/usr/lib64/python3.8/subprocess.py", line 489, in run
>     with Popen(*popenargs, **kwargs) as process:
>   File "/usr/lib64/python3.8/subprocess.py", line 854, in __init__
>     self._execute_child(args, executable, preexec_fn, close_fds,
>   File "/usr/lib64/python3.8/subprocess.py", line 1702, in _execute_child
>     raise child_exception_type(errno_num, err_msg, err_filename)
> FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
> """
>
> The patch adds more user-friendly information about missing tool by
> checking the presence of clang-tidy using `command -v` at the beginning
> of the script:
>
> $ ./scripts/clang-tools/run-clang-tools.py clang-tidy ./compile_commands.json
> Command 'clang-tidy' is missing in the system
>
> Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1342
> ---
>  scripts/clang-tools/run-clang-tools.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index fa7655c7cec0..d34eaf5a0ee5 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -60,6 +60,11 @@ def run_analysis(entry):
>
>
>  def main():
> +    exitcode = subprocess.getstatusoutput('command -v clang-tidy')[0]
> +    if exitcode == 1:
> +        print("Command 'clang-tidy' is missing in the system", file=sys.stderr)
> +        sys.exit(127)



I like the first answer in this link:
https://stackoverflow.com/questions/82831/how-do-i-check-whether-a-file-exists-without-exceptions

"If the reason you're checking is so you can do something like
if file_exists: open_it(), it's safer to use a try around the attempt
to open it. Checking and then opening risks the file being deleted
or moved or something between when you check and when you try to open it."



Generally, I believe that Python's taste is:

   try:
        f = open("my-file")
   except:
        [ error handling ]


rather than:

    if not os.path.exists("my-file"):
           [ error handling ]
    f = open("my-file")



With the same logic applied,
if you like to display your custom error message here,
more Python-ish code might be:


    try:
         [ run clang-tidy ]
    except FileNotFoundError:
         print("Command 'clang-tidy' is missing in the system", file=sys.stderr)
         sys.exit(127)
    except:
         [ handle other errors ]



I often see, "I observed Python's backtrace, so let's suppress it"
for clang-tools scripts.

For example,
https://lore.kernel.org/lkml/20210520231821.12272-2-maciej.falkowski9@gmail.com/


If you believe "our custom error messages are better than
the default ones from Python", do you want to insert
ones to every code that can fail?

I do not think so.








> +
>      args = parse_arguments()
>
>      lock = multiprocessing.Lock()
> --
> 2.26.3
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210702235120.7023-1-maciej.falkowski9%40gmail.com.



--
Best Regards
Masahiro Yamada
