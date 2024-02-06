Return-Path: <linux-kbuild+bounces-844-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 862F884B0A3
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Feb 2024 10:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C2A1B2297B
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Feb 2024 09:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FD412D17D;
	Tue,  6 Feb 2024 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T28rIBlf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB5E12D15D
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Feb 2024 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707210054; cv=none; b=sw/VdlxmIN+J+6gzCnqlDbQd0hJDCsYwNu1Sh6lTrSK1RmWTzupHzKDM3NK5Av6oKht5E3XfycwVBsj5fztgCIBzq5zHkvbcEV7KHme/cZ1hGS5svJTEjGnAQdqjCRfL4E3Lap+3NtdETejeqaAvYzA/6lHfGQddwZAX0uF2n4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707210054; c=relaxed/simple;
	bh=TvMzRlANL0jtJ3DpxaqQjdEF2h9X+naRAxINr00NogQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gs27vHvylnAm1AIYoBCvtvCsyqANC3fYfiMMMS/XW3yaX7RTIumYGt3KL1diGKfxTmeevpPk6mLpzKrfinDDXon1ER0E2rsK9Nr9AuHQpXUJvLMiXu8UnDl8zRNUSikxYrzzgDGc7J748+oEAH6HNvcpm+eNxEQlllMzstWstjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T28rIBlf; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a30e445602cso76996066b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2024 01:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707210049; x=1707814849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3w2Fem2j7S7z0DDbEilMJqR16t4YZ9fG3OZkjVcRUHQ=;
        b=T28rIBlfszubYomdtb7M+V7SDS7E+/fCpzAi8Aw/n7DgHiaPPbr3UO6gwd7/NXBm59
         bmLLCpugwpeS9QXagDgJPN40IoNoAjTUd8hmc3LSGqTppxXmVBcFPCDemtUgA5XCFH5Y
         t5UgX3X4fhwTNNSOOG+VZG2pIlB933HF+uej/9X58cNYd1FN6bh0eqo3/cHPIgVFWHND
         GQX7R0uarVHFHcjOg4z9QD8u93ETDJrkNvu/TUGZYnMFQL2COUEfjj5sj5AZd4CMrr9Z
         tScWphzIwVS6qNDfhbZ9lMPFuqBdzFpNQWagFLkHgUHPWPechXoRxd9sSCKQQ6Vm20hk
         VRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707210049; x=1707814849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3w2Fem2j7S7z0DDbEilMJqR16t4YZ9fG3OZkjVcRUHQ=;
        b=uuQ9SpTCo6/2IrUe1nvDSwrgRLj6+oX0ggL9LonmTJEe0FOxyslHXGl5C7wI9nO3ah
         ECHWUFQkr05N9FlYy6N9LE8CK0emfCE9ZthyRsbop85K5QU8U0RlsXFQC7QwXxHGrB+f
         XymQKfNGOi7p98oRcTgA5bzDsAcQ+ZqnlPJ0u931lv/xNh7M8GjvI3VJb/Qh9UxDma6G
         nY1hBa0UXIycyUyLW5Qf5eH5wAUVtNFI4ujsWhcNp5A64h/8AAUWMjQToQXinb/aQhad
         Lglb/UDY7TllLCdoEFfPvKMZkt+q6wbq1byFC5u9qUmfzJlnFrLqfOEM/8k6qdMP4v5u
         UPMw==
X-Gm-Message-State: AOJu0Yzq3xXvEKJe9Ogjmq72+hphPpLCyB8ZfRYpd3oZWK2Is7RlOqE4
	aphobV4t5oZq5pf//M1/KZVHjznGkCGy85vpVD2zhlkLOzilp617vfBeV6ivV68=
