Return-Path: <linux-kbuild+bounces-3510-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B916974F42
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 12:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBA76288104
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 10:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CC0183090;
	Wed, 11 Sep 2024 10:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UxcJzmjD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CAA177992
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Sep 2024 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726049302; cv=none; b=kcvNx/bhs7JhXU6tnZK+ev9MNnOlndK4YCEOQmwzVu8qyqiOBW2wJ2A6coJ150MOuOigXh3LCZCbsy8yWGUuraijTbiyi9mtufZ9iGQ1VOQCd7Gbjkm+tPw3u9kai2Oxoo46sAmXJ9ZMSNKmVDwPFplsqtlvzKvvaD2iUmfmvbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726049302; c=relaxed/simple;
	bh=+41ym0oq7koqErhcjNzKstmbOprJM0FQEV9UNZzt75I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULbXHZoOaJ8hK21QTv7GvBnajUFEyiEixBxqLt+Rd2WZySg6FT1lV3wjkbjHeAQ6VEUzqa/eJRN+Atgm0OkFgkgUwhNApOJFF1Kpy9IMjS9TZBc3i+D7KhZR/GE712B/Vd1p9o2vH1AuXHJWQ6Yb/sf4s/QNPnKDGB4368b5yWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UxcJzmjD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374c180d123so3656887f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Sep 2024 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726049298; x=1726654098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEbteZ8pj2sLPHLQWtPLHh7+HlZIacQ9h6WDtX1i+UU=;
        b=UxcJzmjDDnJdwJ29Exa0h7ULocd2HdDIgSbM6b8EoAIigV6+O4+0oz7HAb06C4c1KT
         1llfmFQEMysFdRUWwCboc02CMboQNKYa4DL3iIA4IRHim88BKam3cT1tlTQAnwBMgf7Q
         qIRibTJ/dQ1y69XaYcz/i4cCFp89RkvJhZ/ol6KpzdOUjGINE25xOClNaoO1HVQ3hnwf
         M0RAHADw9uUjWSO4pqyyZKrdVgencQEePMjV62S2QZYzbkq3OVl7HCZns07+wUY8X/Om
         UxwKdPW1R5RTvZWCqzgGtENc+hKLUqwQW5mNdhQHUNgmqlLzwyn3xM1Eg/ymGMRKLIx6
         tLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049298; x=1726654098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEbteZ8pj2sLPHLQWtPLHh7+HlZIacQ9h6WDtX1i+UU=;
        b=PtG4lt3hIs5nz5OlDxiAxYyjjmlBT5DeNKnxRJDcqvDdhWxXXJQlPrIaR1HW2oVaTA
         LxR/E5z2dH/2/fYodyfG7dWyoBchleU8wAroZ2CNLRITN2+S2DPdv3AL4AmhUeyBcDvS
         w9v6JAwQmhx2NxtIARPbjNKvCEEY5PGR96znUEuUH8Ea9CjGc1w09j7qKhRV4Gp9NSdV
         X1CnRJDA2W+IPfqH+nmZ+Xh76MAT3sIGwvY5gJjGjYnXjI9jRWtE+A+FizTNnq/b56KL
         h4Ds1Dr4BF5eXgJLf5GL9JJMO0XN7mSkvq1p0OvMIT5SGHyy3GYqK58oXgSyRk+CRIf8
         b5vw==
X-Forwarded-Encrypted: i=1; AJvYcCWNGCIKZTb0SFSSVSXcwM0w0We5KydaL+QIdrb8w9c/8eqCAt4bZm6ePWFhrB1Eq6FyTKp5xz/8N202U+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOGaUhjQvQi6uO6OvDY/I3IK9tvghHV0EjYYrusrTcbDBA1WD9
	sSSH3hXQFpNTS71cRHvw3Xf6gvA5z4E1ePI4Xjm8gMQ7U1GRvxFLjnNbnIhBs5w=
