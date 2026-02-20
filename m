Return-Path: <linux-kbuild+bounces-11345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N2mJvGDmGnKJQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11345-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Feb 2026 16:55:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA1169151
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Feb 2026 16:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C3993026AB8
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Feb 2026 15:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC8F34E769;
	Fri, 20 Feb 2026 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMtq6coy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F12C11CD;
	Fri, 20 Feb 2026 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771602913; cv=none; b=qPb8eF0FVTd64zjLM1hWiRfGUTv5y5ME6IQGezWgxdLtECqljV/LxJcyLugxr6Se+A8nIoXKytOvdiT/cguJZJXOPNCGs488+XYfSzfgZFGCOGHk8vEnIBArfGBtJsEk+t7Qt1gd4nKV3vUeBYTbTHfNUSVQzG7fuKiBoh0Y7/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771602913; c=relaxed/simple;
	bh=sf7HrBnxjfkYlmWPVKhmzFIrsPNVYpWlY71R+iCD/MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0XLavjl9C2s3d22VIcK2Kn0peW+Gz3PEZltv2kDuSTx4bhUUricqLvAUOxjSEfVlb8l0smrTL8L/SzpmdOxpTZJhGqpqDbU85E0u7rIIzQLAYN3BbSnNrnvmxks1aeX7IpV2F3KdVbYLlar2yvyuwodD7mVGrCwq2EUlasx4bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMtq6coy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BE1C116C6;
	Fri, 20 Feb 2026 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771602913;
	bh=sf7HrBnxjfkYlmWPVKhmzFIrsPNVYpWlY71R+iCD/MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMtq6coyU1w+HcU39x8+iNHW5trrgdhfnUnvfElRttjllgaD7tgsS+IM4p1JhmqcL
	 GwNxz/k1osfXaVXVZ6e4eCL6IrISdlXtvEEr37OWUVexBxmScr7BoQLFqRRLkwgGG4
	 q32MXNpcESd7QudTXS6cqvLDDsF+UzE8Ytaz7eBzzWI6SgBRpWmc+3ZnFoayKziEn9
	 C2Pn8hStvf9lQg6NhnIGIZNf9F9FWSMkjAfa0pIftjDbXusi6cUkDwhRjNohAhRb5J
	 v7wfirYRNnQPyh33JdiccLT5QxV3bX7XizmouCK8dFLL6bEvZ1GogN0TRjvh/6uHAR
	 q0L1OdWM/dOaw==
Date: Fri, 20 Feb 2026 16:55:10 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] module: Fix kernel panic when a symbol st_shndx is out
 of bounds
Message-ID: <aZhyyIVW95SzGzjJ@macos>
References: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11345-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,iogearbox.net,linux.dev,gmail.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2BBA1169151
X-Rspamd-Action: no action

On 2025-12-30 10:32, Ihor Solodrai wrote:
> The module loader doesn't check for bounds of the ELF section index in
> simplify_symbols():
> 
>        for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
> 		const char *name = info->strtab + sym[i].st_name;
> 
> 		switch (sym[i].st_shndx) {
> 		case SHN_COMMON:
> 
> 		[...]
> 
> 		default:
> 			/* Divert to percpu allocation if a percpu var. */
> 			if (sym[i].st_shndx == info->index.pcpu)
> 				secbase = (unsigned long)mod_percpu(mod);
> 			else
>   /** HERE --> **/		secbase = info->sechdrs[sym[i].st_shndx].sh_addr;
> 			sym[i].st_value += secbase;
> 			break;
> 		}
> 	}
> 
> A symbol with an out-of-bounds st_shndx value, for example 0xffff
> (known as SHN_XINDEX or SHN_HIRESERVE), may cause a kernel panic:
> 
>   BUG: unable to handle page fault for address: ...
>   RIP: 0010:simplify_symbols+0x2b2/0x480
>   ...
>   Kernel panic - not syncing: Fatal exception
> 
> This can happen when module ELF is legitimately using SHN_XINDEX or
> when it is corrupted.
> 
> Add a bounds check in simplify_symbols() to validate that st_shndx is
> within the valid range before using it.
> 
> This issue was discovered due to a bug in llvm-objcopy, see relevant
> discussion for details [1].
> 
> [1] https://lore.kernel.org/linux-modules/20251224005752.201911-1-ihor.solodrai@linux.dev/
> 
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>

Reviewed-by: Daniel Gomez <da.gomez@samsung.com>
 