X-Google-Smtp-Source: AGHT+IGetnEyTbcs/WDZMoJan0QVx5H5uxwQSSkhE/VpsBLFYggmERawnnw7Orxwyhkrk0xX5dBrFw==
X-Received: by 2002:a17:906:198d:b0:a37:7a6d:79c with SMTP id g13-20020a170906198d00b00a377a6d079cmr2043614ejd.34.1707210049477;
        Tue, 06 Feb 2024 01:00:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV12l6OfRkzbaNeF3aQei5kaPmQp6IYIQdbL+tNL6glqrH5R8vLreyGWwDgzYdZv2fLIIAnnDjIavZg7Q5R8iqhWOAOWXorWi9vJ3yP/fgWA7iSoDr7W0SVasP4Uj5gOLFkAfz/St9uQB3QcUzXVcJYu8OyfHYCX7qEKRrT+cBZHNjVgtspYMmhJiTdBjZpz0Hryoez7JLtddhPHfuO/hlntA0cFX25lE6tnVYRD30ZBMvd7cTQJVG8Mn7u8kDMzL181rAwlfXzipyQEN4UBCMni8LhempQhUzY0JnfKrxeygH4UNYMxCLDivWazlGEKu+dCl1c9X13ckAuOOdhbjr9RCTZhFd0ijWwmQzv4Emx2ONKsiyc291y7FMGtcAve638ZkQMHxGDzkL0fTFeKyAEwKGyled2G1dhbGnlYbNKoysDi1ALDmaFf+QrobeiPa7g6gR0EakDzqL+p5/xa8H5s7/B9o89r0DoZZOlRztnlgdUzYsi4VH1BIiAgHRtZiNRMci+miN1CXGU539yKoZnOtuSX5J3+fA3v5RlWpC4kuY/t2G8SIke/1EKHIN6tSCwzeejLFZxHu5L67UAWUGc3/QYTj+O6W3G2JUwew3sgvhHDkCOEycQV7L3xFw1BiJXZFsxume3oZaNV0DT84qRQeYxgsOVLVOQQxBhdqG4r9aJ1ZkMHO/00jW41Opl4fBe+AyUdwlt/4IjEXdNz2J/x6Ffm3ShTi06DXEU2/WJgpUfPBTWXLzlUY7yNkiTl6oYAgKzAA3xMLhnm3SnqTWa5h9OX2TNmypSbhshICM=
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ll5-20020a170907190500b00a358b6242fcsm888424ejc.114.2024.02.06.01.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 01:00:49 -0800 (PST)
Date: Tue, 6 Feb 2024 10:00:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	x86@kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Borislav Petkov <bp@alien8.de>, Darren Hart <dvhart@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH v4 1/3] printk: Fix LOG_CPU_MAX_BUF_SHIFT when BASE_SMALL
 is enabled
Message-ID: <ZcH1KFac4AD6tKrV@alley>
References: <20240206001333.1710070-1-yoann.congal@smile.fr>
 <20240206001333.1710070-2-yoann.congal@smile.fr>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206001333.1710070-2-yoann.congal@smile.fr>

On Tue 2024-02-06 01:13:31, Yoann Congal wrote:
> LOG_CPU_MAX_BUF_SHIFT default value depends on BASE_SMALL:
>   config LOG_CPU_MAX_BUF_SHIFT
>   	default 12 if !BASE_SMALL
>   	default 0 if BASE_SMALL
> But, BASE_SMALL is a config of type int and "!BASE_SMALL" is always
> evaluated to true whatever is the value of BASE_SMALL.
> 
> This patch fixes this by using the correct conditional operator for int
> type : BASE_SMALL != 0.
> 
> Note: This changes CONFIG_LOG_CPU_MAX_BUF_SHIFT=12 to
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=0 for BASE_SMALL defconfigs, but that will
> not be a big impact due to this code in kernel/printk/printk.c:
>   /* by default this will only continue through for large > 64 CPUs */
>   if (cpu_extra <= __LOG_BUF_LEN / 2)
>           return;
> Systems using CONFIG_BASE_SMALL and having 64+ CPUs should be quite
> rare.
> 
> John Ogness <john.ogness@linutronix.de> (printk reviewer) wrote:
> > For printk this will mean that BASE_SMALL systems were probably
> > previously allocating/using the dynamic ringbuffer and now they will
> > just continue to use the static ringbuffer. Which is fine and saves
> > memory (as it should).
> 
> Petr Mladek <pmladek@suse.com> (printk maintainer) wrote:
> > More precisely, it allocated the buffer dynamically when the sum
> > of per-CPU-extra space exceeded half of the default static ring
> > buffer. This happened for systems with more than 64 CPUs with
> > the default config values.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdWm6u1wX7efZQf=2XUAHascps76YQac6rdnQGhc8nop_Q@mail.gmail.com/
> Reported-by: Vegard Nossum <vegard.nossum@oracle.com>
> Closes: https://lore.kernel.org/all/f6856be8-54b7-0fa0-1d17-39632bf29ada@oracle.com/
> Fixes: 4e244c10eab3 ("kconfig: remove unneeded symbol_empty variable")

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

