Return-Path: <linux-kbuild+bounces-4787-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD679D5508
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 22:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C97211F23178
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44B91C9B9A;
	Thu, 21 Nov 2024 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kEIqPTG1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147F31BD9EC
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732225902; cv=none; b=IIAPO7WTKWGqzLqC3/FLCm8irQnz+KP3vEFisN7ZVvwHDsHwPCUm9zSATyDrCKYMdR38qJj3u19yU13IP7ZyRyCTMHvoaNXx2Fqure9wfVYnVoC8c7qRziX2Pkpfpx1vr6w0okpb0U0Ayi68T+HtM/Jgw1McnpLurJARoIihejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732225902; c=relaxed/simple;
	bh=CUHno2R/nqM+vBmK7dZ3xoXb1J1KeGJmhbGs1sQeZCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vv4jtXAHnndR7MlkvLcZ03h6Zapheu9YGpkCpFwXsoy7NO9wLNfvX4cGpTAgsa9ISuxGco6OoTuX3qbyDRMN4/Rnj1GsqTtRhXD8yTJjgsuh0jA83nG9rFqp7H/bAflP1NXWFtKBy8KwggDbZjcc+lmjT8Hliey55pg148S6OtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kEIqPTG1; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so894a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 13:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732225899; x=1732830699; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PHKKmDtuZBsmU0fuCBMeHOOxdDx2/H6XhfP9M3Cqc2M=;
        b=kEIqPTG1CrpRFE7rljT36R+QGJJRvQbOsXgc6y6bNvGCNHni43f3mM3MT6Oc7/s63H
         zLjcfQ57L6CaYZi5lyWy6SYSmmgt/u6ZU5qWC99X6XuONXmJCcqbM4HpDPEUeKQ2gmxX
         BRrTaZBlnVGBdJ1vywdy7Y724MycmflrwQn8ljQ4zJrZ2+/JwOdgknsLMm44FhFZrTiR
         TXT54MhQyjlQiqG+rBU/DxTx8bMaxzgJ1Mkoc04ULDAV4b3kgjDNpwvSEDsoBm9kW6+W
         urLgndy088FSRM8FzgOSji1mzdsQMf9NJFARM5Jz+hpDYVBELN+CWPGwc21M50kwU1fm
         b2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732225899; x=1732830699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHKKmDtuZBsmU0fuCBMeHOOxdDx2/H6XhfP9M3Cqc2M=;
        b=IC8GAlAshru8Y4BTL5JMGz/t4IEC5zbzDabxQTdxJ3h8oe0iTSUO74Im7VKOgd9JSB
         mcLOTrEJmWAYc9hfn25UTVoChYXfC+5VjFLEbw3kZeNX0LbX4V9oEHnsHYId2UlCKXfi
         65ESWAgh5v4zoISLg3G5te8BYvTM9m7oOHkRjNVpHJD2g1vHnD084Qy6dDbSLm+Inuna
         kLR1ieYqcP5Pr7j5Eib+4budrXqim1aqJjywRDj78GAx+PSoe/eJUtsk9PjqGHEdJIpE
         EQkE7sveQRW28hHJ2D9GHDRQjXMt7j7Eg8PNdED2awLl068HSSJ98dDs4dM9LDIEcIag
         XdNA==
X-Forwarded-Encrypted: i=1; AJvYcCVwOkhCbrGKTtgVTed2Z9yxGaaEokqyKhViL53QhSNVYPlLtcw4jyg45ayrlXbFppczj5QNx/AYgzNux+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7O60NrSzjJuVjPXytxaFzdz4lDYp98LLMugH0gm7u3gcgIZON
	to+j+No3s8/i9y0nQDRzkRFNgPI87Uo2uriPnmNklmHd1JQDRX/5d1zh1VzPkRT8Y3F22+sH/jK
	7qRpw7+ojD2mnwVZI48VH90f09FHJlsccDXLS
X-Gm-Gg: ASbGncvSYF7e4tgUk/QejI1TAv8rBqgEpHU41KPSbjorTaxu9YBB3kVSVh5s+FhcGqw
	R3D9oYtXs7//2zbVc7KVDLyeNyLNI2SSkL3NKusBUAXVEHHh77tdgdd21aYvL4x5m
