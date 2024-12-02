Return-Path: <linux-kbuild+bounces-4938-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1789E08A2
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 17:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E10A617302B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27FC17332C;
	Mon,  2 Dec 2024 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IPd7OWB2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3316F84F
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Dec 2024 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733155738; cv=none; b=jb7QhfAmutIs3zic3uhmayDJvbxo6Hh4s3nVDZFByGvpMVQEiotejoek4Ev7Ap/0bbxZrTi3VHb8/a49qIVAK2KQzQue3Z96qj+hg1w8R9d/ICMdR0raken3pU4/nksPa43OTwb6kLm1EE5eyNVLe0zsGdnD5STS3Qa4yx0oU14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733155738; c=relaxed/simple;
	bh=MwB1ACqjAl/x3LNO27/3tM8Pks1XLvEtvtCteP6ruUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCFinlYvya1X1Bjf2N1wH6PQCqtWySSBE8MsVblHY/WCKnk8p3YtigLYBQclbDacXTbMdQThAP8C9Jv6l/9qvto4nNiC77DRwRcQICEt2ca4ofv1KI7i5Hyghi63H1SEfhKN+pDkpN3jnmtM3luS11DmaArHw2HZtbaJ5IyxHfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IPd7OWB2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e3621518so1760832f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Dec 2024 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733155734; x=1733760534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wk9t4gJyThohCN5wH/UWKd/DL3WW9bY6aJcRvcTwW+M=;
        b=IPd7OWB29gqHQCgvYZIT/dkWVaopbBnsYwjBoQXEiEU3lcqlcS0Skvy4p+n7of2xIU
         QO2bq484PA4IkL9WnrhnRQv42L2vBYbLV0cabcHqFBC/JiAcT1MXM0rD9KlfGSxZbF+S
         NruSM1vAoFDAarT662Scyd1/3U1pkULdYQy+4JHkst7vXI/Akde+QVqd1V8P1T7kMRjq
         y6VlTYTsJUW5IlRCMrwKrBRddxaZhM0EYZQyEGypCC422wHZ1/gZFHTDq+wvJOgLJTaD
         ozstk65PY+jd1/QKcwhTU4eBoyBjufKSUhuDe8HB28rjNxLecT/WfL3iePyampzVtjeE
         Ga1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155734; x=1733760534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wk9t4gJyThohCN5wH/UWKd/DL3WW9bY6aJcRvcTwW+M=;
        b=UR7qYhzUWBhx/I5QyBXihqI+av5Z8BwvC8nP5knv8k14CFxhT/K+ucOhwwAuTWBma6
         ii/ykaGH+plRIalTkSPvn86suWxztxi36ibz7UiPwMzvRJKLNqwkGQYU3OLmujDi9/42
         Mq5JiGIOVtPlNu8+qM/SLS/uCsI9uLTJ1oY4h/Y5ABL8O01erYwT4+amvVjwvrdmE4/B
         RTH2gFchDY5pwl5zt6jBgqaADSQbLbgj5akesJ1NpoFf1fGq+ig8B01FEAGl/bmBLUpR
         ZX+LBtLt1Xmygv4YkKM29G/gG8M6blu1LeLWsbAAMx60W4MBNsXFC0hIMRTpv5gBMrVg
         Ey3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAYvyWP5SQ1uU/Wwb17D/DFxO4jLdMGWJCts85p5AXNHGMzeirakMsPvhMyby7SrRyEJLTsw4LFFQnJeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpDUCS7d3kQk48P9l+UJGf29k/ve01CUdsgTjm6fd76ZJQqrM
	4Txe3V9/L88j3sqw0ZMB2OCJ15TXEW5WudmF7w/KnN7YfErecE5kfBoBo9Nn+dI=
X-Gm-Gg: ASbGncsOViQ7wxHfQJeCVBC3I8LAIYutCYiC4DwyFvdd98UwlrLrx/5MG+IusoGYfnP
	kNdsstiAImVi1IK82pg8j5DntYjn0Aq09Vf6+bQw6Nr5Tgizh/0HshS6SClSrO4epY/SiIfx+Ki
	o6rcGA4S9XY+fPbKTwEHcowmBnPEV03zxWdz5Z6MdU7OV7SYQ/wm+0AVG3Me/eWc/ug4kUdSgxv
	GW5deOI+2jLMKHjpj2e++XFxTmCzHKEMlBwEpjbARB4sXEoGfUDTw==
