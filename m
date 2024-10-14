Return-Path: <linux-kbuild+bounces-4098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94299D599
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 19:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D251A1C231CF
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 17:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBD01C2DB2;
	Mon, 14 Oct 2024 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S+rmVU81"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84351C2327
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728926997; cv=none; b=B4lfz8fln70DthhSxHU6Su96QCLUabVEgAlJPmeQ//bmy08w8HIpOTsdw5WsvnMQSgq9D/eO51FCFMIw3+wyeT1xINUhtyZ9IiEwcVSNRZQLzIiiNvPKVxsTEAGsfF7TLeDYmnVYzYpfXcVlnslkLGaDg3qAjOJsnz+u8FxlIwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728926997; c=relaxed/simple;
	bh=CSNMcFDDijo4DbM019qkbO66k2XIx9LLGy8ogcn3trE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvBk4zKkHBCS09Hrc2nmYDzzDXgWbhjs+AyLWnqt4LuiwZdRnf2Fwo5sUROXlhxQuxTd52SMBtH/9Mh8/xvB5rRI9NNhQt47V5Ldg6JTQmwJZM5kBL4j8gxRcvjWmk62cB0EavFP4Q+sMDu4yb5GkeGWsg7DspQQzcJsM7NybB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S+rmVU81; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a99650da839so792398566b.2
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728926994; x=1729531794; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jvsjTSFhK62MPvXHA5L9zbPkhQe3PYzLzcOgzWx9lrk=;
        b=S+rmVU819F5HE6uIl+W3PJCCUqtgpCb7BVC2QPpk1rT9mr+e3oGzHQiHFekmdolY0e
         h8sTtUVyDO4XSjinq2aQmmRHcX/XMdirHdmDiL5Ex9q8l9arqrGvbXVPTffC5gQT+AvZ
         9v7oP8ec+xS/6pj8NsqUNMU1MfnQ5kOK6dxRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728926994; x=1729531794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvsjTSFhK62MPvXHA5L9zbPkhQe3PYzLzcOgzWx9lrk=;
        b=gqAkchS69hDbz8p2o4SX6oazLHe2JF8NCiE4kAYk4pgsF/LH5A22f6KuShZB5nCXql
         L1iD8+aSM4HYG+rx9wqpOiMe1prMGcOC56OhD2J6l7Z0zQE15VIW7BVhP+pi6E4WBHXD
         3p/fiS6NPSOToLaljOjnDqWCtbrIHNO3HBQW27lUzTBfc8BuQNZjAeHEbwxav8mrPqTf
         YmIEdDjPClY896Vvz0BI9tmXemhQhIUiOYSYrcpaWqv9PxD+AtqL94J4dCmRV981mvEh
         u6A2zOJKJFqr/RnE2VVu78Zf5dHHX5Y8ZNn/qvhbCmK1t2fuRxbhKQjPcmeWRUlF+VP7
         tCig==
X-Forwarded-Encrypted: i=1; AJvYcCUZMfKgRwL2F1OMH0iQYk/N2ANWhrdoTdrOYTebfMSjypWWY8qOhT97L8BA9HhyM9UzQu0ifk9XbllIypA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPFKBd+wQgVFyH/yNgLVtMCnOF3Rj8HLO0OEL4P9DZUAJH7RX
	MvumA3GnKccDlnMgtCWc7ckVADfcJuhQJ1gIYp3lClMoPQVRh6eaVQ5hEoVj201MzadpgTfCIzk
	0lwqS8A==
X-Google-Smtp-Source: AGHT+IFqZU7VUkwMvT3RTae+X2y3HIfkoU3FNiPx2DyO/MVB9Kja+3MJoPt2rznUKhn07d8utT5/Mg==
X-Received: by 2002:a17:907:3e05:b0:a99:5773:3612 with SMTP id a640c23a62f3a-a99e3cb6675mr807673966b.36.1728926993623;
        Mon, 14 Oct 2024 10:29:53 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a09b56332sm221840366b.191.2024.10.14.10.29.52
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 10:29:52 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c96df52c52so1978172a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 10:29:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULieDFvJ3BPZti/f+Awssq8H33StPv9IAqfd/Iurn+fMXw2C4GtiCGCIh9juh/nFFiP3oCy1ONK75HaKs=@vger.kernel.org
X-Received: by 2002:a17:907:3f23:b0:a9a:a32:bbe4 with SMTP id
 a640c23a62f3a-a9a0a32bcb5mr437123266b.12.1728926991727; Mon, 14 Oct 2024
 10:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014125703.2287936-4-ardb+git@google.com>
In-Reply-To: <20241014125703.2287936-4-ardb+git@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Oct 2024 10:29:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wit+BLbbLPYOdoODvUYcZX_Gv8o-H7_usyEoAVO1YSJdg@mail.gmail.com>
Message-ID: <CAHk-=wit+BLbbLPYOdoODvUYcZX_Gv8o-H7_usyEoAVO1YSJdg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Use dot prefixes for section names
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Oct 2024 at 05:57, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> Pre-existing code uses a dot prefix or double underscore to prefix ELF
> section names. strip_relocs on x86 relies on this, and other out of tree
> tools that mangle vmlinux (kexec or live patching) may rely on this as
> well.
>
> So let's not deviate from this and use a dot prefix for runtime-const
> and alloc_tags sections.

I'm not following what the actual problem is. Yes, I see that you
report that it results in section names like ".relaalloc_tags", but
what's the actual _issue_ with that? It seems entirely harmless.

In fact, when I was going the runtime sections, I was thinking how
convenient it was for the linker to generate the start/stop symbols
for us, and that we should perhaps *expand* on that pattern.

So this seems a step backwards to me, with no real explanation of what
the actual problem is.

Yes, we have (two different) pre-existing patterns, but neither
pattern seems to be an actual improvement.

           Linus

