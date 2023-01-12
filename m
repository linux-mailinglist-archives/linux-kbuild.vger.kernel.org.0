Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3262F667EC3
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 20:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbjALTKb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Jan 2023 14:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240087AbjALTKA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jan 2023 14:10:00 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD5618C
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 10:55:52 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id d10so13384018pgm.13
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 10:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+NRbTNiLmeYUADil1PoK0LGG/uPHqXhDMm4lsmIdtM=;
        b=nDzN9TwaVepTI4JV1CwYJSALuJFKTnskXh0c3eKxM76cQADzIF8k4QJNXr5mQ/x1bo
         0DpTZUTmHFuBjscdaIQZPyGFza3TIXAllmjPsLWwXZRN1ETM839IwF4cNTCTUh4XSmzc
         5YE1s//l4fqyuzFY8c5UdSm2xw3wU++yYZc678/Eo77PvzmmUGSUQTMcwNHjqtH9gkv+
         ZDHKKaG1KEEAYK03xSXWDJ2OeBynn2slTSp/LFyL24HqUraN5+CNfTldF4qvRmCz7NyE
         49+tAQ+KUBmgYOGSbXDP4ORjeehSewbWgwhfc2Kh299pzbcMtT8V4NItvTPngjNqe3Tn
         Bc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+NRbTNiLmeYUADil1PoK0LGG/uPHqXhDMm4lsmIdtM=;
        b=yLBn/QOnfcLT4/BWxlLThkxU1U6Isws/UpE5fVdAgv8qAbk/52YPiy9fX5r6qygIPw
         Pb3q6DE6yqcRVYqBzj/dvCj4iN++8hh3cPp2CPpwCGuEt0oNJYK6AnR+XbpcaIuSFNX9
         XfKvs7TK38vorRCPES0Z45gjv27pprd+wIGat52I3PKWF3VFBEkVlyfv6TmDA03Vg14K
         Np9mpNsFOBI33nAImRY/CnD0eIh8WKoX/mVglxITlMu5knDM59nSG4qeaQiRvYOcAA6F
         +9hA/h65VS1jh89J4k5augzdKc71nE0ArnUK+vANRNuvU7UYHI8uy1dMWUkOtx7Ior49
         RjaA==
X-Gm-Message-State: AFqh2kqjR0aC4Cb5q1lWTP1UcQaMZ7MD+FWcNQJVti10yWZxxYsBG9B3
        q+iyEXTyu92Xj+9+DNcRm7xr0uO/cSitnS+qmNufgg==
X-Google-Smtp-Source: AMrXdXuRsx/dID9s7vPNCdE3ysm0ZN/YTdpjQD8e+0PMDJN5HzzxmR5n62jAhFsDyc16t+/iWo5qN1TaqH8e66p8ZWs=
X-Received: by 2002:a63:c50:0:b0:494:7a78:4bb0 with SMTP id
 16-20020a630c50000000b004947a784bb0mr4810678pgm.427.1673549751960; Thu, 12
 Jan 2023 10:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20230112023006.1873859-1-masahiroy@kernel.org>
