Return-Path: <linux-kbuild+bounces-8159-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B3B11871
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 08:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD5C33BAAED
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 06:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166D12882C5;
	Fri, 25 Jul 2025 06:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="KJBxipd7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B11D2882B7
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753424632; cv=none; b=dJxSGP5AqJXG5IPvb2RhgQy8Cs83ykFJXDLnPDtljkNGHqkWPtmX6fCxLe41u/5OLfqj8Cl3ZhgOGxurugpkLKYzHGEGOl5WWqS/dB9nnSBXe29ocuik3gLfrvcqN7Xmg6lx53kbOrE9rJXh4pfcx1VQOi0u55QsNl+CvEyAKRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753424632; c=relaxed/simple;
	bh=wKx1blxbu5QSpaikoCUeh78SpjOHM3ezwW4MOGKYpB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSjpX0kbwRfwl+wEwybm6rzKqXIh5whzXkyLQmPVldORzx1UFTYqyp5nsbpLQw74aujaMxa/IcUaqrzE3D0pArWtdnsPDQ3LR9bmUa9N4//ej1aLZLu8YslAox3iBrHYMFNkK34tBlBTREL0iPBo0PbgsxXtnxqjORvdx0q4M9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=KJBxipd7; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 958023F946
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 06:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753424628;
	bh=yY/SYQrNWX8OlVsdlpiMi286zoK+AXS6J+gjgGy9bGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=KJBxipd7Ok3pTZP515xFxl1IqDlys0htEUqIsYbdSRS39m/Px3R63Thm0IeUdcNpR
	 0E8gtwpkwkmt9k0euiG1LyN5hMr0I7kXFJhvV3Fj8rAMZLROVHa2s865pE/fjUY5GB
	 IMhHCKGciGqs8XqaJrQXmO1T/l5xeNV0JZbuOfmyBaUooHmmuC5HvavdvsmnR71TW/
	 LbL8VGh/xmt80fQIPxEoOyqDNQU2WxLa8NanJfQHOu+BW8t7ksBUR8LKOesxIXvqY0
	 dCLYOlsw31pOHlfRTqUUqh2YTelgitVdpLUb3hx8V0tA6wD5Sjm0cy/n4LbanhY3fr
	 Un7nyrDE5yjdg==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f3796779so975604f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424628; x=1754029428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yY/SYQrNWX8OlVsdlpiMi286zoK+AXS6J+gjgGy9bGo=;
        b=Vm3XsvRFwhgW5gbZMRw7dYnFs/kCqGVmRAetuiefXMw35VS2VA2qpP99AiRP/KLnJj
         mu7d2VczZH5tkglO+cmmq7LBFQFIzZ4BKMFQW+sTCmNHuspZkgsIdiyYArOSaT7jJGwL
         anhEqT5mlwIj1f7pwgOLwipXhF32JS6/UL04ahMFg3U8isMPmTe9OaITGe10syHwsaCy
         53YMKrLgmb1zTF46zyrd+EIDIN5cAGuZIQ+Mk9i6chkhUJX4qPJiwr2A5d7/3pOo+/wY
         9zgdFQzv9Owp/uV4xmvfbZK2wbfWzyeVpuYL7O94vu7isrfvvxGNWPGt+senJoquLhVP
         a60Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIVSyO0x75Xn135HXozxG/HjOhXZudS0AmEo6fNbcxtwLHA7TWpzuWv5QxnNTBjBvSDntRJ/azf4gVyd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOH6rU2mp2RG0nR1n/WxCEEUNbkEkLT7VU5cUsFUsKtjFwUvsc
	EnxcDp5rwa94M4UIaFFMKIREVJ9DnWSxpYo//xfKCIcVPFhBsGREmsvsCk55rqMNPpp9qbL5Fs7
	vOi+i2QBFVzfbjo6psFSnEtVthd9vb8T0AEy08mGKX87fmbmB16x4vThLqYOkCm69rODA9B30HT
	1TifQszg==
X-Gm-Gg: ASbGncvm0m/G639rYVjoMkmeXGHFGqooNMyyxGRUwgwjExVAI9cFAxcSdAZglUmaDDX
	5ZEGraz5yi1CzpwQmgG+0xZ7rpDeJW/oiopPFVuxYt/V9Oi0iAKqgW+T5hxtF5gChjkYRogHbS7
	1cX6c2kdY19nKTZ4o07YDKxjJeeLPo+ZjzHfMzV/F8Ajz6Pb9grfNY5qMpWsp1OB87OEzKSnQkJ
	cLCNR5XzrPEUYNyDZVooPmfPJOSRkHPBJHmw7vY9pwTDkPaDRgWKolIXLH+Ofb6ITW2x4RlXD66
	3Ae3cgVjaTFlKZJ0HJ/zxoAvFO3FZ/LFqODjfC2sz0fdDwOWgoMdEMCHpMR5P6Kw6DpyiVgBwsx
	uvWem45UPyJwXPlpaniHrUnPZK/fASe9t/t5f
X-Received: by 2002:a05:6000:2306:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3b7765e57c8mr625991f8f.1.1753424627733;
        Thu, 24 Jul 2025 23:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1tfqV/uoCrIpUQ7zCYW6YsO9mWdhr+kRfUXgDIjxIPForORsIR9T6UJpoi3QB0+gQ5qNtNA==
X-Received: by 2002:a05:6000:2306:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3b7765e57c8mr625975f8f.1.1753424627337;
        Thu, 24 Jul 2025 23:23:47 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcace8csm4135036f8f.54.2025.07.24.23.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:23:46 -0700 (PDT)
Message-ID: <4ad699fc-a89d-4740-bdec-ecb9a2134c90@canonical.com>
Date: Fri, 25 Jul 2025 08:23:44 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.07.25 01:36, Deepak Gupta wrote:
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
>   arch/riscv/kernel/entry.S | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 2660faf52232..598e17e800ae 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>   	load_per_cpu t0, irq_stack_ptr, t1
>   	li	t1, IRQ_STACK_SIZE
>   	add	sp, t0, t1
> +	lui t2, %lpad_hash("FvP7pt_regsE")

In patch 1 you use lpad 0 due to missing tool support for signature hashing.

Wouldn't it be preferable to have a first patch series introducing 
landing pad support with lpad 0 and once tool support for signature 
hashing has landed create a second patch series using tags?

Such a first patch series would not have to be an RFC but might be 
merged soon.

Best regards

Heinrich

>   	jalr	a1
>   
>   	/* Switch back to the thread shadow call stack */
> 


