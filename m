Return-Path: <linux-kbuild+bounces-10754-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIJdLVrmb2lhUQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10754-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 21:32:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E064B55C
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 21:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB779AA5873
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 19:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050414657D0;
	Tue, 20 Jan 2026 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8XFpMP0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07930466B62
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 19:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768936546; cv=none; b=uwMBraIScF6JXciOtsJ6Fx2h1DXgG2uZj7YCWyArXTLoCX9gHUHKJfpo2/GY6wvFZl8gL9qy339TPMzGrEst6d9OgI5nBWtQ0xxEyQjbNmmyQ7IqWQgOgdkOjXGcEFRVCaiIcD9SqS7CXnGrPBU0Qu8FNdx/eKRrrK370EZtXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768936546; c=relaxed/simple;
	bh=1N7H+yfpk2NLIOr7BO59rbs9SEWHKeyOlq2YvA8BBU8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FPqeg0CnNgfyk3cadz3cPdhdcqK3ipCrauVUL6lLw7d5elOK/q6i47j0Hn4gBeeRmKRSNHu2tGTeOs0KYfkKaVtl1H9yqvKGEaGvCo5T1WWzGEetFGKaftw2POQAzc2TO4Wq86vDLe39TtqQCDvuaZRZLGl9t2+uhxjuj7aQA48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8XFpMP0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so37135875e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 11:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768936543; x=1769541343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0qoWHj+Pupz+7dBvH/HjJvQAh+/X6Q7iQzogpkXbi8=;
        b=a8XFpMP07xNVWkfxaeWpj5YXch3RTYsxN627l0CQBozCisd2qH4lzpn3k/K7D76qL2
         ndiLURYa5r1Y7sONFTj+MTrr6IllG1TQhfTfmJ0Wsx3i7m+TB+daeFLv2Z/LDwQAiWTX
         Hs2rpO7OwYe67nACT2OwpbXjEQV96LYewDxJbpShDo4/g5QoZKVLzntGB8l7LESa488M
         p108QmWEkC78bwLP+bpyfd/SI2gzhTIO6Awfk0b49Xhn8lQxPuuF8pNPV9SHuENOYDj7
         ig551/XA3aIUjZiiJ7ynSZEHAQloG0Kd3p7fO3VEBzIGpyuLjGfoXIITGy6ebJYfpK1L
         lgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768936543; x=1769541343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0qoWHj+Pupz+7dBvH/HjJvQAh+/X6Q7iQzogpkXbi8=;
        b=rHWVotKYzT6qyAU6H4FY8s1vXyQa6R0qOQzP7m9elSbczjPrg35m8Bz4GuIdEN6eft
         3d+tWhDIfO8Ql6Nd+LrV7z9RhYg9nWiN5zOr1iAn5CapJUB8OlAdrIYseaFyoo9U89fB
         Yv8kPwDbfKN0Mi1WPQvSJ84va1WCUSLeVYQ3244dka+UBNwj4DKI12OVkNOpoHwd5Rc+
         Ocnx3xg5d5Dszvi7ZxwG8kyTHC/Ay4PsNXqMaz3lmgbnogfs1X30DenZVrSuPGzxWQRS
         CFW1Y1BaLuDRwGkamJ38/hh/NFp2GdMso/Rr5XjFcOvw0OyJpyaEYmWp6Dspx1BA5f39
         ZZHg==
X-Forwarded-Encrypted: i=1; AJvYcCUU9RNKMzgbl8UHpSjAD1U+BPuxesW2bTUbQMygaZ3kJ5A21+LmDGBCtBZY97Zvs8DThZQ30UXyuWpacwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvyo2X/U7/eXOb2Td3lZYUE8AbHApWZ6+r5vdwwSXbrJvP8n1L
	+Y2gw/RqzSdhvSWEGDCRTvxLiGTVy/Lm9gOh7696gzImkchYO1yD/rGi
X-Gm-Gg: AY/fxX77f2GyFofGnj7Nfhg3aRerXV/sxUnOQrPNOH0gC5sJeC6TMA3G3QRBepOg+OT
	kOIdOc7loBajLHmGuj5hv9z75IOcV8PdlygQDTEoEIlWDB782aNNdU80PeqN8IZROryFNkBtza3
	ebQ30swnCtEiIhNBVyL248QDKzW3gNLBrBoYO+xKfo6btrf1SUv3L5g7qmiMXNo2H6r/gLr7TSQ
	pG7ZoFEKkwY4oRwsuag8KkRtCxyeDslgZOmXZoK+XajMN52y9MSW6O0jNwu1h2C0XPIjJ39wpLu
	KZeZtvDlpUivnf6ocXPty/ZJklS+2M9moUEaudePu5v7bbiKI/ZJP01xhmzxnXn0DOXi+R4UYDR
	bPMAq9p4ccB8e5BbfO774V8GlvdgGLIhW5ueMZls0FTbWCFNfEnjp4qSxEOuyuoWxnszYkFOj5S
	K6mObRf+rBRWww8AzFggvHJYUXJ2gjhZp0F1LUty9D1CKEYGZq2ZRA
