Return-Path: <linux-kbuild+bounces-9047-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 865B7BC52A7
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Oct 2025 15:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99D5119E1E22
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 13:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2C0283FE2;
	Wed,  8 Oct 2025 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NPTt3lRa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CD28312E
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Oct 2025 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759929550; cv=none; b=runlaa5UWEvAdolZyo955dX+ID0InSd2dpjn29of1UtwwZUPcNrBW9JMO8Ti0jUwYTKh0E+zWy/p1gSlgIFv/kte4e6dnv1sUZFPZXNps4Co3DUBiiIX86kGkPHjTP0tU+Q9XDdebfynrFfynSv0LadaJiSOP9kPG5ippVVFG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759929550; c=relaxed/simple;
	bh=MFp9KUdYt6xEG2KBVkL/DRBGqry+bbucB+9ElbhxNuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJYO6Cu7N86EzQpoMOxPyB7JaXM278eGsZTu7OuoCsnQv9gMV9uYrz8lKwG8vVtboP93E85ssIa0+L1+xVIIMLnizg66p6TII6GHLtaieX/kGk281condpZpwTRLGb20z2iYKCcRVBPkbkC3vHjxIKkBcUe8HDdCr/85u2U9tq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NPTt3lRa; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so5862085f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Oct 2025 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759929546; x=1760534346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jozU4MCtlsfVf9HK2ileSJtZZH6tHRFGD8OutqReHLk=;
        b=NPTt3lRaVKHqE5xh2rBbCkXQByy+0thnAN0grg/XTTIi8YM9OzUKCEhjXpdlx2xM3l
         eQqnmDPVeI+sw1ERUJ8OtD2G8MsDei1stRSCyFnZXtebkVKt/hvTVZKOSI0bK8XupgSu
         q32aBcW4QbEYMu9mCv2GYYoSWLs/gvgx1uDmHfkeoeAUVNErGuadNoGuJyPqmBBhvyrw
         r63Jt4XvukLbc8jDbfOhkra5WzYyhNTtctxuUuTxgMtA3Eo+cHCUzQOKqxPQL9bRx8pq
         NFmP8tXBtekHA6YJwZQyTscFS8qsir5kb1j8UwfIfz5FtS2Wk6fem2s9AMqKWxrGvol9
         usYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759929546; x=1760534346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jozU4MCtlsfVf9HK2ileSJtZZH6tHRFGD8OutqReHLk=;
        b=Gyu2jIMOwK7+Wcz/3nfvvSH1wX7QStc9JOAE+fZUkZT1mgOZDC1NhUpIksHsd5dnZi
         viVc9787zi5cntOkkjaWMxXMbKD2fjGb0aSfz5ySXtqJbg2LNmgLwY4yEXxwiuJSewlP
         ig7YW+Hqxi/Aj5BdO9Aoi8Z6+bwqpNHyQ6L2VAFgp27MR3IvEzhFZ8mdNWmA+eROuA0j
         bhovBYTMtFJ3SnbvreuFtrGOdOZd1Tx+6abU9qL4xHcMvHF8wZNLc8oH2CUmORdGbDc/
         vNVe7m3SZv/mQyFfcNOyxEP8OYiAaFKHzcJXu9RbiqfnTxme6GjUEmxZgZ+QU9zsyO42
         c6og==
X-Forwarded-Encrypted: i=1; AJvYcCXKZ96SqVfaD6kKPASIpJtt5KdMkqxG3hWCX/LndRFbcFGkd54pcF6SdfA+rDLBIkYlH/UES657OiQFgWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyejF7SZJCKf/SuxgJdgcfDWoziDln61O9b2rJMAZQen6kN+eUp
	N+YZsVyXJSl9Fs5LW9FrLg2Gv2BajRxOo9sh8z0TAYmG6Cm3vUAvk+nMcLqhV9845E4=
X-Gm-Gg: ASbGncuPcfXHZfiY6+4dndOXIk6C+UuA+iYTQ2TvJzdcvcppyEI/jaH0JryhdGmtx97
	DhwB7heWQ/YyUE9SauxSEKjMA68T1ia4LcyKkuvSsWJMK/c1yQH9Lxi/tbKkjPjn7wHhSBxqoek
	1G3qrOxFhtiIIMkRDCF1g4UDbyvw0n6B/89Bj2Q+z+LVEOGNc8RQ+uCjwlJG58IjeYw2q8XqZpf
	vYxcjG/+PSey0FswMD2z6QbOEIr3uWlhWYeUg4jkCMdtUNTCTnRcFXJMJNuky2CndWiV0lnDyNk
	MNiX8LJQvBZTD3sEzQkBWKB8z7ZippcG/wriLSTdaXI1aewoe8GS2pSKSXjfJ0SmrGWNaxIHKx+
	a4w+fOYR8/Ix4itavoOM9VGnxdKGbCmVaRxVWA2YesL3sfRl/HwIyOmbxU2IyqFqirMQLnbW3Rb
	s=
X-Google-Smtp-Source: AGHT+IEaXUHfbuYM9nod7N9dOjKMSODtcO4+dyB2TLSlYEg1pQ+Lkd4II4POhjx99lRaAkInHDE4Dg==
X-Received: by 2002:a05:6000:2dc9:b0:407:7a7:1cb6 with SMTP id ffacd0b85a97d-4266e8e637amr2098415f8f.55.1759929546358;
        Wed, 08 Oct 2025 06:19:06 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e96e0sm29841221f8f.33.2025.10.08.06.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 06:19:06 -0700 (PDT)
Message-ID: <fdec30b6-e3d0-4694-ba29-3bc99960346a@suse.com>
Date: Wed, 8 Oct 2025 15:19:05 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] module loader: use kflagstab instead of *_gpl
 sections
To: Siddharth Nayyar <sidnayyar@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Nicolas Schier <nicolas.schier@linux.dev>,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250829105418.3053274-1-sidnayyar@google.com>
 <20250829105418.3053274-5-sidnayyar@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250829105418.3053274-5-sidnayyar@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/25 12:54 PM, Siddharth Nayyar wrote:
> Read __kflagstab section for vmlinux and modules to determine whether
> kernel symbols are GPL only.
> 
> Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
> ---
> [...]
> @@ -2607,6 +2605,7 @@ static int find_module_sections(struct module *mod, struct load_info *info)
>  				     sizeof(*mod->gpl_syms),
>  				     &mod->num_gpl_syms);
>  	mod->gpl_crcs = section_addr(info, "__kcrctab_gpl");
> +	mod->flagstab = section_addr(info, "__kflagstab");
>  
>  #ifdef CONFIG_CONSTRUCTORS
>  	mod->ctors = section_objs(info, ".ctors",

The module loader should always at least get through the signature and
blacklist checks without crashing due to a corrupted ELF file. After
that point, the module content is to be trusted, but we try to error out
for most issues that would cause problems later on.

For __kflagstab, I believe it would be useful to check that the section
is present to prevent the code from potentially crashing due to a NULL
dereference deep in find_exported_symbol_in_section(). You can rename
check_export_symbol_versions() to check_export_symbol_sections() and add
the following:

	if (mod->num_syms && !mod->flagstab) {
		pr_err("%s: no flags for exported symbols\n", mod->name);
		return -ENOEXEC;
	}

-- 
Thanks,
Petr

