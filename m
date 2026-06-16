Return-Path: <linux-kbuild+bounces-13775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8U6SAOapMWqVowUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13775-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:54:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E61FF695060
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:54:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etsalapatis-com.20251104.gappssmtp.com header.s=20251104 header.b=jWRrZbVY;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13775-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13775-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D382A30135C4
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 19:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BFD37CD2C;
	Tue, 16 Jun 2026 19:54:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A86C2356C6
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 19:54:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639648; cv=none; b=NXpBJgdUw4VLFMKvWZPcwBUlflvIp9ZU0FklFVB2IzQmRo90q2fyFavIOHgQmiSIdZdi1jGIrzlLtg1M4kZl2g0AA3Nz0avVZyOgPm4AlfVUt0t/hIVRRHzXX/xxlkP80lj9Qo95g3rEgr+2tvb/uOXTDKTYFGvMO4JMiqBwVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639648; c=relaxed/simple;
	bh=wBGHjHxgrem0nIUgulG5+nCOYEO7Z4ayqUS4ehBx9ZI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=fjF1+xdbN+t8fd9FXOcZ4YGM0EC+anp3UnIxgS/CBBya8t1ZUPHpq60MTtyt6QfBhviaTV/7+2vfFyXV9JWtJn+/r/M8PNR5EJs7CDCseJnBy1Gvlc2sLSIhQG5/8CdKeR+5oW3hlvsjG89n0hyc22Q9FZfVekZ7nMRZka5ck64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=jWRrZbVY; arc=none smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30b6dad2382so5270374eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 12:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781639646; x=1782244446; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwknEJTZ7VfaeFcxIBCw6u/qAaYv555kWbrQ6JRv5ww=;
        b=jWRrZbVYxgYgmnTAmj7NgZZUA3rFl2DShtynPpNGOsQWXBWrAvw5Fqr6AjdYpB6jj7
         4vA8DSfC7cxXiVMqW9646BLmM5oE2CMnSSlKM+gajDHCvtkpt8nNKmiVVAn0JG8jXDgB
         PE2NtFYVtMeDY4583S7delBRll8lG8BkXL3vSb2wzbK3U5w3WgqlIIJB+EDKPBOUn0uL
         1XcTMCmHaTMaLLUWEPRhhkrcyDxsQix1MJKtep1aECR6mOGvw+srYTW1gkC2+2vt97p4
         Wu3zm2ZQesFD+unQeWVouw6fFP5bNu7DLqfM1MIQ58QeQqA0F8hWZ7eEUrDC0HzOJBv1
         HNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639646; x=1782244446;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cwknEJTZ7VfaeFcxIBCw6u/qAaYv555kWbrQ6JRv5ww=;
        b=C3McHtaJqj6w2HqTYC9UjXG3JUCbIfhhfO+knvbL/TH55fbsqmQFAjDSuaZawvuM4D
         AdoFMq6ZwXhY0OFFAU4DBwlYbhIl4P60tUGDR90A50lfsggXPP0xnguAIDWm4fn+WQ0M
         3pwKhs3eX620z302MkHI1hrVRzEcaJFNljJt17EsuFFgcEzWniv5uvg6WEQmH83mk4oF
         pxc+mJgVZ08wLySodhaKPOTNrDJueWGCZWghzAkpn9Ih4D8ckHHmFgznqVdeyLpcqdMg
         Vc8fqpIErxxZRhyd2r9VuHtz3gY8NhByHie00hdAJYxeHQdWXdLtH+JwXmhp8bonJmnP
         2alA==
X-Forwarded-Encrypted: i=1; AFNElJ/+sVquX/Agso3tURWCgYiUcACyyKK5CfLlus/F2PGr2pRqQR+ivO4oY778OkzIaDscO5smjpUXUxxib3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy49J1sN3OSFz3yqa+iB6VZeVafdix5ogIXVID2+zy8j1K1iCdi
	OoKUD3ed/qySvV1DkuseunbSh0z3Gi5oGf+6PG41oIXyw5BMA+b0UCJRc2tWccdktaw=
X-Gm-Gg: Acq92OEaduR7uzKrs92VB89lV3DJnU5CqOWFgrJmFrta6iDXOvku3O52rbUQHlLCi+T
	v2MpQ7rXpPqSMg+RWSeg44f+Jw5YVKLHzRB8CfnJ5TbMr964PjgeSoQE+97gRI52zFWHivRnOqP
	hLXwacfECxzLEHJ41yDz6tWGf7kijyUaHRiDFuw5lSTVxTXq9Z9ER/Ws0s9Jen8LS6IsdxT3KwC
	cCtv8hVlZNluYBt5j3V0UY4NKAASVTaZQJm+/viWFNTXAbhAbB6zkxkr7wcUr59yqFnKhmbP/La
	WZGW+kjnRpA3TN4f1KpE3nfXValthWTME78ktjWhzMQ2DUHoNqVKVYAnErJgIs/4KSY2cFtQOkj
	SbuKOIK+IkSI/ralACE/TL7qjHelY3KcaE91+4mpx7oBvA661rndCovUrSLIVtDUqWJBIrcdSur
	QTbRUI
