Return-Path: <linux-kbuild+bounces-3770-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD149864F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 18:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F631F25ACC
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 16:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0369C43154;
	Wed, 25 Sep 2024 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RhSFunWz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332DFDDC5
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727282388; cv=none; b=LRCg06LxTdEvYBLZg42ssti4v1NrNtGWDMTAYWeB9IfpKKCAP7Vmwf/frW3EWwZlmAl3es49srMpsELmJ/tOgVjkozvEYkWWgZs33+2lHfr1pG2ur+bGZvxQNIJPYAZN3W1y9ECgqiNu+HBUI90lz4fNuZOpQ+TBKeEgoZk8DbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727282388; c=relaxed/simple;
	bh=/t+YSp2gvbsBW9hsAIIEsn2fOHY2XQVupxHXFI22op4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbSl0DKAmJzplTs9VJlPED2WslYYi9BiQX3IOroRC/NztChVcDa4fyQP0miJBj6amubfxKGjlQro1x9/PlaUO4py02dhhmmfvVmH+ykP19ZLplYBk5r9L3M/pGb9nFmijeVcxZ3rQNInpAvkiI2MRNTnAxp0eRKqk4mvCYjJ5IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RhSFunWz; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c24c92f699so7312315a12.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727282385; x=1727887185; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=RhSFunWzb9vaRlim0Lsg/GoWlHUKdQYv+PVv04vdjB0e0D7FcmBLmsZvjNoZCl0Jy6
         S87PIpy3mtKtoLHz4YrDzghWbH0z3ah86GgMpsobKwrFjY2Br64WnOppL7wqHDcR1eVg
         /G/1ESdMgZhtCYTqF3dQwxH1BNJaFO+2JDM7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727282385; x=1727887185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=xTEJWR+jaw0xzFZk+xF2dvkXEHwNR9CjxzdReKyW7GJsrzE9CirsypRF7BsmMvooiz
         Kza6qqU0KtQwOEm+LX2u2hpaOHWLOA6uQOJPHZlwCnqMP7GHB6EKobw6FpPwhGIr+UIr
         sQYWrj2X1yWto/I3WF+ysZPwzV5foUBxI8jHSzwj3yVXl5taZpX6KsM+p12yS1P8u0R5
         /7w228/ijq/26TJZRW2DK8VNZSN2TDBS+h9nTrBjiMpD8z3aYwCMk0iKn6AnnjZf2Iop
         f3fU/7iqiRg4d/LIQ1SVFsEUxrqnu1ZEHgnCGjYjYJkvcNiZaMDfi+hNXc0qGfI1BUU0
         SHPA==
X-Forwarded-Encrypted: i=1; AJvYcCU191oSkf+OiFQBh+Lw+Bc1Eo+CfUpthIsWeC/9/v/ghmjJZ8xBIEvN/iuo9x/f1rJfEQo43AzrDynQzLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTexx/FCstbyS+6Wi+v5YzmNTuzDzAkcnHIWOwVwHlsVxQEY8f
	Wlcg/PyrYzVZBmwP1GKZTf+QRG4L1EBYi2zH2fV3iFkGafRm85OyJyDcTKWttis09gWZhvTNmiX
	yaduBSg==
X-Google-Smtp-Source: AGHT+IHLUrXrwQ3xKRe/N2XOAUh6F5hgtyZtRWUo8s4HhnEq1rF6XmxkU8ADAa7h8I2bYEB4ppA4ig==
X-Received: by 2002:a17:907:f70d:b0:a8d:4243:2365 with SMTP id a640c23a62f3a-a93a05e7f4fmr302974866b.41.1727282385222;
        Wed, 25 Sep 2024 09:39:45 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93a5b82fbasm85820766b.103.2024.09.25.09.39.43
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 09:39:44 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d60e23b33so7467766b.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 09:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUyFIT5vWqqTWnkYtq11bLZkiySReqIrebe8WoSS/iO71aeyp/5D1SMzbPscx7N0gRJYuwt90ZMzl7+Og=@vger.kernel.org
X-Received: by 2002:a17:906:f5a9:b0:a86:9d39:a2a with SMTP id
 a640c23a62f3a-a93a0330c37mr309689066b.8.1727282382886; Wed, 25 Sep 2024
 09:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-44-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-44-ardb+git@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Sep 2024 09:39:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Subject: Re: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for
 return address
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
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

On Wed, 25 Sept 2024 at 08:16, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> Instead of pushing an immediate absolute address, which is incompatible
> with PIE codegen or linking, use a LEA instruction to take the address
> into a register.

I don't think you can do this - it corrupts %rdi.

Yes, the code uses  %rdi later, but that's inside the SAVE_REGS_STRING
/ RESTORE_REGS_STRING area.

And we do have special calling conventions that aren't the regular
ones, so %rdi might actually be used elsewhere. For example,
__get_user_X and __put_user_X all have magical calling conventions:
they don't actually use %rdi, but part of the calling convention is
that the unused registers aren't modified.

Of course, I'm not actually sure you can probe those and trigger this
issue, but it all makes me think it's broken.

And it's entirely possible that I'm wrong for some reason, but this
just _looks_ very very wrong to me.

I think you can do this with a "pushq mem" instead, and put the
relocation into the memory location.

                 Linus

