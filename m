Return-Path: <linux-kbuild+bounces-2460-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 258BC92CBEF
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 09:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C670F28116E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 07:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0D082D9A;
	Wed, 10 Jul 2024 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dJCiLAhd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E998482CD
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2024 07:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720596655; cv=none; b=OKb8XQzerp+KT1JSXRBkk0XuV35ECclQYEI6lT0YmeaKRNIXmM4bBKpTOVWUcC3tb5QaFkC0udKnhkfNp/Ya3ExdeBFMYUWdqibb79ObVaFhLLGl6zxpYKjOP1GzDMrzgF+0IrmFeImE0dtb2ZSlKL9+ENqVjJwU8HtoIy0lfo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720596655; c=relaxed/simple;
	bh=bg11X0+ouhSXutIZH+FX0laaIoy8Fd6IAGYyDkPoOmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k64jSzPUWKrCUXdk8UpQBMo8V+nt2BOXwMoMQGrk9+P1xuKXDDutyhX4Yb3o8vPqzTLtdS1UqJ42SsOxcw7n/u32nQY0issN/x3iIulnJeczyAtAl8TsvHSDTLbiaQZoUAcQPXQWyAJ2so22SvE1hCNfvKRdn48pcJ6Sqn+zViI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dJCiLAhd; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7523f0870cso741987066b.3
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2024 00:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720596652; x=1721201452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BE/oQZmZGmjJjHSOCOGHNHHe0sV17vr1YpR/41Jzb5g=;
        b=dJCiLAhd/2MRdbJWp59ir8VhnLVuK+eiZYL4Bb/vRADJi74iKHszneGBh0sliGvTxr
         K/SJ72GSlzwYqH6wc4kUgVjYptXtWBsPcKHzWasteD4RPNaloPxQJvVrZ/oHyzNv5fm5
         Ysq7+aQbcwtE2r0EhoQKmv+nb/OFGTohmFkk+MemWnsiwzyJeuBAUPsGpKsqXM5hOqyv
         mFzLh/K+v/dMAn2MV2W7vtQw2HgZMa0DKphGC3pTuAlL+lo8UL67TblHD2BBHlQrmdcI
         4//b90OGCk0KZUbbPIdpi91EWjNDLqXedO5Vpv8klLofrYYemNMTd19Nbn2M/Oz/oMkj
         V7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720596652; x=1721201452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BE/oQZmZGmjJjHSOCOGHNHHe0sV17vr1YpR/41Jzb5g=;
        b=bdydpiRqq+WYX+T3jd1fOZdTQbvI3X7AcLAWOTsBYHcLbcvKKA8a1Zav+n2AhNn8l1
         d4hqeXMWKPcIAUq8bhWcXXi6P6kZSgv5uuUuiICQMgWw/zi/FmtPbU6P0+g0v4sdIHXM
         NoFRVZo0YMEqwgfALvqBniSZRyqZ5HliyTxVg9G7cG1Y0R2gsWtdTcU1cWPxoYC1KId3
         cOLNWA9UtorizXBZ8f/dOLyBtMQhBjLqm7WYO0JUYfglGyPTwKX5wJlbkel8d9YHMkCu
         Vi7fUJM2qd4ImdRpRAAR334AO4A3QymM40VEkjEd3L6BLtX5vOhAQzOTK0nfS8Q1lZ2D
         OuFA==
X-Forwarded-Encrypted: i=1; AJvYcCWea/cnVYo4f0thLtCss5DXjN+/7lZo/pYNotV46GQL2zOIWeqQ8iGI+u2aHlBGhk8KTgFD/AZpxFj+KcyJ3S6qtR5eMzCmn0KROG8N
X-Gm-Message-State: AOJu0YxyLJFjPN2Agp0lyC87xUUU+2xRpunV0JNNFuAO0LfNpMGbkA1G
	8BoUnWNO2drDPCjywBGOzH66O/mQ9c+KRg3xaIqMSanzAQQRKHiwDZzyMNSLIr0=
X-Google-Smtp-Source: AGHT+IFC1z/bjrfqmHUH7re49LUgUD3hZ7k7PnkWdvTpsNEn2b9WWeiNWttRMRVU89UAnO150KlFSA==
X-Received: by 2002:a17:907:2da1:b0:a71:ddb8:9394 with SMTP id a640c23a62f3a-a780b6fe3e7mr424621466b.40.1720596651593;
        Wed, 10 Jul 2024 00:30:51 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a871f2fsm135117366b.202.2024.07.10.00.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 00:30:51 -0700 (PDT)
