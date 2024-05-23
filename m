Return-Path: <linux-kbuild+bounces-1928-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DA8CD927
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2024 19:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD3FF1F21995
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2024 17:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747371170F;
	Thu, 23 May 2024 17:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRspGMfc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F351852;
	Thu, 23 May 2024 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716485427; cv=none; b=SUTYdVwDkhgVgazEWtbWo0ipoaqy19StD2W+ZMoo1SlJf7qSrXyvSygoJq8SOyDuaPh5kDAtKb3Zv0FsYO56bk70JtbBRMIND1dLa6GxVRuUqTsP4lSgUyJPgExq3Vq7JV4HaWUd2NKnM9tTCtrzR98KgJgLDLHxfj6D/D288cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716485427; c=relaxed/simple;
	bh=aVHtIGbg5uYTcGxto713YYITzXRC0Y++rdwWapj1pck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0RmelCWHlECRxUW5ISNL83fhYhHw+3bpALKOZT11WGXwA38Z6HugA0RXUTAHI2SEj/AZQB3Mj/Ny9+r7keu1ArRRI0XsSFG2Ib4hAvY34n0wBR6h3oNH0kibNAasldP7gNYcBHAhFo2vlRSotaWMUsNX2OJq2WCz/CELt3kwf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRspGMfc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8BAC32786;
	Thu, 23 May 2024 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716485426;
	bh=aVHtIGbg5uYTcGxto713YYITzXRC0Y++rdwWapj1pck=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=pRspGMfcIcUoU4PegowdguSJZ/u/bosBG0xeGrWbFc5/2Z9jC9GyqAZCpqD3DUBrT
	 d97V2SaB4zDbfJ+sxYfKho1z6651nGB9cBNhwIfJ3RQmJcuRlc0ua6A+hM9tg9sohV
	 SkYrKknB4nZNYsWsJ+xLsS9thly87krVz3Sm13RA1qLQSFQgrdNaF/IPm+IZ/f3bS0
	 WERr75VdJYhwIxfebRvMrO4XLFWGM+koyCghDjeiFnejE0AMXd9yjvhaD8XnB1TFes
	 BY3a+7bdC6TLX5th1S1kFXXL393wbke8juF8d+JAAYTV+xLgqIrt/kJ5PBOQ6IG3Yi
	 TgBJQYlWGn9YQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e95a7622cfso17141fa.2;
        Thu, 23 May 2024 10:30:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNZx6sZ1Ttnhf59JE4CuTIVFO7LabLmGVMqDlXaACmyAzrY8HOIHQaUHa8rAOj+XrUtcvOtQRpI5p4rFxxTUjKKTjNqsmGbJ8HtUJCqH7Eh/U45/PzKHyuGqqcjwiso+lGXn8CKY1A28zO
X-Gm-Message-State: AOJu0YxsXftb6oNOM5+XiNr8ztLrjFJhwEKrrYxS3jIMTkA9LlyuyklA
	B6SKPh9Tx6aBgGxjP0saI16KWCEmPly9Vw69WwKDtX6sYVK+cS8SrTP9llw5g1rf8oMms5gHOH7
	ORXZ1OCVUi0gRKKxsie6ZV8B/vyE=
X-Google-Smtp-Source: AGHT+IHulkUdoghkJ0YEwwy9vCXMJWjHcRu/tUJfmMLwjx6Fw7rIYl2G5N8e2CdNZeR/dixJ2gHw2WISv1qbbsCjZ8U=
X-Received: by 2002:a2e:88d1:0:b0:2e6:f556:48a5 with SMTP id
 38308e7fff4ca-2e9494cb6e0mr36736331fa.19.1716485424933; Thu, 23 May 2024
 10:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521065107.30371-1-wenst@chromium.org> <20240521065107.30371-2-wenst@chromium.org>
 <CAFLszTgJpaWzJneZ-uReEGrE85MgGYOjJKxOL7jGCYMuVMPKUg@mail.gmail.com>
In-Reply-To: <CAFLszTgJpaWzJneZ-uReEGrE85MgGYOjJKxOL7jGCYMuVMPKUg@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 24 May 2024 01:30:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v67MQDep8gfPWgeQoew8URAZyPw6ocGEMxMnwzYYRa0PYg@mail.gmail.com>
Message-ID: <CAGb2v67MQDep8gfPWgeQoew8URAZyPw6ocGEMxMnwzYYRa0PYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/make_fit: Drop fdt image entry compatible string
To: Simon Glass <sjg@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 1:19=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Chen-Yu,
>
> On Tue, 21 May 2024 at 00:51, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > According to the FIT image spec, the compatible string in the fdt image
>
> Can you please add a link to where it says this in the spec? I cannot
> find it after a short search.

(Quick reply from my other email before I forget.)

From the FIT source file format document, found in U-boot source
"doc/usage/fit/source_file_format.rst", or on the website:
https://docs.u-boot.org/en/latest/usage/fit/source_file_format.html

Under "'/images' node" -> "Conditionally mandatory property", the
"compatible" property is described as "compatible method for loading image.=
"

I'll add the reference in the next version.


ChenYu

> I believe this patch is correct. Since the information is in the
> configuration node it does not need to be in the FDT.
>
> > node or any image node specifies the method to load the image, not the
> > compatible string embedded in the FDT or used for matching.
> >
> > Drop the compatible string from the fdt image entry node.
> >
> > While at it also fix up a typo in the document section of output_dtb.
> >
> > Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  scripts/make_fit.py | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > index 3de90c5a094b..263147df80a4 100755
> > --- a/scripts/make_fit.py
> > +++ b/scripts/make_fit.py
> > @@ -190,7 +190,7 @@ def output_dtb(fsw, seq, fname, arch, compress):
> >      Args:
> >          fsw (libfdt.FdtSw): Object to use for writing
> >          seq (int): Sequence number (1 for first)
> > -        fmame (str): Filename containing the DTB
> > +        fname (str): Filename containing the DTB
> >          arch: FIT architecture, e.g. 'arm64'
> >          compress (str): Compressed algorithm, e.g. 'gzip'
> >
> > @@ -211,7 +211,6 @@ def output_dtb(fsw, seq, fname, arch, compress):
> >          fsw.property_string('type', 'flat_dt')
> >          fsw.property_string('arch', arch)
> >          fsw.property_string('compression', compress)
> > -        fsw.property('compatible', bytes(compat))
> >
> >          with open(fname, 'rb') as inf:
> >              compressed =3D compress_data(inf, compress)
> > --
> > 2.45.0.215.g3402c0e53f-goog
> >
>
> Regards,
> Simon
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

