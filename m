Return-Path: <linux-kbuild+bounces-10174-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EC327CCDC5D
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 23:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A572A3028C90
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 22:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4A62D97AA;
	Thu, 18 Dec 2025 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZwZtLpv4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E12D22A1E1
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 22:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766096377; cv=none; b=lk9/gQFNzl3TCjSK4F35eWgi7orRAMvaUu+tOrrdnIkM/wOXwWMp84QGsUVmgOqCCiWyELPcuiI99Bq3i6A+KRYP3oM0v35wCcZi2cHY0V0s97MMbWKVxe3p3n283Q9116m56oQvRPgMWsC4hfi4ppbORHYPqLYWqy4dHM9nrew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766096377; c=relaxed/simple;
	bh=8pSoe1Bmi+W4NijU12aYw3XcputPGwR7O6GNCXc/aeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAYMpeiFY6GuJzpaE2HrJyXM7SHkR4bR5bZ8pf1b2US0x1h/sjHQrAxtqT2gJuy5GBBzahT3QpkzcsuDrtSWCFolcLZkP3JCvkFDogJWLT+ZoSIKiWPFTe4+aJ96IdFsLGreZmxexqK56LJI9R5J9VVmXmdk0v/V+7/MlufjClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZwZtLpv4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6492e78ce07so1457782a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 14:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1766096373; x=1766701173; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jndt3SqYxM2jZAywVtZf3yYDl10GUxyvdAXQWbglW60=;
        b=ZwZtLpv496T8ZsKzK98v5OSTqJ+2OR6/8V4sq9jvyvs32ekGxwJipxbLSee4SDWDgL
         e0IrB6nxmuc0/GcdUSa6MUqthiN91oGWIPLU8V49Cuu4XJAyQDP20CYR0qDQeyhzraF6
         wB0oEr5+IqOwH8Yrrc9ORQCPmyGafp2ck94Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766096373; x=1766701173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jndt3SqYxM2jZAywVtZf3yYDl10GUxyvdAXQWbglW60=;
        b=kiMXEu1lJqzaJxOU3/aX8XaMM0quwY6Ql4aoBgrSmcsoAo7BZw4rvVPbN9PCHGrdq+
         Vi6FcJCQp5sfWlMFHYif8itzzjHdcz9OYMWnL0JDkmXKKQKc+JHjlWs4HnWq7IsznjpE
         jzDd3ArzC1R+MVBfZRqtbT40JZMwQOyMFITVRl+lwgTfQuiUslnVMj7rVYcjtNOu1v2d
         anAV3BiGrxzFrbMIWUJ9qyJ5uBUl2Ndi0Lcy1tOJ0msYqz7vW3QlFHUnTj4x9C4N5HJu
         xLcwsIsVLvP7tx7CovE0QNO9tZji0r2Moyw6x1uyUNrPgbAhyHDeGVoGv2iJJmnWZvTH
         MJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCV0o5UIT7HutosydIWmEavP8HrnA0HLv9pzeC0joza2wPHK5/JC+2BEsf2rJuMVpNO0zisu6FGetNJNi+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKYcFtZRQQNXBG9pQkVk6+s9YF30yrX82CWTEFsmVgtKw8P/a
	+1ldQKwfelpOYzlRzpRTcR3Cufpc2WomJbHL+/JAkLY7L1VoiRJ5It2hs3rhhbXDAaSFokWDhYj
	ISXWjjQCJMg==
X-Gm-Gg: AY/fxX67RXck1yh5VOp2ug0JeYue0rvaw4pG6jyjK32QaNOzGWCWcIOuqR3TzRIDyPh
	mG+GfCAnHZYMi/YzQMbDF2bqjk6rZuYRPGS6Xwy82PBbNf+zyyhXDQ8lHEpQcAOd7ItJhVsurI/
	kaLYaUuzGxZBYRV7Tl6i1zFYVMStQZi8QndBtLRpehS8aTGgQhHOf502HDMwCTX15eK8U8WzLTN
	W7i2mfk7o5F0VfFVAfwEOGq0tlSEx/bdFL9fJUG/5cfEI1VEifqro1nBXtG98ejKCOANk5Fn+/Y
	ACJ1yfaccF7+jbHWwcGPaEUyHsnbWg2eys3Wa6p/HhxLkUaTzMN7Wn5Tk329ha58MUgmhIXNoha
	U4PfneR2+VuhcGE51zE9fkhFId1eJ75hnSVgwS7LoTOsmCSBrVDNeq5bEjpahf4dVFHcDj/1XE2
	e12xGgtDYzq9NDpGexSf/4Csghw8CBHkH9JDL4bNr/ahL3yoSOOVV3ETfCrK+l
