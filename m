Return-Path: <linux-kbuild+bounces-13470-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC6sKTiZHmoAlQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13470-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 10:50:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D262ADF2
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 10:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17CC5301475C
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 08:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B020D3B83E1;
	Tue,  2 Jun 2026 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bn2ozam5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F3437F72C;
	Tue,  2 Jun 2026 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389986; cv=none; b=Nuo/pseyZY9tIAP90H0eGBKU4MRn+ZOuXlDneOJX0iF1DhD/0jGQMlJYNgBcqn7OafNWcuqV9uN5mZ65eUXnkkLcBODW9MsRAjUiRVXZeDIIjYFTjvN/npgIa32urY5syQsZdhuhwDhRECYxTiskZiKJJ9QQ6C2fwQXGEhb++iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389986; c=relaxed/simple;
	bh=Yly/9TkX4qC1aY9J1UIfDu2NNS9l9GnPQ4iSfLDo52k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQjKF+GkBuEVy0kyuMJ6Q1MWx4ZDrwr8XOkoS0fzRXINTHUECHPFwEmhpltPIKjUvtMgfM7x+CQJDn/Y53bSKV6/ZrHrEPGxbLaeG1rJEcE242JtCI+0R7tXu9uipanEUUWbLr8ucfWff4CdByaMHQVPQX85vBKgjGR23/KqHlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bn2ozam5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6C1FC1F00893;
	Tue,  2 Jun 2026 08:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780389983;
	bh=nSa/bVNfdYiyA49UH1PPtv6q9fMVuj8Fn5WF3XWIBNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bn2ozam59//JguX23Q4JgXlfhYftdLZuLYhnBlHGR9Wn49zXmx39VqvDlVZWizLGH
	 Y4wdgqb+ziraqJ/Su6JETVqzWybpZ+ePzeIFYvDTxgUY1R8OKvqlQ2H/yX8wPsofhq
	 u5CglFWIgJMVjQ5glxSmE0ew+QJhuONDJW6l1Z9Qu4fuAdekZymOuQ+/noqRpGmfWV
	 AYtA6gKMz+vFMSdoh2DkvAHc7QiebXfzzEqma7uGM85TigszixDfqZstFsntmf7WQo
	 2hgqQpJyMFR0RGr/JyO+SArR9fR1o0dTu4U1mbhi+LAfJxsIiIOUU/+trhv1noB9+p
	 zO/SxqlMQtRXA==
Date: Tue, 2 Jun 2026 09:17:41 +0200
From: Nicolas Schier <nsc@kernel.org>
To: xur@google.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v12 2/3] kbuild: change --thin back to 'T' in $(AR)
Message-ID: <ah6DleoCYipTwcO_@levanger>
Mail-Followup-To: xur@google.com, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20260529185347.2418373-1-xur@google.com>
 <20260529185347.2418373-3-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529185347.2418373-3-xur@google.com>
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-13470-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.dev,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 235D262ADF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 11:53:45AM -0700, xur@google.com wrote:
> From: Rong Xu <xur@google.com>
> 
> The '-T' flag in $(AR) is no longer problematic since the minimum
> requirement for LLVM has been updated to version 15. As of LLVM 14
> and onward, the '-T' flag functions identically to the '--thin' flag.

For correctness: it's called "'T' modifier"  (instead of "'-T' flag").

> 
> Fixed the issue seen on IBM Power11 System:
>   ar: unrecognized option '--thin'
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c1ecae82d@linux.ibm.com/
> Signed-off-by: Rong Xu <xur@google.com>
> ---
>  scripts/Makefile.vmlinux_a | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
> index 9774f02b43b2..650d44330d1f 100644
> --- a/scripts/Makefile.vmlinux_a
> +++ b/scripts/Makefile.vmlinux_a
> @@ -10,12 +10,12 @@ include $(srctree)/scripts/Makefile.lib
>  # Link of built-in-fixup.a
>  # ---------------------------------------------------------------------------
>  
> -# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
> +# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14

This comment should be removed.

>  quiet_cmd_ar_builtin_fixup = AR      $@
>        cmd_ar_builtin_fixup = \
>  	rm -f $@; \
> -	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
> -	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
> +	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> +	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
>  
>  targets += built-in-fixup.a
>  built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
> -- 
> 2.54.0.823.g6e5bcc1fc9-goog
> 

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

