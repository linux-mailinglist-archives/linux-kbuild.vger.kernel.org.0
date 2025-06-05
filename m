Return-Path: <linux-kbuild+bounces-7375-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED31ACF8DF
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 22:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D9E189CB5C
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 20:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC98427E7FB;
	Thu,  5 Jun 2025 20:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkF/+GGw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914CF204F93;
	Thu,  5 Jun 2025 20:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749156045; cv=none; b=IwD9AaIONPv/Jt32Lwo3EKwTi14tzMUC5U8KBh4XEJfMa5RAa4mbDUqEtlawXLQS0Sdr38kGRz8zkdsvnPkJ1oaGSDNcKV5gFlmWw/Z4Sy/GXTD7WphwJYNwgKg/3/KRL0KP80cOY2q9LR6NU/5L3ipXxFGj5QeLXZ0KNSd2RVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749156045; c=relaxed/simple;
	bh=Lg5UIiyH4Q57G7NQW5CuP/nO05aREMz8djr/XFdo9/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTLxztgaHQd/3osKRArDIMeikL4zECzGqcRVNDlo7vVX7lvRWk8GOVLLQhXFO0uiTLhVKZoG4ujO+e7UyFqd0JesVGoKGMbB9acs8WtDzBL/LB97fcI1UwxSl4/UAht09rt3aS8IRgqbYxsl5zdXa/Cj7os1HbJshfmqY/S6568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkF/+GGw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58050C4CEF1;
	Thu,  5 Jun 2025 20:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749156045;
	bh=Lg5UIiyH4Q57G7NQW5CuP/nO05aREMz8djr/XFdo9/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KkF/+GGwLW0TepEFsLiW7W1Buc2uiNdU3NRiLKIVfE1s4rjel+GvEP5PCHvlyu8Jb
	 MJ1IA892P7VEWQRVmanOhpZcKTvsvWJ/tS+iV/o/kbFKIVos6dbJusHX/1fNDpbSjF
	 8yDE76w8GZEn4decr8p/LH4wLmY3lk5wDrIUInwKHs96db0KVwVU20hdxcJR0TVb8T
	 JBketqPIuqRjfdvYa4Tg99NOlIK5P85hJyyehhoojh5kFECme8nlQrdKTIngerZiRA
	 uIfzc5VBW3BrNd4g0XfXzd3GnqysR3z6bOH4o3vlygQ9hEE/kfnprckYGfQyGmhCUs
	 6BfHzrOJjy0Pw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553644b8f56so789107e87.1;
        Thu, 05 Jun 2025 13:40:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbRRAM1U1sArBIakldZqG2dTGy4xxc9/aEwSHGMMj0APfvHarVCR/pegFq7REg8UT6u5SThXimEeWB3I8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdaPCsRf0J6zNw8kZ605v3pXQApFA7H9FbdSQLBg4ZsDyblnK0
	cCOwusd19CgSYshn1xhro0EgYvHtcS2PplDAU4qAUpEXc/6NYEoGwM09UMwT54c0sM75jD6B49O
	Z4ernSKzu2vHigassaPgfxDxY6s5/oYE=
X-Google-Smtp-Source: AGHT+IEatRbFM/FmKCWy9sKO5xpdDCj/tNnQHiDrUQYz8fuR33yez6OUj1Z5K59hVMJyG3Fb7IDbo4lIbOuCbrIEPwM=
X-Received: by 2002:a05:6512:15a9:b0:550:dee7:54b5 with SMTP id
 2adb3069b0e04-55366c356e4mr166663e87.41.1749156043998; Thu, 05 Jun 2025
 13:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525112833.3808220-1-masahiroy@kernel.org> <20250527221637.GA2566504@ax162>
In-Reply-To: <20250527221637.GA2566504@ax162>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Jun 2025 05:40:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTm2jftn6dDu1rCAYK7TdLKUHEhXc-LzYgGmu9GfU-AA@mail.gmail.com>
X-Gm-Features: AX0GCFst7UEbP3DBeMZgZHIuRIETd3mCYHRutM9dfMKKcIhExiu0grYGX_VCSrI
Message-ID: <CAK7LNARTm2jftn6dDu1rCAYK7TdLKUHEhXc-LzYgGmu9GfU-AA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: replace deprecated T option with --thin for $(AR)
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 7:16=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Sun, May 25, 2025 at 08:28:31PM +0900, Masahiro Yamada wrote:
> > According to 'man ar':
> >
> >     T   Deprecated alias for --thin.  T is not recommended because in
> >         many ar implementations T has a different meaning, as specified
> >         by X/Open System Interface.
> >
> > 'man llvm-ar' also states:
> >
> >     T   Alias for --thin. In many ar implementations T has a different
> >         meaning, as specified by X/Open System interface.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
>
> Yeah, seems reasonable to get ahead of the curve in case either
> implementation decides to drop it.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>


I gave up due to this report:

https://lore.kernel.org/all/20250603163933.4df366ff@canb.auug.org.au/


--=20
Best Regards
Masahiro Yamada