X-Google-Smtp-Source: AGHT+IHZXqsbw6LTrWSKQk3j6sgwFD4xI5UHXnS7pvVevPPLF9iib3NRzS9gCFTmnjvbHI8Vhd+KqI0rHViR8+rmNRI=
X-Received: by 2002:aa7:d6cd:0:b0:5cf:bd9a:41ec with SMTP id
 4fb4d7f45d1cf-5d01dcbf0c4mr18135a12.2.1732225899042; Thu, 21 Nov 2024
 13:51:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org> <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org> <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org> <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
 <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
In-Reply-To: <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 21 Nov 2024 13:51:26 -0800
Message-ID: <CAGSQo03nq5tnqyp8eDZYA7CbjUPZeKs+A33oeSw3znTO9GRF_g@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000638ddf062773456e"

--000000000000638ddf062773456e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 2:38=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org>=
 wrote:
>
> On Wed, Nov 06, 2024 at 02:19:38PM -0800, Matthew Maurer wrote:
> > >
> > > > If booted against an old kernel, it will
> > > > behave as though there is no modversions information.
> > >
> > > Huh? This I don't get. If you have the new libkmod and boot
> > > an old kernel, that should just not break becauase well, long
> > > symbols were not ever supported properly anyway, so no regression.
> >
> > Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and
> > then load said module with a kernel *before* EXTENDED_MODVERSIONS
> > existed, it will see no modversion info on the module to check. This
> > will be true regardless of symbol length.
>
> Isn't that just the same as disabling modverisons?
>
> If you select modversions, you get the options to choose:
>
>   - old modversions
>   - old modversions + extended modversions
>   - extended modversions only

Yes, what I'm pointing out is that kernels before the introduction of
extended modversions will not know how to read extended modversions,
and so they will treat modules with *only* extended modversions as
though they have no modversions.

>
> > > I'm not quite sure I understood your last comment here though,
> > > can you clarify what you meant?
> > >
> > > Anyway, so now that this is all cleared up, the next question I have
> > > is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
> > > userspace requirements aren't large at all, what actual benefits does
> > > using this new extended mod versions have? Why wouldn't a distro end
> > > up preferring this for say a future release for all modules?
> >
> > I think a distro will end up preferring using this for all modules,
> > but was intending to put both in for a transitional period until the
> > new format was more accepted.
>
> The only thing left I think to test is the impact at runtime, and the
> only thing I can think of is first we use find_symbol() on resolve_symbol=
()
> which it took me a while to review and realize that this just uses a
> completely different ELF section, the the ksymtab sections which are spli=
t up
> between the old and the gpl section. But after that we use check_version(=
).
> I suspect the major overhead here is in find_symbol() and that's in no wa=
y shape
> or form affected by your changes, and I also suspect that since the
> way you implemented for_each_modversion_info_ext() is just *one* search
> there shouldn't be any penalty here at all. Given it took *me* a while
> to review all this, I think it would be good for you to also expand your
> cover letter to be crystal clear on these expectations to users and
> developers and if anything expand on the Kconfig / and add documentation
> if we don't document any of this.

I can add a commit extending modules.rst, but it's not clear to me
what piece was surprising here - the existing MODVERSIONS format is
*also* in a separate section. Nothing written in the "Module
Versioning" section has been invalidated that I can see.

Things I could think to add:

* Summary of the internal data format (seems odd, since the previous
one isn't here, and I'd think that an implementation detail anyways)
* A warning about the effects of NO_BASIC_MODVERSIONS (probably better
in Kconfig, isn't in the current changeset because the flag isn't
there)

>
> I'd still like to see you guys test all this with the new TEST_KALLSYMS.

I've attached the results of running TEST_KALLSYMS - it appears to be
irrelevant to performance, as you expected.

>
>   Luis

--000000000000638ddf062773456e
Content-Type: application/octet-stream; name=extended-log
Content-Disposition: attachment; filename=extended-log
Content-Transfer-Encoding: base64
Content-ID: <f_m3rujd550>
X-Attachment-Id: f_m3rujd550

