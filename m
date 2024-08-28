Return-Path: <linux-kbuild+bounces-3256-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D422B96279F
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 14:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 049A01C231A2
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 12:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4BD186284;
	Wed, 28 Aug 2024 12:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bqPT0FgF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D717C9AC
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849170; cv=none; b=itWFrCRBuk7Vh2/N35+VQip1eFE7KGwoLSxlPViDe2xhZ5OGxdo7/i36mtJ8LkkkVHWBepiHMKPoSo3m9smriaHCh0hxINb+we6s69APlqVSlr5KieXXAwNALqM0wLK1Oy2ZqPQThCDo26i9BCsjlicxSZsaye5MhuLTYzlkDUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849170; c=relaxed/simple;
	bh=/cT4Xi/eOAEvpHXHWvsJjX7/kGH9RbuoUARrWLTszIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKKoC09vovG0AnndDJk+VzCoc/99td04GoiWF9M2GEn2yz0GlemC7ZSkg28al9WJjibnBV4PYzNqr8EYJnUcCGV+XCKqQOOI9DihgjjoHnenrL6RqZvqlzJLyB5uYXoD+7Nvdn+2PmggN6vslWecZt4/YMSRS10hjx7I0nzzPIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bqPT0FgF; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5343e75c642so6168252e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724849165; x=1725453965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tF6sUHkqO4SD68+xzQN28GcD5wP4XnQ+wDIp9/AK6/w=;
        b=bqPT0FgFHsyU0G3EFTYeVAYqEjyEG4TGKN4uLTLEU2g7/QNSE3uAml5tp/91l5uEHK
         43vxcwPJnCdw4mIolZkt34dIH7lIsAjt2Q9T8L/DB6Gk7sqGLtmogH9ynFenbEtZKN2S
         DEBCWOzLnqEdrG9kMlrpZrymTXS7sasbUiaCkxpaG5xVgk1/JGYhHg5BxSRXpnzNgSj+
         71HBMdsWuVKUQhrVnaUDYNhJ5C0NlLxmj0Y7/MABKhhswVjXVtSg+IerRAY0DuzShfq6
         hPIE6KXI6KgKluPvNqXReXLxQgsuIxgZG4qh96k8s3keQpoUIHM8/8SgWgr5K+Q8foht
         g4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724849165; x=1725453965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tF6sUHkqO4SD68+xzQN28GcD5wP4XnQ+wDIp9/AK6/w=;
        b=BLZa8CvucGjkXmsi8GjPdKiZuoBxTF/z3/70XuEWRJkqdgCHu45kbX61xGrc5l+v96
         D81aiILe+ZzRPkS+/jK/pwFko1DDo1ahR5v6fJSU4hGpNRBM4xTnVAsO/36SsYReySMw
         kAq8PYmxoQVv1gZx1aavhJVM7Duhx549AwJBITdLR7R5iNTxNHg/A94Rx7epdAeRWpZU
         9XCxcJSbuZPEi/ID98512s0UBnuu6Bt9xYJErm+PErmb8d/yc18BURps3BHhs9OzMCvL
         FcQ8LX3jkqu3mreTqtdcyz09Dyf55A+s93UoOScvmyf8k1sDKnrcRjwlQS2OFHN3959e
         CaNA==
X-Forwarded-Encrypted: i=1; AJvYcCWn4Plt6ZGmQeaL/P+rJIHLdSSNj3OG6QJ9F+87zEkUlW41PFrgcYoZcpU1ffbFgwWcxC6Wux6ACZlnARg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmMI84IlBbKc97mLBIQMb47N7n0BXDOWev3Ajqen19tkQxcRGI
	2sFjzahjztaAXWufn2AZTgGuy+3oaHaJw2BhJRPGNaZAwyAbsP4mzUH+A23HTsY=
X-Google-Smtp-Source: AGHT+IHro9qeKaCY792yMnKxlwgxFiEDVsOC5d/A0lnJdSBAxKmmf92zy4Bd/E6/xRJrnEvtOOeR/Q==
X-Received: by 2002:a05:6512:ac7:b0:533:6f3:9857 with SMTP id 2adb3069b0e04-5343882e19bmr11853046e87.5.1724849164718;
        Wed, 28 Aug 2024 05:46:04 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e582d896sm243412366b.131.2024.08.28.05.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 05:46:04 -0700 (PDT)
