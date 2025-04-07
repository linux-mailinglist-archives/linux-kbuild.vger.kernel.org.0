Return-Path: <linux-kbuild+bounces-6496-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC3A7F0AC
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 01:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E5DC3ACCDF
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 23:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271762248A4;
	Mon,  7 Apr 2025 23:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4WhjCcnt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601E2223701
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Apr 2025 23:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067201; cv=none; b=NsKqW3kNE9pU76X8YECXQruSjB+yMA+B0X88IGBljRPjxGoE/Wd9eI0HG6sUoREUcZyQstL3PmN/G+kmzsge96Y9ewd1c+hzIvGu/7N1oO0hiSN/+3TwGSN4yxCIUGwAwKph3Av4TGSq0Ai/RH4QJvMPnQf1DF4HyHkQf2+IWpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067201; c=relaxed/simple;
	bh=NnpMR//R+lE0HzsOk3Sqk4S2BtKa0vwBWH2sSUWKfnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSfSyPW5Gnz12RIZ+d7F+99n614zetLbDz7kugel2lfuct3W0mwEQyhxk8T18UAML/8r3fYjv/TGZC3TgVMdcKI4ugkkSfCiRwBPvtNUp/hhOeEfNx70cQ96XMUP0Uqgi8eQtGf865XEzvNkFJJUe+fDmbLG1GuhCEJ8CcXKeHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4WhjCcnt; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so4638a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Apr 2025 16:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744067198; x=1744671998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6ZU8/5kXxHvtLmBpOqeu36t6PMkH8wk6iaMboo1oUk=;
        b=4WhjCcntCPmbLzJzbDIej7JAeA5fafx5VCkpzzUGcGsNq0A3HgH6sPXczPvkJB222L
         RQCSflsLL0rDyz5lj1AJ8ZUEuGLR7Yc+10hiBI/3C9VJVq9sQe2ZIYX8uVyqbPGTC+Mj
         MaTK9RbSFi0krpzV4KXEfAdwrVHWDx+1BicZ0mXecivSilcVKArkQ4XqKxd19s5q3uDz
         bXvRwdZeTclQJmRf8iWuuoga9TJNhjxr8BSUxL+jKEWvfu3Aty5JYFmJypsW311NN3s5
         5IAVWnBIK1nN0EnDVq9fZl9TvIbU7jovQNKFBzG8+UeGTpEYdkEkZysj6Z6ns+i5Xu2g
         5x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744067198; x=1744671998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6ZU8/5kXxHvtLmBpOqeu36t6PMkH8wk6iaMboo1oUk=;
        b=VDHazBtrb27J8QbRpa/aL7pWZQqVEHGjc84xt7CUK04mvnRvmgTThAbcTJV6R8jNGP
         2eM4a6Kh3msxxNXqlq5/h3Wy7RQnZ+GXFSx1szqgDFBNLZuDfyrfI1HzOp6Nas192/67
         xBHTSzpbKATPmAIXsWqIIgk/M5S4YHjemdS/KL0D7vYXcStuuN0MOQZIetnMyep6Vn9L
         kVvn/zZ/vLQXvfDNLU7iTEJOXVl6rr9Pj131a9LT7uZywlSK/TJrrHwWLhXiBqcrwm2M
         u8AOvOfl95FB/w1YYtlc9Hl2G751QoR4MaRAxDm5gg1JjU1ut0+pAVKyUl/OILxrgC0M
         1CEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBMIq0B8rozzv/h9a1mrSkTVGd/bf/vbOGDzGOp8RIHNR0BzGPBrNg8QE9VTWqS/zqc4ElotaRG+1MkNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYKIoP7wbXzEYPPNTpOxxkIEc44g0jDIAgSbxSxR94YRcLbE8A
	ZcrFWAnx9DmKf+3+58eP0nwaQjn+cj3hkn/VnqIXCJKn2B5GRijcFIu0i4Bdh1uWdqWew/JTY1A
	1Hg1gzwu0LKQFsfRKfV60e7T0YlGnqLjt4c7i
X-Gm-Gg: ASbGnctGxcsCRa4K1r3uPiVJzz6IlchnEjIfvB1q+5l6pOyirbBZN9f6G/G1+0worLp
	HOfXkrp9nMUtryPfuRhzEyXfiHQTnIQkpxWRPm6ox8F0uD9qnL6KtdYf/EcuGQ+oss+D5E49ACn
	1JJSjM7O2KqNjbhh/9p+TEkhzvCH5G4jfEBntNYokxagD5Znk7Ps8uLg==
X-Google-Smtp-Source: AGHT+IGwqCibUtvZ7zXUKoLw/9l4mbZWNa3k4PRsHBInjoFnc3gA8HPUr5aBeYPf7FZ1MhHrVbTftQ1BznakccCAUeY=
X-Received: by 2002:a05:6402:8d3:b0:5de:c832:89ad with SMTP id
 4fb4d7f45d1cf-5f26a698aa5mr22942a12.6.1744067197193; Mon, 07 Apr 2025
 16:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320232757.2283956-2-samitolvanen@google.com> <CAK7LNAQ8t-O2Y-47MEQA2cPYKq2NB+FURbZ8zJKWgT0grG90rQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQ8t-O2Y-47MEQA2cPYKq2NB+FURbZ8zJKWgT0grG90rQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 7 Apr 2025 23:05:59 +0000
X-Gm-Features: ATxdqUH8gwXDjnSDaoNdK4s6L04JtZ--H42vGnrNEIhr4DeJpws2XPsHyTPSZa4
Message-ID: <CABCJKudb3GVL-nfUvd=1rhyH_ZWnxQCQkZBdGXQ16pA5fg3yng@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require pahole >v1.29 with GENDWARFKSYMS and BTF
 on X86
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Pisati <paolo.pisati@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Sun, Apr 6, 2025 at 1:21=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Mar 21, 2025 at 8:28=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > With CONFIG_GENDWARFKSYMS, __gendwarfksyms_ptr variables are added
> > to the kernel in EXPORT_SYMBOL() to ensure DWARF type information
> > is available for exported symbols in the TUs where they're actually
> > exported. These symbols are dropped when linking vmlinux, but
> > dangling references to them remain in DWARF.
> >
> > With CONFIG_DEBUG_INFO_BTF enabled on X86, pahole versions
> > before commit 9810758003ce ("btf_encoder: Verify 0 address
> > DWARF variables are in ELF section") place these symbols in the
> > .data..percpu section, which results in an "Invalid offset" error in
> > btf_datasec_check_meta() during boot, as all the variables are at
> > zero offset and have non-zero size. If CONFIG_DEBUG_INFO_BTF_MODULES
> > is enabled, this also results in a failure to load modules with:
> >
> >   failed to validate module [$module] BTF: -22
> >
> > The pahole commit that adds 0 address DWARF variable verification
> > was merged after v1.29 was released, so later versions of pahole
> > shouldn't have this issue. Require pahole >v1.29 when GENDWARFKSYMS
> > is enabled with DEBUG_INFO_BTF on X86.
> >
> > Reported-by: Paolo Pisati <paolo.pisati@canonical.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> The issue occurs with
> 47dcb534e253 ("btf_encoder: Stop indexing symbols for VARs"),
> then fixed by  9810758003ce ("btf_encoder: Verify 0 address
> DWARF variables are in ELF section")
>
>
> Perhaps, does it make sense to do this?
>
>  depends on !X86 || !DEBUG_INFO_BTF || (PAHOLE_VERSION > 129 ||
> PAHOLE_VERSION < 128)

That's a good point. I confirmed that v1.27 works fine too. I'll send v2.

Sami

