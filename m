Return-Path: <linux-kbuild+bounces-12352-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGh+CJxoymnG8gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12352-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 14:12:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 902A835ADA4
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 14:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78FBD3046F00
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 12:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D452E3CCA1B;
	Mon, 30 Mar 2026 12:03:40 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ED14315F
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 12:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872220; cv=none; b=G5yxVkjKZIyLVuL3TfirQmFycj9UAIU4cQIqSX+uu5WjX0vIEg+HE4Dce+2BlwHnhPIF7Z5t5xuKUIoAxVf+OhFYKNFDIcxoy8RGb3m2cq+hWZpGZImM+YlOFHqTMtZq3n+9OS+97//iOoM7Vdfo6hVCqxAw99aGc4bjg/N1qN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872220; c=relaxed/simple;
	bh=uPLmde8JX94NOim8jdD8HXIjLFjFh2qnfPsVO0hzcyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hup4yBIjYzqSmqxo7s0QzrNnws+nIkLVzvtXsK2YnnKSiVG4ptlsLaNbMXgVlAkKm5HxJafRzUN9NxzOkRMySpS78/+/n7G/GYzEzQeU42s960VEwkCoXaUrE9E4lmmt83cCz58tlrJH+N3Hw/Zc4FZF9Bhsig0/sf/CwdQfHdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-953aacb9d78so495764241.2
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 05:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872218; x=1775477018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7JyzGDh2V9hD5ppCKHdE8lqc25UY6zaRA17P+pQPiE=;
        b=QJJf/ccpOXCBO6jNydXvga91ULk52WOHm5GIVrWqwUJHaO6Mym8aK8A6AciasG/pc+
         hzppNdLFOVr1NZPPJwC7xmn8ylSJWcQ/B7PPj6EMgwGPtcMwaX+NHUXCoLmcZnKB6meT
         vFWQzDdpyO4SSHGrJxsbU0F14C6I4CgNM3htVZFTz5Vmclo9MHYzC3ZnM3Me/3B35myr
         uZ5BRRLzCPQ/0ejU7ea/qTogC1Pu16YecvpgRptmT6Cwjnn5g3qX7w8krmDKnKlHZYsd
         iNo+tEZj9XxGnVndSAUkI6SdQIEY4NF7nEzwrU9jgYmLfqtJVwMkH6F/dvr9eQkhQJWQ
         /jIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSn5wYEX7kAPau6Jqp3RQWVvxWlrYlZY9ih0QiKoH6k0vQerRfkMKcRhT8KUq0O8SR8IpJlyoShvmhak4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+FYXmSNhlTs4ok4v8Q0oqTeuXUBxASxdTEyvfNrYJPoYj5Z6T
	/ohLkHR1geYgkdGI7faNGlocWTDXVyHbvxv/JqP6ETh4SbVDn4RSXOmOmJK+m8tX
X-Gm-Gg: ATEYQzxxsDOE781fqB1Im7Sl3CG32kQxQjERDm79ioAQW+cXA1H9yF9FFPElFx2cz1E
	3IOyOfkt78EkqMX8W5FAfS1cYdnxyO8ch2XbdDkX96ea+ri5k0mhz4Vd8+fPX4OJev33gFKeuW6
	QtKJbZrqlj8YSEcxcNQGT/9mO7MU7U4qFa+Y4pUbBqx6akr3+z67N/xo87ygLNxr3JeYzWvrBzk
	g0l7XPmfvzrBNI1J1yXsG5nhUQeuRi2vCXtNss9Ix2qBH3N6cp6r58UWjm2MDxPy3SfL/vg1/xn
	Y4xmqD1rO7JINfsRgmlC0Xid0iRsxJ5NnzNNAYgN+3omBJjRbpMtyIcRLkCaAD0Kri6TBZnvwHd
	8gL0KZK5UD9zslKX92SYr/4C0SX2nON/bRMNcYsoKkJqxq7VS//yswaUf7wQJetLc4Ukmzyp+3f
	LTlKR7JktYv8jWYhB4n/Gl0VETdhqZf0muYzKfWSeqK28kPV0BfDA7i9/uFAwXg1AM
X-Received: by 2002:a05:6102:304e:b0:602:95a8:c665 with SMTP id ada2fe7eead31-604f904e307mr3532406137.4.1774872218035;
        Mon, 30 Mar 2026 05:03:38 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a4eb23sm7806409137.5.2026.03.30.05.03.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:03:37 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56ce54c8c82so1287311e0c.2
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 05:03:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkvvNU+7NRe3c8AXhBoZ5W5aPAoFDiuqn0K7NAnDxF66T7K08cdBBUgtMZajaz9Sm31finwgfdlf0GkbY=@vger.kernel.org
X-Received: by 2002:a05:6122:1824:b0:56a:e46f:2cfa with SMTP id
 71dfb90a1353d-56d4a5f2e5cmr4217124e0c.12.1774872216490; Mon, 30 Mar 2026
 05:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com> <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
In-Reply-To: <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:03:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
X-Gm-Features: AQROBzBixIQPiuCOL0pIFbgyC_M26WMZwTpKOw623Sg5KUyDyMzQqEZKs9RSoco
Message-ID: <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
	Gary Guo <gary@garyguo.net>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,google.com,kernel.org,arm.com,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu,physik.fu-berlin.de];
	TAGGED_FROM(0.00)[bounces-12352-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 902A835ADA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arnd,

On Fri, 27 Mar 2026 at 10:02, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Mar 27, 2026, at 08:56, Geert Uytterhoeven wrote:
> >> I noticed a similar issue with m68k-linux, which has a bitfield
> >> alignment different from anything else on gcc, but uses the normal
> >> behavior on clang.
> >
> > Ugh, I wasn't aware of that. Adrian, did you know?
>
> To clarify, this illustrates what I mean here:
>
> echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-
>
> this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
> thought this was related to this 2009 change in both compilers

Oh, now I remember.  AFAIK (holding wood and a rabbit leg) we don't
have any bitfield members spanning multiple base type instances in
the kernel.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

