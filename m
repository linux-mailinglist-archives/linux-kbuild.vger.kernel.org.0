Return-Path: <linux-kbuild+bounces-13535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3S4sLjuHH2p2mwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13535-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 03:45:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 575F8633829
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 03:45:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eSKXrD00;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13535-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13535-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C44DB3040488
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 01:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD27381AFD;
	Wed,  3 Jun 2026 01:45:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F63A37FF58;
	Wed,  3 Jun 2026 01:45:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451128; cv=none; b=cMPKaQ9kKt8aOWRlQEG1pxLxrbDFzQZcy6C6hJ6HxpJIiYIHtVXCkDKaLEtpm/n/40yZu3IvFErpQoa6mm+CgEw6r2t3TfDq/ZaYx7IFUGa2hNgR9qD3AFMz7V5IzOlLs2glzp4TQjv1Nn0ykGkZFQSlCuFGIzzbNiHu/gGpGcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451128; c=relaxed/simple;
	bh=o2pEgWL8ErSo80JaLZ19GTO1yu/9Wz6Esfs/iUTJ5uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWgWUOwK/usqF2g36D9uGyFbugvx3tVwP8/3WidqIZadNF8bvoB9Oy7jiqJQ3RSgEBLO1m8WSUdCnmkWTxLXag1TCikPW82dUxqxrF48Gsyes1zM/2CIfdnmDE4QDXUhCR67IZKEVUyVCZ33W1I1kzWHpyAgpc1iaCy4hJBX/l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSKXrD00; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0A31F00898;
	Wed,  3 Jun 2026 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780451127;
	bh=2vV1i75kDb0Ju7Ri1Wtzoop1KZcCIXZsmzTsVwJ549s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eSKXrD00aOnJYmrclr28/LaEbZ+NIdjn/UuauW/TUcO4Y0V3XjsWeDVCSVo352JLU
	 vv2BRRb3elQLsd3GTsQ97gOVSRAdQGIkN4uzgvCf3/jMBPuXJiqqNviI8biXIJijwt
	 rF4rtHpcxGn3dlq0X9k9+7q5AcwQhSPl80szHJo1G2qwDEiwoyDxrLuOdgLAp0Iuh/
	 qA+o/vsQzJcHh98/Zpnh/gE1APuDB3xNMijqWX1rKMim4CU7K3C/Lz7ljXBoftKR76
	 ak3Od430znod7aBOYTat02+qJPZiw6ZTwiqrUFixuTH26hjMJFwDxIF6nlV2zGKClv
	 uCnWw/enM+Umg==
Date: Tue, 2 Jun 2026 18:45:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
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
Message-ID: <20260603014520.GC1940387@ax162>
References: <20260529185347.2418373-1-xur@google.com>
 <20260529185347.2418373-3-xur@google.com>
 <ah6DleoCYipTwcO_@levanger>
 <CAF1bQ=Q+KN+p8RmmVDF3bP=11EWj=8fOPBg7wa7QQRW1XWF4iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF1bQ=Q+KN+p8RmmVDF3bP=11EWj=8fOPBg7wa7QQRW1XWF4iw@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13535-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xur@google.com,m:masahiroy@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:yonghong.song@linux.dev,m:morbo@google.com,m:justinstitt@google.com,m:ojeda@kernel.org,m:tglx@linutronix.de,m:aliceryhl@google.com,m:samitolvanen@google.com,m:rppt@kernel.org,m:aquini@redhat.com,m:mpe@ellerman.id.au,m:shorne@gmail.com,m:christophe.leroy@csgroup.eu,m:piotrgorski@cachyos.org,m:venkat88@linux.ibm.com,m:miguel.ojeda.sandonis@gmail.com,m:tejohnson@google.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.dev,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 575F8633829

On Tue, Jun 02, 2026 at 09:51:27AM -0700, Rong Xu wrote:
> Thanks Nicolas for the review!
> 
> It looks like Nathan already merged the patch series and squashed this
> specific patch into the previous one, which
> removed the commit message and that comment. These changes actually
> incorporate your review feedback.

Actually, I think the comment removal is still relevant. I plan to queue
up the following patch.

From a48bd961fb203a7ce68f8110fc53a85f90e24b33 Mon Sep 17 00:00:00 2001
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 2 Jun 2026 18:41:50 -0700
Subject: [PATCH] kbuild: Remove unnecessary 'T' modifier in
 cmd_ar_builtin_fixup

In cmd_ar_builtin_fixup, the 'T' modifier was added to '$(AR) mPi' to
work around a bug in llvm-ar that caused thin archives to be silently
converted to full archives [1]. Since commit 20c098928356 ("kbuild: Bump
minimum version of LLVM for building the kernel to 15.0.0"), all
supported versions of llvm-ar have this issue fixed, so the 'T' modifier
and comment can be removed.

Link: https://github.com/llvm/llvm-project/commit/d17c54d17de22d2961a04163f3dbc8e973de89b8 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.vmlinux_a | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
index bd141b893748..395e29998d7d 100644
--- a/scripts/Makefile.vmlinux_a
+++ b/scripts/Makefile.vmlinux_a
@@ -10,12 +10,11 @@ include $(srctree)/scripts/Makefile.lib
 # Link of built-in-fixup.a
 # ---------------------------------------------------------------------------
 
-# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_builtin_fixup = AR      $@
       cmd_ar_builtin_fixup = \
 	rm -f $@; \
 	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) mPi $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += built-in-fixup.a
 built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-- 
2.54.0

-- 
Cheers,
Nathan

