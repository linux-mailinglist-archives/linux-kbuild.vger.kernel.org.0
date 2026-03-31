Return-Path: <linux-kbuild+bounces-12378-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lpKWHpRYy2noGgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12378-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 07:16:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD58F364093
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 07:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94E60303A879
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 05:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08502BCF4C;
	Tue, 31 Mar 2026 05:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jTHfAPQH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD652E413;
	Tue, 31 Mar 2026 05:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934161; cv=none; b=l3VWk9mxcF3N924c5qMwTjZSCgDQYxPm5aGWeWCnZ6fwevHrXk+UQKduVGkHX6RtJ5RlLp0rOsvNwcr3e5dVFAi/ABnJH6hl0KxhidqMfzx3rGQys+kzsWJPwI9zt3r485OzfJ4Pt6YEplOL9pIn3YQaFl8CtMcSPd9KsADARAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934161; c=relaxed/simple;
	bh=cko78lWroQJVnxNWlOp9Gl7HsXjU2LNEEKQ8hJBlmpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lggAYetCgD6q/V5leIlYMOzBeScEqtwDDAxAs5hpg39xuYsBJM9EyGfrxcwooAExjX3jSiXbZoWnK02zFDYdL/E5HJutLLrReOcx4fjNcjMm9et0FkiZFmAuZTTR5PSosj2ObAHYw9Blc89Mzq3HqbNI/3mmR5OJ/H+CYlPy9Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jTHfAPQH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3817C19423;
	Tue, 31 Mar 2026 05:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774934161;
	bh=cko78lWroQJVnxNWlOp9Gl7HsXjU2LNEEKQ8hJBlmpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTHfAPQHsHCRyDqtusMAP3mhwLrmKKRLbV/0oMT4toW69tJukLcaf2JNfntbGrybu
	 6qeacSMrwWCmMzLmtXlJx4EQc4GppLik8j+LKlPfvva7d6XwM+Zv97GaMxuGo1FJwH
	 lIhdE/4mrieZeEZ4GvjlU6D2rIUDWVvVKZ8Rrzkk=
Date: Tue, 31 Mar 2026 07:15:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH 02/15] scripts/sbom: integrate script in make process
Message-ID: <2026033111-bolt-verse-4505@gregkh>
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
 <20260210205424.11195-3-luis.augenstein@tngtech.com>
 <20260330095011.GA1458050@ax162>
 <9120907b-9568-4f0e-9757-c9e3b8d530f4@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9120907b-9568-4f0e-9757-c9e3b8d530f4@tngtech.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-12378-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: DD58F364093
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:32:00PM +0200, Luis Augenstein wrote:
> Hi Nathan,
> 
> thanks a lot for your recommendations.
> 
> > Does sbom-roots.txt need to be cleaned up as well?
> 
> This file is only required to pass the roots into the python script.
> We could also use a tmp file. Then we don't need to worry about clean
> up. Together with your other suggested changes something like this
> should work:
> 
> # Script to generate .spdx.json SBOM documents describing the build
> #
> ---------------------------------------------------------------------------
> 
> ifdef building_out_of_srctree
> sbom_targets := sbom-source.spdx.json
> endif
> sbom_targets += sbom-build.spdx.json sbom-output.spdx.json
> quiet_cmd_sbom = GEN     $(notdir $(sbom_targets))
>       cmd_sbom = roots_file=$$(mktemp); \
>                  printf "%s\n" "$(KBUILD_IMAGE)" >"$$roots_file"; \
>                  $(if $(CONFIG_MODULES),sed 's/\.o$$/.ko/'
> $(objtree)/modules.order >> "$$roots_file";) \
>                  $(PYTHON3) $(srctree)/scripts/sbom/sbom.py \
>                      --src-tree $(abspath $(srctree)) \
>                      --obj-tree $(abspath $(objtree)) \
>                      --roots-file "$$roots_file" \
>                      --output-directory $(abspath $(objtree)) \
>                      --generate-spdx \
>                      --package-license "GPL-2.0 WITH Linux-syscall-note" \
>                      --package-version "$(KERNELVERSION)" \
>                      --write-output-on-error;
>                  rm -f "$$roots_file"
> PHONY += sbom
> sbom: $(notdir $(KBUILD_IMAGE)) include/generated/autoconf.h $(if
> $(CONFIG_MODULES),modules modules.order)
> 	$(call cmd,sbom)
> 
> Note, I will also add the --write-output-on-error flag by default such
> that the .spdx.json documents are generated as much as possible even if
> some build commands are unknown to the parser.
> 
> > FWIW, I get errors like
> >
> >   $ make -kj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- O=build
> mrproper defconfig sbom
> >   ...
> >     GEN     sbom-source.spdx.json sbom-build.spdx.json
> sbom-output.spdx.json
> >   [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser.py",
> line 630, in log_error_or_warning
> >   Skipped parsing command ccache aarch64-linux-gcc ... -o init/main.o
> /src/init/main.c because no matching parser was found
> >   [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser.py",
> line 630, in log_error_or_warning
> >   Skipped parsing command ccache aarch64-linux-gcc ... -o
> arch/arm64/kernel/asm-offsets.s /src/arch/arm64/kernel/asm-offsets.c
> because no matching parser was found
> >   [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser.py",
> line 630, in log_error_or_warning
> >   Skipped parsing command ccache aarch64-linux-gcc ... -o
> kernel/bounds.s /src/kernel/bounds.c because no matching parser was found
> >   ... (Found 10435 more instances of this error)
> >
> > when testing the whole series without any modifications, am I doing
> > something wrong?
> 
> I was not aware of ccache. If you rebuild without using ccache the gcc
> commands should be parsed correctly.
> 
> The parser expects gcc commands to be of the form
> 	"^([^\s]+-)?(gcc|clang)\b"
> When using tools like ccache this breaks. I will update the parser to
> look for
> 	"^(ccache\s+)?([^\s]+-)?(gcc|clang)\b"
> instead.
> 
> Feedback like this is very helpful—thanks! Do you know of any other
> commonly used tools that modify build commands in a similar way and
> should be considered?

Ick, this might get messy as you can modify the compiler with the CC=
option to be anything.  There are other build tools out there that do
much the same as ccache does (which I should have caught this as I use
ccache on my build systems), like distcc and friends, so this might just
want to look at the result of "CC" instead?

thanks,

greg k-h

