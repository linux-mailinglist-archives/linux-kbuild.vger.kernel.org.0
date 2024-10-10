Return-Path: <linux-kbuild+bounces-4025-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0299981A1
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 11:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAB1B1F21A33
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 09:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA12185949;
	Thu, 10 Oct 2024 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNKxw4B7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4318F6A;
	Thu, 10 Oct 2024 09:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551418; cv=none; b=cFdQuaquTIFMXvKTs/cCKLzNhZtIILmP1RfB01OupUKwMBrbZofhUrMOt2+cZHhTAN4Bx03oT2bYRdDhdPrqLlO1oumJofp32rpx5AO7w90NTlKeVmetCx3qcJISuLWkmgaGMg0bukpAuJQnY6YAo5is9gp4bHDbEfxcHjFNYDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551418; c=relaxed/simple;
	bh=jTjghx8VHXT+kOdfh9A/292U2rQaKwgNnNKjF2yE4qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+DNzq0hOeJmFS9URelgcrUyygb5xs1wG0xFigGxp4HSVqEOGpnkoK90XBwOOvgXbny1dn4myIBJU3XjRzK2cKT/gX2BWNIpmcQKj114GE/jZ+DYF1jc7/K589Qa2D/5+r7g4Dpt0cml4i8JVR+iG1LpbvwDn8jZXirddxN0CWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNKxw4B7; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fabc9bc5dfso6067481fa.0;
        Thu, 10 Oct 2024 02:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728551415; x=1729156215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lZBbt+lSSa7fnxgSraIyld2JLcytXaPCGbR+f+l/LYs=;
        b=QNKxw4B7OEWUQ5KAsTDXWpn/ZBsM7StfLbPO+Z53hJESAUwqc4mXIpkDawiqsvguwm
         mN0Eo0EeXM4C9XtqGTi6sZ+iNNAAKb1KPlw8hD6v2Ywki/lKQq6YGrUwrLCOnBjQ57vp
         3JGD+pELGAY9HIOvGg61/0ye8ZI+MNm0eL5MGVUcjtY0jqSq3USlVPDaghoyUnkXI/x+
         6fNeEdHBzzqgzuh61GxIeG95fy1XrgZCH9I6tcMZy9dFV/VQywlZ73XtRO5h5GSvBl7j
         QizbSqLN8q0So5BEVMt+zEgV402GB0Izo0AtR0hzpmaFiUw1Sc9uPIF1Msdp88gBeGMF
         tLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551415; x=1729156215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lZBbt+lSSa7fnxgSraIyld2JLcytXaPCGbR+f+l/LYs=;
        b=ZLa1FHTh2gY8cRPgcAXtQX6O2nzeUC9wT4SIms0QCfvH4/qCSYqZa/jKpuyrJJoPyA
         jCmrTai77OTQ0a1grvNKstq49TiXE2FtXFhiiDT5t2AmT6/PTGXHBujkTGt3RSRcNqgK
         PqrFN9f/ItJ0v/xQO4q6eyyWZY7iBY2+hiMpGS632030wdQyuVQnXDhHkEn7T31LGLXA
         IOAjLpd30JneTL87kjU08VooJAAZRVAJf+x1Xub9CwPwrtpM1NlmzHAQPhUYrvGMmgm/
         MaewUfkGdC3dXXpAOtvi0W2TZagCLp7A/naecS6UnNZu8nhMtAWPqweTaRzD7Zpm3uK0
         gDMw==
X-Forwarded-Encrypted: i=1; AJvYcCUX76p2TxTnKfEA9VFtwJKXNL/NKRZZmXz8kq0c9kvZN3MNgc0Anjwr7ek6wFKLxcctSnNAjVaTaC4rWlg=@vger.kernel.org, AJvYcCVN+gpelt1jgnDCcLRy13oZi+ryfquE4ct5ZdJbKEDyKwRkDndn6ZudBM8azu8EWY72Eq8L86WuzEb65Asb@vger.kernel.org, AJvYcCXn6wZ2KvycFzazhO4hp4gWEswAohedK/S4cKZB9BeG+J3E+leLc+jV0q2YvyYAkDQnfD26IBQ1xNZulwSszw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfCDGo9Qoqp+vLtHFiQ3OJbTBQbuq/Qxtwb+ccAk7fiCblOEF
	Fo6j/rDsKZju2obDWma7lPxAoqIwAVXBmHqbNezlZRvJY6+HJrhAX2JmVMd4kgMFf/vTUHLtADx
	d/qAxKKdiGkd4kiBPJ1+XKH5H67w=
X-Google-Smtp-Source: AGHT+IFPayMa/kEZOmOpLQsvdrbM559dB6IYuhya4uNVA6xYflcmwSgY1eBZT/eRKnnIOH16i/0HmGsqLSqNKv6eByY=
X-Received: by 2002:a2e:d1a:0:b0:2fa:d059:af2 with SMTP id 38308e7fff4ca-2fb187d282emr26432621fa.39.1728551415021;
 Thu, 10 Oct 2024 02:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <42aa307d7ffae1851b4a8787f5c276dd0b3beece.1728543368.git.linux@leemhuis.info>
 <b32f1e42-d775-4538-ba36-9e9b906a34e3@leemhuis.info> <CA+icZUUgwJWY=PWO5fQPZbUc-q=LkdHXVe4+g-LnXmQfCA3N7Q@mail.gmail.com>
 <CA+icZUX9hrwFXA-6KVT+yZ=-NqyPB=LOKKWSf77-xb32totgHA@mail.gmail.com> <a5b3c47e-5f0f-4c0f-8ad9-4fb34d150548@leemhuis.info>
In-Reply-To: <a5b3c47e-5f0f-4c0f-8ad9-4fb34d150548@leemhuis.info>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 10 Oct 2024 11:09:38 +0200
Message-ID: <CA+icZUXcyro2B9cvccrxbAWHt-Dhv0SO7vErvbCRQc2TK60N2A@mail.gmail.com>
Subject: Re: [RFC PATCH v1] module: sign with sha512 by default to avoid build errors
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	linux-modules@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 10:57=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.=
info> wrote:
>
> On 10.10.24 10:42, Sedat Dilek wrote:
> > On Thu, Oct 10, 2024 at 10:29=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail=
.com> wrote:
> >> On Thu, Oct 10, 2024 at 10:19=E2=80=AFAM Thorsten Leemhuis <linux@leem=
huis.info> wrote:
> >>> On 10.10.24 09:00, Thorsten Leemhuis wrote:
> >>
> >> That was wrong in the original code which you moved:
> >>
> >> +config MODULE_SIG_SHA384
> >> +       bool "SHA-384"
> >> +       select CRYPTO_SHA512 <--- SHA*384*
> >
> > Thorsten, please fix it!
>
> That looks intentional to me -- and CRYPTO_SHA384 from a quick look does
> not even exist.
>
> But that's not at all my area of expertise, so I would not want to touch
> it anyway.
>
> Ciao, Thorsten
>
> P.S.: Vegard Nossum mentioned in the fediverse that I could also solve
> the problem the patch is about by adding "default MODULE_SIG_SHA512" to
> the "choice" section; haven't tried that, but that sounds like a better
> solution. Will likely give it a try, unless someone brings up unwanted
> side effects this might cause.
>

Not an expert in this area, too.

Looks like I misread it.

SHA224 selects XXX_SHA*256* so the code might be intentional.

-sed@-

