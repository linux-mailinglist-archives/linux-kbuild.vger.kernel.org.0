Return-Path: <linux-kbuild+bounces-3786-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C298694F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1488B1F25C99
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78B415E5B5;
	Wed, 25 Sep 2024 23:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="29nt4hJE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F02815B12F
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727305210; cv=none; b=CRT2i4Of/Wnxik9xGyv9zTXUsq9IFCsYg/iIF92ePh6PwJv/3EV7vCtdfIVyFJRazHjKsGfSYY71Zx9uC3cPIlVrvGy5d8FUcINwjTY4TqmrHWVYy3iFLH/xW9xPyFV4pty6OSjLwVBWW+Se+EgmxNk6SYj0ib1viAV54ufws0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727305210; c=relaxed/simple;
	bh=kQStd7Sr/RrN6skcJm3qMMqtRvr2awicCI5PoWvm6FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTVoY/gQn/icMvrZGwGSvNoZukeBuyEq3rj8JY/mCYLZghKCOjqJfUnYxXu9r4lSWgyllouaH9qlmPl2jtr471+fIX5PVmuYiE2q9kZPDFP5QroMtCLDIbHdGfNKIMk4jryXS1L0Zu+j3CSxUd/SrPw7gvaUiXc7oullJrxZLW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=29nt4hJE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b061b7299so38515ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727305208; x=1727910008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl8E5j+ZmDbmKOpu44SNpmShgOamIMtl/ODRrZ2cGY4=;
        b=29nt4hJEop4cT1EF7+YIld9Adj1JmwYoqyAlZXhfyudbc3WiqblPgu5HQgfBnl5LN1
         QJhsGyhyENQPB1oerj41iyQpQ2C1TqhJnNjbfej3UU+hKP/eetU4pRB+pk8jG2VNNJFe
         m0990I/pQuXhKMHseZuH8g4ua072woMTAVKBd9ECitCemrycuWzRLivuLuJdTkeVcadq
         /8LNPJHFUZGxKB948pAHh7rZ4z0UQ77yvyLs3T1c8Quw+YklluZ8BIzubbLrwBWV4rMU
         QtFzmooPTI7MRyELw6EJ1zD106PweHJCi5DCGXDIAGOQGyjqXRmYerd15NIM8D1CmeNB
         78wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727305208; x=1727910008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vl8E5j+ZmDbmKOpu44SNpmShgOamIMtl/ODRrZ2cGY4=;
        b=Nt/Q8PBp1JiPi5524fIh5IpF5X9B7yLuX6VHZgxRgwWdXAtntmTdT+6pp0KSzU775n
         3JopeH5m/Gavn3JtxzqjfjpX4FMADZZdp68EkNZRskJ677UcLpw1piFu4v7mU/3KreWH
         3u9L1fj/hV430m3EcbKnhD8WmEKAbhzXZPZH4cw+MTodKx25O71IlbDIo6SMFpIWgz8S
         XSuxbaFSaPwvOkW7hXI9fLijHHIrf9WNVyvUGG3UBsu55zPrubd7DAdHh3Qig4qAmMBm
         8ADDihE83Hm2C638I2MGQ08MtC/eRBgOERbqnETYWnKa+v3HVg2vjvaokwg4hAeYzqOi
         TSag==
X-Forwarded-Encrypted: i=1; AJvYcCUBSxUjXxg//Te+D9VXOKd2OIUCSUA0gb1OsvTrhI00suh+28QSSh1IVsa3EJ8+8uJQq4wULm2/MrCeCzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEwaDpxbwiGfZ8IyqlturKmDGotvmnfkXHCnhrE0v1VaS/wC+3
	TnLszDKkS6/KGfUuAVjzAIHvT9kicpZWez9gSMrXt6VmdO+H6Tor4UoIHnpt2w==
X-Google-Smtp-Source: AGHT+IFG1pBJvk67WuIMPqXmbr6qCgX/nanvp1+Hex9+YWAbxaQzu9KQp5bWrdANVwkkvt84iFfWmg==
X-Received: by 2002:a17:902:ec83:b0:206:a87c:2873 with SMTP id d9443c01a7336-20b202f1655mr563355ad.5.1727305208163;
        Wed, 25 Sep 2024 16:00:08 -0700 (PDT)
Received: from google.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc8493cdsm3190227b3a.88.2024.09.25.16.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:00:07 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:00:00 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, mcgrof@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH v4 14/16] modules: Support extended MODVERSIONS info
Message-ID: <20240925230000.GA3176650@google.com>
References: <20240924212024.540574-1-mmaurer@google.com>
 <20240924212024.540574-15-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924212024.540574-15-mmaurer@google.com>

Hi Matt,

On Tue, Sep 24, 2024 at 09:19:56PM +0000, Matthew Maurer wrote:
> +static void dedotify_ext_version_names(char *str_seq, unsigned long size)
> +{
> +	unsigned long out = 0;
> +	unsigned long in;
> +	char last = '\0';
> +
> +	for (in = 0; in < size; in++) {
> +		if (last == '\0')
> +			/* Skip one leading dot */
> +			if (str_seq[in] == '.')
> +				in++;

Thanks for addressing Michael's comment, this looks correct to me.

Nit: might be cleaner in a single if statement though:

	/* Skip one leading dot */
	if (last == '\0' && str_seq[in] == '.')
		in++;

> +void modversion_ext_start(const struct load_info *info,
> +			  struct modversion_info_ext *start)
> +{
> +	unsigned int crc_idx = info->index.vers_ext_crc;
> +	unsigned int name_idx = info->index.vers_ext_name;
> +	Elf_Shdr *sechdrs = info->sechdrs;
> +
> +	/*
> +	 * Both of these fields are needed for this to be useful
> +	 * Any future fields should be initialized to NULL if absent.
> +	 */
> +	if ((crc_idx == 0) || (name_idx == 0))
> +		start->remaining = 0;
> +
> +	start->crc = (const s32 *)sechdrs[crc_idx].sh_addr;
> +	start->name = (const char *)sechdrs[name_idx].sh_addr;
> +	start->remaining = sechdrs[crc_idx].sh_size / sizeof(*start->crc);
> +}

This looks unchanged from v3, so I think my comment from there
still applies:

https://lore.kernel.org/lkml/CABCJKufJK0WO92wnW09VTLqZk0ODxhuKQG=HbKE-va0urJU1Vg@mail.gmail.com/

Sami

