Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96AC3BAAB6
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 02:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhGDAZq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Jul 2021 20:25:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:55722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhGDAZp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Jul 2021 20:25:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BA19613C7;
        Sun,  4 Jul 2021 00:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625358191;
        bh=2XWgEpkVWefyZxU4tDvW31hrSZ8gyzbZyzOdfe+1eLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EcFEc1qiSsbRtnA883kUS1QpMlyp5yF6CSwxKFK6zzUjARHKxRExwNWCXfkwD/LEX
         kNfGxRDcXGM6TGWBLmsD1wHiHuvNZxBTbBA/bHRJIHBbBpc2/Oy5ESPLMYjjVaq7iB
         euV5DmwL6khPC3yCITM8om8sdSNZCEzeQG1mODMubXRmSzlWzNlLD3mtrvjfu99uhW
         s2ePJlALQf6qUcaZzBiClIGaVQoU1nNrhp2883hALoGnBr7nfsEdGkqTxzhdx62tl9
         W67pBhdvngGfuNaksZ7p/ZHwEhMIKxOxM2Dbr1+7bw02czDS7krLgMk7MMS1iS9Lki
         l5PGHYmyw4cMA==
Date:   Sat, 3 Jul 2021 17:23:08 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     natechancellor@gmail.com, ndesaulniers@google.com,
        masahiroy@kernel.org, michal.lkml@markovi.net, nhuck@google.com,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clang-tools: Print information when clang-tidy tool is
 missing
Message-ID: <YOD/bPIizKRSkB8w@Ryzen-9-3900X.localdomain>
References: <20210702235120.7023-1-maciej.falkowski9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702235120.7023-1-maciej.falkowski9@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 03, 2021 at 01:51:20AM +0200, Maciej Falkowski wrote:
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

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

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
> +
>      args = parse_arguments()
>  
>      lock = multiprocessing.Lock()
> -- 
> 2.26.3
