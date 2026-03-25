Return-Path: <linux-kbuild+bounces-12262-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCZ6OxwZxGnlwQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12262-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 18:19:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE79329B12
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 18:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29AA63028B07
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 17:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75EF40149A;
	Wed, 25 Mar 2026 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QLqyt/cB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC81D401483
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458520; cv=pass; b=gxYrzJVWP4txJZ4QEiPeIeZskmylHr9V1ejdSRBLvcjqUhbYH5rwA/KTXDzWVERwSvqSdsww0qyH/cWFhfM7h9EpcEMBGY5LW6ORKPz+OQsrRKFPoQHkstnB4yNfal/2wi6f+n9/Vp+ZMWvv/NgcyhZUqd1oN9G04BpfBurcB3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458520; c=relaxed/simple;
	bh=2SA21GpYatS67AvAzCFnZhbD7v8/rwCpsixQygU9K1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIXsrIk6FtGgvCY0Tfy6PNcKPJfoDzogwlFSTgMSH2obn4EhcLl+DXfB7aAvQMaVT3WevPEbq0GrMQ82j2oGrTIWHAYEedGVcXCp2pytwpg9KRxdpNs0g/tGryOjH8cs5L1qqyn6UWC2UnGgi62wUC0n3ecgoVzZP9zn3qHRHjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QLqyt/cB; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so617a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 10:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774458512; cv=none;
        d=google.com; s=arc-20240605;
        b=EigeKkKO2+HScPX+JRIrAR9LAQMj8nL050tZXDKOaO9CaBaoBDItI7mgLWyZhWwryB
         QilvysZXmX0+WKSM9Et0ySER7oS61Rg6gXYedkStlhA7xZBABqi2HrCQwTEzSl42h7V5
         E7y17VFwtgAq7d+8l6gQMjsznmw9l8s2y2sMPELx65faMj6BtvkkKR+jCAXSi/u69Z4E
         l1OMukQSzNx+iltWWxMcAqYdF6YTNLa4QnMU2/Xexk/WaewwHf7/ducXBoawXPdo7UDo
         SiSxQQM9+5UHRJf86oJdsKUCE3oYK+/+t4xDDx8lO0aOyJ77hc5saIFj5zZi0hZK6zxU
         EdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2SA21GpYatS67AvAzCFnZhbD7v8/rwCpsixQygU9K1g=;
        fh=qdA1SrQ66EwVbuRVgs+v8KSo71kvyTeCwoETCKYoEFE=;
        b=g3OHuZ8qkyfTmz3IhtnNB2eVjsDdQ+ponm+AHI2+H5Md0L1SXHdb5X1BZHaqUBJ5QU
         ylv30GtzNSr3AJbUckSZwJxdspYr00geWrFgMWZREbT94yiDxLb0CY4Nsp5jYPEXqVoM
         oqmBVCommzjY5koX9ToPi2D1ghoyYDZRTdIcI9MmQME9WpyYZ4hM40PXHPGySlztn5uG
         jS7Cyf1qDcUJkvJ/PNdJWbPF6x18n1IkRpBFm02BgyoACqn5WZAAYvQJ72HwiVNHwzha
         71ULlWt+rna4UROBpiOLYtDJWuVQeKwJw0TTaaAolhVSkrtuxfpNbtv9+672rtHq49N4
         t5xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774458512; x=1775063312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SA21GpYatS67AvAzCFnZhbD7v8/rwCpsixQygU9K1g=;
        b=QLqyt/cBYWYCqcT8lwqot2UE7BgA+9Vbyq0lLUsokMYgsnVkLeG5YZhj9xOcEZUwNw
         6LqrziOPSRqeD4XOjcgnJUv23+pDGU7R+eax7301YEkS/df29kb5j+UTKxrPwtXgSqQq
         tVdkHaLMwP57YeGl08J6W1ZRyfL0WqGDDuIW10Wk39XR0QR3TrA8sanRnfJbcGQW4rx5
         4+y9Y46K+68FyNAXJqoIPaiEAs60putkNA72giRGpq69GvEAaynq8Y6hZZbjS6aqMCS/
         msS6G53ZL3JAUDJ3+13dIigLB/fut4z1oHF2xQCS37RJh6UgvN96qmY8Yl92pU1phtv9
         yXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458512; x=1775063312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SA21GpYatS67AvAzCFnZhbD7v8/rwCpsixQygU9K1g=;
        b=MT/Y1o5fgBkSZLTrKrTsEHeqfVHYFdlm1GrOwLSvYKIuRs6YVXN7Y0EZTSAlRfzDxa
         jY6Wci8Jt92tmhEzDwz4fGZC47LEsruG4C5Di7IDycGOUso2EAMozma2GyH4s+fSmDTr
         8/e3tE6A/8X+iSLfI+8IInSmM+1mExuBLSek7+8YqIMfNDhsSyGQGumRWsouYe6r/kqQ
         qxNLuNx6e7Q7cRrLvgrZpHSiCGe+6snCyMNg6lH82ktgmg4KmGDhqDH7lFgX3OMhIfBx
         Tw9i4nJ8/bxGVUgwzrtPzoLLQ1irhyNBbOJ6nNWHvJPU8KE6BtFjxzC4/WpTQYxB58AD
         p3fw==
X-Forwarded-Encrypted: i=1; AJvYcCWnmBiI8QbzyuYgIR54DEDngvy3o/JodEF+byos0piIIsT/yy/qrDcvx9AwrNYDZB900STMzYsnuKABVO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZLA7b4xfRL16ua2if4ZQ5OqC9Z/vvaDOgXv4mTHZApJVlTkZf
	UGSgMy2HvHCrTmViSMUILOXmYjuqwdZJgIOTwVb6spTz310fLVv2hcewdiiEaXmXWVfnHg6j/Bo
	A9HCIBmL5e6W0285Ysf32jaXpBta42mmbEnD9XYA3
