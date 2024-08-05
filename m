Return-Path: <linux-kbuild+bounces-2814-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 283DB94777F
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 10:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C62AA1F2110B
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 08:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C60814E2FD;
	Mon,  5 Aug 2024 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AAXtEzBy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB863FB3B;
	Mon,  5 Aug 2024 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722847317; cv=none; b=CXPBb8rjItPefIBJWPzX4IPXaKyJkITZ7wfUulBtDLgI1Gl9jXqFL8DJJAcqJmtdxuUMxKi7IKONyS3jk+WuJgItWUAGLSbE21OTA6ebcQQ1AqnY94h0PqyF7UrB8NN9p/5k8Ro6ikiWsYi8di9y+BKdFEwGZV1Db9J2N4fj1EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722847317; c=relaxed/simple;
	bh=p1dgL5WqpObImIIobyokjE4ntrfS0fjFM1Ngdwp6PJw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UCgSbvjv2IGIugwpn8W0+ktiJFof+NqLXSFWvDcuI6Ed+uyNryngsKQjbdJAGacAV8OtyCxRV2jG2XRpx5iEog9HWLwXSTe7D67vKk+hk20yOjipdLRzrkHUklC4eFdwzXzVWKLTzxNnYdcHJFCYe0QUxR90M1rbsrSUOJJ0yt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AAXtEzBy; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id A426BC6740;
	Mon,  5 Aug 2024 08:39:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 282B21BF20A;
	Mon,  5 Aug 2024 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722847182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UE0ZjvPy0Jc+Zx56tW8YqCzxKaDYiYR9Pd/Q48C/Q58=;
	b=AAXtEzByiMDTXa3sVoZ2trXDSoGd/GdW5jfvAZ/ts10rlzdaj+7gzadheEkmy8PpeHW1M/
	lEjgK/oEgXtBZ7zgOsJjolCsRn+tHxXeSzNcBThLj5ofJeBO06Qh/UR+3ozeYpo0wNotHm
	i7IX6gVcZZlDSsDJdxNAyRRXIXq2oJFa4+jvbebYwPcc6UthBlF7Ic+naqqdtRIqP3aLgL
	z4Tvu2+xbI0iXkIFkPd9wysESCeVlOnK39dcf+bqvfo9w67tSFwmHcInAOubf24LX57kag
	HTrFgrTvnU5m/Pd/D+ntTt5ctGbb5Oo+807i2Wl3fu7PdkEUo94T7YQmKSm0Sg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Aug 2024 10:39:40 +0200
Message-Id: <D37UCSKCEVI5.100JF8WJR9DNY@bootlin.com>
Subject: Re: [PATCH] scripts: run-clang-tools: add file filtering option
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas@fjasle.eu>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <llvm@lists.linux.dev>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Masahiro Yamada" <masahiroy@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.18.1-0-gaa8319bc591f
References: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com>
 <CAK7LNARmV89PJV3sd93WwqLLQD0fg9mBOMetzECLriF8295zVA@mail.gmail.com>
In-Reply-To: <CAK7LNARmV89PJV3sd93WwqLLQD0fg9mBOMetzECLriF8295zVA@mail.gmail.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Masahiro,

On Sat Aug 3, 2024 at 10:42 AM CEST, Masahiro Yamada wrote:
> On Thu, Jul 4, 2024 at 6:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:
> > +def filter_entries(datastore, filters):
> > +    for entry in datastore:
> > +        if filters =3D=3D []:
> > +            yield entry
> > +            continue
>
> Maybe, this can be checked on the caller side.
> (Note, I did not test this at all)
>
> if args.file_filter:
>         datastore =3D filter_entries(datastore, args.file_filter)

Agreed.

> > +
> > +        assert entry['file'].startswith(entry['directory'])
> > +        # filepath is relative to the directory, to avoid matching on =
the absolute path
>
> Does this assertion work with the separate output directory
> (O=3D option)?
>
> Just try this command:
>
>  $ make LLVM=3D1 O=3D/tmp/foo clang-tidy

Indeed this does not work. It requires some changes to Makefiles to see
that it does not work, as this assertion is only used when a filter is
passed (which current cmd_clang_tools cannot do).

What would you recommend to fix that? If we take the first entry:

  {
    "command": "clang ...",
    "directory": "/tmp/foo",
    "file": "/ABSOLUTE/PATH/linux-clang-tidy/arch/mips/crypto/crc32-mips.c"
  },

I don't see an easy way to know that "/ABSOLUTE/PATH/linux-clang-tidy/"
should be removed. We could probably compute it from the command value
but that isn't a great way forward.

There are some entries that look like this. Those are easy to deal with.

  {
    "command": "clang ...",
    "directory": "/tmp/foo",
    "file": "/tmp/foo/drivers/tty/vt/defkeymap.c"
  }

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


