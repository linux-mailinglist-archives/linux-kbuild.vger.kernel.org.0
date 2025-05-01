Return-Path: <linux-kbuild+bounces-6850-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BC3AA677E
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 01:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB8759A7EAE
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 23:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5ABA26B2B1;
	Thu,  1 May 2025 23:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VxQXFUoN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEBC266563
	for <linux-kbuild@vger.kernel.org>; Thu,  1 May 2025 23:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142697; cv=none; b=AKKLcj0gD3fUoa1VfRT6yAx+cxTcBUs3iXuqMUFPand27esSCh7259YWcQHWqZUaYaX9c0dYh1eRDc7Rym7ZVHc6VzoxHv4n2xmvIRAP+qLu85+cyeJgH0EOfwO3B2b1u9sySOs0dAM9FDumtbN/UATScJ2Wx1Mh9EMk9sonThc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142697; c=relaxed/simple;
	bh=0bE9+sg8qqZlZPymEWPsuaZnLc6tICoEgjFXMIsxwYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hee+x0B0x4w+ZZtRT2sC1ntXEdOzZBhTRaNhnRdd03YhOtWE0iDam0z4MfcsmVRjsGHEVV3cdKKcjSWwBBBINvP2V95Hh+QhaC1o6C2SEMhXjLEd0WVMy5Wv+jLSysDnrtxslltb9hzAq85NQ1nGhPZODi5a9xdNTjuSREm04m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VxQXFUoN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso308189366b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 May 2025 16:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746142693; x=1746747493; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gOH+RLxLUbard4BV8J+6a/3tBBv1bO45LVfQDoB6LRw=;
        b=VxQXFUoN5lc4MOnY+9vJynqxOl1SFUHBd47o0YyB8aL7tejvZW5F9uBIg2soEkIKu+
         WCCKSzm5WIKwffrkNKJZm7X+RP43EqHf8kuG6R5rLjwQRP6ko//E2TXSuoPtKsoZtgRj
         00WUdAl/mWGxyhoou2cXVueCVtwrkqZvynsos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142693; x=1746747493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOH+RLxLUbard4BV8J+6a/3tBBv1bO45LVfQDoB6LRw=;
        b=c3yUrkSe03txhFDTgpNGDL+UBHW//pdt8JMTm44KeKq2hkiwY/id7WqghhcOykmiHp
         7VH7HiuonOXhmf3h5DCmHzYZ6zrs7cku+8VksL80Nc5/yvFAtfHZlNHC1mbguege351q
         gTQbUGjCXVF6Boc4XwgmDZoGLUJr4AO6XH+IPTiBM8ZIQoWi4+EaHP/SWvrCS86pVBgV
         +sjOIEcjA5PfD8MH/AC5zlU8HYJgAe7mWXZ6JiIObRw+JpcOUglUA8qkxMAZQeF+I2rZ
         E4ENEwG4y2uSwQRb/y2v8ale0OUqTKG0JEFGLpEQC60RN65qTOKKX1O4NFNxCS1g4KmB
         ZMAw==
X-Forwarded-Encrypted: i=1; AJvYcCUtnoHprjPW7xMDyeFkf5hb5rZZ9/rPydMOpqE8smvxlWThCvFfj1mo8Q2waNkJvugqFWpxXsntpfDKlUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YymqLiJ+ROgGxM2d3WI46/iEIxQIF0OOkEzb+eQ3ckb4VIcVYEp
	aMR/4oLlL12HkryVkYJRyL8WLvYQmTKy4P2I/ADy3StK2HzDcjkVz/d009z4AA/pH+L4xwuS1rG
	uocI=
X-Gm-Gg: ASbGncuWJj1yp0uUQkTa/1YnXSsNfaFOMm5Zlq3IvcaE38+J8Q1hRu442DSnJpE62K7
	h4LMF4QfvJ2EEoYq6sc/XxP+IpBPVl1ABCCplMS4K1iRTvQJcZ2JTo20N7npi7spacBLiiR4gK8
	+BQa4Bg9gsEyKQQ0pH+rvoLiRNkhqCwfwvsAblgtH58ybK6+/jbFB/HclCAJ+iG4i724+nnRVKN
	/g3lBqZ6S9TnfYBQgnMv33t0szq6o39SlKgpSdQrF6lfuTkchWARPzxRHE2YwfZwyiF8dcc5fEk
	kdboMSGImm8+uCmjhaqLcJxZwK0mcyNAD2TXrI5bsklCNov6YBTJnAP62F1RYTWXXK9i+umAOhv
	hw1G2s0lF9BJ7g/w=
X-Google-Smtp-Source: AGHT+IG6eP3ZQmfqP5FMz/yIiqIWA763BXFuzU6KtCxEWfvIuVuMHvf7l2cRcH6HAPNkSNpI8XJI5w==
X-Received: by 2002:a17:907:96a9:b0:ac7:3916:327d with SMTP id a640c23a62f3a-ad17b00eeb2mr85168966b.60.1746142693213;
        Thu, 01 May 2025 16:38:13 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da57c34asm112363966b.179.2025.05.01.16.38.11
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:38:11 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso308186066b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 May 2025 16:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCeWZyuxv5iHuRmWLaN4CstO5BpVS9qCpTdUZORAE2UGkP+yJBF3+WkKxdZecn802zei49l3JmqH01qpQ=@vger.kernel.org
X-Received: by 2002:a17:907:3c92:b0:ace:c225:c723 with SMTP id
 a640c23a62f3a-ad17ad1a245mr90568166b.12.1746142690891; Thu, 01 May 2025
 16:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org> <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
In-Reply-To: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 May 2025 16:37:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikfj_JLqDQCc+AsymUije3Sm8h30zQeT4yieqRicFOzg@mail.gmail.com>
X-Gm-Features: ATxdqUFyafpfCSgNRMdjOdlgLHXvb-kQiDBd8FWFkiq24cJvTKf1aNAAYT-juyY
Message-ID: <CAHk-=wikfj_JLqDQCc+AsymUije3Sm8h30zQeT4yieqRicFOzg@mail.gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 16:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> How long has that been valid? Because this is certainly new to the
> kernel, and sparse does complain about this initializer.

Sparse is clearly wrong.

I went back to my old K&R book, and the "perhaps in braces" languager
is there in that original (ok, so I only have the "newer" ANSI version
of K&R, so I'm not checking the _original_ original).

I guess we might as well ignore the sparse problem, since sparse ends
up having issues with so many other newer things we're doing, and we
don't have anybody maintaining it.

             Linus

