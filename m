Return-Path: <linux-kbuild+bounces-9250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1E7BFE2F8
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 22:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD09A3A211D
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 20:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6242F549F;
	Wed, 22 Oct 2025 20:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="QNsi1kQn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428642F39BC
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Oct 2025 20:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761165348; cv=none; b=nVulU2Jr4/x9l0tEYuo0ijWuvMwIPh5QA13cQdWJsUYMuGDwdB3mXH7+Oked3mAJ18mA6PeDFy8GsDqaH8lviqC5WWZ7jWEqfkyRmKaVcy+hcuYqkmMcEGJeHHYtuHKcAbxUg1WtTn+iMpTA6Y1zwzuOLdQR0t0bnzawTw6a548=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761165348; c=relaxed/simple;
	bh=2cxfKcDEODy6pCnCaL2blCLMjBr1cK2izFz94UIDHgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uinGPs8V8A6VypoP2BSbP2MCBuPCU2hSNCqYATDnGYzJ46bJaJSUqz21D+s//wZn0VQTu4+lMbfYNDcRZuWLDQhE28XMOgOsaLCcddvk0FuJXTjXUy4qWS3ARkgh18Zetk9J1IBFvMnL3faVcGhg9Y1+DgbC2oVVkmtC68FGYYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=QNsi1kQn; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso32503e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Oct 2025 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1761165344; x=1761770144; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LMw5jZQPup9g3YG0Oz0iv+PzvnuGVP0BVvdcPTvpZm0=;
        b=QNsi1kQnHXV6j7eeo74TIcDIRHcD29xPqwFrKYzHmOiWrUoUbJkxy+Ef57Wc2b2mKy
         JcXMxnzgXVIzU7mQHKfsO83MRzAnROIwNiQHn6BzTK5NerGSBpPdgF0p8jmHb8VH9Vkh
         UgTsXIM6KeiMv0eF0sgSaoGJKazp+BkzDQqYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761165344; x=1761770144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMw5jZQPup9g3YG0Oz0iv+PzvnuGVP0BVvdcPTvpZm0=;
        b=VzndwrImcycFnlXDOJE3soVhpOoN+MaWBwZ3UoD0WyEvLr+x3vIdP03x5lvp4dxXLK
         s5Mp28w2oNqTzi7HMLfOCXz3JZaA3sbxa9ehcTSM9l1QELsLcwMBLhPu/H4rBJkHtVIG
         kl/M/aOZjpBEUbAlSOv/a0SzXmRj5LbOZiUbi3Lzb1W9zWZIFQjszUnPFCxB7iK94wz2
         Ddx37o0gEKaVlpEUI59oB6RMtmZjOCAim1SVQnxVZhLAd+RLFeha8R5WEBJBDJp5fOZw
         8B1Ankc+esWQWPk65JRhveQaQ6Xwwb10LbMH4woMAzFwL1Giidc79lMyZEzSBZzkTQ3f
         psIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW56WNn32rNQH9L/Y3SI1O3p9yiZ6v4OfYJftRBD+9dOA3pp1CXXIocwCQ51TYJf6QQRRi5NsKHDtqXMH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwACNCoW0loLo0DKdw3qPgcLVtZGQh/0wOicc/SbrLkN7qhS3H+
	kZBmCvDI8+pwYpXLxP2nsA9GM1HQUkNI4R+Co1RT4Ot0t+edoeazm/zk+66mX8DHn4YOyRbzZSu
	KFDbJe2+ENEYSprUPDMdnU3dWxsqkmhNy5m2ukHEE6zMbfGPOKoTYxV4=
X-Gm-Gg: ASbGncuAUUSoAcOqhby9dOpwZyrOGUq7Gjr+dxEOO9gEfF7vd06UTlmYqk6rgDjKOor
	YmcC1kMdWJSnSbJHnnjtRFjbLh4DPkMEFb7IzIgn89yWyTcB43aXbIPvRbraFvh6CUK6wgGp9iT
	3sRdcOTBzu6YCgE4ZRAn00KLod/P7/iYe6DASnhNlVhmKMNjaA3sh6HdkVVxJ0wP1ROBaBfcNau
	2aPH1Hyc7O6xTqU7I+Ks0PQ+L2I07df7chvsxgwq1NvOb+VLsiDcLWvj7AYAIKWenZGqJA=
X-Google-Smtp-Source: AGHT+IEqEBVACi1YcC1SpJd4luWvkP6aLuiEGroj5IFfdtGpoHO2kPMFI69n7EYmjpjml879goNVziQnPMkG4/QzhgQ=
X-Received: by 2002:a05:6512:3e0a:b0:591:c6a9:8965 with SMTP id
 2adb3069b0e04-591d854ad45mr7124026e87.22.1761165344127; Wed, 22 Oct 2025
 13:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020142228.1819871-1-linux@rasmusvillemoes.dk>
 <20251020142228.1819871-2-linux@rasmusvillemoes.dk> <20251022161505.GA1226098@ax162>
In-Reply-To: <20251022161505.GA1226098@ax162>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Wed, 22 Oct 2025 22:35:33 +0200
X-Gm-Features: AWmQ_blW_-p5u4SxGYMDuz_qV5arxA5u-tJWQ-wqhr-hNbNYZxPO4wEWfhH9Lec
Message-ID: <CAKwiHFiMAm-DX3aERH_F1UooiM1YUiMaax51exhRg2=1ND2VCw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Kbuild: enable -fms-extensions
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Oct 2025 at 18:15, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Oct 20, 2025 at 04:22:27PM +0200, Rasmus Villemoes wrote:

> > +# Allow including a tagged struct or union anonymously in another struct/union.
> > +KBUILD_CFLAGS += -fms-extensions
> > +
> > +# For clang, the -fms-extensions flag is apparently not enough to
> > +# express one's intention to make use of those extensions.
> > +ifdef CONFIG_CC_IS_CLANG
> > +KBUILD_CFLAGS += -Wno-microsoft-anon-tag
> > +endif
>
> I think this should go in the first 'ifdef CONFIG_CC_IS_CLANG' block in
> scripts/Makefile.extrawarn below '-Wno-gnu' with a comment that is
> similar in nature, which could even be combined like
>
>   # The kernel builds with '-std-gnu11' and '-fms-extensions' so the use
>   # of GNU and Microsoft extensions is acceptable.
>
> Other than that, this seems fine to me.

I honestly had no idea where it was best to put these, and your
suggestion sounds quite reasonable. I didn't think to look in that
Makefile.extrawarn as the name suggested that was only about what
happens with W=1 and higher.

Feel free to tweak when applying.

Rasmus

