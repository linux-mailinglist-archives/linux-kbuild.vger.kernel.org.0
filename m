Return-Path: <linux-kbuild+bounces-3927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B423991B75
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 02:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3474D1C21336
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 00:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C87914B97D;
	Sun,  6 Oct 2024 00:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CNGD7CdI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76B14A4C7
	for <linux-kbuild@vger.kernel.org>; Sun,  6 Oct 2024 00:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728172824; cv=none; b=olekuzazA8tjFD+yPiMYB0peQMGU9eQusjMYXlkBEIFEJ6Lj+cXxgLKLWWzzTtAPlZ4v5/IUxbKB4+MLGTVmvhbQLRRrurR4C8I4YuGIzcM0ooKuUOebpEF4fdf4ekko5uMJwSq2pd3wopzauBYjfLcd7i+IUpC3YAdhvBDpREw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728172824; c=relaxed/simple;
	bh=7PhV7mSmrjXdm322I5AhDI6uiC32DXT2Ek81VrbJ7rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWSIlfkVOLnTsVXGtuqbsXS/M2d5THVM7bW8hzgQGncU9YTlBLYuCQ69/EdOVF1TLUvtwyjvdXrrAt1D8O/iDnSR4qAbd3Ky3k/rQme3Rd1Q7wJyCjp5OyfPTbRZuHAQFTSbxdL1NS4b2fL49sMiNMUYNDiR4dfVa2dTuBftt74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CNGD7CdI; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d4979b843so447077066b.3
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Oct 2024 17:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728172820; x=1728777620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=CNGD7CdIOClJhcLYG9ntsWd8/Pe7GOP3FefTSnKsW8aF3bV615u75bmAR4OPbV+bsW
         WB1rHJpgWgnwfSLjOchQmBkL78KViCNU1YVQ/oc6sMPlIwQMQTMO38khw0/fvnDGYZ2T
         MnAzKThZtqyovT+cE1C72ijaQA+da5l4gRr6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728172820; x=1728777620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=lS0lhTOh6tNuyKGZKoEIWEuXMknplqDxh9oxnUte4ZY/EkzanR8vegllQ3sXcUCwKQ
         mtyZZyKFUP+0ZjwLavhMmyZvlaoU4fztGWq4Fa8XE6VLQAus0G4sPPBanvKGzW3sPfAD
         wksxGAinkhVLIKbCEzvYqRV9Mw1sp99Ap7tJhgZsUxumhYPmi1rYXZyMZCfnQ+d99DWV
         nnWmocnNFHXjtTKC3J2Ep1zOTdFGJjneoYSigSCZRAOFF2FXsmAtsvWF6IwcvvIPfqwO
         8zx/eaBnkzNtmUtlEH1pIYXqyIVw4ygBfYio26k9LIVxP/x9cemqoTolUmKgXjCIePNg
         oqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVK1kns1dm4V09rJbkFdGykhhgNCLgWJRd2bxS984MA5r3/lc53NMXsL9WX4kZiL/D3brOztxrLw2z3Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YweoQTut3GXTIgpcAW+WJmOJmFGpjsZl7BVbAiv/ftUUE0neA4P
	4T8ifGp/jEH761EIYAAd2Ufwz7e7o1Kmsg0IBIKGrAj9HMgLSDUVQYhrszVkkwiFJQYVLyQv2X+
	q9umUBQ==
X-Google-Smtp-Source: AGHT+IHxJTPvqzoEfrnoi3unNQxt/xuAvirfdUxnnbr7MCc5DWmJPWU5pCQp1kXCVZz5YKN4WqMUvg==
X-Received: by 2002:a17:907:7b8d:b0:a8d:51d6:b3ef with SMTP id a640c23a62f3a-a991c00edf9mr765012466b.56.1728172820498;
        Sat, 05 Oct 2024 17:00:20 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994348e9ccsm86039666b.77.2024.10.05.17.00.18
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 17:00:19 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a993f6916daso94270666b.1
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Oct 2024 17:00:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUz/xWqY2C1BrQ0mf+Dfl9IPkwiC88QbBuzgzlSTeRLTxMhfkTO0d66PNWCs+uRqdEK+0Ke8fW09ZUhsIM=@vger.kernel.org
X-Received: by 2002:a17:907:9693:b0:a99:3d93:c8bc with SMTP id
 a640c23a62f3a-a993d93cc22mr339286866b.13.1728172818387; Sat, 05 Oct 2024
 17:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
In-Reply-To: <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Oct 2024 17:00:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
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

On Sat, 5 Oct 2024 at 16:37, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Sadly, that is not correct; neither gcc nor clang uses lea:

Looking around, this may be intentional. At least according to Agner,
several cores do better at "mov immediate" compared to "lea".

Eg a RIP-relative LEA on Zen 2 gets a throughput of two per cycle, but
a "MOV r,i" gets four. That got fixed in Zen 3 and later, but
apparently Intel had similar issues (Ivy Bridge: 1 LEA per cycle, vs 3
"mov i,r". Haswell is 1:4).

Of course, Agner's tables are good, but not necessarily always the
whole story. There are other instruction tables on the internet (eg
uops.info) with possibly more info.

And in reality, I would expect it to be a complete non-issue with any
OoO engine and real code, because you are very seldom ALU limited
particularly when there aren't any data dependencies.

But a RIP-relative LEA does seem to put a *bit* more pressure on the
core resources, so the compilers are may be right to pick a "mov".

               Linus

