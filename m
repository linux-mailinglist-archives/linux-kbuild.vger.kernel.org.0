Return-Path: <linux-kbuild+bounces-4943-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 048649E0CF6
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 21:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 812E0B2FC49
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 19:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD001DB527;
	Mon,  2 Dec 2024 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WB/6Uvsw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3E11DBB36
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Dec 2024 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733168060; cv=none; b=KPPFmZKQUdmm8HUDoU7dhjTr89Rubh0XPjWzpu+QLm4Xbp3LdBBX85HK21FVbq8X9yQRyuuIBr7OsMS6BxuwI03MP3XqMw/EIJXkEDGWA3VC01aYNypUOnc1vmfM/krGvBhCGImpYGwc5pg8ed29jm5QjF+yuUTYK94ZkoiD3G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733168060; c=relaxed/simple;
	bh=R1wjqLCnK/jl668F/7xiZbuQwwYunoRzMSm3GVh/kRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDQsYuirw6tY9yTlg6BezAj59cRvyR1Go1V9234sI5D1PLVZzFkarHtjpoKHNTZzm5kXube0nhWhv7mqnM1hSCHXIJWPh9ti1Hn3Flyov0w/YGzQYwFSmLMABrwELggFRI8lG18rDtR7iFbhxkdz73Q9/9k2BaqD1xnXHsX/UVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WB/6Uvsw; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53de579f775so6493244e87.2
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Dec 2024 11:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733168057; x=1733772857; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NKeXocoBU43F0p08iiIssomLE42KNiU+OuyoZjKEnbw=;
        b=WB/6Uvswi0iKRnuA6adQ/zmwnSM34eErILizMXXPwnhxM+B4xw6oa6N1Xd+WmtsAbj
         aS7AbrxNcu/m3MigHk94PawZE3AkF62cfwJfoXTcocF00rTq5cNITFa6vVoBScMeYtlu
         CsCM6OgLzItnUcOoMEfZ2mv2cLlm/jCLI+GRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733168057; x=1733772857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKeXocoBU43F0p08iiIssomLE42KNiU+OuyoZjKEnbw=;
        b=ThWWYcEkSgCR+V1G5+ao9+NGQw9buzq6KUZ9KXW5ONussxRfx+UHkYjOt+LyrfSDze
         6SGRXT+BGmfon/CzEwktCbjqRYLou3p3vkq8r/k3OT/0jZe/VmhnpRNG1yqD/gzkxIXc
         pueg4mnLs5bRVLGZAqnbe5Jg6IisBrBeiFIzOM/8udhzxUPG7XZE+45J+tbIx8PrWXUH
         YB/qfE9l/AeBf1SrJ5oIMCTxNUNG+hCtt5QJ821m5WOxUrbEn5SiH5ZKRiXgYBt0mrNm
         ldxV6NiNanpNbxwEcWuoZx3FYcdO/Ax+iKEzBhG/7p3I7I1vIJCwQWl4jGriBjxbasFU
         NOmg==
X-Forwarded-Encrypted: i=1; AJvYcCWcU7NZQi7rVhAdNnUkQIu+8t7NcVsKfRMIzJyqnnz1M9yZbiHiVdweGAsNsMCHvDYy2LFT//oimk7xSUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb7NwYGmegEZ0DyXJvrqXzEdDekH6JxmM211pLk/eHodiXXIe5
	A8I8iNWwSpDpYpR+kPFQSWmp7HaaBD2S5b7E430oSphFTslX8SAvmOSWR3PLLUTJaOshiAFCsQf
	VFSGcDQ==
X-Gm-Gg: ASbGncs3M7YjVxc/41ZY61rGF3lfPz8Gz+xZA0bK9iXa/jxDgYMCpjhXD2wcFvgYiwK
	KZVv82dZnnNis/wE7qLnZ8mafomlDulfwJVqakbcOfnh/fzi8caNFc2XKXaaV1kKdYo4T/oXI3L
	R+PJ3ZNiJQvPCil/MWWGVg+pEGGJZuUo4g6Rb6JfgaJLC5nvbPkmWzYi9CEMCzga0Izjy/6TAUR
	BEEA22SlO3X1hXVN/4BuG2frL8IY8t8CrW628Z4YijOZYzTc5GwVl9h5u4jnfEK0oOOt0H2iV17
	ldqwFF2L+PixCMvthLeyKsP62ZhK
X-Google-Smtp-Source: AGHT+IEs2KHoGqj6Gww8SI0TzpIJaPdzz2sz6/UfrOjHvp2atpdRvGRer/5zCFOz+6LP+BJJ3IadOg==
X-Received: by 2002:a05:6512:2822:b0:53d:e592:5415 with SMTP id 2adb3069b0e04-53df00dc968mr20580697e87.34.1733168056471;
        Mon, 02 Dec 2024 11:34:16 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64310ffsm1581852e87.27.2024.12.02.11.34.14
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 11:34:15 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so64369471fa.3
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Dec 2024 11:34:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5rCsfXB/zoS5JufC61f8BnGFECHuOPlGC6xI4qKI9O6Q4LEu3u0PFqtN9aPm1Tmg4O2aOw/yQ8EOARV4=@vger.kernel.org
X-Received: by 2002:a05:651c:508:b0:2ff:cb81:c016 with SMTP id
 38308e7fff4ca-2ffd6028d77mr201405821fa.19.1733168054547; Mon, 02 Dec 2024
 11:34:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.048548103@infradead.org>
 <20241202151533.GF8562@noisy.programming.kicks-ass.net>
In-Reply-To: <20241202151533.GF8562@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Dec 2024 11:33:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh7KugYO+R-1DMmkLz4fD_-A9BMyrWTVsH_K0a86Ojn4A@mail.gmail.com>
Message-ID: <CAHk-=wh7KugYO+R-1DMmkLz4fD_-A9BMyrWTVsH_K0a86Ojn4A@mail.gmail.com>
Subject: Re: [PATCH -v2 1/7] module: Convert symbol namespace to string literal
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Dec 2024 at 07:15, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Perhaps we can ask Linus to run this now, before -next fills up again ?

Sure. I did an unasked-for scripted 'remove_new' removal right after
rc1 for the same reason.

If we have these kinds of big scripted things, right after the merge
window tends to be the best time to do them. The conflict potential of
leaving it hanging in linux-next can be somewhat annoying. They may be
fairly unlikely, and easy to resolve individually, but it's one of
those "one is trivial to deal with, but even just a handful is
annoying".

So I'll run your script and take your commit message, and we'll have
this part over and done with.

Thanks,
            Linus

