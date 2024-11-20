Return-Path: <linux-kbuild+bounces-4761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 406E19D43AD
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 22:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D16831F20614
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 21:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D07A1C304F;
	Wed, 20 Nov 2024 21:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C4Y0f/gF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD65C16DEB5
	for <linux-kbuild@vger.kernel.org>; Wed, 20 Nov 2024 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732139705; cv=none; b=lrTuQD9Egtfm0WCiUnp7g1zeqwNZ7WWxCirOjM7Ia5K1qrlDglVd0CJ6X7MIPKkE99WKzKf34TkM0j+UfjqRgH5Q5dOo354yMKzxNsduQ7e/U0y45ITBG1/xANQ5jJgzWKNez1ZdnOtD7B2MiKP1hS5dIB+lamoiRHyVdzoLuKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732139705; c=relaxed/simple;
	bh=p/2HQRb8DSnOeN4sdRAF0ATMaB8otlVUnnqv1o1FzGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEZ9IjzfgFd5NFxui/fc5/Jb2Tsu6znv0Yo6mcvx9/EkNoXLWbYH/Hp56INM6wlxMNCcEEr0qprGzhS6qx/9kT5nak2H/eCVhBv2/oM37xuqr2/FLivBlMjBHB6NmyyJVUdVU4fNZoAlVAZvNjNMYIFPeQWcSCRGQUat2HjsEms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C4Y0f/gF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-211f1a46f7fso42065ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Nov 2024 13:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732139702; x=1732744502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KJuMd+zGRgDKZ9hMGh3NL+Uf9ATMzUJl+LIc+tHuySg=;
        b=C4Y0f/gFqtdzQqNOxa9+YQDrWocL074QKpC6V0Xo4T4sVirP5UJyUolbJXhtl2KcoB
         mvCoVYzQFhflAHmHgqnKqFUrwV1TkjnNwb4ywWFTAAsWQvqQeM6ETxtn7bG/NJgkZg52
         dVZlRHGWKXntAcd6YXUsBH6TmfzJONqtSBaXS9eC+oGpUaFI3VmuO9r3E/FS6Z2T2Yct
         hNKS/XOwneUIzbnC8/typZKVL3XliTMPo2qAxr8zNHzP2fYQ4JkOGaVE82nk5/H+t4Ou
         uAjaH/iva7OEaRPpbPX342xMr0r9FB+dv4jgjdfGW0bXM7d/knDrHr5Zyho4xrECMY4K
         wEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732139702; x=1732744502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJuMd+zGRgDKZ9hMGh3NL+Uf9ATMzUJl+LIc+tHuySg=;
        b=BqSr6JRJn/wYU5BtCZNQAhf8skW0R1ETLWFNaoG+4ljTRhkn7BYHIg6jm4COBSIw9b
         wXzUtjO6rah6/lJ3IW/jjv8R3ZOtq7XHToBoIRSRbZnGXQVdBCUkNcQf2M848gGNd6D9
         6hviVwhNoyzh0i5ahoxFUP8F8fyioL/bqjz4n2N89SH7CrQFdFFUVfzxaExEyPO+PvUN
         XBWKCQrJjl+/b8/DPGJlx4buXEFzRQF+dNuhU7PSJ1HX/iEaBe4IBqgAi8g98xPa8n5B
         A9n2G0Q15BDZAuskASoQIuHz9luQgvLTKVKbmmn+VrLKg+tWaNLiLppuMtWr1tybNsFZ
         0W1w==
X-Forwarded-Encrypted: i=1; AJvYcCVfz+AuRiEu3OIDOT7fZ3Ywq2P+ian80EzfU1KOVCNfdaW+HiHT3D0l3ich0WqZqinGNOde28lqPJTq9go=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGG3/eMt6jmRISfAtfnElPk/FXYTbb35kFwH+c9kb9tRtfa4Wu
	t0LaxqHW9J0uf2+8KWS4cZGDs7Po9T0oflkbziNcBl9MiO52HyEMOMxci/jHFQ==
X-Gm-Gg: ASbGncuMm95xotTcPG73AuCnwIgCjIqfBqg77TQlTu+7Cv5zgjVY/EESeHjW7XEYik2
	UQgynq4OgSNIv2eklso8Tlq3coZDGCRWiBZoIFVWzhT5d8nXaMtZ7VUVrIaolpCzNpxw2iAe9PC
	rLKtA6tZKzCLM2+dwfP5oSHILVWaT8Nnp1h2tTYcTVtzme+MwLRTiq8wMdT5TO6BoT/0KRtvI/j
	5VpFhb5B9PFeGdoRNyHw7wDoKmLrPHDwRd47570rFk86IHx48U8Sc0IoaiXxhwSWdU27m0/XGmW
	kynWFvTp7kgMARk=
X-Google-Smtp-Source: AGHT+IGKc9ZvPmJIK0nWwQcxR6PLarmpQvpHzkZoZJMXfvRSrnEfA5c5NwlyeWO3fgYs+0aWUjKJ0w==
X-Received: by 2002:a17:903:178f:b0:1f7:34e4:ebc1 with SMTP id d9443c01a7336-212878a076cmr162705ad.5.1732139701962;
        Wed, 20 Nov 2024 13:55:01 -0800 (PST)
Received: from google.com (77.62.105.34.bc.googleusercontent.com. [34.105.62.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212880d16d4sm271285ad.167.2024.11.20.13.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 13:55:01 -0800 (PST)
Date: Wed, 20 Nov 2024 21:54:54 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Miroslav Benes <mbenes@suse.cz>,
	Asahi Linux <asahi@lists.linux.dev>,
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 10/19] gendwarfksyms: Limit structure expansion
Message-ID: <20241120215454.GA3512979@google.com>
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-31-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030170106.1501763-31-samitolvanen@google.com>

On Wed, Oct 30, 2024 at 05:01:17PM +0000, Sami Tolvanen wrote:
> 
> For pointers, limit structure expansion after the first pointer
> in the symbol type. This should be plenty for detecting ABI
> differences, but it stops us from pulling in half the kernel for
> types that contain pointers to large kernel data structures, like
> task_struct, for example.

We spent some time backtesting gendwarfksyms with android15-6.6
releases to validate the kABI stability options that are currently
implemented [1]. While we discovered a few missing knobs that are
needed, we also realized that pointer expansion limits don't work
when symbols are removed (which is possible without breaking the
existing ABI when TRIM_UNUSED_KSYMS is used), as the processing
cut-off can change. Petr also had some concerns about this earlier,
so instead of coming up with an alternative solution, I'm going to
drop the pointer expansion limit in v6.

I still think that it would be great to come up with a better way to
limit how deep into internal data structures we go when calculating
versions, but I suspect that's going to be challenging unless C
grows an annotation for public / private struct members.

While looking into another version stability issue compared to
genksyms, we also came to the conclusion that private structure
definitions in .c files should be excluded from processing as they
are opaque outside the CU and cannot change the ABI. I'll include
this in v6 as well.

[1] https://github.com/samitolvanen/linux/commits/android15-6.6-2024-11-gendwarfksyms/

Sami