X-Google-Smtp-Source: AGHT+IHEQtrw0MPTbADJnJkFEMwwMmcCN/MKROimyM9FSYBDC/KWbqQoCO8Ml3eKNSSdU0qt0N7y4w==
X-Received: by 2002:a05:6000:1f0b:b0:374:c793:7bad with SMTP id ffacd0b85a97d-378949f7bfbmr8341684f8f.16.1726049297211;
        Wed, 11 Sep 2024 03:08:17 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de02esm11161829f8f.109.2024.09.11.03.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 03:08:16 -0700 (PDT)
Message-ID: <286b1cc5-1757-4f0a-bb66-0875f4608c7e@suse.com>
Date: Wed, 11 Sep 2024 12:08:15 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/19] gendwarfksyms: Add symbol versioning
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
 <20240815173903.4172139-35-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-35-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Add a basic CRC32 implementation adapted from genksyms, and produce
> matching output from symtypes strings in type_map.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/Makefile        |   1 +
>  scripts/gendwarfksyms/crc32.c         |  69 ++++++++++++++
>  scripts/gendwarfksyms/crc32.h         |  34 +++++++
>  scripts/gendwarfksyms/dwarf.c         |  47 ++++++++--
>  scripts/gendwarfksyms/gendwarfksyms.c |  10 ++-
>  scripts/gendwarfksyms/gendwarfksyms.h |  15 +++-
>  scripts/gendwarfksyms/symbols.c       |  65 ++++++++++++++
>  scripts/gendwarfksyms/types.c         | 124 +++++++++++++++++++++++++-
>  8 files changed, 348 insertions(+), 17 deletions(-)
>  create mode 100644 scripts/gendwarfksyms/crc32.c
>  create mode 100644 scripts/gendwarfksyms/crc32.h
> 
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
> index 4866a2fd0e46..2043601df736 100644
> --- a/scripts/gendwarfksyms/Makefile
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -2,6 +2,7 @@ hostprogs-always-y += gendwarfksyms
>  
>  gendwarfksyms-objs += gendwarfksyms.o
>  gendwarfksyms-objs += cache.o
> +gendwarfksyms-objs += crc32.o
>  gendwarfksyms-objs += die.o
>  gendwarfksyms-objs += dwarf.o
>  gendwarfksyms-objs += symbols.o
> diff --git a/scripts/gendwarfksyms/crc32.c b/scripts/gendwarfksyms/crc32.c
> new file mode 100644
> index 000000000000..23b328cd74f2
> --- /dev/null
> +++ b/scripts/gendwarfksyms/crc32.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Based on scripts/genksyms/genksyms.c, which has the following
> + * notice:
> + *
> + * Generate kernel symbol version hashes.
> + * Copyright 1996, 1997 Linux International.
> + *
> + * New implementation contributed by Richard Henderson <rth@tamu.edu>
> + * Based on original work by Bjorn Ekwall <bj0rn@blox.se>
> + *
> + * This file was part of the Linux modutils 2.4.22: moved back into the
> + * kernel sources by Rusty Russell/Kai Germaschewski.
> + */
> +
> +const unsigned int crctab32[] = {
> +	0x00000000U, 0x77073096U, 0xee0e612cU, 0x990951baU, 0x076dc419U,
> +	0x706af48fU, 0xe963a535U, 0x9e6495a3U, 0x0edb8832U, 0x79dcb8a4U,
> +	0xe0d5e91eU, 0x97d2d988U, 0x09b64c2bU, 0x7eb17cbdU, 0xe7b82d07U,
> +	0x90bf1d91U, 0x1db71064U, 0x6ab020f2U, 0xf3b97148U, 0x84be41deU,
> +	0x1adad47dU, 0x6ddde4ebU, 0xf4d4b551U, 0x83d385c7U, 0x136c9856U,
> +	0x646ba8c0U, 0xfd62f97aU, 0x8a65c9ecU, 0x14015c4fU, 0x63066cd9U,
> +	0xfa0f3d63U, 0x8d080df5U, 0x3b6e20c8U, 0x4c69105eU, 0xd56041e4U,
> +	0xa2677172U, 0x3c03e4d1U, 0x4b04d447U, 0xd20d85fdU, 0xa50ab56bU,
> +	0x35b5a8faU, 0x42b2986cU, 0xdbbbc9d6U, 0xacbcf940U, 0x32d86ce3U,
> +	0x45df5c75U, 0xdcd60dcfU, 0xabd13d59U, 0x26d930acU, 0x51de003aU,
> +	0xc8d75180U, 0xbfd06116U, 0x21b4f4b5U, 0x56b3c423U, 0xcfba9599U,
> +	0xb8bda50fU, 0x2802b89eU, 0x5f058808U, 0xc60cd9b2U, 0xb10be924U,
> +	0x2f6f7c87U, 0x58684c11U, 0xc1611dabU, 0xb6662d3dU, 0x76dc4190U,
> +	0x01db7106U, 0x98d220bcU, 0xefd5102aU, 0x71b18589U, 0x06b6b51fU,
> +	0x9fbfe4a5U, 0xe8b8d433U, 0x7807c9a2U, 0x0f00f934U, 0x9609a88eU,
> +	0xe10e9818U, 0x7f6a0dbbU, 0x086d3d2dU, 0x91646c97U, 0xe6635c01U,
> +	0x6b6b51f4U, 0x1c6c6162U, 0x856530d8U, 0xf262004eU, 0x6c0695edU,
> +	0x1b01a57bU, 0x8208f4c1U, 0xf50fc457U, 0x65b0d9c6U, 0x12b7e950U,
> +	0x8bbeb8eaU, 0xfcb9887cU, 0x62dd1ddfU, 0x15da2d49U, 0x8cd37cf3U,
> +	0xfbd44c65U, 0x4db26158U, 0x3ab551ceU, 0xa3bc0074U, 0xd4bb30e2U,
> +	0x4adfa541U, 0x3dd895d7U, 0xa4d1c46dU, 0xd3d6f4fbU, 0x4369e96aU,
> +	0x346ed9fcU, 0xad678846U, 0xda60b8d0U, 0x44042d73U, 0x33031de5U,
> +	0xaa0a4c5fU, 0xdd0d7cc9U, 0x5005713cU, 0x270241aaU, 0xbe0b1010U,
> +	0xc90c2086U, 0x5768b525U, 0x206f85b3U, 0xb966d409U, 0xce61e49fU,
> +	0x5edef90eU, 0x29d9c998U, 0xb0d09822U, 0xc7d7a8b4U, 0x59b33d17U,
> +	0x2eb40d81U, 0xb7bd5c3bU, 0xc0ba6cadU, 0xedb88320U, 0x9abfb3b6U,
> +	0x03b6e20cU, 0x74b1d29aU, 0xead54739U, 0x9dd277afU, 0x04db2615U,
> +	0x73dc1683U, 0xe3630b12U, 0x94643b84U, 0x0d6d6a3eU, 0x7a6a5aa8U,
> +	0xe40ecf0bU, 0x9309ff9dU, 0x0a00ae27U, 0x7d079eb1U, 0xf00f9344U,
> +	0x8708a3d2U, 0x1e01f268U, 0x6906c2feU, 0xf762575dU, 0x806567cbU,
> +	0x196c3671U, 0x6e6b06e7U, 0xfed41b76U, 0x89d32be0U, 0x10da7a5aU,
> +	0x67dd4accU, 0xf9b9df6fU, 0x8ebeeff9U, 0x17b7be43U, 0x60b08ed5U,
> +	0xd6d6a3e8U, 0xa1d1937eU, 0x38d8c2c4U, 0x4fdff252U, 0xd1bb67f1U,
> +	0xa6bc5767U, 0x3fb506ddU, 0x48b2364bU, 0xd80d2bdaU, 0xaf0a1b4cU,
> +	0x36034af6U, 0x41047a60U, 0xdf60efc3U, 0xa867df55U, 0x316e8eefU,
> +	0x4669be79U, 0xcb61b38cU, 0xbc66831aU, 0x256fd2a0U, 0x5268e236U,
> +	0xcc0c7795U, 0xbb0b4703U, 0x220216b9U, 0x5505262fU, 0xc5ba3bbeU,
> +	0xb2bd0b28U, 0x2bb45a92U, 0x5cb36a04U, 0xc2d7ffa7U, 0xb5d0cf31U,
> +	0x2cd99e8bU, 0x5bdeae1dU, 0x9b64c2b0U, 0xec63f226U, 0x756aa39cU,
> +	0x026d930aU, 0x9c0906a9U, 0xeb0e363fU, 0x72076785U, 0x05005713U,
> +	0x95bf4a82U, 0xe2b87a14U, 0x7bb12baeU, 0x0cb61b38U, 0x92d28e9bU,
> +	0xe5d5be0dU, 0x7cdcefb7U, 0x0bdbdf21U, 0x86d3d2d4U, 0xf1d4e242U,
> +	0x68ddb3f8U, 0x1fda836eU, 0x81be16cdU, 0xf6b9265bU, 0x6fb077e1U,
> +	0x18b74777U, 0x88085ae6U, 0xff0f6a70U, 0x66063bcaU, 0x11010b5cU,
> +	0x8f659effU, 0xf862ae69U, 0x616bffd3U, 0x166ccf45U, 0xa00ae278U,
> +	0xd70dd2eeU, 0x4e048354U, 0x3903b3c2U, 0xa7672661U, 0xd06016f7U,
> +	0x4969474dU, 0x3e6e77dbU, 0xaed16a4aU, 0xd9d65adcU, 0x40df0b66U,
> +	0x37d83bf0U, 0xa9bcae53U, 0xdebb9ec5U, 0x47b2cf7fU, 0x30b5ffe9U,
> +	0xbdbdf21cU, 0xcabac28aU, 0x53b39330U, 0x24b4a3a6U, 0xbad03605U,
> +	0xcdd70693U, 0x54de5729U, 0x23d967bfU, 0xb3667a2eU, 0xc4614ab8U,
> +	0x5d681b02U, 0x2a6f2b94U, 0xb40bbe37U, 0xc30c8ea1U, 0x5a05df1bU,
> +	0x2d02ef8dU
> +};
> diff --git a/scripts/gendwarfksyms/crc32.h b/scripts/gendwarfksyms/crc32.h
> new file mode 100644
> index 000000000000..89e4454b2a70
> --- /dev/null
> +++ b/scripts/gendwarfksyms/crc32.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Based on scripts/genksyms/genksyms.c, which has the following
> + * notice:
> + *
> + * Generate kernel symbol version hashes.
> + * Copyright 1996, 1997 Linux International.
> + *
> + * New implementation contributed by Richard Henderson <rth@tamu.edu>
> + * Based on original work by Bjorn Ekwall <bj0rn@blox.se>
> + *
> + * This file was part of the Linux modutils 2.4.22: moved back into the
> + * kernel sources by Rusty Russell/Kai Germaschewski.
> + */
> +
> +#ifndef __CRC32_H
> +#define __CRC32_H
> +
> +extern const unsigned int crctab32[];
> +
> +static inline unsigned long partial_crc32_one(unsigned char c,
> +					      unsigned long crc)
> +{
> +	return crctab32[(crc ^ c) & 0xff] ^ (crc >> 8);
> +}
> +
> +static inline unsigned long partial_crc32(const char *s, unsigned long crc)
> +{
> +	while (*s)
> +		crc = partial_crc32_one(*s++, crc);
> +	return crc;
> +}
> +
> +#endif /* __CRC32_H */

