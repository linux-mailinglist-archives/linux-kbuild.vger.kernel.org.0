Return-Path: <linux-kbuild+bounces-12443-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHDRCtEqzGkmQgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12443-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 22:13:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8526B37110F
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 22:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1768230E505B
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EABF44B69C;
	Tue, 31 Mar 2026 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A6hHqSjL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DD3D1CDB
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 20:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987643; cv=none; b=q8XHbwD4nNqJr1Os9FeKnNf93fOwHYj7iGWi3dlVtaj/9BSQd7UQ+m5FuMQ4CAUiMVkCOPi1xynTS2ZCgvpFyJJnSZwuFWjD2h41+Bcu7epTqyKQ6sMK/tIhY422/oU3SzTsVFN37OxLcGXbnRUqvUouV9l9JHMp3h3X5lAso5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987643; c=relaxed/simple;
	bh=d6r1zB/UdxoLPJPFYvR0HJRmpyXXRkjD3BCCWDdorSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRxxKavM+XPxITUOGPAHPcCve4AiULkinf6g2haj7lEuvCOUzI+qUOS4hRSIsmJVWvzSKzEYoQGssZxB15dNJHvPqrLUlV9I5W54Jw9gPhFjdpQYH7M/ixYMXaQeg/pXvCq4gQmL3om3dIf7z/25svrMEruTcCj9wK3DhyDzIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A6hHqSjL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66dd059785cso123192a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774987637; x=1775592437; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv2mdBoBk4QdkqU81qWETh/yEJGWnlakuOpSzMhOmBw=;
        b=A6hHqSjLd9uVpF0Nq11QZr5VCPGueMh295GEt+pWLkFE06fSyBajBEOhDNZmLB2Se3
         5qVGgEO8sJ6vzKLM8sOmyuSzHcIaCJCdUwpa746gyac0/jid+JN993xkFUjb6andS+9g
         h5lEHLISda+wA/x+oZwCf/74kEKlr8JhZ4Mxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987637; x=1775592437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv2mdBoBk4QdkqU81qWETh/yEJGWnlakuOpSzMhOmBw=;
        b=MWL9zVAuWxsiwTCG0lV2sACX1vTn3mCPG8Oir20ESjE4ZR3B+RFkAS9NN8A6fDsBOw
         T/R4n3jeyr0uvSgcu41pHsXSw52UBKFol40vCZpwyKtjlGdk6ZQIx3t+TVTTvTIEHCC/
         ZVbIoOjQR1NNmnumwW31xRgrNSd6eYS8leMu1ZiPAESBiwkti0Zm+08hXZksk4kHoeyy
         wKjA/Deg3bwOS78wZp0ynarWWk2rWfymIQHxSU4dr0qMQ1kYXlZPhFwV2UkpXGa1Avgl
         jOxOmJiLFiaEmpP9v0Bu2snHAoFKrRJYGszcPbj/1m3+5ZOoK1kRWp3E/N12PU+LY1aG
         dMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX47bZqyCspniuN/z4bvPt03oaMxp6FEtwfNUEK+g1ozMibC6+xj/NUqOjcYDwu0E4c6w/rugzEINCIA5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZvlPxOcybHqFzKjIuwsDdcdf5ssgDMfNbXOcASr52uyf8zj9A
	jDg5EkoZKi/n9Fm/uQeb2qZd7n0XiDDhHdsiDGHckbANq+ti4uVOuowBnp4CGiiViSJimqJC6Qd
	aatrEDgW6Hg==
X-Gm-Gg: ATEYQzwJ8TARoeuP3jPqcks2hFk55PD6rHbocX2+/wTax1cjE4S8Gbt2yLqJa1uXTk5
	dOZwhiF64xC9UobK8AzGsK6MSdhqFW0zsQqdAfmAifHy9uGOSDbpNcfrSlFElqtUdc1DxecCP2b
	PvhOWbhpBFQsXUoMRe5OGHFMccwPFnkLqVJkkYP05JD+qoY9Weahv8wQBUR+kSBrc3wgahO4/nx
	64QIQmOiKE6jFYXyp8FonER0KvXII9Y25Yd8d/1WWcsLIWM0803KhUydxB9f1gDu1y1acWbuXVz
	XrAqLNooRvQJGjA/SooTBgSXnU8MM3oaZGHlVgz5YJTHz2YJKmjCbi3qaECA5AQ8r5pyBrjHk/V
	Wuw0IrkKy1DYX8xiuU1kT3WfL5AkcePS2o+ZBDPQK8unJA6tq9HKgIzvRHWVO3lqI7PyXG5r6Vl
	/QFFghrIlqTeQXOFf+k1/3ajgYU3k8SfiFuh6GNjJ5k7t8mR3m+AqF6XmVldkGDJAeXhSUxwXK
