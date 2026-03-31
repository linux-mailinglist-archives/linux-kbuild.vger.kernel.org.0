Return-Path: <linux-kbuild+bounces-12434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLFgOIsPzGnGNgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12434-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:16:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EAD36FD53
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE6AF3044B9E
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7023E92BF;
	Tue, 31 Mar 2026 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S3VUrCJh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2925833E348
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 18:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980477; cv=none; b=lPJgFCtYZNsIukUhMBqraTPn5v0B1CbxZGJHZ+e3aR1vNcMhJxc4HdGAHySvFsE957s1dLjVLQkT0QF471FDGg/DQFbgG64LmHRSxZTDoJGr/TddeguKpvLQIXHuowkypdTeoNmcs7mkSzlC3r6rvy+XmJo2Ja5sdhb7iU7baGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980477; c=relaxed/simple;
	bh=yYwYSvStBtvkzXPBpl2nWuw/hu56cAHxTk2a5c8/rgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mb7X+vYhkb5uqYEVhWe3fDF+BC4FhML6P8UErewSB5ztt6QTbXuvXxYqaDCL8SzrnLyfL5Cco3Muzsrm6wyLpdyvKle6cwoBI+sJ9LGpx132Qjcd8sk2mY3KhXXw06dXtGMMz7hG4D+G+d8O5CGP8Pa9pxWdptgdtwXPkYv/nbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S3VUrCJh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso215150a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774980474; x=1775585274; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TkZ5G8hekNnh++59TEnIGYyFMs6NypLCJp05Fo+wpQo=;
        b=S3VUrCJhmhGEaEqsXT2KOTunKSU7Vdyy7udEWPHI02QOS3zOvuyuYfdHXxsg1MICdO
         bwGSheuHb225K8YoxaqbfhbU0dP0267p+eAjh0Gsj1gLXnnxtXEoq6v0H6J27tIzSLCG
         vRneY2VHxZGzk+hBjjDf3FEbygD4NZMJixrTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980474; x=1775585274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkZ5G8hekNnh++59TEnIGYyFMs6NypLCJp05Fo+wpQo=;
        b=gl1+6g/K7pbso5+uK6PBVgYnOgzZn4xi6uoCjxA0GRKXACVh/LDwZDDrltSRC5dXPB
         5fPFbCPx4Rn6G51+YbykVKPezx/ljmSoj1ERPC5EMV5wZH+jrR1GoNPLph8c04/m0YGZ
         GnHS80bRBsv5rJMLFvPxZW9BvyQ6ty+iEto98BbW1HVOQaEmT2jmOQ5ORKgUocXVg7F/
         edeLIeSBpFzabwTiygV2Slt/j1mDvHFqz1rSGRDIsVOeluBm+7mLcKLXcLXOv4s+cFxl
         UgoyBkNRdR8C3G4qG+QR2FCeTQ0QctkYe5rgrNb3y54Le9yiA/O9wvdMLfaJ0Jvnr0AO
         w6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUUh0ow2M1uRQF77dbkrtFyPkvtcEmdSnEqssCEnh+NnostCL+qAGPR5IA54GJf2idEa2700uH365YdS1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmHXp3c9RH5N/yCkragOWBy6y0lDFuVYgfZ1Mau/0W9HQPDGag
	jwDIK2UpKCdytSR8s88g2/bNZo8iaT6Erns5RFAn7pag8wPf+ETlh+zZGgnun6sUZKsj7fZTAGA
	yB+g2N7VTJQ==
X-Gm-Gg: ATEYQzz8MCQDmQTTwLFklnSGsmEV2LFNImojH2Uv5I88aMVnTkVWIzBfNyIXDb6u5/o
	RNVatqhVHOJJOVEqj2gF3rRIwlTdNtaj+tqmQ3C+waBoPj+f+78XDYtEgJRRVojMnLjYEL3JbUQ
	a1qeH31SOZa5t8CijrM+11xnHG4BnaNBOmhPTPDW2cViPNVlXjs2uGNH0bpaZ88YfQpiCRw6U0+
	+Ceh5eSCeTQySoLiY5JbBQRsKTmjjXsWQjOe6KVar4BZLYHZaXHoKkvoPxPD0uvA/LzgD2ULP8N
	ZMLWts+UwlLVPdvw5UdbhC40Mghc24gBFF3Ux/xoxe31b+6YuAWgcBUOxpaszdym3eEaMdSP22Y
	6evFI6GwVZYRCnBVglOxvE7cNRM1YMWXUkNGw0ewAoxWsWCSnhpfQvIXptRKGElFqcka4zdzKhC
	59/OAhIwAVe8N3pnwWvQe+U7WdVuVTu++rxTtdqEolz4jEetfhdyjxx+lWwaRVvEA73bws/6Vb
X-Received: by 2002:a17:907:d1c:b0:b9b:de8a:180a with SMTP id a640c23a62f3a-b9c1597c3bfmr16955266b.23.1774980474184;
        Tue, 31 Mar 2026 11:07:54 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae515fdsm426769566b.17.2026.03.31.11.07.54
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:07:54 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66d65646c65so339029a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 11:07:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnnDztLeb/Iz13qTg3XY47wXC2bL27DOMKmo3UrUuPQoHzJlwYElZJaVozyacLmxuTlqznrvYrVIpOmeM=@vger.kernel.org
X-Received: by 2002:a17:907:984:b0:b9b:9e51:ec9a with SMTP id
 a640c23a62f3a-b9be8355c7bmr264682966b.7.1774980139544; Tue, 31 Mar 2026
 11:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com> <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
In-Reply-To: <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 11:02:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
X-Gm-Features: AQROBzAduh7vXF0_QXfzo1P8tgp-mw59vEL4E4A0ltej3_oceWZyw3iWH8NeT84
Message-ID: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12434-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 68EAD36FD53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 10:48, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> In the Rust side, even if those "explicit" types like the
> `wrapping_u32` you suggest exist, we generally use the methods on the
> normal integers instead, e.g.

In that case the types in question should always be very much opaque,
and not usable as-is by existing compilers that don't have attributes.

My feeling is that that will discourage use enormously for when people
want to just say "yes, I know this wraps, and it's ok".

That said, for the *trapping* types, I do think that we likely need an
opaque type, because I really feel like using

   trapping_u32 x;
   ...
   x++;

is a complete and utter mis-design. It makes the "x++' have random behavior that

 (a) cannot be recovered from (maybe we're holding random locks)

 (b) is completely invisible in the context of the code, because the
type may be somewhere very different

and I think both of those are fundamental design mistakes.

And no, "dead machine" is *still* not an acceptable form of "that's
not random behavior".

So I think wrapping and trapping are fundamentally very different. The
words may look the same. The semantics may often be discussed
together. But one is explicitly marking something as "overflow is safe
and expected", and that's the actual real SAFE case.

The other is saying "overflow needs special handling". And the key
here is that we need to have some way to *state* what said special
handling is, and we need to do it at the point where that special
handling is needed. Not some generic exception handler that has to
figure things out from some unknown context.

Very very different things, and they need very very different
interfaces and very very different infrastructure.

Anything that says "these are two faces of the same coin and are just
different attributes on the type" is simply broken by design.

                 Linus

