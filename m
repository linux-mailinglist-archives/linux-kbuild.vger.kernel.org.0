Return-Path: <linux-kbuild+bounces-2786-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B173D9465E4
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 00:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA25B21F34
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 22:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEA75025E;
	Fri,  2 Aug 2024 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooUWX02U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAB52C9D;
	Fri,  2 Aug 2024 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722638112; cv=none; b=cH6xPFQnmQdsTcRbgk2U/D8h7iloUlx/oLzbqJxO431U7lVINhkuAvhRk1w4fqnSQb3A8z2189SiQCfyjuBc8KNVm1eBRuCHNNcvnxa2NPPzgMozU2H123PV+/sWTG0Tj5F4b7fqm5IwuJB/zcNMrLyCSD4lSlrCbOToc2Wq2I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722638112; c=relaxed/simple;
	bh=Ovb1Y8GPHaYhJfkGh6OGnZV2Zy802Bu9BlM9I8m8ZME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ME6uz/YNcSXF8ch16qxmd3eeoDfBUpDo0E0E0VJITn4z8TKc+3nym5+XHMnRnqRW2KDXTq1zbKi2UN0y1q7wflDvJTcD9MbHiWrQ+7s2O5qeSlVYaejvzuL1zyjkDhUEZPIJg/O+SXheLG3qD7C8mwLFGTmEVvMeZpIaNHfaqAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooUWX02U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BB1C32782;
	Fri,  2 Aug 2024 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722638112;
	bh=Ovb1Y8GPHaYhJfkGh6OGnZV2Zy802Bu9BlM9I8m8ZME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ooUWX02UZyqQwwV9Rpvwk70xE9QaAkHd5dYFMKRPcwE2UAslp1qIXbLPsLM/gYvTd
	 BYx3NdNmzaDMOKWUxUKy4WBWSuE6txB3rY5RDhmL66UqjqKFR6EEeSbxW6PnCPi1Ri
	 q4m3/0z9+rTx/SZrg3ECYP9c24puRIMup6b22CnNXvNzWM3a4J+x70aTQqhSAAzwxj
	 NF4z55dvkH2KXpl/ilXORo96kTM4q7TDQBrWCMo3pNTCPtkzFO8redpBLIZbbFTCcD
	 RmlqFJtGRUSNDZTwzNzB5y0hG2j+ZLAiqW0pL4xpC3J89P+DpV4gT8oGxsMiFfy1kK
	 ZEujat4/e+pXA==
Date: Fri, 2 Aug 2024 15:35:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] scripts: run-clang-tools: add file filtering option
Message-ID: <20240802223509.GA781199@thelio-3990X>
References: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com>

Hi Théo,

First of all, apologies that it has taken me so long to review this!

On Thu, Jul 04, 2024 at 11:28:21AM +0200, Théo Lebrun wrote:
> Add file filtering feature. We take zero or more filters at the end as
> positional arguments. If none are given, the default behavior is kept
> and we run the tool on all files in the datastore. Else, files must
> match one or more filter to be analysed.
> 
> The below command runs clang-tidy on drivers/clk/clk.c and all C files
> inside drivers/reset/.
> 
>     ./scripts/clang-tools/run-clang-tools.py clang-tidy \
>         compile_commands.json \
>         'drivers/clk/clk.c' 'drivers/reset/*'
> 
> The Python fnmatch builtin module is used. Matching is case-insensitive.
> See its documentation for allowed syntax:
> https://docs.python.org/3/library/fnmatch.html
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
> Currently, all files in the datastore are analysed. This is not
> practical for grabbing errors in a subsystem, or relative to a patch
> series. Add a file filtering feature with wildcard support.

Sure, I think this is totally reasonable. In fact, I think some of this
could be added to the commit message as further existence for this
feature.

The change itself looks good to me for the most part, I have some
questions below just for my own understanding.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

One further question/comment now: Have you considered a way to
integrate this into Kbuild with the clang-tidy and clang-analyzer
commands? I don't think it is strictly necessary for the acceptance of
this patch but it might be nice to have some variable that users could
provide to do this with their regular make command + the clang-tidy
target? Not sure if Masahiro has further thoughts on that.

> Have a nice day,
> Théo
> ---
>  scripts/clang-tools/run-clang-tools.py | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index f31ffd09e1ea..b0b3a9c8cdec 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -10,6 +10,7 @@ compile_commands.json.
>  """
>  
>  import argparse
> +import fnmatch
>  import json
>  import multiprocessing
>  import subprocess
> @@ -32,6 +33,8 @@ def parse_arguments():
>                          help=type_help)
>      path_help = "Path to the compilation database to parse"
>      parser.add_argument("path", type=str, help=path_help)
> +    file_filter_help = "Optional Unix shell-style wildcard file filters"
> +    parser.add_argument("file_filter", type=str, nargs="*", help=file_filter_help)
>  
>      checks_help = "Checks to pass to the analysis"
>      parser.add_argument("-checks", type=str, default=None, help=checks_help)
> @@ -48,6 +51,22 @@ def init(l, a):
>      args = a
>  
>  
> +def filter_entries(datastore, filters):
> +    for entry in datastore:
> +        if filters == []:
> +            yield entry
> +            continue
> +
> +        assert entry['file'].startswith(entry['directory'])

What is the purpose of this assertion? Will it cause AssertionError
under normal circumstances?

> +        # filepath is relative to the directory, to avoid matching on the absolute path
> +        filepath = entry['file'][len(entry['directory']):].lstrip('/')
> +
> +        for pattern in filters:
> +            if fnmatch.fnmatch(filepath, pattern):
> +                yield entry
> +                break
> +
> +
>  def run_analysis(entry):
>      # Disable all checks, then re-enable the ones we want
>      global args
> @@ -87,6 +106,7 @@ def main():
>          # Read JSON data into the datastore variable
>          with open(args.path, "r") as f:
>              datastore = json.load(f)
> +            datastore = filter_entries(datastore, args.file_filter)
>              pool.map(run_analysis, datastore)
>      except BrokenPipeError:
>          # Python flushes standard streams on exit; redirect remaining output
> 
> ---
> base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
> change-id: 20240704-clang-tidy-filter-f470377cb2b4
> 
> Best regards,
> -- 
> Théo Lebrun <theo.lebrun@bootlin.com>
> 

