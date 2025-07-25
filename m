Return-Path: <linux-kbuild+bounces-8178-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A4CB120FE
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 17:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C1A056474D
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 15:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D862EE966;
	Fri, 25 Jul 2025 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3qFdG94K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA02A23C505
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457639; cv=none; b=Cctjf/KrNvGdWYGctqkB7nMLx9VQkJ5jcFmVTyxQqff/mUtsNchySi+DV2MxH23BEhN3iwTQkK/vlsvtLMKvL/BlEIK4SAkbiHAeyu12ISCrq5G7fcWSFNxXUT37F++mDYQv8FN/3V4sUFw4b4Q2gvr54ckN6BQfRxVimX9up9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457639; c=relaxed/simple;
	bh=Y2VJHC8bAOkQEc3/BtZmdpAb3Sl0KXF+OY9Z87x54dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxiG88rRgHHk3QMDx/eogiVeNBRXGJG5YZWKnG5HvpGPG9nI5aw1EcehFlk0ULaIVA5gpmlTChclGxyM551HcG85frLNimaD+7XeU1PLVMD0XYBM+RdRc1h1or05EiPH5BZorICf3Ax+LZlLx2vv4pON84YalNsYEpQ5h+c2ydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3qFdG94K; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23dd9ae5aacso157645ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753457637; x=1754062437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IMrTLQB9tEMEJbnJ/xHH9mm9yGwT1IOyIE5qrsMa5ek=;
        b=3qFdG94K0lhDLFFJPjDp441fKtWgzb8DROT+sET3J9LGv6ySwx1dRXq7TjJ85Yv7d1
         tenBVaahN4wpQgE+fuXykhuIc/x3G/RHoe68zOq8SbF5yerQ5NlIWSpU+9h7sBv6MFhE
         yAuEGy/uTT3TZJ6Zxsjoqs4Du31F8cdoH/K7ndpjVAZGADsT4jyk1oqxzSX1kgEeRdY2
         ZB4wMIMpvdXiplDadgy9LmZYIi6u8ONI6E/JMwn5yKmkT673gM2YB7EwAK5P9yBzr/Ap
         gQtWoGzfQbunqjEzEUO0nEsmGB2VtLeVa3KARJhEf0zFiB03DbA1uHuyO/hrqYqVXCft
         aGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753457637; x=1754062437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMrTLQB9tEMEJbnJ/xHH9mm9yGwT1IOyIE5qrsMa5ek=;
        b=td/gDxeaejL8X6azl1hGvXBtCsAU2WwUmvdi/yOkhr3pxVnHa9fSA3C6yeJA3Lo7g9
         upxVPOHhrjjAHzRKIaj3/IleGxJdcxvwdhbKRm5oxSJAyjKWDoPj73DhVZBl6oVZ0yCW
         Q03LSyRBC1J5yn5BwQMXVz8SpdoFjglHT3x9DQguiKQmDvoE28QtLCemfgMfP/9Mt8iu
         xxVRDnsfKcalQubFZCBSiXFrOFNZeR6exijqU5b1PCtBlGNKDiQWfhHCV+1BrPDhWDXz
         PV6gPDLB27j9Ym1lMyulYwR+RCTBdUqWG2O0It80elJMnC8EZOGKSYNDNTYBAbNxizvy
         mUKg==
X-Forwarded-Encrypted: i=1; AJvYcCVkc3pcdUYmtQCpQ7xqP1+38pEMLtqlanwHB3tWDJMA/YZbzV+mUGIXuELZwQncUWI+FaZPTyAn0sNhvkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAVnjLYkDajPQ/aT0q+yOxOhpIQ1Ak22VR1J3bEnV9+l/5iUDE
	NF8AqKWNb2fvGQtGH6cEg+2Ie+kS4clZQwanWmexJDyJwQzKAY8PIuexzXctOQz+4w==
X-Gm-Gg: ASbGncsBI73Ja9IQITtJUfoZe0JmWa/SaRBGdP/fPNgkWFxUluhiBeAZCMDvVLDoR1R
	LLyOekqdbMsaqahLxcjo6QS0vKYq2iJ0B/baO8InN+/mBqwN46Mtn69Dpae1Ue87SfT+oWr8D3E
	IcXn2Qjd8CMwOM7Nq3WDkd/RyWm6+DD6Ifs03RyhuFER0PHlDOSpxEBviuknbBbIZtpHyEkFLg+
	y9OTm7C0X8fnKq2b/RIufdIEdtySZDST+KOY8u/E25+ihHIClA8kHerEy69D7ChmghKNUykLNdr
	dNuzkby8EWa9azv8+4vYNpxVPpPE87493kjgfoFMDKHhQ/9tpDJ24O7bRDzXovRC84pWwXvs2C2
	tdZjmkOk1pabIaFXgwxLcbyTInaE7cfDFqTdI1eNQ2m+PoCX5Eov2ScMoqZPm14CZmg==
X-Google-Smtp-Source: AGHT+IGqwy+SyKapfsDhV0SCrakv4CqrxfO6vBXV3nKCxXlckVrSgte7qwyPNubIbBY6dQEWJppRvg==
X-Received: by 2002:a17:903:2d1:b0:223:fd7e:84ab with SMTP id d9443c01a7336-23fadb22253mr3447835ad.24.1753457636899;
        Fri, 25 Jul 2025 08:33:56 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fd692sm86545ad.91.2025.07.25.08.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:33:56 -0700 (PDT)
Date: Fri, 25 Jul 2025 15:33:51 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
Message-ID: <20250725153351.GB1724026@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>

On Thu, Jul 24, 2025 at 04:36:55PM -0700, Deepak Gupta wrote:
> Call sites written in asm performing indirect call, they need to setup
> label register (t2/x7) with correct label.
> 
> Currently first kernel was compiled with `-save-temps` option and
> normalized function signature string is captured and then placed at the
> asm callsite.
> 
> TODO: to write a macro wrapper with toolchain support.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/kernel/entry.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 2660faf52232..598e17e800ae 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>  	load_per_cpu t0, irq_stack_ptr, t1
>  	li	t1, IRQ_STACK_SIZE
>  	add	sp, t0, t1
> +	lui t2, %lpad_hash("FvP7pt_regsE")

Ah, I see. The plan is to hardcode the signatures in assembly code and
keep them manually in sync with C code. When we implemented KCFI, we
thought this would become extremely tedious to maintain after a while.
Do you have any plans to add KCFI-style __kcfi_typeid_<function> symbols
that would allow labels to be determined from C type signatures instead?

Sami