X-Received: by 2002:a05:7300:80ce:b0:2ed:e12:376d with SMTP id 5a478bee46e88-30bcae484edmr392664eec.35.1781639646207;
        Tue, 16 Jun 2026 12:54:06 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::1a8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bc7d77f90sm948619eec.6.2026.06.16.12.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:54:03 -0400
Message-Id: <DJAQJL4LZKOF.1DB3AFRP5DTOP@etsalapatis.com>
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Jiri Olsa"
 <jolsa@kernel.org>, <bpf@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 14/14] docs, resolve_btfids: Document kfunc
 BTF annotation emission
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-15-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-15-ihor.solodrai@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[etsalapatis-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[etsalapatis.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13775-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etsalapatis-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:email,etsalapatis.com:email,etsalapatis.com:mid,etsalapatis.com:from_mime,etsalapatis-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E61FF695060

On Mon Jun 1, 2026 at 6:18 PM EDT, Ihor Solodrai wrote:
> resolve_btfids now emits the bpf_kfunc and bpf_fastcall BTF decl tags
> and the arena address_space(1) type attribute for kfuncs, which were
> previously produced by pahole.
>
> Reflect this in the in-tree comments and documentation.

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

Nit: Replace address_space(1) with arena here and in any other occurences.

>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  Documentation/bpf/kfuncs.rst    |  8 ++++++++
>  scripts/Makefile.btf            |  3 +++
>  tools/bpf/resolve_btfids/main.c | 11 +++++++++++
>  3 files changed, 22 insertions(+)
>
> diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
> index 4c814ff6061e..d98e666f03a3 100644
> --- a/Documentation/bpf/kfuncs.rst
> +++ b/Documentation/bpf/kfuncs.rst
> @@ -437,6 +437,14 @@ type. An example is shown below::
>          }
>          late_initcall(init_subsystem);
> =20
> +At kernel build time the ``resolve_btfids`` tool discovers all kfuncs fr=
om the
> +registered ``BTF_SET8_KFUNCS`` sets and emits their BTF annotations into=
 the
> +kernel's BTF; these annotations were historically produced by pahole. Fo=
r each
> +discovered kfunc ``resolve_btfids`` emits a ``bpf_kfunc`` BTF decl tag, =
a
> +``bpf_fastcall`` decl tag when the kfunc is flagged ``KF_FASTCALL``, and=
 the
> +``address_space(1)`` type attribute on the return value and/or arguments=
 flagged
> +``KF_ARENA_RET``, ``KF_ARENA_ARG1`` or ``KF_ARENA_ARG2`` (see section 2.=
8).
> +
>  2.7  Specifying no-cast aliases with ___init
>  --------------------------------------------
> =20
> diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
> index a1812985a61a..717e76ce96a7 100644
> --- a/scripts/Makefile.btf
> +++ b/scripts/Makefile.btf
> @@ -14,6 +14,9 @@ pahole-flags-$(call test-ge, $(pahole-ver), 125)	+=3D -=
-skip_encoding_btf_inconsis
>  else
> =20
>  # Switch to using --btf_features for v1.26 and later.
> +#
> +# kfunc BTF annotations (bpf_kfunc/bpf_fastcall decl tags and the arena
> +# address_space(1) type attribute) are emitted by resolve_btfids, not pa=
hole.
>  pahole-flags-$(call test-ge, $(pahole-ver), 126)  =3D -j$(JOBS) --btf_fe=
atures=3Dencode_force,var,float,enum64,decl_tag,type_tag,optimized_func,con=
sistent_func
> =20
>  pahole-flags-$(call test-ge, $(pahole-ver), 131) +=3D --btf_features=3Dl=
ayout
> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/m=
ain.c
> index aafbcfec755b..5a4683d11426 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c
> @@ -58,6 +58,17 @@
>   *             __BTF_ID__func__vfs_fallocate__5:
>   *             .zero 4
>   *	       .word (1 << 3) | (1 << 1) | (1 << 2)
> + *
> + * In addition to resolving BTF IDs, resolve_btfids performs kernel-spec=
ific
> + * BTF-to-BTF transformations for kfuncs found in BTF_SET8_KFUNCS sets. =
For
> + * each such kfunc it:
> + *
> + *   - emits a "bpf_kfunc" decl tag, and "bpf_fastcall" when KF_FASTCALL=
 is set;
> + *   - wraps the return value and/or arguments flagged KF_ARENA_RET,
> + *     KF_ARENA_ARG1 or KF_ARENA_ARG2 with the "address_space(1)" type a=
ttribute;
> + *   - rewrites the prototype of KF_IMPLICIT_ARGS kfuncs.
> + *
> + * These kfunc annotations were historically produced by pahole.
>   */
> =20
>  #define  _GNU_SOURCE


