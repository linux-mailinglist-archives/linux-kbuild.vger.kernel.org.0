Return-Path: <linux-kbuild+bounces-12445-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kExTIFkuzGkmQgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12445-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 22:28:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7518371295
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 22:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B9193011C75
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A2644E038;
	Tue, 31 Mar 2026 20:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S6tj+KdR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD4F44D031
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988775; cv=none; b=jqUaeKFAulQEojIHvJmAOdQ3E/EdvLKVpGiImCwaeB0y2ksXMMxJQakVq/FCVA50OEkf017n/KxpBgVHFGNVQP7P6LLDJLoUFMXy9EdruPXb0ukL6nbIoUXBAXHOox8LYmB+VT7mPzty7GSs2M9THv2wFylOqaVSBTTbYGSeN3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988775; c=relaxed/simple;
	bh=MXnPS0QnV07SSDgjwdHCBKIla0I+UMjxd6c/XOBUKPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TF92mHRHpvBEWNM040ZGKeF2Xgt/U+LPsPnNaslaSYaV0VIX4VbUgHkrFxY0+ge7JXkEGc32axt518cIORWoaUacLzc/xrxBM+zI6QzJAXBFIRsMqXPeSlZB62CiUZmQ6xMYuD0BOkoyhYXKEOnHnbJInhWDALcD7c67AZNDB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S6tj+KdR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b93698bb57aso51914366b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774988772; x=1775593572; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c2ktyrPBG7CFlGMbOR9QYSgdZ9nvYimpNIw5oGP8BII=;
        b=S6tj+KdRUYSDetsTtcpBVv7sZCzshE7ZyFn9EUaqYrBef4cmnsktwvZLi9/4uZoz4t
         EdX6iqccdcKIx6ravefXp3mCsZUhYiTN2S9bljDfAqzu1KWcr4p0O5vvehdk3VVIPo6H
         +1LxqAMJQ3eRmNa4++PzlxChxo7Vk4JCKcQWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774988772; x=1775593572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2ktyrPBG7CFlGMbOR9QYSgdZ9nvYimpNIw5oGP8BII=;
        b=iSJedX2+embGWGjGY8i/rrukbT7brcF1kxq/NajvDsmrxED5z9xJF7tf7ECUO8LKvT
         /iowxGeC4JHR4WyhgDTEu7Qr2Q7CZBR+GMXWVruP26F5YdL/b2inOPGVygKZz2k6IvMF
         lchCzpdkREQIbMuyMGuEETgzOmy+U5yn5lptg1P0uV4JRqLCoSLw/QngSlUyNsYpIf+y
         s3HACvXVly/egANk0ACHvsEsQD/EHnVnKJXbdijB0VYeJku2o0qkxH9iarvZscoL0FPj
         f7YbyHQ4O2Tu+Ag2qTfv6eZJDr//LdannhLJov+p3k0Urj/MBPKYkg+r3Ex1C3F6Ljwu
         qJMg==
X-Forwarded-Encrypted: i=1; AJvYcCWz+HBojAhl7vVWZiy85+aK9lfjNCydJnPy9jmSE8lViIEngg+k1NX5TDtiqcpyPlEPR98tTYMAOWIjmBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Wxl7MCTUtSZphr56b2y2xVtiTIK5JPAEBPCeTPViV+KtH2/6
	ysf3X2h908n07thl40JSZ0qes1HKfBe1FE3mPkW1Vde0tJw0xtm0yUWtijslW4If1EYeORpeuPZ
	CJUvjKQmklQ==
X-Gm-Gg: ATEYQzxLqxcfjyIL2jqdjlD/tnPB/XohgtIQUOsVGWs4mHb+WElkJjpAthtr3kG8C9n
	o8EOd9g76WjGorHPOzbpXAFcN9lA7nw3D0u4yiDQhXKItGH8/0ONeowXHlXBlT9KDq5P7C2Gg8O
	eMGYV7jqoNj/AWrvGl9NfKbpl3eIIROnwWQWf4TLGs7KbSU599aibMKjW66iiKIMJjM00Un+sNK
	2adc+nNgJSGYyoHZioXlwc5ZULlvjrojVT8RDZYATq49XfWsLpRA3mLfM3WosDmW46N28szHGnZ
	2hYPDXyvOHbb0bRZgAHE+KMr4WFx4Ex/8uY0ZxRM7xOAQpogoLSfEvRrRL+Csm/uP3/8potdw0r
	A+yOVKPJrYxoxFwN9u9h5tJ+0QWLloJacP6HclIhDWFu2axOGQwcUSYMAudS97RxJQLLOh2lBJV
	9A72m15LU4GCrzQkV9apkKBWItzeZZ3QBXOmnMwtJolxvsV6jSYSrmJ4hdE/+/PPvu4LdgcdUe
X-Received: by 2002:a17:907:3f04:b0:b98:c0a:cbb7 with SMTP id a640c23a62f3a-b9be88c4262mr266822866b.27.1774988772125;
        Tue, 31 Mar 2026 13:26:12 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225d4bsm439080166b.60.2026.03.31.13.26.12
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:26:12 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so418721a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 13:26:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYDWNoA9xWhjHc/RusnJdJoRZvo+FFHRA5t8lSERv85gaD7IAk6yicWeB7uUiqrrZu7lwEnHZnJuK1Kbk=@vger.kernel.org
X-Received: by 2002:a05:6402:4489:b0:667:f151:2efa with SMTP id
 4fb4d7f45d1cf-66c338618b1mr3066306a12.12.1774988323206; Tue, 31 Mar 2026
 13:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:18:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjo0gB6jVdRKj310atcM9jmmyr3t3VDut=FW0S9+v467A@mail.gmail.com>
X-Gm-Features: AQROBzAUONdaqkEjwnLXeyVn7Wp-adEWlZELPlH8sCIkK0YvCJHIOwC67Ju1r6A
Message-ID: <CAHk-=wjo0gB6jVdRKj310atcM9jmmyr3t3VDut=FW0S9+v467A@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12445-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,linux-foundation.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7518371295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 13:11, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> We have a few years of experience with "unsafe_get_user()" and
> friends, and a few hundred places that use it, and while it's common
> to have several cases in one function, I can't think of a single case
> where we actually had more than one error target.
>
> I tried a quick grep, and nothing jumped out at me.

And the *moment* I sent that reply, I went "Wait a minute", and looked
at strncpy_from_user().

So we do actually have at least one case of multiple exception labels:
the first one in that function handles the "potentially unaligned word
access causes page fault, fall back to byte-at-a-time" while the
second one is final and fatal and results in -EFAULT.

But that case could have been written with the byte-at-a-time case as
a separate inline function, so it would all have worked fine even
without explicitly named exception entries.

In some situations, the explicit names may be very useful just to
document things: in that case the 'byte_at_a_time" label does do that,
but I don't think it's a very big issue.

And it's likely even less of an issue for arithmetic overflows than it
is for user space accesses.

So yeah, with better compiler support, I think that whole trapping
behavior would be great.

               Linus

