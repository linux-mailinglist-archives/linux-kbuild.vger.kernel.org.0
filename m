Return-Path: <linux-kbuild+bounces-12436-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBpZI/gTzGkvOAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12436-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:35:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA4E3700D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 20:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 850823020FDE
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC7D3806D4;
	Tue, 31 Mar 2026 18:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TykHp6RM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DFF37DEA9
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981919; cv=none; b=m73TUCvOEh2GqhxRbsISQoLl/hnXwG2CjdoPtoDc108p2e4KoPZeCf6GVLhFiSuanQxLWvWrFfVj8/ATSzqkj5UJedxeaw7ZXe0/EWSviAxGRJN+d6M5T28Bm7aJHuyY4AcwgsrbnHr7+bZNCriUhbCLqWQg8AKlUkxsKZWZkhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981919; c=relaxed/simple;
	bh=ox6OjjUW3Qe6xBaqwUnJk6bmk2llYCPNtvoc4SxKSSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjSM1XUT3ajiT/zYp7kF6bzOBn3QOZttKpiTNBKPHvE+IYgDHc0+THBjDj7ghy6hz6Qp/rdiWLPzplVbcH/wlTv4qeIm+ZdBMNP88ES908xd5XmWm313iDqeO4puXFqXdMD7/jbBwN5ML7qhy9ihVkFUZfSKPZF8ZY/zSuHsX5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TykHp6RM; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so6947298e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 11:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774981914; x=1775586714; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ag9HU1BRKwZOnlae6UtSCfLk/g8PIJV9tSPEI30VDdc=;
        b=TykHp6RMVxh7jpHKUnkVlEYbTiO65UhTdpoxcPZXaStlUjwmOOcJMl8KDVMZy1Y+s1
         Mr4kKdni7nEEHftuJlFz7+yqbigvGOpwBE3oThMb3edHtr/Bht22Q4Xv0I1lIjyY3rYl
         Ic3uP1g+YTz87HSINvfXrgclI0wl4JvTlxMsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774981914; x=1775586714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ag9HU1BRKwZOnlae6UtSCfLk/g8PIJV9tSPEI30VDdc=;
        b=lhSgd6oQIPe/P/3uRG4dcnNhj5z5IBhgEC2iOFz5zNVDZPlzRcA9wxAUWco/8QMRIv
         vmQaFxohOCd7JsWG4Fm/nqKsKqU7mRIr9gm5gz+kjcPyrC7Jde+oO6EPSNkl39TjhZM6
         TJtV3x/kD4NmiPNDGbKNzfjqahCYs60Y55DVSenIQJuHWGAJft4Y6bEQV5MxkpDJ804u
         hRyRNqPwYDtLLe27K4Cfq6b6/VFd15T8wubwOcIeX0p46S9C8DpFT6YoSyXUteHmwgPx
         FFD2fUkjSDmbhq9aSwESFFdX+9lXONe8qJvNlNInSV174JPDVrrFUQKzZzQOe6sUjkTv
         juSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuwBPiupsE588cDgBSJpGV7plV3UKR/N++4Y8g+NJAkaOKeskLzI1fdGvrdp4ZFag4F0NSZnS6gO+LA3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk5PFtcwm9oXA/HOO5ovm8dM35rLbzztbbvtIFFMTTZIs6WjvL
	XDjYeD/5oCYnli9FY77+ke7YiQCz3iyGYfut0ZwEBFHHjOezsQjXIgGUdKkfnzXKlx40Ba34+lI
	9T7QpaJDC3g==
X-Gm-Gg: ATEYQzynlaw4WD5x/SIOxDVMz3Bt137dYWmH/2MKmjcDl58nkdV9FZ27SJIwFyW4kcr
	WYyfBQdy3bVxAyI4UbPiLV7zH1c3y0e1ztyOsp2pe6o+zvSS4KkhY5J/5LKK/ge6kaCU8Y6qLqG
	mnJ1aJLLbybxPELGVYtDWEfwWm/CReJi88AEliqDnv5zf/2lBeQQJRXluXyqo/saOOipEqAT2Z+
	DtrERBPnAkwEFODU8ELcXOpM7vzmKdKtzzObC2oIf2nOTG/hRmYZwQyQ4OsrOB4sbeZwUCVhmtQ
	4L9g6ekcbNydBI2mQ4ykm/rdfkRkK9OEdPav4zcbCyw02dcGMcs6mDGK3RkS9SH1Q2MLQarQ+8I
	HwWWihxYBEAmAbzlL3cmfTUC7awBmE0CG9P+id48fSqah0RAoBy2KLmAXAWdGf9DPS/LtopvUEE
	wHHNUexk0TyNEAzemY3C4KkpwtAD2eRdVbs7KK89K9i6a/XRV8QKeUnI8+0A+croxICpM1/78p
