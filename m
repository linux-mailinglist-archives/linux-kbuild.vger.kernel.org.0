Return-Path: <linux-kbuild+bounces-8183-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E90B12267
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 18:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34EADAC8203
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 16:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DA72EF9A9;
	Fri, 25 Jul 2025 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="C05VdTwj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D502EE619
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 16:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753462588; cv=none; b=LjAtEs6tyXbdvqmBqHS5MwVRoXcHifIH/02zyu0LmzsaoSAvHfO1yWg5Y5kB0uq3lW7kB2ELzCUELrjGKjoAV20kta9042EmMiWaYLzuohJ/EfKzBoMSFtB/MnXD00KcWCxU7gJnzbTSPwBwq47QbvrHvEfKOkoJ1vgrKBVoUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753462588; c=relaxed/simple;
	bh=NTQ9y5wzsLsqxpaNqmlZYWgK3Cf2/Yl8wkm2X8FzHig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unWdu++ZSDkLZqaTK6utYn3BYG9SQONRDMeFpmWSaIEXjQ47dxkkVK0dKsUiKJA9gnbAjFR+eD+hVm7vsc0LU7aXMG7Id6svkSzu5WCY0VIgKwOY2wfd4QMnNpYuAB3IMwDjoYgfxuVqGqoruy7KvcV/tYKaYTNMe4g4dZboh0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=C05VdTwj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2404085b3a.0
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 09:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753462586; x=1754067386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WtgAXG2zxYUZH6Gw9dzWRKSuSkjlPnsCAnmjzmjgcv8=;
        b=C05VdTwjBIpXWRYUYFZfGHSUp+vfAuTGWou2JSARwQ84KjC4jFRsCuY6q1/eQ3ZgWK
         l0HdF2xZsc18eQCXuv7ADroTpQf0lAg+w8IPGG+Lpy2IMkzOyQYY6xIJVSK/XG42nbau
         yp1wlDi9EAdD8a8Y+rhpVSukgJbfBZwn9qsW6E7NqjgHBOQIPnXEl9uqp+spqE7c/j7m
         qsOTBD+bnSaJML9yFlwgdM1+qw09+JkYz892PSkNe8P9jmL7oOb9xnh1Nijz8fr4kHca
         k8/vfLtV9dr9QlQYlOJHMNWFsUvo+/eqBZ7s/EbpGI+0HKSnuSTaEARvpRq63LX6++IZ
         KNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462586; x=1754067386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtgAXG2zxYUZH6Gw9dzWRKSuSkjlPnsCAnmjzmjgcv8=;
        b=mZD5mw3+JTjR2nFXwV6N45zEW086FwABOIwzXiDPQY/Jw7ZSw98dnP23cJLcIDa/Wp
         Yf+mECWEw6nL9BZpNeZu4iGoqAP4BjERQcgFzr983bz3vY6bzNbnUID4egphO+badCb1
         RuqjljDV1aI3troN8qwn2vrS7Npn1dWyeiy5u0SnHq99RQEvdOAgf73FbphoSspHdsYx
         Ak3IxVLsNWJQcJL7v81Ve9RXAAVuIMSjeHhxCMiA9kMbz8hEX/m7hMtJnqA8o7BVZv3t
         L5SvD7pDmh5uAgTfDbXA7i+AwvUSyNkMHoMBv+qiihATHwOts8TOfOxriIUK++TWWU5v
         FMcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU02cxORC5TTMm6nNUGkuA9XFTENpthk0b91sCqDiRO93wJ7RbRHY93iB/JdkLFcF8dX+g98BhchV0jOfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHWKyJeIWlFq7sGVyNNdpoQnY2c7+G8+zv9nHuh1YsmqPQT0m9
	kPHQvaRQ4lPYD8Gwo84rBZKsKrv3hdrmO42rpEQnByF6/L7+z7bBOzMoHIy2ic74OS4=
X-Gm-Gg: ASbGncs+uYIeM8b8ock2Qzepn8zsPpDHNA9uolQFMAT1lwcU1mEwXw9xGVCKYFwuyEV
	ztrlC/pehwvsJgReJdfWLrjlZngxDlRUsftDoaRUz+PifkAUsZc1IqLyzIbpV/pj3K1AiEfHd1P
	E/7sDqvKu9XVXN5hffj4efhxQOfB1wPVzBdxR9DCbPzukLQf6ctRcKtgXGYEGX7cgA+mBhO6V7V
	L1SIspdbgp9tCmhfaiLhzX0yuUMCxJNebKHKI+rtp9wTmofwKLCVAdG1i+hnI30jJyolrDtPS/T
	+sBH5605EuD0QzGNRL5KMjuY9VjCzHBV00naP95+sd8965Sz5CZR1W60brJ0y6vqHeltwrwetX0
	FAlH86GTS3eEWDaKdi127xBbhBODuRo3GRCnPIth+Eq4=
X-Google-Smtp-Source: AGHT+IETBPZe8HlkltWjZZmkG8X/wqZoM335inOFOubYlGpOP3IUTPKQOC96UsFlPqNZzJonrdrGDQ==
X-Received: by 2002:a05:6a00:b50:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-76335b7ef36mr4059760b3a.19.1753462586198;
        Fri, 25 Jul 2025 09:56:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6d6312sm231084a12.62.2025.07.25.09.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:56:25 -0700 (PDT)
Date: Fri, 25 Jul 2025 09:56:22 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
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
Message-ID: <aIO3NtHJ1iCoGOs7@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
 <20250725153351.GB1724026@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250725153351.GB1724026@google.com>

On Fri, Jul 25, 2025 at 03:33:51PM +0000, Sami Tolvanen wrote:
>On Thu, Jul 24, 2025 at 04:36:55PM -0700, Deepak Gupta wrote:
>> Call sites written in asm performing indirect call, they need to setup
>> label register (t2/x7) with correct label.
>>
>> Currently first kernel was compiled with `-save-temps` option and
>> normalized function signature string is captured and then placed at the
>> asm callsite.
>>
>> TODO: to write a macro wrapper with toolchain support.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/kernel/entry.S | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 2660faf52232..598e17e800ae 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>>  	load_per_cpu t0, irq_stack_ptr, t1
>>  	li	t1, IRQ_STACK_SIZE
>>  	add	sp, t0, t1
>> +	lui t2, %lpad_hash("FvP7pt_regsE")
>
>Ah, I see. The plan is to hardcode the signatures in assembly code and
>keep them manually in sync with C code. When we implemented KCFI, we
>thought this would become extremely tedious to maintain after a while.

This is extremely tedious and not maintainable and primary reason (among
other secondary ones) to keep this patch series as RFC.

>Do you have any plans to add KCFI-style __kcfi_typeid_<function> symbols
>that would allow labels to be determined from C type signatures instead?

Yes something on similar lines. I have asked toolchain folks (Monk and Kito)
on how best to support this.

>
>Sami

