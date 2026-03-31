Return-Path: <linux-kbuild+bounces-12422-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SICIHfoCzGljNQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12422-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:23:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354436E968
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 638963040646
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425F3316192;
	Tue, 31 Mar 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j69l9BA/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028CB31064B
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977292; cv=pass; b=Bc4JxApFkcdI4Fi7sbjnyP14XgbE+XKEyJnNLgVjIeYw5BHZgvAnaL5SasX+/eGVWXiornjY62Yzc2t044XodR/sybL8Z8t5AotozokiMyOqw8gqhsty+BIINILKCPe84np760d88l0Ty0jM9FGhajcZueIkfMRv7HqixFq33k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977292; c=relaxed/simple;
	bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TisDO3qQU7s50/uWcVBHwgmqOJbWY1ASqL2beIhcvCfxmOuHNhMAMEpBDBX36Vk7uf3fNmGmp1yAQ+flaVWE9PIc2GHBstFYbmXW+AbuSbDf0WSDnl4mQ2+1pdlIXA9Kp8JISi9iOkucDsmK5xThvAOeIvdT+5ivXLC8YphYPRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j69l9BA/; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bd5658b901so226968eec.3
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774977290; cv=none;
        d=google.com; s=arc-20240605;
        b=hZoEKYGZ9pnPpMOkyrP9nVabIsSgk+/WTZnr+E0mLk5vn+Egu8W+swwQxfOAdt8IfK
         c88DRZMccn0Ikp+GFdy+lUYE2L3KEGHMWWMB9l9sFXEuiU4liFRMy/W04ui187DMXmo8
         i+JwxaXW1zkCLZlPhfwqQ1nVKMqyBne5+MQHigtskPPHdgBy9yyYIl9yaT9Upyya5sCH
         D9AIQqAWk5xyPB9Q+n1L7an7fYKGnlXpVoyMLkuXjgOEyyLpfYEpQq0FzgH/dGz9701N
         NzHJN56wa6ruepj3BUMUFiPhdmNer+zkIdee0igMtx56APJtazljz3WB4Mh2jzqjQzXp
         xh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
        fh=QKZ+PaoS1BSzcqyQ33EZ9vfThTxiSJz7uCnZjMFM2Wk=;
        b=K2M6pB9tVc0vRfWxYoU4rXvnwmWJBb/q24wmJRMrr6j15KNgmQeH8WzhUSvpiaU3dO
         ogEk62A2omm9nA71w66fLjXHwhJ0pku1JyWaKStBLuDMlkzW7dHxVqjJaOq9XIbPU9KO
         dUP49bBVws2I4nGU0C22ts1Ed4lzpcZ84oQ07N/szkPFlES2CoeYW8iD0nPjoUoVPyRM
         7AmdDKAzodZAbU+Hls7E/vATK91sAQ88k7Bd7i1vn97arZJ3pK+hz26P7u45RPtsMLdQ
         vj82243YDNz9IkHFe76tnCv09wXKdGDXUedlDIICyFhWPKzXf92/ppcX1FpEx7LSMktr
         q02Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774977290; x=1775582090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
        b=j69l9BA/W/vb+ZMCguLW/f+lFajXySckHWUW+FCngYfO2RF4QZGegBrfUHB5DqZYdB
         kR9wgLgl0MLjWDtSgc0YK7Z95lt9F5Ba2OYkB92SgxLj8dGMGBhfChfa9Ey6YMlnNrg+
         aIfwCSHEwYw6POj9gtRv+lWb3gFXA8CgXZeqpM1LL6uPVHhTl5s5IHAdBBcyJ2lsjHBU
         +6+T14j0FM5GPctPR4rpBwCxATQnYenhfli3CLe8LuUTdpu/X6yJgVdBTSxcN3qnVbqi
         d9bzBjjd+cDOWGiTwMjfEBdo0KqnZfycqlzG70S3VASA0Y4W4Mh5NgtZiVmvKcAmHdLw
         XWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977290; x=1775582090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
        b=i0dz7MK3hqRFMqN02x3S9HVnRYm4uO44lpwkmjanxfifIRpwW0JblsQ83omRkhs0GC
         D/7JyxY8yd5j+YLkQHKdK1ikTIeVJKO6p+yXSVmEWJuriTIx6eq71GIg0WfH7n1Skjto
         5q/IUweIIKN4ACI1CT15sU2FPF0rEyC1PUGHjWWl1kBNqXRhOrzThQroAQQD/SX9dhF0
         Iq70B85FEWmWc8Ny0Um8YZxA7SAmNZdSyTckqB6+b4kYPINyo7lyDA5ujXHiEEGObbyp
         r3T5ssnTJmaVn1Wf6Rbixv7ZfL2TSY8MMDso2aE8KqlV65x+rGA/GOB/yClr1MKMrYFf
         Ii3A==
X-Forwarded-Encrypted: i=1; AJvYcCUEs3G05K21A94llAzV0fyq1faUUJFqxZOdJ15deNlmrLsB3htSYOChAGTsYUM5EaIoqw4DF+XnbHbhLPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGY3WjNJ9avsQtksALJiZ5vQH6lGAb/yQIBMCsGqR5/uLVeGpn
	H6974BX1oR63r15WfZyik6M8nUPGBTHcbjSB9g1kH982tKpDCAS7yWlTQnTrYvJOCS4rrOwJz7u
	irFM9GL1w/6odj0ziTeD5N3+2LeoMAGg=
X-Gm-Gg: ATEYQzxclj+55Su7/zqf9RdDJJQd2ykK6SKIxdFP2gnv4CSRMbvbaLeXS0gFKMGG7eS
	3OziD4NI3dWEISCzHKjF0CS6XJA/hU/nrngLhJfvymaVy+jSzBO3ssbgngWsAptH2jK2LDRkxtq
	TgMMs7kYzRFqlxGUPUWTVW1x+I1FgvqwPig2Xxwkh2Ae6lQJw4vAw6RZWRpGasvYl4niwdfXaCv
	k+Gu33eSVpho7PbI1e8D9tPLPFa1efcwV579QvxoLYnQTndmer8MMQIuAt+/8MwyMl/GL+Hs9NF
	Pc9qVy6OqNhZnKe5gmi2GdWxHV/jtLLUyR+rr3TrBfidRh0FnaFhjP3QTIjyHhA3x5AzWqHDjCZ
	/mFohAodpJsVEIu6cV22+e3A=
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr7028eec.7.1774977290081; Tue, 31 Mar 2026 10:14:50
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com> <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
In-Reply-To: <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:14:37 +0200
X-Gm-Features: AQROBzDhgoRzvErl2Hff4GGNXVWp6S_FczTi75dcVGu_6O4eHFWwYHMrEyNGrVg
Message-ID: <CANiq72mQPU2Uyz27mBtfT6UF4Zgoq_osodALs21kJ4qOFLVhUQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12422-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1354436E968
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 7:09=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> __ob_trap and __ob_wrap are defined by the compiler.
>
> There are some examples within the documentation additions of this patch.
>
> Kees, is it possible to make it more clear about what we expect of
> kernel developers in terms of style? Should they use keyword
> spellings? attribute spellings? only use custom types?

Yeah, I noticed that right after sending the email, sorry.

So I tried to use a macro even if happens to have the same name as the
keyword, since that form is a bit more flexible, but it is fine either
way.

What I would suggest is adding to the comment that these were decided
to be used as keywords, and thus we only need to define them as empty
in the disabled case.

Thanks!

Cheers,
Miguel

