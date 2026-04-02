Return-Path: <linux-kbuild+bounces-12593-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDgDLvkzzmk8mAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12593-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 11:16:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 142A4386AC9
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 11:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F2103014C3F
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 09:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321A819F40A;
	Thu,  2 Apr 2026 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5n06+QP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B3371CE5
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121236; cv=none; b=MdEgCK0nXKAOSsZlazRQuCVDSgRgPIIWV9KktjQ56t4jCuJGE5ihXkyuB4s4kPXsCboRoDFY2nWV1KVxIGzYaWjOuyXYVjzJ9Zx5Ac5ftcq3hbem78LKPgjgHHueVuTAgZ7en+Pe5d4fycqSkMhDwZ5B4IGHMpy5lrsFjd6bwdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121236; c=relaxed/simple;
	bh=Ue86H1KysRcjf2OINDQFXuIhBR4ESQnxLFwGpvhWUfw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YEQmJTvER2iIi7Hivyh+1Xb0u1Mdc0b5ZBSrEobH7COlcTze2YobW2WypehOdV6PgWfYcUBAp+YATMY44tsxjgHpEiOBMslG8kXf0FPSZjEkXWZb4at5v1vYs2MGCKRKKWdnefcJc9gZ7xt6N8zWEOiRtxKeNHHsMAiCvDpfmEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5n06+QP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so7733815e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775121231; x=1775726031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr0tec9oGf/SBDgbf+2rD33HNBftwB6KGbVP3Dhy5ew=;
        b=A5n06+QPfUFaXxI/M3g/2ZIAVBIeHbAFIn9fGxXft8XKXsdeYwFLrT028wcoA2aKfh
         ERiSVNU05FnkjivehGxg+oTWbZUwi88KjkNlqZNBuzj0EzfXGeIMPkU9qUDcJO13u42n
         Qc+ToNX90wZatSr1UpDFyAIlOAWNRj5Iey84lKGAC8oPZnFP1/xhoIVKNw/RSkQZhGVC
         LkZhmMkiERw1w+Lqwvz5S1IMxAdtRlgS991nqazXXwMC0Q5FFDV55aopH6vHp5gcvO5d
         LLk4BkcUPU5LEV1MeB/R4F8tSYVJqHiT7Ti//bkOyEVfeVVHxdf12QoAkbSObQ/O7O7+
         P4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121231; x=1775726031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qr0tec9oGf/SBDgbf+2rD33HNBftwB6KGbVP3Dhy5ew=;
        b=gR2cOTt/FuY3VQ1kf6IwhMBf6r94xPIlAsbovYAWYIKm0U1TKNuZK0/sAwHMeEO/u4
         QKzKnhMZPAK6tkZF76J5MkRMIBj/P6fsGUyG9MKcfhILK+Y+j5iUxS6bDbcaDJyyLrrT
         ASMFHRlYvzOWMXAOO2yAvsOneuCj2jzvuQ8D1dlO2w6VNdNyDUSRgVPoMHW29EebM/lX
         jauEmFZGn/2UrRlOS8qg+J7CFJYxZuqtZz+PSc2N+xAapY1kIBoSviM6gBnAGNk6D68K
         bMYmB3bp2D7GbDz8TLr0MUXZ06sKeBelD0H6BM8ScWWEBnlu0euOu/kmxjCFg0vi81le
         fvNA==
X-Forwarded-Encrypted: i=1; AJvYcCUTT/vvvItxHiEKoGYj3QrlsAbDujllQofSuyFMR2fE6krOyCCPp8SU/C92xZYdTIKxUTdCbXpxBrdoYlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUbek9HZenBoxHqBVY/iiRLACrc4Lrtbj/TztqcKl16SruPuJw
	FVR7n3Zf5dZFsmHZNgC2ItXZw1a+HjCDvUJqNxePXSQuoRSB3zW5oXM1
