Return-Path: <linux-kbuild+bounces-12242-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GFVGW5Fw2n7pgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12242-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 03:16:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D3731E9EE
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 03:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1C533048B23
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 02:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97181A23B9;
	Wed, 25 Mar 2026 02:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXIEB9nN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE01531E8;
	Wed, 25 Mar 2026 02:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774404947; cv=none; b=YZh50BCmoVDtE27WjrXgPnsrifvyqIsLnwHQtlqMXrY9NVPr0JZrnM4U0FYbKbVzdJxmz7qyyyebW9r13GtCNPyz7K87Xvs+zVXv/BIc23tujolF4eKY4QBp4rxRBuvrCOm/XCnwPw45Fk2ei0yBTHGkSxtm+9RKiNncK0hpWpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774404947; c=relaxed/simple;
	bh=UQ36BHD5AltOWCXoTF1F067alxzo/XmfYIE8jWkukFg=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=utbXcFxEJnAMLwY50zLEkbUxcKiDsDhI71yTplfq8DMOpLSWTIL024qEkHVKCJnIk2dguyDpbM2iGV5e/EZlLXJ7dQUttSYJjVc9udigzOk7d4SnsmRe+0V3lbx4Dqd1xpNbLrbkXjRui0EBd01BaLWcZeqzUUI5yaUOpEvbi8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXIEB9nN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA8AC19424;
	Wed, 25 Mar 2026 02:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774404947;
	bh=UQ36BHD5AltOWCXoTF1F067alxzo/XmfYIE8jWkukFg=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=SXIEB9nNxGuVM7+G/zWqCOrk3ScU5D3kc7pMf71uYqS54jCtztJ3t+D04TLw1M3+9
	 mE+HMEOIhSemtT3fb3I33VAZzmbye7BmjuY0RbnWai5x8v+2r19d2UnmZzoxCNaobX
	 lDmRWkDamwqaLHrsf2JDHFktCY7tSSDxHyJMflQBbIOpJd/oOpk6D+/VxyUcbzoBEi
	 Zzhih8EOYlxaTYl/EifYRfbS/Ps5Frot2VNd5AJNVtF31ssKLpr5c8EsGrT9cqc0fF
	 h4zDDkpYCLfZGSgBAngHj44aq+k8UIY25+Qct7AOMEgeTNNsoSe76bnuQarmVRPZjm
	 NK8PSxE6hMPLQ==
Content-Type: multipart/mixed; boundary="===============8578444517970282799=="
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <64037c46ac65e4e72f45f78a9703a8f938441d7499486ac389262aa406654b8b@mail.kernel.org>
In-Reply-To: <20260325011853.657295-1-sashal@kernel.org>
References: <20260325011853.657295-1-sashal@kernel.org>
Subject: Re: [RFC] btf: split core BTF parsing out of BPF subsystem into kernel/btf/
From: bot+bpf-ci@kernel.org
To: sashal@kernel.org,sashal@kernel.org
Cc: James.Bottomley@hansenpartnership.com,adobriyan@gmail.com,akpm@linux-foundation.org,alexei.starovoitov@gmail.com,ast@kernel.org,bp@alien8.de,bpf@vger.kernel.org,corbet@lwn.net,dave.hansen@linux.intel.com,davidgow@google.com,deller@gmx.de,geert@linux-m68k.org,gregkh@linuxfoundation.org,hpa@zytor.com,jgross@suse.com,jpoimboe@kernel.org,kees@kernel.org,laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org,linux-kbuild@vger.kernel.org,linux-kernel@vger.kernel.org,linux-modules@vger.kernel.org,masahiroy@kernel.org,mcgrof@kernel.org,mingo@redhat.com,nathan@kernel.org,nsc@kernel.org,peterz@infradead.org,petr.pavlu@suse.com,pmladek@suse.com,rdunlap@infradead.org,rostedt@goodmis.org,tglx@kernel.org,vbabka@kernel.org,x86@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 25 Mar 2026 02:15:46 +0000 (UTC)
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[hansenpartnership.com,gmail.com,linux-foundation.org,kernel.org,alien8.de,vger.kernel.org,lwn.net,linux.intel.com,google.com,gmx.de,linux-m68k.org,linuxfoundation.org,zytor.com,suse.com,ideasonboard.com,redhat.com,infradead.org,goodmis.org,iogearbox.net,linux.dev,meta.com];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linux-kbuild@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-12242-lists,linux-kbuild=lfdr.de,bpf-ci];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1D3731E9EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============8578444517970282799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/btf/bpf.c b/kernel/btf/bpf.c
> new file mode 100644
> index 0000000000000..ef973771bb2ab
> --- /dev/null
> +++ b/kernel/btf/bpf.c

[ ... ]

> +struct btf_struct_ops_tab {
> +	u32 cnt;
> +	u32 capacity;
> +	struct bpf_struct_ops_desc ops[];
> +};
> +	u32 id;
> +	struct rcu_head rcu;
> +	struct btf_kfunc_set_tab *kfunc_set_tab;
> +	struct btf_id_dtor_kfunc_tab *dtor_kfunc_tab;
> +	struct btf_struct_metas *struct_meta_tab;
> +	struct btf_struct_ops_tab *struct_ops_tab;
> +s32 bpf_find_btf_id(const char *name, u32 kind, struct btf **btf_p)

These six declarations between the closing brace of struct
btf_struct_ops_tab and bpf_find_btf_id() appear to be orphaned
fields from the original struct btf definition that were left
behind during the split.

They are parsed as file-scope global variable definitions. With
-fno-common, the name "id" in particular is likely to collide at
link time. Were these meant to be removed here, given that they
already appear correctly inside struct btf in kernel/btf/btf.h
under the CONFIG_BPF_SYSCALL guard?

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 93f356d2b3d95..0009a7ac78462 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -395,14 +395,23 @@ config DEBUG_INFO_SPLIT

[ ... ]

> +config BTF
> +	bool "BTF type information support"
> +	depends on !DEBUG_INFO_SPLIT && !DEBUG_INFO_REDUCED
> +	depends on !GCC_PLUGIN_RANDSTRUCT || COMPILE_TEST
> +	depends on PAHOLE_VERSION >= 122
> +	# pahole uses elfutils, which does not have support for Hexagon relocations
> +	depends on !HEXAGON

[ ... ]

> +config DEBUG_INFO_BTF
> +	bool "Generate BTF type information"
> +	select BTF

The old DEBUG_INFO_BTF had its own depends on lines:

    depends on !DEBUG_INFO_SPLIT && !DEBUG_INFO_REDUCED
    depends on !GCC_PLUGIN_RANDSTRUCT || COMPILE_TEST
    depends on BPF_SYSCALL
    depends on PAHOLE_VERSION >= 122
    depends on !HEXAGON

Those constraints now live only on CONFIG_BTF, and DEBUG_INFO_BTF
uses "select BTF" with no depends of its own. Since select bypasses
the selected symbol's depends-on checks, DEBUG_INFO_BTF is now
visible and selectable even when BTF's dependencies are not met
(e.g. on Hexagon, or with PAHOLE_VERSION < 122).

Should DEBUG_INFO_BTF use "depends on BTF" instead of (or in
addition to) "select BTF", so that it inherits the same
constraints?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/23520643445
--===============8578444517970282799==--