X-Received: by 2002:a05:6402:321a:b0:667:ebe:94d with SMTP id 4fb4d7f45d1cf-66dafebb9e0mr504451a12.3.1774987637499;
        Tue, 31 Mar 2026 13:07:17 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b75f84708sm3773722a12.21.2026.03.31.13.07.17
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:07:17 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9c04152730so129016166b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 13:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIagImgo2bSiIqrF7KqjZP/mfNmV74mJ7SAULtosPqrwpCMX7KCHO2DlwzWI/YOsQVSfsx9g3zVGR24Q8=@vger.kernel.org
X-Received: by 2002:a05:6402:540d:b0:663:9739:6265 with SMTP id
 4fb4d7f45d1cf-66db02afce5mr564572a12.9.1774987334624; Tue, 31 Mar 2026
 13:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
 <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
 <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com> <202603311155.503B3DA5B@keescook>
In-Reply-To: <202603311155.503B3DA5B@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:01:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh6YWV3hHs8i0P=2A2CVjCY=SOaYeayEodXYa+CMqNO4g@mail.gmail.com>
X-Gm-Features: AQROBzDJ5SIQIXss3ygEg5-CA2RDbG130aEFCjGxmwQlRnW2FPPkeTaugvbjtMA
Message-ID: <CAHk-=wh6YWV3hHs8i0P=2A2CVjCY=SOaYeayEodXYa+CMqNO4g@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12443-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,infradead.org,google.com,kernel.org,linux-foundation.org,linux.intel.com,arndb.de,arm.com,linux-m68k.org,glider.be,linutronix.de,lists.linux.dev,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8526B37110F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 11:59, Kees Cook <kees@kernel.org> wrote:
>
> The syntax problem (as made clear by many other people, and even you
> here in the first half of this email) is that no one will use function
> based math primitives.

I don't think that's true.

It's just that they have to be made simple enough to use, and have a
good *reason* to use them without the end result becoming horrendous.

Ok, so I just spent fifteen minutes trying it out, trying to aim for a
really simple syntax.

Look at this contrieved example where there are two different overflow
things with two different exception handlers. I decided to add a
"default" label that is just called "overflow", so you can write code
like this:

        static int testme(int a, int b, int c, int d)
        {
                return addo(addmulo(a,b,c,addmul_overflow),d);
        overflow:
                return -1;
        addmul_overflow:
                return -2;
        }

which obviously isn't pretty, but it's still at least somewhat
readable. It does a "addmul" and an "add", both with overflow
handling, and returns the end result.

If the final add overflows (which doesn't have an explicit overflow
label name), it goes to the default "overflow:" label.

And if the addmul overflows, it goes to addmul_overflow. It's all kind
of obvous, and not syntactically all that onerous.

And it does work:

        #define TEST(x) printf(#x "=%d\n", x)

        #define MAX_INT 2147483647

        int main(int argc, char **argv)
        {
                TEST(testme(1,2,3,4));
                TEST(testme(MAX_INT,2,3,4));
                TEST(testme(1,2,3,MAX_INT));
                return 0;
        }

results in:

        $ gcc -O2 ov.c && ./a.out
        testme(1,2,3,4)=11
        testme(MAX_INT,2,3,4)=-2
        testme(1,2,3,MAX_INT)=-1

and in this case gcc actually did everything at compile-time, so code
generation is actually good too: the compiler will optimize this to
hell and back.

But even *without* constant arguments, the compiler can actually
generate good code too:

                .globl  testme
                .type   testme, @function
        testme:
        .LFB11:
                .cfi_startproc
                imull   %edx, %esi
                jo      .L6
                addl    %edi, %esi
                jo      .L6
                addl    %ecx, %esi
                jo      .L15
                movl    %esi, %eax
                ret
        .L6:
                movl    $-2, %eax
                ret
        .L15:
                movl    $-1, %eax
                ret

that really isn't bad.

So the code is legible, the code generation is fine, and it's pretty
flexible. And are the macros complicated? No. This is literally the
code that did all this:

        #define __default_exception(a,b,...) b
        #define default_exception(...)
__default_exception(,##__VA_ARGS__,overflow)
        #define overflow_op(op,a,b,c) __builtin_##op##_overflow(a,b,c)

        #define __overflow(op,a,b,...) ({                       \
                __typeof__(a) __res;                            \
                if (overflow_op(op,a,b,&__res))                 \
                        goto default_exception(__VA_ARGS__);    \
                __res; })

        #define addo(a,b,...) __overflow(add,a,b,##__VA_ARGS__)
        #define mulo(a,b,...) __overflow(mul,a,b,##__VA_ARGS__)
        #define addmulo(a,b,c,...) addo(a,mulo(b,c,##__VA_ARGS__),##__VA_ARGS__)

Now will people ENJOY using "addo()" and things like that? No. Clearly
it's still *easier* and even clearer to just write

        return a + b*c + d;

and yes, that is more legible.

But no, I really *really* don't want people to be able to just
randomly say "I'm just going to kill the kernel if this overflows".

                 Linus

