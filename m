Return-Path: <linux-kbuild+bounces-11977-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP4YDmpruGn5dgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11977-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 21:43:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6F2A0511
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 21:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B353A3010259
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 20:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE0E3ED5B2;
	Mon, 16 Mar 2026 20:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWOt1lhE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2D62C0F78;
	Mon, 16 Mar 2026 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773693798; cv=none; b=bY4aOn11zGhAe0PbNjOGH5+wSouxrkQAB4glxCYq2UlsTfaVuFFphJwQ41Kce0RgJZq6G05qw3OTBwRfasXMFFLNnpgyoRk7gXMTuNc6ki8C92OWDV928FnatXut9/xq0S3tE8mrreCgLQDQHH5Ror07gUT6qgoGoOjwAQZgSJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773693798; c=relaxed/simple;
	bh=w/Uak5YC/dvbbLtjxRzj7m+BemNmjs0WEGwQX+esFvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJHaSN9L9DGfXJjeY2BJMfVeodplqSVMXgrUZ66EdYWKV39LmLpJos2P9ISTOuJtP4Yh0H8KEiSWsNtwe+GN8gCEskPyFhn8kyj+l6ACe1vAYN5vROOwilPfU/5WD2Ns4S+bGQNDmlzAi4Z2YZBjGU1JUCnP9GOupcFokakevZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWOt1lhE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96633C19421;
	Mon, 16 Mar 2026 20:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773693797;
	bh=w/Uak5YC/dvbbLtjxRzj7m+BemNmjs0WEGwQX+esFvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWOt1lhEt5eyxh1Es5LhRP2WRiuazbLby7QCgXKh2rzRH4IGt0dyGyP7ztv8ZB7xK
	 tZR1Qjdj4YbRlhxsrxqUT2LP1tZMczqL30rv8IlDlz1/eGOYMxIW8ud10/InaIMGNz
	 j/E9O+em1m0KASKQh5r/t3184FbTN1h1Bx2A8DJm7PV1/ZmTNiYAmnJHUMd7suKmS1
	 gjXDw4wQxfXKyVPz3JsEpgl/HdgSvG8IINfSLKEVRmzloGfPjnXTK2GauIjFuDG/w7
	 0kKfGjcGBsJXlx+InA8BAQrNNDBSOVn+iPAFUKQt2hjkOfemXbm2bGVFU9+piF9n5f
	 mnM1oD0KhHvpA==
Date: Mon, 16 Mar 2026 13:43:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
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
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to
 scripts/Makefile.vmlinux_a
Message-ID: <20260316204311.GA1329928@ax162>
References: <20251028182822.3210436-1-xur@google.com>
 <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger>
 <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
 <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
 <20260316175953.GA1910339@ax162>
 <CAF1bQ=TqFwmm9NhBPnxaoTCqHOsm1Q6MLhNcqpYq4uObZxzk3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF1bQ=TqFwmm9NhBPnxaoTCqHOsm1Q6MLhNcqpYq4uObZxzk3A@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11977-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCB6F2A0511
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:16:41AM -0700, Rong Xu wrote:
> If that's the case, we can just remove flag "--thin". Can we verify if
> that works?

I think we can only remove it from the second llvm-ar invocation. I
tested

diff --git a/Makefile b/Makefile
index 2b15f0b4a0cb..fb001e02cc0f 100644
--- a/Makefile
+++ b/Makefile
@@ -1260,12 +1260,11 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
 KBUILD_MODULES := y
 endif
 
-# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_vmlinux.a = AR      $@
       cmd_ar_vmlinux.a = \
 	rm -f $@; \
 	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) mPi $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += vmlinux.a
 vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
--

on 7.0-rc4, which showed no issues. This is basically a revert of my
suggested workaround for the original issue:

  https://lore.kernel.org/YyjjT5gQ2hGMH0ni@dev-arch.thelio-3990X/

You could add this as a prerequisite patch, I don't think it should be
squashed into the move change, especially since that appears to be why
we are in this situation. Why are we converting from the 'T' modifier to
'--thin' in the move patch? I know the documentation of llvm-ar and GNU
ar says that 'T' is deprecated in favor of '--thin' because it may do
different things on various ar implementations but the kernel only
supports these two implementations. I think we should just copy the
commands as they are and address the deprecation separately, perhaps
with an ar-option like Nicolas suggested upthread.

How about a v3 that looks like:

Patch 1: The diff above because all supported llvm-ar versions do the
same thing as GNU ar.

Patch 2: The move patch without changing 'T' into '--thin'.

Patch 3: The same as before, perhaps without '--thin' as well.

You'll need to base on kbuild-next-unstable [1] to address the conflict
with Yonghong's "kbuild: Reduce the number of compiler-generated
suffixes for clang thin-lto build" [2].

[1]: https://git.kernel.org/kbuild/l/kbuild-next-unstable
[2]: https://lore.kernel.org/20260307050250.3767489-1-yonghong.song@linux.dev/

Cheers,
Nathan

