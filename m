Return-Path: <linux-kbuild+bounces-3877-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D998E3F5
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Oct 2024 22:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C462286997
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Oct 2024 20:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0F41D0E17;
	Wed,  2 Oct 2024 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IUC/YDiT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D4A1D0E28
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Oct 2024 20:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727899761; cv=none; b=L6Ol2I3IXweOmKeak93VSh10J3dZCfs8tkYtwqzoLX20ELf6eaE0J5+zd7Vd8MvO7Go5l2Da1oKsdMZGs9N4x07pkO5MifBM32d5DURYCIBiIvqhICP04UngCs3OyBX9GHqiFTVqGVq93gX7uXtbtqqU3co0rWrSqMq8N1KfG2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727899761; c=relaxed/simple;
	bh=26ch3VLdZlgASzApmc+sdmN42sQrSbzi8ri/yXB2hcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YG2KF71WcbO+hLuTkERyBHYUBYPf/omuTUse2EMk8oNG37dzHy8bjrLDLEAvVphx00C6A8UVUtagU3wlsCdFuRCtrVx7QceqKqpw94q/t/f0NUWGEE5WLo+o93xSML3s8cimfFg/C3ZuYrf/gWDUOpfA9heRjlzgFgBzLITJu4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IUC/YDiT; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c5cf26b95aso108989a12.3
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2024 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727899757; x=1728504557; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=IUC/YDiTV/KMx8ILUNU37maqL4Zy7z0ilgxxyxyU+0WQf4F4z1gVqAda3vjEwA6tch
         Wo1OkOYLoDNxyfSDzPmPbqFB2sqpfo9DsCOYyHVdnOXCtckAvjRS7XKxMO3KUZPYdvGQ
         o17Ejprfh7C+eWrLvp0KO23nN8SSIM1GAiCOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727899757; x=1728504557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=CQ5uKu0ERcqAAg8uG2oXfvBjg/CnDYSg+JZTsWNcwMgLKVrUI5vWcPD9rV4iOj60n3
         UUISQLAt19ZsQ4Hra8nBd+kk07DBDsMu/p9+uLrleedCBY+s6GBusMjQAaj7vSQgxnO/
         lURSuKJGHqQpkrk2srH9mlPrZlZvR7jRH7l4pOzFIbN9bjP3EGdLy0ptz1eDmL+SdJ1f
         zjWSVuMiVck2T9LAOfXo23nFxjQtdcBv5yuTsDXWVqjIF5O6ek9HsSxR2JGS8wdh9Fxp
         rADBp2qRbL6CHUl6UAG5n0v7XOwf9BnVbJWECVAPsFzVyNf+p56H6f9qhqIMJaC3KcPq
         WK+w==
X-Forwarded-Encrypted: i=1; AJvYcCUYv0RkLo1BDjngVdmX59r4C36YVLZynBLqLNOtRwR41khKFsXB6IpodROCVC1xWd3Fei6rzhcG6cs/IhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxae5o076TbXRumrkQQho2rWrEYlU25RAwuAxwLrdS+invpRkIa
	iNI6vRLm/g5kpct3HWgjL7+JsWntpvXRxh4BiDzajA9BHdvSIEupDAQ2jEMwcl8a6N/LjQEn3L6
	3RpLn5w==
X-Google-Smtp-Source: AGHT+IGAQikYERYZunls35Ya5o0zQrMWN/Ef+8xtLy2Dgb3OddbcOeb94ShIj1hNEJG9rEtsJ7mLyg==
X-Received: by 2002:a05:6402:13cf:b0:5c0:ad76:f703 with SMTP id 4fb4d7f45d1cf-5c8b1b7210fmr3038586a12.24.1727899756821;
        Wed, 02 Oct 2024 13:09:16 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882409f56sm7967417a12.25.2024.10.02.13.09.14
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 13:09:15 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so1146745e9.3
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2024 13:09:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCl8RiVdGMASlMJpgnZMdk46bPIVqb+vNLIZqlvlm9IzQQrNtq91c+ONEudB99KP5i4XqMTOfJ9+CG2TA=@vger.kernel.org
X-Received: by 2002:a05:6512:e9e:b0:535:6795:301a with SMTP id
 2adb3069b0e04-539a079eb59mr2506573e87.47.1727899328912; Wed, 02 Oct 2024
 13:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
In-Reply-To: <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Oct 2024 13:01:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Oct 2024 at 08:31, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> I guess you are referring to the use of a GOT? That is a valid
> concern, but it does not apply here. With hidden visibility and
> compiler command line options like -mdirect-access-extern, all emitted
> symbol references are direct.

I absolutely hate GOT entries. We definitely shouldn't ever do
anything that causes them on x86-64.

I'd much rather just do boot-time relocation, and I don't think the
"we run code at a different location than we told the linker" is an
arghument against it.

Please, let's make sure we never have any of the global offset table horror.

Yes, yes, you can't avoid them on other architectures.

That said, doing changes like changing "mov $sym" to "lea sym(%rip)" I
feel are a complete no-brainer and should be done regardless of any
other code generation issues.

Let's not do relocation for no good reason.

             Linus

