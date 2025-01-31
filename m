Return-Path: <linux-kbuild+bounces-5576-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FDA23C71
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 11:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979261889143
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 10:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F541AF0DC;
	Fri, 31 Jan 2025 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nLqvfamx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DDA1779B8
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738320300; cv=none; b=KS+5ltV1KGv6Vg2KEsYDBVFzDnE16KDKqZzr2+WU91+tf80/Vno8fwIpDm0KoBov882jN871B6FizpeNOTOgsnj+JPToQ868IQHsIdGVoPpAMFtFPYeKGwKNDlByJkqB45tokKJa127A9iQTTQwST7ZuuZr6HSZgcLvSNo7Ib/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738320300; c=relaxed/simple;
	bh=9F3nwnDU2wWXAmrBtIHTPysnyNYhe0wnXN2X/X/MOZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WObkS1Dbbn7PbzXI8F21lTsZ9rjhxU3jO31J8Do8osvkHzaZGH4/zZ5vxKVKiRF266sA6MDxiqopkZ19kUrhLTVBiJ3oqhYums7FnQKgQkkDgIYic11nLj4ZHcDuX2Qm9aiGN5yn1VDZkK4hBgYBmGL9pRtb3mj09XESqD4bMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nLqvfamx; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4679b5c66d0so148721cf.1
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 02:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738320298; x=1738925098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9F3nwnDU2wWXAmrBtIHTPysnyNYhe0wnXN2X/X/MOZs=;
        b=nLqvfamx5amDURmL4Xa47ot0ZrdxdBCKG3zkFeIywOlkn/La3bU74c1zPzsHGoVoEG
         hL+X/xpukZvHyOZpxbPfIVAFmE1Ne6dIUa4dpLua/JYuuH+x8k7uAC9unJmFQabdU7XT
         YnaEb19ELZMPafobYefOwDFT0mrddRFN7OETEqUUwd9cDIej/EuORMxV8gUP03xfIrin
         LB+1ejS2nhUP2ePQm2in6vHJ+mz4mUmX9ZE4Gihy2r0aRVtmdezjTm6nQcnAmd+jPEl3
         HTfvL77nkAHc4fn71iIzdgQQQv8zvWKyZT5JiljxywYUzTUY36o/xWmIn3Phpk+AQQov
         bS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738320298; x=1738925098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9F3nwnDU2wWXAmrBtIHTPysnyNYhe0wnXN2X/X/MOZs=;
        b=ifnewHrFbsyEUbu+xnYFjsxt0QLcePn7DtRFrmUkxU3N5rKbzHK7emb33lufG0P6QL
         HsaKaMo67CIo1Z70MREP5oPDK5Da9yNKhC6ukdvvCErSNy1wqwEetGsU4dAlk7Q5Oyu7
         lG7+pdm4R64AVVpxlwmtI7kFL24oNBh9uBPqqHEpgoviHZpvErxtHud4XrjQE8sIjH9Q
         QHWY4ym3ZZtkWkuPhO0NH1koqAROHqsGkETY+kyVK4Z6TRMGuvJ9llpoFMVCGC/rxP6t
         CH9y2ey40i+6jEaDUgsN1ALPs0La3NJoKcyfC6ZynoaDcUtP978JZ4RSjVRfZ9bxp5ia
         hXWA==
X-Forwarded-Encrypted: i=1; AJvYcCVuF42+kmLAfUOu6SQeWrfS4bqChsb+jrJf/6CJmiGZIBoPfmcKfuWO4v2em6XSJLPEg3e6RIbYJq73mOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsxcDb+CdwkVICbCiyctlpE3pE7hOjznSZc3ArNM8EecKkMUit
	re/2ia97jZnadVRGPpouNo2yJFNdjcNicV7UwNNz2Xzl0fJlRQSGO2N0+QPfiCWqKXuFVY1Psx6
	g5r90UvI8l6d0fRCKfmmNJHO4AygUheiJxybT
X-Gm-Gg: ASbGncv7NABwhrP/VANvjqpZbks+wrfDeDwpWA6ha7tGItwNWS/dbebsMPe9d+Gm5BB
	3S2J753oiRWweyH29SDYb7Jy8dQABTvUjRpNzQJ44q4Pf5Bh59siYvRsaVQlf804i2nXA+7rQgo
	6cYLyvwly6s3Fb3PGk1rApZW9IjQ==
X-Google-Smtp-Source: AGHT+IFmkkjadcqHeqZONtqnIUAH1FxuCw1w7so11MK12TLVmfISeivj3LjqKt1lp57vvg0PLk85tN0h+03UWQQqbjE=
X-Received: by 2002:a05:622a:593:b0:466:9af1:5a35 with SMTP id
 d75a77b69052e-46feae6c05fmr2946471cf.10.1738320297691; Fri, 31 Jan 2025
 02:44:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe> <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162>
In-Reply-To: <20250130183042.GB3394637@ax162>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 31 Jan 2025 11:44:46 +0100
X-Gm-Features: AWEUYZk4_iJ34sY5YTCCsGd9vQlEjBzq6Y4dd-USaLR_GrBzd3mOMg1wnqIZqk8
Message-ID: <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jan 2025 at 19:30, Nathan Chancellor <nathan@kernel.org> wrote:
> It looks like it is in Josh's tree but that tree does not flow into
> -next; IIRC, they have to be merged into -tip to show up there.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/log/?h=objtool/core

Ah nice - thanks for the info.

> For the record, this will be disruptive for clang users because a number
> of warnings have crept up in recent releases and this option will get
> enabled for allmodconfig.
[snip]
> I think Josh already mentioned it but exposing -Werror for objtool is a
> big committment.

OK yeah, I hadn't really taken the implications on board, i.e. I
hadn't really internalised the fact that this affects builds where the
user didn't explicitly opt-in to strictness.

Do you have a mental picture of how sources of objtool regressions are
distributed in the kernel? I'm wondering if it would be alleviated if
we enabled it for stuff like defconfig and tinyconfig, while disabling
it for allmodconfig/allyesconfig. Looks like LTO_CLANG_FULL does the
latter (forcefully) by depending on !COMPILE_TEST, maybe there's
another way.

But I can also envisage a world where that creates exactly as much
work for you, just introducing Kconfig hackery for no reason!

> If exposing this to the world feels too premature, maybe the flag could
> be added then have a make variable like OBJTOOL_FLAGS to allow a
> developer to pass it through if they wish?

Yeah, that would definitely be a reasonable start.

I'll wait and see if Josh has any additional thoughts.

