Return-Path: <linux-kbuild+bounces-8294-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B7FB1B543
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 15:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4E61887A9A
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 13:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3A427586B;
	Tue,  5 Aug 2025 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HeqQltMx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254327602A
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Aug 2025 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754401825; cv=none; b=b4rOJoF9RhrYaUZMaTmvjnZaViSfsoZAKJqZv0t6vN6D4dAAPg1tkoTbmFb2mFiyj+C5xhSU9PWGn+sb28t/+/+E78/WTDCRSxcx5dDVy1FX1ggLnOAcx4vqlbKrubLFltrNMrM0ilaOZWD5Xttjg/9QwF1zrbdO1/HjNCrmu6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754401825; c=relaxed/simple;
	bh=g4Mlbi2FrsdDMsKp5s5oVMyNcAM40UvdkQxPRClr7Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heoUQPGIBnVej850GGYASf5Wq1TNGkXUn0v9YOs5sSSL0WqbdM8bmN2PiST8n9jvnEjD79/EBdk4o9G6tm4D2Zkcog/oIHDDx8VPTCeoL5BQhZpCFVxfiwgvovUrs2criGXe0LFitEobHQmX5YzsfoZuqQch+sZavyq7iEsH5t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HeqQltMx; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6156c3301ccso11683a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Aug 2025 06:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754401822; x=1755006622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OM5Sak9VYNXA/4oFKKbDTzSyVDrMPAA9ankjux7yv0E=;
        b=HeqQltMxDChXoa95DqIgzT82hEsZEBzJ9JkPWGrVQqRETgRiq6fdvF7VzJsTH1ePdL
         PzKBXgHMLB+5gUe3geUQGnrBXWy8GkNlR4D2KENOyJoz+6mptXnFZ4xQYo2n0tVB0jEP
         71+a6EAJ2ZBZPSiCXHWfze7UBBCvcVcrRb+iTsRZyJ9eRckP8/EWnRq+sFBbJujoLztj
         Qt9Tkm35abj8btolBhMTtlMgVNUGOmQC7mGL32torbDdn5mjcXxf86U6EaPpnH8FsM2F
         s32WK/mF9/iwm49jqGBWhQVZ74PYj2GYtdDBN1ylYyXtnIdVGZ+m0FjnXc6rurqhExIr
         WEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754401822; x=1755006622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OM5Sak9VYNXA/4oFKKbDTzSyVDrMPAA9ankjux7yv0E=;
        b=KbRE9H4JiC3tzqP8xtZMBEaMMxhJNrJ6gfjNPIsMkqppdzbidZGPKNYyH4ToisefYQ
         2LqShb1fZ8YMmJJ6fmv4Pol+aaPuEY7hSTV2eOO/GIY+mFQVD3rKgbNX2gGb3j74vXDK
         beZ8iM1FQu4Tt+Matp5omS25ZIs9MGHnijCxZWgpiUMxpWcB1uzjCoTISj72ZWG+1/hf
         1p3n5pe7gJCjXdrkVNmkOOSfTqJv9YSByovdlNp2RinQhquR5lAX/aq+sbaxFR5hbSYx
         zruXIkM2PZisJC2WyzsBw+XVa7+i4uWhdlIyTfiywtYSY4re3M40DQQSz4xa9Zxh/XSs
         1j1g==
X-Forwarded-Encrypted: i=1; AJvYcCUFHgiYRwhAXcuIQkQoGNPGcueEOWkjU87lMavOFYW9jvRUxkNuy9KH1IAHPSS2C4H50gFhkmWMfSN4W+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+etzDlLaqTuxgW8LYdbv5+4vTgVM1mKB+kp6fMcO3z4DLR3p
	KJzzIy85TnFkqTsK3cg9CFeJKC9zl5gMiZlwHmC3WatQdlutqPtPeltR+TFKwPO/1GIHFtNx2SU
	ogk1T+0PMY+fiCM8tTja0gLyxssT329UU49K8uU7r
