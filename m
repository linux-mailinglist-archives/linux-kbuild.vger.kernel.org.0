Return-Path: <linux-kbuild+bounces-12444-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAlxIcorzGkmQgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12444-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 22:17:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E10371175
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 22:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75D6530151EE
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D323A3A3E91;
	Tue, 31 Mar 2026 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Of1Q5+TV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B444D031
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988231; cv=none; b=bUW0I5xno1Se4pj7tSiL68tUrMkdshBXgIcVsVefFlwdeUWh3n95DdXQkHkcK+TDz8ppPpSbY8aZsfJZFcyKm+xIetD3u+C6GsyUsq53VsqQDvCcSW5kn/+zbjXAiSuKH8aGTLNMZhsUEq/t6n8M6Zd9w9Zn3g+IVta4M6a9vgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988231; c=relaxed/simple;
	bh=Y/YFED/0OtgPfgeV4gPZ7asbBZssxn6FNaeq1L4CVTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aj6pzT5rJXlZtuI2Ei3+52YmqWmN779rsBNGM0nfT+lQLmnBjP1+VJuE5tBmKhM2o66tXybAOvgZmZClyLQe/fwEI8GdPdwgw4ucMaQ1qdAMq5Sl75ujeazgrFjR0GMPxryPdXRcYE9lnrSZGECZdQSXyEQj1jzsSB34sp3mSLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Of1Q5+TV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b980785a0bfso864672266b.3
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 13:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774988228; x=1775593028; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VcN9sER3VoMAwC3I5Sh98SVftLUl9If6/CrHtfP+ol0=;
        b=Of1Q5+TVnlGsePLp1VnJvgeqA7/lerY1/0zvCAjI/77Ahnc2KpF7zmFAqb3tIo6ebY
         ehyGEKI1Y3NUNbn66rqFfV7O+IXEz7Y3qK58S27Ks8rsanadW+DHgSNdCwhz47IifnxE
         5+O/ODoD8B6JAxJ/Gsn9teWQgYc01OW9qQNKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774988228; x=1775593028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcN9sER3VoMAwC3I5Sh98SVftLUl9If6/CrHtfP+ol0=;
        b=gHzpkkyvkFtbi/TU2OzebxuCHJO0JsBT2x4HxH97udgezLc5pSo5qt/uN8uqIdEelW
         JLqaYQaoPmFt/dAB6IbKXoCjzfoOnp0G0T0YkfKwsqUcZM5YntFdBtavH78HpCYazJe5
         exWhb7wf5BrOKxd9a4AGYl6UwKFkEnNMxHxUsD5zeKwa5pqQpE48WyCArB1uSjw8lYhr
         o6bInADR/iA6lZy+BA9lf5RmtnTvF78n3oUMBovwgwy4NERTc3TUegtG5/OXMBWS4S+t
         QFz4D3kN/DV3Gjzu/WKT8yBaMBNPRmSjIkMZuqZaLED37DJemhiguzrT/Eze2S51VgyD
         kakg==
X-Forwarded-Encrypted: i=1; AJvYcCVFKxLqMRCc9Do0Blzw9u7UrJv984tadJ37b6CLJ04tDQ/QvzVsG5BHn3sAC+tmyVEGEj0VEOKdKCCP3fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq2lLkY6FGnChCB9gWoyuk2mQoCO+ZqKO4RgGv9mi5bbyawZBi
	UzuX6xSb36cnhREfS0CTVUMo1JhhMzDxU+a6zzgrNVlZ1OpxlIY6+uRN6BL2Qse7BsIVd04yb0i
	WRZT4WrHfPQ==
X-Gm-Gg: ATEYQzzMAHK/+AMyyb7b33Ospw3qpLXZDRhm0ewjKbsawSPXx9fZ2UMAoq2djUzQ2tC
	pQ6qklSqMdxgVoCRtbk/mFcsRbtvnlfL9jPkA0eCE0vbn+FTQE8OK4JRlikShDrKpv/mj+turJ1
	FBq1ttZ9/t2pTpcQu7DZIMD+DeGkzARJELsJsQH9jmbXJHAVIVpogRVUTAjduP5XEq1O8TOlRUD
	JMW5NCn5uza4OJER9AHx2WSPVm9IOyF2iNm1SHqD7MFFP1j2mejSilqGtXzSMx8o3G6iwEgcKUb
	E/z9g3YmkgRJFIo1XEVavqjTBE7CKlLo61EDlLslrIBpyjbG28D9uLxkHGYv6IHOna+ZEzUyup5
	Z96OePO3hQz0b1h7zTANCICJnrMqmpMWxOUnglXF8ffd6tc0bug6tMb8LMra0q+i5t6BJFDkbyS
	O2ASogqu9DwTr76kag7E3ub1+JJmQWFmJVj7Tn61CbcB1qE0EqY4wLe1oM6XjGX5S0Mvs6nN53k
	12Qh+i/Fg0=
X-Received: by 2002:a17:907:a688:b0:b98:4551:e796 with SMTP id a640c23a62f3a-b9c13b3ce61mr74230066b.30.1774988228260;
        Tue, 31 Mar 2026 13:17:08 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae2415csm444309066b.9.2026.03.31.13.17.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:17:08 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66bd4f7b2d3so3153191a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 13:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPtyPKDw5pnH1e/J/Cdlk+WUJVO13HBhmaHn+8VG0i92KYBQ8aq3Pw+HzHsSsYOJY3HEttJL7y6R63yC0=@vger.kernel.org
X-Received: by 2002:a05:6402:210f:b0:66b:a9bf:41 with SMTP id
 4fb4d7f45d1cf-66db9efda06mr583269a12.27.1774987898160; Tue, 31 Mar 2026
 13:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com> <202603311253.95C54588E@keescook>
In-Reply-To: <202603311253.95C54588E@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:11:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
X-Gm-Features: AQROBzCgLuTpLW2yBmTolIYlFODjWyPAxSyS-qNDPcZnOIgx-hYNdl2uT2sLn6M
Message-ID: <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12444-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: E4E10371175
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 13:03, Kees Cook <kees@kernel.org> wrote:
>
> Mark Rutland had strong reservations about function-level annotations,
> but I wonder if the combination of new type _and_ function-level
> annotation could get us something near what would be palatable:

Yes, if we had some way to specify the label, that actually looks
really nice to me.

So with _this_ kind of interface, all my reservations about it go away.

And as long as the compiler actually requires that label to exist when
trapping arithmetic is done, I don't think people will use it without
having fixups.

> Or we could make the label a global part of the language itself so it
> wouldn't need to be a function annotation, but rather a _required_
> element of any function that uses a trapping type?

Yes, I'd be ok with that too, because I think in practice you
typically only ever have one, and I guess you could use local labels -
or multiple functions - if you really needed to have different
targets.

We have a few years of experience with "unsafe_get_user()" and
friends, and a few hundred places that use it, and while it's common
to have several cases in one function, I can't think of a single case
where we actually had more than one error target.

I tried a quick grep, and nothing jumped out at me.

(And a lot of them use "Efault" or "efault" as the target name, so it
probably would have been fine with a default name)

            Linus

