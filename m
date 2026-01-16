Return-Path: <linux-kbuild+bounces-10609-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCC0D2F140
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 10:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D710302EACF
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 09:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591803587B4;
	Fri, 16 Jan 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZk1W/KT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7F03587CE
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557207; cv=none; b=efaAcTxCXwyK65zmqYi4HRZWJOGaXKTQNS0NFKHD557SPIqWVvKT0d7VbaWaSQGpHnvgZvd1epZpRpE/zNpL58TqxUZfnAdc+NKe4iaJO/YXaJ5a/tkUPXOVC2p2/0tg96/9VVPIWh3djZxgquV42MuUMs/Y4iU20q/SYNPExRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557207; c=relaxed/simple;
	bh=UTgpQh0ZLgnzkFSvhFTTbcTXvNmo/rsBWjbi2EKkncY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVCxROuQ6Vb1an9a41aUE6bZw/zA813FChzPBRPRh3LGVtkxHLb8J7C7+AQlGWCwOpLQRMO17vQnxoPsgq8JcV6iYSBy0VHjBmfOGe401ZXQS2daA3sYQqckbfCnMY+c8C/KfEu4OQ+9zNTxZyG6Svpbo8o+M6Z2RejaFXNWmbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZk1W/KT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so5789065e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 01:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768557204; x=1769162004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kc9Ty9XgpUdwxFhTnyIgiWP6bdhC4HIf+rr8u+NJ+Go=;
        b=BZk1W/KTAm1xH+5VKcuPMSh2uu/pebl3HoUOauxWdOOJM5QVP69whoozeB/Pt42+Cy
         2SQ1qbf5EYaXXEwknSVHkP9zNwL0cBdFakLz9lDVBI7vgweyRwtI4Xk+juBEiHDhYH7J
         9/9sNafc+3mVEf18cNd2AaI5YQBgkY0LAanTEHalIOt8NUEO6+fZmCKCxnvmATovxv4p
         5eST7qwoCvougdi5q3NQze4req0uMCrdN58mcgRZenQS4VSbDUx1zYU77AikTxQ22YtK
         ZT056if92mc/gOG0aVnHYmWC2IKes/lzW3X9BkctCNn3W3+ej8crnWUa753hOIsbFV4g
         yboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557204; x=1769162004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kc9Ty9XgpUdwxFhTnyIgiWP6bdhC4HIf+rr8u+NJ+Go=;
        b=uvIMFqif0/qHfCWyPMSPrN4e4Xl02ClkHtiYcb8eNeZNuFiRQjk9XdSlH5WNkkkPJn
         oB6CMeo3cIPmDtG0IJkTt7enxmSLB9TJxs87bDGkwr6e/L1ID+mCunY77Cib1O9BQ7oB
         VuBprG70acVN1yoP8YP3ceY/05V7lKJgZI6wyiMYfS+geTAvAAIZBj9edKavDqxaDuwT
         EEZYTqD6OGmyHj8OSMLaF2+kpkaq7PaM6NKxwprntsUwpDBauHVygy+7azuHqZ3JlkC2
         XF4qr2Wh0zFZEM3Vin3wx3PAiyLEbsRA8AypBGcaJILh05VyoWdJY74OYO8490SplwZ+
         CpCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU1AMHZ3r7T8JAsJKYHHCkkmvVj/5eua+vnaZRlJzMCZhwq2V2Wxwx74wbEkLcSQ84RdK+X8y7bUA54cc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk/R6uJvHli/LYnyPq3sZSLlpVrpsnGf6OU4XWxc/j9grC5fl9
	70GnNWg7H9RhLQkX1cq56X1/ELj9g2UJGNCmocs6o2+XaeH3c5SibZ1A
X-Gm-Gg: AY/fxX54rGn0lKnZahOTeqbrlTs4Mytb4007Fepe2BzugJ3snggVnNYsJpc87mVElJT
	1Fpv6aGj3oUV5yUftgtvSCv1WZdS7fJnBMM+v0h74kkwV9mrj7ovBJuVBi7Zi0F/aYXkjXz+ThX
	vFTyyXq73fCk8TnsDjyKg0QsTNjtt8EZNptPX7Vr+L3BDkrBXgmNuyXAMKgLIzfEK18nBWonH8S
	WcRFwni4IEEiO8lgSA4LVqlp5JFS60h+UFGBxy2rbpYJ6u/+06QOlwNeIfMEIq0QeepSKa6sQsg
	OCbZ561moKhmK0I3WS5Ox83RmF6rbzztu8tpkZRauAoOJubWrSqCNGXZemk6slR/nfbcV1+6/Ca
	Alw59J9HpwgHD77AveXsBSGBWw70j72G1sXZsCA/0oSxBVp81V+r4yjtSBhQ6agb2RkhgTwatvM
	ARDWwIq5fFEcykD25ssPQfg+QHTFuKDznpXM9atnUxiJnFcLuBSoAR
X-Received: by 2002:a05:600c:8b64:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-4801eac0f22mr21648235e9.14.1768557203887;
        Fri, 16 Jan 2026 01:53:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428ac749sm90683575e9.5.2026.01.16.01.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:53:23 -0800 (PST)
Date: Fri, 16 Jan 2026 09:53:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Bill Wendling <morbo@google.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt
 <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Heiko
 Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>,
 Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu
 <jeffxu@chromium.org>, "Michal =?UTF-8?B?S291dG7DvQ==?="
 <mkoutny@suse.com>, Shakeel Butt <shakeel.butt@linux.dev>, "Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?=" <thomas.weissschuh@linutronix.de>, John
 Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, Masahiro
 Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev, Nicolas Schier
 <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Naman Jain <namjain@linux.microsoft.com>, Simon
 Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
Message-ID: <20260116095318.46a149fb@pumpkin>
In-Reply-To: <20260116005838.2419118-1-morbo@google.com>
References: <20260114193716.1740684-1-morbo@google.com>
	<20260116005838.2419118-1-morbo@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Jan 2026 00:57:57 +0000
Bill Wendling <morbo@google.com> wrote:

> Introduce __counted_by_ptr(), which works like __counted_by(), but for
> pointer struct members.
> 
> struct foo {
> 	int a, b, c;
> 	char *buffer __counted_by_ptr(bytes);
> 	short nr_bars;
> 	struct bar *bars __counted_by_ptr(nr_bars);
> 	size_t bytes;
> };
> 
> Because "counted_by" can only be applied to pointer members in very
> recent compiler versions, its application ends up needing to be distinct
> from flexibe array "counted_by" annotations, hence a separate macro.
...
> diff --git a/Makefile b/Makefile
> index 9d38125263fb..6b029f694bc2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -952,6 +952,12 @@ KBUILD_CFLAGS	+= $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
>  endif
>  endif
>  
> +ifdef CONFIG_CC_IS_CLANG
> +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> +KBUILD_CFLAGS	+= -fexperimental-late-parse-attributes
> +endif
> +endif

Will that still be needed for clang 22?
Looks a bit like a temporary flag to avoid regressions.
Probably ought to at least have a comment that it won't be needed
by some future clang version so that it gets tidied up.

	David