In-Reply-To: <20230112023006.1873859-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 12 Jan 2023 10:55:45 -0800
Message-ID: <CAKwvOd=k=veNG=Q-bZxX4iX4q14e2ozO_sHZhdCz1+BwBxq=cQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: handle BrokenPipeError for python scripts
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 11, 2023 at 6:30 PM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> In the follow-up of commit fb3041d61f68 ("kbuild: fix SIGPIPE error
> message for AR=3Dgcc-ar and AR=3Dllvm-ar"), Kees Cook pointed out that
> tools should _not_ catch their own SIGPIPEs [1] [2].
>
> Based on his feedback, LLVM was fixed [3].
>
> However, Python's default behavior is to show noisy bracktrace when
> SIGPIPE is sent. So, scripts written in Python are basically in the
> same situation as the buggy llvm tools.
>
> Example:
>
>   $ make -s allnoconfig
>   $ make -s allmodconfig
>   $ scripts/diffconfig .config.old .config | head -n1
>   -ALIX n
>   Traceback (most recent call last):
>     File "/home/masahiro/linux/scripts/diffconfig", line 132, in <module>
>       main()
>     File "/home/masahiro/linux/scripts/diffconfig", line 130, in main
>       print_config("+", config, None, b[config])
>     File "/home/masahiro/linux/scripts/diffconfig", line 64, in print_con=
fig
>       print("+%s %s" % (config, new_value))
>   BrokenPipeError: [Errno 32] Broken pipe
>
> Python documentatin [4] notes how to make scripts die immediately and

typo: s/documentatin/documentation/

> silently:
>
>   """
>   Piping output of your program to tools like head(1) will cause a
>   SIGPIPE signal to be sent to your process when the receiver of its
>   standard output closes early. This results in an exception like
>   BrokenPipeError: [Errno 32] Broken pipe. To handle this case,
>   wrap your entry point to catch this exception as follows:
>
>     import os
>     import sys
>
>     def main():
>         try:
>             # simulate large output (your code replaces this loop)
>             for x in range(10000):
>                 print("y")
>             # flush output here to force SIGPIPE to be triggered
>             # while inside this try block.
>             sys.stdout.flush()
>         except BrokenPipeError:
>             # Python flushes standard streams on exit; redirect remaining=
 output
>             # to devnull to avoid another BrokenPipeError at shutdown
>             devnull =3D os.open(os.devnull, os.O_WRONLY)
>             os.dup2(devnull, sys.stdout.fileno())
>             sys.exit(1)  # Python exits with error code 1 on EPIPE
>
>     if __name__ =3D=3D '__main__':
>         main()
>
>   Do not set SIGPIPE=E2=80=99s disposition to SIG_DFL in order to avoid
>   BrokenPipeError. Doing that would cause your program to exit
>   unexpectedly whenever any socket connection is interrupted while
>   your program is still writing to it.
>   """
>
> Currently, tools/perf/scripts/python/intel-pt-events.py seems the
> only script that fixes the issue that way.
>
> tools/perf/scripts/python/compaction-times.py uses another approach
> signal.signal(signal.SIGPIPE, signal.SIG_DFL) but the Python
> documentation clearly says "Don't do it".
>
> I cannot fix all Python scripts since there are so many.
> I fixed some in the scripts/ directory.

That's ok; "Rome wasn't built in a day." This is a good start!
Thank you for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> [1]: https://lore.kernel.org/all/202211161056.1B9611A@keescook/
> [2]: https://github.com/llvm/llvm-project/issues/59037
> [3]: https://github.com/llvm/llvm-project/commit/4787efa38066adb51e2c0494=
99d25b3610c0877b
> [4]: https://docs.python.org/3/library/signal.html#note-on-sigpipe
>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/checkkconfigsymbols.py         | 13 ++++++++++++-
>  scripts/clang-tools/run-clang-tools.py | 21 ++++++++++++++-------
>  scripts/diffconfig                     | 16 ++++++++++++++--
>  3 files changed, 40 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols=
.py
> index 217d21abc86e..36c920e71313 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -115,7 +115,7 @@ def parse_options():
>      return args
>
>
> -def main():
> +def print_undefined_symbols():
>      """Main function of this module."""
>      args =3D parse_options()
>
> @@ -467,5 +467,16 @@ def parse_kconfig_file(kfile):
>      return defined, references
>
>
> +def main():
> +    try:
> +        print_undefined_symbols()
> +    except BrokenPipeError:
> +        # Python flushes standard streams on exit; redirect remaining ou=
tput
> +        # to devnull to avoid another BrokenPipeError at shutdown
> +        devnull =3D os.open(os.devnull, os.O_WRONLY)
> +        os.dup2(devnull, sys.stdout.fileno())
> +        sys.exit(1)  # Python exits with error code 1 on EPIPE
> +
> +
>  if __name__ =3D=3D "__main__":
>      main()
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools=
/run-clang-tools.py
> index 56f2ec8f0f40..3266708a8658 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -61,14 +61,21 @@ def run_analysis(entry):
>
>
>  def main():
> -    args =3D parse_arguments()
> +    try:
> +        args =3D parse_arguments()
>
> -    lock =3D multiprocessing.Lock()
> -    pool =3D multiprocessing.Pool(initializer=3Dinit, initargs=3D(lock, =
args))
> -    # Read JSON data into the datastore variable
> -    with open(args.path, "r") as f:
> -        datastore =3D json.load(f)
> -        pool.map(run_analysis, datastore)
> +        lock =3D multiprocessing.Lock()
> +        pool =3D multiprocessing.Pool(initializer=3Dinit, initargs=3D(lo=
ck, args))
> +        # Read JSON data into the datastore variable
> +        with open(args.path, "r") as f:
> +            datastore =3D json.load(f)
> +            pool.map(run_analysis, datastore)
> +    except BrokenPipeError:
> +        # Python flushes standard streams on exit; redirect remaining ou=
tput
> +        # to devnull to avoid another BrokenPipeError at shutdown
> +        devnull =3D os.open(os.devnull, os.O_WRONLY)
> +        os.dup2(devnull, sys.stdout.fileno())
> +        sys.exit(1)  # Python exits with error code 1 on EPIPE
>
>
>  if __name__ =3D=3D "__main__":
> diff --git a/scripts/diffconfig b/scripts/diffconfig
> index d5da5fa05d1d..43f0f3d273ae 100755
> --- a/scripts/diffconfig
> +++ b/scripts/diffconfig
> @@ -65,7 +65,7 @@ def print_config(op, config, value, new_value):
>          else:
>              print(" %s %s -> %s" % (config, value, new_value))
>
> -def main():
> +def show_diff():
>      global merge_style
>
>      # parse command line args
> @@ -129,4 +129,16 @@ def main():
>      for config in new:
>          print_config("+", config, None, b[config])
>
> -main()
> +def main():
> +    try:
> +        show_diff()
> +    except BrokenPipeError:
> +        # Python flushes standard streams on exit; redirect remaining ou=
tput
> +        # to devnull to avoid another BrokenPipeError at shutdown
> +        devnull =3D os.open(os.devnull, os.O_WRONLY)
> +        os.dup2(devnull, sys.stdout.fileno())
> +        sys.exit(1)  # Python exits with error code 1 on EPIPE
> +
> +
> +if __name__ =3D=3D '__main__':
> +    main()
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
