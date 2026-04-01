Return-Path: <linux-kbuild+bounces-12589-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGOjE7iuzWlRfwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12589-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:48:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D367C381C9F
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CCF43049953
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 23:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AAE3F0752;
	Wed,  1 Apr 2026 23:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WdVowrbu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0FF3EFD0E
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 23:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775086987; cv=pass; b=JmCqtFT+9yg9dI/k97hcTCwOR/UxAxzZfIRjAq01YX6pzgoxwD1k6e3egBhkDP2+oOZzl63FZUJjufC0ckd7NM+96UOq+xXgts495UJV01vtUVYxy8P608JtCQ9YSCIrHPumALZYm5G8DucqFmSh23QAvi3m4FKBX0C5zS6xRPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775086987; c=relaxed/simple;
	bh=vb8ZZRP0AUsWH7D3wGTnRXL9a0COAZFzJBs4dfJtueY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MggNX+uAVCbR30uTMRGiHEhFULkkhrN0EcV72xuMiZSeFabwvDspYHV1BgTo4Z7ahJ7dEfy46b/hnBVJZ0btylPDzN1LvO2YN1dx5gl015tUM5SYwxPUK0rXH2sthSd3Md59ytkmo8mjM2j5uV6ArgeESfqUYiKaGVXz/v8nEkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WdVowrbu; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6054aa7f6cdso1156377137.0
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Apr 2026 16:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775086985; cv=none;
        d=google.com; s=arc-20240605;
        b=EdYMFekn3PCWMMF7+qMIfD0N8rCexxcmsimc9p03/nhlxNy663mwzbWA7r6sB0SUvl
         BL4M4MJ18fWFMJIYGecuUmni0e5ftXCjWwToJGJUBldI+eXcUL02Fn9At+8I2vQNkOoC
         +jhke5QcKKui7+izDtiSv9Znw1nYXv38GBMd1vXgd9A9a1KWrQbTJGpTLKw9YmVqhATR
         ggPMQi5LfHO3IPK0jE2r3Yb/mItHszHrtLanf/g3iAMl5MqnGGhrXNJQVSK3neOkp1fQ
         E/12txGljcree88EhPIXr94fZgbcQ8sjpmaaj8MIbyL5UAu0489fq4MnGzM4Yt6iVgpl
         q+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vb8ZZRP0AUsWH7D3wGTnRXL9a0COAZFzJBs4dfJtueY=;
        fh=o/kamWHJ/ZiIlLcmTb8CYL0tMlvNj6RCZUtv0L9OUFI=;
        b=YHMWpD4Pvk8fUkm/INnNnVym40MPyT7nxHcFZC/gYHsGRPj1wpu4UNjz1AebZD2VQf
         3AT09ZHqfPMdmFQvKPk1T6B/PjoEmbVIUNZIgy6AfXySwXR2ZkCqxJSKPOQJhqO2xC1H
         hWF70HJCFDOuXxKIaJIXEjbRv/2U7RGMhqb/zzLmOTulX3lR5cuOYIJUNQPKMTmrdwCp
         sWUN+Ea6XuKkFU0jiOan/1i97GAM+3h1FCe+DjuXZUkixijoMKOrPyCJ55+wxicjv5uK
         F/RCRtz5u5nk3CU2Vj2Hyl08+sEEKFpLEFPVarY0Li6hAQ+vQ9qebVFai75+AxjF8ie+
         V+NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775086985; x=1775691785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb8ZZRP0AUsWH7D3wGTnRXL9a0COAZFzJBs4dfJtueY=;
        b=WdVowrbuUfX2c+pzomoH0r26x9jw3GpIqiYAjlEiXUrSCLaJjPOf0F3tTbGTfHElRo
         MV26Ymi7xGB/DpSGNWZdL1ts58WSmXQDC2hFGVb3YEhZSNGOtq4q4gHJKD/JSv2hcWDp
         XBx8NKs2wH2tvmlPu9ngOCkJh/YKdXMRA6RQbDyX1r51eaQwBaL/P0jQSUszJzKuTSQo
         mxcmMzlt5qM6iY8OLtzREbwBmBFVTzGJ2mpluRRQj+o2e4+GQUA0zq5WjB3luk9S07+j
         USuGz1AYlY6Tc58kCyUlc2PEkfnbhxxsx1uR4DdFRZZZ33iMljvydPhDTBfIr2e+IGdt
         QqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775086985; x=1775691785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vb8ZZRP0AUsWH7D3wGTnRXL9a0COAZFzJBs4dfJtueY=;
        b=hrfXYxF3pv0rNZHMS98C7KY12JIWjSBCRigDrF2PPseumwRVMjMCURaYi+Cww6wc/s
         0s0V1wdHYsCJPKCUxHIKyMIAepv7Ko6g0u1qIhjP/CexCCwyEBdUfwbKDKtjKsi4XZXl
         HoqcED++TOEHmPveZf1BnJ30HoR+4mSKNuQoFLF7QfRjK/3viO+MOUkwHI5ubiiGDmZJ
         lZphG+nRwlJvVTmkCPQ7xcijJq1AYIAkvTclQ2Mygoezfz/BYKpIOmlL2ozEtID21P2s
         TqiZw/2hToj76kBRxhnSoDnUuOMKlGcOHQph4a3wDfxDHlFNmoGYRMFWz0TkcwD9d1Qo
         Ya+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4NtSLFxxog3eqfCldSDbCXrLhzPp1kI/RMQvyrNCfj1log+qm6wVbC3y1hzLCmVcFj54lWsrVVdeq4RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YysDy+NhYiPr1/6kTYy/6HWP3MFNbC5CFyMhjAacmtyCFUGvLw2
	k9mJsIwYzf4HE9qZM3Dkh4QnAQAmUo2AtS9dWiWZgsX7otvWUmCbjJKhbPBU/9QZnTHXgm5v7lX
	s5NkJMKCSuYZ9nQvTgvqnMSJ3Xxu3INaUfbGN8kAB