VEFQIHZlcnNpb24gMTMKMS4uMQojIHRpbWVvdXQgc2V0IHRvIDQ1CiMgc2VsZnRlc3RzOiBtb2R1
bGU6IGZpbmRfc3ltYm9sLnNoCiMKIyAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3IgJy9z
YmluL21vZHByb2JlIHRlc3Rfa2FsbHN5bXNfYic6CiMKIyAgICAgICAgICAgMjg4OTgwMzIgbnMg
ICBkdXJhdGlvbl90aW1lCiMgICAgICAgICAgICAyMzY2MDAwIG5zICAgdXNlcl90aW1lCiMgICAg
ICAgICAgICAgICAgMjA3ICAgICAgcGFnZS1mYXVsdHMKIwojICAgICAgICAwLjAyMDA4NTk5MSBz
ZWNvbmRzIHRpbWUgZWxhcHNlZAojCiMgICAgICAgIDAuMDAyMzY2MDAwIHNlY29uZHMgdXNlcgoj
ICAgICAgICAwLjAwMDAwMDAwMCBzZWNvbmRzIHN5cwojCiMKIwojICBQZXJmb3JtYW5jZSBjb3Vu
dGVyIHN0YXRzIGZvciAnL3NiaW4vbW9kcHJvYmUgdGVzdF9rYWxsc3ltc19iJzoKIwojICAgICAg
ICAgICAyNTMzMzY0MCBucyAgIGR1cmF0aW9uX3RpbWUKIyAgICAgICAgICAgICAgMzIwMDAgbnMg
ICB1c2VyX3RpbWUKIyAgICAgICAgICAgIDIzNTcwMDAgbnMgICBzeXN0ZW1fdGltZQojICAgICAg
ICAgICAgICAgIDIwNyAgICAgIHBhZ2UtZmF1bHRzCiMKIyAgICAgICAgMC4wMjQwODM5NTcgc2Vj
b25kcyB0aW1lIGVsYXBzZWQKIwojICAgICAgICAwLjAwMDAzMjAwMCBzZWNvbmRzIHVzZXIKIyAg
ICAgICAgMC4wMDIzNTcwMDAgc2Vjb25kcyBzeXMKIwojCiMKIyAgUGVyZm9ybWFuY2UgY291bnRl
ciBzdGF0cyBmb3IgJy9zYmluL21vZHByb2JlIHRlc3Rfa2FsbHN5bXNfYic6CiMKIyAgICAgICAg
ICAgMjUzOTg2MDAgbnMgICBkdXJhdGlvbl90aW1lCiMgICAgICAgICAgICAgIDMwMDAwIG5zICAg
dXNlcl90aW1lCiMgICAgICAgICAgICAyMjY5MDAwIG5zICAgc3lzdGVtX3RpbWUKIyAgICAgICAg
ICAgICAgICAyMDggICAgICBwYWdlLWZhdWx0cwojCiMgICAgICAgIDAuMDI0MDk1MjA0IHNlY29u
ZHMgdGltZSBlbGFwc2VkCiMKIyAgICAgICAgMC4wMDAwMzAwMDAgc2Vjb25kcyB1c2VyCiMgICAg
ICAgIDAuMDAyMjY5MDAwIHNlY29uZHMgc3lzCiMKIwpvayAxIHNlbGZ0ZXN0czogbW9kdWxlOiBm
aW5kX3N5bWJvbC5zaAovc2VsZnRlc3RzICMgemNhdCAvcHJvYy9jb25maWcuZ3ogfCBncmVwIEVY
VEVOREVECiMgQ09ORklHX1g4Nl9FWFRFTkRFRF9QTEFURk9STSBpcyBub3Qgc2V0CkNPTkZJR19F
WFRFTkRFRF9NT0RWRVJTSU9OUz15CiMgQ09ORklHX05FVENPTlNPTEVfRVhURU5ERURfTE9HIGlz
IG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0VYVEVOREVEPXkKL3NlbGZ0ZXN0cyAjCg==
--000000000000638ddf062773456e
Content-Type: application/octet-stream; name=noextend-log
Content-Disposition: attachment; filename=noextend-log
Content-Transfer-Encoding: base64
Content-ID: <f_m3rujd5y1>
X-Attachment-Id: f_m3rujd5y1