X-Google-Smtp-Source: AGHT+IHdMxsweQVSvkIE89/cartjnOdmknoW4rycIDu/WM156Nv5fZKnY0Cvww8TcwuaRagOlY68cw==
X-Received: by 2002:a5d:5f46:0:b0:385:fb59:8358 with SMTP id ffacd0b85a97d-385fb598458mr236029f8f.53.1733155732003;
        Mon, 02 Dec 2024 08:08:52 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68c1bsm13165465f8f.84.2024.12.02.08.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 08:08:51 -0800 (PST)
Message-ID: <de6b416c-b96a-43aa-ad72-ea365ffbe785@suse.com>
Date: Mon, 2 Dec 2024 17:08:49 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/18] gendwarfksyms: Add address matching
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-22-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241121204220.2378181-22-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/24 21:42, Sami Tolvanen wrote:
> The compiler may choose not to emit type information in DWARF for all
> aliases, but it's possible for each alias to be exported separately.
> To ensure we find type information for the aliases as well, read
> {section, address} tuples from the symbol table and match symbols also
> by address.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
[...]
> @@ -82,6 +118,130 @@ struct symbol *symbol_get(const char *name)
>  	return sym;
>  }
>  
> +typedef void (*elf_symbol_callback_t)(const char *name, GElf_Sym *sym,
> +				      Elf32_Word xndx, void *arg);
> +
> +static void elf_for_each_global(int fd, elf_symbol_callback_t func, void *arg)
> +{
> +	size_t sym_size;
> +	GElf_Shdr shdr_mem;
> +	GElf_Shdr *shdr;
> +	Elf_Data *xndx_data = NULL;
> +	Elf_Scn *scn;
> +	Elf *elf;
> +
> +	if (elf_version(EV_CURRENT) != EV_CURRENT)
> +		error("elf_version failed: %s", elf_errmsg(-1));
> +
> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
> +	if (!elf)
> +		error("elf_begin failed: %s", elf_errmsg(-1));
> +
> +	scn = elf_nextscn(elf, NULL);
> +
> +	while (scn) {
> +		shdr = gelf_getshdr(scn, &shdr_mem);
> +		if (!shdr)
> +			error("gelf_getshdr failed: %s", elf_errmsg(-1));
> +
> +		if (shdr->sh_type == SHT_SYMTAB_SHNDX) {
> +			xndx_data = elf_getdata(scn, NULL);
> +			if (!xndx_data)
> +				error("elf_getdata failed: %s", elf_errmsg(-1));
> +			break;
> +		}
> +
> +		scn = elf_nextscn(elf, scn);
> +	}
> +
> +	sym_size = gelf_fsize(elf, ELF_T_SYM, 1, EV_CURRENT);
> +	scn = elf_nextscn(elf, NULL);
> +
> +	while (scn) {
> +		shdr = gelf_getshdr(scn, &shdr_mem);
> +		if (!shdr)
> +			error("gelf_getshdr failed: %s", elf_errmsg(-1));
> +
> +		if (shdr->sh_type == SHT_SYMTAB) {
> +			unsigned int nsyms;
> +			unsigned int n;
> +			Elf_Data *data = elf_getdata(scn, NULL);
> +
> +			if (!data)
> +				error("elf_getdata failed: %s", elf_errmsg(-1));
> +
> +			if (shdr->sh_entsize != sym_size)
> +				error("expected sh_entsize (%lu) to be %zu",
> +				      shdr->sh_entsize, sym_size);
> +
> +			nsyms = shdr->sh_size / shdr->sh_entsize;
> +
> +			for (n = 1; n < nsyms; ++n) {
> +				const char *name = NULL;
> +				Elf32_Word xndx = 0;
> +				GElf_Sym sym_mem;
> +				GElf_Sym *sym;
> +
> +				sym = gelf_getsymshndx(data, xndx_data, n,
> +						       &sym_mem, &xndx);
> +
> +				if (!sym ||
> +				    GELF_ST_BIND(sym->st_info) == STB_LOCAL)
> +					continue;

Doesn't NULL returned by gelf_getsymshndx() indicate an error? If yes
then I think it should be reported instead of silently skipping the
symbol.

With this addressed, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