X-Google-Smtp-Source: AGHT+IEGy3PZE2fDG3AE017kBgXhD8dXA66r9nsLcmGDFzVbtQE5JaSKsvYmtXeVC79CN1iy+c807A==
X-Received: by 2002:a17:907:6ea4:b0:b80:f2e:6e1 with SMTP id a640c23a62f3a-b803722a7demr84075066b.43.1766096373496;
        Thu, 18 Dec 2025 14:19:33 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm54138066b.17.2025.12.18.14.19.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 14:19:32 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-649784c8967so1382687a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 14:19:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXc92HB3lo8rqgfaWEpJZp3YxFzq1vEN1YkjN2ArC8lcCv5h9Ex9ioaeHPbGEe5lHS7hsx3LoKZ9oRmqFU=@vger.kernel.org
X-Received: by 2002:a17:906:4fd0:b0:b77:1b05:a081 with SMTP id
 a640c23a62f3a-b8036fade7bmr90274566b.27.1766096371748; Thu, 18 Dec 2025
 14:19:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218202644.0bd24aa8@pumpkin> <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
 <20251218220651.5cdde06f@pumpkin>
In-Reply-To: <20251218220651.5cdde06f@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Dec 2025 10:19:15 +1200
X-Gmail-Original-Message-ID: <CAHk-=wjMVfu-aiQ8aNHcgsh6hYwbZCoX1B4ps2scibokO8EZ+A@mail.gmail.com>
X-Gm-Features: AQt7F2rQbkmjgbTYE3I0u5o-OP0XOCVU9BjhcXCAu035ycTBeAxGxqvP-3yEHoo
Message-ID: <CAHk-=wjMVfu-aiQ8aNHcgsh6hYwbZCoX1B4ps2scibokO8EZ+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
To: David Laight <david.laight.linux@gmail.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Dec 2025 at 10:06, David Laight <david.laight.linux@gmail.com> wrote:
>
> True - especially for code like:
>         if (x < 0 || x > limit)
>                 return ...

Exactly.

And yes, sometimes the type of 'x' is obvious, and having the range
check for zero can be seen as redundant for unsigned types, but even
in that "obviously redundant" case the code is *clearer* with both the
lower and upper range checked.

And apart from being clearer, it's also then safe when somebody does
change the type for whatever reason.

And lots of types do *not* have obvious signedness. They might be
typedefs, or have other much subtler issues. Something as simple as
"char" has subtle sign behavior, and when it comes to things like
enums the signedness can also be very non-obvious.

So having both sides of a range check is *always* a good idea, even if
one side _may_ be redundant for some type-range reasons.

And there really is absolutely _no_ sane way to get rid of that broken
warning except to just disable the warning itself. All other
alternatives are actively broken - adding a Pragma only makes the code
worse and illegible, and removing the lower bounds check again only
makes the code worse.

So this is a compiler warning that actively encourages worse code. It
needs to *die*. It doesn't fix anything.

And the people who point out that it can show bugs - absolutely *ANY*
warning can do that. That doesn't make a warning good. Any code can
have bugs in it.

The sparse warning I outlined (and that Vincent wrote up and tested
and made into a proper patch) was actually showing interesting issues
in a much better way.

And that sparse warning could certainly be improved on too - I think
that one too would be better if it noticed "oh, it's a pure range
check, so let's not warn even when the code otherwise looks dodgy".

But at least it didn't warn for obviously good code like the horrid
broken type-range warning does.

                  Linus