Message-ID: <742f7226-9c66-4cfb-ba31-222dfb54fc34@suse.com>
Date: Wed, 28 Aug 2024 14:46:03 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] gendwarfksyms: Expand base_type
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-26-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-26-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Start making gendwarfksyms more useful by adding support for
> expanding DW_TAG_base_type types and basic DWARF attributes.
> 
> Example:
> 
>   $ echo loops_per_jiffy | \
>       scripts/gendwarfksyms/gendwarfksyms --debug vmlinux.o
>   ...
>   gendwarfksyms: process_exported_symbols: loops_per_jiffy
>   variable base_type unsigned long byte_size(8) encoding(7);
>   ...
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/dwarf.c | 121 +++++++++++++++++++++++++++++++++-
>  1 file changed, 120 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 956b30224316..a37c9049d18e 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -5,6 +5,17 @@
>  
>  #include "gendwarfksyms.h"
>  
> +#define DEFINE_GET_ATTR(attr, type)                                    \
> +	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
> +				      type *value)                     \
> +	{                                                              \
> +		Dwarf_Attribute da;                                    \
> +		return dwarf_attr(die, id, &da) &&                     \
> +		       !dwarf_form##attr(&da, value);                  \
> +	}
> +
> +DEFINE_GET_ATTR(udata, Dwarf_Word)
> +
>  static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
>  {
>  	Dwarf_Attribute da;
> @@ -60,6 +71,74 @@ static int process(struct state *state, const char *s)
>  	return 0;
>  }
>  
> +#define MAX_FMT_BUFFER_SIZE 128
> +
> +static int process_fmt(struct state *state, const char *fmt, ...)

Nit: The state parameter is unused by a number of these process_*()
functions, including the leaf process(). I suggest removing it so it
doesn't need to be passed around unnecessarily.

> +{
> +	char buf[MAX_FMT_BUFFER_SIZE];
> +	va_list args;
> +	int res;
> +
> +	va_start(args, fmt);
> +
> +	res = checkp(vsnprintf(buf, sizeof(buf), fmt, args));
> +	if (res >= MAX_FMT_BUFFER_SIZE - 1) {

This check looks off by one, though on the safe side:
res >= sizeof(buf)

> +		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
> +		res = -1;
> +	} else {
> +		res = check(process(state, buf));
> +	}
> +
> +	va_end(args);
> +	return res;
> +}
> +
> +/* Process a fully qualified name from DWARF scopes */
> +static int process_fqn(struct state *state, Dwarf_Die *die)
> +{
> +	Dwarf_Die *scopes = NULL;
> +	const char *name;
> +	int res;
> +	int i;
> +
> +	res = checkp(dwarf_getscopes_die(die, &scopes));
> +	if (!res) {
> +		name = get_name(die);
> +		name = name ?: "<unnamed>";
> +		return check(process(state, name));
> +	}
> +
> +	for (i = res - 1; i >= 0; i--) {
> +		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
> +			continue;
> +
> +		name = get_name(&scopes[i]);
> +		name = name ?: "<unnamed>";
> +		check(process(state, name));
> +		if (i > 0)
> +			check(process(state, "::"));

Failed check(process()) calls here return immediately and so would leak
scopes. However, I see this is fixed in the following patch
"gendwarfksyms: Add a cache for processed DIEs" so it's ok.

> +	}
> +
> +	free(scopes);
> +	return 0;
> +}
> +
> +#define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                         \
> +	static int process_##attribute##_attr(struct state *state,        \
> +					      Dwarf_Die *die)             \
> +	{                                                                 \
> +		Dwarf_Word value;                                         \
> +		if (get_udata_attr(die, DW_AT_##attribute, &value))       \
> +			check(process_fmt(state,                          \
> +					  " " #attribute "(%" PRIu64 ")", \
> +					  value));                        \
> +		return 0;                                                 \
> +	}
> +
> +DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
> +DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
> +DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
> +
>  bool match_all(Dwarf_Die *die)
>  {
>  	return true;
> @@ -81,6 +160,44 @@ int process_die_container(struct state *state, Dwarf_Die *die,
>  	return 0;
>  }
>  
> +static int process_type(struct state *state, Dwarf_Die *die);
> +
> +static int process_type_attr(struct state *state, Dwarf_Die *die)
> +{
> +	Dwarf_Die type;
> +
> +	if (get_ref_die_attr(die, DW_AT_type, &type))
> +		return check(process_type(state, &type));
> +
> +	/* Compilers can omit DW_AT_type -- print out 'void' to clarify */
> +	return check(process(state, "base_type void"));
> +}
> +
> +static int process_base_type(struct state *state, Dwarf_Die *die)
> +{
> +	check(process(state, "base_type "));
> +	check(process_fqn(state, die));
> +	check(process_byte_size_attr(state, die));
> +	check(process_encoding_attr(state, die));
> +	return check(process_alignment_attr(state, die));
> +}
> +
> +static int process_type(struct state *state, Dwarf_Die *die)
> +{
> +	int tag = dwarf_tag(die);
> +
> +	switch (tag) {
> +	case DW_TAG_base_type:
> +		check(process_base_type(state, die));
> +		break;
> +	default:
> +		debug("unimplemented type: %x", tag);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Exported symbol processing
>   */
> @@ -91,7 +208,9 @@ static int process_subprogram(struct state *state, Dwarf_Die *die)
>  
>  static int process_variable(struct state *state, Dwarf_Die *die)
>  {
> -	return check(process(state, "variable;\n"));
> +	check(process(state, "variable "));
> +	check(process_type_attr(state, die));
> +	return check(process(state, ";\n"));
>  }
>  
>  static int process_symbol_ptr(struct state *state, Dwarf_Die *die)

-- 
Thanks,
Petr

