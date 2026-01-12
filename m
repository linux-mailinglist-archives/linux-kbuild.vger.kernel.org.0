Return-Path: <linux-kbuild+bounces-10508-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF50D133C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 15:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E1F8300B9C8
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 14:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F46624E4D4;
	Mon, 12 Jan 2026 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HxKCXCEn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27511AF0BB
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Jan 2026 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228629; cv=none; b=UQhzPSW3szy9dOQHu6mDEpw7LEGuTeb65N958v7f3ULLVS/w47Gbht5pmztt1r7MfuZX4en4YQfmnR3cvowTYG+TbKSD6laHq8jNSkbUnYBHDDH9RzNCl2DHq6m/DmQWhwsYKjexNPxZ5K0z21Lh+z8DJWhi6KLTD9HDeAJjPA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228629; c=relaxed/simple;
	bh=iyqqznUqDL99OwJCEkrsF2iVykllrm4FsNPCyAuRMwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DF1VDTtqBUN3e70yJBBtPRgiJAHrtOY2IJDqeK7VYpT2d8qQ0MQg2rp2+V35rEFVZqF3RdTnpOaxIVR+sck8k3Q9OqWWRgDAaeYi6a0TnUmhS4s+86XBBZ5SKvh+bnfSWSyi09yIuxLtjqykJDz7oCC4WC3QHZhqeEVKFcBQzPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HxKCXCEn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso51585905e9.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jan 2026 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768228626; x=1768833426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gusj9aT7RaX3C9uGASncaxKiTRdOev9W3ScVaZSC4iY=;
        b=HxKCXCEnI49Qz4IQaghPBJuui1rlMR6Novwc99GHqU+DzA2GaaTSHU0BmrzVdrjoR0
         eaJfAzUC0RPWV3NJ3dAm7K4H5ny9qutM5lWev7HR6nAwHlWZ222AgweMPQO1Pk4ZQ2/c
         927hsXyAyGVY5f9lK0+0f5jSUCbYNy+Q+zvBu1EG//K7ZGUb0WZAj8LIpQJEuaYR0xGr
         S/ADOD4neNCly69JA/OBFTtTVbHlCYWBXvPAD40FLZRPusoLLzlNVgM4hYtl7lA3HcSf
         Ew0d2xha43Q3Zw25P0OfIN5XwuIZDFWAF751T2FBGekiJw+zOfXVAX2cnH7DpNk0CKmM
         9XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228626; x=1768833426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gusj9aT7RaX3C9uGASncaxKiTRdOev9W3ScVaZSC4iY=;
        b=usJgRs4S85MER3C6a6vSrMGe+R25gpwpydLZ2TvD40uaroBuRfkftbyX7xuvDSo6+x
         bfKyHx8QgvF+Hnpy2z/ITxra9maG1slQuIFwry+YdE8bwY6xf24wlF0aqGvDqPQYdpac
         5QQXv9t+JGEOXS/ZKjCZ8rNh8vKbvE9K9ncdVzIXXtoza0eH/CHBnfxSfOl4EVjcy5v2
         FsMkVDx0z69Uk6Odln+UXcgNZiTXMLakYR9JME3UTa5f8WLbhKJcXq9iw+9uZqqriZua
         3v77/+EAHeqFkgRHfWXNHRD08jvWrNOCQr8AMer0OKFMIS47nSxAkxujscaJQxHEScTe
         z4tg==
X-Forwarded-Encrypted: i=1; AJvYcCWJwLAircdlk8wwKQd5xBVVabDkuPFtKjyJ+VSUjaJ7LGzGCDvNVC+OAQmQdRuO+4IP33E1jXRNS+61jX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXeM8eXbzWr3ImRoK3XKqrGAiYGn6Uf4jiYPMjMZFeWrb7mci
	pKmx2MzmU3qGMgY94OoGh6qLXgy7CImyuAXZvskJ7Vv8S5gM0PEZU35/BEB0kmVy5rk=
X-Gm-Gg: AY/fxX4JPgfr7nxgDv3s6HMyvNN8poPXCSpNN7gk7q+SnorT179yCrn55o1Zf/xAj44
	g8J1aceux89oDShIHELpG1e3/vmt2A0m92HJxKUicXR3rPd/urErBhPSZRRGEjwjQvCSbVghNCJ
	D4NuUzOjh9SJLAWUZtt8fzwrGmzvUzy3CAKwE81PURnQEpjwofHeAU5ZQvTizulqgEemtumXwIc
	bDfetU/R0bdYGqWjYTRlIMOhq6uoLiO11/rJgqztPn7jwAsAnh//d2wy2f6KA+pnVS8hg17p6PM
	5he0QnBGtKfbGlbeBjaeDHqMINYjs4mMSC7RkOELvZmDYVTC8HqtnXFsDKGM4fsOg2EPIJp39oP
	nKLyp6kcxeopgCIp0ZjVfyl5gzv/Iefxtwg9gyfJDAYIrr/N0O1Npzi6PRkABV2fi5M0wdUXmNZ
	zvgGuoL4TgH90BzAHDUKBAFOK0VwALBQ==
X-Google-Smtp-Source: AGHT+IFmm1oEKKdZV8ZlNXFTTJqlKJkxSdN4HcGz/P7O+LQJVZm9Zz54Me3GJnG5+SbV8c+kl57MWg==
X-Received: by 2002:a5d:5f94:0:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-432c37c87e4mr21260896f8f.39.1768228625843;
        Mon, 12 Jan 2026 06:37:05 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm38877725f8f.42.2026.01.12.06.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 06:37:05 -0800 (PST)
Message-ID: <d683a5c5-51ad-4b8e-bf8e-6a0526f7c9c1@suse.com>
Date: Mon, 12 Jan 2026 15:37:04 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: Fix kernel panic when a symbol st_shndx is out of
 bounds
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/30/25 7:32 PM, Ihor Solodrai wrote:
> The module loader doesn't check for bounds of the ELF section index in
> simplify_symbols():
> 
>        for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
> 		const char *name = info->strtab + sym[i].st_name;
> 
> 		switch (sym[i].st_shndx) {
> 		case SHN_COMMON:
> 
> 		[...]
> 
> 		default:
> 			/* Divert to percpu allocation if a percpu var. */
> 			if (sym[i].st_shndx == info->index.pcpu)
> 				secbase = (unsigned long)mod_percpu(mod);
> 			else
>   /** HERE --> **/		secbase = info->sechdrs[sym[i].st_shndx].sh_addr;
> 			sym[i].st_value += secbase;
> 			break;
> 		}
> 	}
> 
> A symbol with an out-of-bounds st_shndx value, for example 0xffff
> (known as SHN_XINDEX or SHN_HIRESERVE), may cause a kernel panic:
> 
>   BUG: unable to handle page fault for address: ...
>   RIP: 0010:simplify_symbols+0x2b2/0x480
>   ...
>   Kernel panic - not syncing: Fatal exception
> 
> This can happen when module ELF is legitimately using SHN_XINDEX or
> when it is corrupted.
> 
> Add a bounds check in simplify_symbols() to validate that st_shndx is
> within the valid range before using it.
> 
> This issue was discovered due to a bug in llvm-objcopy, see relevant
> discussion for details [1].
> 
> [1] https://lore.kernel.org/linux-modules/20251224005752.201911-1-ihor.solodrai@linux.dev/
> 
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

