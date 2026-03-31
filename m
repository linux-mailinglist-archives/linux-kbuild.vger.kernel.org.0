Return-Path: <linux-kbuild+bounces-12409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKCGL3P3y2kXNAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12409-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:33:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2120236CC37
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D04823114C3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BD03F99EA;
	Tue, 31 Mar 2026 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rn5zDNmj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CFC3E92A5;
	Tue, 31 Mar 2026 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974456; cv=none; b=QSt2dlty/UtyCccivWaWsViN/Havz5SRuKewzVj1Vh4x5eO+VEt+Vzd8ZTDZv7qwoJGvVCxj2Uq0B0tul8xM4AZubECsXu5O1MOvv2PVAwaYxo8/fS0BIRlcU9liDLvT1lPbdFDWJYhhS7CbmrQBiSKkCwSptmS9bQVYMYIVnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974456; c=relaxed/simple;
	bh=gwGsC8gfuBfgQ5XY3v9OpkZF1IjD9jGcUhRLXX0GzwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXeoQFzg0xxWWQLVA/7x+wGDmWTuISecilmEJ0G3Pw+0aVU9R6yt7Iv5FD1ZNtUSOacR83r5pWgO7zs8Wgl7lGgE9VcGE+FSGdlYeV/wi6BDnEyZB7iwiig37kk5g2bzoB0Sm+yUBO/sCMRnt/rHcIJmD8Ne0+6+BUOlD9IujSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rn5zDNmj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DB1C2BCB2;
	Tue, 31 Mar 2026 16:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774974456;
	bh=gwGsC8gfuBfgQ5XY3v9OpkZF1IjD9jGcUhRLXX0GzwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rn5zDNmjYAYfmZdyCTz7xEy3t/bijG8g0RKCuF1KoxHUEJHYO0OMHhQFVwMrOWj8P
	 So68SIDPXk2bPnsHTTQDw0PM+TBow6K4kQ5tWggWwX/mjIyt3qftNjB2UoJH6NN/0V
	 XyVadomQf2PKTT3uAGFwNnwSvhO52bVVVdcwLcffDYF8P/m/GDp8XDVGmQhBtYnELm
	 Eka3HyPWq2jiFPSLI5mrQGrpHx/ea6Z/X7GVry6Tt+3yjPspD4BAM/w0vxgyczi0o+
	 1E5AkA86lybXcwLEQujk7uuMbG291wFQ4mfSvEpGLmfucvsvUF2hZ7xOhC0BtddqZk
	 0TsD3xLwfumUg==
Date: Tue, 31 Mar 2026 18:27:29 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: xur@google.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
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
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <20260331162729.GA2006419@ax162>
References: <20260331154827.2793269-1-xur@google.com>
 <20260331154827.2793269-4-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331154827.2793269-4-xur@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12409-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,o.map:url]
X-Rspamd-Queue-Id: 2120236CC37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rong,

On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
> diff --git a/Makefile b/Makefile
> index 69ccf9b8507d..26005c64016d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
>  endif
>  
>  ifdef CONFIG_LTO_CLANG
> -ifdef CONFIG_LTO_CLANG_THIN
> +ifdef CONFIG_LTO_CLANG_FULL
> +CC_FLAGS_LTO	:= -flto
> +else
>  CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
> +if CONFIG_LTO_CLANG_THIN

This should be an 'ifdef', not an 'if'. You copied Yonghong's mistake:

  https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
  https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@linux.dev/

Please slow down and test build your changes before sending them. Each
revision adds four new emails to everyone's inbox, which is just noise
when there are obvious, basic problems. 'b4 diff' shows no actual
difference from v8 and v9, which should have been caught by a simple
build test right before 'git send-email'.

>  KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
> -else
> -CC_FLAGS_LTO	:= -flto
> +endif
>  endif
>  CC_FLAGS_LTO	+= -fvisibility=hidden
>  
> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
>  CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>  	       modules.builtin modules.builtin.modinfo modules.nsdeps \
>  	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
> +	       vmlinux.thinlto-index builtin.order \
>  	       compile_commands.json rust/test \
>  	       rust-project.json .vmlinux.objs .vmlinux.export.c \
>                 .builtin-dtbs-list .builtin-dtb.S
> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
>  	$(call cmd,rmfiles)
>  	@find . $(RCS_FIND_IGNORE) \
>  		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
> -		-o -name '*.ko.*' \
> +		-o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
>  		-o -name '*.dtb' -o -name '*.dtbo' \
>  		-o -name '*.dtb.S' -o -name '*.dtbo.S' \
>  		-o -name '*.dt.yaml' -o -name 'dtbs-list' \

With that addressed above, the series survives my basic LLVM 22.1.2
build test with my distribution configuration. I'll provide formal tags
on a properly tested and fixed revision.

Cheers,
Nathan