X-Gm-Gg: ATEYQzwj69lgYXGctTT6MbB9BE3mnBPa5JanLf89HTNSg7moWZ1bXjcu2nrFiIml01f
	oZxRFPeEKYwTpUEGWkbpqa2cFeLPsA2T7b3qDbXjRS885Q4cLagylsTE9YUnqz9EeSrrgLKL9jG
	mW90UPIu4o2uKWCSpXC3dxppwSiVxqddgqp4tr9OgKXScyL15VryXY+6CFfLporGbOLuOBRWPbJ
	6ymnzH9H7gYoGES5mN8PdAHDMjBLQK0nHLFDv+e6yiSzy9yKFMUgjdoqoiFeZDbzkxgRPDLA7He
	mvPwApo=
X-Received: by 2002:a05:6102:3e19:b0:602:70ca:64ff with SMTP id
 ada2fe7eead31-6058a9eb523mr128831137.20.1775086984541; Wed, 01 Apr 2026
 16:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
 <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
 <202603311249.30B44C66@keescook> <20260401090815.GV3738786@noisy.programming.kicks-ass.net>
 <202604011313.AD471BC8@keescook> <20260401203053.GC3254421@noisy.programming.kicks-ass.net>
In-Reply-To: <20260401203053.GC3254421@noisy.programming.kicks-ass.net>
From: Justin Stitt <justinstitt@google.com>
Date: Wed, 1 Apr 2026 16:42:52 -0700
X-Gm-Features: AQROBzD_rcuI-ARbXbMVr7h8U1mc5_5HGF_2wM-4PZhtBnHiHxrvNEdk_0yl788
Message-ID: <CAFhGd8opNwwqjU35TqkbxRvHgwSb8KZ3+wa0Tr4KWumvjfRVTg@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12589-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email]
X-Rspamd-Queue-Id: D367C381C9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Apr 1, 2026 at 1:31=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Wed, Apr 01, 2026 at 01:21:17PM -0700, Kees Cook wrote:
> > On Wed, Apr 01, 2026 at 11:08:15AM +0200, Peter Zijlstra wrote:
> > > On Tue, Mar 31, 2026 at 12:52:10PM -0700, Kees Cook wrote:
> > >
> > > > I think for this series, __ob_trap/__ob_wrap is what should be used=
.
> > > >
> > > > And for other folks, the background here is that we originally want=
ed
> > > > to use macros for "__trap" and "__wrap", but the powerpc C compiler
> > > > (both Clang and GCC) have a builtin macro named "__trap" already. S=
o
> > > > I switched to just using the Clang-native type qualifier. We can us=
e
> > > > the attribute style too, but there was a lot of confusion during th=
e
> > > > Clang development phases where people kept forgetting this was a ty=
pe
> > > > qualifier, not an attribute (i.e. the attribute is an internal alia=
s
> > > > for the qualifier, and the qualifier is a new type).
> > >
> > > Since you mention qualifiers...
> > >
> > > What is the result of __typeof_unqual__(int __ob_trap) ?
> >
> > Hmm, it seems like "const" doesn't get peeled off. That can be fixed, i=
f
> > that's needed?
> >
> > 'typeof_unqual(int)' (aka 'int')
> > 'typeof_unqual(__ob_trap int)' (aka '__ob_trap int')
> > 'typeof_unqual(const int)' (aka 'int')
> > 'typeof_unqual(__ob_trap const int)' (aka '__ob_trap const int')
>
> So how can something be called a qualifier if unqual doesn't strip it?
>

Within Clang internals we call it a "type specifier" keyword with the
closest analogous thing being _BitInt. Even the attribute spelling of
OBTs boils down to a type specifier being applied to a base type.

This hasn't been clearly externalized in the documentation -- we can
work to improve that.

> (We might already have had this discussion, but I can't find the answer
> in the LLVM documentation page and didn't search our previous
> correspondence on this).
>

Justin

