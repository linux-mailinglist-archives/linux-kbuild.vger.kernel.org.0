Return-Path: <linux-kbuild+bounces-2813-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD8947777
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 10:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D75201F21267
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 08:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECE014B975;
	Mon,  5 Aug 2024 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J1n7bIyf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE1913D628;
	Mon,  5 Aug 2024 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722847200; cv=none; b=QZyBmHpomPxtdTuvJ5CvmmKbi5kuHw20kk9Am+wyETF+Fj7D9XbWUHuAxskvPEldcrXIhCtwyXThVzI/B/XDLJu/JSjfGruOmtXjOfmPTnMDHLltVvq6HoKP7NfRssmfSfN00b8IUt4nmRJTvDsXRrm6L3hAKqzGRVrn5dSnDs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722847200; c=relaxed/simple;
	bh=AkAzzbrcb/m3hxXb3vpTYpWqfppvXm0Abz7cFdk1vMk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=OIIDd/MFld7JfaPwEoG89udZUmAQlb01TedYXqpJugSuepf2q6cRI9TzstHZ4bo2VCoksNDs3g5YutnOUV4WlQ51a5r89NRY+mXprrgNUoRj+6V3rM9AnO9DGk1oiU6fkK+eO1fY65zb88y1NH/shNIGtaZ0VPycHIjR1AuI710=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J1n7bIyf; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 21254C67FF;
	Mon,  5 Aug 2024 08:12:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01A4824000B;
	Mon,  5 Aug 2024 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722845531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HY6OU3chSqD3rf/2ebEU6wUI9+o+/0b7R7NY5T40ViI=;
	b=J1n7bIyfeChYNvKosoaYVVNqh/Xrlh9CwfwnUk2KlwTa8Gt7wTYcggcx54dbvDxCcV2gu4
	4/PiLPXFkawDwWhDhKNmdQD73u3s+UowIG6vpWnrMo5KkTjUyk+qNTeaQEs91vR2lJYfTt
	SRLjPV0sMvtjVfDmq71R1rwnupkDwxP0GHJuPidIqxw3H9aVaxE5SJGCWGJNhmYEp7sE+6
	25izkLi+iLJOCuEWBA8cDSOIx9v+TzfpjrRC2POuTaBqYzIdjcPvqLi2BORrIl3URuweWn
	3ikOxZiIE1avnfe5Qc1ASLSZdia1a08d7xXVNTNd13W9/VTashZODD251NEdHQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Aug 2024 10:12:10 +0200
Message-Id: <D37TRQF5HP6J.ODHONYD6DF59@bootlin.com>
Subject: Re: [PATCH] scripts: run-clang-tools: add file filtering option
Cc: "Masahiro Yamada" <masahiroy@kernel.org>, "Nicolas Schier"
 <nicolas@fjasle.eu>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <llvm@lists.linux.dev>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Nathan Chancellor" <nathan@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.18.1-0-gaa8319bc591f
References: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com>
 <20240802223509.GA781199@thelio-3990X>
In-Reply-To: <20240802223509.GA781199@thelio-3990X>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Nathan,

On Sat Aug 3, 2024 at 12:35 AM CEST, Nathan Chancellor wrote:
> First of all, apologies that it has taken me so long to review this!

No worries, there is no rush!

> On Thu, Jul 04, 2024 at 11:28:21AM +0200, Th=C3=A9o Lebrun wrote:
> > Add file filtering feature. We take zero or more filters at the end as
> > positional arguments. If none are given, the default behavior is kept
> > and we run the tool on all files in the datastore. Else, files must
> > match one or more filter to be analysed.
> >=20
> > The below command runs clang-tidy on drivers/clk/clk.c and all C files
> > inside drivers/reset/.
> >=20
> >     ./scripts/clang-tools/run-clang-tools.py clang-tidy \
> >         compile_commands.json \
> >         'drivers/clk/clk.c' 'drivers/reset/*'
> >=20
> > The Python fnmatch builtin module is used. Matching is case-insensitive=
.
> > See its documentation for allowed syntax:
> > https://docs.python.org/3/library/fnmatch.html
> >=20
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > ---
> > Currently, all files in the datastore are analysed. This is not
> > practical for grabbing errors in a subsystem, or relative to a patch
> > series. Add a file filtering feature with wildcard support.
>
> Sure, I think this is totally reasonable. In fact, I think some of this
> could be added to the commit message as further existence for this
> feature.

Indeed, it can be added to the commit message directly.

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

I have not as I am using this script by calling it directly.
It will either way be a separate patch.

>
> > Have a nice day,
> > Th=C3=A9o
> > ---
> >  scripts/clang-tools/run-clang-tools.py | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >=20
> > diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-too=
ls/run-clang-tools.py
> > index f31ffd09e1ea..b0b3a9c8cdec 100755
> > --- a/scripts/clang-tools/run-clang-tools.py
> > +++ b/scripts/clang-tools/run-clang-tools.py
> > @@ -10,6 +10,7 @@ compile_commands.json.
> >  """
> > =20
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
> > =20
> >      checks_help =3D "Checks to pass to the analysis"
> >      parser.add_argument("-checks", type=3Dstr, default=3DNone, help=3D=
checks_help)
> > @@ -48,6 +51,22 @@ def init(l, a):
> >      args =3D a
> > =20
> > =20
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

Just below we extract `filepath` from entry["file"] by removing at its
start the length of entry["directory"]. We expect entry["file"] to
start with entry["directory"], so we document that with an assertion.

If this assertion triggers, it means the line below would do something
weird and would silently break the program. Silently because `filepath`
is used for pattern matching and is never displayed.

>
> > +        # filepath is relative to the directory, to avoid matching on =
the absolute path
> > +        filepath =3D entry['file'][len(entry['directory']):].lstrip('/=
')

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


