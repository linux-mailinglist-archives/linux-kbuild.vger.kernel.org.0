Return-Path: <linux-kbuild+bounces-1520-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC128A01CC
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Apr 2024 23:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D72E1C25470
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Apr 2024 21:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037CE1836DA;
	Wed, 10 Apr 2024 21:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R92RmeCb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C801836CC
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Apr 2024 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712783590; cv=none; b=IW+cS6Io0QAsRzumiBO0+Ej5eBCPNqYZBKu8HBS/O8RChyKssW0OxUNL5SW2yBQOL+wLrx0BejBF3BzLmvD5PJkeZ8J55/yfi+K+ANImk81q99WjwXxDE+fKdFN9LaTfG1mb0Y9l9dE6K+XFoDwUKkPFh7HC1mVRAdSC/Uawot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712783590; c=relaxed/simple;
	bh=5ydEIu4NwxWWsRaT80Gi5impoOhDMVhIgWRTaHPvrF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVk7EamabXdcU6yvBWtEqgss3Pj3RaTHJEFz+shkbD2eFM08af2L8KXQGhTK89xLLINU6M/EN6oL2rxdhi0+Rie9asSwgMb8KxloVVlnwoB7gYvCkAbGarD8uwPB+voRvdb9ewT5DpaIZg0HBFowFaciApPvO5ZeneifH5wR4oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R92RmeCb; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-36a15df0f8cso18998405ab.1
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Apr 2024 14:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712783588; x=1713388388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5/mcIJWzR1Sz/R2oHW9ifvaeJ91v7JM0iP/2A/JiCg=;
        b=R92RmeCb5yhxFGYN312O93Wo/4zEIe8uEBtC4ciwNzxVyAr/G3JoKr9/Biaja+4HXT
         u5f5D2WIVSWD26WmHHZzeNYORd3V6QQPvH9NE66SlEGaXCO7zGAxowZSzudmEmAvGKqr
         +MA0E4paqzINR38VwPQhPlB5696MaqNm8zMmXGxGXLPoeU7nwZBKWTPilVAFIQB+PLuU
         1o+/BFREv0VkiRjUPJj4IV05dvNqCJL8bc3x4nFeDfFUEpFu5A5n0RH1pyEGs6xSRKTO
         /gQqs9AaXX4nY+E6fejGWJJpHQwdaTnGoW3JpZMN/WZ2nscwB/6f1Yx7d4ws/UJEsoCJ
         VFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712783588; x=1713388388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5/mcIJWzR1Sz/R2oHW9ifvaeJ91v7JM0iP/2A/JiCg=;
        b=K0ReHCJ85pDrFyB9+Lgcx3Eelnusfyq6E4NjpcyVU5BS1WleUwNYq+Qrzsie/EGbV2
         GZIA43rT0+nn/nwKf19gZlFONLbAthQju9uTh6DTvBrAcOfij5oKgYs0/f/WEUH4E7Wd
         hzS6TX3vzADflPPdiSEEA+Nf/hNiIHzDracb7hHFM9wkhsDZSsfd1ZYYgBdubj1kEdAx
         woR9bedxPg8/m5lNvfYp37KfJ6njMtydHLixTbeVV3buIZOkC9vc3bxHYLNRQtrU2OL+
         9ZTk0f/V9+MHh6/GN6nJzAsSgkB1FEjZx8EPtOOj35Dtf2J9ejLA4IX7311+E1ZIBJEP
         UwJg==
X-Gm-Message-State: AOJu0Yw61aZ8dSoSXk8NgY+Sk2rwiU73h8iWSE4V93Ej8KT5U8ZTA3sZ
	ldiN+8tLUuebH/ZqjHT00maYtXW35Ft/ZVZSWEMzfWCXVugxYDA5z3FQWQ07fA==
X-Google-Smtp-Source: AGHT+IGpHuPTnJ+wxQMsV1XcgPUkjimJl+2RrlfGnCAGUQlqpTB1RQcYuHk2y6FkjRIkT4ntypW3jg==
X-Received: by 2002:a05:6e02:1d88:b0:36a:1eed:f105 with SMTP id h8-20020a056e021d8800b0036a1eedf105mr4448912ila.1.1712783588250;
        Wed, 10 Apr 2024 14:13:08 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id fg1-20020a056638620100b00482a9f7066csm1313094jab.151.2024.04.10.14.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:13:07 -0700 (PDT)
Date: Wed, 10 Apr 2024 21:13:05 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Richard Russon <ldm@flatcap.org>, Jens Axboe <axboe@kernel.dk>, 
	Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Len Brown <lenb@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lin Ming <ming.m.lin@intel.com>, Alexey Starikovskiy <astarikovskiy@suse.de>, 
	linux-ntfs-dev@lists.sourceforge.net, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] [v2] blktrace: convert strncpy() to strscpy_pad()
Message-ID: <ghua3jruo4xm3tj55wafwok4aveter2ychgu4lmw3k5rzkg656@np4aozq7mhbl>
References: <20240409140059.3806717-1-arnd@kernel.org>
 <20240409140059.3806717-5-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409140059.3806717-5-arnd@kernel.org>

Hi,

On Tue, Apr 09, 2024 at 04:00:57PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-9 warns about a possibly non-terminated string copy:
> 
> kernel/trace/blktrace.c: In function 'do_blk_trace_setup':
> kernel/trace/blktrace.c:527:2: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
> 
> Newer versions are fine here because they see the following explicit
> nul-termination. Using strscpy_pad() avoids the warning and
> simplifies the code a little. The padding helps  give a clean
> buffer to userspace.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Justin Stitt <justinstitt@google.com>

> ---
> v2: actually use padding version of strscpy.
> ---
>  kernel/trace/blktrace.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
> index d5d94510afd3..8fd292d34d89 100644
> --- a/kernel/trace/blktrace.c
> +++ b/kernel/trace/blktrace.c
> @@ -524,8 +524,7 @@ static int do_blk_trace_setup(struct request_queue *q, char *name, dev_t dev,
>  	if (!buts->buf_size || !buts->buf_nr)
>  		return -EINVAL;
>  
> -	strncpy(buts->name, name, BLKTRACE_BDEV_SIZE);
> -	buts->name[BLKTRACE_BDEV_SIZE - 1] = '\0';
> +	strscpy_pad(buts->name, name, BLKTRACE_BDEV_SIZE);
>  
>  	/*
>  	 * some device names have larger paths - convert the slashes
> -- 
> 2.39.2
> 

Thanks
Justin