X-Received: by 2002:a05:600c:8816:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-4801e334379mr176102295e9.21.1768936543196;
        Tue, 20 Jan 2026 11:15:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042694e77sm1172165e9.12.2026.01.20.11.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:15:42 -0800 (PST)
Date: Tue, 20 Jan 2026 19:15:40 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Bill Wendling <morbo@google.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt
 <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Heiko
 Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>,
 Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu
 <jeffxu@chromium.org>, Michal =?UTF-8?B?S291dG7DvQ==?= <mkoutny@suse.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, John Stultz <jstultz@google.com>,
 Christian Brauner <brauner@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev, Nicolas Schier
 <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Naman Jain <namjain@linux.microsoft.com>, Simon
 Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
Message-ID: <20260120191540.50a22ba8@pumpkin>
In-Reply-To: <CAGG=3QWeYZqLA8FSMYZFRrJ24LtEKJdmRAq3awkMZj0+qy=4_w@mail.gmail.com>
References: <20260114193716.1740684-1-morbo@google.com>
	<20260116005838.2419118-1-morbo@google.com>
	<20260116095318.46a149fb@pumpkin>
	<202601171106.90E508A9D4@keescook>
	<CAGG=3QWeYZqLA8FSMYZFRrJ24LtEKJdmRAq3awkMZj0+qy=4_w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10754-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,infradead.org,linux-foundation.org,linux.ibm.com,linux.intel.com,chromium.org,suse.com,linux.dev,linutronix.de,vger.kernel.org,lists.linux.dev,goodmis.org,zx2c4.com,zytor.com,linux.microsoft.com,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 28E064B55C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 10:12:34 -0800
Bill Wendling <morbo@google.com> wrote:

> On Sat, Jan 17, 2026 at 11:07=E2=80=AFAM Kees Cook <kees@kernel.org> wrot=
e:
> >
> > On Fri, Jan 16, 2026 at 09:53:18AM +0000, David Laight wrote: =20
> > > On Fri, 16 Jan 2026 00:57:57 +0000
> > > Bill Wendling <morbo@google.com> wrote:
> > > =20
> > > > Introduce __counted_by_ptr(), which works like __counted_by(), but =
for
> > > > pointer struct members.
> > > >
> > > > struct foo {
> > > >     int a, b, c;
> > > >     char *buffer __counted_by_ptr(bytes);
> > > >     short nr_bars;
> > > >     struct bar *bars __counted_by_ptr(nr_bars);
> > > >     size_t bytes;
> > > > };
> > > >
> > > > Because "counted_by" can only be applied to pointer members in very
> > > > recent compiler versions, its application ends up needing to be dis=
tinct
> > > > from flexibe array "counted_by" annotations, hence a separate macro=
. =20
> > > ... =20
> > > > diff --git a/Makefile b/Makefile
> > > > index 9d38125263fb..6b029f694bc2 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -952,6 +952,12 @@ KBUILD_CFLAGS  +=3D $(CC_AUTO_VAR_INIT_ZERO_EN=
ABLER)
> > > >  endif
> > > >  endif
> > > >
> > > > +ifdef CONFIG_CC_IS_CLANG
> > > > +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > > > +KBUILD_CFLAGS      +=3D -fexperimental-late-parse-attributes
> > > > +endif
> > > > +endif =20
> > >
> > > Will that still be needed for clang 22? =20
> >
> > AFAIK, yes. AIUI, this flag will remain while -fbounds-safety continues
> > to be upstreamed into LLVM.
> > =20
> > > Looks a bit like a temporary flag to avoid regressions.
> > > Probably ought to at least have a comment that it won't be needed
> > > by some future clang version so that it gets tidied up. =20
> >
> > Once it's no longer needed, yes, I will want it removed from the
> > Makefile.
> > =20
> Would it be good to 'fixup' a comment in the Makefile for that?

Wrap with:
# Update version when no longer required
ifneq ($(call clang-min-version, 999999),y)

Although you might one day need the -f option for something entirely differ=
ent.
So perhaps the logic that enables CC_HAS_COUNTER_BY_PTR need to do the
extra version check and set something so that -fexperimental-late-parse-att=
ributes
is added here (so it only added once if needed by multiple things).

	David



