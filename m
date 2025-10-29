Return-Path: <linux-kbuild+bounces-9328-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C9399C1DA05
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 23:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE5794E2A79
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 22:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9852E427F;
	Wed, 29 Oct 2025 22:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W2OUB02P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89A02E228C
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 22:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761778440; cv=none; b=bmDqpFvyqfcbA6CpFBean5J2SmO4Me7nfmUUtGp3UpQ1siMyxrDcnxKGRcyFAN8QW0d1OsxrtqZof64ExHI4YV+Cza8gMVc0xp9idbKuoccDomPjZw4hofMqRIfgz4Dtv4Lx1wKqWE9nbae3fDR7V/1UbOFF1Pr5yScpfhFUzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761778440; c=relaxed/simple;
	bh=kdNNBM6lcL6vwfZAgX0UdbIS/fpKRmbsinz5ctbBKFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coLLMiCmvAbwsz78IpfqHHRicqVkwnvVEeBdO9wDcB0LvUHvpkLKYW0roAj4p3nhRohnvPfgaPGEkBqr7gXtwexYrk+9AeK7ZDIb0k6KUOh7Gqlt2wm75WfY7EMtU6Cwb2mJ6jYP7VVIY2h6ei+wbAlSsIafdfVSPcTj3T+JawQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W2OUB02P; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7042e50899so103299466b.0
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 15:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761778437; x=1762383237; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iI0bSg1UjmEl/K8c5bJoL0kjm3B4I+PTE1O53XpPOgM=;
        b=W2OUB02PlxmA78otsU4tr/AxrMnTRWUkYHnivbbBXVEWo6hj8TNonZ7uM7KcmrqHmV
         YCTnV9Vvct1mW6P1I/PApKTvI9zv3v4pXN4nODcW/XK3h0Cw4wS83cgwyWooktAIxdtY
         ot4Z2dOT5ejTzfPIkyLOOs3JEY2KyjrnH1zRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761778437; x=1762383237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iI0bSg1UjmEl/K8c5bJoL0kjm3B4I+PTE1O53XpPOgM=;
        b=aWVSjYuVYpQ6l0OfLW4AJ/iigg/Q9NPRnedJrzFRSSGw7h4ZXd8jk+ICKHQAOSC4Px
         ydO5LpF5+BpV1MEoRrvR5Jqv5e4NhE8VBLxQ2xOHx95f1Q4mJjO61pWx7+XeqS/S81kg
         6QHDOvlfbheKVFiDRM13cOd/DRkkTdkqDUadCSzgcq4oDwWGAr6FcY0EyXga6mkwvHC6
         favsfWEtVoUaKMYtFe6XpwoDbkN3t5FU9pZbYzSkDKu00Xp6u54jDrC0ZWz7PRhCz7MA
         w2lJ+kOrfSnegCCt+xZuQft7YAbLUuPC6JjI4zv/oN289LQZeFZZJidFRIX4MBdr9pMa
         W2Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUWy5NgUZolBwPKQhv1xovGxtMl6QQ1NT2ApoEZ0iKlBlm5mWFnD7tY43Ro4rx/qVucRBSeq+OqOngPHkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvulNkBhRyTeh6mrC4nTSgO3iGUSCnSXCbyEtYsISMt1x0SstD
	F9L8ptsrgt9+mvGZbe0zwKEiR0zn0dCUq/0OPpZj7Tvd/Gn8DbPsTG3Pm8sXXQxoztnfuxA+rKp
	fshtIldI=
X-Gm-Gg: ASbGnctI+J5eJPf76lK2U8WEQOdfxP/957mKMzwkR6LQafN39CIyJMOK1XO8u81m88e
	o9DqiZM0BhS+0+H+m9dAB3NnBYkwVZefoQPOQAiC8yxQ9xcScqfQBAHlEG/v/R2rX59uSzDnYMo
	n/lgfBTZ9BFcoSfKNSTJcW+d3xFfnXnNnyJApmYpC1Qf+Zx8MWZ6UciMqvqu0H1NY0ZT3X2+nRC
	UCpL3erzG/5a264xd32bAj7geDwoJ+oQnSt//qbKuB5p4K+xe9zeDCbF2bzZBT09owS/ty+m/zj
	0PlhEQ7/0gIsqlmob1RGu5x4jZWsHkQZeFUukGaLI23S+k13HGavwbjvdw2vI4HQDA/gLf8+0so
	mmjCCT3UH4Vxhs0Un14vrKwULKDfZ1cQ/IcXGh5+VvchYcr94uZuo3oXrRHAv3vx/33ZQsN461u
	d+5RIUWG5s75MmFCW0xyLaH2+UC8jAMg3IQU+Xus8fU34eWu+uZg==
X-Google-Smtp-Source: AGHT+IFpN6+Tf87qSiII4y2gPR5CQCpi/8YWgOpF/n6L4k58+ZLuqQHLkxitd5BRnyOFsiOMcwprvw==
X-Received: by 2002:a17:907:80b:b0:b5c:66ee:2058 with SMTP id a640c23a62f3a-b703d2b1ce5mr399585366b.6.1761778436810;
        Wed, 29 Oct 2025 15:53:56 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8530905dsm1559212666b.6.2025.10.29.15.53.55
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 15:53:55 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63e11cfb4a9so608987a12.2
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 15:53:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRZyh6aObY0SVrnnmrOernTwHtdM7jyjAzbJmMIJa+MGGOfWFKd0b7IbmpWsbw3Uf+wzBQFEOAYhz+GL4=@vger.kernel.org
X-Received: by 2002:a05:6402:2794:b0:640:2f98:c00a with SMTP id
 4fb4d7f45d1cf-640441c6915mr3749620a12.13.1761778435389; Wed, 29 Oct 2025
 15:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023082142.2104456-1-linux@rasmusvillemoes.dk>
 <20251029-redezeit-reitz-1fa3f3b4e171@brauner> <20251029173828.GA1669504@ax162>
 <20251029-wobei-rezept-bd53e76bb05b@brauner>
In-Reply-To: <20251029-wobei-rezept-bd53e76bb05b@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Oct 2025 15:53:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGcos7LACF0J40x-Dwf4beOYj+mhptD+xcLte1RG91Ug@mail.gmail.com>
X-Gm-Features: AWmQ_bnilKb6JtBCLxMS2OjuS6zTMwl7TaRmJaxYXYP0hjivAWUl2_eMnvUSCbI
Message-ID: <CAHk-=wjGcos7LACF0J40x-Dwf4beOYj+mhptD+xcLte1RG91Ug@mail.gmail.com>
Subject: Re: [PATCH] fs/pipe: stop duplicating union pipe_index declaration
To: Christian Brauner <brauner@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	David Sterba <dsterba@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Oct 2025 at 15:25, Christian Brauner <brauner@kernel.org> wrote:
>
> Meh, I thought it was already enabled.
> Are you pushing this as a new feature for v6.19 or is Linus ok with
> enabling this still during v6.18?

I wasn't planning on doing any conversions for 6.18, but if it makes
things easier for people to start doing this, I could certainly take
just the "add new compiler flags" at any time.

Alternatively, maybe Rasmus/Nathan could just expose that commit
778740ee2d00 ("Kbuild: enable -fms-extensions") as a shared stable
branch.

That commit seems to be directly on top of 6.18-rc2, so people who
want it could just pull that commit instead.

               Linus