X-Gm-Gg: ATEYQzxEh8uJ1Q0pheWkunWuCG77iUoA6vb8iMPRLkFXQIZ3lhufpRB8pao6xaPqcaB
	XQMiIAg4qckd5iI9CBfDpLqyOTY/Sl2aZsn1QTyFqxXUwzFEa78flIhyaX31kdauDHuFvHmbj8B
	P0HY8aDdboYVnYZs4aKeWs64ZpDdBkiAlOV2hbfGqfO9ckDP7eDmMgTPnHhvBrXMin9+42BGGT/
	YfImIcDwHfvl6DMY0I9OS/7vEMoz774oF6VeCDOsOCN3UQf1IeC19d5bC/IgIo0HDgh7pb3Sdws
	OWTbwWmHBAQx0AZU7z8J2DrSpfLTfYf6bDWwemfujlKP8hq3qXVL4KrvVw5Ljnl9mgebcd9hKWY
	GduhpjOQ7emGUEZhRT89ZES4wtqbcePw1ze2zYSn9ZV7njuXoY2m/v8wtHFqE8gDA+24A8Q8lAL
	NrR+EjqneWx/AkiNym2QcwbN3lqIPNCrBSewl07H140p9nvSfSqBHdafG+qNUTIs1LEzc2TXc=
X-Received: by 2002:a05:600c:3514:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4888358c8b3mr115476365e9.16.1775121230625;
        Thu, 02 Apr 2026 02:13:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e952b0bsm162303495e9.12.2026.04.02.02.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:13:50 -0700 (PDT)
Date: Thu, 2 Apr 2026 10:13:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt
 <justinstitt@google.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com,
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, Linus Torvalds
 <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
Message-ID: <20260402101348.2f758a58@pumpkin>
In-Reply-To: <202604011313.AD471BC8@keescook>
References: <20260331163716.work.696-kees@kernel.org>
	<20260331163725.2765789-3-kees@kernel.org>
	<CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
	<CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
	<202603311249.30B44C66@keescook>
	<20260401090815.GV3738786@noisy.programming.kicks-ass.net>
	<202604011313.AD471BC8@keescook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12593-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 142A4386AC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026 13:21:17 -0700
Kees Cook <kees@kernel.org> wrote:

> On Wed, Apr 01, 2026 at 11:08:15AM +0200, Peter Zijlstra wrote:
> > On Tue, Mar 31, 2026 at 12:52:10PM -0700, Kees Cook wrote:
> >   
> > > I think for this series, __ob_trap/__ob_wrap is what should be used.
> > > 
> > > And for other folks, the background here is that we originally wanted
> > > to use macros for "__trap" and "__wrap", but the powerpc C compiler
> > > (both Clang and GCC) have a builtin macro named "__trap" already. So
> > > I switched to just using the Clang-native type qualifier. We can use
> > > the attribute style too, but there was a lot of confusion during the
> > > Clang development phases where people kept forgetting this was a type
> > > qualifier, not an attribute (i.e. the attribute is an internal alias
> > > for the qualifier, and the qualifier is a new type).  
> > 
> > Since you mention qualifiers...
> > 
> > What is the result of __typeof_unqual__(int __ob_trap) ?  
> 
> Hmm, it seems like "const" doesn't get peeled off. That can be fixed, if
> that's needed?
> 
> 'typeof_unqual(int)' (aka 'int')
> 'typeof_unqual(__ob_trap int)' (aka '__ob_trap int')
> 'typeof_unqual(const int)' (aka 'int')
> 'typeof_unqual(__ob_trap const int)' (aka '__ob_trap const int')
> 
> -Kees
> 

Adding all the required cases to the _Generic() doesn't scale.

typeof_unqual() needs to die.
Just using 'auto a = b;' should remove const and volatile - but gcc is buggy.
There are some alternatives that work in many cases.
(It has all been discussed before.)
In most cases you can use 'auto a = (b) + 0'.
That does do integer promotions - but they happen as soon as 'a' is
used; so it pretty much doesn't change the type of value, just the
type of the variable.

	David


