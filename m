Return-Path: <linux-kbuild+bounces-7343-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810AACAF3E
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 15:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7FCB166C11
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 13:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC92220685;
	Mon,  2 Jun 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Foj7xX7A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFCA2AD1C
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Jun 2025 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871681; cv=none; b=nkuIaIhAq3oi//s3IFflEgNliMmOdDJHd8WeENPGVZRo5ezwlTrBqDRKuQawiFIVIrhk4o7HKOAtEMZN7jwc1q3HJiX/SaaUMQbqBf1kFrHo6voi3g0Ps6PrRcF5WUq8Ly2XD2JvmgdwOhHrOhJxdzPCMADhrSlV3vhjbtQZQTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871681; c=relaxed/simple;
	bh=17b6rkLqiVYT+k5HNRACtSFcfYPm20GeWHYC+TmvPOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TBs9yp7oMYkJoQC0Z3UdtMuU47ZZw26miYofKLToyL5ft/fYvo7g4zUWiCIkc6dKz8TnbJvfZRFQ6N661FaT8KMtNwCXf4qh3n4JtC/VnzP5yo8zqczFtx1yyS9t9trynK6uMyub0JZu44xG0mzxawMcDgoZZyF/smBJ+NysNU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Foj7xX7A; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-adb2e9fd208so705662266b.3
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Jun 2025 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748871675; x=1749476475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i09FXagDchB8oJdCa1RVA2Rh2QP/Ovzip5+s9LK+Ifc=;
        b=Foj7xX7AdnurADumUL7Mlykt8y8Zpb1LXhm+57ERiYXjgariYOSu/gJi9QL1fNTjz4
         Kg0QzNeYLegzB+Tq5ct/p1g25+n5w/ChbeialY1oSiV5GZSjZhmVNpTquV1LYtWH/P32
         Gw55KJHYez+tkuBqW+slAcNGprfT72ygigHeMTVmUNkhU+RVdgEXwK78bLXaYEb2ULmG
         QcofdsbdgOkVYwvjma/VFw5+YEIZHgFpQHa4gTetWerwYQijPqNP3HCLc8uI+JQXPt12
         WxBBLgTivW9vKdcO1VNN4Fkxjp1V4n/Gqpd/U2dCE+eM+5gq1Al9ephm7PoM7TzGTVD2
         FhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871675; x=1749476475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i09FXagDchB8oJdCa1RVA2Rh2QP/Ovzip5+s9LK+Ifc=;
        b=PkVXp/MOokFhlGqb8Mi58jmMYMC2QwTf4pTmu30Hf+lWHT8JfU7plOdbGghTIJNasY
         5ydjjFyqKZOqgz+rZjLLRdDfZA863aAAqZzYoEUP2dsfJu2oG1GbmKG21PRmAiik/o8U
         1o7NAP+yU4JlG7gnjwtJE0bc9j0j0tPEMoUrB9E+405cURFfiubaaQO4N3se5ixEHY4z
         /KTJPlhiqptr/lxqmaVOpBJzZM+nRWblRe0ZQx/rTjIpMpySN1EvRVL2jntp14EXmru8
         hihyzOZhpg2TeKZnc6h1kgneak9fiOCfjsW3w6TLCF5Rusw/2YL8mqwl2EMdz/CB7yG7
         rJjw==
X-Gm-Message-State: AOJu0Ywx+hvKxiJh/w0COObp9saiatrUKFq2eGWARIdms3BJGy8pIbE4
	2YZ1kMzQy7Ry4/J3D3yUB0RFt6A7OdhRw55YAgO1E0uYfY5NrRvRYLG1
X-Gm-Gg: ASbGncsp66tW+gWuaI1RlA62QlN6nYNF6RbkwBpVF6W/hHlxX3f5PAJvx+VwKaYq7xv
	T0M0pWftCj7JlQypdwEZkWl4jFVpXyQr3rqO4plOwkCnfWPBOlBSGDgOEx/rSHfvYf4hW+311r8
	VstOn/XKrcktsF2CkoL7RUKMGpaBU8WHYuIk4rpPeqyvRoV85C7/xWE+KCDH6K7E2Xk8p1DQnxC
	oNW01eyHz9GN8KpfE+8zPdlaS6CllIB2OCyHt5uYAFt8wCdwypuMapYONPxAApYMRa6UbgE020j
	OUdLru6G7xBVrqYBordgSKpSmRjQ6BEqzuCWMJZN7oQFlLr0PX9uE2x1HEDfWFU49/m+coY3PEO
	onzLHVWcLdAyf
