Return-Path: <linux-kbuild+bounces-3293-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5079D965D06
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Aug 2024 11:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7523B1C23E6D
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Aug 2024 09:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331E4175D30;
	Fri, 30 Aug 2024 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hgWMtuhL";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="UY/Ua2wp";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hgWMtuhL";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="UY/Ua2wp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F4B16D9AA;
	Fri, 30 Aug 2024 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725010460; cv=none; b=tUaX46L1E3IEZ8MQN2TOFY+b0OSzVZsrDOD9bGKgedGmJ7lq6x2Ym2Uy0voNAttvHH7yIGPX1+Z10V25Css0QH7dZyyvei4/95D8hwPNzsGP6BnqRkVbQ5dLEfz6JRIJ+1vI+wIzc7IUAmHpDdlpl6K5ek6rG9I8FbpSu/WYfp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725010460; c=relaxed/simple;
	bh=5xzxu4uvuew94qkeV4W1RIusju+T2Ow4WlvX452sg0s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lNb+5w/0nR7/jfwMfHYF5BYia7uVjyrUdRyhSkDAmUaWBL2fT30JoKsGXbQlFs9oOtM1OseZwTb26B4/Xm4tAgGgX9h8EhtMuKtadeoO3+grIIBIimCwC2+CRItR8JIDdR5kRttO0cEuTLIrWbZpNj1NBQHeX6tU/ZiVTn5E6pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hgWMtuhL; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=UY/Ua2wp; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hgWMtuhL; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=UY/Ua2wp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from pobox.suse.cz (unknown [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 367E2219B5;
	Fri, 30 Aug 2024 09:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1725010456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlm4X4QOcGE6DHm7ygOQKPj87QXS/m+PxWQiajETJgk=;
	b=hgWMtuhLo3K1c0F/7FQO84/drBRMdGrmqVLt5Q4ZDR5yVqjcBFe55w4ZNclIAWQpbzdttx
	XO27BnSJsL+nCxpNixi18Q2hHy6s2EA3yQcjDdtd3QEZfhoTrlVxm23T7Iw1HRk/aTuXoO
	bOWZDEOEyjMJASeuiCaygjZGgeJcY7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1725010456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlm4X4QOcGE6DHm7ygOQKPj87QXS/m+PxWQiajETJgk=;
	b=UY/Ua2wpu1Pi9WP40gpnvfMrtOZWdIEEXjIBDMWnIOkYDwLjSfTvohNm3LjoXLABynH0L1
	aYsnLKW9+zdhpFBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1725010456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlm4X4QOcGE6DHm7ygOQKPj87QXS/m+PxWQiajETJgk=;
	b=hgWMtuhLo3K1c0F/7FQO84/drBRMdGrmqVLt5Q4ZDR5yVqjcBFe55w4ZNclIAWQpbzdttx
	XO27BnSJsL+nCxpNixi18Q2hHy6s2EA3yQcjDdtd3QEZfhoTrlVxm23T7Iw1HRk/aTuXoO
	bOWZDEOEyjMJASeuiCaygjZGgeJcY7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1725010456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlm4X4QOcGE6DHm7ygOQKPj87QXS/m+PxWQiajETJgk=;
	b=UY/Ua2wpu1Pi9WP40gpnvfMrtOZWdIEEXjIBDMWnIOkYDwLjSfTvohNm3LjoXLABynH0L1
	aYsnLKW9+zdhpFBQ==
Date: Fri, 30 Aug 2024 11:34:16 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
To: Sami Tolvanen <samitolvanen@google.com>
cc: Masahiro Yamada <masahiroy@kernel.org>, 
    Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
    Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, 
    Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
    Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
    rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure
 fields
In-Reply-To: <20240815173903.4172139-37-samitolvanen@google.com>
Message-ID: <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-37-samitolvanen@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,google.com,gmail.com,garyguo.net,suse.com,gompa.dev,marcan.st,jannau.net,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Hi,

On Thu, 15 Aug 2024, Sami Tolvanen wrote:

> Distributions that want to maintain a stable kABI need the ability to
> add reserved fields to kernel data structures that they anticipate
> will be modified during the ABI support timeframe, either by LTS
> updates or backports.
> 
> With genksyms, developers would typically hide changes to the reserved
> fields from version calculation with #ifndef __GENKSYMS__, which would
> result in the symbol version not changing even though the actual type
> of the reserved field changes. When we process precompiled object
> files, this is again not an option.
> 
> To support stable symbol versions for reserved fields, change the
> union type processing to recognize field name prefixes, and if the
> union contains a field name that starts with __kabi_reserved, only use
> the type of that field for computing symbol versions. In other words,
> let's assume we have a structure where we want to reserve space for
> future changes:
> 
>   struct struct1 {
>     long a;
>     long __kabi_reserved_0; /* reserved for future use */
>   };
>   struct struct1 exported;
> 
> gendwarfksyms --debug produces the following output:
> 
>   variable structure_type struct1 {
>     member base_type long int byte_size(8) encoding(5) data_member_location(0),
>     member base_type long int byte_size(8) encoding(5) data_member_location(8),
>   } byte_size(16);
>   #SYMVER exported 0x67997f89
> 
> To take the reserved field into use, a distribution would replace it
> with a union, with one of the fields keeping the __kabi_reserved name
> prefix for the original type:
> 
>   struct struct1 {
>     long a;
>     union {
>       long __kabi_reserved_0;
>       struct {
>           int b;
>           int v;
>       };
>     };

yes, this is one of the approaches we use in SLES. We add kabi paddings 
to some structures in advance (see [1] as a random example) and then use 
it later if needed.

It is not the only approach. Much more often we do not have a padding and 
use alignment holes ([5]), addition of a new member to the end of a 
structure ([2] or [3]) and such "tricks" ([4] for a newly fully defined 
structure).

It is not feasible to add kabi paddings to all structures. We also have a 
different approach to kabi in terms of its coverage than RHEL does for 
example (as far as I know).

Not sure if it is interesting to upstream but I wanted to mention that it 
is not only about the ability to add reserved fields to kernel structures 
in practice.

Regards,
Miroslav

[1] https://github.com/SUSE/kernel-source/blob/SLE15-SP6/patches.suse/crypto-add-suse_kabi_padding.patch
[2] https://github.com/SUSE/kernel-source/blob/SLE15-SP6/patches.kabi/0001-iommu-Add-static-iommu_ops-release_domain.patch
[3] https://github.com/SUSE/kernel-source/blob/SLE15-SP6/patches.kabi/nfs-Block-on-write-congestion-kabi-fixup.patch.
[4] https://github.com/SUSE/kernel-source/blob/SLE15-SP6/patches.kabi/of-kabi-workaround.patch
[5] https://github.com/SUSE/kernel-source/blob/SLE15-SP6/patches.kabi/KVM-x86-Snapshot-if-a-vCPU-s-vendor-model-is-AMD-vs..patch