X-Received: by 2002:a05:6512:3b9f:b0:5a1:2fa5:b98f with SMTP id 2adb3069b0e04-5a2c1f20749mr165224e87.26.1774981913492;
        Tue, 31 Mar 2026 11:31:53 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145fbe2sm2617887e87.80.2026.03.31.11.31.53
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:31:53 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so6858360e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 11:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUf1sPxPxcqSl6C+Cez1aZWCnPj65Tpx4TFzEEQuSebt70Wdm5vw1K+zQlwodZeAyLEqVQ5aAHQZ6dp/s=@vger.kernel.org
X-Received: by 2002:a17:907:8b8a:b0:b98:51d6:8843 with SMTP id
 a640c23a62f3a-b9c13b17382mr46677666b.28.1774981536085; Tue, 31 Mar 2026
 11:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com> <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
In-Reply-To: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 11:25:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com>
X-Gm-Features: AQROBzBMzOVzd6q58CfNv9Gmf6_GDcPc6oKe55iXDcY89snM0DHbCtfJXA4J_DE
Message-ID: <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12436-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,linux-foundation.org:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EA4E3700D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 11:02, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The other is saying "overflow needs special handling"

Btw, this is why I also completely despise the current overflow builtins.

Yes, they handle overflow. But they don't treat it as some *special*
thing. They are garbage that forces code that uses them to be garbage.

If you want to use the overflow builtins (or our wrappers aorund
them), you can't just do the math. You have to do crazy crap like

     int end;
     if (check_add_overflow(start, len, &end))
        ... handle overflow ...
     do_something(start, end);

which obviously no sane person will do, when they can just write

   do_something(start, start+len);

instead (particularly since usually that "start+len" is just a tiny
detail in the code anyway).

Notice how it breaks up the code logic, and also requires you to add
random intermediate variables etc. It's bad, it makes the code look
bad, and people don't use it as a result.

The reason people like exception handling is that you can make the
fixup be done elsewhere, and you *don't* have to deal with it at the
point where you just want to use the result and with silly
intermediate variables etc.

IOW, exception handling means that you can continue to use the normal
flow of code for the normal case, and you deal with errors separately.

That is good. Much better than the "check_sub_overflow()" kind of crazy thing.

So I very much understand why all modern languages do it - but at the
same time most exception handling is complete garbage, because almost
everybody ends up thinking that it should nest syntactically, which is
completely wrong.

Error handling does not nest: it exits. If you have two different
exceptional cases in the same expression or statement, they have no
inherent nesting, and the order isn't even someting you should care
about. But they can cause different error codes or different fixups,
and they need *separate* handling.

This is why the kernel user space exception handling ended up with a
"label" model the moment the compilers could deal with it (in fact, I
very much asked for that interface, and compilers finally gave it to
me after years).

It means that you can move the exception handling out of line, without
having to interrupt the actual normal code flow. And youc an do it
without the bogus nesting that makes no sense.

So I think overflow handling should do the same. Instead of the bad
"check_sub_overflow()" model we have now, we should have

     res = add_overflow(a,b,label);

and now you can use a trapping operation *without* having to break the
normal flow of code, ie you can do

      do_something(start, add_overflow(start, len, overflow))
      ...
  overflow:
      // Maybe needs to release locks, who knows
      return -EINVAL;

notice?

Wrapping does not need this kind of thing. Wrapping is literally a "I
know I don't need to care", while trapping is a "I know I need to
handle it".

It's just that handling the trapping should not need to be done right
where the operation is done.

And in C, that means "goto". And I actualyl will claim that "goto" is
superior to most crazy language models with some "try()" block that
nests.

Language designers have been corrupted by "things must nest". BS.

             Linus