X-Gm-Gg: ATEYQzzBdokb4Xj8X6HE/i5XRroQNRKg4CmGOtGkDatpMWIk+bFLepne3mxIbY4chct
	91q0/DztZzCeKrzQpuKlHFm/ruCw+pJXCD2U53lFLyEWVumIIgbo7SNnPGybrhsi0J8ULTxrYQU
	acsglWhiXprj5P5bkjPC7ZuKEPVzvSkzC3YJ93jJgrMq5LexYAmeSRxVkBW5IMXbwD51X35uNvy
	Qmos4D9soVC0EFQs0B8T20GzEAi6SoKcg3NxV/M1JzVl0+Mh3tzHBWsXBcaCySYfD8xsCS5sX4B
	VrJu0yACsLDd0CkLsPGmGqFX76FfPxruN4E=
X-Received: by 2002:a05:6402:a2cb:20b0:664:6b93:8547 with SMTP id
 4fb4d7f45d1cf-66ad906d8acmr795a12.12.1774458511306; Wed, 25 Mar 2026 10:08:31
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net> <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net> <20260319235443.GB769346@ax162>
 <DH7XVDAUF5JT.2U3SPHXDFH8PS@garyguo.net> <CAF1bQ=T8-tWaB5Sf2eqWSodMgp=Pf9Guut-JavV62dczHpGNBg@mail.gmail.com>
In-Reply-To: <CAF1bQ=T8-tWaB5Sf2eqWSodMgp=Pf9Guut-JavV62dczHpGNBg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 25 Mar 2026 17:08:18 +0000
X-Gm-Features: AQROBzDqH2vQpnCwpt0XUgrDzcnbSYyl3KDW_HT4rSwIQ7t-2lYSQNEQfa3eF1I
Message-ID: <CAF1bQ=Q+iY_HTngUsdM4RWVf=Jt3K9uPkSncaL0vTQBCxNnmDw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12262-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,garyguo.net:email]
X-Rspamd-Queue-Id: 5EE79329B12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(Resend in plain-text mode)

I have reviewed this patch and it looks good to me. I suggest updating
autofdo.rst to explicitly mention support for Rust.

Regarding the naming convention, I understand Gary's point that Clang
and Rust should both be viewed as LLVM frontends. I am open to
renaming *FLAGS_AUTOFDO_CLANG to *FLAGS_AUTOFDO_LLVM. However, I would
prefer not to use *FLAGS_AUTOFDO, as GCC also supports AutoFDO, but it
hasn't been integrated into kernel builds yet.

These naming updates can be handled in a separate patch.


On Wed, Mar 25, 2026 at 5:01=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> I have reviewed this patch and it looks good to me. I suggest updating au=
tofdo.rst to explicitly mention support for Rust.
>
> Regarding the naming convention, I understand Gary's point that Clang and=
 Rust should both be viewed as LLVM frontends. I am open to renaming *FLAGS=
_AUTOFDO_CLANG to *FLAGS_AUTOFDO_LLVM. However, I would prefer not to use *=
FLAGS_AUTOFDO, as GCC also supports AutoFDO, but it hasn't been integrated =
into kernel builds yet.
>
> These naming updates can be handled in a separate patch.
>
> Reviewed-by: Rong Xu <xur@google.com>
>
>
> On Fri, Mar 20, 2026 at 9:48=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> On Thu Mar 19, 2026 at 11:54 PM GMT, Nathan Chancellor wrote:
>> > On Thu, Mar 19, 2026 at 07:09:22PM +0000, Gary Guo wrote:
>> >> On Thu Mar 19, 2026 at 4:33 PM GMT, Alice Ryhl wrote:
>> >> > On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net=
> wrote:
>> >> >> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
>> >> >> > Do you think it's worth having Rust not match the CFLAGS here?
>> >> >> >
>> >> >>
>> >> >> I think the C flags should probably be renamed AUTOFDO_LLVM too. A=
fter call, all
>> >> >> the perf tools involved here are called llvm-foobar as well.
>> >> >
>> >> > But isn't it just called this because the config option is
>> >> > CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to th=
at
>> >> > particular config option. It may make sense to rename
>> >> > CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
>> >> > this change, in my opinion.
>> >>
>> >> I get that it's an existing config name, but previously it is a corre=
ct
>> >> description, while after this change it is no longer accurate.
>> >>
>> >> I don't know if there's an established practice on renaming CONFIG op=
tions when
>> >> this sort thing happens though. Perhaps one way is to have add
>> >> CONFIG_AUTOFDO_CLANG that selects CONFIG_AUTOFDO.
>> >
>> > As Miguel mentioned, there is the transitional keyword for Kconfig to
>> > handle renames now but I would really like there to be a compelling
>> > reason for the rename other than LLVM is a little more accurate than
>> > CLANG. The kernel has never really done a great job of referring to
>> > Clang when it means the C compiler vs. the whole LLVM toolchain (like
>> > LTO_CLANG and all its derivatives should be LTO_LLVM since it requires
>> > ld.lld, llvm-nm, and llvm-ar in addition to clang). Additionally, asid=
e
>> > from the configuration, there is the user facing Make variable
>> > CLANG_AUTOFDO_PROFILE that would presumably need to be changed for
>> > consistency.
>>
>> If you think the config name should be kept as CONFIG_AUTOFDO_CLANG, the=
n I
>> think there is no real benefit in changing the variable name.
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>
>> Best,
>> Gary

