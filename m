Return-Path: <linux-kbuild+bounces-4570-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DD59C1784
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 09:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB45CB22727
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 08:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DC21D26E9;
	Fri,  8 Nov 2024 08:08:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314061D3578;
	Fri,  8 Nov 2024 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053328; cv=none; b=Wd3SYQPiOLfF34c0c0PwgXQAAWioJpwhNpEr4+YqaJlpdN0ptnfSUW1QUrolxXLrVW/asjOE5pOFVDg/icy1HF4uYG27dJjpGlh7m4mFtJyV5l+L3wyTBOUAT2VuO+mDeyQ1/qbqDTDHkcWJSDw3gaAXarxWPWQ5cn5yoJ8KgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053328; c=relaxed/simple;
	bh=LD2eDfz4SMAlB7umwDHTDu0TvSKpT8mglT8E9NBfcjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=niY0H8IHUElTqA/Fa+Q5DcibYDk/2d5OYhUmWIeu/H+3bZxPrgB9J3ffWqKJQGqbJSNaqTMZC3nhmcdVGREi5FtEou+DXhEqDTVk7Sb4XVKXYPsCn8sJp4RuA9nrXrSXZTkUqlOajBobG0SNDasxzIuqLMG6hrYFjlzbxyPvM5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29047bec8fso2383095276.0;
        Fri, 08 Nov 2024 00:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731053324; x=1731658124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AcfQIh4eL6wqtezh6vPlrQwPcncc/rwq6AytHbkvyU=;
        b=dAEhA+l+qguEDzp+cmRK/jIIOs9e0bbyUqhYm7wGCgbbXRNBLAIVedmU+4zr05buuS
         JDbAFPJhKvW4Lt81zFJI7Ia4zHfDmxmAbX2llDWgCkLCyYnrHWxPbukrAguTCin8hUnb
         0aOauTdIv8i5Zi6XYkyQqpbN3cn40sQznSrE/i+Q3qVjLSZdpaVDoqllCLjw4fGTTDZT
         JpUuXLNl6W+fGykH8XgGc4gYrYbKKVlDR81rfEUo0fq9t0JAb+LSZoohe4jWpt3jkjXs
         7RUJwLze8DtHEq27pXrHfl8Hov8YYSofbdG6LPVSh7dZRr8MFrQxgR6u9J0/sZNzQMnY
         Ww4w==
X-Forwarded-Encrypted: i=1; AJvYcCUsYb2SiK+qZQ0hU6TNM6c0bFo0mEQZGvnmQ69izMgG4Gx6Pd9VZzZmEYwowMiE6wETh/bZk1zgLxpHKm8=@vger.kernel.org, AJvYcCVGPjXlLSVlMFcD8EfIROWGw4E53qHDGsC/xY5imbzE12AuHxFjfN6p5ijfkcuJPX3P4o2nucwcJptlDr4DDg==@vger.kernel.org, AJvYcCXUcGLUjWGbSY48MfiLNKqnOrhGwsU0a0U3Q4w4vnun0vPQ/YsVVKCAc8QjJf5wrLDOTXX4j5IQ5tfKV0IB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/BvNF9YyiMd04svx6zkLUFB1zjBUUine8z9cDliHJw2Q9aJ3x
	1DRGmw+JIcY+daKXDM0SDe8HcbyNGBLwS5sFuiu1b8mcYHvm1ZUrPq0KcwwO
X-Google-Smtp-Source: AGHT+IEMiGBY1n86Ty1i9Vt5vHiCM2UQhC579mG35SG/6bcIepIg9x3jPY0EGjCNR1X+O0F0sYPpGA==
X-Received: by 2002:a05:690c:39f:b0:6e3:ceb:9e49 with SMTP id 00721157ae682-6eadc18ed23mr21295537b3.16.1731053324422;
        Fri, 08 Nov 2024 00:08:44 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eaceb7a6f0sm6301847b3.104.2024.11.08.00.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 00:08:43 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e29047bec8fso2383072276.0;
        Fri, 08 Nov 2024 00:08:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfb8tX8Un0JRRm+UrKTWogxKAzu4vDb8+TXPbvkNQlyACdX+N2SG3iVwch/WLZOY4x/q9jT7Ke/KokKzA=@vger.kernel.org, AJvYcCXQH+hOZEyCF+4Yem/AXIyvFXWzET3+b1xk3Je7S9XTs1TLgH+/dE0QP7fN3bCZe6rWjk8GNva7u0csH519@vger.kernel.org, AJvYcCXruCFqMNQxMX1sLWI+o8vRqY+bsH9cvKnWNys1Tp1HMGDIezzw0Z+ol9FA6JG7YBlvDJs7cuTy8DyPvLNJpQ==@vger.kernel.org
X-Received: by 2002:a05:690c:9686:b0:664:74cd:5548 with SMTP id
 00721157ae682-6eadc0a205fmr22121087b3.1.1731053322861; Fri, 08 Nov 2024
 00:08:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net> <ZyxSdayBstBGhAeO@infradead.org>
In-Reply-To: <ZyxSdayBstBGhAeO@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Nov 2024 09:08:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgO83KksK59XEmF+EqXWHWBd1FLML0Ee1dQ7nOiGV2Eg@mail.gmail.com>
Message-ID: <CAMuHMdUgO83KksK59XEmF+EqXWHWBd1FLML0Ee1dQ7nOiGV2Eg@mail.gmail.com>
Subject: Re: [RFC] module: Strict per-modname namespaces
To: Christoph Hellwig <hch@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, 
	petr.pavlu@suse.com, samitolvanen@google.com, da.gomez@samsung.com, 
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 6:39=E2=80=AFAM Christoph Hellwig <hch@infradead.org=
> wrote:
> On Wed, Nov 06, 2024 at 08:02:40PM +0100, Peter Zijlstra wrote:
> > It reserves and disallows imports on any "MODULE_${name}" namespace,
> > while it implicitly adds the same namespace to every module.
>
> Ah nice.  This is pretty similar to what I want and had badly prototyped
> a while ago.
>
> > This allows exports targeted at specific modules and no others -- one
> > random example included. I've hated the various kvm exports we've had
> > for a while, and strictly limiting them to the kvm module helps
> > alleviate some abuse potential.
>
> And this was one of the targets on my list.  Specific kunits tests
> would be another category.

Indeed. E.g. making the scsi_lib KUnit tests modular would require
exporting an internal symbol[1], which the SCSI maintainers don't like.

[1] "[PATCH] scsi: core: Make scsi_lib KUnit tests modular for real"
    https://lore.kernel.org/all/48ca5e827ca420bbdbabb1643e2179dc95c9e0b7.17=
10849638.git.geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

