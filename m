Return-Path: <linux-kbuild+bounces-3811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494298737B
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 14:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36618283B80
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 12:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9C0176FA5;
	Thu, 26 Sep 2024 12:22:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243C51714BD;
	Thu, 26 Sep 2024 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353364; cv=none; b=X2x0wFuHtx6g0UvHm7Z+qrtMmrNSBoemSJA06jXuWp5Ps0zIpis/Bnyj6qKrbMn0k0wSy2CDRK3wOyHehomxiG228zvc0MnhC+JQae7vPJ7keanzWE3Wo7AhvPPQH5H2jc1h0FODCdQaE7uYx8sWbHk7C6xPPx7eiFGZv51HXkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353364; c=relaxed/simple;
	bh=YZzBmMO9bp4raxlf9pje1ASVpTpnjxF5iuLUpm5tYIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFvy+uSn2o5+9a/ns7gWs0pZgHDB1ilrJzK1/bjVKFxMjDdeNNvUghvh1iyV6DTzBT9OWD0WY7oEyrsmoSzEIJNR0/cqRarqFWXv3EEeBHywzlUqExdWtMTUz/Loxdj5ydjUFrt7QHkqUhjsvrFkAb/fgFHKaqeXi5LnmnhskDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XDt5q71Kdz9sSL;
	Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeWZDw47vw6L; Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XDt5q5zDDz9sRy;
	Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B71BE8B76E;
	Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cW2IzJlvTqAb; Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 63CB08B763;
	Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
Message-ID: <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
Date: Thu, 26 Sep 2024 14:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Matthew Maurer <mmaurer@google.com>, masahiroy@kernel.org,
 ndesaulniers@google.com, ojeda@kernel.org, gary@garyguo.net,
 mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Alex Gaynor <alex.gaynor@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st,
 j@jannau.net, asahi@lists.linux.dev, linux-modules@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240925233854.90072-15-mmaurer@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 26/09/2024 à 01:38, Matthew Maurer a écrit :
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
> 
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format. Other architectures do not appear to
> have architecture-specific usage of this information.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>   arch/powerpc/kernel/module_64.c | 23 ++++++++-
>   kernel/module/internal.h        | 11 ++++
>   kernel/module/main.c            | 92 ++++++++++++++++++++++++++++++---
>   kernel/module/version.c         | 45 ++++++++++++++++
>   4 files changed, 161 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index e9bab599d0c2..4e7b156dd8b2 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -355,6 +355,23 @@ static void dedotify_versions(struct modversion_info *vers,
>   		}
>   }
>   
> +static void dedotify_ext_version_names(char *str_seq, unsigned long size)
> +{
> +	unsigned long out = 0;
> +	unsigned long in;
> +	char last = '\0';
> +
> +	for (in = 0; in < size; in++) {
> +		/* Skip one leading dot */
> +		if (last == '\0' && str_seq[in] == '.')
> +			in++;
> +		last = str_seq[in];
> +		str_seq[out++] = last;
> +	}

Why do you need a loop here ?

Can't you just do something like:

	if (str_seq[0] == '.')
		memmove(str_seq, str_seq + 1, size);


> +	/* Zero the trailing portion of the names table for robustness */
> +	memset(&str_seq[out], 0, size - out);

This seems unneeded.

> +}
> +
>   /*
>    * Undefined symbols which refer to .funcname, hack to funcname. Make .TOC.
>    * seem to be defined (value set later).



Christophe