X-Google-Smtp-Source: AGHT+IHlD8uN2QLOuitO69TD4/7ufPxbq1wG43jO639MYXPfbSmve0tg8RWXE8owjDXUhTPkzehEPg==
X-Received: by 2002:a17:907:3e1f:b0:ad5:d7bc:6623 with SMTP id a640c23a62f3a-adb32264a08mr1281275566b.7.1748871674873;
        Mon, 02 Jun 2025 06:41:14 -0700 (PDT)
Received: from [192.168.0.3] (mob-5-90-139-122.net.vodafone.it. [5.90.139.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84f389sm790962566b.82.2025.06.02.06.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 06:41:14 -0700 (PDT)
Message-ID: <ddf7c0be-48ce-47d5-acc6-2e9e5aae64b4@gmail.com>
Date: Mon, 2 Jun 2025 15:41:13 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Kconfig: Added compare capabilities for mconf
To: Randy Dunlap <rdunlap@infradead.org>, masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org
References: <20250601184049.368419-1-martellif67@gmail.com>
 <20250601184049.368419-2-martellif67@gmail.com>
 <2e8cb14e-abb7-4850-a1fe-31bad55bb04b@infradead.org>
Content-Language: en-US
From: Franco Martelli <martellif67@gmail.com>
Autocrypt: addr=martellif67@gmail.com; keydata=
 xjMEXwx9ehYJKwYBBAHaRw8BAQdA8CkGKYFI/MK9U3RPhzE5H/ul7B6bHu/4BIhTf6LLO47N
 J0ZyYW5jbyBNYXJ0ZWxsaSA8bWFydGVsbGlmNjdAZ21haWwuY29tPsKWBBMWCAA+FiEET9sW
 9yyU4uM6QbloXEn0O0LcklAFAl8MfXoCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQXEn0O0LcklBgAwEAhdX5TbxGOmMhlJUi9AkDACN2ZemI8Tz2jSZPDlOQoE0A/3Tq
 SPaEkb6kvK4xw626+AUDrfIzwzBscgpkDo4zCW0DzjgEXwx9ehIKKwYBBAGXVQEFAQEHQNP5
 V2q0H0oiJu89h1SSPgQDtkixXvUvRf1rNLLIcNpPAwEIB8J+BBgWCAAmFiEET9sW9yyU4uM6
 QbloXEn0O0LcklAFAl8MfXoCGwwFCQlmAYAACgkQXEn0O0LcklCMtgEAuCcSolf8LBIB4WTI
 4YGKiN7qBXfW0QTbPO+bPXQLxfEBAJuoVm3BlyMHoNG6UEZ2TcqfV8k6oRqwr/c0IXwJqEkK
In-Reply-To: <2e8cb14e-abb7-4850-a1fe-31bad55bb04b@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/25 at 02:59, Randy Dunlap wrote:
> 
> 
> On 6/1/25 11:40 AM, Franco Martelli wrote:
> 
> Missing patch description/justification here.....

Have you run a specific "git" command or simply edited the patch body 
before sending?

> 
> 
>> Signed-off-by: Franco Martelli <martellif67@gmail.com>
>> ---
>>   scripts/kconfig/confdata.c         | 165 ++++++++++++++++++++++++-
>>   scripts/kconfig/expr.h             |   9 ++
>>   scripts/kconfig/lkc.h              |  11 ++
>>   scripts/kconfig/lkc_proto.h        |   4 +
>>   scripts/kconfig/lxdialog/menubox.c |  13 +-
>>   scripts/kconfig/mconf.c            | 192 ++++++++++++++++++++++++++---
>>   6 files changed, 376 insertions(+), 18 deletions(-)
>>
>> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
>> index ac95661a1c9d..078d058c01d7 100644
>> --- a/scripts/kconfig/confdata.c
>> +++ b/scripts/kconfig/confdata.c
>> @@ -257,7 +257,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
>>   			sym->flags |= def_flags;
>>   			break;
>>   		}
>> -		if (def != S_DEF_AUTO)
>> +		if (def != S_DEF_AUTO && def != S_DEF_COMP)
>>   			conf_warning("symbol value '%s' invalid for %s",
>>   				     p, sym->name);
>>   		return 1;
>> @@ -386,6 +386,7 @@ int conf_read_simple(const char *name, int def)
>>   	def_flags = SYMBOL_DEF << def;
>>   	for_all_symbols(sym) {
>>   		sym->flags &= ~def_flags;
>> +		sym->comp_is_avail = false;
>>   		switch (sym->type) {
>>   		case S_INT:
>>   		case S_HEX:
>> @@ -445,6 +446,8 @@ int conf_read_simple(const char *name, int def)
>>   
>>   		sym = sym_find(sym_name);
>>   		if (!sym) {
>> +			if (def == S_DEF_COMP)
>> +				continue;
>>   			if (def == S_DEF_AUTO) {
>>   				/*
>>   				 * Reading from include/config/auto.conf.
>> @@ -462,6 +465,9 @@ int conf_read_simple(const char *name, int def)
>>   			continue;
>>   		}
>>   
>> +		if (def == S_DEF_COMP)
>> +			sym->comp_is_avail = true;
>> +
>>   		if (sym->flags & def_flags)
>>   			conf_warning("override: reassigning to symbol %s", sym->name);
>>   
>> @@ -529,6 +535,91 @@ int conf_read(const char *name)
>>   	return 0;
>>   }
>>   
>> +const char sym_get_comp_tristate_char(struct symbol *sym)
>> +{
>> +	char ch = '#';
>> +
>> +	if (sym_get_comp_is_avail(sym))
>> +		switch (sym_get_comp_tristate_value(sym)) {
>> +		case yes: ch = '*'; break;
>> +		case mod: ch = 'M'; break;
>> +		case no:  ch = '_'; break;
>> +		}
>> +
>> +	return ch;
>> +}
>> +
>> +static char * masked_xrealloc(char *s, size_t len, size_t *size)
> 
>     static char *mask_xrealloc(...
> (no space after '*')
> 
>> +{
>> +	char *ls = s;
>> +
>> +	if (s == NULL)
>> +		*size = 0;
>> +	if (len > *size)
>> +		ls = xrealloc(s, (*size = ((len / SYMBOL_MAXLENGTH) + 1) * SYMBOL_MAXLENGTH));
>> +
>> +	return ls;
>> +}
>> +
>> +#define LINE_LENGTH	(SYMBOL_MAXLENGTH +32)
>> +
>> +char * comp_get_list_diff(void)
> 
> ditto.
> 
>> +{
> 
>> +}
> 
>> @@ -801,6 +892,78 @@ int conf_write_defconfig(const char *filename)
>>   	return 0;
>>   }
>>   
>> +bool conf_write_comp(const char *name)
>> +{
>> +	FILE *fptemp, *fplist;
>> +	char *list = NULL, f_old[PATH_MAX +1],  tmpfile[] = "file_XXXXXX";
>> +	int ch;
>> +
>> +	if (!name)
>> +		return false;
>> +
>> +	if (is_present(name)) {
>> +		if (is_dir(name))
>> +			return false;
>> +		snprintf(f_old, PATH_MAX, "%s.old", name);
>> +		if (rename(name, f_old)) {
>> +			fprintf(stderr, "Failed to rename file: %s to %s\n", name, f_old);
>> +			return false;
>> +		}
>> +	}
>> +
>> +	list = comp_get_list_diff();
>> +	int tmpfd = mkstemp(tmpfile);
>> +
>> +	if (tmpfd < 0) {
>> +		fprintf( stderr, "Failed to create temporary file.\n" );
>> +		return false;
>> +	}
>> +
>> +	if ((fptemp = fdopen(tmpfd, "w")) == NULL) {
>> +		remove(tmpfile);
>> +		fprintf(stderr, "Failed to open a stream for the temporary file: %s\n", tmpfile);
>> +		return false;
>> +	}
>> +
>> +	if ((fplist = fmemopen(list, strlen(list), "r")) == NULL ) {
>> +		fclose(fptemp);
>> +		remove(tmpfile);
>> +		fprintf( stderr, "Failed to open a stream for fplist.\n" );
>> +		if (list)
>> +			free(list);
>> +		return false;
>> +	}
>> +
>> +	while ((ch = fgetc(fplist)) != EOF)
>> +		fputc(ch, fptemp);
>> +
>> +	if (ferror(fptemp)) {	/* checks whether fputc has encountered errors while writing the file */
>> +		fclose(fptemp);
>> +		fclose(fplist);
>> +		if (list)
>> +			free(list);
>> +		fprintf( stderr, "An error occured when writing the file: %s", tmpfile);
> 
> 		                           occurred
> 
>> +		return false;
>> +	}
>> +
>> +	if (rename(tmpfile, name)) {
>> +		fprintf(stderr, "Failed to rename file: %s to %s\n", tmpfile, name);
>> +		fclose(fptemp);
>> +		fclose(fplist);
>> +		if (list)
>> +			free(list);
>> +		remove(tmpfile);
>> +		return false;
>> +	}
>> +
>> +	fclose(fptemp);
>> +	fclose(fplist);
>> +	if (list)
>> +		free(list);
>> +
>> +	return true;
>> +}
>> +
>>   int conf_write(const char *name)
>>   {
>>   	FILE *out;
> 
> 

Sadly I forgot to run ./scripts/checkpatch.pl before sending the patch, 
sorry, my mistake.
Now how to deal with those typos? Should I git amend the commit and send 
a new version 2 of the patch? Sorry but I'm new in the kernel's process 
patching.

-- 
Franco Martelli