X-Gm-Gg: ASbGncvMWo2tpviR83JEG8iPTJqGl6Th235INeHXtzRZZqsCSA1up5hBOJN/v0iPmUX
	7QXweZBD64gUAlR5J87DA7dw1GP9VJYF/C6SKeonB+6MBo6ICJcvVGR6gPWlztg+k4lgaRiK1SP
	CB5eK03Jhu2ggAP28vAjbTUlKxq57Fth4YBmM4YwuVZId9XrZp+Ys+xiH13xqIBYql8HFpayj/J
	n9wCz6DL97H7lU5VIyWwi+cMjazD77+F7E=
X-Google-Smtp-Source: AGHT+IHkUewzm/8PTdOyIiW/iPVhbXcnpy+KcxT34FnucOdRizqHQ5Mn+Gui7Bqb6LBcfhucb4rfr5500SDXDs4vrhI=
X-Received: by 2002:a05:6402:325a:b0:615:3fe5:a925 with SMTP id
 4fb4d7f45d1cf-617848372e4mr53602a12.7.1754401821913; Tue, 05 Aug 2025
 06:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804-kasan-via-kcsan-v1-0-823a6d5b5f84@google.com>
 <20250804-kasan-via-kcsan-v1-2-823a6d5b5f84@google.com> <CANpmjNOJxJ+kM4J7O5J8meSD_V=4uAa6SwFCiG83Vv_8kn56sw@mail.gmail.com>
In-Reply-To: <CANpmjNOJxJ+kM4J7O5J8meSD_V=4uAa6SwFCiG83Vv_8kn56sw@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 5 Aug 2025 15:49:45 +0200
X-Gm-Features: Ac12FXy65DGv8cn62c1xeecD1pKxLWVWZniqqA9hR2KQYd_-HuNZowNKVDRPddo
Message-ID: <CAG48ez2_HrKjRuH+5KSB+vK_9dGeNnh2O6qAN0ePr4BRnt3xzw@mail.gmail.com>
Subject: Re: [PATCH early RFC 2/4] kbuild: kasan: refactor open coded cflags
 for kasan test
To: Marco Elver <elver@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 2:31=E2=80=AFPM Marco Elver <elver@google.com> wrote=
:
> On Mon, 4 Aug 2025 at 21:18, Jann Horn <jannh@google.com> wrote:
> > In the Makefile for mm/kasan/, KASAN is broadly disabled to prevent the
> > KASAN runtime from recursing into itself; but the KASAN tests must be
> > exempt from that.
> >
> > This is currently implemented by duplicating the same logic that is als=
o
> > in scripts/Makefile.lib. In preparation for changing that logic,
> > refactor away the duplicate logic - we already have infrastructure for
> > opting in specific files inside directories that are opted out.
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> >  mm/kasan/Makefile | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
> > index dd93ae8a6beb..922b2e6f6d14 100644
> > --- a/mm/kasan/Makefile
> > +++ b/mm/kasan/Makefile
> > @@ -35,18 +35,10 @@ CFLAGS_shadow.o :=3D $(CC_FLAGS_KASAN_RUNTIME)
> >  CFLAGS_hw_tags.o :=3D $(CC_FLAGS_KASAN_RUNTIME)
> >  CFLAGS_sw_tags.o :=3D $(CC_FLAGS_KASAN_RUNTIME)
> >
> > -CFLAGS_KASAN_TEST :=3D $(CFLAGS_KASAN)
> > -ifndef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
> > -# If compiler instruments memintrinsics by prefixing them with __asan/=
__hwasan,
> > -# we need to treat them normally (as builtins), otherwise the compiler=
 won't
> > -# recognize them as instrumentable. If it doesn't instrument them, we =
need to
> > -# pass -fno-builtin, so the compiler doesn't inline them.
> > -CFLAGS_KASAN_TEST +=3D -fno-builtin
>
> Has the -fno-builtin passed to test if
> !CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX become redundant?

... oh, bleh, good catch. Somehow I had convinced myself that
scripts/Makefile.kasan did this, but no, that only sets -fno-builtin
for uninstrumented code... I misunderstood what was going on here.

