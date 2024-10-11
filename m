Return-Path: <linux-kbuild+bounces-4063-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695EA99AEA4
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 00:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9817D1C21C32
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 22:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B351D1F6B;
	Fri, 11 Oct 2024 22:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vfYElzHk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D066E1D1F73
	for <linux-kbuild@vger.kernel.org>; Fri, 11 Oct 2024 22:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728685666; cv=none; b=dcrRvoMe8wCfPMFd0vmlioVBgfSsDW4Eg+vr4w1d1CGQIgftNp3K81HvnpX2Zr4931cImkirZI7zUU1BxlKSFLAYlSgTu2S+3XMK1tKhO+Tg8cmb+Gdu2h1YvuqugHj4XhqdbvF3N/XXAh9F+DMFjtPdgDPaMOvivK6ROpoK+bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728685666; c=relaxed/simple;
	bh=XpfQ/8ANSakz+1OrHfeuAfLdOL6Di6vnxD3AKYtRJCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m62fZ1rb34aOhKxQBO+LVr6H2fE14SFgvLAE584CqzbBSvy2uIWD8Kg3wiEajvJPuuFiD27ILxNwA5LkcYLuKeHJVrAU45FlJ0WAtt6g+ResV8taiGZ+JR7VyB6sN7k3+wZ65KG0f04wY1QwhhqG/XAHaYjXMs/Q4AUn+yumfqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vfYElzHk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e19d8c41so8473e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Oct 2024 15:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728685662; x=1729290462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+gUxSDkWsGEMXOFebQ5Xw/lGRc6XJ08PqAablVeqL4=;
        b=vfYElzHkb52isYENpIwqjNg6h0yBI/F9gbmORY79m+cZT8aGM+HnCBNj+6YNOdl89k
         XBah9H6MVef0dPSzCRDAYBfIEY//xODyXAqa52LinGavrcX7g7P9aTZNUyuCOHhDu7Y/
         mY9G7+Om1y9QE/YfcfElQv1tz3r3Ldr3unUEnaZ8nXi4feq1ojonPIRgAmbHGJbj46k9
         Jkv+64hHd0Y/i/WRYZTgeCJJ8/mF3LKJnTIlqEaM4T/ihG1Gj9NIRz3ri1g0bnuz5IfI
         Lv31/ecBbMIOe0zgiaFhPQ4HP92VbCXwrMKi2CLX/S80Tl4PKQI4THPDysHz2QcmcLku
         YBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728685662; x=1729290462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+gUxSDkWsGEMXOFebQ5Xw/lGRc6XJ08PqAablVeqL4=;
        b=bJ0kt3ZZs3M2iIie526hqMSpSRGJmUKha3/5iww/Q7t6ml6AWWuj9tVXzkhHi8gYVY
         YIEFaZWijYZ/hXnhwJNudsd7K5sMQYMTjkrgKTqF+GX90uYlIo0tkqiyqGa55SEfxmS0
         gbcGb6EWe8UX9BXSMPuDTBoi2Mok0rwAd4kbEdD3A/SPa4LJv7Vuh9c6iGum18PhUVQr
         lZl9oH51mhimohCciNF6XK2ouZupzvmeo0A5K7HCxjfIPuocWBynjdnhfyqob+kyJO+6
         e8NUzrCtBw4BDqs0M4FXbAhbOGS4yQS4oHCSWaIaToZeSeCO08wojGxp2s/XSuQIPcKF
         VjYw==
X-Forwarded-Encrypted: i=1; AJvYcCV2xyiclm3qVQ1WV24qqakH5OulPANpKunticBynRiqoSyCiUdgwUz7BV8f4T5VfQCtOJT0keKRN3/ciJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhFjbh4O4Ka35VcDp3FP39MlVARMBWQmQxGBXgC6dgjj1xJWYh
	kVWYUrUWcjGfdJszfL07izWozWpAWvCVQ40AfmbQfVDsCM19VKbUFcaiUfNM5J3KDyMnxU5ETCX
	DhPggUKlh2JV8uzxfJBNS4nslWXdH4w8Tijgx
X-Google-Smtp-Source: AGHT+IGXZUm50H+t70ubPlGJraz2/HksPndIYC+fI6Hrd+oxzT344/Iv2iwsY7fhvWCT2jXrm4nAx6oX34CJ6qkR/Wc=
X-Received: by 2002:a05:6512:3d05:b0:535:68b2:9589 with SMTP id
 2adb3069b0e04-539e5f0b82cmr146927e87.2.1728685661778; Fri, 11 Oct 2024
 15:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com> <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
In-Reply-To: <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 11 Oct 2024 15:27:30 -0700
Message-ID: <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 3:22=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Wed, Sep 25, 2024 at 11:38:29PM +0000, Matthew Maurer wrote:
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduc=
e
> > the munging for the new format. Other architectures do not appear to
> > have architecture-specific usage of this information.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> I'm all for the ELF validation work so far, all that was nice, thanks
> for all that tidying up. This however is not considering when we really
> need all this at all, and not making it specific to the build times when
> such things are needed. That is, yes I'd like to see the need for this
> clearly explicitly defined through Kconfig, a *select FOO_FEATURE* for
> when this is needed. No need to extend a module with bloat if we don't
> need it, likewise if a kernel was built without needing those things,
> why bloat the modules with the extra information?

To make sure I understand what you're asking for, are you suggesting:
1. A config flag for supporting parsing the extended format
2. A config flag for supporting parsing the existing format
3. A config flag for putting the extended format into produced modules
4. A config flag for putting the existing format into produced modules
or some combination of the above?

I'm currently reading this as #3, but figured I'd ask to be certain.

>
>   Luis

