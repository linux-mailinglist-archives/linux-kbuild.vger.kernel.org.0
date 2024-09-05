Return-Path: <linux-kbuild+bounces-3412-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF0B96E476
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 22:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 565D81F22543
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 20:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858721A726E;
	Thu,  5 Sep 2024 20:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F6jfJn1C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C21A704E
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Sep 2024 20:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569597; cv=none; b=g6iTGlM4FyfHOluHHlOqS2nfhB3sgNM6ouOX+KCrAnTZdMuJehQjzi8gPiUvrmUv9547BmdsTb77ob8D2wc8xw6rums599II6WGCnMNoQIFGf3/3FGlJenOqdCLjM0E5hmO5l4+41aRufVxjLXWuf4fIoXHz4njHxHmNvBm7jE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569597; c=relaxed/simple;
	bh=BCPHjrxa/2c46cQlwvtBcorPbkKjJ57wCHWPzKc0gYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lX9RaayyOssddyBIxTVX7iPpKBmmIGczKJ4d5iY/Om4Z4Xz2XZH+sZXAn5w5igfedkM+l0+CUP9ENXQEjaaUfvJLTwhiSt+sK3DKkbvYrJNFaP1IWbcSGXYWQR4hzFSZVTCRg+08zC6ikCBA7Aid1Mf9i2jvqKc/ioz9+8rfTsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F6jfJn1C; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4567fe32141so30101cf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Sep 2024 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725569594; x=1726174394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCPHjrxa/2c46cQlwvtBcorPbkKjJ57wCHWPzKc0gYU=;
        b=F6jfJn1Cwaob9wTLKZrSx3fiAtOZnEJQuPUIWsWAUBO1Z3y+q9UMPdwGmDVg7AmeU7
         MxRIRdTkWkekJGAB5eB8ft7uvUGMKSTI46ekfguNGz4DPoU9rWOMbGgTiR6MJiciBhaP
         kt4J4BV/SF79VeUHCAb50yYUwzvcVte1irZRTX0siVvxCS09SqnhEkfelhxHQIbYo8e+
         vejStRVe6oHLihgU1bv7L1Ee1TY06TYjly8sOjNIWzVaSBSA/G02OvzJYoqlFOajWMc4
         2a/y0Xyry4GVLdwR+q7PCIFeiH6fCz+oh1zRygGsFPY0tFH5C4E7zIq7yPC03VAuxhUD
         KxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569594; x=1726174394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCPHjrxa/2c46cQlwvtBcorPbkKjJ57wCHWPzKc0gYU=;
        b=a1MP6i6ThTeiSpSbbMWtVl1OXxfVh4J2sDpBXv13LNEQ8gJ5tmXrcvyQsfPByc5FxZ
         8cf1p70MWAmXxI+CkkiiwPnCec5IkiO2Q7Oyz+h6owjsvqDioLkwuw8f5jSrwA9+Q12L
         SfUbDoGS49l4wyQTPyfnzh1NwGxQ1ZfKPOAJA7tPYJDiBeRGlkZOgSVq5JFjcxKYD+Am
         Z6EOOl9HYr+nt+Xvm8TJ/5UyPyFa46OPOCXBH62TKlZddjqFDWQO35m9PBcYfqWFGp0M
         rVldMkKlZ9DDyWGRcD03Qkwuuhg95fJE/+uLOX1yf/stWLNdvpbFiPDzHKoTW4UzJNix
         LgDg==
X-Forwarded-Encrypted: i=1; AJvYcCXiNp/bz9FppfthQ4cvwGuD1qU2O56iq4gRX46uY2K/NOUNX5aWdVbVJGJqmQUkWRVlWnAPfgPRA0swIig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAKnc2JeLOD2KzoD1cmSYlOoALCFat26ognIzEdxXmO7AH+S/
	Ewd9Re+pnnxeg9hwejWuUigk98T5/2CjlaXG76gmpOP5kn9EitF2zCmp0pJoTr1fYt4VabizJ35
	LPDeiv3BSlDOko9LexUizSeX5uL5eKLBACCPc
X-Google-Smtp-Source: AGHT+IEyDq3JrzaEs03Q1q6474Lw72SpaaWbS1WNHPASK98Yp/ym0+RHgGQfwZR8C+mk4SWq/i0+5v5gojSd3ZhoK8I=
X-Received: by 2002:a05:622a:1486:b0:453:5b18:817 with SMTP id
 d75a77b69052e-4580c4346c9mr987391cf.6.1725569593602; Thu, 05 Sep 2024
 13:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
In-Reply-To: <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 Sep 2024 20:52:34 +0000
Message-ID: <CABCJKucott2g8mZyJ0uaG+PdPTMsniR7eNCR9GwHpT_kQ+GFvg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 5, 2024 at 2:30=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> > @@ -0,0 +1,78 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Copyright (C) 2024 Google LLC
> > + */
> > +
> > +#include <dwarf.h>
> > +#include <elfutils/libdw.h>
> > +#include <elfutils/libdwfl.h>
> > +#include <linux/hashtable.h>
> > +#include <inttypes.h>
> > +#include <stdlib.h>
> > +#include <stdio.h>
>
>
> Could you include external headers first,
> then in-tree headers?
> (and one blank line in-between).

Sure, I'll reorder this.

> Also, please consider using scripts/include/hashtable.h
>
>
>
> How about this?
>
>
> #include <dwarf.h>
> #include <elfutils/libdw.h>
> #include <elfutils/libdwfl.h>
> #include <inttypes.h>
> #include <stdlib.h>
> #include <stdio.h>
>
> #include <hashtable.h>
>
>
>
>
>
>
> If necessary, you can use this patch too:
> https://lore.kernel.org/linux-kbuild/20240904235500.700432-1-masahiroy@ke=
rnel.org/T/#u

Thanks for the patch! I think this would otherwise work, but I also
need jhash (or a similar hash function), and I can't combine the
tools/include version with this, because it ends up pulling in a
duplicate definition of struct list_head. Would you consider adding a
hash function as well?

Sami

