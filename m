Return-Path: <linux-kbuild+bounces-2793-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A473D9468CC
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 11:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3036F1F21DE8
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 09:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E586762E0;
	Sat,  3 Aug 2024 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRTHdFDP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251AD1ABEA7;
	Sat,  3 Aug 2024 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722676609; cv=none; b=B+38LeT2qkJ+fyL/x9Ew2EDntw5qHfF71ydb5OclnGTbTOcpTAgVLNU6rZ0NhYloWj6nSDPQtfqYfBOaIzSZBugajrCu5vI7fNUhT27Lof5x8QpMtENJLqoYkzpQ0tgQuU+yum4LgsICBLFc0dCdLknNT+R89Xo1sGF7DwQGVxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722676609; c=relaxed/simple;
	bh=1DNbf8bIlZ3NMKH/mSPiGD2CyZCIwg1XhjJae/C5U94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGq2OHcyq/3XlOr/tRYIjrs+SOxn4pu2k88uDuRgHa7ZJRE/0GnpF1MniN7SexhBaOC//r+pAsjfh5RJpzCboViwMJ/5ZiSWJY/YC/4N33EoTBjjF6vtytfjwXzNJyBt1rOinzQFUTTFj+xDhFu7flsqavg5l252NzdMu4P+M98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRTHdFDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8185C4AF0C;
	Sat,  3 Aug 2024 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722676608;
	bh=1DNbf8bIlZ3NMKH/mSPiGD2CyZCIwg1XhjJae/C5U94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mRTHdFDPTfdYBIfymaMb9QfjgodsL/iOykhYj3m8DgpQmmSx+rU4nq3epVaiCT0zo
	 Ii7WLpNKyj+sLlpJtscDvfvuImQPXwyrtGeHHWmXXz1H/ucpybyWPigVJAYCEyq0tT
	 feZxjt+o77eBqyJCLyPqnGajRsxQXUI9yvRR3yCnGeowlAtGO7XPqK+E4myQrqKUvu
	 0IkE33hCmDankbTKdSwSGX8PX9KU6veCIVVd5HvZ4Ylm4IQL/dcWKziZ16zSIDX+X8
	 JWRSC4NBxVMY1pNyQU3DMl7ftK8dz0hMW1ZIaPiQxsubP6wuZ/60DhsE4SEuLEZV7k
	 yoQJJ7QCRplCg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efd530a4eso13976363e87.0;
        Sat, 03 Aug 2024 02:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuCe+zK7PHR9Q43Hp8djXO7Jdgn7lHkDmI9feY4Xw5mUyrHkqlGQKYpoPA5SlI3s8or2nrhbxZkWVoivRxDj+U3NPrbfdo8GjpZI5EQ7rqvIC0a8mm+cfc8NGdYrvibIXeR5YmuOK8G3rN
X-Gm-Message-State: AOJu0Yys17wxi/kRqg3M03Fmmr+uhhzmqoYBLqddImm57zOhgOvwZJoB
	eqzeu3XGBzkcURimVyX4jyK18wbdcPzQYbVdF8Tc7k1HerC7Caqjh+5MbdDfekSqiPM2Vzf/6mu
	Fd2u5VpAmwQErcrzByXsk8ao9G4o=
X-Google-Smtp-Source: AGHT+IEx6SXwfeOZ15h0vEqG1twwquqmXEedBdAZXhbDrpkmPCRu4RwDtl+IL7isPQ0DbgNpUymnIvp2QXPBx7nE95k=
X-Received: by 2002:a05:6512:b0e:b0:530:9a14:f0a0 with SMTP id
 2adb3069b0e04-530bb36ba5dmr4664487e87.10.1722676607424; Sat, 03 Aug 2024
 02:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com> <20240802223509.GA781199@thelio-3990X>
