Return-Path: <linux-kbuild+bounces-13817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 05CvNWLlM2o3HwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13817-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 14:32:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 761B36A013C
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 14:32:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=azKr+AwJ;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13817-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13817-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD3F0302F04E
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 12:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB473F39F1;
	Thu, 18 Jun 2026 12:32:32 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C33909B7
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 12:32:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785952; cv=none; b=CQ19xTT8C5HdvY0ZVZ9us9F9kgNPYVc/AEwYOzEztE4Y/cfiJ5UOnTjLrDU4gbWq0mD5GLlltNd3DZisThW6I08ex0tmHusJG2CYCs5+3IU/x30iWKsZLj3XqO+mZAZIjRxMPtBm5vzvXG5EZXpcB4Og90Yzm3ZyM/jKODA6G8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785952; c=relaxed/simple;
	bh=gZdkqF0OerCSAV0j1QpiwzO4IBQfxaAKNYwglO9AMco=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkQGJl+l/+SDKgN+XRhH0nKKIDmHF0xEjCkDFHPu0nCajlktP8ZJO3/y6nNXNv1I5Zc9ngEfrwxXeOKvBkbP/mnwYF3Lz+9sLz+36C/+MPEseVBFtdIvVszZU23yO4CpwzXZzC/dkZ3oR0ygrCvMvMdK3xUjz9/x7JynEBjYIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azKr+AwJ; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so7363445e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781785950; x=1782390750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPc0OU9sjfyGQ7c3buNYbzdqaEGIx1/7pa99xR6SsZs=;
        b=azKr+AwJlJPkxCEPNFm2sPWMpVx2+NpxkHMzk7Rz25vfvdQWJ/0asZ+wXQzdRwIQkz
         S205UWFJnsImjFfl1303bdck1anIfw9CxGF3BtG+d627sGdQDF2Mh2y9LsHQXe9bPVjb
         GyIWkbslZTWOsgESO+uvn2jamx9QoqQYnjQPrsxE5z0h+1rpcT1Dg3jB9Y90z1oamZyC
         UzfYVpvY23UVww1Xf7HrkYiwC3g4ArU8Z/F1393CfXrjoFsOBw4ZBVdXWsJm8mX00+Bm
         SrW9QAZUDqdjDS7seXpPc8G5xxuMg3HK/0uKV5dnaT1DXtRN7rIMWxCRqR/EP+3chabs
         gdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785950; x=1782390750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPc0OU9sjfyGQ7c3buNYbzdqaEGIx1/7pa99xR6SsZs=;
        b=p9xYwzWjjpnlU7ew+4c2ew+azYezgyeQBBy1UanNMu/BTWRMNbuq/3Tx/HDRn6kSi6
         k09fvqZyBr2tGVz2kLD3B4TUmQk9c7G+6eSXskGLbZhzGHwHaTPgV8AO4Tvd5KqHAtTP
         PW9IQvckCB4awe2zM+dEw3pEiQBjBBZ4//XXJSkqtppCgzY56JmkjJz5lj4+hPewpLwh
         EyXsA/oVJUpdcT2PQC03J+XRhB8vv0Hw+6sfSYI52zyLaBFcOTgHKAiVqp9XkARnQ6hi
         biKZk05Kde+TyuOymYkBaQctTSUP2Xi4cCADBVUljHLiP684X5xLHjW5mLXWReiEO55l
         F/IQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vhVR7iHGDjdKof/9ckyEeXrKSSHKi/9W/FRGzASHQERvVtAThmYspFI2lGFnaS+OOnjtB07ZpMsb0BGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxqbewYlpcrJpo98sP3RA/Prxc5/hW8a4xYPVJIh990B/KjXJJ
	2iY6RbL4m2x6oj2Scb0mNljz4UFLJ8nbESOPuPcYmI/bwNkkz9IMT++p
X-Gm-Gg: AfdE7cn80l1CS9gJ8D0enQydWsSyCz4wsnlJ3+bvZFbWp7sfafKzbj6CULJtcNs5nun
	Y1+CS3n5ePjUb692gOPBkR5uZn4PytBP69zmEIelQgmCplicBIRK4VoG9obyR6MDOgDQeUPnMs0
	BlXIqzX7yIrtNo8YI+znGfUb5AVKajHZiHuVFHCHHKCCbCnzwtXfTDjePagZuBkcIbwuHuxLhE9
	2AbEULitZkLe0ajd+UwwH4dEhrRH2ptUuWdsPrLcvsEuIhxjjfLSm6ZJX1L9n7M2F9N7tviBcGH
	Hp3RGztcnT31i9HcDISOc7HeUQZNBrk4bNYFCsausmC1pN0xDPHPu1ahawx8bUoiyVVaorZtT/r
	GHei4bTXgZG8VWoIKG3irw1oEMUG9qqW7N/bdJ0ShYPk6DvD2bTOAoVHR9eOPVuR4b1RxT1aNUs
	oU
X-Received: by 2002:a05:600c:1c16:b0:490:469c:556b with SMTP id 5b1f17b1804b1-492333bf79amr154902955e9.12.1781785949811;
        Thu, 18 Jun 2026 05:32:29 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm292626405e9.5.2026.06.18.05.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:32:29 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 18 Jun 2026 14:32:28 +0200
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 0/4] Modernize resolve_btfids selftest
Message-ID: <ajPlXOE9gyoO3oi1@krava>
References: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13817-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,etsalapatis.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:emil@etsalapatis.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[olsajiri@gmail.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olsajiri@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,krava:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 761B36A013C

On Wed, Jun 17, 2026 at 02:06:15PM -0700, Ihor Solodrai wrote:
> This series updates resolve_btfids selftests to use latest selftest
> helpers API and add kfunc set testing.
> 
> This series was split from a bigger series [1].  It's general selftest
> improvements that don't have to be entangled with resolve_btfids
> development, and makes the main series a bit smaller.
> 
> [1] https://lore.kernel.org/bpf/20260601221805.821394-1-ihor.solodrai@linux.dev/
> 
> Changes compared to original 4 patches:
>   * various nits from Jiri, Andrii and Emil
>   * in patch #3 (that adds gcc pragma) definitions are moved such that
>     .local BTF_ID_* containers are grouped together and we have a
>     single pragma scope

left one comment, otherwise lgtm

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

> 
> ---
> 
> Ihor Solodrai (4):
>   tools/bpf: Sync btf_ids.h to tools
>   selftests/bpf: Modernize resolve_btfids test scaffolding
>   selftests/bpf: Fix resolve_btfids test reads of BTF ID sets in PIE
>     builds
>   selftests/bpf: Add kfunc set test to resolve_btfids
> 
>  tools/include/linux/btf_ids.h                 |  78 +++++++++-
>  .../selftests/bpf/prog_tests/resolve_btfids.c | 140 ++++++++++++------
>  tools/testing/selftests/bpf/progs/btf_data.c  |  10 ++
>  3 files changed, 177 insertions(+), 51 deletions(-)
> 
> -- 
> 2.54.0
> 

