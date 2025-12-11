Return-Path: <linux-kbuild+bounces-10066-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A11CB6026
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 14:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 641473005B94
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 13:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E497313278;
	Thu, 11 Dec 2025 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S3sYjDGk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CB2304BB8
	for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459539; cv=none; b=o7gBnjq/xiLa4HUAkVj51NTktCIRwia3YB52C/KGsAuRuQpXqe2mf2RTPzzzW6EFXycLrDtKImG47H4kwvP8rsSg4qMKrt1D5pRnbRiHKU+v9eZSGrhldvdxkwFGYDtMa6daaO32et1NoAj2fDuE2CxpH/vk9SJhlRECAdELNP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459539; c=relaxed/simple;
	bh=4koDoOQRFcQ8EnbnmmJvgwasJ9ijqSyJnmmWmgQ4c2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/lBrGkkKNzfMZ8r7NS9XdEhxylaqxznGcKnL0f4FkMYRb2NcfYlVB0fo9SNG0tI/OCmqqqi2+SlD11/MwIVEvos/0BOWLVtFcEOXyEOeMj9pD+y10nPHwWUXPXFXSMj7LTYSxmmPsfTsqMV9h3joJ0Llv6DPKmARhuA0R0Scbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S3sYjDGk; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso43101d50.3
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 05:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765459537; x=1766064337; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bWA/kjxAjN+uRNvgRsuZ3C4JKMpyTL0y62dCZ1FivCw=;
        b=S3sYjDGkvoZmbdvrKBBU43ykeWBEyeIUzGZ1bUJYcShsHuHKiW4SEI2gYcMdxdZWwk
         2aA7slM8MmQr4oatTRXGZSDUu9aaPNBM5UXKIo4tZu3aBCHtdy1H/9eebAGdUo6qgX8L
         DvHj6zwUMUlBjO2u0UJVOCuNjgIiGKpFJ3xkH9rQCWgifZulMuykpqPtovrI/gQQK4fX
         tWozvIJabkt3lh8qlKQzKY5OQDpzBc2BgZrGHZlvzzLYrhdrhOMCB5DCqM/inYUnmrTm
         BOMqEJRR2hhdiarGzrCSpdsUJZAL7hGLrXSyYC+4RigvkTH6UsHPfhyza3j2GXbJnMLT
         uY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459537; x=1766064337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWA/kjxAjN+uRNvgRsuZ3C4JKMpyTL0y62dCZ1FivCw=;
        b=OE7lJedQhDBG8m4O9Ug+4cMWh3uOl2zV4XPsmZwiYecsLGQiSZcOxSkRRiXO2gYw9d
         SJfIbgxhpXXVsYoUslmX4htJE8SLqaGofX3Zm0XF6h5Wv9SDSTHMK/vz7nvkHLxjfnbD
         81KAElZHcy5sZIffnstmbxma5cKI2E6BkSGwAoHF1D5h63Wrh8QKtJi4wWkFsTq8SanY
         Vr15yiWdb61CMW4Hf/zq5TqIY39KPLf9kOnGLIOAWUFrFngSTGNoYjMybb6uwTFkVTrw
         I55Aj86fhwJx+rAzIzR/UUTFNR9ZYIfD1j6OfTwxlPLJeqxOnKuazZ40wnWp+AiXbLcO
         xE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUdULNmFNgRy2p/1jDZVPal4wMSafny33dQnzQaGlRJqCBOndKx6UCouNxKg5advlPI40J5ItFxUeTl3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWqjJo1XWIKS/pYTJXfxBm2rN5RRp7V1Y6IoFEIIghObL7LduJ
	hHHEzYo1WOJDw9hP9LvIfUxf/3T6ZCRj/NlsZ9k+BjqkODGo97UlOooPuVRXL8G89v5BT1vSMwn
	Jw+5KaiSip8zmR2PdovFToHp7AnsmAzc6kqV9f3FM
X-Gm-Gg: AY/fxX5Y6Uq2MJLpuQoE6FIr14L054nGFker8qNrlm2OFnqRI+5Uj+eIU1iBG3Odzn8
	3F1cXlYyHkvQvYcoMko0evSg5aWU+wmQkF4a3OMUA3We7d9zKqR96JiX9q/yXf0C5F8ON1qep+L
	9HuSxw2MQBj5y5FzA8DfIujPpWTdo30ZgTt9AkzU5bvdt6d5bAw3qH6FxmcK6vYlMz9G+d3j9VW
	ikLsoF3dQOjgJWVV6v52l6O3yYeYIttyzc45N8Jv7rsiRgh2IjaisYMPZfaaYA/qbmg5DN3aN4a
	8CsrU3Dp1wGAz/8o4CrXjGy9e1mWiMk4SYY=
X-Google-Smtp-Source: AGHT+IGPj4VYuvzobJuySeUtMjR2owpUV9b14snNLjzBypYDLw2+crQYToZkiUGcBVWZIJW//ll4Or+5K7PYShnu4As=
X-Received: by 2002:a53:d01b:0:b0:643:1a78:4492 with SMTP id
 956f58d0204a3-6446eb6016cmr3860639d50.81.1765459536448; Thu, 11 Dec 2025
 05:25:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
 <20251120151033.3840508-8-elver@google.com> <20251211114302.GC3911114@noisy.programming.kicks-ass.net>
In-Reply-To: <20251211114302.GC3911114@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Dec 2025 14:24:57 +0100
X-Gm-Features: AQt7F2r5KNsATXW8d-J0gXHLFG6W_D0lOL42kIv9mnu54Km1ZPN_9U9TSDd09do
Message-ID: <CANpmjNObaGarY1_niCkgEXMNm2bLAVwKwQsLVYekE=Ce6y3ehQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/35] lockdep: Annotate lockdep assertions for context analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, 
	Eric Dumazet <edumazet@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Johannes Berg <johannes.berg@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Dec 2025 at 12:43, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Nov 20, 2025 at 04:09:32PM +0100, Marco Elver wrote:
>
> >  include/linux/lockdep.h | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> > index 67964dc4db95..2c99a6823161 100644
> > --- a/include/linux/lockdep.h
> > +++ b/include/linux/lockdep.h
> > @@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
> >       do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
>
> Since I typically read patches without first reading the Changelog --
> because when I read the code later, I also don't see changelogs.
>
> I must admit to getting most terribly confused here -- *again*, as I
> then search back to previous discussions and found I was previously also
> confused.
>
> As such, I think we want a comment here that explains that assume_ctx
> thing.
>
> It is *NOT* (as the clang naming suggests) an assertion of holding the
> lock (which is requires_ctx), but rather an annotation that forces the
> ctx to be considered held.

Noted. I'll add some appropriate wording above the
__assumes_ctx_guard() attribute, so this is not lost in the commit
logs.

