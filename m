Return-Path: <linux-kbuild+bounces-6777-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57DAA0726
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 11:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1553F189C726
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 09:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546642BE0FA;
	Tue, 29 Apr 2025 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ANFeMDFn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202A62BD5BF
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Apr 2025 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918753; cv=none; b=t8O3vp5z7lyD7J/gEowIH6CtlIg0KcuH1bJiD7aSQ0ZF1AvMqmHEQOoLhBcHeowmiOJnU9a2M33WelEcSKrkenf6vVniFbjsjP2xHiY8hADRQJxGudBbu7jYP9tcpdaGt1ZKo451e5XEUT+p7pHnPI7qopQQ3bEK5Lh6UYDA4O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918753; c=relaxed/simple;
	bh=f7pDvu6ECsrsgKYQON9e4/9xdDrHgFQnB0lkO8B+Jvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIs8vCRhE5cZWQSsBjWKoWnMmW7JWkFEDdTFarxZC2A8cVQoRo5SlenK55wbKbARBbY5nDOQNxj/kXR+4417Hb5MgPgyMiXfvxYwBZSmr0pBIsmreNRH/osDj0CWMRJU3JAc8Ti0DSql3klEHJ9pfKVdmtLtA6wOIh9rv0IGcIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ANFeMDFn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2963dc379so842842166b.2
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Apr 2025 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745918748; x=1746523548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ElOoSWZpM3ikc1lzKjU4ubLyP5Lg55VfCDoToohcAo=;
        b=ANFeMDFnUZ9pZMC2WwJnUSeW+cB9AbQht4pnAUVrwa75Di0bV4qxEboKarEi3nng+/
         0dhOhW/zE2BuMCAXXvli9vySzDLi1mxuhhTZK2dqDrSu6hP2ugWwJ69sOgTb44S3Iljs
         lhKWVhKf2OAcbnBQiBVRU+kLfF+ke3FlG69HGQdVL3yzEBB1KPQWTUmBMhMuBXVMSysp
         mOyE+XP2sQIgp0IhZvyIxGE8LAO6oarVdRbaU/mgv98EVPE84V4dbGMXqXjAO8al03J/
         GWv0uCuFl9BSeoQv/FwveK3rZ1+0I1cGYEYiqf39KzC7h8qZfYoDTk3ij/r1Z6LzVEfi
         Tcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918748; x=1746523548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ElOoSWZpM3ikc1lzKjU4ubLyP5Lg55VfCDoToohcAo=;
        b=BrrJHYnyQgelhkORSp3vv4Yrv+dvRW4Y21NMXxTO4EKQqrk4KvKAKI0S2pv0tGa+jA
         SyzeZss8j6nfy0j9xClAjp3qQCelRg86r2RV7j/CaadEle/B/9X5hsNS4Dzylx5K87fX
         xJYS+WMNQtZh3kxv49yAbncMqLngKyqtWIGstVRHrFIRpDDTkaubRDe5tLNw5C+BFbp/
         lJmYjlgYYL4XNJIrdynKOD/Tt6oRipegCq/+Ar+rcV42ejEOev3ITQg70Iet0Tf13a9l
         z4IlQNxUTK27KlzKReA94bWnYUfsZQz0w2fBXy4bj4NRZgHozJjJmwt5HIMzI757mwzM
         3R+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWb/9Fub41iMjwgVbXls89M4DAZZP0g3gSX4NzaL1sar7a4vGayQMC8Tkdq5wGjviPlGnbk3h3h6TCImGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6YWH81TFMkh2CcLQDYh+vFPo9WzDRT9JWHE6sP4qO/usuQunK
	S9eGjSkn0BcyB216KU47lr9Qb31nbuJHJXka24EkJwxbXFRMGa6ZbOrdEJ6KzrU=
X-Gm-Gg: ASbGncvEeIwExj09QwJVgA6Aa/VXxoXmN9Jhv7ryCKLq4orxec4gp9Vx7lIBD/5cSTJ
	vXg+u+8vnQMzPOu4xFGtJkxdVK54BisDOnOHZqw0cbCVUaU7m5WHeZkuE8C1RxV+2hcmW9zMQDz
	Vixe8PGMvAT8IFR0BkK7xFRhaNP/O2CsQEylN+PppThcGOUEbw2ekPDRcp3YofL1aPyReCqQCGA
	jddE0u1VtRgUxm8eE79cJ1Y+zm68XTDh6K9km2BCJTl/qT3p/2Sj7mW+NXluFp6p9jrW7eke4h9
	qsHoAQReEpKlYJq+GI6nty730/uLCjZYXmfRv2SdSrA=
