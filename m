Return-Path: <linux-kbuild+bounces-2792-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0389468B7
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 10:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 839D02824C5
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 08:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198ED14D290;
	Sat,  3 Aug 2024 08:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoLr681Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19992C6AF;
	Sat,  3 Aug 2024 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722674561; cv=none; b=mmEyHzLQ/QtmgmHxmrtq3nyUqtnr7XnWe0/G8KL3HAb5LabFCtnfQK+L+6XF2YU83b5Qsuis4bQvmAU6Q192rTy6aGe0JTm1dwmdD8vsgU/C1/UXbzUDDRU1VFRoROXHteleSQBATIqcJNXD6VYXeltnrU8DBKKE8SMzPKRKpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722674561; c=relaxed/simple;
	bh=rL9o66+yTo07C2NUCjmx8LrF2T1qkqT0BezdaAVBoNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQhKEVK5hjN0l3i6ZBAg59NzAm5H1hHDxP4vlhFO59IW+FWgZ3OsEluM4ldSZRWDaSLna/KIpnpyPti9bgci+ZR64eSp2FgZQ+gVtNsRNnKQT3+4Yx1OfOZ4mAH2GaMS9nz9cbFwmjMibrQDZ248e1CIesqg41oI207J7G6rxGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoLr681Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACCFC4AF0B;
	Sat,  3 Aug 2024 08:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722674560;
	bh=rL9o66+yTo07C2NUCjmx8LrF2T1qkqT0BezdaAVBoNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WoLr681Q+aSrgmjIyAzMHpsero14HAbh8Pe2NYfC1yHBoXTIrhK/zNp22Cst1K8uS
	 qEjtaHDlEmJV05GVvHU4iJvMAG+SD6jgKE3CA3lK0Ek31tDIBvqXWYRSHMNIWKtScM
	 C0b7RMpf37B8XH0Nd/ZRj05l+vUkqZHFhVAi5m0caoHtGmatB9pZOMMe5o/6LDhjE2
	 /DYaQ/yoSPEu6GUS3zE4YzIqN8Ufh7mwwX9XwRUYTlpPjy4a/QXCO7rGZdcm23vP3p
	 qerjEX9ZZxlc73rXJITXV7b9FekKnzH5RZglqPtg0s0Xu1pmlxDn4XqhcauHWVIMfm
	 FgKtYXGJerggg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efe4c7c16so12990961e87.0;
        Sat, 03 Aug 2024 01:42:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVF2VnvweAIkLv8taYA2CmySmtG27aTIHRI8+1trtLCA0d+kjLMOQohzcEeDhZDodnFw4gxcsflG/hzEC/VGWiW73xgcqESrdcui3ywpU2q1gKY69U8C5JtYMBRUrw4e0RhauDKsdPCyiMl
X-Gm-Message-State: AOJu0YwB+uzqyDH60WL3FDFqsW0NuzUVrXLFqAESfSFeT+LKPpvJIXOZ
	0tD1tvJhltSzd3RSYh4pW/QYuGZspzDTtdEavGKXYx4KcEZ44PNb8bXe4Fnrp6qs4NYmAxqtmd8
	MvyQtacNbZYIaYbGWcPmkv/DFljs=
X-Google-Smtp-Source: AGHT+IFF4S+80PSYnjQ7scAy9A6/Kk6hzji7GaVN17IZlXndYUp47aES2p2yhhGL0SpWFbevR9PkrNdcUGZQDwELF8Y=
X-Received: by 2002:a05:6512:114f:b0:52b:c1cc:51f1 with SMTP id
 2adb3069b0e04-530bb396106mr4237148e87.23.1722674559200; Sat, 03 Aug 2024
 01:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com>
In-Reply-To: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 Aug 2024 17:42:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmV89PJV3sd93WwqLLQD0fg9mBOMetzECLriF8295zVA@mail.gmail.com>
Message-ID: <CAK7LNARmV89PJV3sd93WwqLLQD0fg9mBOMetzECLriF8295zVA@mail.gmail.com>
Subject: Re: [PATCH] scripts: run-clang-tools: add file filtering option
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 6:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:
>
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
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
> Currently, all files in the datastore are analysed. This is not
> practical for grabbing errors in a subsystem, or relative to a patch
> series. Add a file filtering feature with wildcard support.
>
> Have a nice day,
> Th=C3=A9o
> ---
>  scripts/clang-tools/run-clang-tools.py | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools=
/run-clang-tools.py
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
>                          help=3Dtype_help)
>      path_help =3D "Path to the compilation database to parse"
>      parser.add_argument("path", type=3Dstr, help=3Dpath_help)
> +    file_filter_help =3D "Optional Unix shell-style wildcard file filter=
s"
> +    parser.add_argument("file_filter", type=3Dstr, nargs=3D"*", help=3Df=
ile_filter_help)
>
>      checks_help =3D "Checks to pass to the analysis"
>      parser.add_argument("-checks", type=3Dstr, default=3DNone, help=3Dch=
ecks_help)
> @@ -48,6 +51,22 @@ def init(l, a):
>      args =3D a
>
>
> +def filter_entries(datastore, filters):
> +    for entry in datastore:
> +        if filters =3D=3D []:
> +            yield entry
> +            continue


Maybe, this can be checked on the caller side.
(Note, I did not test this at all)


if args.file_filter:
        datastore =3D filter_entries(datastore, args.file_filter)




> +
> +        assert entry['file'].startswith(entry['directory'])
> +        # filepath is relative to the directory, to avoid matching on th=
e absolute path



Does this assertion work with the separate output directory
(O=3D option)?


Just try this command:

 $ make LLVM=3D1 O=3D/tmp/foo clang-tidy

Check the generated /tmp/foo/compile_commands.json


The 'file' entry starts with your source directory.
The 'directory' entry starts with the build directory, "/tmp/foo".









> +        filepath =3D entry['file'][len(entry['directory']):].lstrip('/')
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
>              datastore =3D json.load(f)
> +            datastore =3D filter_entries(datastore, args.file_filter)
>              pool.map(run_analysis, datastore)
>      except BrokenPipeError:
>          # Python flushes standard streams on exit; redirect remaining ou=
tput
>
> ---
> base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
> change-id: 20240704-clang-tidy-filter-f470377cb2b4
>
> Best regards,
> --
> Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
>


--=20
Best Regards
Masahiro Yamada

