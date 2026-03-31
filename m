Return-Path: <linux-kbuild+bounces-12426-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GzwLFcJzGn+NQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12426-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:50:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E6036F61B
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9793300E484
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C243328371;
	Tue, 31 Mar 2026 17:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="O2LzJAfJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3970733F8C5
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977563; cv=none; b=iWeYU5vcIcuUuZypeo3ecOW6KOlYoMBoVELUSqTgOIHAeEPkO5BFVlFr62+hFa2l99XP7OSYTKOXeEArOvw09hCP7JtsbmvCjwXsLCy/Hon2LnxJ5j723AM2huNmx++To5o5yXWEPk17b5n1Ek8u4980h3kaLrH/X5nItqUlacQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977563; c=relaxed/simple;
	bh=fvOPupQEnVmV/NcMv1g9ULLTpQ2SLYsqRQYOCWOIjsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOlGN9agDpl8h1ueLYuXZ7cTQuuT6vKnlQSl1x9QeaGhMwueI1BWA8d4ASzbRzB/KOw9oHTvFylgv6QCNkgjQQgx1XuTzf09pr6nW8qNYVsmcX2XYSuI3RHmncmtPWno8B5usEnVaaa3NprjuVnrS5S+O2pC2+RkoX1DXYf8Law=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=O2LzJAfJ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9382e59c0eso960335066b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774977560; x=1775582360; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+4YPeQId4Y1cXleVK3wn4GXPFCaXiKdSrMa6qJPwN4=;
        b=O2LzJAfJ/EXdE7VNoKot6NIdPuBbdPf9fD0jmLX/oZ6rR2+kWaXkFvCzh3jBEeJD+K
         Yi4wXN2H1B6za42ARp8PdO/g84uzbAVs0/8/Io8ZTLrWtp/1WQJPiae2StxrBNmVRquC
         MnT9h4YnzipIWmlYhXvqhAtvis4AgxkW/Os7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977560; x=1775582360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+4YPeQId4Y1cXleVK3wn4GXPFCaXiKdSrMa6qJPwN4=;
        b=kOJ3/jFe3o8c8/eCs0IyAhlrC1XjBf1NheNcilBq33WySb/bR3xsEhU1QpLrnEoiSF
         lX52O+9JNcO6x9tPyyfdfh5dz8CFShDMRy1iocLmsWRpaAEwszICd25kZsbtmOXiiAPe
         TO6sM7XSNB2ZnhgxMUR2P2Om/oBZtZaEQgtGr6ukMiNrOcl7rPYwtep7aU363IVGW+fl
         4o2KBC4+BqAEoT0ANo8m+qc5PFeHPWEd7DNZkbcWT64OG/t9m/IgRVf+aesvabR7acg9
         4h5gZczKyIq9LQmDb0vaTErRp6O+9biBmMiHk7EdnHvfSqDSTAUCwduCdsqjwXHMNLFU
         OXkw==
X-Forwarded-Encrypted: i=1; AJvYcCW6JQrwNILapTnvxVdZ8D6C4At6mbJ2qBUa3Lhx55uE0zetAZ6DwKyKF2qt8KX6UCFZNOpSckrkKbI9FDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRVnWydvgzaX7qpvOpxdgnyjXr7UQ4eKwHMR2UP0uZAG1/TzHH
	5qUcZPO3PN4D5L5ljup9EFENBuPLhS2pBjQTK984qsVzILf3+qtpukZ1/5R5ANsaQN+ySk8nlTm
	Fz+yoCBJP9g==
X-Gm-Gg: ATEYQzw0DZKIzNRcpa5GLw1/tgoGF7rq1X0CJDenxPLOIrzDHvXb8/jh18zjU3KOSoB
	oMb1wLYn0HWpmdUfC+wVpnB57XMnoCFI1rlvP+f34t5NR2mInUf9a3aS6cfdoVWUepf0ZLoGwxI
	Gpr85LwR9+EP5fJAYMe3aRyTvp5dWzpRTZd5tnBK/aQTjzwIaIa7WxgBSB037xRpwq/3zJiZUcL
	Uhl5CT8y0clCXCUW1rLrTqi87kkt+2Grq5YGnSPhEUD2PT1MaSJZp/tLmkX0OL4lPneaAOrTqbu
	M6WUpA2i+vGLQ6iV+GKXnDQuTLxTLZ9QBAPZM5P4jxejtFSZq5WTmzTTMCDZalFWHHMjCKcRZYn
	zqDlfor94z9mQnLqkSLAz3XmrkMmIfEBhRdSQ3TIQVb5WVMgkndCJAZ1pIX1cKfnsu3y5XItPB8
	E0JzEzv5U2fSNemSTeqPgMenAmuTSOtqfU45Q9koLp+uG/uoZYTnKqvynwirkG5FOziKnumAHH
X-Received: by 2002:a17:907:a70b:b0:b98:13b6:38a1 with SMTP id a640c23a62f3a-b9c13aead54mr28715766b.28.1774977560063;
        Tue, 31 Mar 2026 10:19:20 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0219ed10sm64193466b.41.2026.03.31.10.19.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:19:19 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9841aecf72so723622466b.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:19:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUviRoWipPCWiLjEeABQbi7kltDJOYTUrZe+KdoCmo9F/XvE6WzvxrHCfmvh2zlLu9F7i1R+ifyBHhGW98=@vger.kernel.org
X-Received: by 2002:a05:6402:320a:b0:66c:2ab4:1c17 with SMTP id
 4fb4d7f45d1cf-66db02ab9fcmr248797a12.9.1774977068945; Tue, 31 Mar 2026
 10:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-5-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 10:10:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
X-Gm-Features: AQROBzDm3gEHu3WZ_nfCrD45b6_U9t89WHlDWMoUx8NfrAs9jBI1Qm6jv38zdhA
Message-ID: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12426-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: F3E6036F61B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 09:37, Kees Cook <kees@kernel.org> wrote:
>
> Current straw-man proposal is single letter suffix because it vaguely
> felt like the least bad of all choices, and they should be short or
> everyone will just continue to type "int". :)

Violently disagree.

I'd rather have people continue to use other types than have somethign
that isn't visually obvious for *VERY* subtle semantic changes.

If somebody starts using explicitly trapping types, they need to say
so. Not just *say* so, but scream it at the top of their lungs. No
hidden subtle behavior changes. This needs to look _very_different_.

No stupid one-character things. If we go down this path it would need
to be "wrapping_u32" or whatever.

That said, I think the trapping behavior is unacceptable unless
there's some way to recover from it. An dno, that "some way" is not
the broken C++ style exception handling. That thing is pure and utter
shit, and fragile as hell. Anything that requires trying to unwind the
stack is just a complete no-go because it's going to be buggy and
untestable (sure, you can have test-cases and the unwinding will work
for *those*, but...)

I don't actually see any sane interface. The "unsafe_get_user()" thing
with actual labels and exception tables works very well, but it would
require wrapping all trapping operations in a macro.

Which is maybe not a bad idea - it's almost certainly better than the
overflow builtins - but might also be disgusting. Hard to tell.

              Linus

