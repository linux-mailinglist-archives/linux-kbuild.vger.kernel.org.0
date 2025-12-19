Return-Path: <linux-kbuild+bounces-10275-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B743ACD1EDA
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 22:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B9033068D52
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 21:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56075342513;
	Fri, 19 Dec 2025 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PwDuScq5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916BE34107D
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766178602; cv=none; b=SB644MVTrSccvZsOF1lYK6wFqvqBXrwFZFH1enLDOr33XaQrGP6cahR2SHoDsymCBFGKG5+gxrFH72JIWMXM9hUZ8nzWIOs34d3V1kgar11MJOfE8WRT18Xccs2Cpz6+ZaETxbo2Vom8wPSi/cWZHW/W5qN3PERSQCD1mUftcWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766178602; c=relaxed/simple;
	bh=iqhEYrpWgm5Yfz8pxMwX3Z8XLhEcxpfARdS1KcSLhis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkiWWJM/GgwD7PgDh5+wLUC4lGInl8e8Uh+gTVVyjfLGADkr+QAS6V+RVjE2Fr70sF7batYt+kTUQ+iSp0tLPG0uguV+CcVqG6HP7u2mkDQhW3VF7FDYVK31mya+HH5oIAyfd8f7MAjg2f8rMYLSO6oPYf1zSY9Vz0IbzKtq0S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PwDuScq5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c902f6845so2865728a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 13:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766178600; x=1766783400; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iqhEYrpWgm5Yfz8pxMwX3Z8XLhEcxpfARdS1KcSLhis=;
        b=PwDuScq5uKrCO6abf4MvGNoS2mKDzBjKYJ0bmhTBciEbsfEZPL8W1fZ5ueco+n190+
         qC1SNl5YEtS1IdQ/tG+2hrFXMcLWkoZNRGb7WSoFCc3nf3uyQ0oYiWaIk9rZT3MVChUE
         76yw3iWuODcst7Rk/h8qgT9xHw66X0aJxXevk9+1fAOZCe4xf+4eA/c8FafVYwoKBlU5
         KUvXkGaunNgrVUUi3o22zWzLA1Uke1H2puCSY69VY/PPYf9W/kL2ph8YcbNGmF8Nyw98
         uf17JPqE8ARf2s05s+jtQV6IPGBqoEcmOsvlG3wXi4bjlQhVclB4y6KQ7Zl/NZVJ+D+O
         cKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766178600; x=1766783400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqhEYrpWgm5Yfz8pxMwX3Z8XLhEcxpfARdS1KcSLhis=;
        b=SLgu48I7C1QJUkRxpJ64bjjCm84NjJjnAXxqr+i2WbXVRXEERRmfZQBhNXHK08vgDK
         S5ANkakXzo2I2XBm2zNBdswkTOXolXxZxdQzSo/t0+CVERYzcYHV0jSFzT6uAQ5E7s9M
         PZcJzZMN06xu8XEmdcs6klRVpkqv4jz31ILV/nZJeDBrdndo0ohhDyAJmim5Pz2r1irM
         rZP8RKoAwW6vfnCuG8cSra1ThsZI72mBOEvtL6bMRBdLWKHPs2VZHkaW8/JtQuJDtp/t
         yK2agV+SC7BettF3SfYT405CCPmML+4K79Sxpoh7/PsWu9WeH7TWrdZP+Jz8eltr5aEk
         NgSw==
X-Forwarded-Encrypted: i=1; AJvYcCU/u+BLfQRihPT377wnPqUugTNwEtGQFTSkozeHpUv/q0zT9Rn+e5QyXI4hNZZBXLFBcu8SSBD5guIl3Y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YztnGIzMVzFi1mGyUFM+HxdV1qfJ3w0ws6VhtK/ESjZ1dIUvAyG
	ip+OGgT0KLd/7AIKA4WlMGaaejLGI0q+TzpKXF5rEm9HFW5hd51U0rXo+LnTWg8y/EHUkthVeDk
	B+AlFKzAeNNflbVOCGKzbK3eUzsCf40rKhXhpsFJ3
X-Gm-Gg: AY/fxX5ANED4kKEX2wVljFNOo1gaXNazV5bWsrDqhvpqI8jrMCY7RDtJctlnpJfGM+i
	MN01/6ONjX+75ge5abDGfSUlqLshVGZJt5B5GLclZregFAr6M0lm81iai3lQBRiSyGCZnB2Jgmi
	vXB0JoHDA7YSVV+QvheQyWJfhnHNsHqSpO6NwxOwPdradU0naOM2kEwXyQGEP1SIex4e2tfQ5YG
	xDFKQdDuryUDXP4vdxcQVTVzFaIHlvZK/Qyx/p84EGq3TV+lJbcb0n3yj2ncDWrwtilelbqDMsh
	789NTBtgx672HB0d0v5y071V+NY=
X-Google-Smtp-Source: AGHT+IGdr0jH8cGEaDB7eA0QDwFP/5Ve8WscN7cZkV8XMcvDcmhs6BtuLqrVUM3kTfn7w87OZJ/+kODUMJAxXUcmHFc=
X-Received: by 2002:a05:7022:ef0b:b0:11b:9386:7ece with SMTP id
 a92af1059eb24-12172309509mr4284248c88.43.1766178599422; Fri, 19 Dec 2025
 13:09:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-14-elver@google.com>
 <3b070057-5fda-410e-a047-d9061d56a82f@acm.org>
In-Reply-To: <3b070057-5fda-410e-a047-d9061d56a82f@acm.org>
From: Marco Elver <elver@google.com>
Date: Fri, 19 Dec 2025 22:09:23 +0100
X-Gm-Features: AQt7F2racRCVQBtX1XHCEqHFLvRozCqLgqx9fCp_0Wp28A2qceHYZ0Bj23R_eEk
Message-ID: <CANpmjNN6QrxwUUkpAopTfxLwUqGfB53J96dwOWHNcoYrOrEocQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/36] bit_spinlock: Support Clang's context analysis
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Dec 2025 at 21:48, 'Bart Van Assche' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On 12/19/25 7:40 AM, Marco Elver wrote:
> > +/*
> > + * For static context analysis, we need a unique token for each possible bit
> > + * that can be used as a bit_spinlock. The easiest way to do that is to create a
> > + * fake context that we can cast to with the __bitlock(bitnum, addr) macro
> > + * below, which will give us unique instances for each (bit, addr) pair that the
> > + * static analysis can use.
> > + */
> > +context_lock_struct(__context_bitlock) { };
> > +#define __bitlock(bitnum, addr) (struct __context_bitlock *)(bitnum + (addr))
>
> Will this cause static analyzers to complain about out-of-bounds
> accesses for (bitnum + (addr)), which is equivalent to &(addr)[bitnum]?

Only if they decide to interpret never-executed code (i think the
kernel has various dead code that's optimized out that might trigger
static analyzers if they analyzed it).
But this could probably be improved by using a different idiom, and
using an empty inline function that takes bitnum, addr as args, and
Clang simply takes the call to that function as the context lock
identity.

