Return-Path: <linux-kbuild+bounces-1791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B7C8BD19A
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 17:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AF4E1C21D7F
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 15:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56DA1553BC;
	Mon,  6 May 2024 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cQFpOZH5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92BD155336
	for <linux-kbuild@vger.kernel.org>; Mon,  6 May 2024 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715009797; cv=none; b=Yo/6pu3cNPsHXHISX//nuL5ky4Wu9+OPQGF2ZoC9EZZrGeHGiwgHdr7jm4Ihdl+jr0r00QxxERwpw84K1MKHaQpNcZUhrOggEa+tAL73qq9cn7sPkL5oU1wL11jcXrgIz7bDpPkynkjzFKAJJsUd5eZmypddNfOPPSV3OHHcyI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715009797; c=relaxed/simple;
	bh=okolZHTegM6x+ttsho59LkzT+8+G6g01I/qGFOeSb1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAocHagayAPBqk+P08tdc1PWtIpvzLe2XY7nH7S29obYH675dENeeSZ9U7BiKt87Vy1C2yEksAg3zgc1aFRr4AeYwWqPg5h1UbErI5GqPKYach2Gi9m8KpcY0Pr86s1D2e8nR0I+H2YlvDl6z8heDCjUEIFyztxCje/VeCaWryM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cQFpOZH5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34e7a35d5d4so1576303f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2024 08:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715009793; x=1715614593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IgNpmP+KnJqaBxDJdkx9mmwg/WMduzGDywLz1udliyw=;
        b=cQFpOZH5Xpzym7IOsT74wRI3xbCyAlwMdjKhDrUwSQkh3C6YmrBWl84NQNRZmfINMs
         JUkE26V2JcrNSE5moXI+qSVg3YcsTvo9jXI6QLvk8FNOuOeAw6A6o+L8HjozxigwyYp/
         k4k1wYHcFVbmvO0DJlZNG3Q8s8KWLlY5n+MpkhY7lPwIcWlPOixgRrQXxFpnPU7Nburh
         Gj3SCMhK2k+yLHioZ372OOb43rKXJ8I4nw6RORWJGV1tToFgzHdCLYx5tLw0w+Yj9o4L
         riur0ex102/RYl7UW8fwIdSUVGbC1GBT10VyLWXDchWzg+ObsTMF8l9HmFXmiyS0PHLp
         ZDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715009793; x=1715614593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgNpmP+KnJqaBxDJdkx9mmwg/WMduzGDywLz1udliyw=;
        b=K1a5Rg+yTRdFxFTmRJ70POQzFpYgNkr4Sb32LTjEQ1Lzl77SMgXFoZlbvX5CohykFa
         9hTRJz9mncYoKJ52V7Z6NW0OfhmT457p78QBE3Qp1llAmZJfzlIupf3bIHSj+5yBlXTF
         IW/6azhozc2fHfzX5fHkUFyTuRfY2GrkHs/35kQPL7eTV8kodKznuLjbC/BW3j4717QI
         I8hFimWDyJSzhkOZ4bklkZYXZK6N+jVUJcpTS8Ejy1SbHpi8eTXNcpxfBx23uOkAgEHg
         PD2sU22eRXAZ0KIiVuSh+/qS1r30h6llS/S4qh9iJRDMgswIHuTln5qfm0enBsL8gIr6
         SgZw==
X-Forwarded-Encrypted: i=1; AJvYcCW09B06L39m5FfKdBEBO5CxSzlOZA96I6NqyG/xdtWoXycHKvSzvWl59s8Yq8Cc/klgqnvvsmtmXwhrSqcJm2VsybQtSaReksleGKSj
X-Gm-Message-State: AOJu0YzMUzvQOdbjt+spRjA/fHcwNslwU86z3mFO4x6If3w0BKP6Sj+6
	cN47+9sGcNmmhkguOhvc6Xb9JJDloCjk2LOW+oA5IFh3UJ2Ko4p4UH/66+IaN20=
X-Google-Smtp-Source: AGHT+IGbZTNMLu6hbhyt1bmjEn3Jajf73supUMbIrefeBp7HlOrwI13gU2mgVw4zZHXxgYrif3Od3g==
X-Received: by 2002:a5d:5742:0:b0:34e:3cb3:6085 with SMTP id q2-20020a5d5742000000b0034e3cb36085mr7080161wrw.62.1715009793016;
        Mon, 06 May 2024 08:36:33 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id k3-20020adff5c3000000b00349a5b8eba6sm10895265wrp.34.2024.05.06.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 08:36:32 -0700 (PDT)
Date: Mon, 6 May 2024 17:36:30 +0200
From: Petr Mladek <pmladek@suse.com>
To: yoann.congal@smile.fr
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
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH RESEND v6 3/3] printk: Remove redundant CONFIG_BASE_FULL
Message-ID: <Zjj4_hWkz9-qHnWe@pathway.suse.cz>
References: <20240505080343.1471198-1-yoann.congal@smile.fr>
 <20240505080343.1471198-4-yoann.congal@smile.fr>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505080343.1471198-4-yoann.congal@smile.fr>

On Sun 2024-05-05 10:03:43, yoann.congal@smile.fr wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> CONFIG_BASE_FULL is equivalent to !CONFIG_BASE_SMALL and is enabled by
> default: CONFIG_BASE_SMALL is the special case to take care of.
> So, remove CONFIG_BASE_FULL and move the config choice to
> CONFIG_BASE_SMALL (which defaults to 'n')
> 
> For defconfigs explicitely disabling BASE_FULL, explicitely enable
> BASE_SMALL.
> For defconfigs explicitely enabling BASE_FULL, drop it as it is the
> default.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to take the series via the printk tree. I am sorry
    for the delay. I somehow expected that it would go via some
    arch tree...
    

