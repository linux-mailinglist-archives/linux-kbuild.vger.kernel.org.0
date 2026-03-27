Return-Path: <linux-kbuild+bounces-12310-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJm2JrE5xmm7HgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12310-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 09:02:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CDA340B89
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 09:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E50D1301BDF6
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 08:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82632BEC2A;
	Fri, 27 Mar 2026 08:01:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1A93CD8B9
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598495; cv=none; b=T70E0TaeEkR5XQoRzgZ7RVqsWc1V8bITsmqh//lJOcXbddJI8eEZ3FtN/JTy7eJHxBEpptFjhvm4D5pC2f/b9QHcbUUlwLVpQsE68tmBWiP0JD++Nq/jBqAUcl/6TeSL5oW2FPDfCwCy1UUF9/o0x5nP0fArb1bQVH/vQTcn7Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598495; c=relaxed/simple;
	bh=u5VEHiJyZVoFEpzPp8IWhx3oSssO/QYrmWzaVG0pNx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/ROk4hflFrpFRmrx6V3S1uxlFwpmN/DBnlElLiZm3QSDbMVczONjThwVfGHU3sg+SPDhPS0ku4s9csehcw8HMpFB8TE8BBoeuFPjyVqFtnKZaW1fnfpqeVKghcDIbxf1JRFXFkYe/pe8IKkqAyuRH9RV8gR5EG5St5MHbGVIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-41c0aae84e5so1318631fac.3
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 01:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598486; x=1775203286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJSO1Jy8gXJ3q0SyUcqZkfXUbxuRHoGqVtwy0Y1kZfY=;
        b=EFmKs0XesVbXCyv+roT4mRMjA9IKUTMjOOZ+qfRYM210WeseW7KckIpvUn78LCzXA9
         udV5yDhk0qCXF/S6yYW2OWoZyFxzJzMZKXxm9fB78snKcA918OQHNt2fqPrfMNIvyDZL
         9YATMFSdcDHPaenIOY4R1Od98PqUfzeZ6dhGq4D/x6oD5I/PIR1rnxzz/K0BV/0E3eI6
         kmDP+oDvLsgACMY9qDvNGXJNew1MhZ7Ra18M8NlELPbYThK01eqqCbfXEPdduEI1UPX0
         8RC6CfDth28yjbdBsH3h4wfSljT2TKz14WZ4ityIOez9CeRjca/ypWeomoLtdYgCmkk9
         vr7g==
X-Forwarded-Encrypted: i=1; AJvYcCWPnCl4m43LNB5bEVqG2qwsYVTIueiaIKAOYxhT7/gCAR9v7szXiQ7hzCyUN3ZP4r1XL8gOhk/c/tbugUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBh3SsOS7XcXr0Y8QhpUkXs9O8sHRztJnaR0md7kbgdPhLNUn3
	idmzAv6g6SUbSwgVPBmZZUncE7nXWgcrNvhaf+YXVo9TLUQe/D0ZI7NNJEAUNbv/mjI=
X-Gm-Gg: ATEYQzxeEAyxoLkRrW39/afOU156gQpvrBofswzmmsrE7cZ0tqJDvEhQ1P8hmSHaYhg
	r+zkjkhPyI0j8hBKxDxso3+c+7cnHjyaIpei6kYQ8t8heROcJ0hCeC2y5PeHkVUXdENPcV30oJ0
	VObfcaviIy6y+Z68y0QhvURK9eRvU6JTswpVAhyKVer2gqGdvBkKwgyQn2kgzBTgsbn9S4+v90r
	EvPE1BTksB3uPG6xgzWwmWhkzuTsSaFjaSQBDIp03L57r9Gk411EQ88dS38hwhwDjrl/Y5S9D8f
	LJXDy40YSzfT7sCFHrjycpTbYrfwnC2SdR3IXA4GwNR1omkitcNdRbEWH1aL3YxuuRlWiLFj2KD
	nuyYZh+Lp5bTwq5Ob+RNFBOQjSGAehU6H+BJZz68epV1vlNFa1xmdSRNxkxucr+o21zbKVfvvM4
	7TBA/yYK64CtkVnC5RCxoIHIGMfdOb48SmDgFnaF25L+CRJDQFKldBJ9D1IkJP
X-Received: by 2002:a05:6808:1b09:b0:464:bb83:2761 with SMTP id 5614622812f47-46a8a626b91mr668590b6e.53.1774598486131;
        Fri, 27 Mar 2026 01:01:26 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a7063c2fdsm3189402b6e.4.2026.03.27.01.01.25
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:01:25 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-67df618d095so1094444eaf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 01:01:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFuBmL09/2un/rws2q6hvamgqdMEcYvEoxMz54CiD6YOZKkmtSPGh41G2ewcFpmbk6VK+9kvuVC305W7k=@vger.kernel.org
X-Received: by 2002:a05:6123:132:b0:56b:5e7e:d3fb with SMTP id
 71dfb90a1353d-56d4a619a98mr460290e0c.12.1774598183104; Fri, 27 Mar 2026
 00:56:23 -0700 (PDT)
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
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
In-Reply-To: <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 08:56:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
X-Gm-Features: AQROBzCIA8XVkhuOJBqaPSt4vzM_veS-eZVPLLLcWDFZykO6P_Bu4uSiQhzQA0w
Message-ID: <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,google.com,kernel.org,arm.com,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu,physik.fu-berlin.de];
	TAGGED_FROM(0.00)[bounces-12310-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 43CDA340B89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arnd,

On Thu, 26 Mar 2026 at 22:34, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Mar 26, 2026, at 16:18, Russell King (Oracle) wrote:
> > On Thu, Mar 26, 2026 at 03:31:26PM +0100, Christian Schrefl wrote:
> >> On 3/26/26 2:47 PM, Miguel Ojeda wrote:
> >> > On Thu, Mar 26, 2026 at 11:10=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> >
> > I'm not sure if this is still true, but I believe it used to be the cas=
e
> > that the -linux-gnueabi target has one behaviour for enums (fixed size)
> > whereas -none-eabi, the size of the type depends on the range of values
> > included in the enum.
>
> I checked Debian's arm-none-eabi-gcc, which indeed still has this behavio=
r:
>
> $ echo 'enum { A, B } x =3D sizeof(x);' | arm-none-eabi-gcc -xc - -O2 -o-=
 -S | grep -A1 x:
> x:
>         .byte   1
>
> and I see the same thing for the hexagon target in clang, but none
> of the other targets that Linux runs on. In particular, clang always
> behaves like linux-gnueabi even when targeting plain eabi.
>
> $ echo 'enum { A, B } x =3D sizeof(x);' | clang --target=3Darm-none-eabi =
-xc - -O2 -o- -S | grep -A1 x:
> x:
>         .long   4
>
> I noticed a similar issue with m68k-linux, which has a bitfield
> alignment different from anything else on gcc, but uses the normal
> behavior on clang.

Ugh, I wasn't aware of that. Adrian, did you know?

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