I think the CRC32 code should be ideally shared between genksyms and
gendwarfksyms. One option would be to stick it under scripts/include,
not sure if the best one though.

> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 62241cc97a76..677190ae18ef 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -693,18 +693,51 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
>  /*
>   * Exported symbol processing
>   */
> +static int get_symbol_cache(struct state *state, Dwarf_Die *die,
> +			    struct die **cache)
> +{
> +	checkp(symbol_set_die(state->sym, die));
> +	check(die_map_get(die, SYMBOL, cache));
> +
> +	if ((*cache)->state != INCOMPLETE)
> +		return 1; /* We already processed a symbol for this DIE */
> +
> +	(*cache)->tag = dwarf_tag(die);
> +	return 0;
> +}

Nit: The "get_" prefix in the name of this function is misleading. It
isn't a plain getter but has an effect of setting the symbol die.
A different name would be better.

> +
>  static int process_subprogram(struct state *state, Dwarf_Die *die)
>  {
> -	check(__process_subroutine_type(state, NULL, die, "subprogram"));
> -	state->sym->state = MAPPED;
> +	struct die *cache;
> +
> +	if (checkp(get_symbol_cache(state, die, &cache)) > 0)
> +		return 0;
> +
> +	debug("%s", state->sym->name);
> +	check(__process_subroutine_type(state, cache, die, "subprogram"));
> +	cache->state = SYMBOL;
> +
> +	if (dump_dies)
> +		fputs("\n", stderr);
> +
>  	return 0;
>  }
>  
>  static int process_variable(struct state *state, Dwarf_Die *die)
>  {
> -	check(process(state, NULL, "variable "));
> -	check(process_type_attr(state, NULL, die));
> -	state->sym->state = MAPPED;
> +	struct die *cache;
> +
> +	if (checkp(get_symbol_cache(state, die, &cache)) > 0)
> +		return 0;
> +
> +	debug("%s", state->sym->name);
> +	check(process(state, cache, "variable "));
> +	check(process_type_attr(state, cache, die));
> +	cache->state = SYMBOL;
> +
> +	if (dump_dies)
> +		fputs("\n", stderr);
> +
>  	return 0;
>  }
>  
> @@ -750,7 +783,6 @@ static int process_exported_symbols(struct state *state, struct die *cache,
>  		if (!is_export_symbol(state, die))
>  			return 0;
>  
> -		debug("%s", state->sym->name);
>  		state_init(state);
>  
>  		if (is_symbol_ptr(get_name(&state->die)))
> @@ -760,9 +792,6 @@ static int process_exported_symbols(struct state *state, struct die *cache,
>  		else
>  			check(process_variable(state, &state->die));
>  
> -		if (dump_dies)
> -			fputs("\n", stderr);
> -
>  		cache_clear_expanded(&state->expansion_cache);
>  		return 0;
>  	default:
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index 6a219a54c342..4a160d19d7df 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -22,6 +22,8 @@ bool dump_dies;
>  bool dump_die_map;
>  /* Print out type_map contents */
>  bool dump_types;
> +/* Print out expanded type strings used for version calculations */
> +bool dump_versions;
>  /* Produce a symtypes file */
>  bool symtypes;
>  static const char *symtypes_file;
> @@ -35,6 +37,7 @@ static const struct {
>  	{ "--dump-dies", &dump_dies, NULL },
>  	{ "--dump-die-map", &dump_die_map, NULL },
>  	{ "--dump-types", &dump_types, NULL },
> +	{ "--dump-versions", &dump_versions, NULL },
>  	{ "--symtypes", &symtypes, &symtypes_file },
>  };
>  
> @@ -109,9 +112,10 @@ static int process_modules(Dwfl_Module *mod, void **userdata, const char *name,
>  	} while (cu);
>  
>  	/*
> -	 * Use die_map to expand type strings and write them to `symfile`.
> +	 * Use die_map to expand type strings, write them to `symfile`, and
> +	 * calculate symbol versions.
>  	 */
> -	check(generate_symtypes(symfile));
> +	check(generate_symtypes_and_versions(symfile));
>  	die_map_free();
>  
>  	return DWARF_CB_OK;
> @@ -187,5 +191,7 @@ int main(int argc, const char **argv)
>  	if (symfile)
>  		fclose(symfile);
>  
> +	symbol_print_versions();
> +
>  	return 0;
>  }
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index 6edbd6478e0f..f85e080a8634 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -23,6 +23,7 @@ extern bool debug;
>  extern bool dump_dies;
>  extern bool dump_die_map;
>  extern bool dump_types;
> +extern bool dump_versions;
>  extern bool symtypes;
>  
>  #define MAX_INPUT_FILES 128
> @@ -95,7 +96,7 @@ extern bool symtypes;
>  #define SYMBOL_DECLONLY_PREFIX "__gendwarfksyms_declonly_"
>  #define SYMBOL_DECLONLY_PREFIX_LEN (sizeof(SYMBOL_DECLONLY_PREFIX) - 1)
>  
> -enum symbol_state { UNPROCESSED, MAPPED };
> +enum symbol_state { UNPROCESSED, MAPPED, PROCESSED };
>  
>  struct symbol_addr {
>  	uint32_t section;
> @@ -119,18 +120,25 @@ struct symbol {
>  	struct hlist_node name_hash;
>  	enum symbol_state state;
>  	uintptr_t die_addr;
> +	unsigned long crc;
>  };
>  
> +typedef int (*symbol_callback_t)(struct symbol *, void *arg);
> +
>  extern bool is_symbol_ptr(const char *name);
>  extern int symbol_read_exports(FILE *file);
>  extern int symbol_read_symtab(int fd);
>  extern struct symbol *symbol_get_unprocessed(const char *name);
> +extern int symbol_set_die(struct symbol *sym, Dwarf_Die *die);
> +extern int symbol_set_crc(struct symbol *sym, unsigned long crc);
> +extern int symbol_for_each(symbol_callback_t func, void *arg);
> +extern void symbol_print_versions(void);
>  
>  /*
>   * die.c
>   */
>  
> -enum die_state { INCOMPLETE, UNEXPANDED, COMPLETE, LAST = COMPLETE };
> +enum die_state { INCOMPLETE, UNEXPANDED, COMPLETE, SYMBOL, LAST = SYMBOL };
>  enum die_fragment_type { EMPTY, STRING, LINEBREAK, DIE };
>  
>  struct die_fragment {
> @@ -154,6 +162,7 @@ static inline const char *die_state_name(enum die_state state)
>  	CASE_CONST_TO_STR(INCOMPLETE)
>  	CASE_CONST_TO_STR(UNEXPANDED)
>  	CASE_CONST_TO_STR(COMPLETE)
> +	CASE_CONST_TO_STR(SYMBOL)
>  	}
>  }
>  
> @@ -239,6 +248,6 @@ extern int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie);
>   * types.c
>   */
>  
> -extern int generate_symtypes(FILE *file);
> +extern int generate_symtypes_and_versions(FILE *file);
>  
>  #endif /* __GENDWARFKSYMS_H */
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> index 8cc04e6295a7..c9889cfa89c4 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -84,6 +84,38 @@ static int for_each(const char *name, bool name_only, symbol_callback_t func,
>  	return 0;
>  }
>  
> +static int set_crc(struct symbol *sym, void *data)
> +{
> +	unsigned long *crc = data;
> +
> +	if (sym->state == PROCESSED && sym->crc != *crc)
> +		warn("overriding version for symbol %s (crc %lx vs. %lx)",
> +		     sym->name, sym->crc, *crc);
> +
> +	sym->state = PROCESSED;
> +	sym->crc = *crc;
> +	return 0;
> +}
> +
> +int symbol_set_crc(struct symbol *sym, unsigned long crc)
> +{
> +	if (checkp(for_each(sym->name, false, set_crc, &crc)) > 0)
> +		return 0;
> +	return -1;
> +}
> +
> +static int set_die(struct symbol *sym, void *data)
> +{
> +	sym->die_addr = (uintptr_t)((Dwarf_Die *)data)->addr;
> +	sym->state = MAPPED;
> +	return 0;
> +}
> +
> +int symbol_set_die(struct symbol *sym, Dwarf_Die *die)
> +{
> +	return checkp(for_each(sym->name, false, set_die, die));
> +}
> +
>  static bool is_exported(const char *name)
>  {
>  	return checkp(for_each(name, true, NULL, NULL)) > 0;
> @@ -151,6 +183,19 @@ struct symbol *symbol_get_unprocessed(const char *name)
>  	return sym;
>  }
>  
> +int symbol_for_each(symbol_callback_t func, void *arg)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *sym;
> +	int i;
> +
> +	hash_for_each_safe(symbol_names, i, tmp, sym, name_hash) {
> +		check(func(sym, arg));
> +	}
> +
> +	return 0;
> +}
> +
>  typedef int (*elf_symbol_callback_t)(const char *name, GElf_Sym *sym,
>  				     Elf32_Word xndx, void *arg);
>  
> @@ -264,3 +309,23 @@ int symbol_read_symtab(int fd)
>  {
>  	return elf_for_each_symbol(fd, process_symbol, NULL);
>  }
> +
> +void symbol_print_versions(void)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *sym;
> +	int i;
> +
> +	hash_for_each_safe(symbol_names, i, tmp, sym, name_hash) {
> +		if (sym->state != PROCESSED)
> +			warn("no information for symbol %s", sym->name);
> +
> +		printf("#SYMVER %s 0x%08lx\n", sym->name, sym->crc);
> +
> +		free((void *)sym->name);

Nit: This cast removes constness. Is there a good reason why symbol.name
is 'const char *' instead of 'char *'?

The name of the function is also somewhat misleading. One would expect
that the function prints versions for all symbols, yet it has
a side-effect of freeing all symbol data. A different name or splitting
the function into two would be better.

> +		free(sym);
> +	}
> +
> +	hash_init(symbol_addrs);
> +	hash_init(symbol_names);
> +}
> diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
> index 7b9997d8322d..6411b1279a28 100644
> --- a/scripts/gendwarfksyms/types.c
> +++ b/scripts/gendwarfksyms/types.c
> @@ -228,6 +228,34 @@ static void type_map_free(void)
>  	hash_init(type_map);
>  }
>  
> +/*
> + * CRC for a type, with an optional fully expanded type string for
> + * debugging.
> + */
> +struct version {
> +	struct type_expansion type;
> +	unsigned long crc;
> +};
> +
> +static int version_init(struct version *version)
> +{
> +	version->crc = 0xffffffff;
> +	return check(type_expansion_init(&version->type, dump_versions));
> +}
> +
> +static void version_free(struct version *version)
> +{
> +	type_expansion_free(&version->type);
> +}
> +
> +static int version_add(struct version *version, const char *s)
> +{
> +	version->crc = partial_crc32(s, version->crc);
> +	if (dump_versions)
> +		checkp(type_expansion_append(&version->type, s, NULL));
> +	return 0;
> +}
> +
>  /*
>   * Type reference format: <prefix>#<name>, where prefix:
>   * 	s -> structure
> @@ -271,7 +299,7 @@ static char *get_type_name(struct die *cache)
>  		warn("found incomplete cache entry: %p", cache);
>  		return NULL;
>  	}
> -	if (!cache->fqn)
> +	if (cache->state == SYMBOL || !cache->fqn)
>  		return NULL;
>  
>  	prefix = get_type_prefix(cache->tag);
> @@ -305,6 +333,45 @@ static char *get_type_name(struct die *cache)
>  	return name;
>  }
>  
> +static int __calculate_version(struct version *version, struct type_list *list)
> +{
> +	struct type_expansion *e;
> +
> +	/* Calculate a CRC over an expanded type string */
> +	while (list) {
> +		if (is_type_prefix(list->str)) {
> +			check(type_map_get(list->str, &e));
> +
> +			/*
> +			 * It's sufficient to expand each type reference just
> +			 * once to detect changes.
> +			 */
> +			if (cache_was_expanded(&expansion_cache, e)) {
> +				check(version_add(version, list->str));
> +			} else {
> +				check(cache_mark_expanded(&expansion_cache, e));
> +				check(__calculate_version(version,
> +							  e->expanded));
> +			}
> +		} else {
> +			check(version_add(version, list->str));
> +		}
> +
> +		list = list->next;
> +	}
> +
> +	return 0;
> +}
> +
> +static int calculate_version(struct version *version, const char *name,
> +			     struct type_list *list)
> +{
> +	check(version_init(version));
> +	check(__calculate_version(version, list));
> +	cache_clear_expanded(&expansion_cache);
> +	return 0;
> +}