X-Google-Smtp-Source: AGHT+IFVTRdbb47gFd4dQ11iXGeiIng/kvnJTSM3K0lql6xfI+bbFj82/8CO5oL3FIVEmuzn0vU+WA==
X-Received: by 2002:a17:907:3e05:b0:ace:8398:b772 with SMTP id a640c23a62f3a-ace848f183amr1218151666b.14.1745918748343;
        Tue, 29 Apr 2025 02:25:48 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbc3sm752256966b.3.2025.04.29.02.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:25:47 -0700 (PDT)
Message-ID: <cf3ff619-6177-42e1-8f64-74cf4cbb8672@suse.com>
Date: Tue, 29 Apr 2025 11:25:47 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/7] modpost: Create modalias for builtin modules
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
 <bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/26/25 18:16, Alexey Gladkov wrote:
> For some modules, modalias is generated using the modpost utility and
> the section is added to the module file.
> 
> When a module is added inside vmlinux, modpost does not generate
> modalias for such modules and the information is lost.
> 
> As a result kmod (which uses modules.builtin.modinfo in userspace)
> cannot determine that modalias is handled by a builtin kernel module.
> 
> $ cat /sys/devices/pci0000:00/0000:00:14.0/modalias
> pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> 
> $ modinfo xhci_pci
> name:           xhci_pci
> filename:       (builtin)
> license:        GPL
> file:           drivers/usb/host/xhci-pci
> description:    xHCI PCI Host Controller Driver
> 
> Missing modalias "pci:v*d*sv*sd*bc0Csc03i30*" which will be generated by
> modpost if the module is built separately.
> 
> To fix this it is necessary to generate the same modalias for vmlinux as
> for the individual modules. Fortunately '.vmlinux.export.o' is already
> generated from which '.modinfo' can be extracted in the same way as for
> vmlinux.o.
> 
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>  include/linux/module.h   |  4 ----
>  scripts/mod/file2alias.c | 13 ++++++++++++-
>  scripts/mod/modpost.c    | 21 ++++++++++++++++++---
>  scripts/mod/modpost.h    |  7 ++++++-
>  4 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 7250b4a527ec..6225793ddcd4 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -257,14 +257,10 @@ extern void cleanup_module(void);
>  	__PASTE(type,			\
>  	__PASTE(__, name)))))))
>  
> -#ifdef MODULE
>  /* Creates an alias so file2alias.c can find device table. */
>  #define MODULE_DEVICE_TABLE(type, name)			\
>  extern typeof(name) __mod_device_table(type, name)	\
>    __attribute__ ((unused, alias(__stringify(name))))
> -#else  /* !MODULE */
> -#define MODULE_DEVICE_TABLE(type, name)
> -#endif
>  
>  /* Version of form [<epoch>:]<version>[-<extra-version>].
>   * Or for CVS/RCS ID version, everything but the number is stripped.
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index dff1799a4c79..0fa3f031b904 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1471,7 +1471,8 @@ static const struct devtable devtable[] = {
>  /* Create MODULE_ALIAS() statements.
>   * At this time, we cannot write the actual output C source yet,
>   * so we write into the mod->dev_table_buf buffer. */
> -void handle_moddevtable(struct module *mod, struct elf_info *info,
> +void handle_moddevtable(struct list_head *modules,
> +			struct module *mod, struct elf_info *info,
>  			Elf_Sym *sym, const char *symname)
>  {
>  	void *symval;

The new modules parameter is unused.

> @@ -1509,6 +1510,16 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
>  	typelen = name - type;
>  	name += strlen("__");
>  
> +	if (mod->is_vmlinux) {
> +		struct module *builtin_mod;
> +
> +		builtin_mod = new_module(modname, modnamelen);
> +		builtin_mod->is_vmlinux = mod->is_vmlinux;
> +		builtin_mod->dump_file = MODULE_BUILTIN_FNAME;

The module.dump_file member is described in scripts/mod/modpost.h as
"path to the .symvers file if loaded from a file". However, that is not
the case here.

Similarly, the module struct in scripts/mod/modpost.h is commented as
"represent a module (vmlinux or *.ko)", but this patch expands its scope
to also include builtin modules.

I'm not sure it's best to overload this data in this way. I think mixing
actual files and "logical" modules in the modules list is somewhat
confusing.

An alternative would be to keep a single module struct for vmlinux and
record the discovered aliases under it?

-- 
Thanks,
Petr