In-Reply-To: <20240802223509.GA781199@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 Aug 2024 18:16:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR6VFT+z377NURKZs5P4+Z9zE2oeN44zQE7PRfqV0JoZQ@mail.gmail.com>
Message-ID: <CAK7LNAR6VFT+z377NURKZs5P4+Z9zE2oeN44zQE7PRfqV0JoZQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: run-clang-tools: add file filtering option
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 3, 2024 at 7:35=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Hi Th=C3=A9o,
>
> First of all, apologies that it has taken me so long to review this!
>
> On Thu, Jul 04, 2024 at 11:28:21AM +0200, Th=C3=A9o Lebrun wrote:
> > Add file filtering feature. We take zero or more filters at the end as
> > positional arguments. If none are given, the default behavior is kept
> > and we run the tool on all files in the datastore. Else, files must
> > match one or more filter to be analysed.
> >
> > The below command runs clang-tidy on drivers/clk/clk.c and all C files
> > inside drivers/reset/.
> >
> >     ./scripts/clang-tools/run-clang-tools.py clang-tidy \
> >         compile_commands.json \
> >         'drivers/clk/clk.c' 'drivers/reset/*'
> >
> > The Python fnmatch builtin module is used. Matching is case-insensitive=
.
> > See its documentation for allowed syntax:
> > https://docs.python.org/3/library/fnmatch.html
> >
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > ---
> > Currently, all files in the datastore are analysed. This is not
> > practical for grabbing errors in a subsystem, or relative to a patch
> > series. Add a file filtering feature with wildcard support.
>
> Sure, I think this is totally reasonable. In fact, I think some of this
> could be added to the commit message as further existence for this
> feature.
>
> The change itself looks good to me for the most part, I have some
> questions below just for my own understanding.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> One further question/comment now: Have you considered a way to
> integrate this into Kbuild with the clang-tidy and clang-analyzer
> commands? I don't think it is strictly necessary for the acceptance of
> this patch but it might be nice to have some variable that users could
> provide to do this with their regular make command + the clang-tidy
> target? Not sure if Masahiro has further thoughts on that.


We can do this in a separate patch if it is desired.

This script already supports multiple options.
I'd like to prefer a single generic option
like CLANG_TOOLS_FLAGS.





> > Have a nice day,
> > Th=C3=A9o
> > ---
> >  scripts/clang-tools/run-clang-tools.py | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-too=
ls/run-clang-tools.py
> > index f31ffd09e1ea..b0b3a9c8cdec 100755
> > --- a/scripts/clang-tools/run-clang-tools.py
> > +++ b/scripts/clang-tools/run-clang-tools.py
> > @@ -10,6 +10,7 @@ compile_commands.json.
> >  """
> >
> >  import argparse
> > +import fnmatch
> >  import json
> >  import multiprocessing
> >  import subprocess
> > @@ -32,6 +33,8 @@ def parse_arguments():
> >                          help=3Dtype_help)
> >      path_help =3D "Path to the compilation database to parse"
> >      parser.add_argument("path", type=3Dstr, help=3Dpath_help)
> > +    file_filter_help =3D "Optional Unix shell-style wildcard file filt=
ers"
> > +    parser.add_argument("file_filter", type=3Dstr, nargs=3D"*", help=
=3Dfile_filter_help)
> >
> >      checks_help =3D "Checks to pass to the analysis"
> >      parser.add_argument("-checks", type=3Dstr, default=3DNone, help=3D=
checks_help)
> > @@ -48,6 +51,22 @@ def init(l, a):
> >      args =3D a
> >
> >
> > +def filter_entries(datastore, filters):
> > +    for entry in datastore:
> > +        if filters =3D=3D []:
> > +            yield entry
> > +            continue
> > +
> > +        assert entry['file'].startswith(entry['directory'])
>
> What is the purpose of this assertion? Will it cause AssertionError
> under normal circumstances?
>
> > +        # filepath is relative to the directory, to avoid matching on =
the absolute path
> > +        filepath =3D entry['file'][len(entry['directory']):].lstrip('/=
')
> > +
> > +        for pattern in filters:
> > +            if fnmatch.fnmatch(filepath, pattern):
> > +                yield entry
> > +                break
> > +
> > +
> >  def run_analysis(entry):
> >      # Disable all checks, then re-enable the ones we want
> >      global args
> > @@ -87,6 +106,7 @@ def main():
> >          # Read JSON data into the datastore variable
> >          with open(args.path, "r") as f:
> >              datastore =3D json.load(f)
> > +            datastore =3D filter_entries(datastore, args.file_filter)
> >              pool.map(run_analysis, datastore)
> >      except BrokenPipeError:
> >          # Python flushes standard streams on exit; redirect remaining =
output
> >
> > ---
> > base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
> > change-id: 20240704-clang-tidy-filter-f470377cb2b4
> >
> > Best regards,
> > --
> > Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> >
>


--
Best Regards
Masahiro Yamada