Nit: The name parameter is unused.

More importantly, it made me think which names are included in the CRC
calculation and which ones are omitted.

If I'm looking correctly, names of structs, enums and enumerators make
it into the calculation. On the other hand, names of struct members,
function parameters and exports (functions/variables) are missing.

I think the names of struct members and function parameters should be
added as well. If the code changes 'struct A { int cols; int rows; }' to
'struct A { int rows; int cols; }' then that should be recognized as
a different API/ABI. The same applies to function parameters.

I'm not sure about export names. I would probably include them as well,
if only for consistency.

Genksyms incorporates in its calculation all of these names.

> +
>  static int __type_expand(struct die *cache, struct type_expansion *type,
>  			 bool recursive);
>  
> @@ -411,7 +478,51 @@ static int expand_type(struct die *cache, void *arg)
>  	return 0;
>  }
>  
> -int generate_symtypes(FILE *file)
> +static int expand_symbol(struct symbol *sym, void *arg)
> +{
> +	struct type_expansion type;
> +	struct version version;
> +	struct die *cache;
> +
> +	/*
> +	 * No need to expand again unless we want a symtypes file entry
> +	 * for the symbol. Note that this means `sym` has the same address
> +	 * as another symbol that was already processed.
> +	 */
> +	if (!symtypes && sym->state == PROCESSED)
> +		return 0;
> +
> +	if (__die_map_get(sym->die_addr, SYMBOL, &cache))
> +		return 0; /* We'll warn about missing CRCs later. */
> +
> +	check(type_expand(cache, &type, false));
> +
> +	/* If the symbol already has a version, don't calculate it again. */
> +	if (sym->state != PROCESSED) {
> +		check(calculate_version(&version, sym->name, type.expanded));
> +		check(symbol_set_crc(sym, version.crc));
> +		debug("%s = %lx", sym->name, version.crc);
> +
> +		if (dump_versions) {
> +			fputs(sym->name, stderr);
> +			fputs(" ", stderr);
> +			type_list_write(version.type.expanded, stderr);
> +			fputs("\n", stderr);
> +		}
> +
> +		version_free(&version);
> +	}
> +
> +	/* These aren't needed in type_map unless we want a symtypes file. */
> +	if (symtypes)
> +		check(type_map_add(sym->name, &type));
> +
> +	type_expansion_free(&type);
> +
> +	return 0;
> +}
> +
> +int generate_symtypes_and_versions(FILE *file)
>  {
>  	hash_init(expansion_cache.cache);
>  
> @@ -429,7 +540,14 @@ int generate_symtypes(FILE *file)
>  	check(die_map_for_each(expand_type, NULL));
>  
>  	/*
> -	 *   2. If a symtypes file is requested, write type_map contents to
> +	 *   2. For each exported symbol, expand the die_cache type, and use
> +	 *      type_map expansions to calculate a symbol version from the
> +	 *      fully expanded type string.
> +	 */
> +	check(symbol_for_each(expand_symbol, NULL));
> +
> +	/*
> +	 *   3. If a symtypes file is requested, write type_map contents to
>  	 *      the file.
>  	 */
>  	check(type_map_write(file));

-- 
Thanks,
Petr

