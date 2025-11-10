Return-Path: <linux-kbuild+bounces-9520-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE3C4756D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 15:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A578349BED
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0E0313E2A;
	Mon, 10 Nov 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CQQLCJ9N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50146313E21
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786201; cv=none; b=EkJtm6rPXXEwUtCN8MDdx5sT0e7BGxFyI/T5akZizvoDRGMvedcdp2GRwgdeUDd7GqoqQTYCgO77ZjuxFBz4XkxniM5fLKnQKQsYH3Jm1QhJeADIjlLob6QlySKbzlLTSh22h70FomnmIFYgWgUiLXun4/DE5UMEnVBh/7SMDAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786201; c=relaxed/simple;
	bh=Gc+O81ogEJ7jg6lTwk7sikDMYWSEoZ1JuGrT/rBhWLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rB0wwydw5gLSzN3Fc2bj/vATWFZlq73BY+PRPjVRIMy72RVrUGYkxXkrBOgsZG58rgkhyBr3bd4yb4a7idj6cesHaHmofer8dC/4oHpWn4kfH0euCuou8yDeR/9o41uZR5KshQAwM9qk6Awk2Ax4wpMuAY0X4yCDHg41H+6+hUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CQQLCJ9N; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ba599137cf7so2340584a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 06:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762786199; x=1763390999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yuV15cVIkOZ3osUBoMrFPeh8PgM7VFfcDiPWWGwwe8E=;
        b=CQQLCJ9NAKA+ZD8OwPCqIA8xwisIvvCFH+VmBCDMZF2CAnMhlh5y80dLr2TtE878BQ
         p8xP10qKYiUdp6sojMSh+F8P1psQI1ZE44vANvNd8EbJumgLo1x0ZpZ7cFmeDhipmfeX
         OwevkGMZ1u+VSnr9QsKZYW+Qvt2qg3l0FDz1Ow4ofUtkN4do48GnRBbFtZmRv56RkMT2
         rXubGJAWAR8fzk7GLbqm9DYmPpMOb4wUwmVKAKBoy63zGfCF68/5on7lYo/S47EEw4C9
         BYt7DZYd9XRli6J9BhpZdxFPSqkB08TdWMYKPDZlhzNQaArTctHHLvVzz6jWkK3WkKxJ
         /EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786199; x=1763390999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuV15cVIkOZ3osUBoMrFPeh8PgM7VFfcDiPWWGwwe8E=;
        b=l/eBzOy5zq9vIDrPu+2jD2IzcPyd/yVc4zqcQf/h0yldwL+CalsyI+nJlgNB3VtvsB
         bs9Kwb8lgKEGJvfu1i3Dj7Wvvp+N/ormlvg0+3eNnCzD4Tghol6jmewAa/iVUAJnh/RT
         ZnievPkst0Itkwd4N2S229l7+QVvSAH+UD6OVPkWknw15cbFa+jD6GZW8yn1EJ3+cISN
         RUr5FugmhWlipTQqfWaRa60kvuHgc1viIZXHgusGPBjDBCSthjwG60iPKVzvHl8bNyRx
         JZIe1cqoQi3hYinw568FzbbZmBtZt/egY0x2AaKuNwTjV/dDtnXbKvURPxwG31fMWlQ2
         d6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXeZWGvlZNjii78PXe6daT62s6YmE+cQdjaEWBwwYko1P9OwH/lvBUZHqgLUcx/H3CIFK16E23hPt8osMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+i71UFftftJgaydLG9zaUXwLTYy7EQdmMvQHhDdh/zkxQ3Cl4
	RqOZPWcYwAUVDLsLGa6+4FSgYDGb1BO1Q0sbHyevCxln/jTtwzMqpbjCUSQ8ZoyO6RL4d5Ut6iZ
	eZeqwwdqTvLXAeHFRa6pMimSn88ZLNJCjrn84gU9x
X-Gm-Gg: ASbGncu8Sgb+s2Qbu9SYGYIRCefUJ7q/Qv7Td9bt0Qed+Jjlxv3KLqY9f1Doga2vnCn
	WVBtwYh3SVTEt3LU8uoHjkP2VfAe/cW6GOfXBZoCrpJ52czNbVBPv00iWBnnM2/ECaZ3LwYUMfM
	O1ruAuIypatdokvbH+9nSlgxhQ5eEeITWPsWVXVGh4XnGUR7Fqus3qQ6SqOo+xTiFm3J9vTJmJV
	ojfEmkL6hREgAfsLTBubB/9HPCP5shQZM+x7iUenDfUlsygH/UbpkR7oHmQnQ+UkANHrdgA3Bnb
	/Eu1LvhTG6HLzqgzTqabNhBsIgs=
X-Google-Smtp-Source: AGHT+IFJrWpsYMgqYHxsl7TDahL4sWC/rojvNE8jvjvqAW1DXIbEkhegStBh6RAJqXTedR75u3LJC4XuuR5ASPiDRjI=
X-Received: by 2002:a17:903:2f88:b0:295:24c3:8b49 with SMTP id
 d9443c01a7336-297e56cf5bemr117461485ad.46.1762786198920; Mon, 10 Nov 2025
 06:49:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <81848c9df2dc22e9d9104c8276879e6e849a5087.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <81848c9df2dc22e9d9104c8276879e6e849a5087.1761763681.git.m.wieczorretman@pm.me>
From: Marco Elver <elver@google.com>
Date: Mon, 10 Nov 2025 15:49:22 +0100
X-Gm-Features: AWmQ_bltIHaW2m2Y_rXOjdB0rjwB0avPjx0FCrIDnvZhp3yD5E0mxdw5HHzg9_w
Message-ID: <CANpmjNM+ot5A-pRLhV6Esn=QvCeCStd9fG_pgwrVA=6pxD8aqw@mail.gmail.com>
Subject: Re: [PATCH v6 17/18] x86/kasan: Logical bit shift for kasan_mem_to_shadow
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, pankaj.gupta@amd.com, glider@google.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Oct 2025 at 21:11, Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> While generally tag-based KASAN adopts an arithemitc bit shift to
> convert a memory address to a shadow memory address, it doesn't work for
> all cases on x86. Testing different shadow memory offsets proved that
> either 4 or 5 level paging didn't work correctly or inline mode ran into
> issues. Thus the best working scheme is the logical bit shift and
> non-canonical shadow offset that x86 uses for generic KASAN, of course
> adjusted for the increased granularity from 8 to 16 bytes.
>
> Add an arch specific implementation of kasan_mem_to_shadow() that uses
> the logical bit shift.
>
> The non-canonical hook tries to calculate whether an address came from
> kasan_mem_to_shadow(). First it checks whether this address fits into
> the legal set of values possible to output from the mem to shadow
> function.
>
> Tie both generic and tag-based x86 KASAN modes to the address range
> check associated with generic KASAN.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Add this patch to the series.
>
>  arch/x86/include/asm/kasan.h | 7 +++++++
>  mm/kasan/report.c            | 5 +++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index 375651d9b114..2372397bc3e5 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -49,6 +49,13 @@
>  #include <linux/bits.h>
>
>  #ifdef CONFIG_KASAN_SW_TAGS
> +static inline void *__kasan_mem_to_shadow(const void *addr)
> +{
> +       return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
> +               + KASAN_SHADOW_OFFSET;
> +}

You're effectively undoing "kasan: sw_tags: Use arithmetic shift for
shadow computation" for x86 - why?
This function needs a comment explaining this.

Also, the commit message just says "it doesn't work for all cases" - why?

