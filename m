Return-Path: <linux-kbuild+bounces-12449-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI82FHk3zGn7RQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12449-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:07:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF993715E7
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CFC130B02AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE7C43D50C;
	Tue, 31 Mar 2026 21:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Nq1waGM0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F07421A1C
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991073; cv=none; b=WOP+w2jqQ8ie2oCQ0i6MgZ0orcVdebB7LX7FLWmB2VSXgZtkpTfY8jzlD2Af2Z6JIQKjua/omBf7PUD7quxUGWCdwNJGzX61k+AZE+1YOuYqB+b2GqZONewr6zYfA72XRsBNlCCsU5Qy5fedwNb4/56DRIZa5XaRTwf18FrUwqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991073; c=relaxed/simple;
	bh=JdtX1HxX10vKkEIJTgN8UNt8Jx8wkMFYsFGA9S+Pp3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLj1+wrCYrJWJHEtBiyLKG4J6AAVAsQU88CUA8RXupa6nMtvlrXxObrHmQWeefAXXiq8VFAUz6y5NEvkHfxGxYRpK+7z4D3I/l0nlxgzknT1tnYyRaEFAwc9x/g4y/dJaskzDUXD3ZDOkm4iUo/maZR/q8Cw9l/JYsg7GIcuncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Nq1waGM0; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66dd0531d01so195713a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 14:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774991070; x=1775595870; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dPaiD4OsZpalA+NXE9JYeLKvQIkP47+Rdll9Ghzi+s0=;
        b=Nq1waGM0XWaKz+a07dKwiAWlNyX5XDHpe+44+STglDKEU6ygutX44ctiFdvoQNE2oh
         RyC9wP5V9OKcBtPyVIP/JsiJWItVkEy81rASGBpw4HZC9l4ZLCzC3Mwq+hZX5530Gn2A
         asaxq1TqROuq65GIMSCU5KjZQrh/meD34rWMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991070; x=1775595870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPaiD4OsZpalA+NXE9JYeLKvQIkP47+Rdll9Ghzi+s0=;
        b=rOd0H8EfFX1iHI1RDNgwhGPUJUyJaPFBkMpO15W5AnAlfUX1dvNAhldSrMlmrPFxju
         RlsiotKrg6s9hiil+l+jBcHWl7iiUo5FJxWGO+hWGGsszTYfmdUi+lAEwSxjLh/cJBeV
         plo3W3zMSuMu0hg4cAKoGk0Hnf+aWAu2QhpiM5oxfqePfUTWWOBjzsLZ6uQGAY1uuOoK
         fGXCZIvO1C7REhD5FnNB0XNFdvbovADcAorOXvVST2T/mHQOav2+fkOFttee+n3HI1sW
         dEyk0mhhBSgk9fy0obalbKiaHcGFzQNO7f+Sf04eZXI1IZq7ZJuc/3Z9KrBgv1VWItYh
         eTyg==
X-Forwarded-Encrypted: i=1; AJvYcCXb4BKGNZvhAsQjHxngnMT3KqBrhCms+DLz3Nc99LmVPaiWkOkULyyqAsMINf7X9IA1UlvygPNtu2is0R0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZUrP1YHwOq7AQG8r5ZQH9YIQhL/jfl9tI+ux269RxwaPiKha
	5vU2nUyeYGy2zngzzasPM50exSbqeCl7EN4DPMp7UIzzVw6yicqHui2rUZtAN0HG3GZ+3UEC/C3
	SxhsRtvhKFA==
X-Gm-Gg: ATEYQzxbsgbu+SEPs9cJyu2FwBtTabb75UBEkQ21CLVn/y1Y+3qqP0GiiqSHdDzh2JG
	2sKpwOf8XkNO1LgQqoQJQ79RgsGF+WN/5xq2w1d6yFXKxwaC+IaGs8v03B6+5DPKuLySWAuzw0E
	YHVaUXiXJaOvwOvOtgMZ1BwoRTfBCzHUujepRLl1UUha+Cjvkn9xQ3KzMkOR2CECryzRDp/fNk1
	BsPbJ80zkMK+pL4DWt9u0n7zVmTVp5+I6+iThwxsAJQwieNdkdDH9qc1aGJMYYJ0LsMZwpDIG0P
	aKN5m8Cp8qELGsksA6/07fKsjd+bq+QiZ7vMHHJ6MFvlRfqVTu6BOLGI+mzew9fqYkHUGrdVJnE
	XbpbjjjYe65eeNbZ4kb3alDk5T8ecTPRVyP7SbSXOL+ZKy2s2aEopoXgFo8eYwiB19nDNzdm055
	+ZRtOqZubvQrd29jEg5uxCrCVqH9nXfZnlugxt1RBFd2J5Vg0cVUNcGXCZTliqaoJ+I3puraKB
X-Received: by 2002:a17:907:c297:b0:b97:e32f:7ee8 with SMTP id a640c23a62f3a-b9c13b50f35mr70062966b.37.1774991069891;
        Tue, 31 Mar 2026 14:04:29 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1ee612sm449548366b.53.2026.03.31.14.04.29
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:04:29 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so812385466b.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 14:04:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzeuCDXaD+peT8VRercdcqfc1JI8XDdzdLqoo+F4P0aS71S+WD7YH+nfIlPECBRdeN4rwiweRF3hinorc=@vger.kernel.org
X-Received: by 2002:a17:907:84d1:b0:b9b:1b9f:8397 with SMTP id
 a640c23a62f3a-b9c13b0a2a8mr62577666b.31.1774990733647; Tue, 31 Mar 2026
 13:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook>
In-Reply-To: <202603311321.4EE9FEA@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:58:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
X-Gm-Features: AQROBzDlSIWhA3UXAi4kJQxb1nvYqS4u6S5fbtJpBgdW6doJTV11HfE6t_3dlps
Message-ID: <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12449-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: BDF993715E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 13:31, Kees Cook <kees@kernel.org> wrote:
>
> (Isn't this just an implicit "try"?)

Yes. And I think that's ok.

I think try/catch is broken for a few reasons, but the fact that catch
and try are tied together so closely is the main one. You can't "try"
inside a scope without having the "catch" inside the same scope.

So then the solution is to just move the try to the outermost layer,
and I think that's pretty much what everybody does.

But at that point, why not just move it *all* the way out, and make it
implicit and invisible?

Which is kind of exactly what your suggestion is all about, and that's
why I like it so much.

It *literally* fixes try/catch. It makes the only really valid usage
model just work better.

(There are other reasons I dislike try/catch too, the whole
"exceptions across function boundaries" being another one that your
model avoids).

                Linus