VEFQIHZlcnNpb24gMTMKMS4uMQojIHRpbWVvdXQgc2V0IHRvIDQ1CiMgc2VsZnRlc3RzOiBtb2R1
bGU6IGZpbmRfc3ltYm9sLnNoCiMKIyAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3IgJy9z
YmluL21vZHByb2JlIHRlc3Rfa2FsbHN5bXNfYic6CiMKIyAgICAgICAgICAgMzA0NzczNDggbnMg
ICBkdXJhdGlvbl90aW1lCiMgICAgICAgICAgICAyNDk0MDAwIG5zICAgdXNlcl90aW1lCiMgICAg
ICAgICAgICAgICAgMjA2ICAgICAgcGFnZS1mYXVsdHMKIwojICAgICAgICAwLjAyNDA3ODUyNyBz
ZWNvbmRzIHRpbWUgZWxhcHNlZAojCiMgICAgICAgIDAuMDAyNDk0MDAwIHNlY29uZHMgdXNlcgoj
ICAgICAgICAwLjAwMDAwMDAwMCBzZWNvbmRzIHN5cwojCiMKIwojICBQZXJmb3JtYW5jZSBjb3Vu
dGVyIHN0YXRzIGZvciAnL3NiaW4vbW9kcHJvYmUgdGVzdF9rYWxsc3ltc19iJzoKIwojICAgICAg
ICAgICAyNTI2NDM4NSBucyAgIGR1cmF0aW9uX3RpbWUKIyAgICAgICAgICAgICAgMzQwMDAgbnMg
ICB1c2VyX3RpbWUKIyAgICAgICAgICAgIDIzNTEwMDAgbnMgICBzeXN0ZW1fdGltZQojICAgICAg
ICAgICAgICAgIDIwNyAgICAgIHBhZ2UtZmF1bHRzCiMKIyAgICAgICAgMC4wMjQwODE5ODAgc2Vj
b25kcyB0aW1lIGVsYXBzZWQKIwojICAgICAgICAwLjAwMDAzNDAwMCBzZWNvbmRzIHVzZXIKIyAg
ICAgICAgMC4wMDIzNTEwMDAgc2Vjb25kcyBzeXMKIwojCiMKIyAgUGVyZm9ybWFuY2UgY291bnRl
ciBzdGF0cyBmb3IgJy9zYmluL21vZHByb2JlIHRlc3Rfa2FsbHN5bXNfYic6CiMKIyAgICAgICAg
ICAgMjUzMDA2NDQgbnMgICBkdXJhdGlvbl90aW1lCiMgICAgICAgICAgICAgIDMzMDAwIG5zICAg
dXNlcl90aW1lCiMgICAgICAgICAgICAyMzA3MDAwIG5zICAgc3lzdGVtX3RpbWUKIyAgICAgICAg
ICAgICAgICAyMDcgICAgICBwYWdlLWZhdWx0cwojCiMgICAgICAgIDAuMDI0MTA5NDA5IHNlY29u
ZHMgdGltZSBlbGFwc2VkCiMKIyAgICAgICAgMC4wMDAwMzMwMDAgc2Vjb25kcyB1c2VyCiMgICAg
ICAgIDAuMDAyMzA3MDAwIHNlY29uZHMgc3lzCiMKIwpvayAxIHNlbGZ0ZXN0czogbW9kdWxlOiBm
aW5kX3N5bWJvbC5zaAovc2VsZnRlc3RzICMgemNhdCAvcHJvYy9jb25maWcuZ3ogfCBncmVwIEVY
VEVORAojIENPTkZJR19YODZfRVhURU5ERURfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19F
WFRFTkRFRF9NT0RWRVJTSU9OUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVENPTlNPTEVfRVhURU5E
RURfTE9HIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0VYVEVOREVEPXkKL3NlbGZ0ZXN0
cyAjCgo=
--000000000000638ddf062773456e--