Message-ID: <0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com>
Date: Wed, 10 Jul 2024 09:30:49 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
Content-Language: en-US
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240617175818.58219-17-samitolvanen@google.com>
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/24 19:58, Sami Tolvanen wrote:
> Hi folks,
> 
> This series implements CONFIG_MODVERSIONS for Rust, an important
> feature for distributions like Android that want to ship Rust
> kernel modules, and depend on modversions to help ensure module ABI
> compatibility.

Thanks for working on this. Below is some feedback with my (open)SUSE
hat on, although it should be quite general.

> There have been earlier proposals [1][2] that would allow Rust
> modules to coexist with modversions, but none that actually implement
> symbol versioning. Unlike C, Rust source code doesn't have sufficient
> information about the final ABI, as the compiler has considerable
> freedom in adjusting structure layout for improved performance [3],
> for example, which makes using a source code parser like genksyms
> a non-starter. Based on Matt's suggestion and previous feedback
> from maintainers, this series uses DWARF debugging information for
> computing versions. DWARF is an established and relatively stable
> format, which includes all the necessary ABI details, and adding a
> CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> reasonable trade-off.

Using the DWARF data makes sense to me. Distribution kernels are
normally built with debuginfo because one has to be able to debug them
later, unsurprisingly. Besides that, one now typically wants to use BPF
together with built-in BTF data (CONFIG_DEBUG_INFO_BTF), which also
requires building the kernel with debuginfo.

I would however keep in mind that producing all DWARF data has some
cost. From a quick test, an x86_64-defconfig build is ~30% slower for me
with CONFIG_DEBUG_INFO=y. The current genksyms tool allows to have
debuginfo disabled when backporting some patches and consequently have
a quicker feedback whether modversions changed. This option would
disappear with gendwarfksyms but I think it is acceptable.

> 
> The first 12 patches of this series add a small tool for computing
> symbol versions from DWARF, called gendwarfksyms. When passed a list
> of exported symbols, the tool generates an expanded type string
> for each symbol, and computes symbol CRCs similarly to genksyms.
> gendwarfksyms is written in C and uses libdw to process DWARF, mainly
> because of the existing support for C host tools that use elfutils
> (e.g., objtool).

In addition to calculating CRCs of exported symbols, genksyms has other
features which I think are important.

Firstly, the genksyms tool has a human-readable storage format for input
data used in the calculation of symbol CRCs. Setting the make variable
KBUILD_SYMTYPES enables dumping this data and storing it in *.symtypes
files.

When a developer later modifies the kernel and wants to check if some
symbols have changed, they can take these files and feed them as
*.symref back to genksyms. This allows the tool to provide an actual
reason why some symbols have changed, instead of just printing that
their CRCs are different.

Is there any plan to add the same functionality to gendwarfksyms, or do
you envison that people will use libabigail, Symbol-Type Graph, or
another tool for making this type of comparison?

Secondly, when distributions want to maintain stable kABI, they need to
be able to deal with patch backports that add new members to structures.
One common approach is to have placeholders in important structures
which can be later replaced by the new members as needed. __GENKSYMS__
ifdefs are then used at the C source level to hide these kABI-compatible
changes from genksyms.

Gendwarfksyms works on the resulting binary and so using such ifdefs
wouldn't work. Instead, I suspect that what is required is a mechanism
to tell the tool that a given change is ok, probably by allowing to
specify some map from the original definition to the new one.

Is there a plan to implement something like this, or how could it be
addressed?

> Another compatibility issue is fitting the extremely long mangled
> Rust symbol names into struct modversion_info, which can only hold
> 55-character names (on 64-bit systems). Previous proposals suggested
> changing the structure to support longer names, but the conclusion was
> that we cannot break userspace tools that parse the version table.
> 
> The next two patches of the series implement support for hashed
> symbol names in struct modversion_info, where names longer than 55
> characters are hashed, and the hash is stored in the name field. To
> avoid breaking userspace tools, the binary hash is prefixed with a
> null-terminated string containing the name of the hash function. While
> userspace tools can later be updated to potentially produce more
> useful information about the long symbols, this allows them to
> continue working in the meantime.

I think this approach with hashed names is quite complex. I'd personally
be also in favor of having a new section with variable-length strings to
store the names of imported symbols. As yet another alternative, it
should be also possible to refer directly into .symtab/.strtab to avoid
duplicating the names, but I suspect it would be non-trivial to
implement.

Cheers,
Petr

