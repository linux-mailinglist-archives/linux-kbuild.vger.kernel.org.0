Return-Path: <linux-kbuild+bounces-1740-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0E8BA3A7
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 May 2024 01:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B855B20E9A
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 23:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADD91C6AE;
	Thu,  2 May 2024 23:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bCYv6QEZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F811C2BE
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 23:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714691007; cv=none; b=nsIAZf4814ZfVH/6n5AUV0o+Qo9uEh3j26PEnkRWzBqMZ6JyI2D7OLJ5EHhRyiOL3H1F1WEQCnoqrolSfNGKytfRGTb33vRWl1+/xp6u58jDaWlwi2bclCTZPYq1/7KL3HAwaHdQ2xlQnq6grzUYh7Sud8zOSlZwCZJdQwFFEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714691007; c=relaxed/simple;
	bh=7UC0ZZLULS68YLtbitTAvikIsTdjDiGgT/XDM6ZThpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRVeWx8Mhx79ZBoGABvihXpfjMJaqYskUNojZLklCQ22quVHxxAuX+mVlsdQiNL2C4T3cKddPMtsJDF4JJj0ndO64aq2cXLmCHk78j8XeFfRedlo2zO/1FeAUgDfZdNajAKwR8NVzcTRwjentuPF927hbaNWDmR6aXdHb2TyeoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bCYv6QEZ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6123726725eso4136086a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2024 16:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714691005; x=1715295805; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4RW3z/Zjpo6qwpklLmujf0x6xZ5b4UXLeUz+5BU7aE=;
        b=bCYv6QEZR4K8pT3YYHNyKEL8tICIe8BNi04eAHT8+BoAEmrnQjxMDoSpEu16DQqGsV
         tekRkOz6/0+gJYt4A+jDLaoRzVFz5DAGb1MC2sQ3yPao8ICpa5OIYv9XD8/2KCRnnEJ4
         5RWDN5W2C5CUru3MKpM8OMNOAmyR4vwQCTwzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714691005; x=1715295805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4RW3z/Zjpo6qwpklLmujf0x6xZ5b4UXLeUz+5BU7aE=;
        b=HZ4n3EUUWZ+QtWfr7Q/Ce390cFqJhW0h4lDbA1SJBhL9ahrg6W7y8fqjAimXG65cZL
         uIwfbbL1wqfwt1brse9YbxtZXVlgg8CboGuBM4KNvLghIl78nmBIq2bRogaTtAldpVsg
         SQUnDk/HmqC2AnJSqo7UHWnRzoRWiWdvchd7CG5EEp7RI5X41FFt9K5pgF4Ui6Re/ue/
         cd4ntXQ90bXz06ykNSg4RIv6EO6Dy3EWS+zkGuuQlumkRBisTHtK20a7fkUeN8YuX+zg
         PqlcLqgNF45uBHlG1iXzOF02izXp7cvSkTv7Ut70mphY8IYkbEPNQXUAxmL6sTCFB19/
         q8kg==
X-Forwarded-Encrypted: i=1; AJvYcCVzgE3PWz1/Fdh70bXoyOE+rDhefS+QW51i/vQMsSio4Qpw0/qV1iSkaoA3KtDK+wc5P5WkbbxRlR5zDyaqbEsutZHou1OoLYAWbCVm
X-Gm-Message-State: AOJu0Yy9EhfGtFSb5vyoK5XSx3q6h7aJ05wv31sBG8iCyRmwJxO1aPJs
	HqrLM2NKVJX/V7IvWQHU+uI/zeyCI0AN/TeJUnpj1by/MgiXm8qkk5arjBkQlw==
X-Google-Smtp-Source: AGHT+IFN1ghcNnx1vVRkm1yx/61qx4Z1G+3b7jaqkQpPQe3ATJr7d5YMS5BN39H3i6ElpFem8xw9lw==
X-Received: by 2002:a17:90a:c70a:b0:2b2:7e94:c5fa with SMTP id o10-20020a17090ac70a00b002b27e94c5famr1292136pjt.5.1714691005284;
        Thu, 02 May 2024 16:03:25 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gn23-20020a17090ac79700b002b2b608c10esm1807658pjb.56.2024.05.02.16.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 16:03:24 -0700 (PDT)
Date: Thu, 2 May 2024 16:03:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Matt Atwood <matthew.s.atwood@intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>,
	Jonathan Cavitt <jonathan.cavitt@intel.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/5] fs: Do not allow get_file() to resurrect 0 f_count
Message-ID: <202405021600.F5C68084D@keescook>
References: <20240502222252.work.690-kees@kernel.org>
 <20240502223341.1835070-1-keescook@chromium.org>
 <CAG48ez0d81xbOHqTUbWcBFWx5WY=RM8MM++ug79wXe0O-NKLig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez0d81xbOHqTUbWcBFWx5WY=RM8MM++ug79wXe0O-NKLig@mail.gmail.com>

On Fri, May 03, 2024 at 12:53:56AM +0200, Jann Horn wrote:
> On Fri, May 3, 2024 at 12:34 AM Kees Cook <keescook@chromium.org> wrote:
> > If f_count reaches 0, calling get_file() should be a failure. Adjust to
> > use atomic_long_inc_not_zero() and return NULL on failure. In the future
> > get_file() can be annotated with __must_check, though that is not
> > currently possible.
> [...]
> >  static inline struct file *get_file(struct file *f)
> >  {
> > -       atomic_long_inc(&f->f_count);
> > +       if (unlikely(!atomic_long_inc_not_zero(&f->f_count)))
> > +               return NULL;
> >         return f;
> >  }
> 
> Oh, I really don't like this...
> 
> In most code, if you call get_file() on a file and see refcount zero,
> that basically means you're in a UAF write situation, or that you
> could be in such a situation if you had raced differently. It's
> basically just like refcount_inc() in that regard.

Shouldn't the system attempt to not make things worse if it encounters
an inc-from-0 condition? Yes, we've already lost the race for a UaF
condition, but maybe don't continue on.

> And get_file() has semantics just like refcount_inc(): The caller
> guarantees that it is already holding a reference to the file; and if

Yes, but if that guarantee is violated, we should do something about it.

> the caller is wrong about that, their subsequent attempt to clean up
> the reference that they think they were already holding will likely
> lead to UAF too. If get_file() sees a zero refcount, there is no safe
> way to continue. And all existing callers of get_file() expect the
> return value to be the same as the non-NULL pointer they passed in, so
> they'll either ignore the result of this check and barrel on, or oops
> with a NULL deref.
> 
> For callers that want to actually try incrementing file refcounts that
> could be zero, which is only possible under specific circumstances, we
> have helpers like get_file_rcu() and get_file_active().

So what's going on in here:
https://lore.kernel.org/linux-hardening/20240502223341.1835070-2-keescook@chromium.org/

> Can't you throw a CHECK_DATA_CORRUPTION() or something like that in
> there instead?

I'm open to suggestions, but given what's happening with struct dma_buf
above, it seems like this is a state worth checking for?

-- 
Kees Cook

